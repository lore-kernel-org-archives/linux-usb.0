Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792607510;
	b=1wEQK2pvGYNxncbvG/xqVQMHqMw3mutdU3C1pGMdHtSqVwC6Ndnx4O6FIZdtxwQ8/XXR
	 Yji6nyXJEk+LADmqNjSGoP+o9vURoI84PphQVeBceeQKI5Pr11itOaaB2GXFPLhcwBTS0
	 u9YSEMoo5X0Xq7vKj8VYR9ypG6//h9P4zJ4lEJNoCK65Oq3F8Np0Z/MAJ8/9FrJ45q8jU
	 YXQDiSw78xrhBqaEybXKH70E9Gw4qg8YqWpcvkkQKVgxBNySS7soKtCU/njutM80RrId6
	 W8qxzP5vEl0Auhw8Cf5FBH8bEyn2WwL9yVY+TQtL8iOxNje5Kf7tcF7+S86t5T9f2pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792607510;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=T4DwlUZZOJfOix5x7o6dgqGTfLpP2KX39ixDyNT4uNs=;
	b=v5L2AUkitO4iLOdaHiT6/lqghOhVxSgOcBty6XXllcuaTC/VNWb570MkXGMqoIXWDP4n
	 fhpb1NMht2TpSXnU4SESFjavEOeX+uL+mDFh7eWoiCJQjktagI64GefodISEqUXcXb/YY
	 CMl444o52G7z8lopBErZadRHlZeILFir7C/JrV1wgNf/9O8pngx5nNJnhxjopKVkTnbX1
	 /Gd6CejB94Gg2PFQo9QvKf/U2j5CAWonK918wip7Ppb15VYOKdD4lhpSiG073yleNT4nM
	 QUws46JOJuuK6UnBm89MbT0MeuKyvKIT5+3dQMq2JIJpWUd5/knCH+hPbQu+lSZDkxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bTJV4HpD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFCA606A319
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 18:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bTJV4HpD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C907A1F000C1;
	Wed, 21 Oct 2026 18:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792607510;
	bh=T4DwlUZZOJfOix5x7o6dgqGTfLpP2KX39ixDyNT4uNs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bTJV4HpD24pQxyZ0RHWrwRpiWTk/ytNll6tzPCEii0DI4PARnNkljpUl6yaMTwPo6
	 Nd1K3o/mhVlpxODkku6R84k8k4e7F0XShlNW1dhp3zKn1U+viya+UlFogIRjVQ3A0f
	 ti5S6tCCYSu3OyUajmydgIOJHN1zvV9tfUhc02pRxYEKmFHSMQa1Voj8sb4AUVnY29
	 I7gNs91Pm//RLfJOtayY76wAI/lMkQrdKTqFhthpsclg0tod/J/2+ipAnhkM4NjbpN
	 fZrS6jERNU4jU3KDC6NDoSuqLbmgLy7ElDy/1IA1XSs5fID1C/aE0InvHorxIqfX0m
	 MXr9RM82KuA2Q==
Message-ID: <sashiko-outbox-180556@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v18 7/7] usb: dwc3: rockchip: fix USB-C reconnect in
 gadget mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261021-b4-rockchip-dwc3-rockchip-glue-v18-7-60000d03fca2@collabora.com>
References: <20261021-b4-rockchip-dwc3-rockchip-glue-v18-0-60000d03fca2@collabora.com>
 <20261021-b4-rockchip-dwc3-rockchip-glue-v18-7-60000d03fca2@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 18:31:49 +0000
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
- [High] usb: dwc3: rockchip: wrong role check in dwc3_rockchip_phy_post_re=
set()
- [High] usb: dwc3: rockchip: async vbus_work race in dwc3_rockchip_phy_res=
et()
- [High] usb: dwc3: rockchip: dropped VBUS state in dwc3_rockchip_vbus_hand=
ler()
--

commit 97e99b8258d01d9f23d8408a81715cbe540da468
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

usb: dwc3: rockchip: fix USB-C reconnect in gadget mode

This commit adds a vbus handler to the Rockchip dwc3 glue driver and invokes
it from the phy reset callbacks and the .pre_set_role glue callback so that
the gadget core is notified of vbus state changes across usb-c disconnects
and reconnects.

