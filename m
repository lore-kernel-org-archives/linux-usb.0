Return-Path: <SRS0=nhXQ=S5=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC190C43219
	for <linux-usb@archiver.kernel.org>; Sat, 27 Apr 2019 18:42:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 76C0B2077B
	for <linux-usb@archiver.kernel.org>; Sat, 27 Apr 2019 18:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556390569;
	bh=7NMLdWoxtqzcp0l7l4+pUVrqawmbID1jO3l4m0VehDY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Hwv+lbsmsokhzRXLnMjWX0B427AIPrasPtzI9tv/iimrV1TSF2uY1RHY94i10/8fN
	 Bh3fopHmVrwYw6W2MjNUf8sn3yICQ61UWaopdBSPK9iLIcEWrfMOoJS5PzNwHGh+rn
	 qah4n18EpIYvmWhRhA3kebLnqGgmx03BS18gel7g=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726374AbfD0Sms (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 27 Apr 2019 14:42:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:49582 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725942AbfD0Sms (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 27 Apr 2019 14:42:48 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BBE252077B;
        Sat, 27 Apr 2019 18:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556390567;
        bh=7NMLdWoxtqzcp0l7l4+pUVrqawmbID1jO3l4m0VehDY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=0kyEzuTZH763NNi85kGRLH/8X3103Eoyvc89OjOrGzjDnXP4cwv7VYdF3ftagbCSJ
         vUbEFyfZ5ixEzHG149j9RsKEFFwQmhCKITMw8SPKu+gm/DbsgvwQjLgP4R5/6ca9wZ
         9xkiQzz+0AlOQkXxeGnnlhy33b6Kl3jeUOg5Rjhc=
Date:   Sat, 27 Apr 2019 20:42:45 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Christo Gouws <gouws.christo@gmail.com>, linux-usb@vger.kernel.org
Subject: Re: Line6 podstudio UX1 - driver crash on usb_hcd_map_urb_for_dma
Message-ID: <20190427184244.GB5213@kroah.com>
References: <20190427070136.GE28250@kroah.com>
 <Pine.LNX.4.44L0.1904271124490.17640-100000@netrider.rowland.org>
 <20190427180728.GA3200@kroah.com>
 <20190427182432.GA5213@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <20190427182432.GA5213@kroah.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190427184245.b5pPRoPuiGqqjKh4zYvU_XaJsQV5MQT5DsiTIaoIgx0@z>

On Sat, Apr 27, 2019 at 08:24:32PM +0200, Greg KH wrote:
> On Sat, Apr 27, 2019 at 08:07:28PM +0200, Greg KH wrote:
> > On Sat, Apr 27, 2019 at 11:34:03AM -0400, Alan Stern wrote:
> > > On Sat, 27 Apr 2019, Greg KH wrote:
> > > 
> > > > On Fri, Apr 26, 2019 at 11:50:14AM +0200, Christo Gouws wrote:
> > > > > Hi,
> > > > > 
> > > > > I have a Line6 Pod Studio UX1 card, but each time I plug it in, I get
> > > > > the following crash in dmesg on Ubuntu 18.04
> > > > > Linux my-pc 4.20.8-042008-generic #201902121544 SMP Tue Feb 12
> > > > > 20:46:50 UTC 2019 x86_64 x86_64 x86_64 GNU/Linux
> > > > > 
> > > > > I've also tested this with a Fedora 30 v5.0.6-300 kernel, but still
> > > > > seems to happen (using liveCD).
> > > > > 
> > > > > 
> > > > > The output on the card seems to work, but none of the inputs work.
> > > > > 
> > > > > I've also now tested with latest kernel available on Arch Linux
> > > > > Linux my-pc 5.0.9-arch1-1-ARCH #1 SMP PREEMPT Sat Apr 20 15:00:46 UTC
> > > > > 2019 x86_64 GNU/Linux
> > > > > 
> > > > > After some further testing, I found that this issue cropped in beween
> > > > > v4.8.17 and v4.9-rc1.
> > > > > 
> > > > > v4.8.17   - Works fine.
> > > > > v4.9-rc1+  - Produces crash
> > > > 
> > > > Any chance you can use 'git bisect' to find the exact commit that caused
> > > > the failure?
> > > 
> > > No need.  The bug is in line6_read_data() in sound/usb/line6/driver.c.  
> > > That routine passes an invalid buffer to usb_control_message().  
> > > Instead it should allocate its own buffer for the USB transfer and then
> > > copy the value to the caller's buffer.
> > > 
> > > There is a similar problem in line6_write_data().  Furthermore, both
> > > routines do DMA to/from a buffer on the stack.
> > 
> > I have an old patch in my local tree for the dma buffer on the stack
> > issue, it's below.  I should clean it up and send it correctly one of
> > these days :)
> 
> But, in reading your response, it doesn't fix the reported issue here.
> Let me go audit the whole driver and fix it up and add it to my original
> patch...

Ok, here's a patch that should be "complete".

Christo, can you test this out and let us know if it fixes the issue for
you or not?

thanks,

greg k-h

---------------

From e2c743d1f900135c3e560cd9ea1647e4a1ebce7a Mon Sep 17 00:00:00 2001
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Wed, 23 Jan 2019 11:01:46 +0100
Subject: [PATCH] sound: USB: line6: use dynamic buffers

The line6 driver uses a lot of USB buffers off of the stack, which is
not allowed on many systems.  Fix this up by dynamically allocating the
buffers with kmalloc() which allows for proper DMA-able memory.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable <stable@vger.kernel.org>

---
 sound/usb/line6/driver.c   |   60 ++++++++++++++++++++++++++-------------------
 sound/usb/line6/podhd.c    |   21 +++++++++------
 sound/usb/line6/toneport.c |   23 ++++++++++++-----
 3 files changed, 64 insertions(+), 40 deletions(-)

--- a/sound/usb/line6/driver.c
+++ b/sound/usb/line6/driver.c
@@ -351,12 +351,16 @@ int line6_read_data(struct usb_line6 *li
 {
 	struct usb_device *usbdev = line6->usbdev;
 	int ret;
-	unsigned char len;
+	unsigned char *len;
 	unsigned count;
 
 	if (address > 0xffff || datalen > 0xff)
 		return -EINVAL;
 
+	len = kmalloc(sizeof(*len), GFP_KERNEL);
+	if (!len)
+		return -ENOMEM;
+
 	/* query the serial number: */
 	ret = usb_control_msg(usbdev, usb_sndctrlpipe(usbdev, 0), 0x67,
 			      USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_OUT,
@@ -365,7 +369,7 @@ int line6_read_data(struct usb_line6 *li
 
 	if (ret < 0) {
 		dev_err(line6->ifcdev, "read request failed (error %d)\n", ret);
-		return ret;
+		goto exit;
 	}
 
 	/* Wait for data length. We'll get 0xff until length arrives. */
@@ -375,28 +379,29 @@ int line6_read_data(struct usb_line6 *li
 		ret = usb_control_msg(usbdev, usb_rcvctrlpipe(usbdev, 0), 0x67,
 				      USB_TYPE_VENDOR | USB_RECIP_DEVICE |
 				      USB_DIR_IN,
-				      0x0012, 0x0000, &len, 1,
+				      0x0012, 0x0000, len, 1,
 				      LINE6_TIMEOUT * HZ);
 		if (ret < 0) {
 			dev_err(line6->ifcdev,
 				"receive length failed (error %d)\n", ret);
-			return ret;
+			goto exit;
 		}
 
-		if (len != 0xff)
+		if (*len != 0xff)
 			break;
 	}
 
-	if (len == 0xff) {
+	ret = -EIO;
+	if (*len == 0xff) {
 		dev_err(line6->ifcdev, "read failed after %d retries\n",
 			count);
-		return -EIO;
-	} else if (len != datalen) {
+		goto exit;
+	} else if (*len != datalen) {
 		/* should be equal or something went wrong */
 		dev_err(line6->ifcdev,
 			"length mismatch (expected %d, got %d)\n",
-			(int)datalen, (int)len);
-		return -EIO;
+			(int)datalen, (int)*len);
+		goto exit;
 	}
 
 	/* receive the result: */
@@ -405,12 +410,12 @@ int line6_read_data(struct usb_line6 *li
 			      0x0013, 0x0000, data, datalen,
 			      LINE6_TIMEOUT * HZ);
 
-	if (ret < 0) {
+	if (ret < 0)
 		dev_err(line6->ifcdev, "read failed (error %d)\n", ret);
-		return ret;
-	}
 
-	return 0;
+exit:
+	kfree(len);
+	return ret;
 }
 EXPORT_SYMBOL_GPL(line6_read_data);
 
@@ -422,12 +427,16 @@ int line6_write_data(struct usb_line6 *l
 {
 	struct usb_device *usbdev = line6->usbdev;
 	int ret;
-	unsigned char status;
+	unsigned char *status;
 	int count;
 
 	if (address > 0xffff || datalen > 0xffff)
 		return -EINVAL;
 
+	status = kmalloc(sizeof(*status), GFP_KERNEL);
+	if (!status)
+		return -ENOMEM;
+
 	ret = usb_control_msg(usbdev, usb_sndctrlpipe(usbdev, 0), 0x67,
 			      USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_OUT,
 			      0x0022, address, data, datalen,
@@ -436,7 +445,7 @@ int line6_write_data(struct usb_line6 *l
 	if (ret < 0) {
 		dev_err(line6->ifcdev,
 			"write request failed (error %d)\n", ret);
-		return ret;
+		goto exit;
 	}
 
 	for (count = 0; count < LINE6_READ_WRITE_MAX_RETRIES; count++) {
@@ -447,28 +456,29 @@ int line6_write_data(struct usb_line6 *l
 				      USB_TYPE_VENDOR | USB_RECIP_DEVICE |
 				      USB_DIR_IN,
 				      0x0012, 0x0000,
-				      &status, 1, LINE6_TIMEOUT * HZ);
+				      status, 1, LINE6_TIMEOUT * HZ);
 
 		if (ret < 0) {
 			dev_err(line6->ifcdev,
 				"receiving status failed (error %d)\n", ret);
-			return ret;
+			goto exit;
 		}
 
-		if (status != 0xff)
+		if (*status != 0xff)
 			break;
 	}
 
-	if (status == 0xff) {
+	if (*status == 0xff) {
 		dev_err(line6->ifcdev, "write failed after %d retries\n",
 			count);
-		return -EIO;
-	} else if (status != 0) {
+		ret = -EIO;
+	} else if (*status != 0) {
 		dev_err(line6->ifcdev, "write failed (error %d)\n", ret);
-		return -EIO;
+		ret = -EIO;
 	}
-
-	return 0;
+exit:
+	kfree(status);
+	return ret;
 }
 EXPORT_SYMBOL_GPL(line6_write_data);
 
--- a/sound/usb/line6/podhd.c
+++ b/sound/usb/line6/podhd.c
@@ -225,28 +225,32 @@ static void podhd_startup_start_workqueu
 static int podhd_dev_start(struct usb_line6_podhd *pod)
 {
 	int ret;
-	u8 init_bytes[8];
+	u8 *init_bytes;
 	int i;
 	struct usb_device *usbdev = pod->line6.usbdev;
 
+	init_bytes = kmalloc(8, GFP_KERNEL);
+	if (!init_bytes)
+		return -ENOMEM;
+
 	ret = usb_control_msg(usbdev, usb_sndctrlpipe(usbdev, 0),
 					0x67, USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_OUT,
 					0x11, 0,
 					NULL, 0, LINE6_TIMEOUT * HZ);
 	if (ret < 0) {
 		dev_err(pod->line6.ifcdev, "read request failed (error %d)\n", ret);
-		return ret;
+		goto exit;
 	}
 
 	/* NOTE: looks like some kind of ping message */
 	ret = usb_control_msg(usbdev, usb_rcvctrlpipe(usbdev, 0), 0x67,
 					USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_IN,
 					0x11, 0x0,
-					&init_bytes, 3, LINE6_TIMEOUT * HZ);
+					init_bytes, 3, LINE6_TIMEOUT * HZ);
 	if (ret < 0) {
 		dev_err(pod->line6.ifcdev,
 			"receive length failed (error %d)\n", ret);
-		return ret;
+		goto exit;
 	}
 
 	pod->firmware_version =
@@ -255,7 +259,7 @@ static int podhd_dev_start(struct usb_li
 	for (i = 0; i <= 16; i++) {
 		ret = line6_read_data(&pod->line6, 0xf000 + 0x08 * i, init_bytes, 8);
 		if (ret < 0)
-			return ret;
+			goto exit;
 	}
 
 	ret = usb_control_msg(usbdev, usb_sndctrlpipe(usbdev, 0),
@@ -263,10 +267,9 @@ static int podhd_dev_start(struct usb_li
 					USB_TYPE_STANDARD | USB_RECIP_DEVICE | USB_DIR_OUT,
 					1, 0,
 					NULL, 0, LINE6_TIMEOUT * HZ);
-	if (ret < 0)
-		return ret;
-
-	return 0;
+exit:
+	kfree(init_bytes);
+	return ret;
 }
 
 static void podhd_startup_workqueue(struct work_struct *work)
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
