Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794016653;
	b=Ka+PTzg0oJQaQkEgoDEH0nxV/stvzBmFbIqRjLpFQOMGfHqsndLxK91ESnVfgQFKFCtL
	 OAM85L3ih/p2Ff0Fahu3WFwLMG+9OR2RUMTbRSJWWHQU81nxui3CHlXBKR5XB9oLmroIV
	 ke4/jbITGXKq3YPGUzcjB3IBC1kudh/YJ7DnmRfzctr5sY2XFRKwDKQUpK9NQha/fVAca
	 jjpR7o+AI+zV+ESDMLf72pjw/q08I4LjWMUrUnomuwBV2hcWNxj8NV5S/VzcdTT7N1Uj8
	 h+Nau58mG7WfxOlMHU7zVM3/+RqlustzWrr8G6551tCAc3fE2mEmW4NWaaWNHq9kFAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794016653;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=IppnEFJBa+bQlPRoVrPQYx2nDRNNbkCoRNEzyD2H2aI=;
	b=PMcauJ2TefDYNXFh310P86ptGf/Q9xTbGVDKE7VFOu6cJXsrX/N8gijpS4JfAFO+airo
	 NHSQI4cMtSPIUzlVrd/b9L04xyLcxhbYm3Kd99bjBI2aUtVqY77ubgchz2kzu5HCaQ95H
	 uSvbo8UIV0/Aa3fHR670i4fHD5Typct6mEcvZveQt8yMFITS5E/y80MHBTD1v3jnaRGV8
	 17vitek5j89vvjnCKYxNMS2LDgY5VKoF0VZWrlo8kDPjG04Jhj8P2jL8ri4FUxMZdtv8I
	 N6rUgA8pubIAhieim18wCq4vPdWW2HX0OB8WhrM77YCoHrm/X9AJhLcSTdXM+yhJShA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ALBm4J9P;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80022606A32D;
	Sat,  7 Nov 2026 01:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ALBm4J9P
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 250921F008A1;
	Sat,  7 Nov 2026 01:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794016652;
	bh=IppnEFJBa+bQlPRoVrPQYx2nDRNNbkCoRNEzyD2H2aI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ALBm4J9PMymp1JEUY54mNbPruZjAoC30S3GHx2d5yE74ULv4jb6UNZ5+q/vZXI4e3
	 7bsZR2GZFG2xi4hT+6w8pdfcv4hn1Mv5U+KtB+n3fSjXmcwqaM0CWnqMNFFbFin8qL
	 ueJbSgqSy3g48E1R+Lv8Za1+Ldk9zbZl9hgOcxqK8Rva3+zNk+SILs+3oPS/7jz81c
	 zN5l439cwJ1vy+3g0i7J9Vh1SlqlmSPjSYZJo58JgQjKlndkhJMSP/Mp+KbiUwp55W
	 4XPpG0uKTRZormYe4JrA5WYSJekWnCw3Fylibh8o1JGEFrEIrzPdUVPv170lHlLUzj
	 8ByKlyzqkmaKA==
Message-ID: <sashiko-outbox-202469@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] usb: typec: add CIX Type-C PD controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gary Yang" <gary.yang@cixtech.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261107011012.3655873-3-gary.yang@cixtech.com>
References: <20261107011012.3655873-1-gary.yang@cixtech.com>
 <20261107011012.3655873-3-gary.yang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 01:57:31 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 12 potential
issues to consider:
- [High] usb: typec: cix_pd: unbalanced disable_irq() on shared IRQ in
  cix_pd_remove()
- [Medium] usb: typec: cix_pd: NULL altmode passed to mux in
  cix_pd_typec_port_update()
- [Medium] usb: typec: cix_pd: invalid unconditional DP partner altmode
  registration
- [Medium] usb: typec: cix_pd: wrong USB 2.0 orientation and mux state
  in port update
- [Medium] usb: typec: cix_pd: role cached on switch failure and skipped
  on restore
- [Medium] usb: typec: Kconfig: missing USB_ROLE_SWITCH dependency for
  TYPEC_CIX_PD
- [Medium] usb: typec: cix_pd: missing .poweroff callback and broken PM
  state handling
- [Low] usb: typec: cix_pd: missing static qualifier on DEVICE_ATTR_RW()
  definition
