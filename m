Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296786;
	b=Ml5puYacC9nN+Lx1J79jEXfEhsZDvhN9BS+NiaD71/ajsjWmf4y6gq8BAqjL5/+MoE/S
	 +ewEuhmf2uheoNxWMCa2r/atbYacGCxoIrI21QdGj1/EWChoFkmF5Fl8voHy6fRc7B1tz
	 KrnYEqfcIVo40eWxc2eM01/zasLFc4iSLzW3p4Zm3t8Byzuq2sRz2TPXgWSh2sKKz4lWg
	 sEe0rYATB22gyOkaOH4mTaGg0IpG8/rHt22aelhKcKZvZ5LNxmXWsUWTjA6z+t3tZieZJ
	 rlXg5k1zyr7cabPVUcmT11hzzM0e+ul8XlUcpsHZRX/miKT9E6iTGFohcSNyW1aqoJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296786;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=mzH8uhWizhXKEgAY1kS8dwpj3rKZVr4WlZO9lsGFkn4=;
	b=dyUiruICUfrjnkHmNyEDqKw0DYKu5KF/BIikPD3q7OeCpF9BnX7XLIQeaG6Zu8Tl1Z2y
	 JyJAZMcECx6WbwNStuXJTdibLlD4tg/68vXTqSeJ+8jMt7ejPPos+0chChV5xaqTijqzv
	 5S4z6S5JeVlufh2qtU6Gq6mU8pRgRfjV5rD491u07dPTngdiByuX9/CE6AdNB+FfQIsK8
	 nON6yO3Okqh0j3YyzhnwCeBx+2iWIZrtpN7wkZ47yYujHnIw5QGIB/q70AfT7NrnBjP/y
	 nk5IAVsihl12nzzPSYA6bCpd8BZHPj5knlnUQ/ZVnZsZ5rBh40tvSOKoRKiNzWDjrHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZYsfsyPr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5890606A326
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 07:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZYsfsyPr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 287DA1F0089F;
	Tue, 10 Nov 2026 07:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794296785;
	bh=mzH8uhWizhXKEgAY1kS8dwpj3rKZVr4WlZO9lsGFkn4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZYsfsyPrY6SuXI7KGP9SHC2BQJARv+p5gw4gdC0P3SxxsCoDEfdrF9HLgBaB0TU+E
	 142THSdBM/bpa0qyftcSUYNcRnxU0znyjzlhk6x9bkLP8VRu6LVOsqlGzFnZ62AuX3
	 Fcv/NCt/7U8+Dj+kR+4xD780FtIVI3tMyZ1Scy9uGaOF15aWjSLNyVvVN1tKq7iyY5
	 jXUoLpoUHayw+NQb3AfR08GFmpD6IyCKmzhpP5XUNNw5epkt9kuL4j01WAsx5/vtPw
	 uZZCquchjzoekU2IkXI3Ivv2j7Med1ffgu5b2P6WkrUfYKVoWu+jzpga3Nn1md9zC9
	 YvIoBujhxa3xQ==
Message-ID: <sashiko-outbox-206533@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] usb: dwc3: Keep the host bus suspended, not torn
 down, across suspend-to-idle
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arun Iyengar" <aiyengar1990@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110-dwc3-s2idle-v1-2-2ef4cc3f8130@gmail.com>
References: <20261110-dwc3-s2idle-v1-0-2ef4cc3f8130@gmail.com>
 <20261110-dwc3-s2idle-v1-2-2ef4cc3f8130@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 07:46:24 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [High] usb: dwc3: dwc3_google_suspend() resets core in s2idle when
  wakeup is off
- [High] usb: dwc3: dwc3_host_core_exit_needed() breaks parent glue
  resets in s2idle
- [High] usb: dwc3: device_set_awake_path() fails to keep non-wakeup
  genpd on in s2idle
--

commit 2b3424195227cb5706b93edc71af29a9569a4ddf
Author: Arun Iyengar <aiyengar1990@gmail.com>

usb: dwc3: Keep the host bus suspended, not torn down, across suspend-to-id=
le

This commit skips tearing down the DWC3 core in host mode during
suspend-to-idle when full reinitialization is not required, and marks the
device as being on the awake path to keep its power domain active.

> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index 2b31f146e43fc..8b335ba7cde4d 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
[ ... ]
> @@ -2539,6 +2540,29 @@ static int dwc3_core_init_for_resume(struct dwc3 *=
dwc)
>  	return ret;
>  }
> =20
> +/*
> + * In host mode, system suspend suspends the bus: xhci-plat puts the roo=
t ports
> + * and with them every attached device into U3/suspend, and the USB core
> + * expects them to keep that power session (see
> + * Documentation/driver-api/usb/persist.rst). Tearing the core down here=
 ends
> + * all power sessions: the devices then have to go through a reset-resum=
e, and
> + * a device that takes longer than the USB core allows to come back (it =
has to
> + * recover its link from scratch, a hub behind the port is reset and swi=
tches
> + * its own ports off) is disconnected, e.g. with a mounted filesystem.
> + *
> + * Only do that when the core will lose its state anyway or the system g=
oes
> + * into a state that powers it down: keep it for wakeup, and for
> + * suspend-to-idle, where nothing is powered off behind the drivers' bac=
k.
> + */
> +static bool dwc3_host_core_exit_needed(struct dwc3 *dwc)
> +{
> +	if (dwc->needs_full_reinit)
> +		return true;
> +	if (device_may_wakeup(dwc->dev))
> +		return false;
> +	return pm_suspend_target_state !=3D PM_SUSPEND_TO_IDLE;
> +}

