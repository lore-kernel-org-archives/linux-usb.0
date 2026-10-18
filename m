Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85A24C33C5
	for <linux-usb@vger.kernel.org>; Sun, 18 Oct 2026 16:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792340329; cv=none; b=hWytMgPBWvY09TfmdjXCBwU2Ir6byTRwQYssVeogQqpSYceyox/SW5MjL38k+NNyh1r3Fc3QSqin++uOG0eY5tiazVwxS9MsP2tB/6bSSFhqg/zXJ7R9I8rVoFer731JjbheBVEz6WSu7IhDZY/8seyE83DSdZq5IgDSpwOEZv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792340329; c=relaxed/simple;
	bh=CBupNzl2jetuU+YFGHqSiLU5wQ66ePN/dNJzL7nGu6w=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=DqOYs+v4K5brkOAY0vYNZ2A+Tge+4ndC4aa3b4ybY7WZRrqaN7etjxneDdG5mOiNYnlSudqPgkc7ahyFMtuiwGEtMX1BMwo+FXWeuFrya04sZt+LgbAxADysvPyqqNT/2o4Xl2RiZjr9KWiv5GAQVXFddf3WfSG546ZD3cHZoIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MGHdT/RY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MGHdT/RY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BACAA1F000C5;
	Sun, 18 Oct 2026 16:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792340327;
	bh=d8+px51mSbzQt3gHukDJUykhBakqTlYQh2t/MbHi6nM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MGHdT/RYVU/msaBBXrC45baG036b74uQO3W75bJTVyjN2Qf+2rRZ+7eQ3wjlnnKCi
	 xBn4zH56mOR9jScJUnqnibhJTn2eLvpIO0bjnUBaD6hT1/zxfPhyWp4x0TRCLVHiLg
	 uNq5EjVJC7VHeIy6ra8T2aoT0ZVoZT79i1TfMxBQIP+BDtwYyc6UJP9qOCMsiL4i5I
	 jLG9sjDEV5SIiimSrJa4SClKNqnZb9eyoscbjPIv7NZgYie9H11POStO/1ui3cl5/r
	 TYEwVNODqNGFamAiKze7FxB6OLslFFKZhbRPOktR74+ctYSlQwmrFH1zsIBW2XaF+i
	 YF7JWg5VLs8sg==
Message-ID: <sashiko-outbox-176275@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] usb: ohci-omap: handle root hub overcurrent via GPIO
Reply-To: sashiko-reviews@lists.linux.dev
To: "Muhammad Mahdi Amirpour" <ampr.mhd@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261018155355.116290-1-ampr.mhd@gmail.com>
References: <20261018155355.116290-1-ampr.mhd@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 18 Oct 2026 16:18:47 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] usb: ohci-omap: sleeping GPIO call under spinlock in ohci_omap_hub=
_control()
- [High] usb: ohci-omap: VBUS power race in ohci_omap_overcurrent_irq()
- [Medium] usb: ohci-omap: VBUS power left enabled before OC init and on te=
ardown
- [Medium] usb: ohci-omap: overcurrent state and IRQ initialized after usb_=
add_hcd()
--

commit 5181df0775d84a40d846a175267467ebbcb131d6
Author: Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>

usb: ohci-omap: handle root hub overcurrent via GPIO

This commit adds root hub overcurrent handling for OMAP OHCI using the
optional overcurrent GPIO interrupt and updates hub_status_data and
hub_control to report overcurrent state and control the VBUS power GPIO.

> diff --git a/drivers/usb/host/ohci-omap.c b/drivers/usb/host/ohci-omap.c
> index f6e56c4b99148..a3ff50c70d41e 100644
> --- a/drivers/usb/host/ohci-omap.c
> +++ b/drivers/usb/host/ohci-omap.c

[ ... ]

> @@ -181,11 +189,148 @@ static int ohci_omap_reset(struct usb_hcd *hcd)
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
> +		gpiod_set_value_cansleep(priv->power, 1);
> +
> +	spin_lock_irqsave(&priv->overcurrent_lock, flags);
> +	if (!!status !=3D priv->overcurrent_status)
> +		priv->overcurrent_changed =3D true;
> +	priv->overcurrent_status =3D !!status;
> +	spin_unlock_irqrestore(&priv->overcurrent_lock, flags);

[Severity: High]
Can ohci_omap_overcurrent_irq() race with ohci_omap_hub_control() and leave
VBUS power enabled during an active overcurrent condition?

When an overcurrent interrupt fires, ohci_omap_overcurrent_irq() drives
priv->power to 1 before acquiring priv->overcurrent_lock and setting
priv->overcurrent_status =3D true.

If ohci_omap_hub_control() handles SetPortFeature(USB_PORT_FEAT_POWER) at
the same time (for instance during root hub activation or port power
recovery), it can check priv->overcurrent_status after
ohci_omap_overcurrent_irq() cuts VBUS power, still see
priv->overcurrent_status =3D=3D false, and call
gpiod_set_value_cansleep(priv->power, 0) to turn VBUS back on just before
ohci_omap_overcurrent_irq() records priv->overcurrent_status =3D true.

Should the overcurrent_status update and the VBUS power GPIO state changes
be serialized under a sleeping lock such as a mutex?

[ ... ]

> +static int ohci_omap_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 w=
Value,
> +				 u16 wIndex, char *buf, u16 wLength)
> +{
> +	struct ohci_omap_priv *priv =3D hcd_to_ohci_omap_priv(hcd);
> +	unsigned long flags;
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
> +			ret =3D ohci_hub_control(hcd, typeReq, wValue,
> +					       wIndex, buf, wLength);
> +			if (!ret) {
> +				spin_lock_irqsave(&priv->overcurrent_lock,
> +						  flags);
> +				if (!priv->overcurrent_status)
> +					gpiod_set_value_cansleep(priv->power,
> +								 0);
> +				spin_unlock_irqrestore(&priv->overcurrent_lock,
> +						       flags);
> +			}
> +			return ret;
> +		}

