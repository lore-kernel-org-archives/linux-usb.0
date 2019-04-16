Return-Path: <SRS0=lM5t=SS=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0C4EC10F13
	for <linux-usb@archiver.kernel.org>; Tue, 16 Apr 2019 14:50:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C30862077C
	for <linux-usb@archiver.kernel.org>; Tue, 16 Apr 2019 14:50:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729048AbfDPOuC (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 16 Apr 2019 10:50:02 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:42672 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728759AbfDPOuC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Apr 2019 10:50:02 -0400
Received: (qmail 4996 invoked by uid 2102); 16 Apr 2019 10:50:01 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 16 Apr 2019 10:50:01 -0400
Date:   Tue, 16 Apr 2019 10:50:01 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Greg KH <greg@kroah.com>
cc:     Kento Kobayashi <Kento.A.Kobayashi@sony.com>,
        Bart Van Assche <bvanassche@acm.org>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Jacky Cao <Jacky.Cao@sony.com>,
        USB list <linux-usb@vger.kernel.org>
Subject: [PATCH] USB: core: Don't unbind interfaces following device reset
 failure
Message-ID: <Pine.LNX.4.44L0.1904151313300.1575-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190416145001.ZgRkzGWhYquzMnpN-lniPDONj_wXr2rLwExiXUHTpzk@z>

The SCSI core does not like to have devices or hosts unregistered
while error recovery is in progress.  Trying to do so can lead to
self-deadlock: Part of the removal code tries to obtain a lock already
held by the error handler.

This can cause problems for the usb-storage and uas drivers, because
their error handler routines perform a USB reset, and if the reset
fails then the USB core automatically goes on to unbind all drivers
from the device's interfaces -- all while still in the context of the
SCSI error handler.

As it turns out, practically all the scenarios leading to a USB reset
failure end up causing a device disconnect (the main error pathway in
usb_reset_and_verify_device(), at the end of the routine, calls
hub_port_logical_disconnect() before returning).  As a result, the
hub_wq thread will soon become aware of the problem and will unbind
all the device's drivers in its own context, not in the
error-handler's context.

This means that usb_reset_device() does not need to call
usb_unbind_and_rebind_marked_interfaces() in cases where
usb_reset_and_verify_device() has returned an error, because hub_wq
will take care of everything anyway.

This particular problem was observed in somewhat artificial
circumstances, by using usbfs to tell a hub to power-down a port
connected to a USB-3 mass storage device using the UAS protocol.  With
the port turned off, the currently executing command timed out and the
error handler started running.  The USB reset naturally failed,
because the hub port was off, and the error handler deadlocked as
described above.  Not carrying out the call to
usb_unbind_and_rebind_marked_interfaces() fixes this issue.

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Reported-by: Kento Kobayashi <Kento.A.Kobayashi@sony.com>
Tested-by: Kento Kobayashi <Kento.A.Kobayashi@sony.com>
CC: Bart Van Assche <bvanassche@acm.org>
CC: Martin K. Petersen <martin.petersen@oracle.com>
CC: Jacky Cao <Jacky.Cao@sony.com>

---


[as1885]


 drivers/usb/core/hub.c |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

Index: usb-4.x/drivers/usb/core/hub.c
===================================================================
--- usb-4.x.orig/drivers/usb/core/hub.c
+++ usb-4.x/drivers/usb/core/hub.c
@@ -5902,7 +5902,10 @@ int usb_reset_device(struct usb_device *
 					cintf->needs_binding = 1;
 			}
 		}
-		usb_unbind_and_rebind_marked_interfaces(udev);
+
+		/* If the reset failed, hub_wq will unbind drivers later */
+		if (ret == 0)
+			usb_unbind_and_rebind_marked_interfaces(udev);
 	}
 
 	usb_autosuspend_device(udev);