[Severity: High]
Does skipping dwc3_core_exit() in PM_SUSPEND_TO_IDLE break parent glue
drivers that reset or power down the hardware in their own .suspend()
callbacks?

Parent glue drivers that populate a child snps,dwc3 device via
of_platform_populate() bind it to dwc3_probe(), where needs_full_reinit is
false.  During PM_SUSPEND_TO_IDLE, device .suspend() callbacks still run:
for example, dwc3_of_simple_suspend() asserts simple->resets when
simple->need_reset is set (such as on rockchip,rk3399-dwc3),
dwc3_meson_g12a_suspend() powers off and exits the PHYs before pulsing
reset on resume, and dwc3_exynos_suspend() disables the vdd33/vdd10
regulators.

Because dwc3_suspend_common() now leaves host_core_exited as false on
those platforms, dwc3_resume_common() skips dwc3_core_init_for_resume()
and dwc3_set_prtcap() and passes power_lost =3D false to xhci-plat after the
parent glue driver has reset or power-cycled the controller, leaving the
host controller uninitialized.

> +
>  static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
>  {
>  	u32 reg;
> @@ -2569,12 +2593,20 @@ static int dwc3_suspend_common(struct dwc3 *dwc, =
pm_message_t msg)
>  		dwc3_core_exit(dwc);
>  		break;
>  	case DWC3_GCTL_PRTCAP_HOST:
> -		if (!PMSG_IS_AUTO(msg) &&
> -		    (!device_may_wakeup(dwc->dev) || dwc->needs_full_reinit)) {
> +		dwc->host_core_exited =3D false;
> +		if (!PMSG_IS_AUTO(msg) && dwc3_host_core_exit_needed(dwc)) {
>  			dwc3_core_exit(dwc);
> +			dwc->host_core_exited =3D true;
>  			break;
>  		}

[Severity: High]
Does dwc3_google_suspend() also need to check !google->dwc.host_core_exited
instead of device_may_wakeup()?

drivers/usb/dwc3/dwc3-google.c:dwc3_google_suspend() {
	if (google->dwc.current_dr_role =3D=3D DWC3_GCTL_PRTCAP_HOST) {
		/*
		 * Follow dwc3_suspend_common() guidelines for deciding between
		 * a full teardown and hibernation.
		 */
		if (PMSG_IS_AUTO(msg) || device_may_wakeup(google->dev)) {
			...
			return 0;
		}
	}

	reset_control_bulk_assert(google->num_rsts, google->rsts);
	clk_bulk_disable_unprepare(google->num_clks, google->clks);
}

When wakeup is disabled during PM_SUSPEND_TO_IDLE, dwc3_suspend_common()
now keeps the core active and sets host_core_exited to false, but
dwc3_google_suspend() still falls through and asserts google->rsts.  On
resume, dwc3_google_resume() deasserts the resets and dwc3_resume_common()
sees host_core_exited =3D=3D false, skipping dwc3_core_init_for_resume() and
dwc3_set_prtcap() on a reset controller.

> =20
> +		/*
> +		 * The core and its PHYs stay powered to keep the suspended bus:
> +		 * keep the power domain on as well.
> +		 */
> +		if (!PMSG_IS_AUTO(msg))
> +			device_set_awake_path(dwc->dev);

[Severity: High]
What happens on SoCs where the DWC3 power domain does not set
GENPD_FLAG_ACTIVE_WAKEUP?

drivers/pmdomain/core.c:genpd_finish_suspend() {
	if (device_awake_path(dev) && genpd_is_active_wakeup(genpd) &&
	    !device_out_band_wakeup(dev))
		return 0;
	...
	genpd_sync_power_off(genpd, true, 0);
}

genpd_finish_suspend() still runs during PM_SUSPEND_TO_IDLE and only
honors device_awake_path() when the domain sets GENPD_FLAG_ACTIVE_WAKEUP.
On platforms whose DWC3 power domain does not set that flag (for example,
RK3568_PD_PIPE on RK3566/RK3568, where usb_host0_xhci and usb_host1_xhci
bind to dwc3_probe() with needs_full_reinit =3D=3D false), genpd still stops
clocks and powers off the domain during suspend-to-idle, and
dwc3_resume_common() then skips dwc3_core_init_for_resume() because
host_core_exited is false.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110-dwc3-s2idl=
e-v1-0-2ef4cc3f8130@gmail.com?part=3D2
