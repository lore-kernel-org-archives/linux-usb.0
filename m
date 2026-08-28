Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9DA3403FF
	for <linux-usb@vger.kernel.org>; Fri, 28 Aug 2026 05:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787895817; cv=none; b=VYnsxc2vd23VgictjsEcQw9UP2Z5QDLFtWUb11Jfbs8mBx8RbTrKJRr2pfb3Nng5TzWxbtZkhJV/U9UHmHIEIsJvcCCQ+MSKZQCwjgerY8OVG264OVI9kuRZy/uafpxSVOwGEVVXxibzwUQYSFBZBu0JpkJSmWavRnr9xjQ7yGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787895817; c=relaxed/simple;
	bh=+WyHdsc2R5oGgZyaymcpA5PBb3YSTzd3Q2ag3IxV6oU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=opGTWnSd0MYCEpRzw0lOcttZIQinn85EY1iLFiR3SW2PS9YZO2ccOiVPpESm7WpjGMLbVg6ryMQijlKU1Qx/pFL7Ggbx4dGfpzmZPwVmn6BZy0k/CyGr3mVAGeB1DceGwUHEf51vMRqE9Ip4Wm6RTbGiGZLEIXCsYL5EfvAK498=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=BFhfmvQR; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=K8NOeZ82; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="BFhfmvQR";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="K8NOeZ82"
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfout.phl.internal (Postfix) with ESMTP id 07149EC00C7;
	Fri, 28 Aug 2026 01:43:34 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Fri, 28 Aug 2026 01:43:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1787895814;
	 x=1787982214; bh=IDEXL/Vx9nC5mlnl6aTUmeF35DHNOGaVcgy7eTr4B8c=; b=
	BFhfmvQRfJewWdIR9znPtxnXdeHJp3SgY0fFAyZUviLkKy8jnEEFzqSHQl/oIaRz
	fn02+5btygpBs5oFP9/pvkuH/zXIbXxvoctcNkmuFnLtfW9jbHA3CPm1pFgN23Q4
	IYS7USdlqEHng5yU3k5fdhZk0KhBlswBKmp5x3upMdOtyWmnNCm8NDLpIlHJC8M4
	oHojg6e8CF4WkU99qw6g1q4OL53D8EHWm8okMQj/yTauNdSC1SpWgg4o3PXcs6mZ
	4VQQuCfzH8r6N7po7iPNguV+6bekCp7RCl837vRFIQmGTMyUPNsHKTFnfIvo5g2M
	k0+E3fsNoOxWxIzv/eHPCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1787895814; x=
	1787982214; bh=IDEXL/Vx9nC5mlnl6aTUmeF35DHNOGaVcgy7eTr4B8c=; b=K
	8NOeZ82WLnyOurTdmgcAlyP8lEL18UWdr9TmMmIAidbOIC3/TSx74rGfk4J1BGgE
	D0Zbs6CJKZ+lTPXienFsp3OxvHMOvdso23tvOtck5UfJlJQa1mefZUejeI3ZFQvF
	0fiX/eJOTfj63QzpVigKS3qfxJfolt5oJ09Q06R6Xo/wRCi01pmW42euJ5ateFme
	JGXp3M+ZZkcg8kgnb8A4cHuQTFbYgAkSq9T8hlhd9Ok2Hzf2aRidL1XLN0k6/mFT
	xc1SQBUWdAb48CPR73U/uD2v9DNCO5l9OEOvzmNHmpuBlQ2XGLQxshWqTvymaKdd
	HNr4yNrTbfuARa4EtZcGw==
X-ME-Sender: <xms:BSCRamD0y9MFFEX8mqAhXDIDDja2_mTo1rT8WO2ggReVqV8xthTMPQ>
    <xme:BSCRauVaBc2l0O7nDjvrtJXbWDPGLn44-vkwCExFhgIuA42Py_wwBvDbM0efkU30M
    H2FsAcEZMmRHzHT1WdW1xjQyRw45Zg5wG___DW86lBd7uDMeA>
X-ME-Received: <xmr:BSCRakCnTikIGDUq0R3UfFeXG94UtTfGDrq0olUk9CvnQ9P2UjPolK85byC1NxEwzu5oDfCu-ccAGU0UJHXQcpZ0Qa20uREwlPYN6kzv1fw>
X-ME-Proxy-Cause: dmFkZTFuSCEpVXy9s/D/R7zZs0qe1IEKNMZcviLDtWcMlkBRxwjIDag09EUCdg3wy8wMeq
    usrFrB3kyLT3QANvyXkBQwRcYeTuVLVHaMx+lEWGl0N5bqKc5l0gJE80b3hCXcgkMm1XgI
    7z1qMDrKP0/qlpWik1COglO42xjy8wrlHWxgiYDn0X+5S3K4gA5n7Kuuw0K7EfTi46HGD9
    CE3fKXFGkaoAyXDRZpPFoTNKenmrJVkLoGgDY0N0lGR+ZkpUa3SpHLJ+NTszHRvkcJfZ5z
    SGgNN403y3cBsBA9S4cA7Xb3T9qkIFnZiboaRn/OPQM1LYnXDw6UKE10UUhpGsQfF3BdQs
    maGKQBkxGaqPJw8ICxxEvWrm/Hqnm8mbRaPXV18nB/NvacOcdWEfock9FhU0LkJaIMyyjw
    sVXsF4VUR7tRYLZoL+4Jbyt2fpjYWgfR6SymziLAZy04VIT0DZy79uOgQgacp6wkQMMnVs
    knI+scB2mOkZwfAt33HS/Sztoao3T6/I/TZ/BwYt5nUdkv5qh+A3MfW6rtLQrKt9pTtAgf
    vYwOqOmTsJuPcynI4iDZSwX3djDSkQUBXEhPmKThv0zQ3AVmRWQ9MjDNw71MFiIlk8zhZc
    DEmAkEMnZT0wpRe3nw0HBhJ4tQGO44wDAR2V9wsaAFxP4exW9HiEzQTcXcvg
