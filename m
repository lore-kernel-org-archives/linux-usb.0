Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F733D47C5
	for <linux-usb@vger.kernel.org>; Sun, 18 Oct 2026 22:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792363853; cv=none; b=IYy+DiG3bYVjGgAiKofoFcQeoNGN9jDZ3OK4v9NncpSFwxjn5j1GQG8sTsRsUFxBNBgLFn24ad4TJe9M+p6tZs6Cm8eWp3apPrGFbG9OzAygN75dgzs89qWKEXQXTh+AumMJ1RejrvacBsfuN1I7FZMUxy05zjEcuDa8ybOTeck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792363853; c=relaxed/simple;
	bh=6UJZXoleqyPcM5bxt1FNd89ga8DqSGcwxturgBn/dcw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Slwg2+IYRkM3gmGrqltcKijEw0d90HxWEpB9k/UpPQwNssA1QLXZboLwjmJ4k/Px1fwpxpmQ5YMjzV25RyGGo/+njocID4v0JF2H02YXcG+IkZcjQgIBYdplEjAMTaEZ/abg2ZU9HK/m83TpPkSfTjuu1QS03hut3lDS9MZLt5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GcMTyJ2E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GcMTyJ2E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 281391F000C6;
	Sun, 18 Oct 2026 22:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792363851;
	bh=IQllBB4gD7IW21DC1LTtdOVN/J9y7Yxs3AmcgiZKQ80=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GcMTyJ2EJ4cxMS7HOFkKrZq/881jG1C0USJBAt0OLN9ALqdgw3mlx8LjHvPp7hO7z
	 zLILwYBaXBVVoqX711pZblIAQ99TF+Ud9VRUi/rzFBdXjm6uCiRVdGVnPV0Em21tjv
	 bLkuPfgazIAyCgOejfaAH9v7CfCWt+ZU6QWf1QJZzr4kL+QU0KFJPu8EyEGk4lEd1e
	 +NCqTgPNPjRo06sOO0RRLraat/ybPRgBOUh4Zw9Nx010WN5oVz30MVm1DKij+pVyW/
	 aMmmbTNApOZu5z5KUkseZ6P6mdZ/8J/o4zGuwopRq9n4zVZSF5iNQFHAOoMCFlVncZ
	 bfnMkqLpCN8gA==
Message-ID: <sashiko-outbox-176434@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] usb: ohci-omap: implement overcurrent handling for
 GPIO-based power control
Reply-To: sashiko-reviews@lists.linux.dev
To: "Muhammad Mahdi Amirpour" <ampr.mhd@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261018223312.120913-1-ampr.mhd@gmail.com>
References: <20261018223312.120913-1-ampr.mhd@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 18 Oct 2026 22:50:50 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] usb: ohci-omap: race and inverted ordering in ohci_omap_overcurren=
t_irq() leaves VBUS on
- [High] usb: ohci-omap: overcurrent IRQ fails to resume suspended root hub
- [Medium] usb: ohci-omap: race and missed falling edge in probe overcurren=
t init
--

commit 2a3f441c427f55a1886bf324043fa831b260b3d4
Author: Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>

usb: ohci-omap: implement overcurrent handling for GPIO-based power control

This commit implements overcurrent detection and VBUS power control via
GPIOs in the OMAP OHCI driver using a threaded interrupt handler and custom
root hub status and control callbacks.

> diff --git a/drivers/usb/host/ohci-omap.c b/drivers/usb/host/ohci-omap.c
> index f6e56c4b99148..c717212439053 100644
> --- a/drivers/usb/host/ohci-omap.c
> +++ b/drivers/usb/host/ohci-omap.c

[ ... ]

