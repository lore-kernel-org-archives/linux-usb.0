Return-Path: <SRS0=lM5t=SS=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 857AAC10F13
	for <linux-usb@archiver.kernel.org>; Tue, 16 Apr 2019 20:57:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 58D5A20684
	for <linux-usb@archiver.kernel.org>; Tue, 16 Apr 2019 20:57:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728373AbfDPU5f (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 16 Apr 2019 16:57:35 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:43666 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726686AbfDPU5f (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Apr 2019 16:57:35 -0400
Received: (qmail 12226 invoked by uid 2102); 16 Apr 2019 16:57:34 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 16 Apr 2019 16:57:34 -0400
Date:   Tue, 16 Apr 2019 16:57:34 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     syzbot <syzbot+7634edaea4d0b341c625@syzkaller.appspotmail.com>
cc:     andreyknvl@google.com, <linux-usb@vger.kernel.org>,
        <syzkaller-bugs@googlegroups.com>
Subject: Re: WARNING in usb_submit_urb (4)
In-Reply-To: <0000000000003c2e000586aad69f@google.com>
Message-ID: <Pine.LNX.4.44L0.1904161614160.1605-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190416205734.eARxLSwoYXordh0MCgpNQ0G79Wa7eyNGlP8aAGGRStQ@z>

On Tue, 16 Apr 2019, syzbot wrote:

> Hello,
> 
> syzbot has tested the proposed patch but the reproducer still triggered  
> crash:
> WARNING in usb_submit_urb
> 
> hub 3-0:1.0: 0000000015733366 hub_activate type 4 discon 0
> hub 3-0:1.0: 0000000015733366 Submitting status URB
> hub 3-0:1.0: 0000000015733366 Submitting status URB
> ------------[ cut here ]------------
> URB 000000006ea6e83c submitted while active
> WARNING: CPU: 0 PID: 6476 at drivers/usb/core/urb.c:363  

Here's more of the context, showing the important part:

[  115.102684] hub 3-0:1.0: USB hub found
[  115.107011] hub 3-0:1.0: 8 ports detected

A new USB bus was registered and its root hub was probed.

[  115.114470] hub 3-0:1.0: 0000000015733366 hub_activate type 0 discon 0

Type 0 is HUB_INIT, the first stage of activating a new hub.  This
stage involves a long delay, so it calls
usb_autopm_get_interface_no_resume(), schedules a delayed work routine
to carry out the next stage, and returns.

[  115.180282] hub 3-0:1.0: 0000000015733366 hub_suspend
[  115.214681] hub 3-0:1.0: 0000000015733366 hub_quiesce type 2

Type 2 quiesce is HUB_SUSPEND.  Somehow the hub was autosuspended even 
though its runtime PM usage count was elevated!

[  115.231986] hub 3-0:1.0: 0000000015733366 hub_resume
[  115.241706] hub 3-0:1.0: 0000000015733366 hub_activate type 1 discon 0
[  115.249931] hub 3-0:1.0: 0000000015733366 hub_activate type 4 discon 0

Then the hub was resumed again.  Type 1 activation is HUB_INIT2, the 
second stage of the original hub activation.  Type 4 is HUB_RESUME.  
Evidently both types of activation are running concurrently.

[  115.276027] hub 3-0:1.0: 0000000015733366 Submitting status URB
[  115.288239] hub 3-0:1.0: 0000000015733366 Submitting status URB
[  115.295347] ------------[ cut here ]------------
[  115.300505] URB 000000006ea6e83c submitted while active

Both activation threads submit the same status URB, leading to the
error.

So the question is: Why was the hub suspended at a time when it should 
have remained active?  Let's see what the runtime PM values are when 
hub_suspend is called.

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
@@ -3711,7 +3717,11 @@ static int hub_suspend(struct usb_interf
 		}
 	}
 
-	dev_dbg(&intf->dev, "%s\n", __func__);
+	dev_info(&intf->dev, "%p %s disable %d usage %d status %d\n",
+			hub, __func__,
+			intf->dev.power.disable_depth,
+			atomic_read(&intf->dev.power.usage_count),
+			intf->dev.power.runtime_status);
 
 	/* stop hub_wq and related activity */
 	hub_quiesce(hub, HUB_SUSPEND);
@@ -3756,7 +3766,7 @@ static int hub_resume(struct usb_interfa
 {
 	struct usb_hub *hub = usb_get_intfdata(intf);
 
-	dev_dbg(&intf->dev, "%s\n", __func__);
+	dev_info(&intf->dev, "%p %s\n", hub, __func__);
 	hub_activate(hub, HUB_RESUME);
 
 	/*

