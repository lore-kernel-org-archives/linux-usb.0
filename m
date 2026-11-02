Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793618948;
	b=JUbbMTfderZoJkDkwqBJULSe8tqSNwiHGOEW7PRZ4D2SV9pJQYYd9Yo6wrzSMQQWHl1o
	 tQi/ExIzeG6LtGZiBLmSztODDsm6XqjnydVZCFovslVBSLn1MWUOJafLwJQIZgzrlKn5G
	 7lfkfcPo9ac+lyX4Fi13Dxn/84EXsalrlQ7yxddBTB6yszifyX2F3eHwkfgN/GVUnQJHb
	 OFp7xe/Vf/P7lQw7iq76VoVHJzq4ZHGA1aXCl4CBder+E1iH9zDA67vLZEFh8HgrtDpMc
	 t9S2IVvoyDp6m1D/Y/NhO3QL3rq2/gu5z4Sz0Vb+o/B+lXYOuU54DlD+TcUjnxSXH0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793618948;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Xoi8v+Xc9cA8qx5SOrqe1zbfwS9P5Ez+SSAowsXLCtM=;
	b=ZLxy5xahD3d7hI92l9YO0vJllUvgKjRrp3TL6koHtAhQMiKNmDIJpJ9UeAWvhGZqVmOv
	 uo+e476rouoB7OyKgHdO3hZk11zOHxmfpo5C1yaVKJqABnbXRPPRLyQyEy9Ch2Z6tTq0H
	 x1XU8sDjgEy/snJ0zTvl9TJvknMoZhogyeU7lKS7Cl6e0y+2HyQMgOrHzqoCJ9CsbD1/g
	 Mg5qlUJhMfqrQYugRICojY5OxgCYb4XbzIrSfvqS5H1jo497+e7iGvJSDs84effCSrIwY
	 ejey9sU+hyuTKYM6LTruKwRlvzLts24v1s8xddboBmJT+NCN7UiTvPpb/DnkK23biDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dPFlWTiE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E191606A331;
	Mon,  2 Nov 2026 11:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dPFlWTiE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA81B1F00A16;
	Mon,  2 Nov 2026 11:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793618948;
	bh=Xoi8v+Xc9cA8qx5SOrqe1zbfwS9P5Ez+SSAowsXLCtM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dPFlWTiEIXk5ooleOAYw+E7Vxp1uN7EQt4RpgGgkE9ndIvbQfpskpRHyWwlQBatZP
	 63jKaP+32uZc9hKZXIaJfFaQaQpSSg+C5A5q2BclSIWGnIv/3OssX0y2T6RENAm/Br
	 i0VzNIF2d4vXTCK1JVGBc/ewYaBqMuf28LtNScxR74ns2/Wr2z8lbJ/R2di4neLkH7
	 s8oD93TzLOdOASiKTORyrRhoq3MMIgi41zH7HdFlct+dMgTX5DJ0M2qhijVsucTQ05
	 5t8YlrX38jnO3G5dQ7MSxSobXBAw9/33X8txmAE3yVG9t8dc7HjIS0AkpnP2axw2aj
	 UJmjbDA5tng/Q==
Message-ID: <sashiko-outbox-193332@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] usb: typec: Add onsemi FUSB15201 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261102111732.1678646-3-shengchao.guo@oss.qualcomm.com>
References: <20261102111732.1678646-1-shengchao.guo@oss.qualcomm.com>
 <20261102111732.1678646-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 11:29:07 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] usb: typec: fusb15201: data race in probe allows spurious -ENOTC=
ONN
--

commit 71bdb63ff1903983ccbc2372b88898668f8d86c0
Author: Shawn Guo <shengchao.guo@oss.qualcomm.com>

usb: typec: Add onsemi FUSB15201 driver

This commit adds a Type-C class driver for the onsemi FUSB15201 dual-port
USB Type-C and Power Delivery controller. It registers each connector
described in firmware, updates partner and role states via regmap and
threaded interrupts, and forwards role swap requests to the controller.

> diff --git a/drivers/usb/typec/fusb15201.c b/drivers/usb/typec/fusb15201.c
> new file mode 100644
> index 0000000000000..ab3b07368bdf1
> --- /dev/null
> +++ b/drivers/usb/typec/fusb15201.c

[ ... ]

