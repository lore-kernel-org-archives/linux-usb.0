Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCFC3CB56A
	for <linux-usb@vger.kernel.org>; Fri, 17 Jul 2026 10:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784283991; cv=none; b=igj6QKqfXaZ+QTHKvNxspCEMmM3c5yIkmSthM6rtAOtFlParnk27D7Fg8/ny4ntGG2teuySssnmOVgW6gYYoF8pc94bNmSxDIWQ2aCWRhM1keeajptDGjG5R1rN2ObXNCeN50VYprAHa8XAVII7oB2a4ANPVWSi6tcfZuKCt+sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784283991; c=relaxed/simple;
	bh=xSze4/x6RJVhMR0Y7nyqsMNOFBU5cWtFKR4cQV2Yxbo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SNYKGfWUDxAE5UYa+Q/9iTqnYpu+cC+IK+35UbC56S7Sj1d11njnRwLnFy5jqQqkcHiUL8H/pvrRu1Gv57zxRV8NzRx2apBRo06WFMI4fVAet2dRCb9DesLcTXg2KeUhWYIsiUqyYVezlVVDTGTgeoIF8EnzumJLAmIKtldH8dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=I0TtfVxx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="I0TtfVxx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 051E61F000E9;
	Fri, 17 Jul 2026 10:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784283986;
	bh=xbV2KOqSh5GaN6JZC2HY0cbBXc81d0u26CXKcA7GUf4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=I0TtfVxxNRUU2AWQvJ899bd6aRg3tvlylJWwsCcXpJBndP/1rP05g4ZIH8oEamo/w
	 ZzhfxhinMBlOTMeHcq1wDdzSP23lLfWCzdaw38SJUfb6hRepMmUkHImkHhyx41WTFe
	 UV3pklvRnI1eTQW4c4aWC7YlTq+u4z03PedHWU/o=
Date: Fri, 17 Jul 2026 12:26:19 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Arthur =?iso-8859-1?Q?Cr=E9pin?= Leblond <arthur@marmottus.net>
Cc: linux-usb@vger.kernel.org, Ben Hoff <hoff.benjamin.k@gmail.com>
Subject: Re: [PATCH] usb: gadget: f_hid: convert polling interval from ms to
 bInterval units
Message-ID: <2026071728-riveter-finale-de15@gregkh>
References: <20260716144921.1120265-1-arthur@marmottus.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260716144921.1120265-1-arthur@marmottus.net>

On Thu, Jul 16, 2026 at 04:49:21PM +0200, Arthur Crépin Leblond wrote:
> The HID polling interval is different depending on the USB speed.
> 
> - Full speed: the units are milliseconds (1-255)
> - High/Super speed: the units are micro-frames of 0.125ms
> 
> Exposing directly the bInterval means that the user needs to know
> which speed is currently in use and has to convert it accordingly
> themselves.
> 
> The solution is to expose the interval in units of milliseconds and
> do the conversion in the driver.
> 
> Cc: Ben Hoff <hoff.benjamin.k@gmail.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Arthur Crépin Leblond <arthur@marmottus.net>
> ---
>  Documentation/ABI/testing/configfs-usb-gadget-hid | 10 ++++++++++
>  drivers/usb/gadget/function/f_hid.c               |  8 ++++----
>  2 files changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/configfs-usb-gadget-hid b/Documentation/ABI/testing/configfs-usb-gadget-hid
> index 748705c4cb58..006d479b7428 100644
> --- a/Documentation/ABI/testing/configfs-usb-gadget-hid
> +++ b/Documentation/ABI/testing/configfs-usb-gadget-hid
> @@ -11,3 +11,13 @@ Description:
>  		report_length	HID report length
>  		subclass	HID device subclass to use
>  		=============	============================================
> +
> +What:		/config/usb-gadget/gadget/functions/hid.name/interval
> +Date:		Jul 2026
> +KernelVersion:	7.2
> +Description:
> +		The polling interval for the HID endpoint(s), expressed in
> +		milliseconds in the range 1-255.
> +
> +		The value is speed-independent: the driver converts it to the
> +		appropriate bInterval.
> diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/function/f_hid.c
> index 3c6b43d06a6d..49548a96c1e8 100644
> --- a/drivers/usb/gadget/function/f_hid.c
> +++ b/drivers/usb/gadget/function/f_hid.c
> @@ -1211,8 +1211,8 @@ static int hidg_bind(struct usb_configuration *c, struct usb_function *f)
>  		hidg_ss_in_ep_desc.bInterval = 4;
>  	} else {
>  		hidg_fs_in_ep_desc.bInterval = hidg->interval;
> -		hidg_hs_in_ep_desc.bInterval = hidg->interval;
> -		hidg_ss_in_ep_desc.bInterval = hidg->interval;
> +		hidg_hs_in_ep_desc.bInterval = USB_MS_TO_HS_INTERVAL(hidg->interval);
> +		hidg_ss_in_ep_desc.bInterval = USB_MS_TO_HS_INTERVAL(hidg->interval);
>  	}
>  
>  	hidg_ss_out_comp_desc.wBytesPerInterval =
> @@ -1245,8 +1245,8 @@ static int hidg_bind(struct usb_configuration *c, struct usb_function *f)
>  			hidg_ss_out_ep_desc.bInterval = 4;
>  		} else {
>  			hidg_fs_out_ep_desc.bInterval = hidg->interval;
> -			hidg_hs_out_ep_desc.bInterval = hidg->interval;
> -			hidg_ss_out_ep_desc.bInterval = hidg->interval;
> +			hidg_hs_out_ep_desc.bInterval = USB_MS_TO_HS_INTERVAL(hidg->interval);
> +			hidg_ss_out_ep_desc.bInterval = USB_MS_TO_HS_INTERVAL(hidg->interval);

So this breaks the current usage, as the value previously used now
operates differently, right?

Yes, it was never documented, but by changing this, what are you now
causing to be changed when kernels are updated and userspace isn't
modified?

thanks,

greg k-h
