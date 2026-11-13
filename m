Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794580311;
	b=F43FA5jtP6b0o2CSKTq6gGlNYwZPP8TqajQCXvYQiFghRP4zp9PJLqHmjqxCrsWEWK+t
	 zRuVucmHxUQdiz8bY5HW3WfXM2wjS26E6vN0RHZbI6yifw12v4EUPi72TIIsvUbfmcDZ3
	 ND6/ifWxFGRKS0ieB3Rs7JQS2dwZe5ylvqEPNo6bpAl/uLOm4p674k8xZ4MlzY+cxCv2j
	 DnZGO6zbrgAyi3w7LPnssGYo68JelFxDOwP57ns1dhJrbWf4MuIRdE8EGKQIVjZ2ty+ke
	 +7LtlN+5iN7NYXUia7kcb50nx2pYrTh9Zrz+r0fPEImWEE4D4NrckOz4Fih4WkXREMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794580311;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=AQTIB2teJWY+3iKjLCvBtV2MVtGJ+izUY3kckVI52ZI=;
	b=qJbStJs1mb0/M0hOKqlOlDXgyz2BroKIkWtOt1gNGJb5ThfAA6VTTKtR65Pg2CpOM9fP
	 vJuXd+Ov/OB8oIxMDJ19r3xchrBw3W9WC34/0Kcsg3ekA7hW1ui47DbAPSC358ECF6i7F
	 BxvRAGLJ+mQ9LEddpL4CtjuI5viSlEkpSw9ayETt3nnz541VllqmKgacfWyJPQLEjc8F5
	 7ZQ0UiSnpTi2kkyzkLe17FQPXqx3nGI6hysPucW1nikbtc48Yok2AeVde28ud1wqU7mdz
	 Kf5SQUVNsT1SJqEnlMmQVsagr5LwE8x684KV+B5hahL2D6av1c2cgNCs3H0sbhVzJKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UqrBfwe8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB50F606A327;
	Fri, 13 Nov 2026 14:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UqrBfwe8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 421191F000C8;
	Fri, 13 Nov 2026 14:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794580310;
	bh=AQTIB2teJWY+3iKjLCvBtV2MVtGJ+izUY3kckVI52ZI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UqrBfwe8c9QtGqXnxpQlLzJCY8fpZF9KhrJ7adps0zEIdWmNdTmE1nPHeE06Ar/38
	 vD8kMEA311lnNRh6Kn4L5/S2AdWS+NU0zo40C+lxNFMntdd4hq+RO2d6usfU5JTzf9
	 Ywe+/EcB1qRNAWqmUqGkuM67lQFl0HEbmKwcXtalHm7DuiNX5wuaCN8ladbRyx4c15
	 oWdtxWDdIRojKwgwwUkxEQBT77DKiLWcFyN3vgoyo6qGx6xvWqVjxQWKuP68msyMqa
	 x46mqW7WBdHoqp6TcD4fGMQNEyg2qFJPqX736NEjGfwiRMsT2tLkRUmwQlc3qiyu+A
	 3mnDVcFvQRA5A==
Message-ID: <sashiko-outbox-212990@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] usb: typec: add CIX Type-C PD controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gary Yang" <gary.yang@cixtech.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261113125304.1693911-3-gary.yang@cixtech.com>
References: <20261113125304.1693911-1-gary.yang@cixtech.com>
 <20261113125304.1693911-3-gary.yang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 14:31:49 +0000
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
- [High] usb: typec: cix_pd: HPD_IRQ latched in prev_status in
  cix_pd_event_handler()
- [Medium] usb: typec: cix_pd: unacknowledged IRQ on status refresh in
  cix_pd_resume()
- [Medium] usb: typec: cix_pd: unconditional port update in
  cix_pd_event_handler()
- [Medium] usb: typec: cix_pd: unlocked device_is_bound() in
  cix_pd_typec_port_update()
- [Medium] usb: typec: cix_pd: IRQ re-enabled on wake error in
  cix_pd_suspend()
--

commit df6c3014329332ed5d36e38c30e57956677e5273
Author: Gary Yang <gary.yang@cixtech.com>

usb: typec: add CIX Type-C PD controller driver

This commit adds an I2C driver for the CIX Type-C PD controller (Realtek
RTS5453H), reporting orientation, USB data role, power role, and DisplayPort
alternate mode state changes to the Type-C framework.

> diff --git a/drivers/usb/typec/cix_pd.c b/drivers/usb/typec/cix_pd.c
> new file mode 100644
> index 0000000000000..b413a125c7e6a
> --- /dev/null
> +++ b/drivers/usb/typec/cix_pd.c

[ ... ]

