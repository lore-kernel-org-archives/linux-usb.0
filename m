Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794255631;
	b=4rGdz04Hzpg6bwfMa5ZMVS5njMe4smmu5GZ3MV6E+oZ8+A1Z+pIyaMNRgLa6pw5Zeetg
	 ycNGCF8bwM5/f+Dn4yEpl2Rmac9FwVyr6IfL5z66AOg36WpNz3hkp0jf3SYMz9+scFAD7
	 1YIj2Bqh8i8M05A2Uyx8+7iD8OH1Eui0ukvdLH7yguleLf4lPHeqFLAzdfstddup3lTs/
	 cbKDZ6+bOqtljoGYll+jyN+oVXLMLlTwnCkFZ8KtOtfA2rVAX3LUn3OtLpsqSo9GJJAsm
	 +JUzoVCuUt2lDV9lJmU3ueqm38kZQ47+YueX1m4lbbdwgHl0KV5pJS2BQMOYwy2Cp4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794255631;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=FAiNAUy6lGZ1UiTjy77G6Yso/QTFRvI5QQmO7y+TLJ8=;
	b=WVr/tr9sclf82/dOqJ+0QgKXRep2YOqsT/XlK3C6bmPE4A2UTbl6YdLIteyBsL+cB22N
	 w8LL4N5wK3ATrqz1fazNAM8wil8hfkLVEuK/3rv6Y04Yy6ikXL8SXXwwVnIVm50w34Zm/
	 BYuYqDKHJ9x+pp/lDaC/mXJs95YR5AGapMjBXnRg+5eKh5ftY9uMyq51hSi2bl3UJBKQ9
	 e0LWJ3jKWqEW/YkjgAwCGRrl0dJuoL1/gHX8MaDcZHe6KvRpK+COAdR3dO70GhWEbpjdx
	 D58rInAQma8CubICPSzcvsJwkWG+k3/kzIOguauAg3rqdDEXdrQfjuLop9YUP/u4NuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H4kIM6xI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19127606A321;
	Mon,  9 Nov 2026 20:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H4kIM6xI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71C351F0089F;
	Mon,  9 Nov 2026 20:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794255630;
	bh=FAiNAUy6lGZ1UiTjy77G6Yso/QTFRvI5QQmO7y+TLJ8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H4kIM6xInwlHLiovnSJ09riixJ0JXuu4duduvyWIr3yXIryCxMapKA08Qgep6X9JV
	 m1PnD+mQ5wjFCqx8cI7BAyweY7a5DlkApxngXBMPhQTiWnx8D2XJEqx38MlF67QiJ3
	 iE53l6GkgSfB5Ab0mmX1+83OwB9gXxxIAH1MbknPMO8Ca4Y2KfGi5aeDz+/5H6na6r
	 /jWIAGaTEjdMJwKwyyU991xboFJ5y7ktiWM4TW0bfSJ8oQ71UbHgxu3cEWHhlqv3Cl
	 MSOZyYNVQgX3TwH+JRZfJ3u31FDknRRp+DHrIBxBw6nIum8RZ9maRYoqFeL2Zjwf2I
	 PhgWXX7x3Gh9Q==
Message-ID: <sashiko-outbox-205571@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] usb: typec: add CIX Type-C PD controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gary Yang" <gary.yang@cixtech.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261109092400.202219-3-gary.yang@cixtech.com>
References: <20261109092400.202219-1-gary.yang@cixtech.com>
 <20261109092400.202219-3-gary.yang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 20:20:30 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential
issues to consider:
- [Medium] usb: typec: cix_pd: double fwnode put in cix_pd_init_ports()
  on parse error
- [Medium] usb: typec: cix_pd: broken role reset and race in
  cix_pd_resume()
- [Medium] usb: typec: cix_pd: missing data role update on DP-only
  connections
- [Medium] usb: typec: cix_pd: check enable_irq_wake() return in
  cix_pd_suspend()
- [Medium] usb: typec: cix_pd: unconditional IRQ_HANDLED in
  cix_pd_irq_handle()
--

commit 03dd05a69907e7c85cf26147fe9e902253dd9e55
Author: Gary Yang <gary.yang@cixtech.com>

usb: typec: add CIX Type-C PD controller driver

This commit adds an I2C driver for the CIX Type-C PD controller (Realtek
RTS5453H), reporting port status, DisplayPort alternate mode, orientation,
and USB role changes to the Type-C framework.

> diff --git a/drivers/usb/typec/cix_pd.c b/drivers/usb/typec/cix_pd.c
> new file mode 100644
> index 0000000000000..30c879f976c25
> --- /dev/null
> +++ b/drivers/usb/typec/cix_pd.c
> @@ -0,0 +1,687 @@

[ ... ]

