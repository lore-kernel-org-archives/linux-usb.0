Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE28942AD97
	for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2026 18:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792176940; cv=none; b=Gk6ax8acrOLbintoGqlxLkzwJ6+prPp5FowrrxtNTeh9INX7Li90RwOMz0KE5WR8puW13sveChjY1dfPtfObItz5tjXANecuXI5gZB0GrEaFd2zn5MuylaUnMJPp2iCdLyEqg/dbQ+MfrdghN08vS4Yb3boZfnmcWpVrfWpEHNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792176940; c=relaxed/simple;
	bh=0ZwRDOtkJb1vYEj91HdEYA1ZXXTDbkngv/mFNSAhMAA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=nKmscZIgMXUYETSsKM1TwKJYk2Ym+afGIspJwo/eAPstTlLZf/Ewwx4SqCsolk+PjMFWWQ4WLwOndwhhMhSBhxlrK95VE+V0K1xQ31ZPXRLUF09ygdY6eFLb1ArwxwITqiYNd7qgOodp9h/H+0OkS3pB1E9u/Fab4kD+idl6+d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WjaBR6Ia; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WjaBR6Ia"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E6A81F000C4;
	Fri, 16 Oct 2026 18:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792176939;
	bh=XhlYRW+5RNZtQJHM0I3sP4EqcjDdEqo6QFMfEAwIJoM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WjaBR6IaDuWIq+19r3RLkjNRgs7kMk43XDnUl7GRlLtTiUhbOkHkWhzL2C18YRsrH
	 64PT+mi91jLUlfTEEomddVmRBr8Fk1hUHjfFGPD6CqT+teO66s54HqgtJ1P8bgtqAr
	 1/a9vSAPDidL57cokmCLJKSNWSDAWXNEhMhuacfAYiijABilmW5//mn4RsoiTvtKcJ
	 ml47PolMvpLhoyjj5DVwgaVhOGeiALictU1AwB0BXoJlWBYxJEmQoLJWLqlVnSYD2N
	 ezBEEQ+xdDBynHy7wuWBRhYij/4GsN75zsswrKcncDVF9ZVIzMTJ+QCL3Y/dasgTPQ
	 4ui0lvvc/wjRQ==
Message-ID: <sashiko-outbox-174787@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v17 5/7] usb: dwc3: rockchip: add USBDP PHY reset quirk
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261016-b4-rockchip-dwc3-rockchip-glue-v17-5-876f96893e2f@collabora.com>
References: <20261016-b4-rockchip-dwc3-rockchip-glue-v17-0-876f96893e2f@collabora.com>
 <20261016-b4-rockchip-dwc3-rockchip-glue-v17-5-876f96893e2f@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 18:55:39 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] usb: dwc3: NULL pointer dereference on missing generic PHY
- [High] usb: dwc3: rockchip: Runtime PM usage count underflow on PHY reset
- [High] build: missing stubs for rk_udphy_*_reset_handler causes linker er=
ror
- [Low] usb: dwc3: unused struct dwc3_rk_phy_nb
--

commit 91514aa6803f514c30a280950070ac9faec72092
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

usb: dwc3: rockchip: add USBDP PHY reset quirk

This patch introduces a Rockchip USBDP-specific quirk to assert PHYSOFTRST
before disabling the external PHY and deassert it once the PHY returns. This
prevents the DWC3 IP from corrupting the PHY's internal state when the mode
changes on RK3588 and RK3576 platforms.

> diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
> index 3c120ea9746d9..c86c1ac293bfa 100644
> --- a/drivers/usb/dwc3/Kconfig
> +++ b/drivers/usb/dwc3/Kconfig
> @@ -193,6 +193,7 @@ config USB_DWC3_OCTEON
>  config USB_DWC3_ROCKCHIP
>  	tristate "Rockchip DWC3 Platform Driver"
>  	depends on ARCH_ROCKCHIP || COMPILE_TEST
> +	depends on PHY_ROCKCHIP_USBDP || !PHY_ROCKCHIP_USBDP

[Severity: High]
If CONFIG_PHY_ROCKCHIP_USBDP is disabled, `!PHY_ROCKCHIP_USBDP` evaluates t=
o y,
which permits USB_DWC3_ROCKCHIP to be built. Since
include/linux/phy/rockchip-usbdp.h does not provide static inline dummy stu=
bs
for the rk_udphy reset handlers, will this cause a linker error due to miss=
ing
symbols?

>  	depends on OF
>  	default USB_DWC3
>  	help
> diff --git a/drivers/usb/dwc3/dwc3-rockchip.c b/drivers/usb/dwc3/dwc3-roc=
kchip.c
> index 4129aefd6a8b0..1f32150caa090 100644
> --- a/drivers/usb/dwc3/dwc3-rockchip.c
> +++ b/drivers/usb/dwc3/dwc3-rockchip.c
> @@ -2,11 +2,144 @@
>  /* Copyright (c) 2026, Collabora Ltd. */
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> +#include <linux/phy/phy.h>
> +#include <linux/phy/rockchip-usbdp.h>
>  #include <linux/pm_runtime.h>
>  #include "glue.h"
> +#include "io.h"
> +
> +struct dwc3_rockchip;
> +
> +/**
> + * struct dwc3_rk_phy_nb - wrapper for PHY notifier block
> + * @nb: notifier block
> + * @dwc: back-pointer to the DWC3 controller
> + * @port_index: USB3 port index this notifier is registered for
> + */
> +struct dwc3_rk_phy_nb {
> +	struct notifier_block	nb;
> +	struct dwc3_rockchip	*dwc_rk;
> +	u8			port_index;
> +};

[Severity: Low]
Is this struct dwc3_rk_phy_nb declaration still needed? It appears to be
unused anywhere in the driver, possibly left over from an earlier version
that used notifier blocks.

