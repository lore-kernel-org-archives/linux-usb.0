Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793988983;
	b=p/J9YMPsefJqGOnsfqt4oqB1yg29h2KQRoiwMcoPuyhgRGbzGEFpiiXyXSwr141RdQSJ
	 Pf2m7I8z2TRcBOpgcLuFfcgC3z+wOofo1xPa05Ddr5Q6uD1nAKqDEsi7WNLYUtORwv81l
	 SJPi4anXbYiesIfeiNjGYPkIErUW7ZSLhOtAX8Dl0aF+2h76vF60t0rcVfS1XPIMaxUxI
	 ambZ/obLuwz8/qS35MfJa0zo5EiVRC1W9Ks3lV4vQv8m3yI0LUyEt8DTKEp+xmhY6tlWw
	 IiEC8zR169Rv5gdQ9F8JTyKXPGNp4J5VR8EAqSXrgfsYkIrIm8+mFpUUabhlK0k8iDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793988983;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=hbDWNF1GSoiNW/Nt7iKdiF53IhXTlTaPI/8v/G+fE50=;
	b=xrPc+6RAC9FRuM8Icfkp8eNc4yWBnlbxtQOlf7jRCTZp3w/756X5aOHcCpsRWViO387e
	 WQmrVFmJV71WeH+vc2B+Ym5ZJsep1RuBI7vndHrvGcHF7LISQ+dXjrIzaoTGkl95yUlW+
	 mH1GpFyXnyXIdIjIGio/1kvo1h/TqU+hV2rL9BYpgV2Vf1qt+swXuPEpTM0xpTTu3LrIK
	 Kk/EpLIqtVJxZkk42LHeNuBUW5k9Xx0rWJmQVDqHUzE0hOcIuG2523BNJqFPDuAQ4tLKw
	 1ai0+KK6GYJihsQHiI5qb83jEouce+S2n29Xo6lwyQ+J0JQhbS1VajueD0MlBExYiLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P3MZuWNm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FBC606D815
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 18:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P3MZuWNm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7DD61F008A4;
	Fri,  6 Nov 2026 18:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793988983;
	bh=hbDWNF1GSoiNW/Nt7iKdiF53IhXTlTaPI/8v/G+fE50=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P3MZuWNm1uWRjFT7n2DUcI8BN+whbPOnDyGGUkwsj0hxGPUfLAnMBYshGiwamqB/9
	 6wgY88ypbBB2qlRsHJ3iQRfhfOgf/YeEhMVAWPLI3Cu1tQMcr762wfnrU/Wc7XrZ2j
	 v1llBZjHd216RC/wETRxW0W9i67USv4rtAWJ7m8fBMi7xar46LOuOQFOUiRPiG0/WW
	 MUSSNpRoFcqlmHIKGD8AVBFAplTWJKZokKxo/1U/rez2Gpz1EVvvJJEDropfi6X32B
	 hWort1K9XTOZurRADQ3GeNLp+uUk0vNkVhzxCe21i070wdS/zfSsYluMgnbrjYpv9i
	 cyl+o9BbvSGHA==
Message-ID: <sashiko-outbox-202003@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/6] usb: dwc2: fix recovery after PM domain off
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabrice Gasnier" <fabrice.gasnier@foss.st.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261106-dwc2-low-power-fixes-stm32-v3-1-68d2a0e9bab6@foss.st.com>
References: <20261106-dwc2-low-power-fixes-stm32-v3-0-68d2a0e9bab6@foss.st.com>
 <20261106-dwc2-low-power-fixes-stm32-v3-1-68d2a0e9bab6@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 18:16:22 +0000
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
- [High] usb: dwc2: incomplete gadget state cleanup in
  dwc2_hsotg_resume()
- [High] usb: dwc2: incomplete host mode recovery in dwc2_resume() after
  PM domain off
--

commit 8e3990c7f49dc88c8bdad98a994d532a0d203385
Author: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

usb: dwc2: fix recovery after PM domain off

This commit removes the critical register backup/restore calls in
dwc2_suspend() and dwc2_resume(), and instead re-initializes the core on
resume when GUSBCFG_TOUTCAL indicates that the power domain was turned off.

> diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
> index 6c8a9f05fff00..99463e65d5b4b 100644
> --- a/drivers/usb/dwc2/gadget.c
> +++ b/drivers/usb/dwc2/gadget.c
> @@ -5200,11 +5200,11 @@ int dwc2_hsotg_suspend(struct dwc2_hsotg *hsotg)
>  	return 0;
>  }
> =20
> -int dwc2_hsotg_resume(struct dwc2_hsotg *hsotg)
> +int dwc2_hsotg_resume(struct dwc2_hsotg *hsotg, bool need_restore)
>  {
>  	unsigned long flags;
> =20
> -	if (hsotg->lx_state =3D=3D DWC2_L2)
> +	if (!need_restore && hsotg->lx_state =3D=3D DWC2_L2)
>  		return 0;
> =20
>  	if (hsotg->driver) {

[Severity: High]
When the host has already suspended the bus before system suspend
(hsotg->lx_state =3D=3D DWC2_L2), does resuming with need_restore =3D=3D tr=
ue leave
the gadget's software state out of sync with the reset hardware?

Because hsotg->lx_state !=3D DWC2_L0 during dwc2_hsotg_suspend(), the suspe=
nd
path returns early without calling dwc2_hsotg_disconnect() or disabling
non-EP0 endpoints, and the L2 entry path has set hsotg->bus_suspended,
hsotg->in_ppd, or hsotg->hibernated.  On resume, dwc2_hsotg_resume() calls
dwc2_hsotg_core_init_disconnected(hsotg, false), which resets the core and
sets hsotg->lx_state =3D DWC2_L0, but only disables non-EP0 endpoints when
is_usb_reset is true:

drivers/usb/dwc2/gadget.c:dwc2_hsotg_core_init_disconnected() {
    ...
	if (!is_usb_reset) {
		if (dwc2_core_reset(hsotg, true))
			return;
	} else {
		/* all endpoints should be shutdown */
		for (ep =3D 1; ep < hsotg->num_of_eps; ep++) {
			if (hsotg->eps_in[ep])
				dwc2_hsotg_ep_disable(&hsotg->eps_in[ep]->ep);
			if (hsotg->eps_out[ep])
				dwc2_hsotg_ep_disable(&hsotg->eps_out[ep]->ep);
		}
	}
    ...
}

This wipes the hardware endpoint configuration and hsotg->fifo_map while
leaving non-EP0 endpoints enabled with queued requests and leaving the
low-power flags set (for example, stale hsotg->hibernated =3D=3D 1 causes
dwc2_handle_common_intr() to ignore interrupts, and stale hsotg->in_ppd =3D=
=3D 1
causes dwc2_hsotg_pullup() to restore pre-suspend register backups).

> diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
> index ef0d730770347..b65b9898bac0d 100644
> --- a/drivers/usb/dwc2/platform.c
> +++ b/drivers/usb/dwc2/platform.c

[ ... ]

> @@ -786,8 +749,25 @@ static int __maybe_unused dwc2_resume(struct device =
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
> +	need_restore =3D !(dwc2_readl(dwc2, GUSBCFG) & GUSBCFG_TOUTCAL_MASK);
> +	if (need_restore) {
> +		if (dwc2->dr_mode !=3D USB_DR_MODE_PERIPHERAL) {
> +			ret =3D dwc2_core_init(dwc2, true);
> +			if (ret)
> +				return ret;
> +			dwc2_enable_global_interrupts(dwc2);
> +		}
> +	}

[Severity: High]
Does calling only dwc2_core_init() and dwc2_enable_global_interrupts() here
break host-mode recovery when hsotg->params.power_down is
DWC2_POWER_DOWN_PARAM_PARTIAL or DWC2_POWER_DOWN_PARAM_HIBERNATION?

dwc2_core_init() only initializes the common core registers and relies on
_dwc2_hcd_resume() to reinitialize the host registers (HCFG, FIFOs,
HPRT0_PWR, host GINTMSK, and GUSBCFG_TOUTCAL).  However, _dwc2_hcd_resume()
only calls dwc2_hcd_reinit() for DWC2_POWER_DOWN_PARAM_NONE:

drivers/usb/dwc2/hcd.c:_dwc2_hcd_resume() {
    ...
	switch (hsotg->params.power_down) {
	case DWC2_POWER_DOWN_PARAM_PARTIAL:
		ret =3D dwc2_exit_partial_power_down(hsotg, 0, true);
    ...
		break;
	case DWC2_POWER_DOWN_PARAM_HIBERNATION:
		ret =3D dwc2_exit_hibernation(hsotg, 0, 0, 1);
    ...
}

When no device was connected during _dwc2_hcd_suspend() (!(dwc2_read_hprt0()
& HPRT0_CONNSTS)), _dwc2_hcd_suspend() jumps to skip_power_saving without
backing up registers, so dwc2_exit_partial_power_down() or
dwc2_exit_hibernation() fails with -EINVAL on gr->valid and hcd_bus_resume()
marks the HCD dead via usb_hc_died().  Even when a device was connected in
DWC2_POWER_DOWN_PARAM_PARTIAL mode, on platforms where GOTGCTL_CURMODE_HOST
is not set in GOTGCTL, dwc2_exit_partial_power_down() takes the device
branch and fails with -EINVAL on dr_backup.valid.  Finally, on an OTG
controller that was in device mode during _dwc2_hcd_suspend() (leaving
lx_state !=3D DWC2_L2) and resumes in host mode, _dwc2_hcd_resume() returns
early at hsotg->lx_state !=3D DWC2_L2 without initializing the host registe=
rs.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-dwc2-low-p=
ower-fixes-stm32-v3-0-68d2a0e9bab6@foss.st.com?part=3D1
