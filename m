Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794295129;
	b=V1lT9iwHxvmYnCuH1gfHoe+sj/cnmXyPrpSAmXqPPFRjMOmf1kpkKSHFsUkLI5RJv8EP
	 0l+rLNKNCUaTelLlxCyCGIfKeqvdx5B2hEckn+6cdH+jmlBTkuIeLwfkhafIFBfpUtOq7
	 SO04mEaAPy0bjbkkebrULhUBOi6N5RhADeNjGPYmgeRlpobIAvqxytauA85j5t/8386zT
	 aTmBTkpcGpiuJ2FWVm5U6xwnr0Gw+H+VvtRQFMH5D8/5PatDfQd9dSdk0Un1wQCnJ1xdH
	 mKO0kA58MWW0HJ/QwsCUlkA9K1jVJj0Q/K3R48IwlHmLuzt6FFdJHNeRry7f5wu7nKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794295129;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=vpM6k5IVbwV5N5ETw9k/gapWsNK4pksqXs8fIpIJmiE=;
	b=XqSwOoK0ZFdDh0YOvbaqaEwcGLHymKGggpwAXLovhPT2era2siaVqzVgv8X7nujrsqxK
	 wjhDQDs4/QsXBLIZhurssK3bprL1QOSLHgo4Ge63Sjke9heRgPA5nx+2pm39lSGg1c0PM
	 b35PtPBlF6vpcaWS2KiU7pqWHBIG62PQ9SyJAJv4xRENDL+4ouPD6/sm+iMsWO9yfKxK5
	 fEHNyTz7vaYEkW5QZG3TWiAFPlzhk45aIDm0b3zdAJjQ/9bs98ASySO99L1HpVdklrwS6
	 Aox61QpcIJKG67+ja+yuQ/g0Qa993t1Jta1P1hSG0FtavVMjHAXMQlwPZLADecicFFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hc+5rew6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D2860A2606;
	Tue, 10 Nov 2026 07:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hc+5rew6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7C211F008AB;
	Tue, 10 Nov 2026 07:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794295129;
	bh=vpM6k5IVbwV5N5ETw9k/gapWsNK4pksqXs8fIpIJmiE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Hc+5rew6jb+sv33mkkgV2DV6Adx2tkAS6z/zzBFw8rtnePG2jJkgH70pdRa9BzwDs
	 Eots2HmIrIhdJbEzvu6Bnpil8Soeiwnh8Fxn7DH59OQhmEGVsu0/B01KRK+sv0qG0t
	 BrEIdx+pKYhjszYeUdE7HwX2dS54ON7suk18jPbRU9LXOeTp6HjWe/g77yBDTD0NZO
	 lpO9270rlU4NsWx6DhJGm+PElu7IHde65NGiogZTqUDgyIXfoVv/ZpcGgiIieytovg
	 ioXL8mc5qVA66N9YjMXB/d1j0Lx5jywni+LVR2n/Ty6lpolOfqnzdob1fvWKBwSypv
	 ea4dG9GCugl5w==
Message-ID: <sashiko-outbox-206474@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] usb: dwc2: drd: Sync the generic PHY mode with role
 requests
Reply-To: sashiko-reviews@lists.linux.dev
To: "Inochi Amaoto" <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261110070627.217946-3-inochiama@gmail.com>
References: <20261110070627.217946-1-inochiama@gmail.com>
 <20261110070627.217946-3-inochiama@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 07:18:48 +0000
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
- [High] usb: dwc2: drd: inverted default mode check in dwc2_drd_init()
- [Medium] usb: dwc2: drd: unupdated PHY mode on USB_ROLE_NONE in
  dwc2_drd_role_sw_set()
It also noticed 1 related pre-existing issue this patch does not
introduce:
- [High] usb: dwc2: early role switch registration race in
  dwc2_driver_probe() [1]
--

commit 5fa24c9321d10a0419f734968d84804314b53dd6
Author: Inochi Amaoto <inochiama@gmail.com>

usb: dwc2: drd: Sync the generic PHY mode with role requests

This commit updates the generic PHY mode via phy_set_mode() during DRD
initialization, role switch updates, and system resume.

> diff --git a/drivers/usb/dwc2/drd.c b/drivers/usb/dwc2/drd.c
> index 1ad8fa3f862a1..1ad3804cbc805 100644
> --- a/drivers/usb/dwc2/drd.c
> +++ b/drivers/usb/dwc2/drd.c

[ ... ]

> @@ -111,14 +113,11 @@ static int dwc2_drd_role_sw_set(struct usb_role_swi=
tch *sw, enum usb_role role)
>  	 * mode and sessions. It is the case if cable is plugged at boot.
>  	 */
>  	if (!hsotg->ll_hw_enabled && hsotg->clk) {
> -		int ret =3D clk_prepare_enable(hsotg->clk);
> -
> +		ret =3D clk_prepare_enable(hsotg->clk);
>  		if (ret)
>  			return ret;
>  	}
> =20
> -	spin_lock_irqsave(&hsotg->lock, flags);
> -
>  	if (role =3D=3D USB_ROLE_NONE) {
>  		/* default operation mode when usb role is USB_ROLE_NONE */
>  		if (hsotg->role_sw_default_mode =3D=3D USB_DR_MODE_HOST)
> @@ -127,6 +126,15 @@ static int dwc2_drd_role_sw_set(struct usb_role_swit=
ch *sw, enum usb_role role)
>  			role =3D USB_ROLE_DEVICE;
>  	}
> =20
> +	if (role =3D=3D USB_ROLE_HOST || role =3D=3D USB_ROLE_DEVICE) {
> +		ret =3D phy_set_mode(hsotg->phy, role =3D=3D USB_ROLE_HOST ?
> +				   PHY_MODE_USB_HOST : PHY_MODE_USB_DEVICE);
> +		if (ret)
> +			goto out_clk;
> +	}

