Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A9141CB39;
	Wed,  8 Jul 2026 15:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783523110; cv=none; b=UHv64p6kPuj15PiimHJhUVsfrgCfAXSeAvIYmMdqRZOEEuYxKuwAM1qLwITE4PZu3DBZMSvLMDXpfL207m2psc9+Yfyf7q/DAIGmoKwJqsyMggkHMyAHvi3qLBdGgMo35GRNQ+F23w+Uw+0s83B5KbXCg75ukcyFWUDKmiO+A/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783523110; c=relaxed/simple;
	bh=YnqOCeOPLpCplihNuNundI48iNr/xMkcTjmBb7QOvrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GyJmTye53jbW2p8gQXXHQLCFXuFECxbbUDUTgtJFDGKjKY2jEa/X4RWN+AbWrssGcNCT/lio4LTFLx7pIisiiGGca/oznFGPAuw0BWKlfdTathnWXzGVSsbju+/81hwt14/xTS3+YpE98kt0pYKEjITdin4bMbtCtDzu0C/YWyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GuN7P+4m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GuN7P+4m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C003A1F000E9;
	Wed,  8 Jul 2026 15:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783523106;
	bh=IJtxifWovh1qTV1AtbeIvw95QLmhPeAPRU+vOgVwmD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GuN7P+4mAhVkqlTNsHHK9Iee24rWzATvn2SX3hwuUgv2GdYG8prhj0kYHyEA3D5d8
	 W3jr5svCNO4Yw615N3HfnDL11qSfjxCoBXOxlEUtRtfhcXNzUMzyBcoxUMbZ/kxLz8
	 78c47409qI5TKEKNlpnRcG8WdgiFeur6iiUaSukE=
Date: Wed, 8 Jul 2026 17:05:03 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Xu Yang <xu.yang_2@oss.nxp.com>
Cc: kees@kernel.org, christophe.jaillet@wanadoo.fr, xu.yang_2@nxp.com,
	hataegu0826@gmail.com, balbi@ti.com, andrzej.p@samsung.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH] usb: gadget: f_uac1_legacy: fix inverted NULL check
 after kstrndup()
Message-ID: <2026070831-peso-aluminum-df0c@gregkh>
References: <20260625113154.1954813-1-xu.yang_2@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260625113154.1954813-1-xu.yang_2@oss.nxp.com>

On Thu, Jun 25, 2026 at 07:31:54PM +0800, Xu Yang wrote:
> From: Xu Yang <xu.yang_2@nxp.com>
> 
> kstrndup() returns NULL on allocation failure. The condition was
> checking 'if (tmp)' to detect failure, but this is inverted — it
> would treat a successful allocation as an error and return -ENOMEM
> while leaking the string, and proceed with a NULL pointer on failure.
> 
> Fix by changing the condition to 'if (!tmp)'.
> 
> Fixes: 0854611a19ae ("usb: gadget: f_uac1: add configfs support")
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-sonnet-4-6
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/usb/gadget/function/f_uac1_legacy.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/function/f_uac1_legacy.c b/drivers/usb/gadget/function/f_uac1_legacy.c
> index 5d201a2e30e7..e9f2632ce785 100644
> --- a/drivers/usb/gadget/function/f_uac1_legacy.c
> +++ b/drivers/usb/gadget/function/f_uac1_legacy.c
> @@ -914,7 +914,7 @@ static ssize_t f_uac1_opts_##name##_store(struct config_item *item,	\
>  		goto end;						\
>  									\
>  	tmp = kstrndup(page, len, GFP_KERNEL);				\
> -	if (tmp) {							\
> +	if (!tmp) {							\
>  		ret = -ENOMEM;						\
>  		goto end;						\
>  	}								\
> -- 
> 2.34.1
> 
> 

So this has never worked?  How has no one ever noticed that in the
decade this has been in the kernel?  Does that mean that no one uses
this file/driver and we can just remove it?

thanks,

greg k-h
