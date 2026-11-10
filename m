Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794355145;
	b=zRrB+ZXsNpoe7iS/dEZoyiM97i48/gqOZKIMEijsTWmI98itFcqLQKnZPVq/5NzjpcbT
	 3qJyuhzbv1avC/HMxuzR24FBujt8JiunVEU62OVuWGuJGDSH9lUDSfswGG8gyX4ygJ3rs
	 q6hNiN4AlNP9wFP9EOvz7FyFczAxyfRRNbwGg6ogAH8UqzQwKKE+S8PYwLCxttdSc34bw
	 ib7h2MRCv98AX7Dz5lirwV3Mks8xEYnFn1jIAyex//pJfL/pTJOld+ypln7Gdj+Wh0x42
	 rR9ta2OpCTzXsp4HfdleYqW4IoQjKnL+daWTZ/Z15ohWwxhZlNCshopHeNb9165kg6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794355145;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=gTjQQ0hv6nEnHTZSzSTYgIUZrrKlVjfKW7eaOQ1C+N4=;
	b=p/mT6zfO6FI5BL9hhjq856CGAtnU+NXvqz//oqHoB4HGhk695GTnvbraxxZ7pIr8xOes
	 IgxMci50hnJaCPIws7aEW/dEdRbMi3NJsDueO25ANAMAEPVHSp2ASYiDQCh2cC+TK6p3v
	 /GcHlFbtXd2rIK+KVKGpUK263LXmAz2uqixFndvpmIfI+uftyx/torLry9O2eGaGV2lsE
	 ZAeMaFKC69lqdHyDGn/k7zJj7HADOHPd+7jfq0IW4dJXNh3PCTU7OvS0HTmTrWv/5UAzN
	 rLRym34nVh7NlMb0KIPbAqH+uKcVIgV2iSDsl+r0er13cUNPmAKFQAWtjTq74TBwkxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R2E9AEZm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C3E606A31C;
	Tue, 10 Nov 2026 23:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R2E9AEZm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66C671F0093C;
	Tue, 10 Nov 2026 23:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794355145;
	bh=gTjQQ0hv6nEnHTZSzSTYgIUZrrKlVjfKW7eaOQ1C+N4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R2E9AEZmd/UYIFVTACDAv4IwZhE8LtxeC9vvHLirSTrOHNzlvUKsI2o/PwyiVd9Bd
	 FNsfRNBpPiTtJ8SaH4vVPIgKIEiFY7B0gxaixTfErdtZI90Fc+MBZmeSTZs8sNxe7H
	 knL4BPFOOiEZpW+aOyFIKkQi9Ek32gvdAdW7Zv75wzgsqLeVPZY9LKcIhbSAa6Yh+7
	 Lc+r2wiR/GITJ8x+CirpOliWeFnaGoQpHMyXO3Mik/Vyrwj7bLzxnt6fGkNcZW3eGI
	 iV5tzoS3/eZsO0fNYAqoflLcriYEk0bBLdRLeOuwkcJ26s7QjJol9kEV55Ibx61HB3
	 6YPFHHw978HDg==
Message-ID: <sashiko-outbox-207987@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] usb: typec: add CIX Type-C PD controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gary Yang" <gary.yang@cixtech.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261110051723.434009-3-gary.yang@cixtech.com>
References: <20261110051723.434009-1-gary.yang@cixtech.com>
 <20261110051723.434009-3-gary.yang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 23:59:04 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Medium] usb: typec: cix_pd: missing IRQ disable across system suspend
  and resume
- [Medium] usb: typec: cix_pd: unserialized mux state changes via
  partner_altmode()
- [Medium] usb: typec: cix_pd: unconditional IRQ_HANDLED in
  cix_pd_irq_handle()
--

commit 02feb7b4ab5ba21a4874114738a3f180152e2832
Author: Gary Yang <gary.yang@cixtech.com>

usb: typec: add CIX Type-C PD controller driver

This commit adds an I2C driver for the CIX Type-C PD controller (Realtek
RTS5453H) to report port status, orientation, USB data role, and
DisplayPort alternate mode state to the Type-C framework.

> diff --git a/drivers/usb/typec/cix_pd.c b/drivers/usb/typec/cix_pd.c
> new file mode 100644
> index 0000000000000..5a7a3efd3ac12
> --- /dev/null
> +++ b/drivers/usb/typec/cix_pd.c

[ ... ]

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
> +			} else {
> +				typec_altmode_update_active(typec->partner_altmode,
> +							    true);
> +			}
> +		}

