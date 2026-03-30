Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F0F3A785A;
	Mon, 30 Mar 2026 14:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774880368; cv=none; b=Kqhd0Zr32Oh+QUWZBHgaY2Wyj8VuD9tajpQbvmAUkafLte8i2f9wccGXdVetHvoUcVyTc7aDmbT8vMWJzrskCvsmTWdxzk+J8wtJgwLU+waf16tBKkYsPmEdP1bYwgAfl6fcXPNmN5DqFzLtTXlCtooamMrXHH2fnJTuP8KegS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774880368; c=relaxed/simple;
	bh=7JKfQ4X60P8s34YNmEr/x5qM0Dqg73sBd6HWsb7F41Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e2gx8VCs/nNNhmKDFa7YhWy0by6Ecg4upH0IqdfKEuwJkCT44EqMxylwOCXvDKf6qv6Jlyf3oGRtZAKC2NUUIKePRLFOwp2/69pPOANDzOn7n39SdDwXsTEjDPWChL6DQbq844X8e583JwWNfEhDnd5oXedCk23YUqJMz/a0+tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=koc9ObP5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="koc9ObP5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5E44C4CEF7;
	Mon, 30 Mar 2026 14:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774880368;
	bh=7JKfQ4X60P8s34YNmEr/x5qM0Dqg73sBd6HWsb7F41Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=koc9ObP56Zk6I/x3PxH9MOtjozVM385t3ulgg6JRKvOQrpPLo7M2vMdoqb5u2Ec94
	 qe7pfwYLf7Ig/wM0VM7u1jLdI5rLHHYUJKCgxJ2MrIETU8gmtMqLGDs9gr3Tz+BKN1
	 Q09cWbw4kptRO4/dVw6F4+9PdvFNZqnb5QaNzS3M=
Date: Mon, 30 Mar 2026 16:19:24 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, linux-usb@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: phy: mxs: manually reset phy regs after a warm reset
Message-ID: <2026033057-sixties-erupt-fea7@gregkh>
References: <20260330093133.973785-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330093133.973785-1-xu.yang_2@nxp.com>

On Mon, Mar 30, 2026 at 05:31:33PM +0800, Xu Yang wrote:
> The usb phy registers are not fully reset on warm reset under stress
> conditions. We need to manually reset those (CTRL, PWD, DEBUG, PLL_SIC)
> regs after a warm reset. This will reset DEBUG and PLL_SIC registers.
> CTRL and PWD register are handled by "SFT" bit in stmp_reset_block().
> 
> ERR051269: USB PHY registers not fully resetting on warm reset under
>            stress conditions
> 
> The following USB PHY registers must be written by SW to restore the reset
> value after a warm reset:
> 
> Reg: ctrl Addr: 0x29910030 Data: 0xc000_0000
> Reg: pwd Addr: 0x29910000 Data: 0x001e_1c00
> Reg: debug0 Addr: 0x29910050 Data: 0x7f18_0000
> Reg: pll_sic Addr: 0x299100a0 Data: 0x00d1_2000
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/usb/phy/phy-mxs-usb.c | 32 +++++++++++++++++++++++++++++---
>  1 file changed, 29 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
> index 7069dd3f4d0d..dd42db8a0829 100644
> --- a/drivers/usb/phy/phy-mxs-usb.c
> +++ b/drivers/usb/phy/phy-mxs-usb.c
> @@ -209,6 +209,9 @@ static const struct mxs_phy_data imx6ul_phy_data = {
>  static const struct mxs_phy_data imx7ulp_phy_data = {
>  };
>  
> +static const struct mxs_phy_data imx8ulp_phy_data = {
> +};
> +
>  static const struct of_device_id mxs_phy_dt_ids[] = {
>  	{ .compatible = "fsl,imx6sx-usbphy", .data = &imx6sx_phy_data, },
>  	{ .compatible = "fsl,imx6sl-usbphy", .data = &imx6sl_phy_data, },
> @@ -217,6 +220,7 @@ static const struct of_device_id mxs_phy_dt_ids[] = {
>  	{ .compatible = "fsl,vf610-usbphy", .data = &vf610_phy_data, },
>  	{ .compatible = "fsl,imx6ul-usbphy", .data = &imx6ul_phy_data, },
>  	{ .compatible = "fsl,imx7ulp-usbphy", .data = &imx7ulp_phy_data, },
> +	{ .compatible = "fsl,imx8ulp-usbphy", .data = &imx8ulp_phy_data, },

Why can't you use &imx7ulp_phy_data here as it's all just empty?

thanks,

greg k-h
