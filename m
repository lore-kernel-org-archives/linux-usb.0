Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C072E11B9;
	Thu, 25 Jun 2026 14:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782399400; cv=none; b=BAFPESUjSrTAEUZ+yCF3y+aBOW5TrtLaBSRWzJwPWoqENhjjzCqqVYMPSZC4Vbmt+A3CCD/R7hITWVPgugIp6DOc3DXhLa2V8tvouQkYQh7wAkLTnuYFmGzjjPONuoHVl1dLp97YqnM0NYf7eFyoxq+j/JJXf9C3VZGNZel1Hck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782399400; c=relaxed/simple;
	bh=uz7HktKOTXe/0HFaltcv0ttPQM80fVGrVhVlWrSvGMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hvai2Ekyb2iCfNBnQqsio5yXpk7OuWqlFxorBJILySRPjCuVQnaikkI+qmIOzpnN8U54Per3PEUMt/2LLfZoJOiyBKhGo8s7iOyq11C7IkscqYcbrx9Z2/HjGndD0OqCUXkf3BWEai3QyZRghXu19peuu3AmsNZThcb7N0x1zOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=1JVLv8/W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1JVLv8/W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E07811F000E9;
	Thu, 25 Jun 2026 14:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1782399399;
	bh=80z3qdr1Ri+GX2ZpVWhKDkBHRsxbX1EdK+IIUrsw1PQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=1JVLv8/WnfpoZFLRt1IedSCno2nVh7GfnUOghogiyIdavCxO010sXTVaR4HjLN1pJ
	 vvD05dPJ2xkc82p4EMxHBNpYtT6g9nV2QGdm4HaDDMJ4Jssw8SCB+LUfl9OvYpdDQ9
	 fitTkeZQYduCvUQiyrBMgiUXDuw9weqri26lR6u4=
Date: Thu, 25 Jun 2026 15:55:27 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Haoxiang Li <haoxiang_li2024@163.com>
Cc: kees@kernel.org, balbi@ti.com, sebastian@breakpoint.cc,
	linux-usb@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, stable@kernel.org
Subject: Re: [PATCH] usb: gadget: fsl_qe_udc: fix gadget lifetime on
 registration failure
Message-ID: <2026062552-danger-slug-bc0d@gregkh>
References: <20260622140610.1140558-1-haoxiang_li2024@163.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622140610.1140558-1-haoxiang_li2024@163.com>

On Mon, Jun 22, 2026 at 10:06:10PM +0800, Haoxiang Li wrote:
> usb_add_gadget_udc_release() drops the gadget device reference when
> registration fails. This invokes qe_udc_release() while qe_udc_probe()
> is still unwinding. Since udc->done is not initialized during probe,
> the release callback dereferences NULL in complete(). It also frees
> the qe_udc object before the remaining probe cleanup accesses it,
> resulting in use-after-free and double-free risks.
> 
> Initialize the gadget device explicitly and register it with
> usb_add_gadget(), which leaves the gadget reference owned by the
> driver on failure. Unwind the IRQ, DMA mappings, endpoint resources
> and registers before dropping that reference with usb_put_gadget().
> Make the completion notification conditional because it is only
> installed by the remove path.
> 
> Similarly, use usb_del_gadget() during removal so the final gadget
> reference remains held while the controller resources are released.
> Set the completion pointer immediately before dropping the reference,
> then wait for the release callback to finish.
> 
> Fixes: d77c1198666d ("usb: gadget: fsl_qe_udc: convert to new style start/stop")
> Cc: stable@kernel.org
> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
> ---
>  drivers/usb/gadget/udc/fsl_qe_udc.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/fsl_qe_udc.c b/drivers/usb/gadget/udc/fsl_qe_udc.c
> index bf87285ad13c..f9a59b32e272 100644
> --- a/drivers/usb/gadget/udc/fsl_qe_udc.c
> +++ b/drivers/usb/gadget/udc/fsl_qe_udc.c
> @@ -2459,7 +2459,9 @@ static void qe_udc_release(struct device *dev)
>  	struct qe_udc *udc = container_of(dev, struct qe_udc, gadget.dev);
>  	int i;
>  
> -	complete(udc->done);
> +	if (udc->done)
> +		complete(udc->done);
> +
>  	cpm_muram_free(cpm_muram_offset(udc->ep_param[0]));
>  	for (i = 0; i < USB_MAX_ENDPOINTS; i++)
>  		udc->ep_param[i] = NULL;
> @@ -2489,6 +2491,9 @@ static int qe_udc_probe(struct platform_device *ofdev)
>  		return -ENOMEM;
>  	}
>  
> +	usb_initialize_gadget(&ofdev->dev, &udc->gadget,
> +						qe_udc_release);

Odd coding style, why not just one line?

thanks,

greg k-h
