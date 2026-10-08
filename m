Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FB5443C11
	for <linux-usb@vger.kernel.org>; Thu,  8 Oct 2026 14:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791468248; cv=none; b=BTaw558c4frb9G1UTZVdSvZ8gaUyigWN4Y5AawKWJJQ+/Zj5Z1bf2T4ENaliS0M8NRRIRa4H9naNtxnvzVKaKBMpoicGP9nkRvgdq3Z9A+s+pwmmIHTJSuZ8TKULCp1BQcgcL2JuXgASaJvks+ps4eKswA2EQvxUDV13SIYd8TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791468248; c=relaxed/simple;
	bh=U9VDVKaoGmvrZ6S5yvEiOJuW1n/cBQOf1/sOnTDW8y0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=KY7JWDhXCMZgZSx62MbkGglHwmkDxl+egiKvH31JxfQ9h5UiQZPmSMy9XBD/V3y1ChHYot+hoRH+WK9s8UTENJtqymUgyEXaMrHvdz2huVcl5HFZEO3lMPHeh60dqmwQUGNeqi4bxkKz8dQBDKD/LeBCia5j6wplxziPS2FE5kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xmem928I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xmem928I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB3351F000FF;
	Thu,  8 Oct 2026 14:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791468247;
	bh=Bj0VtFn8lXZ3NF7QFqRgCn15z5SkfIRFHdwMlfJwo/U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Xmem928IQPlXRiRH0YC+8h23sfUKMuF0AkrPBI2z4VJbeNkw7RJkhR9ONlVQZeCU0
	 gNriW8Whuw/gLrZasi6p0TH+yiq9vz2sbR0nBseepi1U0bGHInqU2erHcQRX5RlNym
	 NtsqZxpyZafqi3OBKVnPk+h7mGVwp9H/2zmA1+kqGVIrBaQmEPzpi8QbGJm6lB3EMB
	 ErraTzKlUJEZ6v8YbFmlpfn5xVRFI5cKjefREIuqttSJX4PlA4i8WZjHIr5PWDGHMW
	 RRHUj5CWolnBJ2VwoCJwROr+U148eeLMtYFW0zf3ia6XJGG0aiZ6845B35k4OFIDzd
	 4H8Ed/s6biTGw==
Message-ID: <sashiko-outbox-164261@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/5] usb: dwc2: hcd: don't disable/enable external vbus
 by system suspend/resume
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabrice Gasnier" <fabrice.gasnier@foss.st.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261008-dwc2-low-power-fixes-stm32-v1-4-5b303df762e6@foss.st.com>
References: <20261008-dwc2-low-power-fixes-stm32-v1-0-5b303df762e6@foss.st.com>
 <20261008-dwc2-low-power-fixes-stm32-v1-4-5b303df762e6@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 14:04:06 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] usb: dwc2: port power state desync causing VBUS loss
--

commit 54bc47ce99a8e233efd17f79eba5998d68323c1d
Author: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

usb: dwc2: hcd: don't disable/enable external vbus by system suspend/resume

This commit removes the dwc2_vbus_supply_exit and dwc2_vbus_supply_init
calls during system suspend and resume. It aims to prevent incorrectly
increasing the regulator enable count when no device is connected to the
port.

Cc: stable@vger.kernel.org

> diff --git a/drivers/usb/dwc2/hcd.c b/drivers/usb/dwc2/hcd.c
> --- a/drivers/usb/dwc2/hcd.c
> +++ b/drivers/usb/dwc2/hcd.c

[ ... ]

> @@ -4499,10 +4495,7 @@ static int _dwc2_hcd_resume(struct usb_hcd *hcd)
>  		spin_lock_irqsave(&hsotg->lock, flags);
>  	}
> =20
> -	/* Enable external vbus supply after resuming the port. */
>  	spin_unlock_irqrestore(&hsotg->lock, flags);
> -	dwc2_vbus_supply_init(hsotg);
> -
>  	/* Wait for controller to correctly update D+/D- level */
>  	usleep_range(3000, 5000);
>  	spin_lock_irqsave(&hsotg->lock, flags);

[Severity: High]
Does removing the physical regulator initialization here cause a state
desynchronization with the HPRT0_PWR bit?

Later in _dwc2_hcd_resume(), the HPRT0_PWR bit is unconditionally set to 1:

	dwc2_writel(hsotg, HPRT0_PWR | HPRT0_CONNDET |
			HPRT0_ENACHG, HPRT0);

If the port is unpowered prior to this (e.g. at boot before the hub driver
powers it on), HPRT0_PWR becomes 1 without the physical regulator being
turned on.

When the hub driver subsequently tries to power on the port in
dwc2_hcd_hub_control(), it checks the prior state of HPRT0_PWR:

		pwr =3D hprt0 & HPRT0_PWR;
		hprt0 |=3D HPRT0_PWR;
		dwc2_writel(hsotg, hprt0, HPRT0);
		if (!pwr)
			dwc2_vbus_supply_init(hsotg);

Since _dwc2_hcd_resume() already forced HPRT0_PWR to 1, the condition (!pwr)
is false and dwc2_vbus_supply_init() is incorrectly skipped.

Could this leave the physical VBUS permanently off and prevent USB device
detection from functioning?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008-dwc2-low-p=
ower-fixes-stm32-v1-0-5b303df762e6@foss.st.com?part=3D4