[Severity: High]
Doesn't calling gpiod_set_value_cansleep() while holding
priv->overcurrent_lock in ohci_omap_hub_control() sleep in atomic context?

During probe (usb_add_hcd() -> register_root_hub() -> hub_probe() ->
hub_activate() -> hub_power_on()) or port power recovery, USB core sends
SetPortFeature(USB_PORT_FEAT_POWER) for port 1.

gpiod_set_value_cansleep() calls might_sleep(), and on OMAP1 OSK the
"power" GPIO resides on the I2C-attached TPS65010 PMIC:

arch/arm/mach-omap1/board-osk.c:osk_usb_gpio_table:
	/* Power GPIO on the I2C-attached TPS65010 */
	GPIO_LOOKUP("tps65010", OSK_TPS_GPIO_USB_PWR_EN, "power",
		    GPIO_ACTIVE_HIGH),

drivers/mfd/tps65010.c:tps65010_set_gpio_out_value():
	mutex_lock(&the_tps->lock);

	defgpio =3D i2c_smbus_read_byte_data(the_tps->client, TPS_DEFGPIO);

Calling this inside spin_lock_irqsave(&priv->overcurrent_lock, flags)
acquires a mutex and performs blocking I2C SMBus transfers with preemption
and local interrupts disabled.

[ ... ]

> @@ -277,23 +425,76 @@ static int ohci_hcd_omap_probe(struct platform_devi=
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
> +					      IRQF_ONESHOT | IRQF_NO_AUTOEN |
> +					      IRQF_TRIGGER_RISING |
> +					      IRQF_TRIGGER_FALLING,
> +					      "ohci-omap-overcurrent", hcd);
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
> +		spin_lock_irqsave(&priv->overcurrent_lock, flags);
> +		priv->overcurrent_status =3D !!status;
> +		priv->overcurrent_changed =3D !!status;
> +		spin_unlock_irqrestore(&priv->overcurrent_lock, flags);
> +
> +		if (status && priv->power)
> +			gpiod_set_value_cansleep(priv->power, 1);
> +
> +		enable_irq(priv->overcurrent_irq);
> +		if (status)
> +			usb_hcd_poll_rh_status(hcd);
> +	}

[Severity: Medium]
Should the initial overcurrent GPIO state and IRQ setup happen before
usb_add_hcd() enables VBUS and registers the root hub?

Inside usb_add_hcd():
1. hcd->driver->reset() calls ohci_omap_reset(), which unconditionally
   enables VBUS via gpiod_set_value_cansleep(priv->power, 0) before
   priv->overcurrent is sampled.
2. hcd->driver->start() calls ohci_run(), which sleeps with VBUS enabled
   and no overcurrent IRQ registered.
3. register_root_hub() runs hub_probe() -> hub_configure() ->
   hub_activate() -> hub_power_on(), issuing
   SetPortFeature(USB_PORT_FEAT_POWER) to ohci_omap_hub_control() while
   priv->overcurrent_status is still false, so priv->power is driven to 0
   even if an overcurrent condition is already present.

Furthermore, because the root hub is already registered and exposed to
hub_wq before usb_add_hcd() returns, unconditionally assigning
priv->overcurrent_status and priv->overcurrent_changed here can overwrite
concurrent root hub status queries or ClearPortFeature requests.

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
> +	omap_ohci_clock_power(priv, 0);
> +	if (!IS_ERR_OR_NULL(hcd->usb_phy)) {
> +		(void)otg_set_host(hcd->usb_phy->otg, NULL);
> +		usb_put_phy(hcd->usb_phy);
> +	}
> +err_iounmap:
>  	iounmap(hcd->regs);
> -err2:
> +err_release_mem:
>  	release_mem_region(hcd->rsrc_start, hcd->rsrc_len);
>  err_unprepare_dc_ck:
>  	clk_unprepare(priv->usb_dc_ck);
> @@ -327,6 +528,10 @@ static void ohci_hcd_omap_remove(struct platform_dev=
ice *pdev)
>  	struct ohci_omap_priv *priv =3D hcd_to_ohci_omap_priv(hcd);
> =20
>  	dev_dbg(hcd->self.controller, "stopping USB Controller\n");
> +	if (priv->overcurrent_irq >=3D 0) {
> +		free_irq(priv->overcurrent_irq, hcd);
> +		priv->overcurrent_irq =3D -1;
> +	}
>  	usb_remove_hcd(hcd);
>  	omap_ohci_clock_power(priv, 0);
>  	if (!IS_ERR_OR_NULL(hcd->usb_phy)) {

[Severity: Medium]
Does VBUS power remain enabled via priv->power if probe fails at
err_remove_hcd or when ohci_hcd_omap_remove() unbinds the driver?

During usb_add_hcd(), ohci_omap_reset() and hub_power_on() drive
priv->power to 0 to turn on VBUS. When usb_remove_hcd() runs in
err_remove_hcd or ohci_hcd_omap_remove(), neither hub_disconnect() nor
ohci_stop() issues ClearPortFeature(USB_PORT_FEAT_POWER), and resetting the
OHCI registers does not turn off the external GPIO power switch.

Should err_remove_hcd and ohci_hcd_omap_remove() drive priv->power to 1
after usb_remove_hcd() so VBUS is not left powered on without an active HCD
or overcurrent interrupt handler?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261018155355.1162=
90-1-ampr.mhd@gmail.com?part=3D1
