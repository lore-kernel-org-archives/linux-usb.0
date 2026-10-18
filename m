Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49A23FE65F
	for <linux-usb@vger.kernel.org>; Sun, 18 Oct 2026 11:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792322857; cv=none; b=CGbmaeMJXPQKkVxG3TSkgORgMwu5N+0JaluZDAMj8E5metgjU+2FvabOH6dCipuSPmNrp1i7fbFavlJwifFU7Efjkjsui+hgpVfDgbKscizEKC9gCATcYGehnJGdqvpbIFi1hkZ3/+hSpszjywTXMtgL+Jb7TTkm468cTa/MA5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792322857; c=relaxed/simple;
	bh=kTgx82kRZAwtEb+D5VkDIi5wte7gtVB1pqXou7i+30k=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Oal3tuCfF2sYy/CtpaFsUKQ95g960U6YBnteAygep2ImCZ/6rPqnDZL55PgThTy//YFmVtR0jcAoD/s9nr8dDPu9Fi/TnbaB1lI7Y5qFnAzZXHXiOCL60BwYob4PP+JaxtCnpOl8KFe5Srf8t/mkc9/yO4tRwATLXu1wCsqMDxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jEFSsy8F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jEFSsy8F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 667EF1F000C4;
	Sun, 18 Oct 2026 11:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792322856;
	bh=/wk9B3tFNwmw1X9Zz0DwlWeuEFt69fhnP813PDPxUHw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jEFSsy8Fq73dpVYLoOPWO7j82tFGSxv3MKCTVmbkwTivbFWKGieJAdjjuVr9RQgth
	 ywDNOB2hSzGLRbLRXigyppjEKWLAdH3v4acuVtCYFAGt44MFvhlKIokww6lXls0jby
	 YFzEMUoyTPTdVQjToPTOYLHJHl0GccaHeclMeL3kYdw1k51sEup93mZCCkCmq7CahM
	 MlBzSRtZ3hceHIuvgis+L8Q6H3wMbgazmJ0YmwEnpZs701gBiDpdmZslIR0UMq3yl7
	 pZclyGpL/NC4zXpJfO1BlnkimFElKOON0ydlFmxh7NKsHP7L+CLMSnkR+/b9wYCxKJ
	 VTNp/t2ATMefA==
Message-ID: <sashiko-outbox-176080@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: ohci-omap: handle root hub overcurrent
Reply-To: sashiko-reviews@lists.linux.dev
To: "Muhammad Mahdi Amirpour" <ampr.mhd@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261018111124.32979-1-ampr.mhd@gmail.com>
References: <20261018015747.246611-1-ampr.mhd@gmail.com>
 <20261018111124.32979-1-ampr.mhd@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 18 Oct 2026 11:27:36 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] usb: ohci-omap: broken overcurrent status bits in ohci_omap_hub_co=
ntrol()
- [High] usb: ohci-omap: power GPIO enabled instead of disabled on overcurr=
ent
- [High] usb: ohci-omap: missing clock and PHY cleanup in ohci_hcd_omap_pro=
be()
- [Medium] usb: ohci-omap: false overcurrent_changed and race in ohci_hcd_o=
map_probe()
--

commit 1225a9a245304878b12998496dea4744efeb5ced
Author: Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>

usb: ohci-omap: handle root hub overcurrent

This commit adds GPIO-based overcurrent interrupt handling for the OMAP
OHCI root hub, disables port power upon overcurrent detection, and
reports overcurrent status through the root hub port status callbacks.

> diff --git a/drivers/usb/host/ohci-omap.c b/drivers/usb/host/ohci-omap.c
> index f6e56c4b99148..2a08147dc5fa1 100644
> --- a/drivers/usb/host/ohci-omap.c
> +++ b/drivers/usb/host/ohci-omap.c

[ ... ]

> @@ -181,11 +189,110 @@ static int ohci_omap_reset(struct usb_hcd *hcd)
>  	return 0;
>  }
> =20
> +static irqreturn_t ohci_omap_overcurrent_irq(int irq, void *data)
> +{
> +	struct usb_hcd *hcd =3D data;
> +	struct ohci_omap_priv *priv =3D hcd_to_ohci_omap_priv(hcd);
> +	unsigned long flags;
> +	int status;
> +
> +	status =3D gpiod_get_value_cansleep(priv->overcurrent);
> +	if (status < 0)
> +		return IRQ_HANDLED;
> +
> +	if (status && priv->power)
> +		gpiod_set_value_cansleep(priv->power, 0);

[Severity: High]
Does setting priv->power to 0 here actually enable VBUS power rather than
disabling it?

On OMAP1 OSK (arch/arm/mach-omap1/board-osk.c), the TPS65010 USB VBUS
power enable line (n_vbus_en) is active-low in hardware, registered with
GPIO_ACTIVE_HIGH, and initialized to GPIOD_OUT_HIGH (1) to keep VBUS off.
Consistent with that polarity, ohci_omap_reset() turns VBUS power on by
setting priv->power to 0:

	if (priv->power)
		gpiod_set_value_cansleep(priv->power, 0);

When an overcurrent condition is detected in ohci_omap_overcurrent_irq()
and in ohci_hcd_omap_probe(), shouldn't priv->power be set to 1 to shut
off VBUS power?

Additionally, since ohci_omap_hub_control() does not handle
SetPortFeature or ClearPortFeature for USB_PORT_FEAT_POWER to drive
priv->power, how can hub_power_on() re-enable VBUS power after the
overcurrent condition clears?

> +
> +	spin_lock_irqsave(&priv->overcurrent_lock, flags);
> +	if (!!status !=3D priv->overcurrent_status)
> +		priv->overcurrent_changed =3D true;
> +	priv->overcurrent_status =3D !!status;
> +	spin_unlock_irqrestore(&priv->overcurrent_lock, flags);
> +
> +	usb_hcd_poll_rh_status(hcd);
> +
> +	return IRQ_HANDLED;
> +}

