Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793913664;
	b=fqJ/ucElCqkLnLwvkmy8poBOLwcFpDtmsq16vyWuw7uGh2t+0Z7qAtFo7xhcUJQjduhv
	 cy7P4f+/wp+AdSnbgY2CJzzm+xja69Z2Fw2oHTOxVaZv6Vx0BWISCMvQpfTQ3IiV07q39
	 cJKvOPLYIvQkui/CQjglNJgrrMlD2aEZuDMSSaZOLjJRjbbd5GGrlXGLttjXPouJWD/v8
	 HQtatr4DvsujXuDoLQB7YbmwK+5R9lOUBHzwDu6KitLGoxclIeV9DMNDnIxywx23npwN7
	 Lu7md6mT7C/T/gvt4SF3BZCEqnIIgWnwpL2NACQE5T0wwUC/53VZTNhWPzWuyY9kOBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793913664;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=WXzgH95vtdgxkReEE2P1BQ8xVe38URZnAPeqWUQQfAA=;
	b=Fk0v9M8LLgc2UQLoftRJvOq919HAlgcxNNbZpuX9a01RcqvgTN8shkT+IuvzVhXXcH5X
	 K5cebO5abxfu2KrhZEjj3QxmJN1lR6Ai4ZNNNDOafG90k72QyCWbNoOn0g4BkSLQTDRcQ
	 TWN32H2ydbJGf39Ny7dvwFuWGYjv/L7Rj86xK1i6nE6QtECdN290XJfjptj9Uxq4ZYrW3
	 hbG7MynlS6Ogx+/ln2/OPfdLm88bUoLUIDQ4bC7NRxVXTgQQSEPrZS6GyylwypQEqpsiw
	 GEAwkkb5RveY8B1cAf0wn+N5ocwBMc4Mm3ArO/tnFDVVS3plhCxYZBakDm4faABIA2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=o272kggh;
	arc=none smtp.remote-ip=209.85.160.174
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8886606A326
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 21:21:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8886606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=o272kggh
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-53639b8903bso137501cf.0
        for <linux-usb@vger.kernel.org>; Thu, 05 Nov 2026 13:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1793913663; x=1794518463; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WXzgH95vtdgxkReEE2P1BQ8xVe38URZnAPeqWUQQfAA=;
        b=o272kgghSdolH9E4TnUtYJcaF/dZbvGhVgZT4XofbtbHre5LkiJbWpg6xsyNVRrkfj
         WoIQQnjMqpigXggNp+RauuI//H8XFt3dgvxz838PH4WyJREtRh/95o47zpzX31b4Hvsj
         7c0r4eH2hvvJvNrkz3soupfCZ+RGpKmVBiPNTDFO4vofbHZb8QJnuPg/MjHsmJidxNSE
         BGSbILqPpyhrSF7J0itl9ehrDSYQP45apJG1EAmpMJr9fqFMrhYtryh058q20o9gs09F
         vXIi9ZsSOxCSowHzL9aPAvJVJR55aa3GiPNLMfoP7h8uUvNOTLvzZV6PAViTsTLs8sHw
         zphQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793913663; x=1794518463;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WXzgH95vtdgxkReEE2P1BQ8xVe38URZnAPeqWUQQfAA=;
        b=0j4+d2fjZa1t39GPOmjtQXjpSfUnfQ+E3HAjlWcLVul9AsGogDQaHwHfFljRIGmG8Y
         Ywfjdgryotahu2sovDfySLRs0SqFQE2Ctpfx4aSkyrrMoL8UIya/3Og5CRbiTN64HJA6
         pieps61GXf/LWzb67qQP4/xbFFUPiuUkxRh5VoMc+HSlwv+2QRIeS2Uq24Md9bN61CvC
         fbL2hZVKRIPT29fr4Tsga78fQoRtepWqDA08uYsIYCuUhcgzQgHk9h8LZXkk9Q2qgGIH
         0yUU1BmJA5dab18eGcYloyk7BgwiurzkqodKqJnQ5UqxFF392YCBIDbUAMUVtiL9b3c5
         hD5A==
X-Gm-Message-State: APuU4Z+gHd5qo/6pg8U7mmF9of4sTBMC30IyPoi9NA+pb6NtpJITUhgG
	0j0ydYBIMTOooTN4oxvSp40woMlTy7pzVY52k43ifKevak/AwDI1vIpuJAkgVz3U0A==