> @@ -181,6 +195,128 @@ static int ohci_omap_reset(struct usb_hcd *hcd)
>  	return 0;
>  }
> =20
> +static irqreturn_t ohci_omap_overcurrent_irq(int irq, void *data)
> +{
> +	struct usb_hcd *hcd =3D data;
> +	struct ohci_omap_priv *priv =3D hcd_to_ohci_omap_priv(hcd);
> +	int status;
> +	bool was_active;
> +
> +	status =3D gpiod_get_value_cansleep(priv->overcurrent);
> +	if (status < 0)
> +		return IRQ_HANDLED;
> +
> +	if (status && priv->power)
> +		gpiod_set_value_cansleep(priv->power, 1);
> +
> +	was_active =3D READ_ONCE(priv->overcurrent_active);
> +	WRITE_ONCE(priv->overcurrent_active, !!status);
> +	if (was_active !=3D !!status)
> +		WRITE_ONCE(priv->overcurrent_change_pending, true);
> +
> +	usb_hcd_poll_rh_status(hcd);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int ohci_omap_hub_status_data(struct usb_hcd *hcd, char *buf)
> +{
> +	struct ohci_omap_priv *priv =3D hcd_to_ohci_omap_priv(hcd);
> +	int length;
> +
> +	length =3D ohci_hub_status_data(hcd, buf);
> +
> +	if (!priv->overcurrent)
> +		return length;
> +
> +	if (READ_ONCE(priv->overcurrent_change_pending)) {
> +		if (!length) {
> +			buf[0] =3D 0;
> +			length =3D 1;
> +		}
> +		buf[0] |=3D BIT(1); /* port 1 */
> +	}
> +
> +	return length;
> +}

[Severity: High]
What happens if an overcurrent interrupt fires while the root hub is
runtime-suspended or autostopped?

When the root hub is suspended, hub_suspend() -> hub_quiesce() kills
hub->urb (leaving hcd->status_urb as NULL) and ohci_bus_suspend() places the
controller into OHCI_USB_SUSPEND.

When ohci_omap_overcurrent_irq() cuts VBUS and calls
usb_hcd_poll_rh_status(), that calls ohci_omap_hub_status_data() ->
ohci_hub_status_data(). Because the overcurrent signal is on an external
GPIO rather than the OHCI hardware pin, ohci_hub_status_data() sees no
hardware port change bits (changed =3D=3D 0), so ohci_root_hub_state_change=
s()
does not call ohci_rh_resume() or usb_hcd_resume_root_hub():

drivers/usb/host/ohci-hub.c:ohci_root_hub_state_changes() {
	...
	case OHCI_USB_SUSPEND:
	case OHCI_USB_RESUME:
		/* if there is a port change, autostart or ask to be resumed */
		if (changed) {
			if (ohci->autostop)
				ohci_rh_resume(ohci);
			else
				usb_hcd_resume_root_hub(ohci_to_hcd(ohci));
	...
}

Then, even though ohci_omap_hub_status_data() returns length =3D 1,
usb_hcd_poll_rh_status() sees that hcd->status_urb is NULL, so it only sets
HCD_FLAG_POLL_PENDING and returns without waking hub_wq:

drivers/usb/core/hcd.c:usb_hcd_poll_rh_status() {
	...
		urb =3D hcd->status_urb;
		if (urb) {
			...
		} else {
			length =3D 0;
			set_bit(HCD_FLAG_POLL_PENDING, &hcd->flags);
		}
	...
}

With VBUS turned off and the root hub still suspended, won't the port remain
unpowered indefinitely because hub_wq never runs port_event() to clear the
overcurrent change and restore power?

> +
> +static int ohci_omap_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 w=
Value,
> +				 u16 wIndex, char *buf, u16 wLength)
> +{
> +	struct ohci_omap_priv *priv =3D hcd_to_ohci_omap_priv(hcd);
> +	int ret;
> +
> +	/*
> +	 * Drive the VBUS power GPIO alongside the OHCI hardware register.
> +	 * On boards like the OSK, the OHCI PPS bit does not control the
> +	 * real power switch =E2=80=94 the GPIO does.
> +	 */
> +	if (priv->power && wIndex =3D=3D 1) {
> +		if (typeReq =3D=3D SetPortFeature &&
> +		    wValue =3D=3D USB_PORT_FEAT_POWER) {
> +			ret =3D ohci_hub_control(hcd, typeReq, wValue, wIndex,
> +					       buf, wLength);
> +			if (!ret && !READ_ONCE(priv->overcurrent_active))
> +				gpiod_set_value_cansleep(priv->power, 0);
> +			/*
> +			 * Re-check: the overcurrent IRQ may have fired
> +			 * between the check above and the GPIO call.
> +			 * A mutex would close this fully, but the window
> +			 * is microseconds and the hardware current limiter
> +			 * provides the final safety net.
> +			 */
> +			if (!ret && READ_ONCE(priv->overcurrent_active))
> +				gpiod_set_value_cansleep(priv->power, 1);
> +			return ret;
> +		}

[Severity: High]
Can a concurrent SetPortFeature(USB_PORT_FEAT_POWER) in
ohci_omap_hub_control() race with ohci_omap_overcurrent_irq() and leave VBUS
switched on during an active overcurrent condition?

In ohci_omap_overcurrent_irq(), gpiod_set_value_cansleep(priv->power, 1) is
called before WRITE_ONCE(priv->overcurrent_active, !!status). Because
priv->power is on an I2C-attached TPS65010 expander on OMAP1 OSK, that GPIO
write sleeps across an I2C transfer.

If ohci_omap_hub_control() runs while ohci_omap_overcurrent_irq() is
sleeping in gpiod_set_value_cansleep(priv->power, 1) (or before the IRQ
thread is scheduled to run WRITE_ONCE(priv->overcurrent_active, true)),
ohci_omap_hub_control() can observe priv->overcurrent_active as false on
both checks and drive priv->power back to 0. When
ohci_omap_overcurrent_irq() finishes and sets priv->overcurrent_active to
true, it has already completed its GPIO write, leaving VBUS enabled while
priv->overcurrent_active is true.

Even if WRITE_ONCE(priv->overcurrent_active, !!status) were moved before the
GPIO write in ohci_omap_overcurrent_irq(), if ohci_omap_hub_control() passes
the initial !READ_ONCE(priv->overcurrent_active) check and is preempted
while an overcurrent event asserts, cuts VBUS, and then deasserts once
current stops flowing, priv->overcurrent_active will return to false and
ohci_omap_hub_control() will turn VBUS back on and pass the re-check without
the hub core authorizing recovery. Would a mutex serializing the GPIO writes
and overcurrent state updates avoid this?

[ ... ]

> @@ -277,23 +412,73 @@ static int ohci_hcd_omap_probe(struct platform_devi=
ce *pdev)
>  	if (!hcd->regs) {
>  		dev_err(&pdev->dev, "can't ioremap OHCI HCD\n");
>  		retval =3D -ENOMEM;
> -		goto err2;
> +		goto err_release_mem;
>  	}
> =20
>  	irq =3D platform_get_irq(pdev, 0);
>  	if (irq < 0) {
>  		retval =3D irq;
> -		goto err3;
> +		goto err_iounmap;
>  	}
>  	retval =3D usb_add_hcd(hcd, irq, 0);
>  	if (retval)
> -		goto err3;
> +		goto err_iounmap;
> +
> +	if (priv->overcurrent) {
> +		int status;
> +
> +		priv->overcurrent_irq =3D gpiod_to_irq(priv->overcurrent);
> +		if (priv->overcurrent_irq < 0) {
> +			retval =3D priv->overcurrent_irq;
> +			goto err_remove_hcd;
> +		}
> +
> +		retval =3D request_threaded_irq(
> +			priv->overcurrent_irq, NULL, ohci_omap_overcurrent_irq,
> +			IRQF_ONESHOT | IRQF_NO_AUTOEN | IRQF_TRIGGER_RISING |
> +				IRQF_TRIGGER_FALLING,
> +			"ohci-omap-overcurrent", hcd);
> +		if (retval) {
> +			priv->overcurrent_irq =3D -1;
> +			goto err_remove_hcd;
> +		}
> +
> +		status =3D gpiod_get_value_cansleep(priv->overcurrent);
> +		if (status < 0) {
> +			retval =3D status;
> +			goto err_remove_hcd;
> +		}
> +
> +		WRITE_ONCE(priv->overcurrent_active, !!status);
> +		WRITE_ONCE(priv->overcurrent_change_pending, !!status);
> +
> +		if (status && priv->power)
> +			gpiod_set_value_cansleep(priv->power, 1);
> +
> +		enable_irq(priv->overcurrent_irq);
> +		if (status)
> +			usb_hcd_poll_rh_status(hcd);
> +	}

[Severity: Medium]
In ohci_hcd_omap_probe(), if status is non-zero at probe time, could cutting
VBUS power before calling enable_irq(priv->overcurrent_irq) cause the
falling edge on priv->overcurrent to be missed?

When gpiod_set_value_cansleep(priv->power, 1) turns off VBUS (which sleeps
on an I2C GPIO expander), the power switch can deassert its overcurrent line
(1 -> 0) before enable_irq(priv->overcurrent_irq) is called. Because
priv->overcurrent_irq was requested with IRQF_NO_AUTOEN, that falling edge
occurs while the interrupt is still disabled, leaving
priv->overcurrent_active stuck at true and preventing subsequent
SetPortFeature(USB_PORT_FEAT_POWER) requests from ever re-enabling VBUS.

Also, since usb_add_hcd() calls ohci_omap_reset() (which enables VBUS) and
registers the root hub before priv->overcurrent_irq is requested, hub_wq can
already be running ohci_omap_hub_control() concurrently with this
initialization block.

[ ... ]

>
> --=20
> 2.51.2
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261018223312.1209=
13-1-ampr.mhd@gmail.com?part=3D1