> diff --git a/drivers/usb/dwc3/dwc3-rockchip.c b/drivers/usb/dwc3/dwc3-roc=
kchip.c
> index 75e647e04cc52..65d17536af142 100644
> --- a/drivers/usb/dwc3/dwc3-rockchip.c
> +++ b/drivers/usb/dwc3/dwc3-rockchip.c
> @@ -10,8 +10,19 @@
>  struct dwc3_rockchip {
>  	struct dwc3		dwc;
>  	u8			phy_reset_active;
> +	enum usb_role		role;
>  };
> =20
> +static void dwc3_rockchip_vbus_handler(struct dwc3 *dwc, bool present)
> +{
> +	guard(spinlock_irqsave)(&dwc->lock);
> +
> +	if (!dwc->gadget || !dwc->gadget_driver)
> +		return;
> +
> +	usb_udc_vbus_handler(dwc->gadget, present);
> +}

[Severity: High]
What happens in dwc3_rockchip_vbus_handler() when a role switch occurs befo=
re
a gadget driver is bound or before dwc->gadget is initialized?

When dwc3_gadget_init() registers a gadget via usb_add_gadget(), udc->vbus =
is
initialized to true:

drivers/usb/gadget/udc/core.c:usb_add_gadget() {
	...
	usb_gadget_set_state(gadget, USB_STATE_NOTATTACHED);
	udc->vbus =3D true;
	...
}

If the system boots without a usb-c cable attached, tcpm invokes
usb_role_switch_set_role() -> dwc3_usb_role_switch_set() ->
dwc3_pre_set_role() -> dwc3_rockchip_set_role(dwc, USB_ROLE_NONE) ->
dwc3_rockchip_vbus_handler(dwc, false). If no gadget driver is bound yet
(dwc->gadget_driver is NULL), dwc3_rockchip_vbus_handler() returns early and
drops the present =3D false update, leaving udc->vbus as true.

The same thing happens when unplugging a usb-c host cable (transitioning fr=
om
USB_ROLE_HOST to USB_ROLE_NONE): dwc3_usb_role_switch_set() calls
dwc3_pre_set_role() synchronously while still in host mode, before
dwc3_set_mode() queues dwc->drd_work (__dwc3_set_mode) to call
dwc3_gadget_init(), so the newly created udc also starts with udc->vbus set
to true while dwc_rk->role is USB_ROLE_NONE.

When userspace later binds a configfs gadget driver while unplugged,
gadget_bind_driver() calls usb_udc_connect_control_locked(), which sees
udc->vbus =3D=3D true and calls usb_gadget_connect_locked(), setting
gadget->connected =3D 1 with no cable attached. Once dwc3 runtime-suspends,
plugging in a usb-c device cable calls usb_udc_vbus_handler(dwc->gadget, tr=
ue)
-> usb_gadget_connect_locked(), which sees gadget->connected =3D=3D 1 and r=
eturns
early without calling dwc3_gadget_pullup() to resume the controller.

Conversely, if a cable is unplugged while a gadget driver is bound (setting
udc->vbus =3D false), the gadget driver is unbound (setting dwc->gadget_dri=
ver
to NULL), and the cable is plugged back in before rebinding, the present =3D
true update is dropped and the gadget stays disconnected after bind.

