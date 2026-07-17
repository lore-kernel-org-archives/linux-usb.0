Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885FC390608;
	Fri, 17 Jul 2026 09:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784281473; cv=none; b=gGQYruGb7TGfA2CfKAOUoi9HBoVExe3mrqHcXeMlzTHo1uvAaJmnmHS5G3S1wZBi+6obsPkG3tjbfMVSSxT588OAzWn48JY8dS6h2CWWFpmkwu2h0yyAZ7XqPgkj3bXTgkKVuZtU2TENPor3rIbwFmfL0wDoIR2j1F4Jci2a9UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784281473; c=relaxed/simple;
	bh=RYTe/Y7cbJt76CkVJwaNuVI41mBRB7u6vYdx2C2BXZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XkaTpas/581hVy/U8tICh/DUMu6+xZsXBzzXNdrzSG6TgP0KFZp7o4OpilALp4NfJZb1TGridTFubVud3kKNxWC2X8Cq+J6zX0Q+KvjgZs8VxaCdO83epR0B2QT0IZPp3ITXeduVZGHqkzjc1DfXoBvaEd9FssKnSXGc6FVd8PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Ts3xZ1/h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Ts3xZ1/h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B0541F000E9;
	Fri, 17 Jul 2026 09:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784281470;
	bh=Iekj/UdlANyeEnC+k/Eca69pjw7NEMFAk99gzlJO46Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ts3xZ1/hAcKeM/8UEFYwmdpdjPegSsXDTDOV7r0drYDmmQMzErM5kT87bbTJoCfZV
	 VCOB0mFqoiOZ1Vzeh94nZCVM3pwVgmiz8dCQNqAXGUKi7lkx9A5UJhvx5Vk2g6enot
	 ZCYM9i4rGL6J01m23zXooNovUCAzyv+n6C/qF6oM=
Date: Fri, 17 Jul 2026 11:44:23 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Bin Liu <b-liu@ti.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: musb: da8xx: depopulate OF children on teardown
Message-ID: <2026071745-award-affair-a332@gregkh>
References: <20260715135916.24417-4-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715135916.24417-4-pengpeng@iscas.ac.cn>

On Wed, Jul 15, 2026 at 09:57:50PM +0800, Pengpeng Hou wrote:
> da8xx_probe() populates OF child devices before registering the MUSB
> platform device. If the later MUSB device registration fails, those
> children remain registered. The remove path also leaves the populated
> children behind.
> 
> Depopulate the children when MUSB device registration fails and after
> unregistering the MUSB device during remove.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
> Changes since v1: https://lore.kernel.org/all/20260616005819.11232-1-pengpeng@iscas.ac.cn/
> - keep the existing of_platform_populate() error unwind target, so both
>   labels remain used and the patch does not introduce an unused-label
>   warning
> - limit the commit message to paths where population has succeeded
> ---
>  drivers/usb/musb/da8xx.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/musb/da8xx.c b/drivers/usb/musb/da8xx.c
> index 4209f43..0c098a4 100644
> --- a/drivers/usb/musb/da8xx.c
> +++ b/drivers/usb/musb/da8xx.c
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

This implies that this has always been a bug for the normal remove path?
How has this never shown up anywhere?

So shouldn't this be 2 different patches, there are 2 different bugs
here, right?

thanks,

greg k-h
