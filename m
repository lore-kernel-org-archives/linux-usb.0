Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0A94582F6;
	Thu,  6 Aug 2026 10:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786011774; cv=none; b=aRcoFKvAAQUQ7fdQGMWdkWBg2Fn88UhgReyMz7Ca08g0Zkka9jN7Y/vWb3mIr+mwSuiJgxzyi+67NzpahZDfWbCRaesi6qti4pcNpZ9itVb88Bk4jd6eKE24PB8aB09rscwRWstUzOQ0Bl/h7LlMs851gAlJZctVlW5B2xk1MKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786011774; c=relaxed/simple;
	bh=MIGPVbnN8ESBVQVOS+J4aIEpAggj6MK5TovW6dV+5Xs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZyFOuvtvF/IeUCd9jGErSiZhC9xkHC82B5Xq7x4rm+/K4Wa+3emfDYvdl4kjX8VBFM5MMziN/eElDtyRFtGigK3tSKOvDkRDEfouMsDnuMohklDmHexeAEvp6Cd17IqhFMnmCzl5prkVUZKgdiy+u6kHVRltq5RAAGY3pXbMG5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f1tHULtn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f1tHULtn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64BE11F000E9;
	Thu,  6 Aug 2026 10:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786011773;
	bh=y/X2+qsEtpGJnngE5H735HwoMa+3ALu+5ZFSCcmI/3w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=f1tHULtnPSgQ9aqY22bhDq9qa7DNMaTt+LtM5hR0WX/gXwP7d+A1eZZXQs45vrKhp
	 fvzjQS5K5OcAP1+ezypSqCb62fFiLnpMl1dRPvgJTouZ3fHRam1zyFfuQvk93wxUj4
	 92P5Dei657m1V6gqDzERIWtSuP34vcgq4kdoi+YUar9ymPszcJw9un4OaqN5NR+6Bc
	 qfe+b91d/mcviGR3bKy96FSbbJW243TIUuYKLjLiYhp0qjQVvJkxFmZjotrUs4SSdk
	 JC1aw9gI2xwBml6hSRDQAXa8urkAhrwPTCnzGhAUVqJTBhTB8kEuPkwI3n0hseHLyl
	 ZgYfXgMLDhteQ==
Date: Thu, 6 Aug 2026 15:52:49 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Vincent Shih <vincent.sunplus@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-usb@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: sunplus: fix crash when the disc_vol nvmem cell is
 missing
Message-ID: <anRgefttPEDmKzjm@vaman>
References: <20260804-sunplus-v1-1-79f52226cb50@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804-sunplus-v1-1-79f52226cb50@gmail.com>

On 04-08-26, 21:58, Felix Gu wrote:

Where is the crash report?
Patch title should document the change not the reason, please read the
documentation on how to create patches

> nvmem_cell_get() can fail with errors other than -EPROBE_DEFER, but
> update_disc_vol() only handled -EPROBE_DEFER and then called
> nvmem_cell_read() with the error pointer, crashing the kernel.
> 
> Fall back to the default disconnect voltage on a failed cell lookup,
> and free the buffer returned by nvmem_cell_read().
> 
> Fixes: 99d9ccd97385 ("phy: usb: Add USB2.0 phy driver for Sunplus SP7021")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> ---
>  drivers/phy/sunplus/phy-sunplus-usb2.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/phy/sunplus/phy-sunplus-usb2.c b/drivers/phy/sunplus/phy-sunplus-usb2.c
> index 637a5fbae6d9..94146118e9c2 100644
> --- a/drivers/phy/sunplus/phy-sunplus-usb2.c
> +++ b/drivers/phy/sunplus/phy-sunplus-usb2.c
> @@ -81,12 +81,13 @@ static int update_disc_vol(struct sp_usbphy *usbphy)
>  	char *disc_name = "disc_vol";
>  	ssize_t otp_l = 0;
>  	char *otp_v;
> -	u32 val, set;
> +	u32 val, set = OTP_DISC_LEVEL_DEFAULT;
>  
>  	cell = nvmem_cell_get(usbphy->dev, disc_name);
> -	if (IS_ERR_OR_NULL(cell)) {
> +	if (IS_ERR(cell)) {
>  		if (PTR_ERR(cell) == -EPROBE_DEFER)
>  			return -EPROBE_DEFER;
> +		goto out;
>  	}
>  
>  	otp_v = nvmem_cell_read(cell, &otp_l);
> @@ -96,11 +97,12 @@ static int update_disc_vol(struct sp_usbphy *usbphy)
>  		set = *(otp_v + 1);
>  		set = (set << (sizeof(char) * 8)) | *otp_v;
>  		set = (set >> usbphy->disc_vol_addr_off) & J_DISC;
> +		if (set == 0)
> +			set = OTP_DISC_LEVEL_DEFAULT;
> +		kfree(otp_v);
>  	}
>  
> -	if (IS_ERR(otp_v) || set == 0)
> -		set = OTP_DISC_LEVEL_DEFAULT;
> -
> +out:
>  	val = readl(usbphy->phy_regs + CONFIG7);
>  	val = (val & ~J_DISC) | set;
>  	writel(val, usbphy->phy_regs + CONFIG7);
> 
> ---
> base-commit: 9a4cdc958dd79fc6c3b20b51a10debec6ca09fec
> change-id: 20260804-sunplus-53a7bb1bcd72
> 
> Best regards,
> --  
> Felix Gu <ustc.gu@gmail.com>

-- 
~Vinod
