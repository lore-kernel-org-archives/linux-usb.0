Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2BE48DB37
	for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2026 18:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792176891; cv=none; b=W2azuE8dIghyaWFyPvGSg2BcdveX6qzH3vo8g/SbIHl7Dux9FZCEqE8Sb+s7pfYtbvMguwZB5Dw1fUYMPg726uvpvgQJLfFQjm1nRwUWZVZ4TPLxRDpeKmfmJeaf6t/9nyenmRFr60XsAppt9yjZwZC8rpt73c99lJCvS/a4Eo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792176891; c=relaxed/simple;
	bh=VcX7NSd+MQs4rRvCyyxhije7suD1BJ5OhBkalpXlDo8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=lyki0B+2eKe1flblvFNLqE9VNsbczCEDWhqdU9VLsJQPe2Kex+4uxF9Rcw2LW8WioTVBWC2IlmJEyOZST8skAhs8DbsZ9csE0Or3SZ4pRr3pfYXHE5hDGeJuDyBVpiFvq1GC55ubG5za6wH+safk267baebka1zxEob4DGpn9mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wfn/phkK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wfn/phkK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E883E1F000C4;
	Fri, 16 Oct 2026 18:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792176888;
	bh=WV2zaR1ShyhyS9AqVrSSSVhqvG794ooayNEQ4/mSuNw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Wfn/phkKaSIQdrzr9uuCRdH/mcHJZlXwXfi2ZfSvC7bIQGUlDycdmVvWSFc7tS13P
	 9A6C7HFejQAIHKeridQQ/H1NxCkbwMxJaW1N7n3/SDpzt3BBWJdy01YbQ4POMkGjRs
	 OD9+pnZKRJXKS5DfqJ8UUP6T1Y1Weu8/3310ive5UnDVN/gJYze4ZZ2gSPRZrtD7pL
	 OejQq/plMLbaM/Tz7gaY6loY2OSZgWVhbxip+8g37nHbVRB3+Ceo2NFdQPOe23fFNC
	 SiD/8mEZ9J+HR0cwzFobOeYserAsa9IQiibrNUnbe9m95uqIVIdTRU0QKspFJE+tyQ
	 wVM5Qy+9yf5QQ==
Message-ID: <sashiko-outbox-174785@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v17 2/7] phy: rockchip: usbdp: Add reset hook support
 for dwc3
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261016-b4-rockchip-dwc3-rockchip-glue-v17-2-876f96893e2f@collabora.com>
References: <20261016-b4-rockchip-dwc3-rockchip-glue-v17-0-876f96893e2f@collabora.com>
 <20261016-b4-rockchip-dwc3-rockchip-glue-v17-2-876f96893e2f@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 18:54:47 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] phy: rockchip: missing NULL check in reset APIs causes panic
- [High] phy: rockchip: usbdp: sw_mode leak causes SError on DWC3 remove
- [Medium] phy: rockchip: usbdp: Ignored return value of dwc3 pre-reset han=
dler allows unsafe PHY reset
- [Low] build: missing dummy stubs for rk_udphy_register_reset_handler
--

commit c002b32dadef4ddd580b443a7afb2debf23073cc
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

phy: rockchip: usbdp: Add reset hook support for dwc3

When TCPM (Type-C Port Manager) triggers a orientation or mux
change, the PHY needs to reset. This results in the PHY no longer
providing a clock to the USB controller. If the USB controller
registers are accessed without the clock, SErrors are generated.

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> index db69dd24f73b3..b396f286e7852 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c

[ ... ]

> @@ -995,6 +999,43 @@ static int rk_udphy_parse_dt(struct rk_udphy *udphy)
>  	return rk_udphy_reset_init(udphy, dev);
>  }
> =20
> +static int rk_udphy_run_reset_handler(struct rk_udphy *udphy, bool pre)
> +{
> +	if (!udphy->dwc3_reset_handler)
> +		return 0;
> +
> +	if (!(udphy->sw_mode & UDPHY_MODE_USB))
> +		return 0;
> +
> +	return udphy->dwc3_reset_handler(udphy->dwc3_reset_data, udphy->dwc3_re=
set_port, pre);
> +}

[Severity: High]
Can the UDPHY_MODE_USB flag leak in udphy->sw_mode when rk_udphy_usb3_phy_e=
xit()
returns early (e.g. in high-speed or DP-only mode)?

If rk_udphy_usb3_phy_exit() returns early:

drivers/phy/rockchip/phy-rockchip-usbdp.c:rk_udphy_usb3_phy_exit() {
    /* DP only or high-speed */
    if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs)
        return 0;

    udphy->sw_mode &=3D ~UDPHY_MODE_USB;
    ...
}

It bypasses clearing UDPHY_MODE_USB, leaving it persistently set even after=
 the
USB PHY is logically closed. Then, during DWC3 driver removal, if a concurr=
ent
Type-C mux event triggers a DP PHY reinitialization, the leaked sw_mode flag
would cause rk_udphy_run_reset_handler() to erroneously execute the reset
handler. Because pm_runtime_disable() was called, pm_runtime_get_if_active()
returns -EINVAL, bypassing the PM suspension check, allowing the function to
access DWC3 registers without a clock and generating an SError.

