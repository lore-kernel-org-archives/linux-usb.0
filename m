Return-Path: <SRS0=lM5t=SS=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4489EC10F13
	for <linux-usb@archiver.kernel.org>; Tue, 16 Apr 2019 19:10:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 220C620663
	for <linux-usb@archiver.kernel.org>; Tue, 16 Apr 2019 19:10:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728032AbfDPTK4 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 16 Apr 2019 15:10:56 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:43532 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727136AbfDPTK4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Apr 2019 15:10:56 -0400
Received: (qmail 10846 invoked by uid 2102); 16 Apr 2019 15:10:55 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 16 Apr 2019 15:10:55 -0400
Date:   Tue, 16 Apr 2019 15:10:55 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     syzbot <syzbot+7634edaea4d0b341c625@syzkaller.appspotmail.com>
cc:     andreyknvl@google.com, <linux-usb@vger.kernel.org>,
        <syzkaller-bugs@googlegroups.com>
Subject: Re: WARNING in usb_submit_urb (4)
In-Reply-To: <0000000000009b8b9c0586a9708b@google.com>
Message-ID: <Pine.LNX.4.44L0.1904161507470.1605-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190416191055.5tU8McBtytee9bOWCfEsF5R_RKFVZMwPnfk9Y8NLj9Q@z>

On Tue, 16 Apr 2019, syzbot wrote:

> Hello,
> 
> syzbot has tested the proposed patch but the reproducer still triggered  
> crash:
> WARNING in usb_submit_urb
> 
> hub 3-0:1.0: hub_activate type 4
> hub 3-0:1.0: Submitting status URB
> hub 3-0:1.0: Submitting status URB
> ------------[ cut here ]------------
> URB 00000000a8d7a6c6 submitted while active

The console output shows pretty clearly that there is a race.  But I 
can't quite see how it is caused.  Let's try a little bit more 
debugging.

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
@@ -1254,6 +1257,7 @@ static void hub_activate(struct usb_hub
  init3:
 	hub->quiescing = 0;
 
+	dev_info(hub->intfdev, "%p Submitting status URB\n", hub);
 	status = usb_submit_urb(hub->urb, GFP_NOIO);
 	if (status < 0)
 		dev_err(hub->intfdev, "activate --> %d\n", status);
@@ -1299,6 +1303,8 @@ static void hub_quiesce(struct usb_hub *
 	unsigned long flags;
 	int i;
 
+	dev_info(hub->intfdev, "%p %s type %d\n", hub, __func__, type);
+
 	/* hub_wq and related activity won't re-trigger */
 	spin_lock_irqsave(&hub->irq_urb_lock, flags);
 	hub->quiescing = 1;
@@ -3711,7 +3717,7 @@ static int hub_suspend(struct usb_interf
 		}
 	}
 
-	dev_dbg(&intf->dev, "%s\n", __func__);
+	dev_info(&intf->dev, "%p %s\n", hub, __func__);
 
 	/* stop hub_wq and related activity */
 	hub_quiesce(hub, HUB_SUSPEND);
@@ -3756,7 +3762,7 @@ static int hub_resume(struct usb_interfa
 {
 	struct usb_hub *hub = usb_get_intfdata(intf);
 
-	dev_dbg(&intf->dev, "%s\n", __func__);
+	dev_info(&intf->dev, "%p %s\n", hub, __func__);
 	hub_activate(hub, HUB_RESUME);
 
 	/*


