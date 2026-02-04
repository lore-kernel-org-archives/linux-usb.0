Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9E83557F6;
	Wed,  4 Feb 2026 05:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770182113; cv=none; b=lXFraS7s6v4ypNvdfkFF/SlbZYYVfO5Y0WMn2iAIP2Abvee++xEVHb4q6tPwa9rvgLJCUM2M7EYloZFxMv4VWy7VRPN4nwoKvAche8oYR3JLk0APEsnxKYykRjPGU+hPrBRl6ckLBdptpi4/pdoZ16fA0qcWMiEFobz1aZR7MhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770182113; c=relaxed/simple;
	bh=0USVsA8tzRo5NQD5YTAvbj7QFvFzWPHVTbohRqrLciA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gzfZu3Q5sia7qmSncRDlHV/6tb8eWBwt+g4WUOX37jABy/iv4d8AHYy5lJ3CbKsXLRO61R6A+hL+YBee+E70GqKK6O+WQM/c9MactWPGHbIMJOU1HuSRq7pCFawd1pmYBGWdrihLO/e2+cHMAhvykM10qwzbTSYs2qhBR6Zh5yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XGScr5Q4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XGScr5Q4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A917C4CEF7;
	Wed,  4 Feb 2026 05:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770182112;
	bh=0USVsA8tzRo5NQD5YTAvbj7QFvFzWPHVTbohRqrLciA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XGScr5Q4lWWArIXVa/opEgZiNtOd8rAOrJNb8Zi+BtPBbFuNxU6mQATq4rK98qesO
	 mHmdEmTihk9j4vHQ9ymuZiqDQUvRRH3pVkrl/g1fQO4J+BUofy5S4D9DTqYlBgRcj+
	 qblLqQZZGjrRT0DDlysg0UytHz6qDObbI+0dNtyU=
Date: Wed, 4 Feb 2026 06:15:09 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: A1RM4X <dev@a1rm4x.com>
Cc: linux-usb@vger.kernel.org, limiao@kylinos.cn, oneukum@suse.com,
	huanglei@kylinos.cn, lijiayi@kylinos.cn,
	johannes.bruederl@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: add QUIRK_NO_BOS for several devices
Message-ID: <2026020457-distrust-vision-e5de@gregkh>
References: <20260204032938.61553-1-dev@a1rm4x.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204032938.61553-1-dev@a1rm4x.com>

On Tue, Feb 03, 2026 at 10:29:38PM -0500, A1RM4X wrote:
> Add QUIRK_NO_BOS entries for:
>  * ASUS TUF 4K PRO (0x0b05:0x1ab9)
>  * Avermedia Live Gamer Ultra 2.1 (0x07ca:0x2553)
>  * UGREEN 35871 (0x2b89:0x5871)

Why?  What is the results without this option being used here?  And what
happens when userspace goes and asks for this descriptor?

> Signed-off-by: A1RM4X <dev@a1rm4x.com>

We need a real name, sorry.

> ---
>  drivers/usb/core/quirks.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
> index c4d85089d19b..ddce45ce9f6c 100644
> --- a/drivers/usb/core/quirks.c
> +++ b/drivers/usb/core/quirks.c
> @@ -453,6 +453,15 @@ static const struct usb_device_id usb_quirk_list[] = {
>  	/* Elgato 4K X - BOS descriptor fetch hangs at SuperSpeed Plus */
>  	{ USB_DEVICE(0x0fd9, 0x009b), .driver_info = USB_QUIRK_NO_BOS },
>  
> +	/* ASUS TUF 4K PRO - BOS descriptor fetch hangs at SuperSpeed Plus */
> +	{ USB_DEVICE(0x0b05, 0x1ab9), .driver_info = USB_QUIRK_NO_BOS },
> +
> +	/* Avermedia Live Gamer Ultra 2.1 (GC553G2) - BOS descriptor fetch hangs at SuperSpeed Plus */
> +	{ USB_DEVICE(0x07ca, 0x2553), .driver_info = USB_QUIRK_NO_BOS },
> +
> +	/* UGREEN 35871 - BOS descriptor fetch hangs at SuperSpeed Plus */
> +	{ USB_DEVICE(0x2b89, 0x5871), .driver_info = USB_QUIRK_NO_BOS },

Please read the comment for this structure for how to place these in the
list.

thanks,

greg k-h
