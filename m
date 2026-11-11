Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794378016;
	b=vIYqj6+GbQ/2CkTs99vrycUbrr2FBlsXHNVQ+lqiVPR/ohrLLqge8d+315QcttntaTf1
	 eccjv2eho1cdPBugtXa4LadXcR0npCngA6Onk1uup45FPuYs6uIokbIMBxNL0pf5YN8sB
	 RCrKHRaFjJG8CuWzzhoAKbg3y+MMf5k8gcTFAZ6sUu/VniBHTGypfxChqrw+pqM8ycaX0
	 hpHDQ70H+SN9TTaRT7ZZfmt1Ut4sN7wI/6I1YoOnJniQoVsKkeDF64LTkXxgHkiCmvxyU
	 kn33wAQxyckjkCFNFujSYSffqttLsgb0iKWcUAr5oDTAextcb1YKHW0kB2xmWhwLR2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794378016;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=gWlcKZX8KmHb3vw9pVAa19n7LoWttYIVWr8VS8Ks0C8=;
	b=X/6PKGJHnKk0SJkVs4gjF0AJzAhEavidrqAq/jZWzUVVGL12mCJm832KgcmOU9p1GLfy
	 ClFRk9dtVt6QSP66OFRwkyWLJvt9fMJo4KKvCee3z9iWUDwGumEVlE65U33RGbQXNcaOw
	 p7/jcSVFIXvtAMCEsbRW73KGF9qvGZYF38Rg/TrJG/t2WMacBuWL6Qbn7jm+Ck4IX7VnY
	 RmKboi9e+SryhEhr4qJfs9jEdPXneXR0jwDa5gM4d/DkYDsNcU/wOzEFBBRd/n88TnYU1
	 rF37t01OO+cerX7f3b7r7x5mklmmZeLTXtM8NndTH1PCSwgVzVJYr3AiXm0/IpZb+PQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=glIbMEgt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EFE4606A31C
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 06:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=glIbMEgt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBA791F00A05;
	Wed, 11 Nov 2026 06:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794378016;
	bh=gWlcKZX8KmHb3vw9pVAa19n7LoWttYIVWr8VS8Ks0C8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=glIbMEgtQ7V4joTlEQdhLw2w3ub5NFxprf9TTRtq5M3kjzOgb+GkKdyl1fjL/effa
	 zhlPo67w+luHPi6kX9Dnyz3XJulGncrChC5gq2iJMwiRZHlxG7OF8kqV4HVUcAAU8+
	 Tj56bNvuWxe9uYQFY8sY1dteY1HMf4rpUg+R/A+BBqojVbRbQE+Q+7YRxJRox25VNa
	 Jol+wxUTpgFg/MstJg4Eo7KzFPcy3LsmCBV98KEap0Y1bIbww3IUS7kswvQBAi+vI6
	 KDUTgETlWw2EN4InoAHXdQM48AyPxXIQVOAojEaofkn24qyNfGIJrA3EMltGnIZPHs
	 HA0XnYoOWtm4g==
Message-ID: <sashiko-outbox-208429@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] usb: dwc2: drd: Sync the generic PHY mode with
 role requests
Reply-To: sashiko-reviews@lists.linux.dev
To: "Inochi Amaoto" <inochiama@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261111055628.183891-3-inochiama@gmail.com>
References: <20261111055628.183891-1-inochiama@gmail.com>
 <20261111055628.183891-3-inochiama@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 06:20:15 +0000
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
- [Medium] usb: dwc2: drd: wrong PHY mode for USB_DR_MODE_HOST on
  USB_ROLE_NONE
- [Medium] usb: dwc2: drd: phy_set_mode() called while PHY is exited in
  dwc2_drd_role_sw_set()
--

commit 2436b9203ac01c46908592e593c8d76d66df4918
Author: Inochi Amaoto <inochiama@gmail.com>

usb: dwc2: drd: Sync the generic PHY mode with role requests

This commit updates dwc2_drd_init(), dwc2_drd_role_sw_set(), and
dwc2_drd_resume() to synchronize the generic PHY mode with the requested
or default USB role.

