Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFED03F327E
	for <linux-usb@vger.kernel.org>; Sat, 25 Jul 2026 17:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785000540; cv=none; b=bn+HB1UXWyyqkoJjwUVYh8Vx296XvpuTbTQrgFRT1Eu08VMvF7hhg7Eu0cA5sgO7U3f702EhARbskVTMs6N4hOOIwx2jkfV6r9HZPPYUshTddW6pNaohOFY8g/33Cxbbxw8ldSMU1X/tRbnluEKwKJGVY8020P9fnqobJcH/LRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785000540; c=relaxed/simple;
	bh=210831r/SR9IrnmcujaWpwBHQzTgme4kyH5WM+jZJl0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qDJCWIuzrtbMqedibWC/lkhmLCVS66w/J7g7JFj8b6BT/22oVJvv6iSoLZS2Gqi+YOaayy+LnA7Og5DO0B0W1zQi56syh1WwO8esUY0ArTbkLmQ378Tk5TgGKFySnB19qdXEVeR/mf1fn2LK5BCfmB3TZsASIRZRuo/p5Sh3NOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=qPvSyzAn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="qPvSyzAn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B43571F000E9;
	Sat, 25 Jul 2026 17:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785000539;
	bh=bl+huzAMEl1qxfkWazn9hlkIfBPKxvRMWiOPi5wcZic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=qPvSyzAnx9YWK3uf2+zJu9U+ESFJqv9R7ailHGO/BSA4oc1+PwRzzyhIXclGTTDz8
	 DdDxi6A5yyqYzd/pId1FC7IS/uIgId57TlCP8qn1o5TbGTiAzmIn7abzRdTBktC+No
	 3G88z0ysIk1Gydf5xSEqBRJwSqiqc25qWtU3msd8=
Date: Sat, 25 Jul 2026 19:27:34 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ishaan Dandekar <ishaan.dandekar@gmail.com>
Cc: nikhilsolanke5@gmail.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: core: quirks: Add 255-bytes initial config read
 quirk
Message-ID: <2026072500-moaning-importer-e8ee@gregkh>
References: <CAG0uPa-gYTMS87gWo2ixigFifAAR8wQ1eJ1iRRTvBgiywvdxYg@mail.gmail.com>
 <2026072535-uncork-gonad-4187@gregkh>
 <CAG0uPa8qSkQjesAmcfms7Va2j0yb3VDuES5TYe=65LXFn0qKJQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAG0uPa8qSkQjesAmcfms7Va2j0yb3VDuES5TYe=65LXFn0qKJQ@mail.gmail.com>

On Sat, Jul 25, 2026 at 08:19:21PM +0530, Ishaan Dandekar wrote:
> Hi Greg,
> 
> Here is the follow-on patch adding the ShanWan Wireless Gamepad (2563:0575)
> to the static quirks table.
> 
> Note: This patch depends on the USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE flag
> introduced in Nikhil Solanke's pending patch:
> https://lore.kernel.org/linux-usb/20260717195336.98500-2-nikhilsolanke5@gmail.com/
> 
> Thanks,
> Ishaan
> 
> ---
> 
> >From ecd1aa9afd8bc00a3e0b36cbe49b427f390e5de6 Mon Sep 17 00:00:00 2001
> From: Ishaan Dandekar <ishaan.dandekar@gmail.com>
> Date: Sat, 25 Jul 2026 20:03:28 +0530
> Subject: [PATCH] usb: quirks: Add ShanWan gamepad to quirk list
> 
> The ShanWan Wireless Gamepad (dongle ID 2563:0575) crashes with a -71
> EPROTO error during standard enumeration because it expects a 255-byte
> initial configuration request. Add this device to the quirk list to
> use the USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE flag.
> 
> Signed-off-by: Ishaan Dandekar <ishaan.dandekar@gmail.com>
> ---
>  drivers/usb/core/quirks.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
> index 87ee2d938..696bb6548 100644
> --- a/drivers/usb/core/quirks.c
> +++ b/drivers/usb/core/quirks.c
> @@ -588,6 +588,9 @@ static const struct usb_device_id usb_quirk_list[] = {
>   { USB_DEVICE(0x2386, 0x3119), .driver_info = USB_QUIRK_NO_LPM },
> 
>   { USB_DEVICE(0x2386, 0x350e), .driver_info = USB_QUIRK_NO_LPM },
> +
> + /* ShanWan Wireless Gamepad */
> + { USB_DEVICE(0x2563, 0x0575), .driver_info =
> USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE },
> 
>   /* UGREEN 35871 - BOS descriptor fetch hangs at SuperSpeed Plus */
>   { USB_DEVICE(0x2b89, 0x5871), .driver_info = USB_QUIRK_NO_BOS },
> -- 
> 2.34.1
> 

This patch is corrupted and can not be applied, please just send it with
git send-email so that this doesn't happen.

thanks,

greg k-h
