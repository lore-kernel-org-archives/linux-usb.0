Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793716829;
	b=UgcuBcE0jLT5J7RwWd61QcVQXXIIgO9sctpJGJ0WSJ2MERanjJUHSQrhrW76Nadq7gmw
	 NoNBPwZL8kVUfQzJqEP+QWMXo+44PRs09KSK6oyD8QLK2VDJz1BGUFmDX5Ib5JkmAGair
	 RaCUhgXSZvUayQOlSuUxmbsjdlayj4SNSrXx0P9aeEkhKlJAne1goRDbrhtQv13lycn2J
	 XL42N/GlRY5+Yg6aM6zggoqxkUWYPgeL+TwKUYUhvTZj7AU588qlKDRMT0ko1+CFufXY0
	 S/q07niYewt2hnP0EQN7M4LJ6Ot5sTawGm5gJTsE+HhppuKuy0PfzToqvFNxN0WuOSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793716829;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9Nuljk0G3/r4qCNT4K483gcpep/HfW6M6Ic6u7zHL5k=;
	b=WqKhOBiGmxH79gpkUwAG+aAEUh4IFTe1dPGcxP4uI7xetn0LgctBq4xcCJcYz2oy8AyY
	 iiZDATXtiEp4f6IEXns99OWfG/mb2TPC3OCCum1e+6+r/OYlWxbXTXz/RaiZhPa0TbRk1
	 zU/1a0fTMl1zx+yyzpH4Gzlgz+W7K/JR1bvvulEhIihlSpx4tiVLZ2SAys91UOEvj2zsL
	 hOOLXntMdC2TbJ6QIhrlr1xqq5u4dmmJzRAlZwlg2D+W3LDA7YC0OTm9/NnGAPiFjUdeu
	 YsaNvH/+NZppyaWGJaPjcwISfzg3PDTs2b3CvcpBUjfADJ7jVQOcEESgXSdRilNM8/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hMdb6Ntf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC580606D831;
	Tue,  3 Nov 2026 14:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hMdb6Ntf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E98D1F00919;
	Tue,  3 Nov 2026 14:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793716828;
	bh=9Nuljk0G3/r4qCNT4K483gcpep/HfW6M6Ic6u7zHL5k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hMdb6Ntf8ThuN1mI8eQVf/5T2npb77fPireRE8wv0PVx1k3w9z1Csv0XoY/RmU3pi
	 aQkdKTZSHSnM4U4qIUcAB8JQZsR7IKVfi2yVj4ot/pw0uj0t6FSNw9px6MOGro3RqG
	 supUTFir29T85eIUDrp1KkyGIyN9lX9oUy7+7htPV0xghjcj97OxxoCgdi8NybDYrP
	 h0vKs9OcUvA3foUIYvvkUtJDevDNuMD2RShsbrEB9xbQNTCo5S9gZDfk3d31rE0agV
	 441uhqM6B+bDxInBS42OVwrcIcXXivjhI7uBtNiBjwZiJdLI+miGZfkbBB6E5odn2N
	 Xf9vaN4lbah0w==
Message-ID: <sashiko-outbox-195465@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 3/3] usb: typec: tipd: Add sn201202x support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261103-tipd-ace3-v8-3-770f42421753@chaosmail.tech>
References: <20261103-tipd-ace3-v8-0-770f42421753@chaosmail.tech>
 <20261103-tipd-ace3-v8-3-770f42421753@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 14:40:27 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [Medium] usb: typec: tipd: missing no_mode_control in tipd_sn201202x_data
- [Medium] usb: typec: tipd: sn201202x_probe() ignores 0 from of_irq_get_by=
name()
- [Medium] usb: typec: tipd: race with tps->irq in sn201202x_suspend() and =
resume
- [Medium] usb: typec: tipd: missing sleep_completion wait after spmi_comma=
nd_sleep()
- [Low] usb: typec: tipd: missing select REGMAP for TYPEC_SN201202X in Kcon=
fig
--

commit 716779207041b8e609172ef9763d47b121f79a6d
Author: Sasha Finkelstein <k@chaosmail.tech>

usb: typec: tipd: Add sn201202x support

This commit adds support for the TI SN201202x (ACE3) USB Power Delivery
controller, which exposes a TPS6598x-compatible logical register map over
the SPMI bus on Apple M3 and later systems.

> diff --git a/drivers/usb/typec/tipd/Kconfig b/drivers/usb/typec/tipd/Kcon=
fig
> index c87cbe6109ca6..8177f860f89de 100644
> --- a/drivers/usb/typec/tipd/Kconfig
> +++ b/drivers/usb/typec/tipd/Kconfig
> @@ -14,3 +14,15 @@ config TYPEC_TPS6598X
> =20
>  	  If you choose to build this driver as a dynamically linked module, the
>  	  module will be called tps6598x.ko.
> +
> +config TYPEC_SN201202X
> +	tristate "TI SN201202x USB Power Delivery controller support"
> +	depends on SPMI
> +	select TYPEC_TPS6598X_CORE

