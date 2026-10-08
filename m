Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41FD4477E8
	for <linux-usb@vger.kernel.org>; Thu,  8 Oct 2026 13:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791467387; cv=none; b=IwtQ6Ri+A05kqf6Fz5wxeZrzuFOz/Sn6klBtpe2Qu9zOgDKOFN/1i4dagsvFNA0wPvJiYSegm2Jb4E6cIZImAuTLdA7Ft+UPnK3BOdpmiwYMUlYrc0cQ63G4+D7U9/F8DN0rYPQpbweCHXW6uCG6dMmzBk3ti1b2Yb2DHvahpzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791467387; c=relaxed/simple;
	bh=YN9VrVNjH7/2G6cUNK3mJNi/j193UoxIBgjKwZ8COGo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=n5iU14OJ+wemIKlQuGTepy+LTfoNLvyYDpcctftrz4xealUKPdn5Ss2JzQrggV9Egdx6sQ23nVDKC7DyuC2BIHHP7CTHqXocjEMw1pCHtLQiVj8beokm+nXzr6q2FR9qXqIZNEDArEqZbUYRbwodtO5WS6neO9xmB6kiJONmtiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IUSaH0xG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IUSaH0xG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AB541F000FF;
	Thu,  8 Oct 2026 13:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791467386;
	bh=CsMbOGfAYKQmBLD97vybNrOFYjFI361/X4zTqIzfsHA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IUSaH0xGksIDKBoYWItGUpCcLFB/jHxGTHJFOhCSbh5pdnMFUk1ePeGjF9eN7kvhZ
	 3IvMKWbZ2vWp5vMQQbs0pkd6jL78Ajg2kFlobp76u9EPhvwJo7ubuSBOrabr9nWdpX
	 AqZHqxwPGC+w5vSX6lNarzzg/2sq4WgtXFXSOQ8KeE+hdWYbDb0biEc6hPyYidIQBF
	 duGgsovwXPhpPLCevG05HEjcb3gkp8zu4oYf0IGcYOTHOPr/WmPUDGpwIcLbhugaiI
	 6cA8bPLQj5YzJRAVHu3212Uhf0A310jNROEe2keCZzIbdDA5X+9KJXYqDF47h7t5Co
	 YVhP3Iuhwk6Mw==
Message-ID: <sashiko-outbox-164243@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/5] usb: dwc2: fix a possible interrupt storm on
 stm32mp1
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabrice Gasnier" <fabrice.gasnier@foss.st.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261008-dwc2-low-power-fixes-stm32-v1-2-5b303df762e6@foss.st.com>
References: <20261008-dwc2-low-power-fixes-stm32-v1-0-5b303df762e6@foss.st.com>
 <20261008-dwc2-low-power-fixes-stm32-v1-2-5b303df762e6@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 13:49:45 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] usb: dwc2: NULL dereference of hcd in peripheral-only mode
- [High] usb: dwc2: incomplete fix for interrupt storm during resume from P=
PD/Hibernation
--

commit b421af8a6c891894bff06680a711320a770d78db
Author: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

usb: dwc2: fix a possible interrupt storm on stm32mp1

This commit addresses an interrupt storm on stm32mp1 seen during system res=
ume
from low power mode when in host mode. It sets the HCD_FLAG_HW_ACCESSIBLE f=
lag
in dwc2_handle_wakeup_detected_intr() after exiting clock gating, allowing
the controller to successfully process interrupts.

Cc: stable@vger.kernel.org

> diff --git a/drivers/usb/dwc2/core_intr.c b/drivers/usb/dwc2/core_intr.c
> index 9565e6a52725a..8f83c36d002da 100644
> --- a/drivers/usb/dwc2/core_intr.c
> +++ b/drivers/usb/dwc2/core_intr.c
> @@ -453,6 +453,8 @@ static void dwc2_handle_wakeup_detected_intr(struct d=
wc2_hsotg *hsotg)
>  		}
>  	} else {
>  		if (hsotg->lx_state =3D=3D DWC2_L2) {
> +			struct usb_hcd *hcd =3D hsotg->priv;
> +
>  			if (hsotg->in_ppd) {
>  				ret =3D dwc2_exit_partial_power_down(hsotg, 1,
>  								   true);
> @@ -463,8 +465,10 @@ static void dwc2_handle_wakeup_detected_intr(struct =
dwc2_hsotg *hsotg)
> =20
>  			if (hsotg->params.power_down =3D=3D
>  			    DWC2_POWER_DOWN_PARAM_NONE && hsotg->bus_suspended &&
> -			    !hsotg->params.no_clock_gating)
> +			    !hsotg->params.no_clock_gating) {
>  				dwc2_host_exit_clock_gating(hsotg, 1);
> +				set_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags);
> +			}

[Severity: High]
Is the interrupt storm fix incomplete because the HCD_FLAG_HW_ACCESSIBLE
restoration is restricted to the clock gating case?

If the platform uses Partial Power Down (DWC2_POWER_DOWN_PARAM_PARTIAL) or
Hibernation (DWC2_POWER_DOWN_PARAM_HIBERNATION), _dwc2_hcd_suspend() also
clears the HCD_FLAG_HW_ACCESSIBLE flag.

When the system wakes up in those modes, dwc2_handle_wakeup_detected_intr()
executes the partial power down exit paths (such as the call to
dwc2_exit_partial_power_down() just above this block) but never restores the
HCD_FLAG_HW_ACCESSIBLE flag since this restoration is placed inside the
DWC2_POWER_DOWN_PARAM_NONE condition.

Will the same interrupt storm bug persist for platforms using PPD or
Hibernation?

[Severity: High]
Can this unconditionally dereference hcd and cause a kernel panic in a
peripheral-only configuration?

If the system is built with CONFIG_USB_DWC2_PERIPHERAL=3Dy or constrained to
peripheral mode (dr_mode =3D=3D USB_DR_MODE_PERIPHERAL), dwc2_hcd_init() is
skipped, meaning hsotg->priv (and thus hcd) remains NULL.

If the hardware is suspended (hsotg->lx_state =3D=3D DWC2_L2), and an OTG c=
able
insertion or hardware transient autonomously switches the controller's CURM=
ODE
bit to Host mode, dwc2_is_device_mode() will return false.

Execution will then enter this host branch in
dwc2_handle_wakeup_detected_intr(), leading to a NULL pointer dereference
when it tries to update hcd->flags.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008-dwc2-low-p=
ower-fixes-stm32-v1-0-5b303df762e6@foss.st.com?part=3D2