> +
>  struct dwc3_rockchip {
>  	struct dwc3		dwc;
> +	u8			phy_reset_active;
> +};
> +
> +static int dwc3_rockchip_phy_pre_reset(struct dwc3_rockchip *dwc_rk, int=
 port)
> +{
> +	struct dwc3 *dwc =3D &dwc_rk->dwc;
> +	unsigned long flags;
> +	u32 reg;
> +	int ret;
> +
> +	/*
> +	 * If already suspended, the resume path will reinit GUSB3PIPECTL
> +	 * via dwc3_core_init(). A forced resume is not possible as that
> +	 * would call phy_init() resulting in a deadlock. Due to the
> +	 * phy_init() in the resume path there is also no need to block
> +	 * async RPM resume on our side, since the PHY synchronizes it
> +	 * for us.
> +	 *
> +	 * pm_runtime_get_if_active() returns 0 when suspended (skip),
> +	 * 1 when active (ref held), or -EINVAL when PM is disabled
> +	 * (device always active). In the -EINVAL case PM ref counting
> +	 * is a no-op, so the unconditional put in POST_RESET is safe.
> +	 */
> +	ret =3D pm_runtime_get_if_active(dwc->dev);
> +	if (!ret)
> +		return ret;

[Severity: High]
If runtime PM is disabled for the device (e.g., during suspend or removal),
pm_runtime_get_if_active() returns -EINVAL and does not increment the usage
count.

Because `if (!ret)` evaluates to false for -EINVAL, the driver proceeds with
the reset. However, the post-reset and unregister paths unconditionally drop
the usage count via pm_runtime_put_autosuspend(), which could lead to a
mismatched decrement and trigger a "Runtime PM usage count underflow!" warn=
ing.

[ ... ]
> +static int dwc3_rockchip_phy_post_reset(struct dwc3_rockchip *dwc_rk, in=
t port)
> +{
> +	struct dwc3 *dwc =3D &dwc_rk->dwc;
> +	unsigned long flags;
> +	u32 reg;
> +
> +	spin_lock_irqsave(&dwc->lock, flags);
> +	if (!(dwc_rk->phy_reset_active & BIT(port))) {
> +		spin_unlock_irqrestore(&dwc->lock, flags);
> +		return 0;
> +	}
> +
> +	dwc_rk->phy_reset_active &=3D ~BIT(port);
> +
> +	/* Restore normal operation */
> +	reg =3D dwc3_readl(dwc, DWC3_GUSB3PIPECTL(port));
> +	reg &=3D ~DWC3_GUSB3PIPECTL_PHYSOFTRST;
> +	dwc3_writel(dwc, DWC3_GUSB3PIPECTL(port), reg);
> +	spin_unlock_irqrestore(&dwc->lock, flags);
> +
> +	pm_runtime_put_autosuspend(dwc->dev);

[Severity: High]
Does this unconditionally drop the PM usage count even if the initial
pm_runtime_get_if_active() call returned -EINVAL without incrementing it?

[ ... ]
> +static void dwc3_rk_phy_unregister_notifiers(void *data)
> +{
> +	struct dwc3_rockchip *dwc_rk =3D data;
> +	struct dwc3 *dwc =3D &dwc_rk->dwc;
> +	int i;
> +
> +	for (i =3D 0; i < dwc->num_usb3_ports; i++) {
> +		struct phy *phy =3D dwc->usb3_generic_phy[i];
> +
> +		if (!strcmp(dev_driver_string(phy->dev.parent), "rockchip-usbdp-phy"))

[Severity: High]
Is it possible for `phy` to be NULL here?

If a USB3 port is not configured with a PHY in the device tree, the DWC3
core driver leaves `dwc->usb3_generic_phy[i]` as NULL. Evaluating
`phy->dev.parent` without a valid pointer check would cause an unconditional
NULL pointer dereference during unbind or teardown.

> +			rk_udphy_unregister_reset_handler(dwc->usb3_generic_phy[i]);
> +	}
> +
> +	/* Release any PM references from in-flight resets */
> +	for (i =3D 0; i < dwc->num_usb3_ports; i++) {
> +		if (dwc_rk->phy_reset_active & BIT(i))
> +			pm_runtime_put_autosuspend(dwc->dev);
> +	}
> +	dwc_rk->phy_reset_active =3D 0;
> +}
> +
> +static int dwc3_rk_phy_register_reset_handler(struct dwc3 *dwc)
> +{
> +	struct dwc3_rockchip *dwc_rk =3D container_of(dwc, struct dwc3_rockchip=
, dwc);
> +	int i;
> +
> +	for (i =3D 0; i < dwc->num_usb3_ports; i++) {
> +		struct phy *phy =3D dwc->usb3_generic_phy[i];
> +
> +		if (!strcmp(dev_driver_string(phy->dev.parent), "rockchip-usbdp-phy"))

[Severity: High]
Could this also dereference a NULL pointer during probe if a USB3 port lacks
a defined PHY?

> +			rk_udphy_register_reset_handler(phy, dwc3_rockchip_phy_reset, dwc_rk,=
 i);

[Severity: High]
Does this direct call to the PHY driver API require an IS_ENABLED() check?

Since the Kconfig permits USB_DWC3_ROCKCHIP to be built even when
PHY_ROCKCHIP_USBDP is disabled, this could cause a build failure during
linking if the PHY driver lacks dummy stubs for these functions.

> +	}
> +
> +	return devm_add_action_or_reset(dwc->dev, dwc3_rk_phy_unregister_notifi=
ers, dwc_rk);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016-b4-rockchi=
p-dwc3-rockchip-glue-v17-0-876f96893e2f@collabora.com?part=3D5
