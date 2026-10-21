Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792607703;
	b=VOfMW5ylixS7y9Ujkr9TdFockZDmo8zVAzc2/zej1ZeoCfBv7utpTd0u6uWeskdkHih1
	 NE/aF2t6HwJKXbaI9LX/0M5JkfHxpME3NlIeABCN4wftZv6QgRt6cHf0mFjLBj/jO+FQ8
	 5fkPn+kBwY+xl4IDHttQyu4dXItFpvfTpTqTfLmzCovcoCnxNPd/kFcp7RLcBxPUKllG2
	 SIzWz9uUV1RpEDixO/NNZueNdZyUKWsZxMlpWe7GTCrf3vLJb+ywZk+d/h1Hqd1ndAhFz
	 jUiBwvs46d8X6/KN9sGEMjUTa5s2kgKb2XcgA8N9V/NWqvfAY/Q2auKEvqxOiNRcfgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792607703;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=5bSXgYHag6XhfKBLXHCQ97tdahL4BUPMsc+StpA2gEw=;
	b=tLPeJWeVGAUnI06jK03+JJekIM3aWGPEXfUJ7EHuW/zn/6HdTpeoC3KHEdLYGNN3YOfu
	 imG3zCXK1NhbAhbjPrVvPCyB3f4rxyMcq3JmXPTQLyxi6va1Ovir4h2diZFRPvqgJ2u4l
	 IPTGY7kZ2rMFZhdDNan6fHvQa56+0+IQi3sEpcV8Y6Cv9WIuXuSyJxAlHkkZelE+IJ9Te
	 3GTmoe4551DefPU09MPmf95kvBJ481jkd32Byv/ZFbCUBZkJrV6w9Hp6PMo7N3+UJrYG0
	 1yCdiKm6MYfL+kWYD19FBq9C8sXuecJs3Lqk+YrMrFvIHZ3oaW+A0fS9NkhA5dN9DJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Few5V957;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26D3606A319
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 18:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Few5V957
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28E141F000C1;
	Wed, 21 Oct 2026 18:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792607702;
	bh=5bSXgYHag6XhfKBLXHCQ97tdahL4BUPMsc+StpA2gEw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Few5V957kHeZ8D/fUuKAIVEsl0/M9Rq0QGGQU9M5rNsWkDV9m4Q7JOcvpILFsclU+
	 1ksgkLM6+BWOFg2uZpMmXRzvOQihjKiOWY5o6DMXBbb+U/hhLJhsD81gySfNwf1UNy
	 4QwRsUrSSyZ4sptlF/eThDBDnTsSgkpT9fQ72lQvn7U2boZZwqjrlPFazDFGRrJR9i
	 oC+WMa5MkdLHrE5RFrfbs69rOSOBwRhMsHYroq1daGKzmG00dDhHshmLAOS4vdUdP1
	 wh3ffoLUXgey5ANjxHek+pFAcGZXXwfFLgUKsxZJu5tB8WPsxPvjJwETo2OoA86Nza
	 88FCLhruUGLxA==
Message-ID: <sashiko-outbox-180557@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v18 5/7] usb: dwc3: rockchip: add USBDP PHY reset quirk
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261021-b4-rockchip-dwc3-rockchip-glue-v18-5-60000d03fca2@collabora.com>
References: <20261021-b4-rockchip-dwc3-rockchip-glue-v18-0-60000d03fca2@collabora.com>
 <20261021-b4-rockchip-dwc3-rockchip-glue-v18-5-60000d03fca2@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 18:35:01 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] usb: dwc3: rockchip: dwc3_rockchip_phy_pre_reset() skips RPM_RESUM=
ING state
- [High] usb: dwc3: rockchip: unsynchronized runtime PM in dwc3_rockchip_ph=
y_reset()
- [Medium] usb: dwc3: rockchip: race between PHY reset quirk and __dwc3_set=
_mode()
--

commit 175128dd0be21c712a951377a4fee0fe496c4cf7
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

usb: dwc3: rockchip: add USBDP PHY reset quirk

This commit adds a reset handler for the Rockchip USBDP PHY in the Rockchip
DWC3 glue driver to assert and deassert DWC3_GUSB3PIPECTL_PHYSOFTRST around
external PHY resets, preventing DWC3 PIPE traffic from interfering with PHY
PLL locking. It also exports the dwc3_readl and dwc3_writel tracepoint
symbols for use by the glue driver.

