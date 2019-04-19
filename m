Return-Path: <SRS0=lmIm=SV=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20C49C282DA
	for <linux-usb@archiver.kernel.org>; Fri, 19 Apr 2019 18:19:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DB348222AD
	for <linux-usb@archiver.kernel.org>; Fri, 19 Apr 2019 18:19:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726901AbfDSSTU (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 19 Apr 2019 14:19:20 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:60876 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726754AbfDSSTU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 Apr 2019 14:19:20 -0400
Received: (qmail 6085 invoked by uid 2102); 19 Apr 2019 13:52:38 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 19 Apr 2019 13:52:38 -0400
Date:   Fri, 19 Apr 2019 13:52:38 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Greg KH <greg@kroah.com>
cc:     syzkaller-bugs@googlegroups.com,
        USB list <linux-usb@vger.kernel.org>
Subject: [PATCH] USB: core: Fix bug caused by duplicate interface PM usage
 counter
Message-ID: <Pine.LNX.4.44L0.1904191348580.1406-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190419175238.FlVriKDXRZ8Xnb2Dr6jY_uWIUjt2UjTBcxuRb9FOypw@z>

The syzkaller fuzzer reported a bug in the USB hub driver which turned
out to be caused by a negative runtime-PM usage counter.  This allowed
a hub to be runtime suspended at a time when the driver did not expect
it.  The symptom is a WARNING issued because the hub's status URB is
submitted while it is already active:

	URB 0000000031fb463e submitted while active
	WARNING: CPU: 0 PID: 2917 at drivers/usb/core/urb.c:363  

The negative runtime-PM usage count was caused by an unfortunate
design decision made when runtime PM was first implemented for USB.
At that time, USB class drivers were allowed to unbind from their
interfaces without balancing the usage counter (i.e., leaving it with
a positive count).  The core code would take care of setting the
counter back to 0 before allowing another driver to bind to the
interface.

Later on when runtime PM was implemented for the entire kernel, the
opposite decision was made: Drivers were required to balance their
runtime-PM get and put calls.  In order to maintain backward
compatibility, however, the USB subsystem adapted to the new
implementation by keeping an independent usage counter for each
interface and using it to automatically adjust the normal usage
counter back to 0 whenever a driver was unbound.

This approach involves duplicating information, but what is worse, it
doesn't work properly in cases where a USB class driver delays
decrementing the usage counter until after the driver's disconnect()
routine has returned and the counter has been adjusted back to 0.
Doing so would cause the usage counter to become negative.  There's
even a warning about this in the USB power management documentation!

As it happens, this is exactly what the hub driver does.  The
kick_hub_wq() routine increments the runtime-PM usage counter, and the
corresponding decrement is carried out by hub_event() in the context
of the hub_wq work-queue thread.  This work routine may sometimes run
after the driver has been unbound from its interface, and when it does
it causes the usage counter to go negative.

It is not possible for hub_disconnect() to wait for a pending
hub_event() call to finish, because hub_disconnect() is called with
the device lock held and hub_event() acquires that lock.  The only
feasible fix is to reverse the original design decision: remove the
duplicate interface-specific usage counter and require USB drivers to
balance their runtime PM gets and puts.  As far as I know, all
existing drivers currently do this.

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Reported-and-tested-by: syzbot+7634edaea4d0b341c625@syzkaller.appspotmail.com
CC: <stable@vger.kernel.org>

---

Yes, the stuff in realtek_cr.c is weird.  I don't know why it was done 
this way, and probably nobody cares enough about it to fix it up.  I 
just did the minimal change to make it work.

Alan Stern


[as1890]


 Documentation/driver-api/usb/power-management.rst |   14 +++++++++-----
 drivers/usb/core/driver.c                         |   13 -------------
 drivers/usb/storage/realtek_cr.c                  |   13 +++++--------
 include/linux/usb.h                               |    2 --
 4 files changed, 14 insertions(+), 28 deletions(-)

Index: usb-devel/include/linux/usb.h
===================================================================
--- usb-devel.orig/include/linux/usb.h
+++ usb-devel/include/linux/usb.h
@@ -200,7 +200,6 @@ usb_find_last_int_out_endpoint(struct us
  * @dev: driver model's view of this device
  * @usb_dev: if an interface is bound to the USB major, this will point
  *	to the sysfs representation for that device.
- * @pm_usage_cnt: PM usage counter for this interface
  * @reset_ws: Used for scheduling resets from atomic context.
  * @resetting_device: USB core reset the device, so use alt setting 0 as
  *	current; needs bandwidth alloc after reset.
@@ -257,7 +256,6 @@ struct usb_interface {
 
 	struct device dev;		/* interface specific device info */
 	struct device *usb_dev;
-	atomic_t pm_usage_cnt;		/* usage counter for autosuspend */
 	struct work_struct reset_ws;	/* for resets in atomic context */
 };
 #define	to_usb_interface(d) container_of(d, struct usb_interface, dev)
Index: usb-devel/drivers/usb/core/driver.c
===================================================================
--- usb-devel.orig/drivers/usb/core/driver.c
+++ usb-devel/drivers/usb/core/driver.c
@@ -473,11 +473,6 @@ static int usb_unbind_interface(struct d
 		pm_runtime_disable(dev);
 	pm_runtime_set_suspended(dev);
 
-	/* Undo any residual pm_autopm_get_interface_* calls */
-	for (r = atomic_read(&intf->pm_usage_cnt); r > 0; --r)
-		usb_autopm_put_interface_no_suspend(intf);
-	atomic_set(&intf->pm_usage_cnt, 0);
-
 	if (!error)
 		usb_autosuspend_device(udev);
 
@@ -1633,7 +1628,6 @@ void usb_autopm_put_interface(struct usb
 	int			status;
 
 	usb_mark_last_busy(udev);
-	atomic_dec(&intf->pm_usage_cnt);
 	status = pm_runtime_put_sync(&intf->dev);
 	dev_vdbg(&intf->dev, "%s: cnt %d -> %d\n",
 			__func__, atomic_read(&intf->dev.power.usage_count),
@@ -1662,7 +1656,6 @@ void usb_autopm_put_interface_async(stru
 	int			status;
 
 	usb_mark_last_busy(udev);
-	atomic_dec(&intf->pm_usage_cnt);
 	status = pm_runtime_put(&intf->dev);
 	dev_vdbg(&intf->dev, "%s: cnt %d -> %d\n",
 			__func__, atomic_read(&intf->dev.power.usage_count),
@@ -1684,7 +1677,6 @@ void usb_autopm_put_interface_no_suspend
 	struct usb_device	*udev = interface_to_usbdev(intf);
 
 	usb_mark_last_busy(udev);
-	atomic_dec(&intf->pm_usage_cnt);
 	pm_runtime_put_noidle(&intf->dev);
 }
 EXPORT_SYMBOL_GPL(usb_autopm_put_interface_no_suspend);
@@ -1715,8 +1707,6 @@ int usb_autopm_get_interface(struct usb_
 	status = pm_runtime_get_sync(&intf->dev);
 	if (status < 0)
 		pm_runtime_put_sync(&intf->dev);
-	else
-		atomic_inc(&intf->pm_usage_cnt);
 	dev_vdbg(&intf->dev, "%s: cnt %d -> %d\n",
 			__func__, atomic_read(&intf->dev.power.usage_count),
 			status);
@@ -1750,8 +1740,6 @@ int usb_autopm_get_interface_async(struc
 	status = pm_runtime_get(&intf->dev);
 	if (status < 0 && status != -EINPROGRESS)
 		pm_runtime_put_noidle(&intf->dev);
-	else
-		atomic_inc(&intf->pm_usage_cnt);
 	dev_vdbg(&intf->dev, "%s: cnt %d -> %d\n",
 			__func__, atomic_read(&intf->dev.power.usage_count),
 			status);
@@ -1775,7 +1763,6 @@ void usb_autopm_get_interface_no_resume(
 	struct usb_device	*udev = interface_to_usbdev(intf);
 
 	usb_mark_last_busy(udev);
-	atomic_inc(&intf->pm_usage_cnt);
 	pm_runtime_get_noresume(&intf->dev);
 }
 EXPORT_SYMBOL_GPL(usb_autopm_get_interface_no_resume);
Index: usb-devel/Documentation/driver-api/usb/power-management.rst
===================================================================
--- usb-devel.orig/Documentation/driver-api/usb/power-management.rst
+++ usb-devel/Documentation/driver-api/usb/power-management.rst
@@ -370,11 +370,15 @@ autosuspend the interface's device.  Whe
 then the interface is considered to be idle, and the kernel may
 autosuspend the device.
 
-Drivers need not be concerned about balancing changes to the usage
-counter; the USB core will undo any remaining "get"s when a driver
-is unbound from its interface.  As a corollary, drivers must not call
-any of the ``usb_autopm_*`` functions after their ``disconnect``
-routine has returned.
+Drivers must be careful to balance their overall changes to the usage
+counter.  Unbalanced "get"s will remain in effect when a driver is
+unbound from its interface, preventing the device from going into
+runtime suspend should the interface be bound to a driver again.  On
+the other hand, drivers are allowed to achieve this balance by calling
+the ``usb_autopm_*`` functions even after their ``disconnect`` routine
+has returned -- say from within a work-queue routine -- provided they
+retain an active reference to the interface (via ``usb_get_intf`` and
+``usb_put_intf``).
 
 Drivers using the async routines are responsible for their own
 synchronization and mutual exclusion.
Index: usb-devel/drivers/usb/storage/realtek_cr.c
===================================================================
--- usb-devel.orig/drivers/usb/storage/realtek_cr.c
+++ usb-devel/drivers/usb/storage/realtek_cr.c
@@ -763,18 +763,16 @@ static void rts51x_suspend_timer_fn(stru
 		break;
 	case RTS51X_STAT_IDLE:
 	case RTS51X_STAT_SS:
-		usb_stor_dbg(us, "RTS51X_STAT_SS, intf->pm_usage_cnt:%d, power.usage:%d\n",
-			     atomic_read(&us->pusb_intf->pm_usage_cnt),
+		usb_stor_dbg(us, "RTS51X_STAT_SS, power.usage:%d\n",
 			     atomic_read(&us->pusb_intf->dev.power.usage_count));
 
-		if (atomic_read(&us->pusb_intf->pm_usage_cnt) > 0) {
+		if (atomic_read(&us->pusb_intf->dev.power.usage_count) > 0) {
 			usb_stor_dbg(us, "Ready to enter SS state\n");
 			rts51x_set_stat(chip, RTS51X_STAT_SS);
 			/* ignore mass storage interface's children */
 			pm_suspend_ignore_children(&us->pusb_intf->dev, true);
 			usb_autopm_put_interface_async(us->pusb_intf);
-			usb_stor_dbg(us, "RTS51X_STAT_SS 01, intf->pm_usage_cnt:%d, power.usage:%d\n",
-				     atomic_read(&us->pusb_intf->pm_usage_cnt),
+			usb_stor_dbg(us, "RTS51X_STAT_SS 01, power.usage:%d\n",
 				     atomic_read(&us->pusb_intf->dev.power.usage_count));
 		}
 		break;
@@ -807,11 +805,10 @@ static void rts51x_invoke_transport(stru
 	int ret;
 
 	if (working_scsi(srb)) {
-		usb_stor_dbg(us, "working scsi, intf->pm_usage_cnt:%d, power.usage:%d\n",
-			     atomic_read(&us->pusb_intf->pm_usage_cnt),
+		usb_stor_dbg(us, "working scsi, power.usage:%d\n",
 			     atomic_read(&us->pusb_intf->dev.power.usage_count));
 
-		if (atomic_read(&us->pusb_intf->pm_usage_cnt) <= 0) {
+		if (atomic_read(&us->pusb_intf->dev.power.usage_count) <= 0) {
 			ret = usb_autopm_get_interface(us->pusb_intf);
 			usb_stor_dbg(us, "working scsi, ret=%d\n", ret);
 		}

