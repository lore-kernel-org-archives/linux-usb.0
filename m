Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC4C421EE6;
	Fri, 10 Jul 2026 13:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783689438; cv=none; b=Rhi5aNGnqWE6cZ2NC7MVxN/F0sTGz65+lCUNqoqjqiNL/yFPfN9jBmxxgBO/nHBRqeTqaAsipcT5dkDAFMZOoSyOD+me8g4KVhGwNcXl6ke3nt1f7nQbFg+dz8Z0U7CKLHldbCHmdeZxwgNIT4y7r5K4Unz45l2sQo6dQFt6r2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783689438; c=relaxed/simple;
	bh=2oQkVMoL0QXPPLqSUQoiwRnY+sbpIOD/3uVxJSSGfiU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LvwBwo9stsrU+PcxnKi5A9MqcEcuZI10dkG/8uAtKmA4XqZ/9P913jqMS5XC1zzf2g8jmHBwC5qhZTVRy4LrKewHwa44kU/bCwpK4/QaixD13giwuGoy/Yls/PBGQJVuPIs/tYJwft2cMDHp2lL2MrcDliEyfr1ivJY/4uXK5D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=s+zq6Z+6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="s+zq6Z+6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 113021F000E9;
	Fri, 10 Jul 2026 13:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783689436;
	bh=+nYP7CjrY+3szsPUQrIDMb/Ipdkfpw3EQZSw4BDdjPI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=s+zq6Z+6eDayTaTZYGcUY57FltFrnTQlmULaKgC8lbPOHD4naiUWoG9CFoVzlsREq
	 35WSWNzTcwcs5u+PqqFMUQn31PUhP8aIwz6ud8R0rKrpE5ZN84+c+6mEj404KbGdgM
	 PgL1yHeSbLsvEJCxA0mZwnIEcKj+w4hip03Z1g7Y=
Date: Fri, 10 Jul 2026 15:17:12 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Kees Cook <kees@kernel.org>, Duoming Zhou <duoming@zju.edu.cn>,
	Li Yang <leoyang.li@nxp.com>, Anatolij Gustschin <agust@denx.de>,
	linux-usb@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: phy: fsl-usb: clear fsl_otg_dev after freeing it
Message-ID: <2026071054-cranial-manor-b4b6@gregkh>
References: <20260708064549.719147-1-lgs201920130244@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708064549.719147-1-lgs201920130244@gmail.com>

On Wed, Jul 08, 2026 at 02:45:49PM +0800, Guangshuo Li wrote:
> fsl_otg_dev is a file-scoped singleton pointer and is used by
> fsl_otg_conf() to decide whether the OTG device has already been
> initialized.
> 
> fsl_otg_remove() frees fsl_otg_dev but leaves the global pointer
> unchanged. A later bind can therefore see a non-NULL dangling pointer,
> skip initialization, and continue using freed memory through the global
> fsl_otg_dev pointer.
> 
> Clear fsl_otg_dev after freeing it so that a later probe does not treat a
> dangling pointer as an initialized device.
> 
> Fixes: 0807c500a1a6 ("USB: add Freescale USB OTG Transceiver driver")
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
>  drivers/usb/phy/phy-fsl-usb.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/phy/phy-fsl-usb.c b/drivers/usb/phy/phy-fsl-usb.c
> index 35d79f11b03d..0b5e937633f4 100644
> --- a/drivers/usb/phy/phy-fsl-usb.c
> +++ b/drivers/usb/phy/phy-fsl-usb.c
> @@ -997,6 +997,7 @@ static void fsl_otg_remove(struct platform_device *pdev)
>  	fsl_otg_uninit_timers();
>  	kfree(fsl_otg_dev->phy.otg);
>  	kfree(fsl_otg_dev);
> +	fsl_otg_dev = NULL;
>  
>  	if (pdata->exit)
>  		pdata->exit(pdev);
> -- 
> 2.43.0
> 
> 

For all of these patches, you have to document that you use an LLM.
Please resend them all with that information.

thanks,
greg k-h
