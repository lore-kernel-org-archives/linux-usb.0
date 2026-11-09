Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246204;
	b=cm+vbpE+Q9Wn9L0xyCW53R+jbm+Im89NDba5RBc4+vVDtAtgjObSFf6cvs6t7pRSmYWq
	 MmezFPfWshKwluS/kZvkMR5i+0xeTp7VECW5u2MZLJS59E9TpI/10J0Mk45bGnbOIEUjx
	 NQghr5mxFcWtKe0rzRuohYbrVmlB7DSxaRTIVusFp2LDgkIbP6gILkok0QXkMxkkG/A8F
	 loOjmXufCCI4dKPL1hpj/GFQ7mXBU4yG1Td3pkKVGdo97BazYCuzeDM+oZ6QxZ1RRzRTS
	 YVTn7x656K1twZiKPnoZJxX6x1YcTsQ8G2NN8WNKag6S6sA02vnb3D10sW/PbCMzbiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246204;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=3pAw7qX1mE5Ua/rpv9h0CrrA5Wv+itOiV0epDj3d6Lw=;
	b=MDTIECINkCETw/N0lnXXTfpSAC3uhZGaeU6zjvBwBQqYpOgSWaX4sTKkRiDAa4pm/t0z
	 3Ny3antgnGBn16JKCjGlx6YHgWWnGuu7mrCC2pngIp/hMqI3FGGCoTmaTg4tx5Mun6Aq/
	 eTRaQhuwaQDP58zp2q4XsMQ97pEOOQaXPlIxLauDMKC1Xaj9YcB64rnEcrIWVvX7lctUI
	 4ZlHKUVKL7J0ekVQy0ZoGKEZ1Xu3uKazccFgs8fPLld9cfvEzndh/qk3CEBqhjV3SN7hc
	 9oetRa85EygyhYlf9+jzABl3qmUDrEAbS9FAZrzDleW5Cqr8EAgMVMcPuZfDGEPsFyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=edVjKadP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C02606A31C
	for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2026 17:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=edVjKadP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA7731F008A1;
	Mon,  9 Nov 2026 17:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794246203;
	bh=3pAw7qX1mE5Ua/rpv9h0CrrA5Wv+itOiV0epDj3d6Lw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=edVjKadPq8QIOyitYiMUEXtkqL/oqIIxmK9h4rTzK71CDujt2CZjCe7yaoLQu9rDR
	 1eue5FSMSKSYFEOXMmtRpVH+GGLZeCLkjlUHrr5/Nvp1PIXyeUBjGHvjDKVaTymKcj
	 +W0ZUVFw58M+XLUACwnEM0OlksjEmbbX0HyvnSyh/Vju8JX5jKCXgUwijeGGTez9o/
	 yMHDSiTB6OVNEw/unN+6pZ5jlmgANclHeqzOg27lWRK2gZ9pXbg2r55FdpJomrkUQM
	 YE356SkbkCowugtoB3uvGFX0WZ2pS3bYfb2XBrBTvmdwwBndzStDLisUG5JW5OTnv3
	 Iyveg8JFptdDw==
Message-ID: <sashiko-outbox-205328@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: dwc3: apply XCVRDLY after PHY init
Reply-To: sashiko-reviews@lists.linux.dev
To: "Brian Ellis" <brianellis@gotenna.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261109-dwc3-xcvrdly-after-phy-init-v1-1-488ed0a0c7da@gotenna.com>
References: <20261109-dwc3-xcvrdly-after-phy-init-v1-1-488ed0a0c7da@gotenna.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 17:43:22 +0000
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
- [Medium] usb: dwc3: XCVRDLY not cleared before PHY init in
  dwc3_hs_phy_setup()
--

commit 94be63bcb12fab40e49af12fcead82e36a641824
Author: Brian Ellis <brianellis@gotenna.com>

usb: dwc3: apply XCVRDLY after PHY init

This commit moves dwc3_ulpi_setup() to the end of dwc3_core_init() so
that DWC3_GUSB2PHYCFG_XCVRDLY is not asserted during PHY initialization.

> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index fd5c2cd36c595..9b37ceda9a81f 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -1371,8 +1371,6 @@ int dwc3_core_init(struct dwc3 *dwc)
>  		dwc->ulpi_ready =3D true;
>  	}
> =20
> -	dwc3_ulpi_setup(dwc);
> -
>  	if (!dwc->phys_ready) {
>  		ret =3D dwc3_core_get_phy(dwc);
>  		if (ret)
> @@ -1534,6 +1532,9 @@ int dwc3_core_init(struct dwc3 *dwc)
>  		dwc3_writel(dwc, DWC3_GUCTL3, reg);
>  	}
> =20
> +	/* XCVRDLY must not be asserted across PHY init, so set it last. */
> +	dwc3_ulpi_setup(dwc);
> +
>  	return 0;
> =20
>  err_power_off_phy:

[Severity: Medium]
Does DWC3_GUSB2PHYCFG_XCVRDLY also need to be cleared in
dwc3_hs_phy_setup() before PHY bring-up?

Once dwc3_ulpi_setup() sets DWC3_GUSB2PHYCFG_XCVRDLY at the end of the
initial dwc3_core_init(), neither dwc3_core_exit() nor
dwc3_core_soft_reset() clears it, and dwc3_hs_phy_setup() preserves the
bit when it read-modify-writes DWC3_GUSB2PHYCFG(index) (unlike
DWC3_GUSB2PHYCFG_SUSPHY, which it clears prior to PHY init).

When dwc3_core_init() runs again without a hardware reset of the global
registers (for example via dwc3_resume_common() ->
dwc3_core_init_for_resume() on ZynqMP where dwc->reset is NULL),
DWC3_GUSB2PHYCFG_XCVRDLY remains asserted across dwc3_phy_init() and
dwc3_phy_power_on(), reintroducing the high-speed link drop on resume.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109-dwc3-xcvrd=
ly-after-phy-init-v1-1-488ed0a0c7da@gotenna.com?part=3D1
