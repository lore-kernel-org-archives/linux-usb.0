Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FBC43CCA13
	for <linux-usb@vger.kernel.org>; Fri, 13 Mar 2026 17:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773422454; cv=none; b=soIvuPa46Zf/QJlgeW44LsZbrNd5UZOCxAYrFdu3i/uYw1prB598/laK4H0F5Md+i5U8H1cmaE5VVoCqzV3R9HY1AdXrjoeyKYgYiFeJojw/Tge1i8+DeOThqy3ZuwyZd+OWZviQvfUULY8XL+pAR/5K4EiV3DH0l040NML431Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773422454; c=relaxed/simple;
	bh=tr2ly2C77tDMPqgIt4tjBLo4DHA8LRxs3CVPK/SWd6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fr2CeLWw72zFizlyka5guxkUKfxK8Xaktu4PVbMzo0pHG0B5ubfBn5nDUxkawNOq/X6AMzrPu7wpctRDLYSzDzpCOaM2GRx0XQJMU9hup5ucYFk6LnmJWc8534TG9rVIAmdNU64WTzUP4hEC4SeoVKAuVS2Fyo6VlIOA38736ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0T9/NLiB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0T9/NLiB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B326C19421;
	Fri, 13 Mar 2026 17:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773422453;
	bh=tr2ly2C77tDMPqgIt4tjBLo4DHA8LRxs3CVPK/SWd6c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0T9/NLiBtqIsGatG8x9rM8yohWvdjKxl/XGhYCOGAfFZfu90DAVhPbA+7QdfSkR98
	 SKYi4lyAk2ei+yHT56y7zmLLoQvAi2fo8D+GCTeJ4ADrb/Wl3WcwTnNQigVz18nkJZ
	 54J034uiIv3f3yMbMk3+GgThXu2bmS5zHgObGrz4=
Date: Fri, 13 Mar 2026 18:20:49 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Vyacheslav Vahnenko <vahnenko2003@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: ezcap401 needs USB_QUIRK_NO_BOS to function on 10gbs usb speed
Message-ID: <2026031321-extending-monument-a47a@gregkh>
References: <2026031332-askew-policy-c4ec@gregkh>
 <20260313123638.20481-1-vahnenko2003@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313123638.20481-1-vahnenko2003@gmail.com>

On Fri, Mar 13, 2026 at 03:36:38PM +0300, Vyacheslav Vahnenko wrote:
> Add USB_QUIRK_NO_BOS for ezcap401 capture card, without it dmesg will show
> "unable to get BOS descriptor or descriptor too short"
> and "unable to read config index 0 descriptor/start: -71" errors
> and device will not able to work at full speed at 10gbs
> 
> Signed-off-by: Vyacheslav Vahnenko <vahnenko2003@gmail.com>
> ---
>  drivers/usb/core/quirks.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
> index 9e7e49712..0010f41a3 100644
> --- a/drivers/usb/core/quirks.c
> +++ b/drivers/usb/core/quirks.c
> @@ -574,6 +574,9 @@ static const struct usb_device_id usb_quirk_list[] = {
>  	/* Alcor Link AK9563 SC Reader used in 2022 Lenovo ThinkPads */
>  	{ USB_DEVICE(0x2ce3, 0x9563), .driver_info = USB_QUIRK_NO_LPM },
>  
> +	/* ezcap401 - BOS descriptor fetch hangs at SuperSpeed Plus */
> +	{ USB_DEVICE(0x32ed, 0x0401), .driver_info = USB_QUIRK_NO_BOS },
> +
>  	/* DELL USB GEN2 */
>  	{ USB_DEVICE(0x413c, 0xb062), .driver_info = USB_QUIRK_NO_LPM | USB_QUIRK_RESET_RESUME },
>  
> -- 
> 2.53.0
> 
> Thanks Greg for your patience, I'm not familiar with email stuff let alone kernel maintenance :)

Not a problem.  There was some minor issues with this one (prefix of
subject, and no v2 information), but I've fixed it up and applied it
now, thanks!

greg k-h
