Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDA92EA749
	for <linux-usb@vger.kernel.org>; Thu,  8 Oct 2026 13:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791467615; cv=none; b=EcowTTR63NN+L3jSj7BudADUU5Xa2Dygtzn1revjIkwXyIFXouxDE8tG5lx5R2L5OgesnvHKi1MVJUHw0VP3rFImEPfxbvcaa5mBOpCkxE17udZJr19bT752iS+/yH8VN2sCfFL801vops7j64FC/TB3FgLpSTthipaEBGpC74I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791467615; c=relaxed/simple;
	bh=GIDC0ERfeEzij6GS39WLsG+Ikwe05ghZ1HJFoBxj4/U=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=lXsj1PswY3jMZCRjltpckBn0HStHt0N5HmjNe4Rxj/Y+nhUz/cm5C3H0Qgo4lM+o9nawgaGcwRk4FmnQKW5O/8yvbpcrs16N2b4zuQX/lzXtVuYo50lU1YPPPdBLzlds+7KgZbYoeP2RBeNvadz0MAEvK0KCh0sdqax8FKdsT+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DzOJkWs8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DzOJkWs8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 030CE1F000FF;
	Thu,  8 Oct 2026 13:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791467614;
	bh=Xxe65q75JRT8ua25YA2ZqQYSHD75sNLL3N0IfWFJ26I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DzOJkWs8mBks6TpYSI7z+UH8n9jxzRex8JJ7GLCEQDjCnbMdjt8M2Pdg1Z3qUbS1Q
	 h091sYsfk7c+0KzvesDHpnR3TxKUjYU+58VFBmmjHgiDdvs9OJ/yU3oHO2Fpmd05Qe
	 CC0fuSwV/gB68pQ/V/mZQXfKzG+2tTVmQBf+iG/ULWnq9v4o2xO+659rmbjsB+OdDh
	 laqHh8pwZMvwBZqGGS/YuGiT57iDGk/ZVu9ePe8Mine1DMDEKwllKpMelR7BZSg8K8
	 QmamHOJwDVxX8466JBEUyIzOgWoG2eah69OhlF7Vz/KBeH4FCwjlOpniIBXrSF4rbz
	 pS6/jYpPVtjEQ==
Message-ID: <sashiko-outbox-164252@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/5] usb: dwc2: fix recovery after PM domain off
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabrice Gasnier" <fabrice.gasnier@foss.st.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261008-dwc2-low-power-fixes-stm32-v1-1-5b303df762e6@foss.st.com>
References: <20261008-dwc2-low-power-fixes-stm32-v1-0-5b303df762e6@foss.st.com>
 <20261008-dwc2-low-power-fixes-stm32-v1-1-5b303df762e6@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 13:53:33 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] usb: dwc2: gadget state lost on system resume with clock gating
- [Medium] usb: dwc2: missing resource cleanup on dwc2_core_init failure
--

commit 0a7c02abb23c7f52b48654e1d1781cd4041fb820
Author: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Subject: usb: dwc2: fix recovery after PM domain off

This commit modifies the PM suspend and resume recovery mechanism for dwc2
to prevent freezes when reading registers during clock gating. It removes
the manual backup of critical registers during suspend and moves the core
re-initialization logic to dwc2_resume().

> diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
> index ef0d730770347..643d67ce28ea2 100644
> --- a/drivers/usb/dwc2/platform.c
> +++ b/drivers/usb/dwc2/platform.c
> @@ -692,14 +692,6 @@ static int __maybe_unused dwc2_suspend(struct device=
 *dev)
>  		regulator_disable(dwc2->usb33d);
>  	}
> =20
> -	if (is_device_mode)
> -		ret =3D dwc2_gadget_backup_critical_registers(dwc2);
> -	else
> -		ret =3D dwc2_host_backup_critical_registers(dwc2);
> -
> -	if (ret)
> -		return ret;
> -
>  	if (dwc2->ll_hw_enabled &&
>  	    (is_device_mode || dwc2_host_can_poweroff_phy(dwc2))) {
>  		ret =3D __dwc2_lowlevel_hw_disable(dwc2);

[ ... ]

> @@ -786,6 +748,22 @@ static int __maybe_unused dwc2_resume(struct device =
*dev)
>  		dwc2_drd_resume(dwc2);
>  	}
> =20
> +	/*
> +	 * During suspend it's possible that the power domain for the
> +	 * DWC2 controller is disabled and all register values get lost.
> +	 * In case the GUSBCFG register is not initialized, it's clear the
> +	 * registers must be restored. So invoke here the necessary init
> +	 * as done by dwc2_hcd_init() during probe.
> +	 */
> +	if (!(dwc2_readl(dwc2, GUSBCFG) & GUSBCFG_TOUTCAL_MASK)) {
> +		if (dwc2->dr_mode !=3D USB_DR_MODE_PERIPHERAL) {

[Severity: High]
Does this leave the USB gadget permanently unresponsive if the USB bus was
suspended by the host prior to system suspend?

Since the manual backup of critical gadget registers was removed from
dwc2_suspend(), the platform cuts power to the controller and wipes all
hardware registers during suspend. On system resume, this check explicitly
skips dwc2_core_init() for pure peripheral mode (USB_DR_MODE_PERIPHERAL).

Subsequently, dwc2_hsotg_resume() is called, which can return early:

drivers/usb/dwc2/gadget.c:dwc2_hsotg_resume() {
	...
	if (hsotg->lx_state =3D=3D DWC2_L2)
		return 0;
	...
}

Will this cause the device core and endpoints to remain completely
uninitialized since they are never restored or re-initialized?

> +			ret =3D dwc2_core_init(dwc2, true);
> +			if (ret)
> +				return ret;

[Severity: Medium]
Does this error path leak hardware resources?

Earlier in dwc2_resume(), __dwc2_lowlevel_hw_enable() is called to enable
clocks and regulators. If dwc2_core_init() fails and returns directly here,
does it bypass the required __dwc2_lowlevel_hw_disable() cleanup?

> +			dwc2_enable_global_interrupts(dwc2);
> +		}
> +	}
> +
>  	if (dwc2_is_device_mode(dwc2))
>  		ret =3D dwc2_hsotg_resume(dwc2);
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008-dwc2-low-p=
ower-fixes-stm32-v1-0-5b303df762e6@foss.st.com?part=3D1
