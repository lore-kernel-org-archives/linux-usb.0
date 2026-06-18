Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E66F3EC2F5;
	Thu, 18 Jun 2026 10:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781778772; cv=none; b=ewLy8yBE9aPVSNTXPpYc8bM9y6BitiWEzj1So3wtZthBtEUYc6iCgFsP1qz5Qfx77I2eAuEOkeo32WkbqHtPpBJBRpXDMWMoLem90PFWmR8YKXczcSllEbvJPbE37zcUdf7YRd4UAoBqJl3eBB/71/PpsKbeUjLFXSnu81ly6Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781778772; c=relaxed/simple;
	bh=8yPCgIwOjByhAV+6gKPaEuRXlP2OgC2FCr7T2EZzZos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mgWeHv69Ker9OOA5aEcEJ6cnKc0lXo1aCSXpQvOY2JodX0t6U3bDgfDzAEKmNK5wbiT9i64LVWhF3fIse9aWhdigBtCHmCG5mli9Wb38XVFhIwweJeR54rsSjsFJEjHqrsSqm6Tf6MOcS8GQO/sp8QbzzIoXeqBsYKjpjoDStxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=yDWP7p+q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="yDWP7p+q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE5EE1F00A3A;
	Thu, 18 Jun 2026 10:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781778769;
	bh=pvwCkxyu4NiN+sYHH9u9GkliMjaztSM4y6zRo1d3xi8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=yDWP7p+qrL2RLo0Fdqwze45VI/i51vu8wqIBgPzkHlBwLo++qrc0g+qgnoYpYl5Ii
	 UW2s9up36DU42dzhoBXN5XrAxIT0eEqUBxVp0kcckUaDcYmfHoxYzx8jTHxQh8s0o0
	 osEGw+O51IH/6228I/PTziu05v5EkNMJ72x5zy7A=
Date: Thu, 18 Jun 2026 12:33:02 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: yangsizhe <18392868223@163.com>
Cc: Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: serial: option: add multiple VID/PID
Message-ID: <2026061851-shanty-delicacy-7904@gregkh>
References: <20260618014917.11383-1-18392868223@163.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618014917.11383-1-18392868223@163.com>

On Thu, Jun 18, 2026 at 09:49:17AM +0800, yangsizhe wrote:
> Add the PID and VID to facilitate the binding of our company's module
> 
> Real name:MeiG Smart Technology Co., Ltd
> 
> Signed-off-by: yangsizhe <18392868223@163.com>
> ---
>  drivers/usb/serial/option.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> index a34e79cfd5b6..e7025e0fa3b0 100644
> --- a/drivers/usb/serial/option.c
> +++ b/drivers/usb/serial/option.c
> @@ -2458,6 +2458,24 @@ static const struct usb_device_id option_ids[] = {
>  	{ USB_DEVICE_AND_INTERFACE_INFO(0x2dee, 0x4d64, 0xff, 0xff, 0x30) },	/* MeiG SRM813Q (Diag) */
>  	{ USB_DEVICE_AND_INTERFACE_INFO(0x2dee, 0x4d64, 0xff, 0xff, 0x40) },	/* MeiG SRM813Q (AT) */
>  	{ USB_DEVICE_AND_INTERFACE_INFO(0x2dee, 0x4d64, 0xff, 0xff, 0x60) },	/* MeiG SRM813Q (NMEA) */
> +	{ USB_DEVICE(0x2dee, 0x4d23),						/* MeiG SLM868x*/
> +	.driver_info = RSVD(4) | RSVD(5) },
> +	{ USB_DEVICE(0x2dee, 0x4d62),						/* MeiG SLM820x*/
> +	.driver_info = RSVD(4) },
> +	{ USB_DEVICE(0x2dee, 0x4d30),						/* MeiG SRM813Q*/
> +	.driver_info = RSVD(0) },
> +	{ USB_DEVICE(0x2dee, 0x4d50),						/* MeiG SRM811x*/
> +	.driver_info = RSVD(0) | RSVD(6) },
> +	{ USB_DEVICE(0x2dee, 0x4d51),						/* MeiG SRM821x*/
> +	.driver_info = RSVD(0) | RSVD(6) },
> +	{ USB_DEVICE(0x2dee, 0x4d52),						/* MeiG SRM810x*/
> +	.driver_info = RSVD(0) | RSVD(6) },
> +	{ USB_DEVICE(0x2dee, 0x4d57),						/* MeiG SLM770A*/
> +	.driver_info = RSVD(0) },
> +	{ USB_DEVICE(0x2dee, 0x4d58),						/* MeiG SLM828A*/
> +	.driver_info = RSVD(0) },
> +	{ USB_DEVICE(0x05c6, 0xf601),						/* MeiG SLM750x*/
> +	.driver_info = RSVD(5) },
>  
>  	{ USB_DEVICE_INTERFACE_CLASS(0x2df3, 0x9d03, 0xff) },			/* LongSung M5710 */
>  	{ USB_DEVICE_INTERFACE_CLASS(0x305a, 0x1404, 0xff) },			/* GosunCn GM500 RNDIS */
> -- 
> 2.17.1
> 
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
