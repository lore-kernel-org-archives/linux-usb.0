Return-Path: <SRS0=lmIm=SV=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6344C282DA
	for <linux-usb@archiver.kernel.org>; Fri, 19 Apr 2019 19:39:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7713D2171F
	for <linux-usb@archiver.kernel.org>; Fri, 19 Apr 2019 19:39:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727397AbfDSTjC (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 19 Apr 2019 15:39:02 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:32856 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727041AbfDSTjC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 Apr 2019 15:39:02 -0400
Received: (qmail 8425 invoked by uid 2102); 19 Apr 2019 15:39:01 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 19 Apr 2019 15:39:01 -0400
Date:   Fri, 19 Apr 2019 15:39:01 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     syzbot <syzbot+d65f673b847a1a96cdba@syzkaller.appspotmail.com>
cc:     andreyknvl@google.com, <florian.harbecke@fau.de>,
        <gregkh@linuxfoundation.org>, <linux-kernel@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <passt@h-hofmeier.de>,
        <syzkaller-bugs@googlegroups.com>, <zbr@ioremap.net>
Subject: Re: KASAN: slab-out-of-bounds Read in ds_probe
In-Reply-To: <000000000000ba57420586b82623@google.com>
Message-ID: <Pine.LNX.4.44L0.1904191536310.1406-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190419193901.XfC9Us_ntllQfjNSz0s3xUO64Vc9-Z9w5yVN87a4ZZA@z>

On Wed, 17 Apr 2019, syzbot wrote:

> Hello,
> 
> syzbot found the following crash on:
> 
> HEAD commit:    9a33b369 usb-fuzzer: main usb gadget fuzzer driver
> git tree:       https://github.com/google/kasan/tree/usb-fuzzer
> console output: https://syzkaller.appspot.com/x/log.txt?x=13eb726b200000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=23e37f59d94ddd15
> dashboard link: https://syzkaller.appspot.com/bug?extid=d65f673b847a1a96cdba
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1340b55b200000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12e436f3200000
> 
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+d65f673b847a1a96cdba@syzkaller.appspotmail.com
> 
> usb 1-1: config 0 has no interface number 0
> usb 1-1: New USB device found, idVendor=04fa, idProduct=2490,  
> bcdDevice=74.f9
> usb 1-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
> usb 1-1: config 0 descriptor??
> ==================================================================
> BUG: KASAN: slab-out-of-bounds in ds_probe+0x604/0x760  
> drivers/w1/masters/ds2490.c:1019
> Read of size 1 at addr ffff8880a7c45fe2 by task kworker/0:1/12
> 
> CPU: 0 PID: 12 Comm: kworker/0:1 Not tainted 5.1.0-rc4-319354-g9a33b36 #3
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
> Google 01/01/2011
> Workqueue: usb_hub_wq hub_event

Looks like a typical misunderstanding of how the interface altsettings 
array works.

Alan Stern


#syz test: https://github.com/google/kasan.git usb-fuzzer

--- a/drivers/w1/masters/ds2490.c
+++ b/drivers/w1/masters/ds2490.c
@@ -1016,15 +1016,15 @@ static int ds_probe(struct usb_interface
 	/* alternative 3, 1ms interrupt (greatly speeds search), 64 byte bulk */
 	alt = 3;
 	err = usb_set_interface(dev->udev,
-		intf->altsetting[alt].desc.bInterfaceNumber, alt);
+		intf->cur_altsetting->desc.bInterfaceNumber, alt);
 	if (err) {
 		dev_err(&dev->udev->dev, "Failed to set alternative setting %d "
 			"for %d interface: err=%d.\n", alt,
-			intf->altsetting[alt].desc.bInterfaceNumber, err);
+			intf->cur_altsetting->desc.bInterfaceNumber, err);
 		goto err_out_clear;
 	}
 
-	iface_desc = &intf->altsetting[alt];
+	iface_desc = intf->cur_altsetting;
 	if (iface_desc->desc.bNumEndpoints != NUM_EP-1) {
 		pr_info("Num endpoints=%d. It is not DS9490R.\n",
 			iface_desc->desc.bNumEndpoints);