- [Low] usb: typec: cix_pd: cix_pd_typec_parse_port_props() duplicates
  typec_get_fw_cap()
- [Low] usb: typec: cix_pd: deferred-probe churn and mux state in
  cix_pd_init_ports()
- [Low] usb: typec: cix_pd: non-static and undocumented
  disable_pd_interrupt sysfs attr
- [Low] usb: typec: cix_pd: positional struct i2c_device_id initializer
  in cix_pd_id
--

commit 580ec433cd2d8c9792fdacbbc473c28e5cbfb4c8
Author: Gary Yang <gary.yang@cixtech.com>

usb: typec: add CIX Type-C PD controller driver

This commit adds an I2C driver for the CIX Type-C PD controller (initially
supporting the Realtek RTS5453H) to report orientation, USB role, and
DisplayPort alternate mode state to the Type-C class, mux, and USB role
switch frameworks.

> diff --git a/drivers/usb/typec/Kconfig b/drivers/usb/typec/Kconfig
> index 2f80c2792dbda..b81a0d946d002 100644
> --- a/drivers/usb/typec/Kconfig
> +++ b/drivers/usb/typec/Kconfig
> @@ -110,6 +110,17 @@ config TYPEC_WUSB3801
>  	  If you choose to build this driver as a dynamically linked module, the
>  	  module will be called wusb3801.ko.
> =20
> +config TYPEC_CIX_PD
> +	tristate "CIX Type-C PD controller driver"
> +	depends on I2C
> +	select REGMAP_I2C

[Severity: Medium]
Does TYPEC_CIX_PD need a dependency on USB_ROLE_SWITCH?  Building with
CONFIG_TYPEC_CIX_PD=3Dy and CONFIG_USB_ROLE_SWITCH=3Dm fails to link with
undefined references to fwnode_usb_role_switch_get(),
usb_role_switch_set_role(), and usb_role_switch_put(), while
CONFIG_USB_ROLE_SWITCH=3Dn causes fwnode_usb_role_switch_get() to return
ERR_PTR(-ENODEV) and fail cix_pd_probe() unconditionally.

> diff --git a/drivers/usb/typec/cix_pd.c b/drivers/usb/typec/cix_pd.c
> new file mode 100644
> index 0000000000000..b65e1a4760b7d
> --- /dev/null
> +++ b/drivers/usb/typec/cix_pd.c
[ ... ]
> +static const struct typec_altmode_desc cix_pd_dp_altmode =3D {
> +	.svid =3D USB_TYPEC_DP_SID,
> +	.mode =3D USB_TYPEC_DP_MODE,
> +};
> +
> +static int cix_pd_typec_port_update(struct cix_pd *typec)
> +	struct typec_displayport_data *dp_data =3D &typec->dp_data;
> +	enum typec_orientation orientation;
> +	enum usb_role role;
> +	bool connected;
> +	int ret =3D 0;
> +
> +	if (!(typec->data_status[1] & USB3_2_CONNECTION) &&
> +	    !(typec->data_status[2] & DP_CONNECTION))
> +		orientation =3D TYPEC_ORIENTATION_NONE;
> +	else if (typec->data_status[1] & CONNECTION_ORIENTATION)
> +		orientation =3D TYPEC_ORIENTATION_REVERSE;
> +	else
> +		orientation =3D TYPEC_ORIENTATION_NORMAL;
> +
> +	ret =3D typec_set_orientation(typec->port, orientation);
> +	if (ret)
> +		return ret;
> +
> +	if (!(typec->data_status[1] & USB3_2_CONNECTION) &&
> +	    !(typec->data_status[1] & USB2_CONNECTION))
> +		role =3D USB_ROLE_NONE;
> +	else if (typec->data_status[1] & USB_DATA_ROLE)
> +		role =3D USB_ROLE_DEVICE;
> +	else
> +		role =3D USB_ROLE_HOST;
> +
> +	if (typec->data_status[2] & DEBUG_ACCESSORY_ATTACHED)
> +		dev_err(typec->dev,
> +			"debug accessory mode not supported, try another usb cable\n");
> +
> +	/*
> +	 * Update the partner before building the mux state so that the DP
> +	 * alternate mode handed to the mux is always a registered one.
> +	 * Debug accessories are treated as not connected, since they are
> +	 * not supported.
> +	 */
> +	connected =3D !(typec->data_status[2] & DEBUG_ACCESSORY_ATTACHED) &&
> +		    ((typec->data_status[1] & (USB2_CONNECTION | USB3_2_CONNECTION)) ||
> +		     (typec->data_status[2] & DP_CONNECTION));
> +	if (!connected) {
> +		if (typec->partner) {
> +			dev_info(typec->dev, "typec port(%d): unregister partner\n",
> +				 typec->id);
> +			typec_unregister_altmode(typec->partner_altmode);
> +			typec->partner_altmode =3D NULL;
> +			typec_unregister_partner(typec->partner);
> +			typec->partner =3D NULL;
> +		}
> +	} else {
> +		if (!typec->partner) {
> +			dev_info(typec->dev, "typec port(%d): register partner\n",
> +				 typec->id);
> +			typec->partner =3D typec_register_partner(typec->port,
> +								&typec->desc);
> +			if (IS_ERR(typec->partner)) {
> +				dev_err(typec->dev,
> +					"typec port(%d): failed to register partner: %ld\n",
> +					typec->id, PTR_ERR(typec->partner));
> +				typec->partner =3D NULL;
> +			}
> +		}
> +
> +		if (typec->partner && !typec->partner_altmode) {
> +			typec->partner_altmode =3D
> +				typec_partner_register_altmode(typec->partner,
> +							       &cix_pd_dp_altmode);
> +			if (IS_ERR(typec->partner_altmode)) {
> +				dev_err(typec->dev,
> +					"typec port(%d): failed to register DP altmode: %ld\n",
> +					typec->id,
> +					PTR_ERR(typec->partner_altmode));
> +				typec->partner_altmode =3D NULL;
> +			}
> +		}
> +	}

