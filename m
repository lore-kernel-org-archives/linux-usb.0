Return-Path: <SRS0=lM5t=SS=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B6D9C10F14
	for <linux-usb@archiver.kernel.org>; Tue, 16 Apr 2019 17:39:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 46A8F2073F
	for <linux-usb@archiver.kernel.org>; Tue, 16 Apr 2019 17:39:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730200AbfDPRjg (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 16 Apr 2019 13:39:36 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:43380 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1730180AbfDPRjf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Apr 2019 13:39:35 -0400
Received: (qmail 9004 invoked by uid 2102); 16 Apr 2019 13:39:33 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 16 Apr 2019 13:39:33 -0400
Date:   Tue, 16 Apr 2019 13:39:33 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Andrey Konovalov <andreyknvl@google.com>
cc:     syzbot <syzbot+7634edaea4d0b341c625@syzkaller.appspotmail.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        USB list <linux-usb@vger.kernel.org>
Subject: Re: WARNING in usb_submit_urb (4)
In-Reply-To: <CAAeHK+y0D9YJB5=N6ET-ECsLejnzBNUZOeQuOv+p7aRGiMEGTA@mail.gmail.com>
Message-ID: <Pine.LNX.4.44L0.1904161337540.1605-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190416173933.nCwptaerMtg0zawl4OKz0JVcoeOny12raLmTxDrAOKs@z>

On Mon, 15 Apr 2019, Andrey Konovalov wrote:

> On Mon, Apr 15, 2019 at 5:16 PM Andrey Konovalov <andreyknvl@google.com> wrote:
> >
> > On Mon, Apr 15, 2019 at 2:34 PM syzbot
> > <syzbot+7634edaea4d0b341c625@syzkaller.appspotmail.com> wrote:
> > >
> > > Hello,
> > >
> > > syzbot has tested the proposed patch and the reproducer did not trigger
> > > crash:
> > >
> > > Reported-and-tested-by:
> > > syzbot+7634edaea4d0b341c625@syzkaller.appspotmail.com
> >
> > Hm, I think this is some kind of race and the patch affects the
> > timings, so this can't be reproduced that easily. I'll try to do it
> > manually.
> 
> Hm, now I'm having troubles to reproduce it manually. Let's try your
> debug patch once more on the exact commit this was reported. If it
> doesn't trigger, I think the best thing would be to close this report
> as invalid, and wait for syzbot to (hopefully) generate a fresh
> reproducer.
> 
> #syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> e12e00e388de

Okay, let's try a simpler and less intrusive debugging patch.

Alan Stern


#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git e12e00e388de

--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -1016,6 +1016,8 @@ static void hub_activate(struct usb_hub
 	bool need_debounce_delay = false;
 	unsigned delay;
 
+	dev_info(hub->intfdev, "%s type %d\n", __func__, type);
+
 	/* Continue a partial initialization */
 	if (type == HUB_INIT2 || type == HUB_INIT3) {
 		device_lock(&hdev->dev);
@@ -1254,6 +1256,7 @@ static void hub_activate(struct usb_hub
  init3:
 	hub->quiescing = 0;
 
+	dev_info(hub->intfdev, "Submitting status URB\n");
 	status = usb_submit_urb(hub->urb, GFP_NOIO);
 	if (status < 0)
 		dev_err(hub->intfdev, "activate --> %d\n", status);
@@ -3711,7 +3714,7 @@ static int hub_suspend(struct usb_interf
 		}
 	}
 
-	dev_dbg(&intf->dev, "%s\n", __func__);
+	dev_info(&intf->dev, "%s\n", __func__);
 
 	/* stop hub_wq and related activity */
 	hub_quiesce(hub, HUB_SUSPEND);
@@ -3756,7 +3759,7 @@ static int hub_resume(struct usb_interfa
 {
 	struct usb_hub *hub = usb_get_intfdata(intf);
 
-	dev_dbg(&intf->dev, "%s\n", __func__);
+	dev_info(&intf->dev, "%s\n", __func__);
 	hub_activate(hub, HUB_RESUME);
 
 	/*

