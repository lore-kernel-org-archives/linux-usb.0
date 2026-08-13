Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF7543D4FA;
	Thu, 13 Aug 2026 09:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786614919; cv=none; b=AHR3VsXS936iUsTdTywsyO963r+CqaJWtWbMbq33qJvS+bp0HYuaekU7NW7AMzhfrgAo7RgP8C1P8NNy5SoLIFVIJ8HMPsYuj+5G7RMh8WfgMkGC1d+nAD6sgaA7r9TdzsXvoEUWnEPw3J6f9KHbFMI1F1bb1yU9amojdOnOn1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786614919; c=relaxed/simple;
	bh=0wXr13tDzOntyT5iA3AEw4f9ZBbo0sfdlcfO3xS7R7o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B1vM2D2G66uaLzwsN60xYX3wknr+UO/O0h+yLNJDsGKP2YcLXYUeC7damQEVl42wnsqO6yp9FUcOXt5SPhsAK5V/ibd5f0wvbJe3oDBR7Byr6YIAEs6QB9/4KpmqSLbqF7rC1YASf5nNkDKqCM2cT2MfsSAdPBkA3INRwW93/so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QUMUsH6R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QUMUsH6R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 658801F000E9;
	Thu, 13 Aug 2026 09:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786614916;
	bh=wpohbZ9rJj7yOAt868aIiXK/QrTmD5B7lw42yERMmg4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QUMUsH6RD6OK9BEQ3uXYmS2OGApGrPSn1oDOu/T6hPnWKa5nH7BKz9ZcUr0eVEbaO
	 z6w9/qXy3LON7vp+tdnYkMckWCuqb2lR204xkpiKE8i6+BC3Cgt/QjAx7VxQ5/uCpc
	 7BaPu4Pcdw1g7zFrwYrzXQeV/IQ3k7v8RBO8TdYx13pkRkBMDEdB8h5omny2OAuO3s
	 7CCJEB7YQhAFhy7XOdjQLfswUoPDurr6zgLiJrRi0lQjkwoXWy4rt11SF29WnjLzZR
	 If10W4rSKPL3uXyOQV0QoEfqEXtWqWUcY1tlnNHPWh4gMI5T71S7FL0VEZhSrlYh5e
	 rGWogProO6p2w==
Date: Thu, 13 Aug 2026 02:55:13 -0700
From: Peter Chen <peter.chen@kernel.org>
To: Junzhong Pan <panjunzhong@linux.spacemit.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH 2/6] usb: chipidea: usb2: add optional reset support
Message-ID: <an2UgcS8cHDGwzsO@hu-petche-lv.qualcomm.com>
References: <20260812-b4-spacemit-k1-usb2-v1-0-f28cf29e522b@linux.spacemit.com>
 <20260812-b4-spacemit-k1-usb2-v1-2-f28cf29e522b@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812-b4-spacemit-k1-usb2-v1-2-f28cf29e522b@linux.spacemit.com>

On 26-08-12 17:26:13, Junzhong Pan wrote:
> The USB2 controller of SpacemiT K1 SoC requires reset support, to keep
> compatibility, add optional reset support.
> 
> Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
> ---
>  drivers/usb/chipidea/ci_hdrc_usb2.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/usb/chipidea/ci_hdrc_usb2.c b/drivers/usb/chipidea/ci_hdrc_usb2.c
> index 8ffa1e95d8e8..00d575cd2955 100644
> --- a/drivers/usb/chipidea/ci_hdrc_usb2.c
> +++ b/drivers/usb/chipidea/ci_hdrc_usb2.c
> @@ -12,6 +12,7 @@
>  #include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
>  #include <linux/property.h>
> +#include <linux/reset.h>
>  #include <linux/usb/chipidea.h>
>  #include <linux/usb/hcd.h>
>  #include <linux/usb/ulpi.h>
> @@ -21,6 +22,7 @@
>  struct ci_hdrc_usb2_priv {
>  	struct platform_device	*ci_pdev;
>  	struct clk		*clk;
> +	struct reset_control	*reset;
>  };
>  
>  static const struct ci_hdrc_platform_data ci_default_pdata = {
> @@ -80,6 +82,12 @@ static int ci_hdrc_usb2_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> +	priv->reset = devm_reset_control_get_optional_exclusive_deasserted(dev, NULL);
> +	if (IS_ERR(priv->reset)) {
> +		ret = PTR_ERR(priv->reset);
> +		goto clk_err;
> +	}
> +

You may update binding doc?

Acked-by: Peter Chen <peter.chen@kernel.com>

Peter
>  	ci_pdata->name = dev_name(dev);
>  
>  	priv->ci_pdev = ci_hdrc_add_device(dev, pdev->resource,
> 
> -- 
> 2.34.1
> 

-- 

Thanks,
Peter Chen