> +static int cix_pd_typec_port_update(struct cix_pd *typec, bool force)
> +{

[ ... ]

> +	if (!connected) {
> +		if (typec->partner_altmode) {
> +			typec_altmode_update_active(typec->partner_altmode,
> +						    false);
> +			typec_unregister_altmode(typec->partner_altmode);
> +			typec->partner_altmode =3D NULL;
> +		}
> +		if (typec->partner) {
> +			dev_info(typec->dev, "typec port(%d): unregister partner\n",
> +				 typec->id);
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
> +		if (typec->partner_altmode && !dp) {
> +			typec_altmode_update_active(typec->partner_altmode,
> +						    false);
> +			typec_unregister_altmode(typec->partner_altmode);
> +			typec->partner_altmode =3D NULL;
> +		}
> +
> +		if (typec->partner && dp && !typec->partner_altmode) {
> +			typec->partner_altmode =3D
> +				typec_partner_register_altmode(typec->partner,
> +							       &cix_pd_dp_partner_altmode);
> +			if (IS_ERR(typec->partner_altmode)) {
> +				dev_err(typec->dev,
> +					"typec port(%d): failed to register DP altmode: %ld\n",
> +					typec->id,
> +					PTR_ERR(typec->partner_altmode));
> +				typec->partner_altmode =3D NULL;
> +			}
> +		}
> +
> +		/*
> +		 * typec_altmode_update_active() takes a reference to the
> +		 * alternate mode driver's module only when a driver is bound
> +		 * to the mode device. Reporting the mode as active without a
> +		 * driver would leave that reference unbalanced, and the later
> +		 * deactivation would drop a reference that was never taken.
> +		 * Report the mode only once a driver is bound, and retry on
> +		 * the next status update so that a driver loaded after the
> +		 * cable was attached still learns about the active mode.
> +		 */
> +		if (typec->partner_altmode &&
> +		    device_is_bound(&typec->partner_altmode->dev))
> +			typec_altmode_update_active(typec->partner_altmode, true);
> +	}

[Severity: Medium]
Does calling device_is_bound(&typec->partner_altmode->dev) and
typec_altmode_update_active() without holding
device_lock(&typec->partner_altmode->dev) race with driver unbind?

device_is_bound() requires the caller to hold device_lock(dev).  During dri=
ver
unbind, __device_release_driver() runs typec_remove() ->
typec_altmode_update_active(adev, false) and device_unbind_cleanup() (which
sets adev->dev.driver =3D NULL) before detaching knode_driver:

CPU0                                  CPU1
cix_pd_typec_port_update()            device_release_driver_internal()
                                        __device_release_driver(dev)
                                          typec_remove(dev)
                                            typec_altmode_update_active(...=
, false)
  device_is_bound(dev) =3D=3D true
  typec_altmode_update_active(..., true)
    if (adev->dev.driver)
                                          device_unbind_cleanup(dev)
                                            dev->driver =3D NULL
      try_module_get(adev->dev.driver->owner)
        <-- NULL pointer dereference

Depending on the exact timing against __device_release_driver(), this can a=
lso
leak a module reference, set adev->active =3D true without taking a module
reference, or double-put the module reference when
typec_altmode_update_active(typec->partner_altmode, false) runs on disconne=
ct
or in cix_pd_unregister_ports().

In addition, when the DisplayPort alternate mode driver is built as a module
and loaded asynchronously by udev after typec_partner_register_altmode(),
device_is_bound() is false during the initial status update; if the hardware
raises no further interrupt after the module binds, partner_altmode remains
inactive in sysfs.

[ ... ]

> +static int cix_pd_event_handler(struct cix_pd *rts, u8 clear_irq, bool f=
orce)
> +{
> +	int ret, err =3D 0;
> +	bool changed;
> +	u8 data_control[3] =3D {0};
> +
> +	mutex_lock(&rts->lock);
> +	if (clear_irq) {
> +		data_control[0] =3D 2;
> +		data_control[1] =3D I2C_INT_ACK_BIT;
> +		data_control[2] =3D 0;
> +
> +		ret =3D cix_pd_block_write(rts, RTS_DATA_CONTROL, data_control, 3);
> +		if (ret)
> +			goto i2c_err;
> +	}
> +
> +	ret =3D cix_pd_block_read(rts, RTS_DATA_STATUS, rts->data_status, 6);
> +	if (ret)
> +		goto i2c_err;
> +
> +	dev_dbg(rts->dev,
> +		"typec port(%d): data status =3D 0x%x, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x\n",
> +		rts->id, rts->data_status[0], rts->data_status[1],
> +		rts->data_status[2], rts->data_status[3], rts->data_status[4],
> +		rts->data_status[5]);
> +
> +	/*
> +	 * Only bytes 1..3 are decoded by this driver. Byte 0 and bytes 4..5
> +	 * have no known meaning, so they are excluded from the comparison: a
> +	 * change in an undecoded bit must not be reported as a port event.
> +	 */
> +	changed =3D !rts->status_valid ||
> +		  memcmp(&rts->data_status[1], &rts->prev_status[1],
> +			 DATA_STATUS_COUNT - 3);
> +	memcpy(rts->prev_status, rts->data_status, DATA_STATUS_COUNT);
> +	rts->status_valid =3D true;
> +
> +	err =3D cix_pd_typec_port_update(rts, force);

[Severity: Medium]
Should cix_pd_event_handler() skip cix_pd_typec_port_update() when neither
changed nor force is true?

Because all controller instances share one interrupt line, an interrupt on =
one
port runs cix_pd_event_handler() on every sibling instance.  Calling
cix_pd_typec_port_update() unconditionally when !changed && !force causes
every unchanged sibling port to call typec_set_orientation() and
typec_mux_set(), which reprogram the orientation switch and mode mux and em=
it
spurious KOBJ_CHANGE uevents and sysfs notifications on every unaffected po=
rt.

> +	if (err)
> +		dev_err(rts->dev, "typec port(%d): failed to update port: %d\n",
> +			rts->id, err);
> +
> +	if (rts->data_status[2] & HPD_IRQ) {
> +		data_control[0] =3D 2;
> +		data_control[1] =3D 0;
> +		data_control[2] =3D HPD_IRQ_ACK;
> +		ret =3D cix_pd_block_write(rts, RTS_DATA_CONTROL, data_control, 3);
> +		if (ret)
> +			goto i2c_err;
> +	}

[Severity: High]
Does copying rts->data_status into rts->prev_status with HPD_IRQ still set
break shared-interrupt attribution on subsequent interrupts?

When a DisplayPort sink generates an HPD_IRQ pulse, rts->prev_status[2] sav=
es
HPD_IRQ =3D 1 (and cix_pd_typec_port_update() saves DP_STATUS_IRQ_HPD in
typec->hpd_status), and then writing HPD_IRQ_ACK clears HPD_IRQ in the
controller hardware.  If the sink generates a second HPD_IRQ while the rest=
 of
data_status[1..3] is unchanged, rts->data_status[2] again has HPD_IRQ =3D 1,
matching the stale HPD_IRQ =3D 1 in rts->prev_status[2]; memcmp() reports no
change and cix_pd_irq_handle() returns IRQ_NONE for a valid interrupt it ju=
st
acknowledged, which can cause the spurious interrupt detector to disable the
shared IRQ line.  Conversely, if a sibling port interrupts next while this
port has HPD_IRQ =3D 0, this port sees a difference against its stale
rts->prev_status[2], returns IRQ_HANDLED for the sibling's interrupt, and l=
ogs
a duplicate mode message because dp_data->status no longer matches
typec->hpd_status.

[ ... ]

> +static int __maybe_unused cix_pd_suspend(struct device *dev)
> +{

[ ... ]

> +	disable_irq(client->irq);
> +	rts->irq_disabled =3D true;
> +
> +	if (device_may_wakeup(dev)) {
> +		ret =3D enable_irq_wake(client->irq);
> +		if (ret) {
> +			dev_err(dev, "failed to enable IRQ wake: %d\n", ret);
> +			enable_irq(client->irq);
> +			rts->irq_disabled =3D false;
> +		} else {
> +			rts->wake_enabled =3D true;
> +		}
> +	}
> +	mutex_unlock(&rts->irq_lock);
> +
> +	return 0;
> +}

[Severity: Medium]
If enable_irq_wake() fails, doesn't re-enabling client->irq while returning=
 0
allow the interrupt handler to run before the I2C adapter resumes?

Returning 0 lets system suspend proceed with the IRQ enabled, so
resume_device_irqs() unmasks the line before the I2C adapter is resumed and
cix_pd_irq_handle() can attempt I2C transfers on a suspended bus.  Also, wh=
en
multiple controller instances share client->irq, calling disable_irq() in e=
ach
instance increments the IRQ disable depth to the number of instances, where=
as
suspend_device_irq() on IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND chips decrements t=
he
depth only once, leaving the shared wakeup interrupt masked during sleep.

> +
> +static int __maybe_unused cix_pd_resume(struct device *dev)
> +{
> +	struct i2c_client *client =3D to_i2c_client(dev);
> +	struct cix_pd *rts =3D i2c_get_clientdata(client);
> +	int ret;
> +
> +	if (client->irq > 0) {
> +		mutex_lock(&rts->irq_lock);
> +		if (rts->wake_enabled) {
> +			disable_irq_wake(client->irq);
> +			rts->wake_enabled =3D false;
> +		}
> +		if (rts->irq_disabled) {
> +			enable_irq(client->irq);
> +			rts->irq_disabled =3D false;
> +		}
> +		mutex_unlock(&rts->irq_lock);
> +	}
> +
> +	/* Force the USB role to be reprogrammed after system resume. */
> +	ret =3D cix_pd_event_handler(rts, 0, true);

[Severity: Medium]
Does calling cix_pd_event_handler(rts, 0, true) after enable_irq() consume
sleep-time status changes without acknowledging the controller interrupt?

If a port status change occurred while the system was suspended, the
controller keeps the shared level-triggered interrupt line asserted until
I2C_INT_ACK_BIT is written.  When multiple instances share client->irq,
enable_irq() keeps the line masked until the last instance resumes, while e=
ach
earlier instance's cix_pd_event_handler(rts, 0, true) updates rts->prev_sta=
tus
without clearing the hardware interrupt (and on the last or sole instance,
enable_irq() races the IRQ thread against cix_pd_event_handler()).  When
cix_pd_irq_handle() then runs for the still-asserted line, rts->prev_status
already matches rts->data_status, so every instance returns IRQ_NONE.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113125304.1693=
911-2-gary.yang@cixtech.com?part=3D2
