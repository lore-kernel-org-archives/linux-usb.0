Return-Path: <SRS0=JW0E=SU=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04EABC10F0E
	for <linux-usb@archiver.kernel.org>; Thu, 18 Apr 2019 16:53:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CA855217FA
	for <linux-usb@archiver.kernel.org>; Thu, 18 Apr 2019 16:53:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388450AbfDRQxF (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 18 Apr 2019 12:53:05 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:48532 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1733067AbfDRQxF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 Apr 2019 12:53:05 -0400
Received: (qmail 1954 invoked by uid 2102); 18 Apr 2019 12:53:04 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 18 Apr 2019 12:53:04 -0400
Date:   Thu, 18 Apr 2019 12:53:04 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     syzbot <syzbot+7634edaea4d0b341c625@syzkaller.appspotmail.com>
cc:     andreyknvl@google.com, <linux-usb@vger.kernel.org>,
        <syzkaller-bugs@googlegroups.com>
Subject: Re: WARNING in usb_submit_urb (4)
In-Reply-To: <Pine.LNX.4.44L0.1904181159410.1513-100000@iolanthe.rowland.org>
Message-ID: <Pine.LNX.4.44L0.1904181247380.1303-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190418165304.h2pWaaYUKcCkK77Se-ivUr5rByzlViWCsPMm33kzPXU@z>

On Thu, 18 Apr 2019, Alan Stern wrote:

> On Wed, 17 Apr 2019, Alan Stern wrote:
> 
> > I'm still having trouble understanding this.  Here's some more 
> > debugging.
> 
> Let's try this again.  The patch format was wrong.

One more try, this time with the syz command line.

Incidentally, the console log from the last test had a very troubling
entry showing the runtime PM usage counter for the hub interface was
set to -4!  Whatever caused the counter to go negative is probably also
the reason for this bug.

Alan Stern


#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git e12e00e388de

--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -1016,6 +1016,9 @@ static void hub_activate(struct usb_hub
 	bool need_debounce_delay = false;
 	unsigned delay;
 
+	dev_info(hub->intfdev, "%p %s type %d discon %d\n",
+			hub, __func__, type, hub->disconnected);
+
 	/* Continue a partial initialization */
 	if (type == HUB_INIT2 || type == HUB_INIT3) {
 		device_lock(&hdev->dev);
@@ -1299,6 +1302,8 @@ static void hub_quiesce(struct usb_hub *
 	unsigned long flags;
 	int i;
 
+	dev_info(hub->intfdev, "%p %s type %d\n", hub, __func__, type);
+
 	/* hub_wq and related activity won't re-trigger */
 	spin_lock_irqsave(&hub->irq_urb_lock, flags);
 	hub->quiescing = 1;
@@ -3711,7 +3716,9 @@ static int hub_suspend(struct usb_interf
 		}
 	}
 
-	dev_dbg(&intf->dev, "%s\n", __func__);
+	dev_info(&intf->dev, "%p %s usage %d\n",
+			hub, __func__,
+			atomic_read(&intf->dev.power.usage_count));
 
 	/* stop hub_wq and related activity */
 	hub_quiesce(hub, HUB_SUSPEND);
@@ -3756,7 +3763,7 @@ static int hub_resume(struct usb_interfa
 {
 	struct usb_hub *hub = usb_get_intfdata(intf);
 
-	dev_dbg(&intf->dev, "%s\n", __func__);
+	dev_info(&intf->dev, "%p %s\n", hub, __func__);
 	hub_activate(hub, HUB_RESUME);
 
 	/*
--- a/drivers/usb/core/driver.c
+++ b/drivers/usb/core/driver.c
@@ -358,7 +358,11 @@ static int usb_probe_interface(struct de
 		intf->needs_altsetting0 = 0;
 	}
 
+	dev_info(dev, "pre-probe usage %d\n",
+			atomic_read(&intf->dev.power.usage_count));
 	error = driver->probe(intf, id);
+	dev_info(dev, "post-probe usage %d\n",
+			atomic_read(&intf->dev.power.usage_count));
 	if (error)
 		goto err;
 
@@ -420,7 +424,11 @@ static int usb_unbind_interface(struct d
 	if (!driver->soft_unbind || udev->state == USB_STATE_NOTATTACHED)
 		usb_disable_interface(udev, intf, false);
 
+	dev_info(dev, "pre-discon usage %d\n",
+			atomic_read(&intf->dev.power.usage_count));
 	driver->disconnect(intf);
+	dev_info(dev, "post-discon usage %d\n",
+			atomic_read(&intf->dev.power.usage_count));
 
 	/* Free streams */
 	for (i = 0, j = 0; i < intf->cur_altsetting->desc.bNumEndpoints; i++) {





