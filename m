Return-Path: <SRS0=nhXQ=S5=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,T_DKIMWL_WL_HIGH,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7874FC43218
	for <linux-usb@archiver.kernel.org>; Sat, 27 Apr 2019 18:07:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4242A206BF
	for <linux-usb@archiver.kernel.org>; Sat, 27 Apr 2019 18:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556388453;
	bh=wClMBZ3YcjMa7u5TTZCzmTCkx8cl63LWF/q0oiGWg3Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=13IDb7ROgdWLu+Sj56KwkYQge3r+aT99QX6ivhP9T9Jy3vD0XtURda+8I3J5wou/s
	 t990r7/ULb5KLEyj54iq2UDOrdVBA2+dojv47AndmyrAuK9mWqlbmeRgW82uh/FP00
	 waWdVf0kdHoQ6DI6oM3cZPC7ra0D99w4eJnUh8XE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726005AbfD0SHc (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 27 Apr 2019 14:07:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:42818 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725942AbfD0SHc (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 27 Apr 2019 14:07:32 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E7F79206BF;
        Sat, 27 Apr 2019 18:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556388451;
        bh=wClMBZ3YcjMa7u5TTZCzmTCkx8cl63LWF/q0oiGWg3Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=17OCUoiuQCgKQNeL6e7cOeCZNW53K2zrNZ5niv+3PrZEoWS5AoKvtymbp+Yt3Gomf
         +DnhHbHWVVz45SWfEcQvHPvFHjG627780nynMN/Y3LV7K+lMV8pF8rBHzP6CJ+5llF
         cs4Se1iKcW4Pa0jdq+OTGhP3hWGCxCqJM4p8rbl0=
Date:   Sat, 27 Apr 2019 20:07:28 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Christo Gouws <gouws.christo@gmail.com>, linux-usb@vger.kernel.org
Subject: Re: Line6 podstudio UX1 - driver crash on usb_hcd_map_urb_for_dma
Message-ID: <20190427180728.GA3200@kroah.com>
References: <20190427070136.GE28250@kroah.com>
 <Pine.LNX.4.44L0.1904271124490.17640-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.1904271124490.17640-100000@netrider.rowland.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190427180728.VPyWmSZmHLGScpVlr97lSk-trwGUVxGQrUIXcD-kpDY@z>

On Sat, Apr 27, 2019 at 11:34:03AM -0400, Alan Stern wrote:
> On Sat, 27 Apr 2019, Greg KH wrote:
> 
> > On Fri, Apr 26, 2019 at 11:50:14AM +0200, Christo Gouws wrote:
> > > Hi,
> > > 
> > > I have a Line6 Pod Studio UX1 card, but each time I plug it in, I get
> > > the following crash in dmesg on Ubuntu 18.04
> > > Linux my-pc 4.20.8-042008-generic #201902121544 SMP Tue Feb 12
> > > 20:46:50 UTC 2019 x86_64 x86_64 x86_64 GNU/Linux
> > > 
> > > I've also tested this with a Fedora 30 v5.0.6-300 kernel, but still
> > > seems to happen (using liveCD).
> > > 
> > > 
> > > The output on the card seems to work, but none of the inputs work.
> > > 
> > > I've also now tested with latest kernel available on Arch Linux
> > > Linux my-pc 5.0.9-arch1-1-ARCH #1 SMP PREEMPT Sat Apr 20 15:00:46 UTC
> > > 2019 x86_64 GNU/Linux
> > > 
> > > After some further testing, I found that this issue cropped in beween
> > > v4.8.17 and v4.9-rc1.
> > > 
> > > v4.8.17   - Works fine.
> > > v4.9-rc1+  - Produces crash
> > 
> > Any chance you can use 'git bisect' to find the exact commit that caused
> > the failure?
> 
> No need.  The bug is in line6_read_data() in sound/usb/line6/driver.c.  
> That routine passes an invalid buffer to usb_control_message().  
> Instead it should allocate its own buffer for the USB transfer and then
> copy the value to the caller's buffer.
> 
> There is a similar problem in line6_write_data().  Furthermore, both
> routines do DMA to/from a buffer on the stack.

I have an old patch in my local tree for the dma buffer on the stack
issue, it's below.  I should clean it up and send it correctly one of
these days :)

From e2c743d1f900135c3e560cd9ea1647e4a1ebce7a Mon Sep 17 00:00:00 2001
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Wed, 23 Jan 2019 11:01:46 +0100
Subject: [PATCH 3/3] toneport fixes

---
 sound/usb/line6/toneport.c |   23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

--- a/sound/usb/line6/toneport.c
+++ b/sound/usb/line6/toneport.c
@@ -365,16 +365,21 @@ static bool toneport_has_source_select(s
 /*
 	Setup Toneport device.
 */
-static void toneport_setup(struct usb_line6_toneport *toneport)
+static int toneport_setup(struct usb_line6_toneport *toneport)
 {
-	u32 ticks;
+	u32 *ticks;
 	struct usb_line6 *line6 = &toneport->line6;
 	struct usb_device *usbdev = line6->usbdev;
 
+	ticks = kmalloc(sizeof(*ticks), GFP_KERNEL);
+	if (!ticks)
+		return -ENOMEM;
+
 	/* sync time on device with host: */
 	/* note: 32-bit timestamps overflow in year 2106 */
-	ticks = (u32)ktime_get_real_seconds();
-	line6_write_data(line6, 0x80c6, &ticks, 4);
+	*ticks = (u32)ktime_get_real_seconds();
+	line6_write_data(line6, 0x80c6, ticks, 4);
+	kfree(ticks);
 
 	/* enable device: */
 	toneport_send_cmd(usbdev, 0x0301, 0x0000);
@@ -451,7 +456,9 @@ static int toneport_init(struct usb_line
 			return err;
 	}
 
-	toneport_setup(toneport);
+	err = toneport_setup(toneport);
+	if (err)
+		return err;
 
 	/* register audio system: */
 	return snd_card_register(line6->card);
@@ -463,7 +470,11 @@ static int toneport_init(struct usb_line
 */
 static int toneport_reset_resume(struct usb_interface *interface)
 {
-	toneport_setup(usb_get_intfdata(interface));
+	int err;
+
+	err = toneport_setup(usb_get_intfdata(interface));
+	if (err)
+		return err;
 	return line6_resume(interface);
 }
 #endif