[Severity: Medium]
Should typec->partner_altmode only be registered when DP_CONNECTION is
set?

Calling typec_partner_register_altmode() for every connected partner
exposes a DisplayPort alternate mode in sysfs even for plain USB 2.0 or
USB 3.2 devices.  In addition, cix_pd_dp_altmode leaves .vdo =3D 0 and the
registration runs before typec_set_data_role(), so when
CONFIG_TYPEC_DP_ALTMODE is enabled, dp_altmode_probe() fails with -EPROTO
or -ENODEV on every attach.  typec_altmode_update_active() is also never
called on typec->partner_altmode, and cix_pd_typec_parse_port_props() does
not set cap->no_mode_control =3D true even though firmware manages alternate
modes autonomously.

> +	if ((typec->data_status[1] & USB3_2_CONNECTION) &&
> +	    (typec->data_status[2] & DP_CONNECTION)) {
> +		/* usb + dp */
> +		dp_data->status =3D DP_STATUS_ENABLED;
> +		if (typec->data_status[2] & HPD_STATE)
> +			dp_data->status |=3D DP_STATUS_HPD_STATE;
> +		if (typec->data_status[2] & HPD_IRQ)
> +			dp_data->status |=3D DP_STATUS_IRQ_HPD;
> +
> +		typec->state.data =3D dp_data;
> +		typec->state.mode =3D TYPEC_DP_STATE_D;
> +		typec->state.alt =3D typec->partner_altmode;
> +	} else if (typec->data_status[2] & DP_CONNECTION) {
> +		/* dp only */
> +		dp_data->status =3D DP_STATUS_ENABLED;
> +		if (typec->data_status[2] & HPD_STATE)
> +			dp_data->status |=3D DP_STATUS_HPD_STATE;
> +		if (typec->data_status[2] & HPD_IRQ)
> +			dp_data->status |=3D DP_STATUS_IRQ_HPD;
> +		typec->state.data =3D dp_data;
> +		typec->state.mode =3D TYPEC_DP_STATE_E;
> +		typec->state.alt =3D typec->partner_altmode;

[Severity: Medium]
Can this pass a NULL state.alt to typec_mux_set() when state.mode is
TYPEC_DP_STATE_D or TYPEC_DP_STATE_E?

If typec_register_partner() or typec_partner_register_altmode() fails, or
if DEBUG_ACCESSORY_ATTACHED is set alongside DP_CONNECTION,
typec->partner_altmode is NULL, but execution continues into the
DP_CONNECTION branches and calls typec_mux_set() with a modal state and
state.alt =3D=3D NULL, which mux drivers dereference directly (e.g.
state->alt->svid).  DEBUG_ACCESSORY_ATTACHED is also ignored when
computing orientation, role, and mux state above, despite the comment
stating that debug accessories are treated as not connected.

> +	} else if (typec->data_status[1] & USB3_2_CONNECTION) {
> +		/* usb only */
> +		dp_data->status =3D 0;
> +		typec->state.mode =3D TYPEC_STATE_USB;
> +		typec->state.alt =3D NULL;
> +		typec->state.data =3D NULL;
> +	} else {
> +		/* disconnect */
> +		dp_data->status =3D 0;
> +		typec->state.mode =3D TYPEC_STATE_SAFE;
> +		typec->state.alt =3D NULL;
> +		typec->state.data =3D NULL;
> +	}

