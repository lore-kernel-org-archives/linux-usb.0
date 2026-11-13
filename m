Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794598225;
	b=Zbw85pSLHQwMiCT+qf3VzJXuAOpWIA3KK5BXVGItXKAvqnswBhfUGcE2a3RdYoMO9bao
	 VSA31K/MPiErh0umZOZs9vrrhgQpz5ZOOFXUs7+qHTFA6BP6TWrDYKDUHqFldav2tqDj+
	 EbmAqUkXbkPOasHRFvFkKGX9jqyN353jgdI9OVFAn6rXR1vMXhywnlHvcL3iOLZ2/Xmyf
	 LOP6CjbMX78tOa1Uibd+8njP82mXsGsFOAxl8es3mVfrHTePqcgVfZ2vIbnfT78czuokj
	 z6OOmWvzmaAOlHnYqOMz+5JWo57kYvkaOEqoi9/MbPi/WANHBbqbKtMddAuaUN9R/hQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794598225;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=rV4iJNANEHbV4u+uyUlP/9F5a53jpWyVyeSmnmH2dNw=;
	b=4ovAKAcEqtBGUfWIpnHrqnvhw8R4HStXtd+cJ34UcXayRZwlMrh/QFF4EBuc9FU8mhZ9
	 3v5zo2W1q+T2OdaNPek7brPbTKlQo8MCMDo4ULIfxUf7By+V80Rgd2DE4q+QqR1jkcQQq
	 pu64J5Rboo+0NCGM5jsG7WIUtPgCz/GfPBvwjlDbwczZBp4bRX2W68wxNR/KIa+ABBn+M
	 ChmNbkFDmViBf+CmYw0aqsC29mh9JrS6gF4c56CWb5f+0Sp15SwjU2O4vjnKGnvZJ6E+M
	 C5s47cgobDbKJfTtaxmrCqqvXQMQXneBZzQT+GtEHBBHJt3IVtjVZRWob1GAnPB+A8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="CSo/fZ2C";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1B1606A332
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 19:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CSo/fZ2C
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7E7A1F000C4;
	Fri, 13 Nov 2026 19:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794598225;
	bh=rV4iJNANEHbV4u+uyUlP/9F5a53jpWyVyeSmnmH2dNw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CSo/fZ2CzEqpJ4OsmeEOvUAqKU4oVUKviLvKwQGDwUYEe4RF9zkzuITOp+a76Z8LC
	 tzM+fpmRp/7dHDgpqQLfX2Nbmj2QreVqD9mfPsvErh1rvWuzM6d7LYx/Rro9AzlHzh
	 dHVdZzABC3dtMTbVZFG3FFY8dMWFyWgQT4ndskpl7lMDfLb6GaXkLzSvn7g4kR0BZ2
	 FVEW4JfbBB2ZWHdfLC5Lqz5g3AA64Qdx0COr219XyIYRimlkaV70SspTmSGUbHF3zI
	 lF5LLhTyOpUReNkeYLI/++ibUGx0vzN7Pcbr8JySnmDxatHzt0lgov1k7gbvyXLc6P
	 8ps7IaFmKRxLQ==
Message-ID: <sashiko-outbox-213551@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/6] usb: dwc2: fix recovery after PM domain off
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabrice Gasnier" <fabrice.gasnier@foss.st.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261113-dwc2-low-power-fixes-stm32-v4-1-08a8c962a09e@foss.st.com>
References: <20261113-dwc2-low-power-fixes-stm32-v4-0-08a8c962a09e@foss.st.com>
 <20261113-dwc2-low-power-fixes-stm32-v4-1-08a8c962a09e@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 19:30:24 +0000
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
- [Medium] usb: dwc2: premature IRQ enable and incomplete cleanup in
  device resume
- [Low] usb: dwc2: stale commit message note on HPRT0_CONNSTS in host
  resume
--

commit 3fc088190fe8f18420841b384b9d96f416a409a2
Author: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

usb: dwc2: fix recovery after PM domain off

This commit removes the critical register backup from dwc2_suspend() and
instead reinitializes the DWC2 controller, HCD, and gadget state during
dwc2_resume() when GUSBCFG.TOUTCAL indicates that registers were lost.

> Host resume observes HPRT0_CONNSTS cleared after register loss, so it
> does not skip the recovery path. Ordinary resume and USB-reset behavior
> remain unchanged.

[Severity: Low]
Is this note about HPRT0_CONNSTS still accurate?

dwc2_hcd_restore() now sets hsotg->lx_state =3D DWC2_L0 during platform
resume, so when _dwc2_hcd_resume() runs later it returns early at the
hsotg->lx_state !=3D DWC2_L2 check before reading HPRT0:

drivers/usb/dwc2/hcd.c:_dwc2_hcd_resume() {
    ...
	if (hsotg->lx_state !=3D DWC2_L2)
		goto unlock;

	hprt0 =3D dwc2_read_hprt0(hsotg);
    ...
	if (hprt0 & HPRT0_CONNSTS) {
		hsotg->lx_state =3D DWC2_L0;
		goto unlock;
	}
    ...
}

> diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
> index 6c8a9f05fff00..225442471aa95 100644
> --- a/drivers/usb/dwc2/gadget.c
> +++ b/drivers/usb/dwc2/gadget.c
> @@ -5200,11 +5200,12 @@ int dwc2_hsotg_suspend(struct dwc2_hsotg *hsotg)
>  	return 0;
>  }
> =20
> -int dwc2_hsotg_resume(struct dwc2_hsotg *hsotg)
> +int dwc2_hsotg_resume(struct dwc2_hsotg *hsotg, bool need_restore)
>  {
>  	unsigned long flags;
> +	int ep;
> =20
> -	if (hsotg->lx_state =3D=3D DWC2_L2)
> +	if (!need_restore && hsotg->lx_state =3D=3D DWC2_L2)
>  		return 0;
> =20
>  	if (hsotg->driver) {
> @@ -5212,6 +5213,19 @@ int dwc2_hsotg_resume(struct dwc2_hsotg *hsotg)
>  			 hsotg->driver->driver.name);
> =20
>  		spin_lock_irqsave(&hsotg->lock, flags);
> +		if (need_restore) {
> +			hsotg->hibernated =3D 0;
> +			hsotg->in_ppd =3D 0;
> +			hsotg->bus_suspended =3D false;
> +			dwc2_hsotg_disconnect(hsotg);
> +			for (ep =3D 1; ep < hsotg->num_of_eps; ep++) {
> +				if (hsotg->eps_in[ep])
> +					dwc2_hsotg_ep_disable(&hsotg->eps_in[ep]->ep);
> +				if (hsotg->eps_out[ep])
> +					dwc2_hsotg_ep_disable(&hsotg->eps_out[ep]->ep);
> +			}
> +			hsotg->gadget.speed =3D USB_SPEED_UNKNOWN;
> +		}
>  		dwc2_hsotg_core_init_disconnected(hsotg, false);
>  		if (hsotg->enabled) {
>  			/* Enable ACG feature in device mode,if supported */

[ ... ]

> diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
> index ef0d730770347..72214593f4312 100644
> --- a/drivers/usb/dwc2/platform.c
> +++ b/drivers/usb/dwc2/platform.c

[ ... ]

> @@ -786,8 +749,31 @@ static int __maybe_unused dwc2_resume(struct device =
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
> +			if (dwc2_is_device_mode(dwc2)) {
> +				ret =3D dwc2_core_init(dwc2, true);
> +				if (ret)
> +					return ret;
> +				dwc2_enable_global_interrupts(dwc2);
> +			} else {
> +				ret =3D dwc2_hcd_restore(dwc2);
> +				if (ret)
> +					return ret;
> +			}
> +		}
> +	}
> +
>  	if (dwc2_is_device_mode(dwc2))
> -		ret =3D dwc2_hsotg_resume(dwc2);
> +		ret =3D dwc2_hsotg_resume(dwc2, need_restore);
> =20
>  	return ret;
>  }

[Severity: Medium]
Can enabling global interrupts here race with the state cleanup in
dwc2_hsotg_resume()?

dwc2_core_init() unmasks GINTMSK_COMMON (including GINTSTS_USBSUSP and
GINTSTS_WKUPINT), and dwc2_enable_global_interrupts() sets
GAHBCFG_GLBL_INTR_EN before dwc2_hsotg_resume() takes hsotg->lock and
clears hsotg->hibernated, hsotg->in_ppd, hsotg->bus_suspended, and
hsotg->connected.  In addition, dwc2_hsotg_disconnect() drops and
reacquires hsotg->lock before dwc2_hsotg_core_init_disconnected()
reinitializes the device registers:

dwc2_resume()
  dwc2_core_init(dwc2, true)
  dwc2_enable_global_interrupts(dwc2)
  <hardirq>
    dwc2_handle_common_intr()
      ...
        dwc2_handle_usb_suspend_intr()
          dwc2_gadget_enter_clock_gating()  <-- sees connected =3D=3D 1, ga=
tes clk
  dwc2_hsotg_resume(dwc2, true)
    spin_lock_irqsave(&hsotg->lock, flags)
    ...
    dwc2_hsotg_ep_disable()
      dwc2_readl(hsotg, DIEPCTL(index))     <-- hangs with clock gated

If GINTSTS_USBSUSP fires while hsotg->connected is still 1 and DSTS_SUSPSTS
is set after reset, dwc2_handle_usb_suspend_intr() enters clock gating or
partial power down right before dwc2_hsotg_ep_disable() accesses endpoint
registers, hanging the platform.  Similarly, an early wakeup or common
interrupt while hsotg->hibernated or hsotg->in_ppd is still 1 will run the
hibernation or partial-power-down exit paths using stale register backups.

Also, unlike dwc2_hcd_restore(), the device-mode restore path does not
clear gr_backup.valid, dr_backup.valid, or hr_backup.valid, and if
hsotg->driver is NULL, dwc2_hsotg_resume() skips the need_restore cleanup
entirely, leaving hibernated, in_ppd, bus_suspended, and lx_state stale.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-dwc2-low-p=
ower-fixes-stm32-v4-0-08a8c962a09e@foss.st.com?part=3D1
