Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794602520;
	b=FoplO3bAX/vVB0Vru52zb0FHoHa0TlXS+e/Hjxts8OHdHXa+dDQJsGRZh5oTJcYgBBKK
	 UORouAqQbmksV+JeIN2L91Ws+VdzgBnxT78h3MtwJdV7ckBZMFUzYZ7RcCUlEvhdg3xgb
	 06lCVXfEjLwUImr908B9tj9j7xwZbVsklcQj0+8iTpKscGtagUw7UkSWvTqRKOXj00vqw
	 HIhI4bvVIkRLt6+PJf9Ruir/pD4+9jgDcQyo0MBxV4KOLA6dkdu7VwgXKSYGiigmqhyQd
	 iQNugoMfiV+tsdl1uVnHzAMAQe6ke3MprTvW1MurIq+eBMhPvZAuQYqKi9lfzOLJhdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794602520;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=2IRW67gQsgdGQV3BorhCW4rm7Xn2ewiIaBv4WaVCGDY=;
	b=dGR0T2y3TCg78ewCqpZx18S1UdWlhEHpsG+17SEoJR9k0jJ7qEWf6UBGGnxkhCZ3ohxC
	 asWOTGysfVUo69FFtSkfUH8e8mxmlCIt84/LEN/7pmX8qkS+3mZuIyCQG3Lhac7mo/D8R
	 7cAtuDo2YNUFrhh+O6+BjbSjzGpFYRITyxQNTMxr60kJhL4fo0xPfuCQjfBF6jbFtf5CM
	 3Kohn4ZCCsuVczDfN1tNZQ/+QCrRnhFzbMqPTiGX7Z+z0ExO3pMqEqIYszzKzF9N63UJ3
	 9LBoxieW9Qdm4XiVt++EbLOUUI5woAGVY2etQI6wUir+TmcSy728n7c+1tEO8/5/VLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mr4PO+AI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359CE606A339
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 20:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mr4PO+AI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEB2F1F000C4;
	Fri, 13 Nov 2026 20:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794602520;
	bh=2IRW67gQsgdGQV3BorhCW4rm7Xn2ewiIaBv4WaVCGDY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mr4PO+AIgF9nfMP0/46q5pkDjvVSedTm/m/y88Wn1NiN3Zv5tP/I6HYBFSyGcaMVo
	 C4AFZ63WMf3vy8Ccw2poK/tovw7wanUN5BIqNt8JdStLwmoQipNkMgffg39DjLLLoj
	 GC15bz5FxUURfPq4DW1YAox7fhv7+Ra4pEqar3d8unFn+fXWMPlXgDerrX9j0aWJg6
	 EFdGytOO6Q7Oev3hJMb8pESxZPffEzJeu0Y+yH1ssgWYAJV0C28d5crrpcRx01fxb5
	 KVixgaUBbbHGKOiaE4UArWBkv5wBDgSwlqmtyzimzGEj1U1eWyc+EQwKhkcwJ/dHTd
	 dy2qpxNxKD0+g==
Message-ID: <sashiko-outbox-213670@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 6/6] usb: dwc2: platform: fix stm32mp15 detection
 logic power management
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabrice Gasnier" <fabrice.gasnier@foss.st.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261113-dwc2-low-power-fixes-stm32-v4-6-08a8c962a09e@foss.st.com>
References: <20261113-dwc2-low-power-fixes-stm32-v4-0-08a8c962a09e@foss.st.com>
 <20261113-dwc2-low-power-fixes-stm32-v4-6-08a8c962a09e@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 20:41:59 +0000
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
- [Medium] usb: dwc2: missing forced mode restore in
  dwc2_stm32_hw_enable()
--

commit faf6843d2e18eaa77a4b2f6b54f7e23489971e73
Author: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

usb: dwc2: platform: fix stm32mp15 detection logic power management

This commit moves the STM32 ID/VBUS detection enable and disable logic into
dedicated helpers called from the low-level hardware enable/disable paths,
and tracks its state in stm32_id_vb_detection_enabled.

> diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
> index 968b4ba6d8141..7aa8d7c58e75f 100644
> --- a/drivers/usb/dwc2/platform.c
> +++ b/drivers/usb/dwc2/platform.c
> @@ -91,6 +91,95 @@ static int dwc2_get_dr_mode(struct dwc2_hsotg *hsotg)
>  	return 0;
>  }
> =20
> +static void dwc2_stm32_hw_activate_id_vb_detection(struct dwc2_hsotg *hs=
otg)
> +{
> +	unsigned long flags;
> +	u32 ggpio, gotgctl;
> +
> +	ggpio =3D dwc2_readl(hsotg, GGPIO);
> +	ggpio |=3D GGPIO_STM32_OTG_GCCFG_IDEN;
> +	ggpio |=3D GGPIO_STM32_OTG_GCCFG_VBDEN;
> +	dwc2_writel(hsotg, ggpio, GGPIO);
> +
> +	/* ID/VBUS detection startup time */
> +	usleep_range(5000, 7000);
> +
> +	spin_lock_irqsave(&hsotg->lock, flags);
> +	/* Remove overrides when resuming from the disable */
> +	gotgctl =3D dwc2_readl(hsotg, GOTGCTL);
> +	gotgctl &=3D ~GOTGCTL_DBNCE_FLTR_BYPASS;
> +	gotgctl &=3D ~(GOTGCTL_BVALOEN | GOTGCTL_AVALOEN |
> +		     GOTGCTL_BVALOVAL | GOTGCTL_AVALOVAL);
> +	dwc2_writel(hsotg, gotgctl, GOTGCTL);
> +	spin_unlock_irqrestore(&hsotg->lock, flags);
> +}
> +
> +static int dwc2_stm32_hw_enable(struct dwc2_hsotg *hsotg)
> +{
> +	int ret;
> +
> +	/* params are only known, once dwc2_init_params() has been probed */
> +	if (!hsotg->params.activate_stm_id_vb_detection)
> +		return 0;
> +
> +	if (hsotg->stm32_id_vb_detection_enabled)
> +		return 0;
> +
> +	ret =3D regulator_enable(hsotg->usb33d);
> +	if (ret)
> +		return ret;
> +
> +	dwc2_stm32_hw_activate_id_vb_detection(hsotg);
> +	hsotg->stm32_id_vb_detection_enabled =3D true;
> +
> +	return 0;
> +}

[Severity: Medium]
Does dwc2_stm32_hw_enable() leave GUSBCFG_FORCEDEVMODE cleared when a gadget
driver is bound after resuming from standby in peripheral mode?

When the system enters standby in USB_DR_MODE_PERIPHERAL with no gadget
driver bound, ll_hw_enabled is false, so dwc2_resume() returns early without
calling dwc2_force_dr_mode() and the controller registers reset during
standby.  When a gadget driver is later bound, dwc2_hsotg_udc_start() ->
dwc2_lowlevel_hw_enable() -> dwc2_stm32_hw_enable() enables
GGPIO_STM32_OTG_GCCFG_IDEN and clears the GOTGCTL overrides without
restoring GUSBCFG_FORCEDEVMODE.

If the ID pin is low, the OTG controller switches into host mode instead of
staying forced into device mode, breaking peripheral operation and hitting
WARN_ON(host && hsotg->dr_mode =3D=3D USB_DR_MODE_PERIPHERAL) in
dwc2_force_mode() on the next dwc2_stm32_hw_disable() call.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-dwc2-low-p=
ower-fixes-stm32-v4-0-08a8c962a09e@foss.st.com?part=3D6
