Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F7438839F
	for <linux-usb@vger.kernel.org>; Fri, 13 Mar 2026 10:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773396691; cv=none; b=YxXo4yut/0NLfNGZbuDL4ALo7SILPrWqs80fCE0tTAMkN0Xb3KSjTaUsgZBjjkTDDYG71iLgmqm8EIwmQAiWULycQ7WTQBGTzSDrb4T4PHD9qM6FMelNUM75IRXczHGNndoYxBHylGKCrWHdHnTeA9lKTw+SEnyoi9fl4Q9FNq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773396691; c=relaxed/simple;
	bh=J5CtOsWfI2YyxAyj6k78qSiyCtIY9NX+WM8JVAnIUt8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZLozcnZLinkTYBVucduVzunflQ1R8XtKTig8t+ZN/rAEOmXW4Fb8veilIllzn9BM8l7IZLnG83B1TnvoEZYfT9ETnDBlKR79jdxZ5fiNN/k9fuEwgMcnb9/+3t8U3QT8Xz1ABEz9iGp8dQ4WIJi3T/tFbXDQbxNDZKsheuC17MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=k4328jci; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="k4328jci"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3ECFC19421;
	Fri, 13 Mar 2026 10:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773396690;
	bh=J5CtOsWfI2YyxAyj6k78qSiyCtIY9NX+WM8JVAnIUt8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k4328jciCSoMinj4eCNtwzkQ49Xs9xw6r7F/oRxPiiYV61j62L95K03Oyapo6U6FE
	 aizcsg/mzg+4XggA0fBHopTvEuYsMIn53d+A/iOHoMHSOZeM/u6Apq/WBQRBC26JfA
	 FtvMcrSXvTVynxRfg70c+vcWirK7a7ayR8tp+nWY=
Date: Fri, 13 Mar 2026 11:11:24 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: CaTaTo <vahnenko2003@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: ezcap401 needs USB_QUIRK_NO_BOS to function on 10gbs usb speed
Message-ID: <2026031334-luxury-sheath-81aa@gregkh>
References: <2026031331-overrun-palpitate-71c4@gregkh>
 <11a5fd78-b897-47ca-8747-6f362d327b30@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <11a5fd78-b897-47ca-8747-6f362d327b30@gmail.com>

On Fri, Mar 13, 2026 at 12:54:35PM +0300, CaTaTo wrote:
> Sorry again, last message went probably to Greg's address rather than this
> topic. I managed to make a patch, hopefully I didn't miss anything critical.

No need to attach it, just use 'git send-email' to send it directly.

Also, some comments on the patch:

> From 1ad243ebd0211a591665383d1382615bb9e3dc3a Mon Sep 17 00:00:00 2001
> From: Vyacheslav Vahnenko <vahnenko2003@gmail.com>
> Date: Fri, 13 Mar 2026 12:12:26 +0300
> Subject: [PATCH] Add USB_QUIRK_NO_BOS for ezcap401 usb capture card
> 
> Signed-off-by: Vyacheslav Vahnenko <vahnenko2003@gmail.com>

You need to have some changelog text, we can't take it without any
wording.

> ---
>  drivers/usb/core/quirks.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
> index 9e7e49712..8ef876315 100644
> --- a/drivers/usb/core/quirks.c
> +++ b/drivers/usb/core/quirks.c
> @@ -583,6 +583,9 @@ static const struct usb_device_id usb_quirk_list[] = {
>  	/* INTEL VALUE SSD */
>  	{ USB_DEVICE(0x8086, 0xf1a5), .driver_info = USB_QUIRK_RESET_RESUME },
>  
> +	/* ezcap401 - BOS descriptor fetch hangs at SuperSpeed Plus */
> +	{ USB_DEVICE(0x32ed, 0x0401), .driver_info = USB_QUIRK_NO_BOS },

The list should be sorted by id.  Please put this in the proper place in
the list.

thanks,

greg k-h