> +
> +void rk_udphy_unregister_reset_handler(struct phy *phy)
> +{
> +	struct rk_udphy *udphy =3D phy_get_drvdata(phy);
> +

[Severity: High]
Does this exported API need to validate that the phy pointer is not NULL or
ERR_PTR before dereferencing it?

If a consumer driver passes a NULL phy (for example, if the USB3 PHY is
optional or absent and the USB core set dwc->usb3_generic_phy[i] to NULL),
phy_get_drvdata(phy) will cause an immediate kernel panic. Follow-up patches
in dwc3-rockchip manually check dev_driver_string(phy->dev.parent), which
also causes a panic if phy is NULL. Adding a NULL check here and in
rk_udphy_register_reset_handler() would prevent these panics and relieve
consumers from performing fragile type checking.

> +	guard(mutex)(&udphy->mutex);
> +
> +	udphy->dwc3_reset_handler =3D NULL;
> +	udphy->dwc3_reset_data =3D NULL;
> +	udphy->dwc3_reset_port =3D 0;
> +}
> +EXPORT_SYMBOL(rk_udphy_unregister_reset_handler);
> +
> +void rk_udphy_register_reset_handler(struct phy *phy,
> +				     int (*reset_handler)(void *data, int port, bool pre),
> +				     void *data, int port)
> +{
> +	struct rk_udphy *udphy =3D phy_get_drvdata(phy);
> +

[Severity: High]
Similar to rk_udphy_unregister_reset_handler(), should we check if phy is N=
ULL
or ERR_PTR before dereferencing it here?

> +	guard(mutex)(&udphy->mutex);
> +
> +	udphy->dwc3_reset_handler =3D reset_handler;
> +	udphy->dwc3_reset_data =3D data;
> +	udphy->dwc3_reset_port =3D port;
> +}
> +EXPORT_SYMBOL(rk_udphy_register_reset_handler);
> +
>  static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
>  {
>  	int ret;
> @@ -1005,24 +1046,36 @@ static int rk_udphy_power_on(struct rk_udphy *udp=
hy, u8 mode)
>  	}
> =20
>  	if (udphy->status =3D=3D UDPHY_MODE_NONE) {
> +		rk_udphy_run_reset_handler(udphy, true);
> +

[Severity: Medium]
Should we check the return value of rk_udphy_run_reset_handler(udphy, true)
here and abort the power-on sequence on failure?

If the DWC3 controller fails to quiesce due to hardware state or timeouts,
the handler will propagate the error code. Ignoring this error and
proceeding unconditionally to rk_udphy_setup() drops the PHY clock while
the DWC3 PIPE interface might still be active, directly violating the safety
invariant this patch was introduced to enforce and leading to SErrors.

>  		ret =3D rk_udphy_setup(udphy);
> -		if (ret)
> +		if (ret) {
> +			rk_udphy_run_reset_handler(udphy, false);
>  			return ret;
> +		}
> =20
>  		if (!udphy->hs && udphy->mode & UDPHY_MODE_USB)
>  			rk_udphy_u3_port_disable(udphy, false);
>  		udphy->phy_needs_reinit =3D false;
> +
> +		rk_udphy_run_reset_handler(udphy, false);
>  	} else if (udphy->phy_needs_reinit) {
> +		rk_udphy_run_reset_handler(udphy, true);
> +

[Severity: Medium]
Same question here during the reinitialization sequence. Does this need to
handle the return value to prevent proceeding with PHY reset when the DWC3 =
PIPE
interface has not successfully been disabled?

>  		rk_udphy_u3_port_disable(udphy, true);
>  		udelay(10);
> =20
>  		ret =3D rk_udphy_init(udphy);
> -		if (ret)
> +		if (ret) {
> +			rk_udphy_run_reset_handler(udphy, false);
>  			return ret;
> +		}
> =20
>  		if (!udphy->hs && udphy->mode & UDPHY_MODE_USB)
>  			rk_udphy_u3_port_disable(udphy, false);
>  		udphy->phy_needs_reinit =3D false;
> +
> +		rk_udphy_run_reset_handler(udphy, false);
>  	}
> =20
>  	udphy->status |=3D mode;
> diff --git a/include/linux/phy/rockchip-usbdp.h b/include/linux/phy/rockc=
hip-usbdp.h
> new file mode 100644
> --- /dev/null
> +++ b/include/linux/phy/rockchip-usbdp.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Rockchip USBDP Combo PHY with Samsung IP block driver
> + *
> + * Copyright (C) 2026 Collabora Ltd
> + */
> +
> +#ifndef __ROCKCHIP_USBDP
> +#define __ROCKCHIP_USBDP
> +
> +void rk_udphy_unregister_reset_handler(struct phy *phy);
> +void rk_udphy_register_reset_handler(struct phy *phy,
> +				     int (*reset_handler)(void *data, int port, bool pre),
> +				     void *data, int port);
> +

[Severity: Low]
Should this header provide #if IS_ENABLED(CONFIG_PHY_ROCKCHIP_USBDP) guards
and static inline dummy fallbacks for these functions?

If CONFIG_USB_DWC3_ROCKCHIP is enabled but CONFIG_PHY_ROCKCHIP_USBDP is dis=
abled,
any caller invoking these APIs directly will cause the kernel build to fail=
 at the
linking stage with undefined reference errors.

> +#endif

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016-b4-rockchi=
p-dwc3-rockchip-glue-v17-0-876f96893e2f@collabora.com?part=3D2