[Severity: Medium]
Does cix_pd_typec_port_update() mishandle USB 2.0-only connections in the
orientation and mux state checks?

When USB2_CONNECTION is set without USB3_2_CONNECTION or DP_CONNECTION,
connected is true and a partner is registered, but the orientation check
at the top of the function sets TYPEC_ORIENTATION_NONE and the mux check
here falls into the disconnect branch (TYPEC_STATE_SAFE) and logs
"disconnect state" on attach.

> +	ret =3D typec_mux_set(typec->mux, &typec->state);
> +	if (ret)
> +		return ret;
> +
> +	if ((typec->data_status[3] & POWER_MASK) =3D=3D POWER_SOURCE) {
> +		typec_set_pwr_role(typec->port, TYPEC_SOURCE);
> +	} else if ((typec->data_status[3] & POWER_MASK) =3D=3D POWER_SINK) {
> +		typec_set_pwr_role(typec->port, TYPEC_SINK);
> +	} else {
> +		dev_dbg(typec->dev, "typec port(%d): unknown power state %d\n",
> +			typec->id, typec->data_status[3]);
> +	}
> +
> +	if (typec->role !=3D role) {
> +		typec->role =3D role;
> +		ret =3D usb_role_switch_set_role(typec->role_sw, role);
> +		if (role =3D=3D USB_ROLE_DEVICE)
> +			typec_set_data_role(typec->port, TYPEC_DEVICE);
> +		else if (role =3D=3D USB_ROLE_HOST)
> +			typec_set_data_role(typec->port, TYPEC_HOST);
> +	}

[Severity: Medium]
If usb_role_switch_set_role() fails, does caching typec->role =3D role first
prevent later status updates from retrying the role switch?  It also calls
typec_set_data_role() despite the failure, and during hibernation restore
(cix_pd_restore() -> cix_pd_event_handler()), usb_role_switch_set_role()
will be skipped if the post-hibernation role matches the pre-hibernation
typec->role.

[ ... ]

> +static int cix_pd_typec_parse_port_props(struct typec_capability *cap,
> +					 struct fwnode_handle *fwnode,
> +					 struct device *dev)
> +{
> +	const char *buf;
> +	int ret;
> +
> +	memset(cap, 0, sizeof(*cap));
> +	ret =3D fwnode_property_read_string(fwnode, "power-role", &buf);
> +	if (ret) {
> +		dev_err(dev, "power-role not found: %d\n", ret);
> +		return ret;
> +	}
> +	ret =3D typec_find_port_power_role(buf);
> +	if (ret < 0)
> +		return ret;
> +	cap->type =3D ret;
> +	ret =3D fwnode_property_read_string(fwnode, "data-role", &buf);
> +	if (ret) {
> +		dev_err(dev, "data-role not found: %d\n", ret);
> +		return ret;
> +	}
> +	ret =3D typec_find_port_data_role(buf);
> +	if (ret < 0)
> +		return ret;
> +	cap->data =3D ret;
> +	ret =3D fwnode_property_read_string(fwnode, "try-power-role", &buf);
> +	if (ret) {
> +		dev_err(dev, "try-power-role not found: %d\n", ret);
> +		return ret;
> +	}
> +	ret =3D typec_find_power_role(buf);
> +	if (ret < 0)
> +		return ret;
> +	cap->prefer_role =3D ret;
> +	cap->fwnode =3D fwnode_handle_get(fwnode);
> +	cap->orientation_aware =3D 1;
> +	return 0;
> +}