[Severity: Low]
Can this fail to build when TYPEC_SN201202X is enabled without
TYPEC_TPS6598X or another option that enables REGMAP?

In drivers/usb/typec/tipd/Kconfig, TYPEC_TPS6598X selects REGMAP_I2C,
whereas TYPEC_TPS6598X_CORE only selects USB_ROLE_SWITCH and POWER_SUPPLY:

drivers/usb/typec/tipd/Kconfig:
config TYPEC_TPS6598X_CORE
	tristate
	select USB_ROLE_SWITCH
	select POWER_SUPPLY

Because neither SPMI, TYPEC_TPS6598X_CORE, nor TYPEC_SN201202X selects
REGMAP, tps6598x_regmap_config in drivers/usb/typec/tipd/core.c and
regmap_sn201202x and __devm_regmap_init_sn201202x() in
drivers/usb/typec/tipd/spmi.c reference struct regmap_config,
struct regmap_bus, REGMAP_ENDIAN_NATIVE, and __devm_regmap_init(), which
are only declared under CONFIG_REGMAP.

Should TYPEC_SN201202X or TYPEC_TPS6598X_CORE select REGMAP?

[ ... ]

> diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
> index 6c953e4a66d5f..a21f013449249 100644
> --- a/drivers/usb/typec/tipd/core.c
> +++ b/drivers/usb/typec/tipd/core.c
> @@ -1963,11 +1963,32 @@ static const struct tipd_data tipd_tps25750_data =
=3D {
>  	.connect =3D tps6598x_connect,
>  };
> =20
> +static const struct tipd_data tipd_sn201202x_data =3D {
> +	.irq_handler =3D cd321x_interrupt,
> +	.irq_mask1 =3D APPLE_CD_REG_INT_POWER_STATUS_UPDATE |
> +		     APPLE_CD_REG_INT_DATA_STATUS_UPDATE |
> +		     APPLE_CD_REG_INT_PLUG_EVENT,
> +	.tps_struct_size =3D sizeof(struct sn201202x),
> +	.remove =3D cd321x_remove,
> +	.register_port =3D cd321x_register_port,

[Severity: Medium]
Should tipd_sn201202x_data also set .no_mode_control =3D true?

tipd_sn201202x_data shares cd321x_register_port(), cd321x_connect(), and
cd321x_interrupt() with tipd_cd321x_data, where the controller firmware
manages alternate mode entry autonomously:

drivers/usb/typec/tipd/core.c:
static const struct tipd_data tipd_cd321x_data =3D {
	...
	.tps_struct_size =3D sizeof(struct cd321x),
	.no_mode_control =3D true,
	.remove =3D cd321x_remove,
	.register_port =3D cd321x_register_port,

Without .no_mode_control =3D true in tipd_sn201202x_data,
sn201202x_probe() -> tipd_init() -> cd321x_register_port() ->
tps6598x_register_port() leaves typec_cap.no_mode_control false and
exposes host alternate mode control attributes on the registered port.

[ ... ]

> diff --git a/drivers/usb/typec/tipd/spmi.c b/drivers/usb/typec/tipd/spmi.c
> new file mode 100644
> index 0000000000000..a165ec39a8ed8
> --- /dev/null
> +++ b/drivers/usb/typec/tipd/spmi.c

[ ... ]

> +static int sn201202x_probe(struct spmi_device *device)
> +{
> +	const struct of_device_id *match;
> +	const struct tipd_data *data;
> +	struct sn201202x *sn;
> +	struct tps6598x *tps;
> +	int irq_select, irq_sleep, irq_wake;
> +	int ret;
> +
> +	match =3D of_match_device(sn201202x_of_match, &device->dev);
> +	if (!match)
> +		return -EINVAL;
> +	data =3D tipd_hw_variants[(enum tipd_hw_variant)(uintptr_t)match->data];
> +
> +	sn =3D devm_kzalloc(&device->dev, data->tps_struct_size, GFP_KERNEL);
> +	if (!sn)
> +		return -ENOMEM;
> +	sn->sdev =3D device;
> +	tps =3D &sn->cd.tps;
> +
> +	mutex_init(&tps->lock);
> +	tps->dev =3D &device->dev;
> +	tps->data =3D data;
> +
> +	tps->irq =3D of_irq_get_byname(device->dev.of_node, "irq");
> +	if (tps->irq < 0)
> +		return tps->irq;
> +	irq_select =3D of_irq_get_byname(device->dev.of_node, "select");
> +	if (irq_select < 0)
> +		return irq_select;
> +	irq_sleep =3D of_irq_get_byname(device->dev.of_node, "sleep");
> +	if (irq_sleep < 0)
> +		return irq_sleep;
> +	irq_wake =3D of_irq_get_byname(device->dev.of_node, "wake");
> +	if (irq_wake < 0)
> +		return irq_wake;

[Severity: Medium]
As reported by Sashiko on v7 [1], what happens in sn201202x_probe() if
of_irq_get_byname() returns 0 on an IRQ mapping failure?

of_irq_get_byname() returns a negative errno on lookup error or probe
deferral, but returns 0 if IRQ mapping fails. Because sn201202x_probe()
only checks for values < 0, a 0 return for select, sleep, or wake will
pass IRQ 0 to devm_request_irq(), while a 0 return for irq leaves
tps->irq =3D=3D 0 and causes tipd_init() to fall back to polling mode inste=
ad
of failing the probe.

[ ... ]

> +	ret =3D tipd_init(tps);
> +	if (ret)
> +		spmi_command_sleep(device);
> +	return ret;
> +}
> +
> +static void sn201202x_remove(struct spmi_device *device)
> +{
> +	struct tps6598x *tps =3D spmi_device_get_drvdata(device);
> +	struct sn201202x *sn =3D tps_to_sn(tps);
> +
> +	tipd_remove(tps);
> +	spmi_command_sleep(sn->sdev);
> +}

[Severity: Medium]
As reported by Sashiko on v7 [2], does calling spmi_command_sleep() in
sn201202x_probe() and sn201202x_remove() without waiting on
sn->sleep_completion race with IRQ teardown or subsequent re-probe?

In sn201202x_suspend(), spmi_command_sleep() is paired with
reinit_completion(&sn->sleep_completion) and
wait_for_completion_timeout(&sn->sleep_completion, ...). In the
tipd_init() error path of sn201202x_probe() (for example on -EPROBE_DEFER
when acquiring the USB role switch or Type-C mux) and in
sn201202x_remove(), spmi_command_sleep() is issued right before devres
frees irq_sleep without waiting for the sleep transition to complete.

> +
> +static int __maybe_unused sn201202x_resume(struct device *dev)
> +{
> +	struct tps6598x *tps =3D dev_get_drvdata(dev);
> +	struct sn201202x *sn =3D tps_to_sn(tps);
> +	int err;
> +
> +	reinit_completion(&sn->wake_completion);
> +	err =3D spmi_command_wakeup(sn->sdev);
> +	if (err)
> +		return err;
> +	if (!wait_for_completion_timeout(&sn->wake_completion, msecs_to_jiffies=
(100)))
> +		return -ETIMEDOUT;
> +	return tipd_resume(tps);
> +}
> +
> +static int __maybe_unused sn201202x_suspend(struct device *dev)
> +{
> +	struct tps6598x *tps =3D dev_get_drvdata(dev);
> +	struct sn201202x *sn =3D tps_to_sn(tps);
> +	int err;
> +
> +	err =3D tipd_suspend(tps);
> +	if (err)
> +		return err;
> +	reinit_completion(&sn->sleep_completion);
> +	err =3D spmi_command_sleep(sn->sdev);

[Severity: Medium]
Can cd321x_interrupt() or cd321x_update_work() run while the SPMI device
is asleep during sn201202x_suspend() and sn201202x_resume()?

In drivers/usb/typec/tipd/core.c, tipd_suspend() only disables tps->irq
when tps->wakeup is set, and does not cancel cd321x->update_work:

drivers/usb/typec/tipd/core.c:tipd_suspend() {
	if (tps->wakeup) {
		disable_irq(tps->irq);
		enable_irq_wake(tps->irq);
	} else if (tps->reset) {
		gpiod_set_value_cansleep(tps->reset, 1);
	}
	...
}

When !tps->wakeup, tps->irq remains enabled when sn201202x_suspend()
sends spmi_command_sleep(sn->sdev), and on resume dpm_resume_noirq()
re-enables device IRQs before sn201202x_resume() issues
spmi_command_wakeup(sn->sdev). If tps->irq fires or cd321x->update_work
runs during that window, cd321x_interrupt() will attempt SPMI register
accesses via regmap_sn201202x_select_reg() while the controller is in the
SPMI sleep state.

[1] https://lore.kernel.org/r/20260910-tipd-ace3-v7-3-6c6ebe2193f2@chaosmai=
l.tech
[2] https://lore.kernel.org/r/20260910-tipd-ace3-v7-3-6c6ebe2193f2@chaosmai=
l.tech

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103-tipd-ace3-=
v8-0-770f42421753@chaosmail.tech?part=3D3
