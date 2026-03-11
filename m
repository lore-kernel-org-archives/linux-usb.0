Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F474253F05;
	Wed, 11 Mar 2026 12:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773233402; cv=none; b=Ckun+sollrK/3+Wbo31e1cVis77WAF3qt3jBwWbMErGFvwiiznE7qfaXlgz+1wM7GaR0B9OdCNxx/TMy8scnWAKasRlOagHmla3drdrHem87ppWn8RLN07pzzi44WOm7TbjUBcP8/OPJnYld87Hg0ISgZ4YMGSl4HjgrzbZlS/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773233402; c=relaxed/simple;
	bh=kxPCuvdNEnkzNAjp8+TtDPAZ9af/uDvRdoOgg4nyBVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jx5Z9/myCQxqD4WMdV2Xzjb8W9RoaFS6zIkg4IZzhFhUP5W3LgiVVjuCaSwSetxkxYOYoT+SzzdSHE43AKHCDpNYZB+NpuUO/o1jIY4nvVndl3ZNdYXgnR+YOjA2m1YVCDBBTf/Gq9w3T3y9NhzYUaP6ZjCrdV7RVOBkrW0SRvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=neMmdF8q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="neMmdF8q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D723C4CEF7;
	Wed, 11 Mar 2026 12:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773233402;
	bh=kxPCuvdNEnkzNAjp8+TtDPAZ9af/uDvRdoOgg4nyBVc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=neMmdF8qjeMinBQ21v1cemNCfQtIYDbqLeQm8gF35825nJsHpIFdqqRLGtgQp1ITn
	 YlSAkM280PzSQheRArdq6013NjzH6N0fDBaxXn144mHlkQzVwYbnozRorqQFNnoCfA
	 UaiS9TVIw3C8SoJT8eybhbFHSw6Hnb0dj4NttPw4=
Date: Wed, 11 Mar 2026 13:49:58 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Zhaoyang Yu <2426767509@qq.com>
Cc: sergei.shtylyov@gmail.com, daniel@zonque.org, haojian.zhuang@gmail.com,
	robert.jarzmik@free.fr, linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: pxa27x_udc: check return value of clk_enable
Message-ID: <2026031128-gumminess-reach-c45d@gregkh>
References: <tencent_358DF7F3BD49A6407C17B7B26307A3B0AC0A@qq.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_358DF7F3BD49A6407C17B7B26307A3B0AC0A@qq.com>

On Sun, Mar 01, 2026 at 04:55:53PM +0000, Zhaoyang Yu wrote:
> clk_enable() may fail according to the API contract.
> Previously, udc_enable() ignored its return value.
> This patch checks the return value and logs an error
> without continuing initialization if clk_enable fails.
> 
> Signed-off-by: Zhaoyang Yu <2426767509@qq.com>
> ---
>  drivers/usb/gadget/udc/pxa27x_udc.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/udc/pxa27x_udc.c b/drivers/usb/gadget/udc/pxa27x_udc.c
> index 897f53601b5b..006d6d0a5f9a 100644
> --- a/drivers/usb/gadget/udc/pxa27x_udc.c
> +++ b/drivers/usb/gadget/udc/pxa27x_udc.c
> @@ -1693,10 +1693,16 @@ static void udc_init_data(struct pxa_udc *dev)
>   */
>  static void udc_enable(struct pxa_udc *udc)
>  {
> +	int ret;
> +
>  	if (udc->enabled)
>  		return;
>  
> -	clk_enable(udc->clk);
> +	ret = clk_enable(udc->clk);
> +	if (ret) {
> +		dev_err(udc->dev, "clk_enable failed: %d\n", ret);
> +		return;
> +	}

If this can fail, it should return an error to the caller and it should
be handled properly there.

Also, this is a v2 patch, but you did not label it as such :(

thanks,

greg k-h
