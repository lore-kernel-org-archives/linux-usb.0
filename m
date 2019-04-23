Return-Path: <SRS0=tIEv=SZ=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC8A9C10F03
	for <linux-usb@archiver.kernel.org>; Tue, 23 Apr 2019 18:48:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B6A4221738
	for <linux-usb@archiver.kernel.org>; Tue, 23 Apr 2019 18:48:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726029AbfDWSsa (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 23 Apr 2019 14:48:30 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:58640 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1725945AbfDWSsa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 Apr 2019 14:48:30 -0400
Received: (qmail 7150 invoked by uid 2102); 23 Apr 2019 14:48:29 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 23 Apr 2019 14:48:29 -0400
Date:   Tue, 23 Apr 2019 14:48:29 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Greg KH <greg@kroah.com>
cc:     andreyknvl@google.com, <dvyukov@google.com>,
        USB list <linux-usb@vger.kernel.org>, <rafael@kernel.org>,
        <syzkaller-bugs@googlegroups.com>
Subject: [PATCH] USB: yurex: Fix protection fault after device removal
In-Reply-To: <000000000000cc2582058735d960@google.com>
Message-ID: <Pine.LNX.4.44L0.1904231446530.1461-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190423184829.t2yeounrvLd8LSCAmt3yMDsAG_BloObGfSRXzqrCWIc@z>

The syzkaller USB fuzzer found a general-protection-fault bug in the
yurex driver.  The fault occurs when a device has been unplugged; the
driver's interrupt-URB handler logs an error message referring to the
device by name, after the device has been unregistered and its name
deallocated.

This problem is caused by the fact that the interrupt URB isn't
cancelled until the driver's private data structure is released, which
can happen long after the device is gone.  The cure is to make sure
that the interrupt URB is killed before yurex_disconnect() returns;
this is exactly the sort of thing that usb_poison_urb() was meant for.

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Reported-and-tested-by: syzbot+2eb9121678bdb36e6d57@syzkaller.appspotmail.com
CC: <stable@vger.kernel.org>

---


[as1896]


 drivers/usb/misc/yurex.c |    1 +
 1 file changed, 1 insertion(+)

Index: usb-devel/drivers/usb/misc/yurex.c
===================================================================
--- usb-devel.orig/drivers/usb/misc/yurex.c
+++ usb-devel/drivers/usb/misc/yurex.c
@@ -314,6 +314,7 @@ static void yurex_disconnect(struct usb_
 	usb_deregister_dev(interface, &yurex_class);
 
 	/* prevent more I/O from starting */
+	usb_poison_urb(dev->urb);
 	mutex_lock(&dev->io_mutex);
 	dev->interface = NULL;
 	mutex_unlock(&dev->io_mutex);