[Severity: Medium]
Does guarding phy_set_mode() on USB_ROLE_HOST || USB_ROLE_DEVICE leave
hsotg->phy stuck in PHY_MODE_USB_HOST when switching from USB_ROLE_HOST to
USB_ROLE_NONE?

When hsotg->role_sw_default_mode is USB_DR_MODE_UNKNOWN and hsotg->dr_mode
is USB_DR_MODE_OTG, role remains USB_ROLE_NONE.  This skips phy_set_mode(),
whereas dwc2_force_mode(hsotg, role =3D=3D USB_ROLE_HOST) below forces the
controller into device mode (matching dwc2_drd_init() and
dwc2_drd_resume(), which both set PHY_MODE_USB_DEVICE for USB_ROLE_NONE).

[ ... ]

> @@ -160,26 +168,40 @@ static int dwc2_drd_role_sw_set(struct usb_role_swi=
tch *sw, enum usb_role role)
>  		/* This will raise a Connector ID Status Change Interrupt */
>  		dwc2_force_mode(hsotg, role =3D=3D USB_ROLE_HOST);

[Severity: High]
This problem wasn't introduced by this patch, but registering the role
switch in dwc2_drd_init() before dwc2_driver_probe() finishes initializing
the core and workqueue allows concurrent role switches to race with probe
[1]:

CPU0 (probe)                      CPU1 (role switch / IRQ)
dwc2_driver_probe()
  dwc2_drd_init()
    usb_role_switch_register()
                                  dwc2_drd_role_sw_set()
                                    dwc2_force_mode()
                                      /* unlocked RMW on GUSBCFG */
  dwc2_core_init()
    /* RMW on GUSBCFG */
                                  dwc2_handle_conn_id_status_change_intr()
                                    if (hsotg->wq_otg) /* NULL */
                                      queue_work(...)  <-- event dropped

dwc2_force_mode() modifies GUSBCFG without holding hsotg->lock, racing with
dwc2_core_init().  In addition, because hsotg->wq_otg is not allocated yet,
dwc2_handle_conn_id_status_change_intr() drops the connector ID status
change interrupt, leaving the controller in a mismatched state.

> =20
> -	if (!hsotg->ll_hw_enabled && hsotg->clk)
> -		clk_disable_unprepare(hsotg->clk);
> -
>  	dev_dbg(hsotg->dev, "%s-session valid\n",
>  		role =3D=3D USB_ROLE_NONE ? "No" :
>  		role =3D=3D USB_ROLE_HOST ? "A" : "B");
> =20
> -	return 0;
> +out_clk:
> +	if (!hsotg->ll_hw_enabled && hsotg->clk)
> +		clk_disable_unprepare(hsotg->clk);
> +
> +	return ret;
>  }
> =20
>  int dwc2_drd_init(struct dwc2_hsotg *hsotg)
>  {
>  	struct usb_role_switch_desc role_sw_desc =3D {0};
>  	struct usb_role_switch *role_sw;
> +	bool is_host;
>  	int ret;
> =20
>  	if (!device_property_read_bool(hsotg->dev, "usb-role-switch"))
>  		return 0;
> =20
>  	hsotg->role_sw_default_mode =3D usb_get_role_switch_default_mode(hsotg-=
>dev);
> +
> +	if (hsotg->role_sw_default_mode !=3D USB_DR_MODE_UNKNOWN)
> +		is_host =3D hsotg->dr_mode =3D=3D USB_DR_MODE_HOST;
> +	else
> +		is_host =3D hsotg->role_sw_default_mode =3D=3D USB_DR_MODE_HOST;
> +
> +	ret =3D phy_set_mode(hsotg->phy,
> +			   is_host ? PHY_MODE_USB_HOST : PHY_MODE_USB_DEVICE);

[Severity: High]
Are the if and else branches inverted here?

When role_sw_default_mode is configured (for example USB_DR_MODE_HOST on an
OTG controller where dr_mode is USB_DR_MODE_OTG), the if branch ignores
role_sw_default_mode and checks dr_mode instead.  When role_sw_default_mode
is USB_DR_MODE_UNKNOWN, the else branch evaluates USB_DR_MODE_UNKNOWN =3D=3D
USB_DR_MODE_HOST, which is always false.  This sets hsotg->phy to
PHY_MODE_USB_DEVICE while dwc2_ovr_init() at the end of dwc2_drd_init()
forces the controller into host mode:

drivers/usb/dwc2/drd.c:dwc2_ovr_init() {
    ...
	dwc2_force_mode(hsotg, (hsotg->dr_mode =3D=3D USB_DR_MODE_HOST) ||
				(hsotg->role_sw_default_mode =3D=3D USB_DR_MODE_HOST));
}

[1] https://sashiko.dev/#/bug/linux-a825f666-6a3b-40af-8377-023f8afa7caf

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110070627.2179=
46-1-inochiama@gmail.com?part=3D2
