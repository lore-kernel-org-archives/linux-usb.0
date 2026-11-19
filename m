Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795114223;
	b=oUaLMSSws9t6g/rYlIiCMoFPjtxfhtN9ypOK/GiqeaWK8L53+uS8ZTiwJHJfT0lCmElK
	 XL/nB8tjAPimgWT2xWeGrqTzjKGQZov+3z495C6AR/XLj+GyNOGpOzlhyQsl7bARi8uFq
	 ow0Ez37wG+X68QVLuidfBxgQSD3ZVz6keXEr0Ka275gFT5EdsMFO5DgBRujXQzlY+DgLn
	 tiW/NA5/0aTuT3cVsIPiKp7G/6bo50PRHI9j5OJfj2m2UHfNcWj/D+LykXztKnftlG0p9
	 LQpu4/Irlb0XCGYo2HDFMn9eYpKEVvg9Oqn2jxPAjf0k1YDiWTSAz9kDfWtxqyMcwww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795114223;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=MgPO587lIKx2KSlrRLPtCisv60m1MfbvsK5yeLHwT+s=;
	b=PSH8WjDs2pU3fTw6Z8qGw+hFQKu+fVINiibkLO4gnyo+o1FbsvreN5Tlnb5KCVrjoXGK
	 jwKp7sIOABSCBKUJ+KjVwtO+g2uC0oBoe9yUppRAa/cdWN07kY7Or0r+oR+/XNG50Eb21
	 3Inh3a3jm39E5KbitUXnPi2NtM5gFERNN0JIxxsg5qtl3bDwNpvsfcxx0hNdYr51ezDEs
	 9r+46InYK7KiTiD3+Pn3vvftK/MJiLBbDd2wICOQT5gp2vkYOZgsvi79CoTTZatoSGGJu
	 SgridJ1QkfDjJZ6Del6nWOe2Eu4n4QdckA2qR8J7v0zuI1FeyYZMEoeamXUdhl7WcLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WhtHiwP2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4586606A324
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 18:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WhtHiwP2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1511A1F000C4;
	Thu, 19 Nov 2026 18:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795114223;
	bh=MgPO587lIKx2KSlrRLPtCisv60m1MfbvsK5yeLHwT+s=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=WhtHiwP2XPhUcR1jGX2ja+wv/Ww2qI687WfccqGVRE97radB2QxWfwBQgAJm0k5lg
	 W9OD2IMndLiKXg3EvGfNB4z9OILvXnfyp0X4VpF0A79U9UNGOTc0MVAie7nYxq0/7A
	 UTEEONXfS8XKU6eL6otygcvxKSI+0m5zXzV+9BAIprs66IYcISRQ3MW8r0qTlIThCC
	 FOqrf+22IrC3bPphz0rhuribbiLhl6w7fzRf7yXmrComCHFh6zf51pfWl3NvHUJWd3
	 IfIjLGGmc0TF3VhHg03JiING15qAAHip2ybOpdD6Tw9NZU4zynvEMKnZwrj9UfW27i
	 aYfKMtGnD9rUg==
Message-ID: <sashiko-outbox-223804@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: chipidea: Use devm_clk_get_optional_enabled() in
 two probe functions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Elfring" <Markus.Elfring@web.de>, linux-usb@vger.kernel.org
In-Reply-To: <6d2450cf-9bbc-47b6-9ea3-f91bc1b91371@web.de>
References: <6d2450cf-9bbc-47b6-9ea3-f91bc1b91371@web.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 18:50:22 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] usb: chipidea: npcm: double clk_disable_unprepare() on probe
  err and remove
- [High] usb: chipidea: usb2: double clk_disable_unprepare() on probe
  err and remove
--

commit f08588246bb9a1d0ba3a56c799e77b7dacaf4937
Author: Markus Elfring <elfring@users.sourceforge.net>

usb: chipidea: Use devm_clk_get_optional_enabled() in two probe functions

This commit replaces devm_clk_get_optional() and clk_prepare_enable() with
devm_clk_get_optional_enabled() in npcm_udc_probe() and ci_hdrc_usb2_probe(=
).

> diff --git a/drivers/usb/chipidea/ci_hdrc_npcm.c b/drivers/usb/chipidea/c=
i_hdrc_npcm.c
> index 75a0223b578a8..5052287f69c2a 100644
> --- a/drivers/usb/chipidea/ci_hdrc_npcm.c
> +++ b/drivers/usb/chipidea/ci_hdrc_npcm.c
> @@ -47,14 +47,10 @@ static int npcm_udc_probe(struct platform_device *pde=
v)
>  		return -ENOMEM;
>  	platform_set_drvdata(pdev, ci);
> =20
> -	ci->core_clk =3D devm_clk_get_optional(dev, NULL);
> +	ci->core_clk =3D devm_clk_get_optional_enabled(dev, NULL);
>  	if (IS_ERR(ci->core_clk))
>  		return PTR_ERR(ci->core_clk);
> =20
> -	ret =3D clk_prepare_enable(ci->core_clk);
> -	if (ret)
> -		return dev_err_probe(dev, ret, "failed to enable the clock: %d\n", ret=
);
> -
>  	ci->pdata.name =3D dev_name(dev);
>  	ci->pdata.capoffset =3D DEF_CAPOFFSET;
>  	ci->pdata.flags	=3D CI_HDRC_REQUIRES_ALIGNED_DMA |

[Severity: High]
Does this cause clk_disable_unprepare(ci->core_clk) to run twice when
ci_hdrc_add_device() fails or when the device is removed?

devm_clk_get_optional_enabled() registers a devres action to disable and
unprepare ci->core_clk automatically, but both the clk_err error path in
npcm_udc_probe() and npcm_udc_remove() still call
clk_disable_unprepare(ci->core_clk) manually, underflowing the clock's
enable and prepare counts.

> diff --git a/drivers/usb/chipidea/ci_hdrc_usb2.c b/drivers/usb/chipidea/c=
i_hdrc_usb2.c
> index b0200c5937cd5..d33ab6873defb 100644
> --- a/drivers/usb/chipidea/ci_hdrc_usb2.c
> +++ b/drivers/usb/chipidea/ci_hdrc_usb2.c
> @@ -70,16 +70,10 @@ static int ci_hdrc_usb2_probe(struct platform_device =
*pdev)
>  	if (!priv)
>  		return -ENOMEM;
> =20
> -	priv->clk =3D devm_clk_get_optional(dev, NULL);
> +	priv->clk =3D devm_clk_get_optional_enabled(dev, NULL);
>  	if (IS_ERR(priv->clk))
>  		return PTR_ERR(priv->clk);
> =20
> -	ret =3D clk_prepare_enable(priv->clk);
> -	if (ret) {
> -		dev_err(dev, "failed to enable the clock: %d\n", ret);
> -		return ret;
> -	}
> -
>  	ci_pdata->name =3D dev_name(dev);
> =20
>  	priv->ci_pdev =3D ci_hdrc_add_device(dev, pdev->resource,

[Severity: High]
Similarly, won't priv->clk be disabled and unprepared twice if
ci_hdrc_add_device() fails (or returns -EPROBE_DEFER) or when
ci_hdrc_usb2_remove() runs?

The clk_err path in ci_hdrc_usb2_probe() and ci_hdrc_usb2_remove() still
call clk_disable_unprepare(priv->clk) before devres cleanup calls it a
second time.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/6d2450cf-9bbc-47b6-=
9ea3-f91bc1b91371@web.de?part=3D1
