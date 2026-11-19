Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076819;
	b=GL40MkAZG9yOk2KcSwRSmMsywIkCeSlPot15D/UU/R5n26MN1wdxkpYYl2rfDF5vm3RM
	 i1RoOJxKZR6EbUJOCoyWfUI1vefPIhAjOL9ehnKitKyaw9Uc6pWDkcqHNMNJMcZbCGGyr
	 za9KcqgXxqXy2LcAkiM9UoL8ToNOftiZQFWzpUpcxpxjGAXZ6JVAX5wsNj5ayuGFxupbX
	 2DX/YnwpAQ8uX+d/aMUFk16T0kLX7b6FwPr9GeEo1uGy++rgxKrWOP0lIWWv6sZW0AX8q
	 V5Rhh/JTJdky6TKh2d5uOSiSvdmdaVJ0oogLM5cZMSvw+cdjLF+sBhuE3kqiyVeqvbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076819;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=2nUzOUiLl/rliKZGphpwEUHVcG97xuXQod6AGDHIk4Y=;
	b=YdERP4tzvFGWTqgWdQLW1zol6L5bSGQNf0hTTjz+faWnYq6j/8lR8NPYuBwjZ+kPju4O
	 mSRoe7LDkHY4ZNGZY5vtFACv720DPDjH7LpprkbNyFpfvyr+k46Z/La81R8OecZNOv1xF
	 KHFS9CXWDXv92XOhjEol93EKvcJ4hCrY1oI4Wp95Ow06uHhWHN3XslOVwEQjMKoUGpAuT
	 QRglht4xIShFaLlBLwfE49qKYNMdDW1dj9VHjhq0voClGBsdNRWqiv4CeRHMlsph39qtQ
	 Vmm2ic4GKyKtsi22kNCj0b8/Y8SscgLZA5EiedIIEA+uV/MR4RjIS7zPZG4D5EOKytg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UEmCllkf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD746606A325
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 08:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UEmCllkf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 365A01F000C8;
	Thu, 19 Nov 2026 08:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795076819;
	bh=2nUzOUiLl/rliKZGphpwEUHVcG97xuXQod6AGDHIk4Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UEmCllkfjEpk6drgcaxUS6JXXJnGCf3yuUosATPiiDuoFCkdVTSboi4HhsY17N4QT
	 8PONkhKmvyFFCysL/qwyUKRLYtKxrA78GKBbJgm8K/F9EalJbzXP7EQ3cqoglXQ8mn
	 I82rgE681P8OqwrObauJZQfw2LYMMCbnZgjeQrnb4f0NU0sOs28Qz8H/K9j+sfL2R1
	 nYOErvwPTbRWcxVV9WDWTn52nwsvxcYdgl6z9F7CsEnnJeS33QcoYYS+LKCaTsLHj+
	 KnIzLp7salsBCVPkEsZ2h+fE3azfitEKFfC8oQcIM5cLGyqZXvLbKkXcjRkZdtINOg
	 lObsWEL3vNG9g==
Message-ID: <sashiko-outbox-222669@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: dwc3: meson: g12a: disable vbus on removal
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wang Haoran" <wanghr2026@mail.zgclab.edu.cn>
Cc: linux-usb@vger.kernel.org, linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <1795076109480-15-f562c8e5@mail.zgclab.edu.cn>
References: <1795076109480-15-f562c8e5@mail.zgclab.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 08:26:58 +0000
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
- [Medium] usb: dwc3: meson-g12a: unbalanced vbus disable in
  dwc3_meson_g12a_remove()
It also noticed 1 related pre-existing issue this patch does not
introduce:
- [High] usb: dwc3: meson-g12a: unclocked access in
  dwc3_meson_g12a_irq_thread() [1]
--

commit c61c405ca43e5b0d976be117784027e8c9ce130d
Author: Wang Haoran <wanghr2026@mail.zgclab.edu.cn>

usb: dwc3: meson: g12a: disable vbus on removal

This commit disables the vbus regulator in dwc3_meson_g12a_remove() to
balance the regulator_enable() call in dwc3_meson_g12a_probe().

> diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-m=
eson-g12a.c
> index ca07e813fd64f..4d68b50722e76 100644
> --- a/drivers/usb/dwc3/dwc3-meson-g12a.c
> +++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
> @@ -847,6 +847,9 @@ static void dwc3_meson_g12a_remove(struct platform_de=
vice *pdev)
>  		phy_exit(priv->phys[i]);
>  	}
> =20
> +	if (priv->vbus)
> +		regulator_disable(priv->vbus);

[Severity: Medium]
Can this cause an unbalanced regulator_disable() on priv->vbus when the
controller is removed while in device mode?

When dwc3_meson_g12a_otg_mode_set() switches to PHY_MODE_USB_DEVICE, it
already disables priv->vbus:

drivers/usb/dwc3/dwc3-meson-g12a.c:dwc3_meson_g12a_otg_mode_set() {
    ...
	if (priv->vbus) {
		if (mode =3D=3D PHY_MODE_USB_DEVICE)
			ret =3D regulator_disable(priv->vbus);
		else
			ret =3D regulator_enable(priv->vbus);
		if (ret)
			return ret;
	}

	priv->otg_phy_mode =3D mode;
    ...
}

Should this check priv->otg_phy_mode =3D=3D PHY_MODE_USB_HOST before calling
regulator_disable(priv->vbus), matching dwc3_meson_g12a_suspend()?

> +
>  	pm_runtime_disable(dev);
>  	pm_runtime_put_noidle(dev);
>  	pm_runtime_set_suspended(dev);

[Severity: High]
This problem wasn't introduced by this patch, but can
dwc3_meson_g12a_irq_thread() read unclocked registers during driver removal
[1]?

The OTG interrupt is requested via devm_request_threaded_irq(), so it stays
enabled until devres cleanup runs after dwc3_meson_g12a_remove() returns,
while dwc3_meson_g12a_remove() disables the clocks via
clk_bulk_disable_unprepare() before returning:

CPU0                                CPU1
dwc3_meson_g12a_remove()
  ...
  clk_bulk_disable_unprepare()
                                    dwc3_meson_g12a_irq_thread()
                                      dwc3_meson_g12a_get_id()
                                        regmap_read(priv->usb_glue_regmap, =
...)
                                          <-- unclocked register access
devres_release_all()

If an OTG interrupt fires in that window, reading priv->usb_glue_regmap with
the clocks disabled triggers an asynchronous external abort.

[1] https://sashiko.dev/#/bug/linux-901d8f75-b80e-43d7-b50d-1dc1755ce4f5

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/1795076109480-15-f5=
62c8e5@mail.zgclab.edu.cn?part=3D1
