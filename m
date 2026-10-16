Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AEF94D9552
	for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2026 18:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792176968; cv=none; b=kUib31c9olor+D0CDwTzSYufaXyM1BktaD14lhA8rSc0Lo4Z8B92Ezo6WXFE4hqZU9QRrrFqGUhQKT5itpdrwT3ZxvwMntn7D4eXcWNnxf2IxQeFzai4J0Shq6H60UoDtAvpAZ4DOgEl31uuRzslhVxDsIHmunoQHoYu5VA+5JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792176968; c=relaxed/simple;
	bh=4cQnFyct2L/Uhi/WeenSDxO/LFkGkQigfyvoi1J7zG0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=B2XrgpZ57op/sojpAkZznd9xJ8JF7f4PQKxrXLwSVmY1CeGrlU8SoLiFkYTaVfDE1wcHr2PTWMAMHW3L6QsqMdljofCHAfUDKKOzwwNd6rcMbreOpb8DtrLeKNjRhVLn3z4HAb2yfKTKs0vgn05x/8wLp3yV4N8YwRKz5RlJ66Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g8XBZvJQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g8XBZvJQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21D0A1F000C4;
	Fri, 16 Oct 2026 18:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792176966;
	bh=/kVyelCjWMtE8WreHFwMKW5pUBsXLrz4jQpxpGQX+Mg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g8XBZvJQ4LyfXHhoysMSWtWmoqRCs7ms5FOZMv2TR/ZN/Qyen4xqsqDcMGbQEvFKP
	 jvLniECB6d9/xSQSBYrmBaCvd6lkNbxQDMzIaPMwH/mNPDsNEZSRaBhOof28YQ+ty/
	 88lOE0kpaWTeM5btmrEnJicH7JXWlByA8JcCdSwHLh5sECK6j7q5MtMYDmKECcJCqp
	 6ivvNAt7x/WbiP/VjKXvpkZ+JMCbiFDTNhuOBd1CSlCuLrFNO945rY9lTa85taaav9
	 g1SYNHx6fqiG5HLYW9gfkiBhaWMN+8v3LqT8q1nETZBkwizdfeFpYl5HBbp8oUGuZn
	 J5KAibDYWiv0Q==
Message-ID: <sashiko-outbox-174788@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v17 7/7] usb: dwc3: rockchip: fix USB-C reconnect in
 gadget mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261016-b4-rockchip-dwc3-rockchip-glue-v17-7-876f96893e2f@collabora.com>
References: <20261016-b4-rockchip-dwc3-rockchip-glue-v17-0-876f96893e2f@collabora.com>
 <20261016-b4-rockchip-dwc3-rockchip-glue-v17-7-876f96893e2f@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 18:56:05 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] usb: dwc3: rockchip: UAF in vbus handler during gadget teardown
- [High] usb: dwc3: rockchip: unbalanced pm_runtime_put when PM disabled
- [High] usb: dwc3: hardware abort due to late PHY callback unregistration
--

commit d44e5645f925209462f1bf666f95eb79ad1d50f1
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

usb: dwc3: rockchip: fix USB-C reconnect in gadget mode

When USB-C is configured in gadget mode and the cable is unplugged
the USB controller is suspended. After plugging in the cable again,
the USB controller stays suspended and thus the port status remains
not-attached.

This commit fixes this by informing the USB core about VBUS updates when
the PHY mode changes.

> diff --git a/drivers/usb/dwc3/dwc3-rockchip.c b/drivers/usb/dwc3/dwc3-roc=
kchip.c
> index 1f32150caa090..5cb5feec8bd4b 100644
> --- a/drivers/usb/dwc3/dwc3-rockchip.c
> +++ b/drivers/usb/dwc3/dwc3-rockchip.c
[ ... ]
> @@ -25,8 +25,17 @@ struct dwc3_rk_phy_nb {
>  struct dwc3_rockchip {
>  	struct dwc3		dwc;
>  	u8			phy_reset_active;
> +	enum usb_role		role;
>  };
> =20
> +static void dwc3_rockchip_vbus_handler(struct dwc3 *dwc, bool present)
> +{
> +	if (!dwc->gadget || !dwc->gadget_driver)
> +		return;
> +
> +	usb_udc_vbus_handler(dwc->gadget, present);
> +}

[Severity: High]
Does this lockless check of dwc->gadget allow a TOCTOU race?

The handler is invoked by dwc3_rockchip_phy_pre_reset(), which is a PHY
reset callback that can run concurrently (for instance, from DP hotplug
events in the rockchip-usbdp driver via rk_udphy_dp_phy_power_on).

If the PHY reset runs concurrently with dwc3_core_exit_mode(), could the
lockless check succeed just before dwc3_gadget_stop() clears
dwc->gadget_driver and dwc3_gadget_exit() frees dwc->gadget?

Would this cause the reset handler to pass a freed dwc->gadget to
usb_udc_vbus_handler(), resulting in a use-after-free?

Would serializing the check and call within spin_lock_irqsave(&dwc->lock,
flags) prevent this race safely?

> +
>  static int dwc3_rockchip_phy_pre_reset(struct dwc3_rockchip *dwc_rk, int=
 port)
>  {
>  	struct dwc3 *dwc =3D &dwc_rk->dwc;
[ ... ]
> @@ -51,6 +60,8 @@ static int dwc3_rockchip_phy_pre_reset(struct dwc3_rock=
chip *dwc_rk, int port)
>  	if (!ret)
>  		return ret;

[Severity: High]
When runtime PM is disabled, pm_runtime_get_if_active(dwc->dev) returns
-EINVAL and does not increment usage_count. Since the `if (!ret)` check
evaluates to false for -EINVAL, will execution continue and lead to an
unbalanced pm_runtime_put_autosuspend() later?

Additionally, does this PM check expose the driver to an asynchronous
external abort (kernel panic) due to late PHY callback unregistration?

During dwc3_core_remove(), clocks are disabled via dwc3_core_exit() while
the PM state remains RPM_ACTIVE until pm_runtime_disable() is called.
Because the PHY callback is unregistered via devres (which runs after
remove completes), could a concurrent DP PHY power-on execute this
pre-reset function and access unclocked hardware registers?

> =20
> +	dwc3_rockchip_vbus_handler(dwc, false);
> +
>  	/*
>  	 * Assert USB3 PHY soft reset within DWC3 before the external
>  	 * PHY resets. This disconnects the PIPE interface, preventing
[ ... ]
> @@ -87,6 +100,8 @@ static int dwc3_rockchip_phy_post_reset(struct dwc3_ro=
ckchip *dwc_rk, int port)
>  	dwc3_writel(dwc, DWC3_GUSB3PIPECTL(port), reg);
>  	spin_unlock_irqrestore(&dwc->lock, flags);
> =20
> +	dwc3_rockchip_vbus_handler(dwc, gadget_mode);
> +
>  	pm_runtime_put_autosuspend(dwc->dev);

[Severity: High]
Since this pm_runtime_put_autosuspend() is executed unconditionally, will
it decrement the usage_count even when pm_runtime_get_if_active()
previously returned -EINVAL?

Could this falsely drop the usage count from > 0 to 0 (stealing a reference
from another subsystem component) and lead to the device being runtime
suspended while actively in use?

> =20
>  	return 0;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016-b4-rockchi=
p-dwc3-rockchip-glue-v17-0-876f96893e2f@collabora.com?part=3D7
