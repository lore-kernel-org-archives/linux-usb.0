Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9E13D75AB
	for <linux-usb@vger.kernel.org>; Thu,  6 Aug 2026 06:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785997056; cv=none; b=INkZ4xIAXqxae28TidkXZkycTVD9wC/lOUtbiiCXMwl2V9rxNNY7p1Azy+cpw7jHIoMdxDrY/gHNBrsnK+V+Yf8AXB4L/3zlnA0D/gTM9oFVKDyWEO2Zo1pkPWpjwr9OK42oAR2ucdADB79qgXTpa4lYjZIauWU7DqPCWt9Gees=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785997056; c=relaxed/simple;
	bh=Q4UZ0BrS/xFvHBhpOjVrZnv2S3mIozAfUWMMBRUGTe8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rNE7N5MNzo07NB+Jza3k4mywD1sj5Ph28+swi4AON3z08g9eRmqJHlTYER7rCBtuFzXLcfKoTU5kb+l8cGiPu2uD2kLbyG32UvPZGMPtmsCOCFORF+ixJGktg0XFIee7nH5vZz6/FhkdzOHHJlV0rIt4CnfMC3pX65XdWJRr0gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=MlabXB9G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MlabXB9G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76A041F000E9;
	Thu,  6 Aug 2026 06:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785997055;
	bh=yS21yTI0rcv51Q8aavyyNBBsDmumFL7yWEF67ieXDWs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MlabXB9GKBJudzWrLBOKy7SdTB1UCvv7NV3CG46IrpYrWpZnQyaJY8SdScJZ/Qznj
	 bU+0tnDmp6WKcrhPz9eVCmpbzOH4eDruOsJatfYd2tRy+jnix9U+AIDbUM/u8JVO1m
	 LAsvxlt0aiK2mtZZepbhus13Qqm4wfIO5nxOkIuU=
Date: Thu, 6 Aug 2026 08:16:04 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Hongyan Xu <getshell@seu.edu.cn>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	jianhao.xu@seu.edu.cn
Subject: Re: [PATCH] usb: host: ehci-atmel: stop clocks before releasing HCD
Message-ID: <2026080623-flatworm-stagnate-82f2@gregkh>
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

You just sent a bunch of obviously-llm-helped patches without properly
attributing that.  Please resend new versions with the correct
information, AND correctly cc: the stable tree for when you have Fixes:
tags like this.

thanks,

greg k-h