> diff --git a/drivers/usb/dwc3/dwc3-rockchip.c b/drivers/usb/dwc3/dwc3-roc=
kchip.c
> index 4129aefd6a8b0..75e647e04cc52 100644
> --- a/drivers/usb/dwc3/dwc3-rockchip.c
> +++ b/drivers/usb/dwc3/dwc3-rockchip.c
> @@ -2,11 +2,105 @@
>  /* Copyright (c) 2026, Collabora Ltd. */
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> +#include <linux/phy/rockchip-usbdp.h>
>  #include <linux/pm_runtime.h>
>  #include "glue.h"
> +#include "io.h"
> =20
>  struct dwc3_rockchip {
>  	struct dwc3		dwc;
> +	u8			phy_reset_active;
> +};
> +
> +static void dwc3_rockchip_phy_pre_reset(struct dwc3_rockchip *dwc_rk, in=
t port)
> +{
> +	struct dwc3 *dwc =3D &dwc_rk->dwc;
> +	u32 reg;
> +
> +	/*
> +	 * If the device is runtime suspended, there is nothing to do and RPM
> +	 * resume will do the necessary things. There is no need for a RPM
> +	 * reference either, since DWC3 runtime suspend/resume will call phy
> +	 * init/exit and that is synchronized against ongoing resets.
> +	 */
> +	if (!pm_runtime_active(dwc->dev))
> +		return;

[Severity: High]
Does checking pm_runtime_active(dwc->dev) here miss the case where DWC3 is =
in
the middle of runtime resume or runtime suspend?

In drivers/base/power/runtime.c:rpm_resume(), the PM core sets
dev->power.runtime_status to RPM_RESUMING before invoking the driver's
runtime_resume callback, and only updates it to RPM_ACTIVE after the callba=
ck
returns:

drivers/base/power/runtime.c:rpm_resume() {
	...
	__update_runtime_status(dev, RPM_RESUMING);

	callback =3D RPM_GET_CALLBACK(dev, runtime_resume);

	dev_pm_disable_wake_irq_check(dev, false);
	retval =3D rpm_callback(callback, dev);
	...
}

Meanwhile, include/linux/pm_runtime.h:pm_runtime_active() only returns true
when runtime_status is RPM_ACTIVE (or runtime PM is disabled):

static inline bool pm_runtime_active(struct device *dev)
{
	return dev->power.runtime_status =3D=3D RPM_ACTIVE
		|| dev->power.disable_depth;
}

During runtime resume in DWC3_GCTL_PRTCAP_DEVICE mode, the call chain is:

dwc3_rockchip_runtime_resume()
  -> dwc3_runtime_resume()
    -> dwc3_resume_common()
      -> dwc3_core_init_for_resume()
        -> reset_control_deassert(dwc->reset)
        -> dwc3_clk_enable(dwc)
        -> dwc3_core_init(dwc)
          -> dwc3_phy_setup(dwc)
          -> dwc3_phy_init(dwc)
            -> phy_init()
              -> rk_udphy_usb3_phy_init()
                -> rk_udphy_power_on()
                  -> rk_udphy_run_reset_handler(udphy, true)
                    -> dwc3_rockchip_phy_pre_reset()

At that point, DWC3 reset has been deasserted, clocks are enabled, and
dwc3_phy_setup() has configured DWC3_GUSB3PIPECTL(0), but
dev->power.runtime_status is still RPM_RESUMING. When rk_udphy_power_on()
runs the reset handler (because udphy->status =3D=3D UDPHY_MODE_NONE or
udphy->phy_needs_reinit is true after a USB-C reconnect or orientation
change), won't dwc3_rockchip_phy_pre_reset() see !pm_runtime_active(dwc->de=
v)
and return early without asserting DWC3_GUSB3PIPECTL_PHYSOFTRST, causing
rk_udphy_status_check() to fail LCPLL lock and failing dwc3_runtime_resume()
(as well as skipping the VBUS notification in the follow-up commit "usb:
dwc3: rockchip: fix USB-C reconnect in gadget mode")?

Similarly, during runtime suspend, rpm_suspend() sets runtime_status to
RPM_SUSPENDING before invoking the driver callback. While
dwc3_suspend_common() is executing dwc3_gadget_suspend(), synchronize_irq(),
or waiting on udphy->mutex in dwc3_phy_exit() before clocks are disabled and
reset is asserted, wouldn't a concurrent PHY reset via
rk_udphy_dp_phy_power_on() also see !pm_runtime_active(dwc->dev) and skip
asserting DWC3_GUSB3PIPECTL_PHYSOFTRST while DWC3 is still running?

> +
> +	/*
> +	 * Assert USB3 PHY soft reset within DWC3 before the external
> +	 * PHY resets. This disconnects the PIPE interface, preventing
> +	 * the DWC3 from interfering with PHY reinitialization and
> +	 * avoiding LCPLL lock failures.
> +	 */
> +	scoped_guard(spinlock_irqsave, &dwc->lock) {
> +		dwc_rk->phy_reset_active |=3D BIT(port);
> +		reg =3D dwc3_readl(dwc, DWC3_GUSB3PIPECTL(port));
> +		reg |=3D DWC3_GUSB3PIPECTL_PHYSOFTRST;
> +		dwc3_writel(dwc, DWC3_GUSB3PIPECTL(port), reg);
> +	}
> +}

