Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16813DBD59
	for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 17:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777309267; cv=none; b=WRpZoS1d5i+Mndru7Ep9T/RlnrRZZZbLuq9DzS03CvTWu30cZpZZHYViYjMLKCi7FvtUtHSRyW6txtVvUzm1SThguwDrI2WMDmNivQ/GLlOQndyXW2XotZSmAZOq5wo3R32P5OevwsjpTQbNX5PJ0kKU5Y0+BeT7F65bySgv3Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777309267; c=relaxed/simple;
	bh=pacyqXrJb+QD6vWxFL2HI6p/62pewGR8xTCIDlVEmKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mATrri2yIxsqPLn7GWxUfOzEAOjMz0no3phVabayjt2NHtpSYFmcIo9ZxxPPQVvVej26+sHgoFQXtsKc6FPlUyGKEwCfPRYNsNinjHtcv8JeR2Qd9uANp973b3az6Lg33IEdP5ABPsaDWgatueHjguun8U+tEWs4wj4hpJEK39c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=ulMWtvDi; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="ulMWtvDi"
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-953a2a4761cso5428243241.1
        for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 10:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1777309264; x=1777914064; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KdmGrxzHwwSFvziMDFmAGnpnOEmYArtlK4bqqD+AiPk=;
        b=ulMWtvDiilG+gQPQvi+xruQnbNOGKxAcg+bgjtdp0/a7JrjOqpupYLm0hiuZ+lXyd4
         CZHTOyZubFTzvZDlZXKktEE3fenVciwDfRneCm26g3I+POitpDvnLBs2gEeAwuLwZsPA
         z8BXXe8KG0b3+uLWyfShXa83/WndMVtYPqHICP7oXobmXPYdCcArUgMPCbAN3WMcwtUn
         qbdMzS730aepO482I0g1t3NogxhXMAhTdKIJzefHKgi39etg+pymrdaP98NqL1y/albE
         lKxKmHp0ts91IXoBDWGFzNkQMp8E0G32Bwb9YI5IA4U7kDh2dOgSeXibJqYl42ockU5y
         Ux0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777309264; x=1777914064;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KdmGrxzHwwSFvziMDFmAGnpnOEmYArtlK4bqqD+AiPk=;
        b=MdVSsCF8N1ecaFCwRFjAcBsGoc5KLQjQEIVEmE/1dPVo8a/7BC/NB+y871LwOgUM73
         9QnRpljYUnritw6+X2k5gigTivYW8UsCWP2X9e9DWhQ/H/BjF5HVfktDxnxNgdMpDu6S
         VzHcqpxdBwWsOhRhmjyofEjddoJBHRvXQP/Om+uc2+kxzBq1pWjGReflakSzeQ4im4pv
         h4UpPOYmynD1A0zQXloeAszmT91j66WDtBuVBIr0sGbbk/9JSh3dcm4KzbpsovJTnaF3
         UJvcFFFx7Us91Cu+TRv/Zy5cnUTwJV2u7ecOv913Otxxl1XVnSlWHfCiK+kvx4BoFC9X
         CjaA==
X-Forwarded-Encrypted: i=1; AFNElJ/mUciL5IgdUoDMl37jpqobEQuOVfpfXd9h5EAzsyg9TKzQRbZhhQC/7mNrnPf32H21Zfvs3bNammQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiXEtbVDoq4R49HijQwg3NVnkMZvFSaVrb/rf4BkF2msUnDizP
	md/BQFip2Oaf6E0pTTCze4g5+R1Ev+0HZ+hbWzT7WQX6HsHdFQjcI2qtikGvktZSpA==
X-Gm-Gg: AeBDieuv4eAGZd9U8R0QSTTlMN8XjQ2t4YILcxVnl6YChx5bfpPqGsNRSGvbXy9TlIp
	bcuInczpFtTlaszbgV70CZ7svVYNiYIdZtvSfewI6tuIHZ7N8/ZXVJeCAa06Uk82xAgF7+sykyc
	zTcPZRZwbEu9Vbwkj6KfDnTzElReYfveGYKCJltzKA3sh33N8cqxKgT5sS5cyqCX9fyl48yQAHR
	Ud/0UKF5CSktI3bKEL9fNGFKPz2JE8+gEVLYH8HV9uQHGk5PvtvkwdQ4CrFjM9rZMHzqGfpLn7I
	SXkJNAo1HRN6YrEafNUmb8q3kwYjw8zyCzBmd1jNLejvL4C3NNYZgFalUnOcs98ryuKUH9KaUWK
	0nGFxAJH33PL4YXb3STFV7OBI6B+T1gBCA0oD156WyzZDfQWWxPI5EopYOnS41EMS7vfFv+iiXB
	3uJj+1R/trdTVxYUEhnWTLh9n3imSD0za8TvmelWOFNAv+6OrPrJcIIAVnSh6QoAVN9pwiB3UfI
	u+1Og==
X-Received: by 2002:a05:6102:dcd:b0:610:6e69:5235 with SMTP id ada2fe7eead31-627d55c69efmr111775137.22.1777309260365;
        Mon, 27 Apr 2026 10:01:00 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:349c:f507:d5eb:5d9e])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8e7d9abce59sm3155409985a.46.2026.04.27.10.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:00:59 -0700 (PDT)
Date: Mon, 27 Apr 2026 13:00:57 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <kees@kernel.org>, Chen Ni <nichen@iscas.ac.cn>,
	Felipe Balbi <balbi@kernel.org>, Peter Chen <peter.chen@nxp.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] usb: gadget: net2280: Fix double free in probe error
 path
Message-ID: <8d5e84a2-326d-4586-8802-553503f940da@rowland.harvard.edu>
References: <20260427153651.337846-1-lgs201920130244@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427153651.337846-1-lgs201920130244@gmail.com>

On Mon, Apr 27, 2026 at 11:36:51PM +0800, Guangshuo Li wrote:
> usb_initialize_gadget() installs gadget_release() as the release
> callback for the embedded gadget device.  The struct net2280 instance is
> therefore released through gadget_release() when the gadget device's last
> reference is dropped.
> 
> The probe error path calls net2280_remove(), which tears down the
> partially initialized device and drops the gadget reference with
> usb_put_gadget().  Calling kfree(dev) afterwards can free the same object
> again.
> 
> Drop the explicit kfree() and let the gadget device release callback
> handle the final free.  This issue was found by a static analysis tool
> I am developing.
> 
> Fixes: f770fbec4165 ("USB: UDC: net2280: Fix memory leaks")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

> v2:
>   - Remove the unnecessary braces around the single-statement if block.
>   - Correct the Fixes tag to f770fbec4165.
> 
>  drivers/usb/gadget/udc/net2280.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/net2280.c b/drivers/usb/gadget/udc/net2280.c
> index d02765bd49ce..7c5f30cfd24d 100644
> --- a/drivers/usb/gadget/udc/net2280.c
> +++ b/drivers/usb/gadget/udc/net2280.c
> @@ -3790,10 +3790,8 @@ static int net2280_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  	return 0;
>  
>  done:
> -	if (dev) {
> +	if (dev)
>  		net2280_remove(pdev);
> -		kfree(dev);
> -	}
>  	return retval;
>  }
>  
> -- 
> 2.43.0
> 