> diff --git a/drivers/usb/dwc2/drd.c b/drivers/usb/dwc2/drd.c
> index 1ad8fa3f862a1..3dc194657e821 100644
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
> @@ -127,6 +126,13 @@ static int dwc2_drd_role_sw_set(struct usb_role_swit=
ch *sw, enum usb_role role)
>  			role =3D USB_ROLE_DEVICE;
>  	}
> =20
> +	ret =3D phy_set_mode(hsotg->phy, role =3D=3D USB_ROLE_HOST ?
> +				PHY_MODE_USB_HOST : PHY_MODE_USB_DEVICE);
> +	if (ret)
> +		goto out_clk;

[Severity: Medium]
Can this call phy_set_mode() while hsotg->phy is powered off and exited?

In USB_DR_MODE_PERIPHERAL, dwc2_driver_probe() and dwc2_hsotg_udc_stop()
call dwc2_lowlevel_hw_disable(), which runs phy_power_off() and phy_exit()
and clears hsotg->ll_hw_enabled.  When dwc2_drd_role_sw_set() runs before
udc_start (for example when a cable is plugged in at boot), only
hsotg->clk is enabled while hsotg->phy remains uninitialized.

phy_set_mode_ext() invokes phy->ops->set_mode() without checking
phy->init_count, so PHY drivers that gate clocks or assert resets in
phy_exit() (such as phy-meson-gxl-usb2 or phy-ingenic-usb) will perform
unclocked register accesses.  When dwc2_hsotg_udc_start() later calls
dwc2_lowlevel_hw_enable(), phy_init() also resets the PHY without
re-applying the mode.

[ ... ]

> @@ -160,26 +166,40 @@ static int dwc2_drd_role_sw_set(struct usb_role_swi=
tch *sw, enum usb_role role)
[ ... ]
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
> +		is_host =3D hsotg->role_sw_default_mode =3D=3D USB_DR_MODE_HOST;
> +	else
> +		is_host =3D hsotg->dr_mode =3D=3D USB_DR_MODE_HOST;
> +
> +	ret =3D phy_set_mode(hsotg->phy,
> +			   is_host ? PHY_MODE_USB_HOST : PHY_MODE_USB_DEVICE);
> +	if (ret)
> +		return dev_err_probe(hsotg->dev, ret,
> +				     "failed to set default PHY mode\n");
[ ... ]
> @@ -230,6 +251,11 @@ void dwc2_drd_resume(struct dwc2_hsotg *hsotg)
>  				role =3D USB_ROLE_DEVICE;
>  		}
> =20
> +		ret =3D phy_set_mode(hsotg->phy, role =3D=3D USB_ROLE_HOST ?
> +				   PHY_MODE_USB_HOST : PHY_MODE_USB_DEVICE);
> +		if (ret)
> +			return ret;

[Severity: Medium]
Does this switch hsotg->phy to PHY_MODE_USB_DEVICE on USB_ROLE_NONE when
hsotg->dr_mode is USB_DR_MODE_HOST and role_sw_default_mode is
USB_DR_MODE_UNKNOWN?

When role is USB_ROLE_NONE and role-switch-default-mode is not set, role
stays USB_ROLE_NONE so that A-session valid overrides are not asserted.
Both dwc2_drd_role_sw_set() and dwc2_drd_resume() then pass
PHY_MODE_USB_DEVICE to phy_set_mode() even when hsotg->dr_mode is
USB_DR_MODE_HOST, leaving the PHY in device mode while the controller stays
in host mode.

In addition, if hsotg->dr_mode is USB_DR_MODE_HOST while
role_sw_default_mode is USB_DR_MODE_PERIPHERAL, dwc2_drd_init() sets
is_host to false and configures PHY_MODE_USB_DEVICE, whereas
dwc2_ovr_init() forces the controller into host mode:

drivers/usb/dwc2/drd.c:dwc2_ovr_init() {
	...
	dwc2_force_mode(hsotg, (hsotg->dr_mode =3D=3D USB_DR_MODE_HOST) ||
				(hsotg->role_sw_default_mode =3D=3D USB_DR_MODE_HOST));
}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111055628.1838=
91-1-inochiama@gmail.com?part=3D2