> +static int cix_pd_typec_port_update(struct cix_pd *typec)
> +{
> +	struct typec_displayport_data *dp_data =3D &typec->dp_data;
> +	enum typec_orientation orientation;
> +	enum usb_role role;
> +	bool usb2, usb3, dp, connected;
> +	int ret, err;
> +
> +	usb2 =3D typec->data_status[1] & USB2_CONNECTION;
> +	usb3 =3D typec->data_status[1] & USB3_2_CONNECTION;
> +	dp =3D typec->data_status[1] & DP_CONNECTION;

[ ... ]

> +	if (!connected || !(usb2 || usb3))
> +		role =3D USB_ROLE_NONE;
> +	else if (typec->data_status[1] & USB_DATA_ROLE)
> +		role =3D USB_ROLE_DEVICE;
> +	else
> +		role =3D USB_ROLE_HOST;
> +
> +	if (typec->role !=3D role) {
> +		err =3D 0;
> +		if (typec->role_sw) {
> +			err =3D usb_role_switch_set_role(typec->role_sw, role);
> +			if (err)
> +				dev_err(typec->dev,
> +					"typec port(%d): failed to set USB role: %d\n",
> +					typec->id, err);
> +		}
> +
> +		/* Only cache the role once the switch accepted it. */
> +		if (!err) {
> +			typec->role =3D role;
> +			if (role =3D=3D USB_ROLE_DEVICE)
> +				typec_set_data_role(typec->port, TYPEC_DEVICE);
> +			else if (role =3D=3D USB_ROLE_HOST)
> +				typec_set_data_role(typec->port, TYPEC_HOST);
> +		}
> +	}

[Severity: Medium]
Does skipping typec_set_data_role() when role is USB_ROLE_NONE leave
typec->port in TYPEC_DEVICE on 4-lane DisplayPort-only connections?

When a 4-lane DisplayPort partner connects (dp is true while usb2 and usb3
are false), role is set to USB_ROLE_NONE and typec_set_data_role() is not
called.  If the port was initialized to TYPEC_DEVICE (such as a dual-role
port without try-power-role set to source) or was previously in device
mode, registering cix_pd_dp_partner_altmode below fails in
dp_altmode_probe() with -EPROTO because it requires the port data role to
be TYPEC_HOST:

drivers/usb/typec/altmodes/displayport.c:dp_altmode_probe() {
	...
	/* Port can only be DFP_U. */
	if (typec_altmode_get_data_role(alt) !=3D TYPEC_HOST)
		return -EPROTO;
	...
}

Updating typec->port's data role from USB_DATA_ROLE whenever connected is
true, independently of the USB controller's role switch state, would avoid
this.

[ ... ]

> +static int cix_pd_typec_parse_port_props(struct typec_capability *cap,
> +					 struct fwnode_handle *fwnode,
> +					 struct device *dev)
> +{
> +	int ret;
> +
> +	memset(cap, 0, sizeof(*cap));
> +	ret =3D typec_get_fw_cap(cap, fwnode);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "failed to parse connector properties\n");
> +
> +	cap->fwnode =3D fwnode_handle_get(fwnode);
> +	cap->orientation_aware =3D true;
> +	/* Alternate modes are entered and exited by the controller firmware. */
> +	cap->no_mode_control =3D true;
> +
> +	return 0;
> +}

[ ... ]

> +static void cix_pd_unregister_ports(struct cix_pd *typec)
> +{

[ ... ]

> +	usb_role_switch_put(typec->role_sw);
> +	typec->role_sw =3D NULL;
> +	typec_mux_put(typec->mux);
> +	typec->mux =3D NULL;
> +	fwnode_handle_put(typec->caps.fwnode);
> +	typec->caps.fwnode =3D NULL;
> +}
> +
> +static irqreturn_t cix_pd_irq_handle(int irq, void *data)
> +{
> +	struct cix_pd *rts =3D data;
> +
> +	if (cix_pd_event_handler(rts, 1) =3D=3D -ESHUTDOWN)
> +		return IRQ_NONE;
> +
> +	return IRQ_HANDLED;
> +}

[Severity: Medium]
Can returning IRQ_HANDLED unconditionally on a shared level-triggered
interrupt line cause an unthrottled interrupt storm?

cix_pd_event_handler() returns 0 whenever I2C transfers to this controller
succeed, even if this instance did not assert the interrupt.  If another
controller sharing the IRQ line holds it active while not yet probed,
probe-deferred, unbound, or unresponsive over I2C, this handler still
returns IRQ_HANDLED on every pass, preventing the IRQ core from detecting
and disabling the stuck interrupt line.  Additionally, cix_pd_probe() calls
cix_pd_event_handler(rts, 0) without acknowledging a pending interrupt
before requesting the IRQ.

