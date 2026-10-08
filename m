Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2D841A794
	for <linux-usb@vger.kernel.org>; Thu,  8 Oct 2026 14:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791468791; cv=none; b=dopHbynfpQMBO13ak8ueylX/xZW9jJ1++6C6KDYilb4q/tDlzzLzA+4qDqHyMQsOZfgU02oqD03Yj/vHEC5Cg2vd9rUJCN0togZc2TCYUDUMqy2BEHPpZN93R5kgpm/OfWYoo9fRXbB6flxlFXIkap96H/9qdnXa4pMOcPthKPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791468791; c=relaxed/simple;
	bh=PavDijWrhoIXtL+dfMdhQtkU3dDZxJr+IRbXHu+jaCw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=DwwRVws3l+Ls5MqAbs+toDU4dCx0Q06CzMHuIfefL+x5PSEq72SOl9YwBr7951cBPbQa4/FSwlcfrowV2mcRZuL+zm3zi8IWRpgNGOBZ9JiNMEPEKOys5eIIrX8EQNIj6zaPGnRfRZCU5TQMXKjdU8Cum3d+5TBrYnbVJCPO3y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CwGqHw1U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CwGqHw1U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0D201F000FF;
	Thu,  8 Oct 2026 14:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791468790;
	bh=BQmEs8I+LehR4bjKOoQJ+562xZaOGD12vCZXkSo2Pus=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CwGqHw1UgKMvkeJj+wlIRbtKxOv+uaq5/FtZZvbMFxmujrLAYd0XFgAiLQyewcJWZ
	 Rfa07O+56HC1ZzIO7NBQ8es2W6WOT81XVfX54a+ENbZAVg/oDbjW9ENPGpE9JyJfXn
	 /SdAoOGYKIe1MvjuoSIaoVvef7YHrp1ucozf1i+IjDYLwITrpD34Zx3NQnzcYiJwIf
	 1yf+cMFW1ThG+RMoT0Y+Lgr0yAVX3HAOC9xVMFb6oJacdR2IOyDzUTEBjsejdqaaoQ
	 MfAudERv0m18r+cR2D0/LkU8FolkFcZlq9COdtwQ/th8azjlIfyC3B4fh0IBWPjVeg
	 Q275MIDjrOYEg==
Message-ID: <sashiko-outbox-164268@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/5] usb: dwc2: platform: fix stm32mp15 detection logic
 power management
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabrice Gasnier" <fabrice.gasnier@foss.st.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261008-dwc2-low-power-fixes-stm32-v1-5-5b303df762e6@foss.st.com>
References: <20261008-dwc2-low-power-fixes-stm32-v1-0-5b303df762e6@foss.st.com>
 <20261008-dwc2-low-power-fixes-stm32-v1-5-5b303df762e6@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 14:13:09 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] usb: dwc2: ERR_PTR dereference and unbalanced regulator_disable on=
 probe error
- [High] usb: dwc2: resource leak of PHY and clocks via early return in __d=
wc2_lowlevel_hw_disable
--

commit 7d8da634deddde8e939ffe9d7757702801ebe78b
Author: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

    usb: dwc2: platform: fix stm32mp15 detection logic power management
   =20
    On stm32mp15, the stm detection logic can be left enabled even though t=
he
    other hw resources gets disabled from the probe. This moves the stm
    detection logic enable/disable procedures to dedicated routines.

> diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
> index 643d67ce28ea2..ddab95b443a99 100644
> --- a/drivers/usb/dwc2/platform.c
> +++ b/drivers/usb/dwc2/platform.c
[ ... ]
> @@ -91,6 +91,80 @@ static int dwc2_get_dr_mode(struct dwc2_hsotg *hsotg)
>  	return 0;
>  }
> =20
[ ... ]
> +static int dwc2_stm32_hw_disable(struct dwc2_hsotg *hsotg)
> +{
[ ... ]
> +	ret =3D regulator_disable(hsotg->usb33d);

[Severity: High]
If devm_regulator_get() fails during dwc2_driver_probe(), can this
dereference an ERR_PTR?

In dwc2_driver_probe():

	hsotg->usb33d =3D devm_regulator_get(hsotg->dev, "usb33d");
	if (IS_ERR(hsotg->usb33d)) {
		retval =3D PTR_ERR(hsotg->usb33d);
		...
		goto error;
	}

At the error label, if hsotg->ll_hw_enabled is true, the code calls
dwc2_lowlevel_hw_disable() which invokes __dwc2_lowlevel_hw_disable().
That in turn calls dwc2_stm32_hw_disable().

Will dwc2_stm32_hw_disable() then blindly call regulator_disable() on the
ERR_PTR in hsotg->usb33d?

Also, if devm_regulator_get() succeeded but dwc2_stm32_hw_enable() failed,
will this trigger an unbalanced regulator_disable() warning?

> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
[ ... ]
> @@ -166,6 +254,10 @@ static int __dwc2_lowlevel_hw_disable(struct dwc2_hs=
otg *hsotg)
>  	struct platform_device *pdev =3D to_platform_device(hsotg->dev);
>  	int ret =3D 0;
> =20
> +	ret =3D dwc2_stm32_hw_disable(hsotg);
> +	if (ret)
> +		return ret;
> +

[Severity: High]
Does this early return leak PHY power states and clocks when
dwc2_stm32_hw_disable() fails?

If dwc2_stm32_hw_disable() encounters an error (for example, due to an
unbalanced regulator_disable() returning an error, or a PMIC communication
error), it returns a non-zero value.

By returning early here, the function completely bypasses the remaining
hardware teardown sequence, including usb_phy_shutdown(), phy_power_off(),
clk_disable_unprepare(), and regulator_bulk_disable().

Can this leave the hardware active during module unload, suspend, or probe
failure?

>  	if (hsotg->uphy) {
>  		usb_phy_shutdown(hsotg->uphy);
>  	} else if (hsotg->plat && hsotg->plat->phy_exit) {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008-dwc2-low-p=
ower-fixes-stm32-v1-0-5b303df762e6@foss.st.com?part=3D5