[Severity: Medium]
Can the PHY reset callbacks race with DWC3 role switching in
__dwc3_set_mode()?

When a USB-C device with DisplayPort AltMode is plugged in, unplugged, or
undergoes a role swap, tcpm_mux_set() updates the mux/orientation state
(setting udphy->phy_needs_reinit =3D true in rk_udphy_orien_sw_set() or
rk_udphy_typec_mux_set()) and calls usb_role_switch_set_role() ->
dwc3_usb_role_switch_set() -> dwc3_set_mode(), queuing __dwc3_set_mode() on
system_freezable_wq. Concurrently, DP HPD/link enablement invokes
phy_power_on(dp->phy) -> rk_udphy_dp_phy_power_on() -> rk_udphy_power_on()
under udphy->mutex.

First, __dwc3_set_mode() calls dwc3_host_exit(), dwc3_gadget_exit(), and
dwc3_host_init() -> dwc3_xhci_plat_start(), all of which call
dwc3_enable_susphy() without holding dwc->lock:

drivers/usb/dwc3/core.c:dwc3_enable_susphy() {
	...
	for (i =3D 0; i < dwc->num_usb3_ports; i++) {
		reg =3D dwc3_readl(dwc, DWC3_GUSB3PIPECTL(i));
		if (enable && !dwc->dis_u3_susphy_quirk)
			reg |=3D DWC3_GUSB3PIPECTL_SUSPHY;
		else
			reg &=3D ~DWC3_GUSB3PIPECTL_SUSPHY;

		dwc3_writel(dwc, DWC3_GUSB3PIPECTL(i), reg);
	}
}

Could an unlocked read-modify-write in dwc3_enable_susphy() interleave with
dwc3_rockchip_phy_pre_reset() or dwc3_rockchip_phy_post_reset() and clear
DWC3_GUSB3PIPECTL_PHYSOFTRST during the PHY reset or re-assert it after
dwc3_rockchip_phy_post_reset() clears it?

Second, between dwc3_rockchip_phy_pre_reset() and
dwc3_rockchip_phy_post_reset(), rk_udphy_init() sleeps in usleep_range() and
polls PLL status in regmap_read_poll_timeout() while holding only
udphy->mutex. Since __dwc3_set_mode() holds only dwc->mutex, can
__dwc3_set_mode() assert and deassert DWC3_GCTL_CORESOFTRESET during the PHY
reset window:

drivers/usb/dwc3/core.c:__dwc3_set_mode() {
	...
		reg =3D dwc3_readl(dwc, DWC3_GCTL);
		reg |=3D DWC3_GCTL_CORESOFTRESET;
		dwc3_writel(dwc, DWC3_GCTL, reg);

		msleep(100);

		reg =3D dwc3_readl(dwc, DWC3_GCTL);
		reg &=3D ~DWC3_GCTL_CORESOFTRESET;
		dwc3_writel(dwc, DWC3_GCTL, reg);
	...
}

resetting DWC3 global registers and clearing DWC3_GUSB3PIPECTL_PHYSOFTRST
while the USBDP PHY reset is still in progress?

