Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4543364E85
	for <linux-usb@vger.kernel.org>; Mon,  2 Feb 2026 12:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770033909; cv=none; b=pJFz0UcYv6IS9XwaPvQBkrLNAehHxLIyPLgqcgD+WZlV18m9YIC/7kF/zgMzSUFYXbPAMmRI6hj0t5vovlUESngrJV3ef0Q+X6VsTiVE3Uoln4XDdUNeUxrcPwCyvfKJOaxs5uITrcL5+fYHSN2l64qHpZEWKrdh0AyAYwKX7zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770033909; c=relaxed/simple;
	bh=ooVTj9mEoByboPWWE3IFgLha7oCBLZZINAKgYSkyhpE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CkaoNp0We0Hhmdrxmz5btfhSCuStVDrkVMScptfTOGNd5ie0Yt55zmXcoXdwCpVnbWLXtIiZHVzuFKGUtPHIal1L+2bAQZFIm8kf0FZqrMhJM2fDCZNS1ewCYGx045x0Bjbaly6x6j3HFznluCp8yW9acInqNs6iOrDnn95/Hvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QkRJKF3o; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QkRJKF3o"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59dd7bfeb8aso4836029e87.0
        for <linux-usb@vger.kernel.org>; Mon, 02 Feb 2026 04:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770033906; x=1770638706; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NCU4lBi7Qj4qN74x1HXW9kHPnyicyi2w7qMxp171t3w=;
        b=QkRJKF3oJb/83lDSrR2pW/th8VcBC6T9Qpsp0bHI71yhP6IfY6gSc/8qvwNfQPdIpU
         zwIzClOZEfzrQbPmfjwynxuWfbMcIKxxybqvxKANguDECr1V7L6Ct+9W2fPhUGHdTwbD
         VNM/udcKsgWv0YD1YdzGaJZIlbA/qTTwgM55CKQDdLoAuK4vVUZZhWlfunDMQA0y/wmJ
         Fof9GwtM2VK/ssrAs0izUQ745LX1DfyfEs5UwPgUku4ujiCAQ791vLpXhYrcdnZiB0t5
         Ozh3qUK2quzcEbwXG5pNFzUv42OgBQFvZeCtjVRgLGygxbpDyHG4cylYXJGCVCHG0ea9
         cdIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770033906; x=1770638706;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NCU4lBi7Qj4qN74x1HXW9kHPnyicyi2w7qMxp171t3w=;
        b=EaCGqInmZnmIEotAvwb1GtUOaMoMXw4vtNNQ4nUP21UV86W2Y3FLN7ve0dqx3wKHqu
         vJoPuauVbdeTuexWb/avHoJ8GkfB2Yjz7H1YelLsXtZ6JYPO20nBPDpUaggZxAbnt3Qn
         lDk4xCd8+WLarpHv/ELGLJWGyJUjWYQqDfBkEV9hdZ3MtK3lw7YLKWv9+na0vQUVif+H
         CZv/yBqfXbsvA7Y4geWYAZNhvJG2ZLXT3cD67z9ViGFIJalayUWTnnhRslBaD5AnB5sh
         Kg9MmWMFAHSfIXDrm39XW9pwQshE/WerIB4yWy2i/+3737iugAFRRqtrDTl4/lIZSfFR
         apQA==
X-Gm-Message-State: AOJu0YwuusXSz+EO+GNzaE7iPazvjif/2CP3BkS7ZS3j3r0kFjGfKF/G
	QLJESdTYCL+PgL79r5Ty/5ndj/8K5RCjeUS5wVKXby6ClfZ9h347CNby
X-Gm-Gg: AZuq6aInm48pCEp9LGHDTlVmbl+r/Wc5BfMKs2Ms8mSNwd7HjtFuoR1Ej81TIhjteCL
	FCA5FWKSYz1ARNQy3B7DjYIg8ndFD4INabJojPgwH7T9DnYBmUqv+TRfrZInm2rDUg3TDpGJNqs
	a29SHVJO9Mwbao7EipmHAXfUK8K1DYTSxAIlwQKwTCyqB3qeyp7hlxvFKagD4Qv3+6CYtFvCfnW
	g21PRNLSmquEcGVekRYZZTkVac3rXNckH3M5d1wmdHuakRQOv+PMe7EyjZmWCZ5qCj5W5dwHNIV
	SL2EOaWKIub3z30Som/arz8kXqv38YAQVTsUNz6NoiyRJeHp3KnMNNUnOnYV+HiGbcBxw+OpmW8
	c/2He4GBFafI5voERe7uXs1xcIVP5OrXXkcEsB4XXv4rKFMRpvpeBL9uGja6JA7EeQmlk1u1kEM
	i//UuAwha81BuiZquOLF4Hcnqv6H8SnYmMguI3QyGmcioJX2ZVSV7Vmxrfq0bZbB5oblkatQ==
X-Received: by 2002:a05:6512:3f1f:b0:59d:cda0:8b74 with SMTP id 2adb3069b0e04-59e1642ac69mr3838142e87.35.1770033905594;
        Mon, 02 Feb 2026 04:05:05 -0800 (PST)
Received: from ?IPV6:2a00:1fa0:4246:14fa:feaa:638c:335c:bdbe? ([2a00:1fa0:4246:14fa:feaa:638c:335c:bdbe])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074b70c8sm3469810e87.75.2026.02.02.04.05.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 04:05:04 -0800 (PST)
Message-ID: <74268def-31fd-4015-8be6-faebd6676667@gmail.com>
Date: Mon, 2 Feb 2026 15:05:03 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] usb: phy: tegra: return error value from
 utmi_wait_register
To: Svyatoslav Ryhel <clamor95@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260202080526.23487-1-clamor95@gmail.com>
 <20260202080526.23487-3-clamor95@gmail.com>
Content-Language: en-US
From: Sergey Shtylyov <sergei.shtylyov@gmail.com>
In-Reply-To: <20260202080526.23487-3-clamor95@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/2/26 11:05 AM, Svyatoslav Ryhel wrote:

> Return exact error value from utmi_wait_register during HSIC power on.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/usb/phy/phy-tegra-usb.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
> index 3a7a74f01d1c..6173b240c3ea 100644
> --- a/drivers/usb/phy/phy-tegra-usb.c
> +++ b/drivers/usb/phy/phy-tegra-usb.c
> @@ -891,6 +891,7 @@ static int uhsic_phy_power_on(struct tegra_usb_phy *phy)
>  	struct tegra_utmip_config *config = phy->config;
>  	void __iomem *base = phy->regs;
>  	u32 val;
> +	int err = 0;

   This initialization seems pointless -- the newly added variable gets overwritten
by you later...

[...]
> @@ -984,12 +985,14 @@ static int uhsic_phy_power_on(struct tegra_usb_phy *phy)
>  	val |= UHSIC_TX_RTUNE(phy->soc_config->uhsic_tx_rtune);
>  	tegra_hsic_writel(phy, UHSIC_PADS_CFG0, val);
>  
> -	if (utmi_wait_register(base + USB_SUSP_CTRL, USB_PHY_CLK_VALID,
> -			       USB_PHY_CLK_VALID))
> +	err = utmi_wait_register(base + USB_SUSP_CTRL, USB_PHY_CLK_VALID,
> +				 USB_PHY_CLK_VALID);
> +
> +	if (err)
>  		dev_err(phy->u_phy.dev,
>  			"Timeout waiting for PHY to stabilize on enable (HSIC)\n");
>  
> -	return 0;
> +	return err;
>  }
>  
>  static int uhsic_phy_power_off(struct tegra_usb_phy *phy)

MBR, Sergey

