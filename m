Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793988347;
	b=IDwqJVGMq8uPfaTmiAvy0oviZyHaXPDuqhiNTKR+luDb0KiSoGZK0b+VslmsRarhf/J4
	 pUOjM5jWzCouHMPJ8H/cbWzWfogZWWMoEqIR2dlehltJLqsmWoyNxdUZOg2Demg+VwTBo
	 tkdaRm0hI3SQber5LyBddTQ1cm2a4fNAjiGuYeJ+ho6xskbdqSiyQ8tUtzjhuKXJslVYM
	 XgDWYA2lP7u5gGzzwLPCF3PMBNuqXOCqvywmVKqsy7BYsFlf2kDxXmwM7+RZuVpzLkqLv
	 ChRdpKcrBEpAuUg6dzWjSz4otQ26cbHKL3bKeMJop0xpTbN51THVryH+G6+ZiDuhO3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793988347;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=rrrwHzJXVIORcIhUYiCYOgYAzpDNxbay8Vcu5R6lG6I=;
	b=uSZQ8XIzf02bUXHXVKjEKyRyJVq377oDlJ5Jl7OZUwdb4KZ/isRxbmzN6tx/ar/DxbLQ
	 4khLtJ3ClpF5JZ8OtwnsAZltxeOwY6h3sDadzx6+s8eGahzVyiFySx1uCkPeAnlpj3cmP
	 rX+xIqapFMH4L7RmsoqXziT63KmQobxsFKaBfCM41Gh8ABy1SbnWWXAzsziNOqTC6M0gQ
	 6i+l5z9r5I+c+AhnMkFVLBaR9170wpVkKFQuyJWn9Um9SlRmCpywaa4y/qasywZo5kxSK
	 jjrZZQO4+zWqGo8BdOg/eKeud3Vyz9QyBv5GHrIyU4GXXvecfGUst9tQfWw4XzL8IXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GiRyIm5e;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F29606A33A
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 18:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GiRyIm5e
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B6A21F008BC;
	Fri,  6 Nov 2026 18:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793988346;
	bh=rrrwHzJXVIORcIhUYiCYOgYAzpDNxbay8Vcu5R6lG6I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GiRyIm5eZm+wD7LJnHLqWsOVwJYKhpzWrk2Rk1CJeDV9SMgdBOU7XmVzNx1lSgMR4
	 SuzTTgV0911U6AzrX/KzRIidUyOC5hC4VX1Msah4PzPVORwYTHc9gEFK3Yj8TvwKlJ
	 bDzpI/u5ecnF27WxMB9LZPSHaMQ5EcapzLsUgkBRZqNAsKy6cD+tXcWxotsJhJIH1k
	 TUY0joEY5tZFkJ3eBNtuQX8q4weD9h4zbY1/0GfhThEcE2HhfIw8xzDs9ORg9hQ+CC
	 C3fZufyRNmRQyDJIQa6lNgjugNLoi85lXALT4tI2i0Ike9WrVjUgVC8VCjoP90CROm
	 SoGY4CC+vW0oQ==
Message-ID: <sashiko-outbox-201991@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 6/6] usb: dwc2: platform: fix stm32mp15 detection
 logic power management
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabrice Gasnier" <fabrice.gasnier@foss.st.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261106-dwc2-low-power-fixes-stm32-v3-6-68d2a0e9bab6@foss.st.com>
References: <20261106-dwc2-low-power-fixes-stm32-v3-0-68d2a0e9bab6@foss.st.com>
 <20261106-dwc2-low-power-fixes-stm32-v3-6-68d2a0e9bab6@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 18:05:46 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] usb: dwc2: NULL deref in dwc2_stm32_hw_disable() on
  dwc2_init_params() error
--

commit f918c81ccd698e45e8b3143adcead2cdea2d4018
Author: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

usb: dwc2: platform: fix stm32mp15 detection logic power management

This commit moves STM32MP15 ID/VBUS detection logic enable and disable
handling into __dwc2_lowlevel_hw_enable() and __dwc2_lowlevel_hw_disable()
so the detection resources follow the low-level hardware power state.

> diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
> index b65b9898bac0d..d61b088cbc265 100644
> --- a/drivers/usb/dwc2/platform.c
> +++ b/drivers/usb/dwc2/platform.c

[ ... ]

> @@ -541,33 +639,26 @@ static int dwc2_driver_probe(struct platform_device=
 *dev)
>  		goto error;
> =20
>  	if (hsotg->params.activate_stm_id_vb_detection) {
> -		u32 ggpio;
> -
>  		hsotg->usb33d =3D devm_regulator_get(hsotg->dev, "usb33d");
>  		if (IS_ERR(hsotg->usb33d)) {
>  			retval =3D PTR_ERR(hsotg->usb33d);
> +			/* skips low level dwc2_stm32_hw_disable() in case of error */
> +			hsotg->params.activate_stm_id_vb_detection =3D 0;
>  			dev_err_probe(hsotg->dev, retval, "failed to request usb33d supply\n"=
);
>  			goto error;
>  		}
> -		retval =3D regulator_enable(hsotg->usb33d);
> +		retval =3D dwc2_stm32_hw_enable(hsotg);
>  		if (retval) {
> -			dev_err_probe(hsotg->dev, retval, "failed to enable usb33d supply\n");
> +			hsotg->params.activate_stm_id_vb_detection =3D 0;
> +			dev_err_probe(hsotg->dev, retval, "dwc2_stm32_hw_enable failed\n");
>  			goto error;
>  		}

[Severity: Medium]
Can a failure in dwc2_init_params() right before this block cause a NULL
pointer dereference on hsotg->usb33d in regulator_disable()?

In dwc2_init_params(), set_params(hsotg) sets
hsotg->params.activate_stm_id_vb_detection =3D true on STM32MP15 before
calling dwc2_limit_speed(hsotg):

drivers/usb/dwc2/params.c:dwc2_init_params() {
    ...
	if (set_params) {
		set_params(hsotg);
	} else {
    ...
	}

	ret =3D dwc2_limit_speed(hsotg);
	if (ret)
		return ret;
    ...
}

If dwc2_limit_speed() fails, dwc2_driver_probe() jumps to error before
devm_regulator_get() runs, and dwc2_lowlevel_hw_disable() ->
dwc2_stm32_hw_disable() passes hsotg->usb33d =3D=3D NULL to
regulator_disable().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-dwc2-low-p=
ower-fixes-stm32-v3-0-68d2a0e9bab6@foss.st.com?part=3D6