[ ... ]

> +static int ohci_omap_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 w=
Value,
> +				 u16 wIndex, char *buf, u16 wLength)
> +{
> +	struct ohci_omap_priv *priv =3D hcd_to_ohci_omap_priv(hcd);
> +	unsigned long flags;
> +	bool status, changed;
> +	__le32 *portstatus;
> +	u32 value;
> +	int ret;
> +
> +	ret =3D ohci_hub_control(hcd, typeReq, wValue, wIndex, buf, wLength);
> +	if (ret)
> +		return ret;
> +
> +	if (typeReq =3D=3D ClearPortFeature && wIndex =3D=3D 1 &&
> +	    wValue =3D=3D USB_PORT_FEAT_C_OVER_CURRENT) {
> +		unsigned long flags;
> +
> +		spin_lock_irqsave(&priv->overcurrent_lock, flags);
> +		priv->overcurrent_changed =3D false;
> +		spin_unlock_irqrestore(&priv->overcurrent_lock, flags);
> +		return 0;
> +	}
> +
> +	if (typeReq !=3D GetPortStatus || wIndex !=3D 1)
> +		return ret;
> +
> +	spin_lock_irqsave(&priv->overcurrent_lock, flags);
> +	status =3D priv->overcurrent_status;
> +	changed =3D priv->overcurrent_changed;
> +	spin_unlock_irqrestore(&priv->overcurrent_lock, flags);
> +
> +	portstatus =3D (__le32 *)buf;
> +	value =3D le32_to_cpu(*portstatus);
> +
> +	if (status)
> +		value |=3D USB_PORT_STAT_OVERCURRENT;
> +	else
> +		value &=3D ~USB_PORT_STAT_OVERCURRENT;
> +
> +	if (changed)
> +		value |=3D USB_PORT_STAT_C_OVERCURRENT;
> +	else
> +		value &=3D ~USB_PORT_STAT_C_OVERCURRENT;
> +
> +	*portstatus =3D cpu_to_le32(value);
> +
> +	return 0;
> +}

[Severity: High]
Isn't USB_PORT_STAT_C_OVERCURRENT overwriting USB_PORT_STAT_OVERCURRENT in
wPortStatus instead of setting the change bit in wPortChange?

In ohci_hub_control(), GetPortStatus writes a 32-bit word into buf where
the lower 16 bits are wPortStatus (RH_PS_POCI =3D 0x00000008) and the upper
16 bits are wPortChange (RH_PS_OCIC =3D 0x00080000). Both
USB_PORT_STAT_OVERCURRENT and USB_PORT_STAT_C_OVERCURRENT are defined as
0x0008 in include/uapi/linux/usb/ch11.h for their respective 16-bit
fields.

Applying USB_PORT_STAT_C_OVERCURRENT unshifted to the 32-bit value
overwrites bit 3 (wPortStatus) with changed and never sets bit 19
(wPortChange). Because USB_PORT_STAT_C_OVERCURRENT is never set in the
upper 16 bits, port_event() in drivers/usb/core/hub.c will never see the
overcurrent change or send ClearPortFeature(USB_PORT_FEAT_C_OVER_CURRENT)
to clear priv->overcurrent_changed, causing ohci_omap_hub_status_data()
to report BIT(1) on every poll cycle indefinitely.

Also, if priv->overcurrent is NULL on a board without the optional GPIO,
won't this unconditionally clear the hardware's RH_PS_POCI bit in buf?
And as a minor note, the inner ClearPortFeature block redeclares unsigned
long flags, shadowing the outer declaration in ohci_omap_hub_control().

[ ... ]

