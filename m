Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795626496;
	b=BgNPTVZQ/dkx4WH41sSQy/YjOM1Ak1vAUh32DN706lSZKZbhBkz832IZTRcy7Qgppp9e
	 53vmkUQP4oKWgBhni+q9h8C5aZCBjlHLCx40VYX9W+IyNGLKF/jxAvgJDqaIR8AfzPDRw
	 QBO8sAwv4zTL+cA7ZFY4nQk0HmIR6u5bU5jA7+zrlfJ7+v/iFFsgvaw4lJuydNIC8Us0+
	 t+0RAHBLN5tMloww50f0AJszVqfgrStkmX62Ox2HWo7yM9BwSGLv1unJAv/OaA6k84Sy3
	 uvTEgZFJqJkOl+9J9uAywWSj9XdtD7cMC9A/4ydfCMki3Dc5343yhjFUMo1Oo7P4jUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795626496;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ek2SArFSV+/OHXxRNRAUMhUQqE2QIdqdb5cZleyM9Yw=;
	b=5RME9wegSN98QE2tcCWKGJ8NQKQEoBP55lJYEiy54Ti9Jy7D8GIWqBqNBUEDd4DEAaL9
	 XhD4MHI/AcYhqajaqfcxfDY4CVK6fUvxhdkWqPfjJVHAZ0BuAH4rSPPyut+Yd/TP8PdGh
	 It3N1pkhejMjmofGhv0greMVq7gR3+nEZISaliTbwBPri0fZK6ausLHuqk2IkuECpKmHm
	 xofLtiECL3vHVfeeEel7weGQCoVK5kNa+xw9hqbkWou1AzgVvO0RXSC1EFntaQkDsKZab
	 qiDli2lyRVOtBRw7+866cTlIwAAWLCU/SKGp8dx3XTt9XekDVRjGBecNZEEqRzppVAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PI5D1N3n;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480A7606A31E
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 17:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PI5D1N3n
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 007111F000C4;
	Wed, 25 Nov 2026 17:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795626496;
	bh=ek2SArFSV+/OHXxRNRAUMhUQqE2QIdqdb5cZleyM9Yw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PI5D1N3nGXF2ypoKqnQfTJ3K4wSPITVrb8PeTRKukVh4yfqK70GLF7pAm7SnT2G7J
	 S6scfVzDjuR3dRakhqjDcYieLFHOsfw5CvXplFa7D/XbgvqIPYqiW8jcmhZE7kYstX
	 NfnRIY91sdaTCfYuHq+SlPM1vWeQ8DgR+s2LBhHqxGJRw1bThFykXHuC4GJ+BvW/Eq
	 Pem/uIv6dklylOkHBoSejN3Nb/BcULORpBtsoG0fEmz+tU4sE9wQbryrlDOxrNv8/0
	 hialM80Ao5RbXbssR8C0W4uYuRUq72p08/LSE07eNOnC0/YQ5m5UxgB/rjbEnHTtys
	 EhoCopJ0Xw8CA==
Message-ID: <sashiko-outbox-233807@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 09/11] usb: dwc2: restore peripheral mode on
 low-level enable
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabrice Gasnier" <fabrice.gasnier@foss.st.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261125-dwc2-low-power-fixes-stm32-v6-9-d5df33b93eaf@foss.st.com>
References: <20261125-dwc2-low-power-fixes-stm32-v6-0-d5df33b93eaf@foss.st.com>
 <20261125-dwc2-low-power-fixes-stm32-v6-9-d5df33b93eaf@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 17:08:15 +0000
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
- [Medium] usb: dwc2: missing GOTGCTL override restore in
  dwc2_drd_resume() for ROLE_NONE
--

commit d994a6181c5bc6aa556fe623825b039f6d0ac91e
Author: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

usb: dwc2: restore peripheral mode on low-level enable

This commit restores the forced mode or role switch session overrides in
__dwc2_lowlevel_hw_enable() when dr_mode is USB_DR_MODE_PERIPHERAL, and
skips doing so in dwc2_resume() for peripheral mode.

> diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
> index 24ede0b6ab815..38954dee6ad0d 100644
> --- a/drivers/usb/dwc2/platform.c
> +++ b/drivers/usb/dwc2/platform.c
> @@ -129,6 +129,18 @@ static int __dwc2_lowlevel_hw_enable(struct dwc2_hso=
tg *hsotg)
>  	if (ret)
>  		goto err_dis_clk;
> =20
> +	if (hsotg->dr_mode =3D=3D USB_DR_MODE_PERIPHERAL) {
> +		/*
> +		 * Gadget code manages low-level hardware on its own. Restore
> +		 * the mode and role switch session after register loss while
> +		 * it was disabled.
> +		 */
> +		if (hsotg->role_sw)
> +			dwc2_drd_resume(hsotg);
> +		else
> +			dwc2_force_dr_mode(hsotg);
> +	}
> +
>  	return 0;
> =20
>  err_dis_clk:

[Severity: Medium]
Does dwc2_drd_resume() leave the GOTGCTL override enable bits cleared when
the role is USB_ROLE_NONE?

At probe, dwc2_ovr_init() enables GOTGCTL_BVALOEN, GOTGCTL_AVALOEN,
GOTGCTL_VBVALOEN and GOTGCTL_DBNCE_FLTR_BYPASS with the session valid
values cleared even when there is no default role.  If registers are lost
during suspend while ll_hw_enabled is false (so gr_backup is neither saved
nor restored) and a gadget driver binds while the role switch state is
USB_ROLE_NONE and role_sw_default_mode is USB_DR_MODE_UNKNOWN,
dwc2_drd_resume() skips writing GOTGCTL:

drivers/usb/dwc2/drd.c:dwc2_drd_resume() {
	...
		/* restore last role that may have been lost */
		if (role =3D=3D USB_ROLE_HOST)
			dwc2_ovr_avalid(hsotg, true);
		else if (role =3D=3D USB_ROLE_DEVICE)
			dwc2_ovr_bvalid(hsotg, true);

		dwc2_force_mode(hsotg, role =3D=3D USB_ROLE_HOST);
	...
}

Without those override enable bits, dwc2_force_mode() runs without
GOTGCTL_DBNCE_FLTR_BYPASS and dwc2_hsotg_core_connect() reads the raw PHY
GOTGCTL_BSESVLD signal instead of the role switch override.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-dwc2-low-p=
ower-fixes-stm32-v6-0-d5df33b93eaf@foss.st.com?part=3D9