X-ME-Proxy: <xmx:BSCRah8EVz7qVJPxof7V_a2YeRyGFkX35hLhlGCSB7rYHq8536I2PQ>
    <xmx:BSCRarGuP-9b-5fDSRdNp7dzpRTD90iA-YngaKki-0bsrfL3icKZmA>
    <xmx:BSCRavNNabkO3wxiyazbVpjaudVOhpzXFIALm8fdqH9qAFhfcAPemw>
    <xmx:BSCRalcV9cb_BAza2QcAVGbP3gkHcSsjnGfxSYeH831KCkoH1P8x0Q>
    <xmx:BiCRagK7V5XjZdhBfUIRaAOf8acCr78KCodeck2F5fE1bE4hGWrqKCUs>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 28 Aug 2026 01:43:33 -0400 (EDT)
Date: Fri, 28 Aug 2026 07:43:31 +0200
From: Greg KH <greg@kroah.com>
To: Martin Rys <martin@archlinux.org>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: Improve "New device found" printout message
Message-ID: <2026082855-repave-condition-9f2c@gregkh>
References: <c9fb1eaa-9c88-4942-b6c5-9f7efbe1a133@archlinux.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c9fb1eaa-9c88-4942-b6c5-9f7efbe1a133@archlinux.org>

On Thu, Aug 27, 2026 at 05:38:35PM +0200, Martin Rys wrote:
> Hi,
> 
> it's my first time posting on any Linux mailing list, hopefully am doing
> everything right.
> 
> While checking out dmesg I saw that there's an extra space after
> "bcdDevice=":
>   usb 1-5.2: New USB device found, idVendor=0583, idProduct=a000,
> bcdDevice= 1.00
>   usb 1-5.2: New USB device strings: Mfr=0, Product=2, SerialNumber=0
> 
> Turns out that was introduced in
> https://github.com/torvalds/linux/commit/73c6d3b284cf7b31c03fdaa2476f48f8da0932f8
> (USB: announce bcdDevice as well as idVendor, idProduct.), as it was
> trying to keep the same formatting as `lsusb -v`:
> 
>   idProduct          0x0276 GXT 165 Gaming Mouse
>   bcdDevice            1.00
>   iManufacturer           1 SINOWEALTH
> 
>  but lsusb presumably uses %2x to have a fixed-width text, so the number
> of spacing it needs to do so it all lines up under a monospace font is
> predictable.
> 
> In dmesg, it just causes it to look odd if there's no character in the
> first hex slot, as "12.00" looks fine, but " 1.00" does not.
> 
> While staring at this I've also noticed that there's a comma instead of
> a colon after the first message, so I've fixed that up too.

Cool, but this all doesn't belong here, the patch changelog should
contain enough information for us to understand this.

> 
> Martin
> 
> 
> 
> >From a0bc389b6bf4641fbd894f8acd4c1c5709728862 Mon Sep 17 00:00:00 2001
> From: Martin Rys <martin@archlinux.org>
> Date: Thu, 27 Aug 2026 17:05:45 +0200
> Subject: [PATCH] USB: Improve "New device found" printout message

The patch shouldn't be part of the middle of the email, just send it on
it's own.  See lots of examples on the mailing list for how that looks.

> 
> Use colon instead of comma like the later message does.
> 
> Do not print a useless space after `bcdDevice=` - this was introduced as
> the formatting was copied from `lsusb -v` printout, but that one has
> preceding spaces, this one does not.
> 
> Signed-off-by: Martin Rys <martin@archlinux.org>
> ---
>  drivers/usb/core/hub.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 3345b3298daf..c382215a1177 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -2411,7 +2411,7 @@ static void announce_device_ids(struct usb_device
> *udev)
>         u16 bcdDevice = le16_to_cpu(udev->descriptor.bcdDevice);
>  
>         dev_info(&udev->dev,
> -               "New USB device found, idVendor=%04x, idProduct=%04x,
> bcdDevice=%2x.%02x\n",
> +               "New USB device found: idVendor=%04x, idProduct=%04x,
> bcdDevice=%x.%02x\n",
>                 le16_to_cpu(udev->descriptor.idVendor),
>                 le16_to_cpu(udev->descriptor.idProduct),
>                 bcdDevice >> 8, bcdDevice & 0xff);
> -- 
> 2.55.0

The patch is line-wrapped and whitespace damaged and can't be applied.
Perhaps use a tool like git send-email or b4 to send it?

thanks,

greg k-h