> +
> +static int cix_pd_init_ports(struct cix_pd *typec)
> +{
> +	struct device *dev =3D typec->dev;
> +	struct typec_altmode_desc desc =3D cix_pd_dp_port_altmode;
> +	struct fwnode_handle *fwnode;
> +	int ret;
> +
> +	fwnode =3D device_get_named_child_node(dev, "connector");
> +	if (!fwnode)
> +		return dev_err_probe(dev, -ENODEV, "no connector node found\n");
> +
> +	ret =3D cix_pd_typec_get_handles(typec, fwnode, dev);
> +	if (ret)
> +		goto out_put_fwnode;
> +
> +	ret =3D cix_pd_typec_parse_port_props(&typec->caps, fwnode, dev);
> +	if (ret)
> +		goto out_unregister_ports;

[ ... ]

> +out_unregister_ports:
> +	cix_pd_unregister_ports(typec);
> +out_put_fwnode:
> +	fwnode_handle_put(fwnode);
> +	return ret;
> +}

[Severity: Medium]
Does cix_pd_init_ports() put fwnode twice when
cix_pd_typec_parse_port_props() fails?

typec_get_fw_cap() assigns cap->fwnode =3D fwnode before validating the
connector properties:

drivers/usb/typec/class.c:typec_get_fw_cap() {
	cap->fwnode =3D fwnode;

	ret =3D fwnode_property_read_string(fwnode, "power-role", &cap_str);
	if (ret < 0)
		return ret;
	...
}

When typec_get_fw_cap() returns an error, cix_pd_typec_parse_port_props()
returns before calling fwnode_handle_get(fwnode), leaving
typec->caps.fwnode pointing to fwnode without an extra reference.  Jumping
to out_unregister_ports then calls fwnode_handle_put(typec->caps.fwnode) in
cix_pd_unregister_ports() and fwnode_handle_put(fwnode) at out_put_fwnode,
underflowing the fwnode reference count.

[ ... ]

> +static int __maybe_unused cix_pd_suspend(struct device *dev)
> +{
> +	struct i2c_client *client =3D to_i2c_client(dev);
> +	struct cix_pd *rts =3D i2c_get_clientdata(client);
> +
> +	if (client->irq > 0 && device_may_wakeup(dev)) {
> +		mutex_lock(&rts->irq_lock);
> +		if (!rts->wake_enabled) {
> +			enable_irq_wake(client->irq);
> +			rts->wake_enabled =3D true;
> +		}
> +		mutex_unlock(&rts->irq_lock);
> +	}
> +
> +	return 0;
> +}

[Severity: Medium]
What happens if enable_irq_wake() fails in cix_pd_suspend()?

cix_pd_probe() marks the device wakeup-capable unconditionally, so
enable_irq_wake() can fail if the interrupt controller does not support
wakeup.  Setting rts->wake_enabled =3D true without checking the return val=
ue
causes cix_pd_resume() or cix_pd_remove() to call disable_irq_wake(),
triggering an "Unbalanced IRQ wake disable" warning in irq_set_irq_wake().

> +
> +static int __maybe_unused cix_pd_resume(struct device *dev)
> +{
> +	struct i2c_client *client =3D to_i2c_client(dev);
> +	struct cix_pd *rts =3D i2c_get_clientdata(client);
> +	int ret;
> +
> +	mutex_lock(&rts->irq_lock);
> +	if (rts->wake_enabled) {
> +		disable_irq_wake(client->irq);
> +		rts->wake_enabled =3D false;
> +	}
> +	mutex_unlock(&rts->irq_lock);
> +
> +	/* Force the USB role to be reprogrammed after system resume. */
> +	rts->role =3D USB_ROLE_NONE;
> +
> +	ret =3D cix_pd_event_handler(rts, 0);

[Severity: Medium]
Does setting rts->role =3D USB_ROLE_NONE before cix_pd_event_handler() prev=
ent
clearing the USB role when a partner was unplugged during suspend?

If the port was in host or device mode before suspend and the cable was
unplugged while suspended, cix_pd_typec_port_update() computes
role =3D USB_ROLE_NONE, sees typec->role =3D=3D role, and skips
usb_role_switch_set_role(typec->role_sw, USB_ROLE_NONE), leaving the USB
controller stuck in its pre-suspend role.

Also, device interrupts are re-enabled before cix_pd_resume() runs, so
writing rts->role without holding rts->lock races with
cix_pd_irq_handle() -> cix_pd_event_handler():

CPU0                              CPU1
cix_pd_irq_handle()
  cix_pd_event_handler()
    mutex_lock(&rts->lock)
    cix_pd_typec_port_update()
      rts->role =3D USB_ROLE_HOST;
                                  cix_pd_resume()
                                    rts->role =3D USB_ROLE_NONE;  <-- data =
race
    mutex_unlock(&rts->lock)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109092400.2022=
19-1-gary.yang@cixtech.com?part=3D2