> +
> +static void dwc3_rockchip_phy_post_reset(struct dwc3_rockchip *dwc_rk, i=
nt port)
> +{
> +	struct dwc3 *dwc =3D &dwc_rk->dwc;
> +	u32 reg;
> +
> +	scoped_guard(spinlock_irqsave, &dwc->lock) {
> +		if (!(dwc_rk->phy_reset_active & BIT(port)))
> +			return;
> +
> +		dwc_rk->phy_reset_active &=3D ~BIT(port);
> +
> +		/* Restore normal operation */
> +		reg =3D dwc3_readl(dwc, DWC3_GUSB3PIPECTL(port));
> +		reg &=3D ~DWC3_GUSB3PIPECTL_PHYSOFTRST;
> +		dwc3_writel(dwc, DWC3_GUSB3PIPECTL(port), reg);
> +	}
> +}

[Severity: High]
Is it safe to rely on DWC3 runtime suspend/resume calling phy_init() and
phy_exit() instead of holding a runtime PM reference across the PHY reset?

In drivers/usb/dwc3/core.c, dwc3_suspend_common() and dwc3_resume_common()
only call dwc3_core_exit() (which calls dwc3_phy_exit() -> phy_exit()) and
dwc3_core_init_for_resume() (which calls dwc3_core_init() -> dwc3_phy_init()
-> phy_init()) during runtime PM when in DWC3_GCTL_PRTCAP_DEVICE mode. In
DWC3_GCTL_PRTCAP_HOST and DWC3_GCTL_PRTCAP_OTG modes, runtime suspend and
resume skip dwc3_core_exit() and dwc3_core_init_for_resume():

drivers/usb/dwc3/core.c:dwc3_suspend_common() {
	...
	case DWC3_GCTL_PRTCAP_HOST:
		if (!PMSG_IS_AUTO(msg) &&
		    (!device_may_wakeup(dwc->dev) || dwc->needs_full_reinit)) {
			dwc3_core_exit(dwc);
			break;
		}
	...
	case DWC3_GCTL_PRTCAP_OTG:
		/* do nothing during runtime_suspend */
		if (PMSG_IS_AUTO(msg))
			break;
	...
}

Because phy_exit() is not called on runtime suspend in host or OTG modes,
rk_udphy_usb3_phy_exit() does not run, udphy->mutex is not acquired by
runtime suspend/resume, and udphy->sw_mode retains UDPHY_MODE_USB while
dwc->dev is runtime-suspended.

If dwc->dev is RPM_ACTIVE in DWC3_GCTL_PRTCAP_HOST or DWC3_GCTL_PRTCAP_OTG
mode when dwc3_rockchip_phy_pre_reset() runs (for example, via
rk_udphy_dp_phy_power_on() -> rk_udphy_power_on()), it sets
dwc_rk->phy_reset_active |=3D BIT(port) without holding a runtime PM refere=
nce.
While rk_udphy_power_on() sleeps in rk_udphy_init(), dwc->dev can
runtime-suspend concurrently without blocking on udphy->mutex, allowing the
USB power domain (RK3588_PD_USB / RK3576_PD_USB) to power down. When
dwc3_rockchip_phy_post_reset() then executes, won't it see
dwc_rk->phy_reset_active & BIT(port) set and call dwc3_readl() and
dwc3_writel() on DWC3_GUSB3PIPECTL(port) while dwc->dev is runtime-suspende=
d,
triggering an arm64 SError?

Conversely, if dwc->dev is already runtime-suspended in DWC3_GCTL_PRTCAP_HO=
ST
or DWC3_GCTL_PRTCAP_OTG mode while DWC3 clocks and reset remain active (and
the shared USB power domain is kept on by sibling controllers), won't
dwc3_rockchip_phy_pre_reset() see !pm_runtime_active(dwc->dev) and return
early without asserting DWC3_GUSB3PIPECTL_PHYSOFTRST, causing the USBDP PHY
reset to fail LCPLL lock while subsequent runtime resume in host or OTG mode
does not reinitialize the DWC3 core or PHY?

[ ... ]

>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021-b4-rockchi=
p-dwc3-rockchip-glue-v18-0-60000d03fca2@collabora.com?part=3D5