[Severity: Medium]
Can dp_altmode_driver reconfigure the shared Type-C mux behind cix_pd's
back when bound to typec->partner_altmode?

cix_pd_init_ports() registers typec->port_altmode with USB_TYPEC_DP_SID
without setting typec_altmode_ops, which gives port_altmode its own handle
to the platform Type-C mux.  When dp_altmode_driver binds to
typec->partner_altmode, writing to sysfs displayport/configuration or
unbinding dp_altmode_driver calls typec_altmode_notify() or
typec_altmode_set_state(), switching the physical mux to TYPEC_STATE_USB or
TYPEC_STATE_SAFE outside rts->lock while leaving typec->mode stale at
TYPEC_DP_STATE_D/E.

In addition, calling typec_altmode_update_active(typec->partner_altmode,
true) immediately after registration runs before a modular
typec_displayport driver finishes binding, so try_module_get() is skipped
while the disconnect path still calls module_put() on the bound driver.

[ ... ]

> +static int cix_pd_event_handler(struct cix_pd *rts, u8 clear_irq, bool f=
orce)
> +{
> +	int ret, err =3D 0;
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

[ ... ]

> +static irqreturn_t cix_pd_irq_handle(int irq, void *data)
> +{
> +	struct cix_pd *rts =3D data;
> +
> +	if (cix_pd_event_handler(rts, 1, false) =3D=3D -ESHUTDOWN)
> +		return IRQ_NONE;
> +
> +	return IRQ_HANDLED;
> +}

[Severity: Medium]
Does cix_pd_irq_handle() returning IRQ_HANDLED unconditionally prevent the
IRQ core from detecting a stuck shared level-triggered interrupt line?

cix_pd_event_handler() acknowledges I2C_INT_ACK_BIT and returns 0 without
checking whether this controller instance actually asserted the interrupt.
If a sibling controller sharing the line holds the level-triggered IRQ
asserted while not yet probed, while probe-deferred in cix_pd_init_ports()
(which runs before cix_pd_probe() acknowledges pre-existing interrupts), or
while unresponsive over I2C, any healthy bound instance on the same IRQ
line still returns IRQ_HANDLED on every pass, causing an unbounded IRQ
thread loop and I2C bus storm instead of letting note_interrupt() disable
the stuck line.

[ ... ]

> +static int __maybe_unused cix_pd_suspend(struct device *dev)
> +{
> +	struct i2c_client *client =3D to_i2c_client(dev);
> +	struct cix_pd *rts =3D i2c_get_clientdata(client);
> +	int ret;
> +
> +	if (client->irq > 0 && device_may_wakeup(dev)) {
> +		mutex_lock(&rts->irq_lock);
> +		if (!rts->wake_enabled) {
> +			ret =3D enable_irq_wake(client->irq);
> +			if (ret)
> +				dev_err(dev, "failed to enable IRQ wake: %d\n",
> +					ret);
> +			else
> +				rts->wake_enabled =3D true;
> +		}
> +		mutex_unlock(&rts->irq_lock);
> +	}
> +
> +	return 0;
> +}
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
> +	ret =3D cix_pd_event_handler(rts, 0, true);

[Severity: Medium]
Can cix_pd_irq_handle() run while the parent I2C adapter is still suspended
during system sleep transitions?

cix_pd_suspend() does not call disable_irq(client->irq), so the interrupt
remains enabled during dpm_suspend_late() after runtime PM is disabled on
the parent I2C controller, and resume_device_irqs() unmasks it at the end
of dpm_resume_noirq() before dpm_resume_early() and dpm_resume() resume the
I2C controller, USB role switch, and Type-C mux:

dpm_resume_noirq()
  resume_device_irqs()
    <threaded IRQ>
      cix_pd_irq_handle()
        cix_pd_event_handler()
          cix_pd_block_write()  <-- I2C adapter still suspended
dpm_resume_early()
  device_resume_early()         <-- I2C adapter runtime PM re-enabled here
dpm_resume()
  cix_pd_resume()

When the I2C transfer fails, cix_pd_event_handler() returns -ESHUTDOWN
without acknowledging the level-triggered interrupt in RTS_DATA_CONTROL,
leaving the line asserted so it repeatedly re-fires.  In addition,
cix_pd_resume() calls cix_pd_event_handler(rts, 0, true), which clears
HPD_IRQ via HPD_IRQ_ACK without writing I2C_INT_ACK_BIT.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110051723.4340=
09-1-gary.yang@cixtech.com?part=3D2
