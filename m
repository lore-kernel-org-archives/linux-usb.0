Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A3B34D382
	for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 14:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791989128; cv=none; b=s3nruWTHuStQBpjqwbYoXVV7FqgEo/zS6Yt7LK+6CMXJx6k+CqgJjn+Yg6oeQ3IVm0APbOSQ14WZAcGDuDR1+bOrMbO5IfmSh0R4gZDyv/m7U24dj8u5LA+YFWbxqdasDGq9YHOncqqjJ8IOwzv8zkwqHQ6z+p9ID2dJtjy2tyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791989128; c=relaxed/simple;
	bh=Hdcxtxc7oxHmgU/85lcicWB1g727l/a7GBMxe6Grrt4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UFkeondSvJwhcQ2xC9Hpe+Z0VNDJVXbI4vaYDhWchJPj4N5My1PQjxD2Lul9zXeugcdDF6aZ8OpPO84HbXac+L+3TJ4bHb4bfKP4eio3xNODalXNUKRGfchdCzMclHiOAUogIcRTM9gC/WlhyV1Th8JY2kKBD6U+4SCi9EcgSgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=GeCQVYxT; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="GeCQVYxT"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-53440816851so4783581cf.0
        for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 07:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1791989124; x=1792593924; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pygkzeE34nESSLMFfA+HDZtxOSR6p+nlwLJRKufzmsA=;
        b=GeCQVYxTl7a6fUrUfAP/KoaogtY2DKJPFqi4y9asWZc56tzG0ryrovW++N3xhYFyEo
         qEpQj6koEBfTlyEPzD8Bf+0ZbzyjLNLyH8IQRwROjTmlkNP0alm4M6iUOJAIN2ITKC88
         4SLSb9HrBedRAaZ1RjBt9lN/+xOFS29GqDZVBybF0reN1fglqz+20F/GcdSLgagJwKxI
         IhZhCn67HPh62/ZOChK12sySoBTKmz7RzeQHh+jIRGPuHsJUB5YO2SGpl/IIk4ipxdHi
         yPbcanKjT2IDwnszdMSjKz5aXnbLHR8JgFPH/L43jHmLFfyDwQ1OC7vnLn2lOAW4oT/r
         xTCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791989124; x=1792593924;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pygkzeE34nESSLMFfA+HDZtxOSR6p+nlwLJRKufzmsA=;
        b=u7DbcDF0g3y4xvuizLAISsaIyxZ0OVrHdoZBYy8xUm0ILIFdR4LO3726ZmJ1MTygTl
         j7wm5vyiuzUCPYZF+wsdgThlBMmsZCXzHM/UQR9uwZbPgZz4cPx0pfQw9DARRhsE6bS3
         mxqBR3eyVV4ttDbOuohT0OzwXRdsRe5qkiIDJy0KXHnKrtL6JvU5ZIFmLPYhucdWmV+h
         xMNV2dsWbmnPVFaC3d2/iq1gyUHOcctOrwenjMP/SquNQ05vIf85iC2hiNA0OzjN9ztJ
         dmy4bc+ezE0xo5KYiR+vY9YKwW8b1AiLQ+3jEHU9N70pbdoOCvY8qawke6b7XfHQfJKw
         oJYg==
X-Forwarded-Encrypted: i=1; AKwUvBwk7Xm0VqJj2LZ1KsvePuOBMidvI0A2dLXvi8wDIGQZ4TOsV9hYm6n97tmPUGWiDFcyljSOvUcwdqw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIP8jEYByvaJpo9NpJ4BIfPq5tixLAg68Ytxbee1eAMmOE07HG1
	CcDv+yycUwRwMdgHaO+1C8Dloh1Sb6Lcyg0dKEEYfwgYQ9g6XYTzHMlvYn2uLeBLtA==
X-Gm-Gg: AYBFou2sVGvspczZpC6IXC34tSRCX6Ors54BgoNgUiL4mwRqU4fgZIa0E0L4edh9VNV
	s+8lpF6S6bVk3RwtPv8NzqJcxMWpagjUsHfPv4OgpUc/0Mad8j1i4A7qZwYB/qzB+OYplsm04XN
	RlZlu/rNwAF3SY+OW1vdS/Wbw9FtbUIHwqgKGyIAIIRByVEeW3gAKQ6tQWjL2fW42DeenvdqDGN
	srPOrNU9YF+N1eQhLbtYA+W31GR7CBuo/JE3+tIwaTupd8LP+jEabuS8y/EtBlucn42o8vXDdEa
	5e1TELSRFYWmsEU9lE6Kr1A8vl/7qhCBXBndXSx/5vx3l8tTAM+HkUuEEK5Ph7rHbSjd5sV9IVR
	2ABQD7rredPb5yBD/z5kSKwnsyvWMxpg5vxL2nYPLOzxfEpp63KrJEgRskA2BBZStbx+adp5XPK
	FQ+NSP4vUjFcnRrBKdRHwmVBOQpW7rraMDo2IcK9CvbxJ1ZRyIjilfekVL/KAeTyrGNm4xIhPG1
	UgTWBcV6hUgAM96HcAE14CkBDI=
X-Received: by 2002:a05:622a:22a4:b0:533:33ed:c39d with SMTP id d75a77b69052e-5359f497f48mr235877821cf.7.1791989124279;
        Wed, 14 Oct 2026 07:45:24 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b7e32cesm122425341cf.28.2026.10.14.07.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 07:45:23 -0700 (PDT)
Date: Wed, 14 Oct 2026 10:45:21 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Mihai Sain <mihai.sain@microchip.com>
Cc: gregkh@linuxfoundation.org, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: host: ehci-atmel: Use dev_dbg() for debug messages
Message-ID: <54704da1-1493-42bf-aedb-231d6d339c32@rowland.harvard.edu>
References: <20261014121656.1634-1-mihai.sain@microchip.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014121656.1634-1-mihai.sain@microchip.com>

On Wed, Oct 14, 2026 at 03:16:56PM +0300, Mihai Sain wrote:
> Use dev_dbg() instead of pr_debug() in the probe function
> to provide a more specific device message.
> This ensures the log message is properly associated with
> the corresponding platform device instance.
> 
> Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/host/ehci-atmel.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/ehci-atmel.c b/drivers/usb/host/ehci-atmel.c
> index 65747270fd88..b6ba7005be69 100644
> --- a/drivers/usb/host/ehci-atmel.c
> +++ b/drivers/usb/host/ehci-atmel.c
> @@ -99,7 +99,7 @@ static int ehci_atmel_drv_probe(struct platform_device *pdev)
>  	if (usb_disabled())
>  		return -ENODEV;
>  
> -	pr_debug("Initializing Atmel-SoC USB Host Controller\n");
> +	dev_dbg(&pdev->dev, "Initializing Atmel-SoC USB Host Controller\n");
>  
>  	irq = platform_get_irq(pdev, 0);
>  	if (irq < 0) {
> -- 
> 2.56.0
> 
