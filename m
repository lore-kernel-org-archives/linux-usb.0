Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4313D8131
	for <linux-usb@vger.kernel.org>; Thu,  6 Aug 2026 06:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785997067; cv=none; b=qNnSFLbe0WEYzacxrX1HcS/YIglU/5ZgF1YDRwbePXYhbrGQK5CfB7UGXFRyZOIzBJ2t0hpQLR2CCo/67lBJOTR61Zfru1+mQCD4g5ZGRT58dc67JPtCr308ZtIiBw6DcI4u8TdRedKjqddbN5cGelpR1RDk8seXxJ3Cbyx+x6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785997067; c=relaxed/simple;
	bh=37iivapQ00/YyEL1AvbR3E8BhoYGIxOUBMwOeo1+2cw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l27LeMlkCQIzkJRlO7YPLOr2Ay7GukCKUHe23kyUBqs+a7ftMcL2mXjf3UYLIG+8lIAoOnq5zwvDfX0lrCQXTMNUBnYI7kBCp06/LpGXC0uhellcLKd/Qz8VfMviDtod+leNhaLhpWVJPwvbxVNmqP5bJGAcbGAr9Lc/saGt4A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=W7qTC75X; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="W7qTC75X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB8A31F000E9;
	Thu,  6 Aug 2026 06:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785997066;
	bh=Wj1ZfPdeCtpc/N6JP64tm6/t1y5lewgjdiheVyn6YoU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=W7qTC75XX5CcxVUt3USgZxJ57nIcMYCJb9G+D/XPJWClJ1PxrkFalD7TbcnHeTIPh
	 55DwBJzZqn5vD3V/a7ATaR0DG6/GL9Y1n6f/IhUdKRk/pxndOyHQv1//7iBjrewVQf
	 OhZX2vZ2b1EMnaK32BgLt6YasSIixkFK00OBQJi4=
Date: Thu, 6 Aug 2026 08:16:16 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Hongyan Xu <getshell@seu.edu.cn>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	jianhao.xu@seu.edu.cn
Subject: Re: [PATCH] usb: host: ehci-atmel: stop clocks before releasing HCD
Message-ID: <2026080610-easter-unwieldy-57ea@gregkh>
References: <20260806060557.1747-1-getshell@seu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806060557.1747-1-getshell@seu.edu.cn>

On Thu, Aug 06, 2026 at 02:05:57PM +0800, Hongyan Xu wrote:
> usb_put_hcd() drops the driver's HCD reference and can free the HCD and its
> private data. The remove callback then calls atmel_stop_ehci(), which
> obtains that HCD from platform data and dereferences its private data to
> disable the clocks.
> 
> Stop the controller clocks before dropping the HCD reference so that
> atmel_stop_ehci() cannot access an already freed HCD.
> 
> Fixes: 501c9c0802d9 ("USB: at91: Add USB EHCI driver for at91sam9g45 series")
> Signed-off-by: Hongyan Xu <getshell@seu.edu.cn>
> ---
>  drivers/usb/host/ehci-atmel.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/host/ehci-atmel.c b/drivers/usb/host/ehci-atmel.c
> index 65747270fd88..bcd56f888ec9 100644
> --- a/drivers/usb/host/ehci-atmel.c
> +++ b/drivers/usb/host/ehci-atmel.c
> @@ -177,9 +177,8 @@ static void ehci_atmel_drv_remove(struct platform_device *pdev)
>  	struct usb_hcd *hcd = platform_get_drvdata(pdev);
>  
>  	usb_remove_hcd(hcd);
> -	usb_put_hcd(hcd);
> -
>  	atmel_stop_ehci(pdev);
> +	usb_put_hcd(hcd);
>  }
>  
>  static int __maybe_unused ehci_atmel_drv_suspend(struct device *dev)
> -- 
> 2.50.1.windows.1
> 
> 

How was this tested?