X-Gm-Gg: AYBFou2Cznf8KRsqBuldIOIm2nhfZA2xQ3mTnav4Tpir4xyHZejt/aZAh8Uo8gJXdQ3
	P+whQt6UlxmMljbYjiRwcSzejdKCEKUACCpPc1yEeX84oQ6Yc2+g8l7J+xbNoOcqoqrgpZR1Qfg
	zzg9u67/YR/D3VmCIbLBpR5AM9EyHCH179gHbH2pRh/UmeMXnBTA3hSAsCfy5sdHksCz3cHCFqD
	TUSliSo+nAt6Ksdg4oQy3pWz6o/AaImnkxiLJPizxcJXxS/2+eZvyb3yOiabSqDy3ZMALnqA2sw
	1qBFlEfQ5RUF488KcraOCfqj5eWFVa1LM1eWuj8m1nyt6iqstwpPkY1ApUb3SZNLIMKeOJn1GxC
	LwzLvWpze40LfF/n9xopFRwyf4c+nqpwnHyC5a+I8Ve2ZGqECsXh0OpAT9N4mwsCmD9Lhm7/V5h
	Ol6aWIrMPTszi3yJQ781Lvl6WuntQ7EO8PbrNcm4nGUWvhlsUb6iMHnDRPREuK7DVwBlF9R8Sex
	RnXiDcS+YZKW4oS1wdlxyQ3ljQwe9agWFAF/GhKQL4+rZwzh68qEZEv93LHTTcJCK1FCJB6N/CI
	E64yZ0JHT8+4ORJq7ychteC5JMnQ
X-Received: by 2002:a05:622a:c01:b0:53f:98b5:4317 with SMTP id d75a77b69052e-54e15f61bd1mr8424661cf.34.1793913662646;
        Thu, 05 Nov 2026 13:21:02 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54e25d65a79sm3151401cf.12.2026.11.05.13.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 13:21:01 -0800 (PST)
Date: Thu, 5 Nov 2026 16:20:59 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Josef Bacik <josef@toxicpanda.com>,
	Elad Nachman <enachman@marvell.com>, stable <stable@kernel.org>
Subject: Re: [PATCH 10/19] usb: host: ehci-orion: fix the probe without DT
Message-ID: <e8b7570b-7f60-4628-9470-2ef03b4e266a@rowland.harvard.edu>
References: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
 <20261027-llm-usb-v1-10-b9751ddb9c7c@linuxfoundation.org>
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
In-Reply-To: <20261027-llm-usb-v1-10-b9751ddb9c7c@linuxfoundation.org>

On Tue, Oct 27, 2026 at 03:57:50PM +0100, Greg Kroah-Hartman wrote:
> From: Josef Bacik <josef@toxicpanda.com>
> 
> The Orion5x, MV78xx0 and Dove board files register the controllers as
> platform devices called "orion-ehci" (arch/arm/plat-orion/common.c),
> which are bound by name. of_device_get_match_data() returns NULL for
> them, and ehci_orion_drv_probe() dereferences it to get the DMA mask.
> 
> Use the 32 bit mask, as before, if there is no match data.
> 
> Fixes: c63fe1cc7093 ("usb: host: Add ac5 to EHCI Orion")
> Cc: Elad Nachman <enachman@marvell.com>
> Cc: stable <stable@kernel.org>
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/host/ehci-orion.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/host/ehci-orion.c b/drivers/usb/host/ehci-orion.c
> index eaaa49712a8c..2071c3d6e582 100644
> --- a/drivers/usb/host/ehci-orion.c
> +++ b/drivers/usb/host/ehci-orion.c
> @@ -218,7 +218,7 @@ static int ehci_orion_drv_probe(struct platform_device *pdev)
>  	int irq, err;
>  	enum orion_ehci_phy_ver phy_version;
>  	struct orion_ehci_hcd *priv;
> -	u64 *dma_mask_ptr;
> +	const u64 *dma_mask_ptr;
>  
>  	if (usb_disabled())
>  		return -ENODEV;
> @@ -236,7 +236,9 @@ static int ehci_orion_drv_probe(struct platform_device *pdev)
>  	 * set. Since shared usb code relies on it, set it here for
>  	 * now. Once we have dma capability bindings this can go away.
>  	 */
> -	dma_mask_ptr = (u64 *)of_device_get_match_data(&pdev->dev);
> +	dma_mask_ptr = of_device_get_match_data(&pdev->dev);
> +	if (!dma_mask_ptr)
> +		dma_mask_ptr = &dma_mask_orion;
>  	err = dma_coerce_mask_and_coherent(&pdev->dev, *dma_mask_ptr);
>  	if (err)
>  		goto err;
> 
> -- 
> 2.56.0
> 
