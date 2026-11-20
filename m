Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795156785;
	b=ZO6HMGMKJtLzoA+Z9W7mdr5m6WQ502ZJzhUxl0lT2MRsX5oFJ401QuNz6qG+zPpmzM52
	 9DMal673qRSctRSaKJpAY806gvMZIQPBL2Bs+t0/B/iOAWLP4e2e3iceFzWqEa48xU1kc
	 +6Ukliqr3EDacnnoRukWscnPKAEOOU/D7COpRrfXX8O4b2UUGC5OH+S6MbXKAM9YAbhVS
	 JbEtQext5MVRyMabbiV0Yu87rpF3+OLHic7nHnPq/AOZuyIQm22NKYyD+bkLLbLLQ11Dd
	 ZBTo4l/eTvhOsl1cPgHrj+ThX+khWTUPHMdxHIjarsqovsyxCkhaiIXBjgBAk+PnjbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795156785;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=GsYljTWRJMlqzTweI8nKm0Ca7rBMVfo2y5KgNyfYRgM=;
	b=jp2gLAD+ZLNdBSp0CNZtjC+KHgP5SIMnOoGSIXPxn8cs8JTnJLxV2gnW7whTN8D0AsNA
	 Pe6qzvc+YP8sbpcrcNyvu2h7//WXtS1ZhtzKFOFS9vHOLKoGJ+4b4/cahKiITArTVkkS2
	 HFV1Iw58iCl+DGjoKfZIY0biIQ+MkRGD0Oo6fAKwEVQsQ4c8oMsbbChIFNYHQOOrQsKHd
	 PEO4AKB/VBdNlzCd6k4Yfl9qdJOFgJmkr8D5xgZnuKo0YoXBWaC/HszJrB3Sh8rNmPJM3
	 uVIcehRaBd8YlKqhmRp2AK8D0kfbIJr46xOBe1aIcjQPdtr2jv+89G3cintxkczcppA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b="Oz/DoVZT";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F7F606A320
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 06:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Oz/DoVZT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C443D1F000C6;
	Fri, 20 Nov 2026 06:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795156785;
	bh=GsYljTWRJMlqzTweI8nKm0Ca7rBMVfo2y5KgNyfYRgM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Oz/DoVZTEa8/f3pc1l+Jm9usFc9f2vLneWatD6PrIZcF5dEyJKbNO/Xs9YwJVdFWw
	 4P/Y03P4Y8jAT6E8TVNx6xnLIvsu1/hK6ze+Fp1Q9+u/lpGnuz3NsyNFy6XMiabsKX
	 9g4lhhVl9ECda8YHk0FKVNPV3qXQ9aE/pl7FM+fM=
Date: Fri, 20 Nov 2026 07:39:42 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Zhu Jun <zhujun2@cmss.chinamobile.com>
Cc: valentina.manea.m@gmail.com, shuah@kernel.org, i@zenithal.me,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] usbip: tools: Check allocation of exported devices
Message-ID: <2026112027-kinswoman-subsidy-276e@gregkh>
References: <20261120062111.98404-1-zhujun2@cmss.chinamobile.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120062111.98404-1-zhujun2@cmss.chinamobile.com>

On Fri, Nov 20, 2026 at 02:21:11PM +0800, Zhu Jun wrote:
> usbip_exported_device_new() dereferences edev immediately after calloc()
> without checking whether the allocation succeeded. An allocation failure
> therefore crashes the tool instead of allowing its caller to skip the
> device.
> 
> Return NULL before accessing edev when calloc() fails.
> 
> Fixes: 021aed845303 ("staging: usbip: userspace: migrate usbip_host_driver to libudev")
> Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
> ---
>  tools/usb/usbip/libsrc/usbip_host_common.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tools/usb/usbip/libsrc/usbip_host_common.c b/tools/usb/usbip/libsrc/usbip_host_common.c
> index 01599cb2fa7b..bec6c42e29c8 100644
> --- a/tools/usb/usbip/libsrc/usbip_host_common.c
> +++ b/tools/usb/usbip/libsrc/usbip_host_common.c
> @@ -71,6 +71,8 @@ struct usbip_exported_device *usbip_exported_device_new(
>  	int i;
>  
>  	edev = calloc(1, sizeof(struct usbip_exported_device));
> +	if (!edev)
> +		return NULL;

How can calloc here ever fail?

thanks,

greg k-h