> +static void fusb15201_hw_update(struct fusb15201_port *port)
> +{
> +	struct fusb15201 *chip =3D port->chip;
> +	enum typec_data_role data_role =3D TYPEC_DEVICE;
> +	enum typec_role pwr_role;
> +	unsigned int status;
> +	int ret;
> +
> +	ret =3D regmap_read(chip->regmap, FUSB15201_REG_STATUS(port->index), &s=
tatus);
> +	if (ret) {
> +		dev_warn(chip->dev, "port%u: failed to read status: %d\n",
> +			 port->index, ret);
> +		return;
> +	}

[ ... ]

> +	if (!(port->status & FUSB15201_STATUS_ATTACHED)) {
> +		struct typec_partner_desc desc =3D {
> +			.usb_pd =3D !!(status & FUSB15201_STATUS_USBPD),
> +		};
> +
> +		port->partner =3D typec_register_partner(port->port, &desc);
> +		if (IS_ERR(port->partner)) {
> +			dev_err(chip->dev,
> +				"port%u: failed to register partner: %pe\n",
> +				port->index, port->partner);
> +			port->partner =3D NULL;
> +		}
> +	}
> +
> +	typec_set_orientation(port->port, status & FUSB15201_STATUS_CC2 ?
> +			      TYPEC_ORIENTATION_REVERSE :
> +			      TYPEC_ORIENTATION_NORMAL);
> +
> +	/*
> +	 * The controller only tells us whether the partner is PD capable. The
> +	 * Type-C current advertisement is not reported, so 1.5A and 3.0A
> +	 * operation cannot be distinguished from the default.
> +	 */
> +	typec_set_pwr_opmode(port->port, status & FUSB15201_STATUS_USBPD ?
> +			     TYPEC_PWR_MODE_PD : TYPEC_PWR_MODE_USB);
> +
> +	pwr_role =3D status & FUSB15201_STATUS_SINK ? TYPEC_SINK : TYPEC_SOURCE;
> +	data_role =3D status & FUSB15201_STATUS_DFP ? TYPEC_HOST : TYPEC_DEVICE;
> +	fusb15201_set_roles(port, pwr_role, data_role, true);
> +
> +	port->status =3D status;
> +}

[ ... ]

> +static int fusb15201_command(struct fusb15201_port *port, unsigned int c=
md)
> +{
> +	struct fusb15201 *chip =3D port->chip;
> +
> +	guard(mutex)(&chip->lock);
> +
> +	if (!(port->status & FUSB15201_STATUS_ATTACHED))
> +		return -ENOTCONN;
> +
> +	return regmap_write(chip->regmap, FUSB15201_REG_COMMANDS(port->index), =
cmd);
> +}

[ ... ]

> +static int fusb15201_hw_init(struct fusb15201 *chip)
> +{

[ ... ]

> +	/* Seed the Type-C class with the current state before arming the IRQ */
> +	for (i =3D 0; i < FUSB15201_NUM_PORTS; i++) {
> +		if (chip->ports[i].port)
> +			fusb15201_hw_update(&chip->ports[i]);
> +	}

[Severity: Medium]
As reported by Sashiko on v3 [1], could calling fusb15201_hw_update() in
fusb15201_hw_init() without holding chip->lock cause concurrent sysfs role
swap requests to fail spuriously with -ENOTCONN?

In fusb15201_probe(), fusb15201_register_port() calls typec_register_port(),
which exposes the port sysfs attributes (data_role and power_role) before
fusb15201_hw_init() runs.

When a port is already attached at probe time, fusb15201_hw_update() regist=
ers
the partner and updates the port orientation, power operation mode, and rol=
es
(emitting uevents) before finally setting port->status =3D status at the en=
d of
the function:

fusb15201_probe()
  fusb15201_register_port()
    typec_register_port() -> exposes data_role and power_role in sysfs
  fusb15201_hw_init()
    fusb15201_hw_update() -> called without chip->lock
      typec_register_partner() -> emits partner KOBJ_ADD
      fusb15201_set_roles()    -> emits port KOBJ_CHANGE
      port->status =3D status;

If userspace reacts to the port or partner uevents by writing to data_role =
or
power_role before fusb15201_hw_update() finishes, fusb15201_dr_set() or
fusb15201_pr_set() will call fusb15201_command(). Because fusb15201_hw_init=
()
does not hold chip->lock, fusb15201_command() can acquire chip->lock while
port->status is still 0 and return -ENOTCONN even though the partner and ro=
les
have already been published.

Should fusb15201_hw_init() hold chip->lock around the fusb15201_hw_update()
calls (or update port->status under chip->lock before publishing the state =
to
the Type-C class)?

[1] https://lore.kernel.org/r/20260916135918.1017527-3-shengchao.guo@oss.qu=
alcomm.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102111732.1678=
646-1-shengchao.guo@oss.qualcomm.com?part=3D2
