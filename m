Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7219B5187DC
	for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 14:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791902510; cv=none; b=f8FFvsKKNCer8i5g0wQspAe9QJpOaLmoQJm63ds2+imwyYKcwr+PSq1RtbpvLO76VxLgOVo0o22FNPHCS18ZFc48xu0d0IjsPixR4eCEuv1T/AJSYV8a9bVTvCiuFs0wpsPTJNJ/82Y4l+9I9rKUT08y1YgAaGtj32C9eg1k3jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791902510; c=relaxed/simple;
	bh=/862ZdllU/PSQPxfaTa2caVrXCQyeu2KOujfpIdNufU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=UfWMZw2/Bs+ug9oq92wRs1xCTH/pDJSUt/Oym14keK560l7hE7HjwI6EXg4hIAilogpe3N7kZcTdCOI6zH5OGbzks+rU1mdPRdczBDVb7mtNCeOVTCkjs1RWEnvYJU6LWub9MJNvl8A1S1EPfNpWwYiBSjYxVdoz22KBqXH4wZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MDd6+ZTi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MDd6+ZTi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 364511F000FF;
	Tue, 13 Oct 2026 14:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791902509;
	bh=WkXUVdGc6R4WDOv5eVpA587Xh1MihzK0hGU1CPzgnbA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MDd6+ZTiiI5kqizrBwiG4NUV9we0TgP/tBCJNOXHCjRzDcgEpkPRXLmDuJ5r34Oq/
	 2yzcUT4LZkS3SHdfRGIEtmrzp4kerLUFiozwLeKaZecRMnWyZWX8e/mzptZO+olzCn
	 RZsu00RWqZjzrTehCMOzup7uEtOTH+q5QcHVuyG4gAfDYcWCJM5AnhztSJDbfRB1Vo
	 KRRP27iQ7Vc5iDnGZOiwf2CT1XQK4PUbjBJfRajHoQ22TB/+LpNb/M47HFQhB8h13i
	 sLzdzRnH2XT7DEaHh+PLz3H07Qv59LSZZ/1/DLnmvuv40mwFgOJipbfunNRG+Lo6Xk
	 roDR43kxet7LA==
Message-ID: <sashiko-outbox-169928@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/5] usb: dwc2: platform: fix stm32mp15 detection
 logic power management
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabrice Gasnier" <fabrice.gasnier@foss.st.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261013-dwc2-low-power-fixes-stm32-v2-5-79865a4f1b63@foss.st.com>
References: <20261013-dwc2-low-power-fixes-stm32-v2-0-79865a4f1b63@foss.st.com>
 <20261013-dwc2-low-power-fixes-stm32-v2-5-79865a4f1b63@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 14:41:48 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] usb: dwc2: resource leak on dwc2_stm32_hw_disable error
- [High] usb: dwc2: stm32 GGPIO registers not restored on resume in host mo=
de
- [High] usb: dwc2: platform: resource leak and hardware state corruption o=
n regulator_disable failure
- [Medium] usb: dwc2: hardware left in inconsistent state on regulator_disa=
ble failure
- [Medium] usb: dwc2: unlocked RMW of GUSBCFG in dwc2_force_mode() races wi=
th IRQ handler
--

commit e9b2071209291caa225d964b3e1926c6fcd40475
Author: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

usb: dwc2: platform: fix stm32mp15 detection logic power management

This patch moves the STM32 detection logic enable and disable procedures
into dedicated routines. These routines are now called from the low-level
hardware enable and disable functions, ensuring that the detection
registers are properly handled during power management transitions.

Cc: stable@vger.kernel.org

> diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
> index 5aa5526720783..5841efef6b351 100644
> --- a/drivers/usb/dwc2/platform.c
> +++ b/drivers/usb/dwc2/platform.c
[ ... ]
> @@ -91,6 +91,80 @@ static int dwc2_get_dr_mode(struct dwc2_hsotg *hsotg)
[ ... ]
> +static int dwc2_stm32_hw_disable(struct dwc2_hsotg *hsotg)
> +{
> +	unsigned long flags;
> +	u32 ggpio, gotgctl;
> +	int ret;
> +
> +	if (!hsotg->params.activate_stm_id_vb_detection)
> +		return 0;
> +
> +	/*
> +	 * Need to force the mode to the current mode to avoid Mode
> +	 * Mismatch Interrupt when ID detection will be disabled.
> +	 */
> +	dwc2_force_mode(hsotg, !dwc2_is_device_mode(hsotg));
> +
> +	spin_lock_irqsave(&hsotg->lock, flags);

[Severity: Medium]
Since dwc2_force_mode() performs an unlocked read-modify-write on the
GUSBCFG register, can this race with a concurrent interrupt handler
(such as dwc2_port_intr() running under hsotg->lock) and silently
overwrite the handler's changes?

[ ... ]
> +	ggpio =3D dwc2_readl(hsotg, GGPIO);
> +	ggpio &=3D ~GGPIO_STM32_OTG_GCCFG_IDEN;
> +	ggpio &=3D ~GGPIO_STM32_OTG_GCCFG_VBDEN;
> +	dwc2_writel(hsotg, ggpio, GGPIO);
> +
> +	ret =3D regulator_disable(hsotg->usb33d);
> +	if (ret)
> +		return ret;

[Severity: Medium]
If regulator_disable() fails and returns an error, the OTG detection
registers GOTGCTL and GGPIO have already been modified. Does this leave
the hardware in a permanently inconsistent state with its OTG detection
broken, since the register modifications are not rolled back on this
error path?

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
>  	if (hsotg->uphy) {
>  		usb_phy_shutdown(hsotg->uphy);

[Severity: High]
If dwc2_stm32_hw_disable() fails (for example, due to the
regulator_disable failure), this early return abruptly halts the
teardown. When this happens during dwc2_driver_remove(), does this
bypass the disablement of the remaining PHY, clock, and bulk regulator
resources, causing a permanent leak?

[ ... ]
> @@ -716,31 +764,6 @@ static int __maybe_unused dwc2_resume(struct device =
*dev)
>  	}
>  	dwc2->phy_off_for_suspend =3D false;
> =20
> -	if (dwc2->params.activate_stm_id_vb_detection) {
> -		unsigned long flags;
> -		u32 ggpio, gotgctl;
> -
> -		ret =3D regulator_enable(dwc2->usb33d);

[Severity: High]
This STM32 hardware enable logic was previously executed unconditionally
on resume, but is now moved inside __dwc2_lowlevel_hw_enable().

In host mode with remote wakeup enabled, dwc2_host_can_poweroff_phy()
returns false, which skips __dwc2_lowlevel_hw_disable() during suspend
and leaves phy_off_for_suspend =3D false.

During dwc2_resume(), because phy_off_for_suspend is false,
__dwc2_lowlevel_hw_enable() is skipped entirely.

If the controller's power domain was disabled during suspend (losing
register values), doesn't skipping the STM32 hardware enable leave the
GGPIO register uninitialized, breaking VBUS and ID detection on resume?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013-dwc2-low-p=
ower-fixes-stm32-v2-0-79865a4f1b63@foss.st.com?part=3D5
