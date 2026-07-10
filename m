Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066441DB13A;
	Fri, 10 Jul 2026 13:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783688626; cv=none; b=bvQX0Z0ukrbf8LzxomZHmLCegz8dV46Xoc+qXNXazcoLdIAPLUXO2+cVcCdwB4awmdxLsxxTsuKuMjD24rrD7DiTfE2aEv6wXf+nC/EazOicQd+469QUv928zQkqSzJOupM4ItHTglvbhFtnOwTZ0lmcIi2OoowBwIMhHBHxmFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783688626; c=relaxed/simple;
	bh=KN0LfKc6xRA2aIKO3OPkRXrFw1s1WLN0Jwts0REDXlY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vx66hpD4h0qrkknG293JP+faPvxZhkXgsme+GUrU39Ii0AEGrolAGxS9FqQKs/PhUkY4pts+GE+29EorBa9gSLXsSOo1CelFAdfnUPdcpZriOocCVRMutq+uC9M2vXTN4sYx3WKzrdJeq6YL38cNe6GvqhTbaQcZ5K+ux/W/j6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=RsnMtZUU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="RsnMtZUU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 036E31F000E9;
	Fri, 10 Jul 2026 13:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783688624;
	bh=o9Wl9vWOlrLTb7pToSLd3YFeIerP/Le9euyFNoI1nyA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RsnMtZUUR9+kX/weHv7B9kvcyPqY0bNeF0a0o0SwjP0IU5j+h4QIoBfj2g/1PC6Td
	 BF2AL6l++Bh5Sw0YsbC/LzzeI/iSonQL4w3PxpF4amaoJljO7AoTLGwn5Q2tb7g54U
	 60w69qRMTXbHLdz7M7gjrWuoPJqClZBNQZUl5k38=
Date: Fri, 10 Jul 2026 15:03:40 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Bin Liu <b-liu@ti.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: musb: da8xx: depopulate OF children on teardown
Message-ID: <2026071031-regulate-exclude-8d30@gregkh>
References: <20260616005819.11232-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260616005819.11232-1-pengpeng@iscas.ac.cn>

On Tue, Jun 16, 2026 at 08:58:19AM +0800, Pengpeng Hou wrote:
> da8xx_probe() populates OF child devices before registering the MUSB
> platform device.  If population partially succeeds and then reports an
> error, or if the later MUSB device registration fails, the already-created
> OF children are left behind.
> 
> Depopulate the OF children on these probe failure paths and during remove
> before unregistering the generic USB PHY, keeping the child-device
> lifetime paired with the parent glue device.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>  drivers/usb/musb/da8xx.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/musb/da8xx.c b/drivers/usb/musb/da8xx.c
> index 4209f438ba18..af05c4bcb43c 100644
> --- a/drivers/usb/musb/da8xx.c
> +++ b/drivers/usb/musb/da8xx.c
> @@ -562,7 +562,7 @@ static int da8xx_probe(struct platform_device *pdev)
>  	ret = of_platform_populate(pdev->dev.of_node, NULL,
>  				   da8xx_auxdata_lookup, &pdev->dev);
>  	if (ret)
> -		goto err_unregister_phy;
> +		goto err_depopulate;
>  
>  	pinfo = da8xx_dev_info;
>  	pinfo.parent = &pdev->dev;
> @@ -577,11 +577,13 @@ static int da8xx_probe(struct platform_device *pdev)
>  	ret = PTR_ERR_OR_ZERO(glue->musb);
>  	if (ret) {
>  		dev_err(&pdev->dev, "failed to register musb device: %d\n", ret);
> -		goto err_unregister_phy;
> +		goto err_depopulate;
>  	}
>  
>  	return 0;
>  
> +err_depopulate:
> +	of_platform_depopulate(&pdev->dev);
>  err_unregister_phy:
>  	usb_phy_generic_unregister(glue->usb_phy);
>  	return ret;
> @@ -592,6 +594,7 @@ static void da8xx_remove(struct platform_device *pdev)
>  	struct da8xx_glue		*glue = platform_get_drvdata(pdev);
>  
>  	platform_device_unregister(glue->musb);
> +	of_platform_depopulate(&pdev->dev);
>  	usb_phy_generic_unregister(glue->usb_phy);
>  }
>  
> -- 
> 2.50.1 (Apple Git-155)
> 

This results in a build warning now, right?

Please fix.

thanks,

greg k-h