[Severity: Low]
Could this use the exported typec_get_fw_cap() helper instead of
open-coding the fwnode property parsing?  cix_pd_typec_parse_port_props()
also requires "try-power-role" and "data-role" unconditionally, whereas
typec_get_fw_cap() and usb-connector.yaml treat "data-role" as optional
and only parse "try-power-role" for DRP ports.

[ ... ]

> +static void cix_pd_unregister_ports(struct cix_pd *typec)
> +{
> +	if (!IS_ERR_OR_NULL(typec->port)) {
> +		typec->state.alt =3D NULL;
> +		typec->state.mode =3D TYPEC_STATE_USB;
> +		typec->state.data =3D NULL;
> +		usb_role_switch_set_role(typec->role_sw, USB_ROLE_NONE);
> +		typec_set_orientation(typec->port, TYPEC_ORIENTATION_NONE);
> +		typec_mux_set(typec->mux, &typec->state);
[ ... ]
> +static int cix_pd_init_ports(struct cix_pd *typec)
> +{
[ ... ]
> +		typec->port =3D typec_register_port(dev, &typec->caps);
> +		if (IS_ERR(typec->port)) {
> +			ret =3D PTR_ERR(typec->port);
> +			typec->port =3D NULL;
> +			dev_err(dev, "Failed to register port: %d\n", ret);
> +			goto unregister_ports;
> +		}
> +
> +		desc.roles =3D typec->caps.data;
> +		typec->port_altmode =3D typec_port_register_altmode(typec->port,
> +								  &desc);
> +		if (IS_ERR(typec->port_altmode)) {
> +			ret =3D PTR_ERR(typec->port_altmode);
> +			typec->port_altmode =3D NULL;
> +			dev_err(dev, "Failed to register DP altmode: %d\n", ret);
> +			goto unregister_ports;
> +		}
> +
> +		ret =3D cix_pd_typec_get_handles(typec, fwnode, dev);
> +		if (ret)
> +			goto unregister_ports;
> +	}

[Severity: Low]
Should cix_pd_typec_get_handles() be called before typec_register_port(),
and should the port and altmode registration errors use dev_err_probe()?

typec_register_port() and typec_port_register_altmode() can return
ERR_PTR(-EPROBE_DEFER), so dev_err() logs error messages on deferred
probe, and deferring in cix_pd_typec_get_handles() after registering the
port causes unnecessary sysfs registration and removal churn.  Also, in
cix_pd_unregister_ports(), should typec->state.mode be set to
TYPEC_STATE_SAFE rather than TYPEC_STATE_USB when disconnecting the mux?

[ ... ]

> +static void cix_pd_sync_irq(struct cix_pd *rts)
> +{
> +	bool disable =3D rts->pd_int_disabled || rts->suspended;
> +
> +	if (!rts->irq_requested || rts->irq_disabled =3D=3D disable)
> +		return;
> +
> +	rts->irq_disabled =3D disable;
> +	if (disable)
> +		disable_irq(rts->irq);
> +	else
> +		enable_irq(rts->irq);
> +}
[ ... ]
> +DEVICE_ATTR_RW(disable_pd_interrupt);

[Severity: Low]
Should DEVICE_ATTR_RW(disable_pd_interrupt) be declared static so
dev_attr_disable_pd_interrupt does not pollute the global namespace or
trigger a -Wmissing-variable-declarations warning?

Also, this sysfs attribute is undocumented in Documentation/ABI/, is
created via device_create_file() after device registration instead of
.dev_groups (or debugfs for a compliance-test knob), and its show output
("enabled" / "disabled") is rejected with -EINVAL by kstrtobool() in
disable_pd_interrupt_store().

> +static int cix_pd_probe(struct i2c_client *client)
> +{
[ ... ]
> +	if (client->irq > 0) {
> +		irq_set_status_flags(client->irq, IRQ_DISABLE_UNLAZY);
> +		ret =3D request_threaded_irq(client->irq, NULL, cix_pd_irq_handle,
> +					   IRQF_SHARED | IRQF_ONESHOT,
> +					   dev_name(&client->dev), rts);
> +		if (ret) {
> +			dev_err(&client->dev, "failed to request irq: %d\n", ret);
> +			goto err_unregister_ports;
> +		}
> +		rts->irq_requested =3D true;
> +	}
[ ... ]
> +static void cix_pd_remove(struct i2c_client *client)
> +{
> +	struct cix_pd *rts =3D i2c_get_clientdata(client);
> +
> +	device_remove_file(&client->dev, &dev_attr_disable_pd_interrupt);
> +
> +	mutex_lock(&rts->irq_lock);
> +	if (rts->irq_requested) {
> +		rts->suspended =3D true;
> +		cix_pd_sync_irq(rts);
> +		if (rts->wake_enabled) {
> +			disable_irq_wake(rts->irq);
> +			rts->wake_enabled =3D false;
> +		}
> +		free_irq(rts->irq, rts);
> +		rts->irq_requested =3D false;
> +	}
> +	mutex_unlock(&rts->irq_lock);
> +
> +	cix_pd_unregister_ports(rts);
> +}

[Severity: High]
Does cix_pd_remove() leave the shared IRQ permanently disabled for all
other controller instances sharing client->irq?

Because the interrupt is requested with IRQF_SHARED, calling
cix_pd_sync_irq() in cix_pd_remove() (or earlier via
disable_pd_interrupt_store()) calls disable_irq(rts->irq), which
increments desc->depth on the shared irq_desc, and then free_irq() is
called without a matching enable_irq().  When another instance remains
registered on the shared line, __free_irq() does not call irq_shutdown(),
leaving desc->depth elevated and the hardware interrupt masked forever for
sibling ports.

More generally, calling disable_irq() in cix_pd_sync_irq() and setting
IRQ_DISABLE_UNLAZY on a shared line affects all sibling instances:
disabling interrupts on one port via sysfs masks the line for all ports,
and in cix_pd_suspend() calling disable_irq() with IRQ_DISABLE_UNLAZY
masks the hardware IRQ before enable_irq_wake() (and increments
desc->depth once per instance, so suspend_device_irq() cannot re-enable it
when two instances share the line).  Also, irq_clear_status_flags() is not
called if request_threaded_irq() fails in cix_pd_probe(), and
cix_pd_irq_handle() unconditionally acknowledges the interrupt and returns
IRQ_HANDLED without checking whether that instance actually asserted the
shared interrupt.

> +static const struct of_device_id cix_pd_of_match[] =3D {
> +	{ .compatible =3D "realtek,rts5453h", },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, cix_pd_of_match);
> +
> +static const struct i2c_device_id cix_pd_id[] =3D {
> +	{ "rts5453h" },
> +	{}
> +};

[Severity: Low]
This isn't a bug, but I2C subsystem conventions prefer named initializers
for new struct i2c_device_id entries (i.e. { .name =3D "rts5453h" }).

[ ... ]

> +static int __maybe_unused cix_pd_restore(struct device *dev)
> +{
> +	struct i2c_client *client =3D to_i2c_client(dev);
> +	struct cix_pd *rts =3D i2c_get_clientdata(client);
> +	int ret;
> +
> +	ret =3D cix_pd_resume(dev);
> +	if (ret)
> +		return ret;
> +
> +	/* Re-trigger PD event if PD event occurs during std */
> +	ret =3D cix_pd_event_handler(rts, 0);
> +	if (ret)
> +		dev_err(&client->dev, "typec event handling error %d\n", ret);
> +
> +	return ret;
> +}
[ ... ]
> +static const struct dev_pm_ops cix_pd_pm_ops =3D {
> +	.suspend =3D pm_sleep_ptr(cix_pd_suspend),
> +	.resume =3D pm_sleep_ptr(cix_pd_resume),
> +	.freeze =3D pm_sleep_ptr(cix_pd_suspend),
> +	.thaw =3D pm_sleep_ptr(cix_pd_resume),
> +	.restore =3D pm_sleep_ptr(cix_pd_restore),
> +};

[Severity: Medium]
Is cix_pd_pm_ops missing a .poweroff callback for hibernation?

During hibernation, the PM core runs .freeze, creates the image, runs
.thaw (cix_pd_resume(), which clears rts->suspended, disables wake, and
re-enables the IRQ), and then runs .poweroff; without .poweroff, the IRQ
is left enabled and wakeup is not armed when powering off.  In addition,
cix_pd_restore() returns the internal -ESHUTDOWN error code from
cix_pd_event_handler() directly to the PM core instead of translating it
to -EIO as cix_pd_probe() does, and cix_pd_resume() does not call
cix_pd_event_handler() to refresh port state after S3 suspend.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107011012.3655=
873-1-gary.yang@cixtech.com?part=3D2