> @@ -277,23 +387,77 @@ static int ohci_hcd_omap_probe(struct platform_devi=
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
> +
>  	retval =3D usb_add_hcd(hcd, irq, 0);
>  	if (retval)
> -		goto err3;
> +		goto err_iounmap;
> +
> +	if (priv->overcurrent) {
> +		int status;
> +		unsigned long flags;
> +
> +		priv->overcurrent_irq =3D gpiod_to_irq(priv->overcurrent);
> +		if (priv->overcurrent_irq < 0) {
> +			retval =3D priv->overcurrent_irq;
> +			goto err_remove_hcd;
> +		}
> +
> +		retval =3D request_threaded_irq(priv->overcurrent_irq, NULL,
> +					      ohci_omap_overcurrent_irq,
> +					      IRQF_ONESHOT |
> +					      IRQF_TRIGGER_RISING |
> +					      IRQF_TRIGGER_FALLING,
> +					      "ohci-omap-overcurrent", hcd);
> +		if (retval) {
> +			priv->overcurrent_irq =3D -1;
> +			goto err_remove_hcd;
> +		}
> +
> +		/*
> +		 * Synchronize the initial GPIO sample with the threaded
> +		 * handler so it cannot overwrite the sampled state.
> +		 */
> +		disable_irq(priv->overcurrent_irq);
> +
> +		status =3D gpiod_get_value_cansleep(priv->overcurrent);
> +		if (status < 0) {
> +			retval =3D status;
> +			enable_irq(priv->overcurrent_irq);
> +			goto err_remove_hcd;
> +		}
> +
> +		spin_lock_irqsave(&priv->overcurrent_lock, flags);
> +		priv->overcurrent_status =3D !!status;
> +		priv->overcurrent_changed =3D true;
> +		spin_unlock_irqrestore(&priv->overcurrent_lock, flags);

[Severity: Medium]
Why is priv->overcurrent_changed set to true unconditionally during probe
even when status is 0?

When no overcurrent is present at boot (status =3D=3D 0), setting
priv->overcurrent_changed =3D true and calling usb_hcd_poll_rh_status(hcd)
reports a false overcurrent change event on port 1 on every probe.

In addition, usb_add_hcd() registers the root hub and starts hub_wq
polling before priv->overcurrent is sampled, and request_threaded_irq()
is called without IRQF_NO_AUTOEN, leaving a window before disable_irq()
where ohci_omap_overcurrent_irq() can run and have its state overwritten
by this initial sample.

> +
> +		if (status && priv->power)
> +			gpiod_set_value_cansleep(priv->power, 0);
> +
> +		enable_irq(priv->overcurrent_irq);
> +		usb_hcd_poll_rh_status(hcd);
> +	}
> =20
>  	device_wakeup_enable(hcd->self.controller);
>  	return 0;
> -err3:
> +
> +err_remove_hcd:
> +	if (priv->overcurrent_irq >=3D 0) {
> +		free_irq(priv->overcurrent_irq, hcd);
> +		priv->overcurrent_irq =3D -1;
> +	}
> +	usb_remove_hcd(hcd);
> +err_iounmap:
>  	iounmap(hcd->regs);
> -err2:
> +err_release_mem:
>  	release_mem_region(hcd->rsrc_start, hcd->rsrc_len);
>  err_unprepare_dc_ck:
>  	clk_unprepare(priv->usb_dc_ck);

[Severity: High]
If probe fails after usb_add_hcd() and jumps to err_remove_hcd, doesn't
this miss disabling the clocks and cleaning up hcd->usb_phy?

During usb_add_hcd(), ohci_omap_reset() calls omap_ohci_clock_power(priv, 1)
to enable priv->usb_dc_ck and priv->usb_host_ck, and when OTG is used it
acquires hcd->usb_phy and sets otg_set_host(hcd->usb_phy->otg,
&ohci_to_hcd(ohci)->self).

Unlike ohci_hcd_omap_remove():

	usb_remove_hcd(hcd);
	omap_ohci_clock_power(priv, 0);
	if (!IS_ERR_OR_NULL(hcd->usb_phy)) {
		(void) otg_set_host(hcd->usb_phy->otg, 0);
		usb_put_phy(hcd->usb_phy);
	}

the err_remove_hcd path proceeds directly from usb_remove_hcd() to
clk_unprepare() while the clocks are still enabled, and leaves
hcd->usb_phy leaked with hcd->usb_phy->otg->host pointing to the freed
hcd->self.

[ ... ]

> @@ -413,6 +581,8 @@ static int __init ohci_omap_init(void)
>  		return -ENODEV;
> =20
>  	ohci_init_driver(&ohci_omap_hc_driver, &omap_overrides);
> +	ohci_omap_hc_driver.hub_status_data =3D ohci_omap_hub_status_data;
> +	ohci_omap_hc_driver.hub_control =3D ohci_omap_hub_control;
>  	return platform_driver_register(&ohci_hcd_omap_driver);
>  }
>  module_init(ohci_omap_init);

=E0=A6=93=E0=A7=9F=E0=A6=BE=E0=A6=9F

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261018111124.3297=
9-1-ampr.mhd@gmail.com?part=3D1