> +
>  static void dwc3_rockchip_phy_pre_reset(struct dwc3_rockchip *dwc_rk, in=
t port)
>  {
>  	struct dwc3 *dwc =3D &dwc_rk->dwc;
> @@ -26,6 +37,8 @@ static void dwc3_rockchip_phy_pre_reset(struct dwc3_roc=
kchip *dwc_rk, int port)
>  	if (!pm_runtime_active(dwc->dev))
>  		return;
> =20
> +	dwc3_rockchip_vbus_handler(dwc, false);

[Severity: High]
Can calling dwc3_rockchip_vbus_handler(dwc, false) in
dwc3_rockchip_phy_pre_reset() followed by
dwc3_rockchip_vbus_handler(dwc, gadget_mode) in
dwc3_rockchip_phy_post_reset() race with udc->vbus_work?

In drivers/usb/gadget/udc/core.c, usb_udc_vbus_handler() does not disconnect
or connect synchronously; it overwrites a single boolean and schedules
asynchronous work:

void usb_udc_vbus_handler(struct usb_gadget *gadget, bool status)
{
	struct usb_udc *udc =3D gadget->udc;

	if (udc) {
		udc->vbus =3D status;
		schedule_work(&udc->vbus_work);
	}
}

During phy initialization in rk_udphy_power_on(), rk_udphy_run_reset_handle=
r()
calls dwc3_rockchip_phy_pre_reset(), runs rk_udphy_setup() and rk_udphy_ini=
t(),
and then calls dwc3_rockchip_phy_post_reset(). This creates several issues:

1. If udc->vbus_work (vbus_event_work) has not started before
   dwc3_rockchip_phy_post_reset() runs, the second usb_udc_vbus_handler() c=
all
   overwrites udc->vbus back to true. When vbus_event_work finally runs, it
   calls usb_gadget_connect_locked(), sees gadget->connected is already set,
   and returns as a no-op without performing the disconnect or reconnect.

2. If vbus_event_work runs on another cpu during rk_udphy_init() while
   DWC3_GUSB3PIPECTL_PHYSOFTRST is asserted and the external phy is held in
   reset without pipe clocks, usb_gadget_disconnect_locked() invokes
   dwc3_gadget_pullup(gadget, 0) -> dwc3_gadget_soft_disconnect() ->
   dwc3_gadget_run_stop(dwc, false), issuing endpoint commands and polling
   DWC3_DSTS_DEVCTRLHLT while the phy is in reset.

3. During system resume, dwc3_pm_resume() in drivers/usb/dwc3/core.c calls
   pm_runtime_disable(dev) and pm_runtime_set_active(dev) before
   dwc3_resume_common() -> dwc3_core_init() -> dwc3_phy_init():

	pm_runtime_disable(dev);
	ret =3D pm_runtime_set_active(dev);
	if (ret)
		goto out;

	ret =3D dwc3_resume_common(dwc, PMSG_RESUME);

   Because pm_runtime_active(dwc->dev) is true, the phy reset callbacks
   schedule vbus_event_work while runtime pm is disabled. If vbus_event_work
   runs before pm_runtime_enable(dev), dwc3_gadget_pullup() clears
   dwc->softconnect, fails pm_runtime_get_sync(dwc->dev) with -EACCES, calls
   pm_runtime_set_suspended(dwc->dev), and leaves gadget->connected =3D 1 w=
ith
   dwc->softconnect =3D 0.

4. When dwc->dev is already runtime-suspended (!pm_runtime_active(dwc->dev))
   in a fixed peripheral configuration (dr_mode =3D=3D USB_DR_MODE_PERIPHER=
AL),
   both dwc3_rockchip_phy_pre_reset() and dwc3_rockchip_phy_post_reset()
   return early without calling dwc3_rockchip_vbus_handler().

> +
>  	/*
>  	 * Assert USB3 PHY soft reset within DWC3 before the external
>  	 * PHY resets. This disconnects the PIPE interface, preventing
> @@ -43,6 +56,9 @@ static void dwc3_rockchip_phy_pre_reset(struct dwc3_roc=
kchip *dwc_rk, int port)
>  static void dwc3_rockchip_phy_post_reset(struct dwc3_rockchip *dwc_rk, i=
nt port)
>  {
>  	struct dwc3 *dwc =3D &dwc_rk->dwc;
> +	bool gadget_mode =3D (dwc->current_dr_role =3D=3D DWC3_GCTL_PRTCAP_DEVI=
CE) ||
> +			   ((dwc->current_dr_role =3D=3D DWC3_GCTL_PRTCAP_OTG) &&
> +			   (dwc_rk->role =3D=3D USB_ROLE_DEVICE));
>  	u32 reg;
> =20
>  	scoped_guard(spinlock_irqsave, &dwc->lock) {
> @@ -56,6 +72,8 @@ static void dwc3_rockchip_phy_post_reset(struct dwc3_ro=
ckchip *dwc_rk, int port)
>  		reg &=3D ~DWC3_GUSB3PIPECTL_PHYSOFTRST;
>  		dwc3_writel(dwc, DWC3_GUSB3PIPECTL(port), reg);
>  	}
> +
> +	dwc3_rockchip_vbus_handler(dwc, gadget_mode);
>  }

[Severity: High]
Does gadget_mode in dwc3_rockchip_phy_post_reset() check the right field on
dual-role controllers using usb-role-switch?

Here dwc->current_dr_role is compared against DWC3_GCTL_PRTCAP_DEVICE and
DWC3_GCTL_PRTCAP_OTG. However, in drivers/usb/dwc3/drd.c,
dwc3_usb_role_switch_set() never sets mode to DWC3_GCTL_PRTCAP_OTG:

	switch (role) {
	case USB_ROLE_HOST:
		mode =3D DWC3_GCTL_PRTCAP_HOST;
		break;
	case USB_ROLE_DEVICE:
		mode =3D DWC3_GCTL_PRTCAP_DEVICE;
		break;
	default:
		if (dwc->role_switch_default_mode =3D=3D USB_DR_MODE_HOST)
			mode =3D DWC3_GCTL_PRTCAP_HOST;
		else
			mode =3D DWC3_GCTL_PRTCAP_DEVICE;
		break;
	}

	dwc3_pre_set_role(dwc, role);
	dwc3_set_mode(dwc, mode);

When the cable is unplugged or in displayport-only altmode (role is
USB_ROLE_NONE), dwc3_usb_role_switch_set() selects DWC3_GCTL_PRTCAP_DEVICE
because dwc->role_switch_default_mode defaults to USB_DR_MODE_PERIPHERAL.
As a result, dwc->current_dr_role =3D=3D DWC3_GCTL_PRTCAP_DEVICE evaluates =
to true
even when dwc_rk->role is USB_ROLE_NONE. When a phy reset completes in
dwc3_rockchip_phy_post_reset() (for example during rk_udphy_dp_phy_power_on=
()
or system resume), dwc3_rockchip_vbus_handler(dwc, true) is called while no
usb device cable is connected, setting gadget->connected =3D 1 so that a la=
ter
USB_ROLE_DEVICE plug-in becomes a no-op in usb_gadget_connect_locked().

In addition, dwc3_pre_set_role() updates dwc_rk->role synchronously in
dwc3_rockchip_set_role(), whereas dwc3_set_mode() queues dwc->drd_work
(__dwc3_set_mode) asynchronously. During a USB_ROLE_DEVICE to USB_ROLE_HOST
transition, dwc->current_dr_role is still DWC3_GCTL_PRTCAP_DEVICE (making
gadget_mode true while dwc_rk->role is USB_ROLE_HOST), and during a
USB_ROLE_HOST to USB_ROLE_DEVICE transition, dwc->current_dr_role is still
DWC3_GCTL_PRTCAP_HOST until __dwc3_set_mode() finishes (making gadget_mode
false while dwc_rk->role is USB_ROLE_DEVICE).

Also, dwc->current_dr_role and dwc_rk->role are read at the top of
dwc3_rockchip_phy_post_reset() outside dwc->lock, and dwc_rk->role is writt=
en
in dwc3_rockchip_set_role() without holding dwc->lock:

static void dwc3_rockchip_set_role(struct dwc3 *dwc, enum usb_role role)
{
	struct dwc3_rockchip *dwc_rk =3D container_of(dwc, struct dwc3_rockchip, d=
wc);

	dwc_rk->role =3D role;
	dwc3_rockchip_vbus_handler(dwc, role =3D=3D USB_ROLE_DEVICE);
}

Could a concurrent dwc3_rockchip_set_role(dwc, USB_ROLE_NONE) run between t=
he
initial gadget_mode evaluation and the dwc3_rockchip_vbus_handler() call at
the end of dwc3_rockchip_phy_post_reset(), causing the stale gadget_mode va=
lue
to overwrite the vbus state? Should this check dwc->dr_mode =3D=3D
USB_DR_MODE_PERIPHERAL (and dwc_rk->role =3D=3D USB_ROLE_DEVICE for otg) un=
der
dwc->lock instead?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021-b4-rockchi=
p-dwc3-rockchip-glue-v18-0-60000d03fca2@collabora.com?part=3D7
