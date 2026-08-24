Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D5343C05E;
	Mon, 24 Aug 2026 14:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787582333; cv=none; b=WfsTGRAnTwumMikQKuHB0OfFDTIziOgYRjjECeq33aiZPcfWLcZb/R8PCv8TzERFf3qT+AubLx4KYEqGCshXvqBygF/P0XYc9D0oSYUL0tSWTAAcyXfVJ/gyUTASoul85rh05WP2XHqeX1uqaGgVSzCxJHp5KlecN1Kim/khKpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787582333; c=relaxed/simple;
	bh=KmmiQgLky96CeGYe3E9jq9qzR+TjTfkZmrKYgaI48hs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=snLkvOrZfLDBLwAEz4tnhnFPg5zvD4gcCNoQm+M5aUbZVXGS6WgqdBPjHt3Wzpyi3I9v5JzXLpuB99JJvm8oQ7CiM4LT2PaQ7aKjxkSE+9mlAgM12CM9EFaDJQfOWlwgqAStvw6BdkKzDndmzL32RRvMHaz8UtMRmuJjXP99++s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 90B14201B99;
	Mon, 24 Aug 2026 16:38:43 +0200 (CEST)
Message-ID: <9650b30e936b58c37ccc73934a66e2d8edb02331.camel@pengutronix.de>
Subject: Re: [PATCH 04/16] usb: typec: tcpm: Add STM32 UCPD driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Greg Kroah-Hartman	
 <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Christian Bruel	 <christian.bruel@foss.st.com>, Heikki Krogerus
 <heikki.krogerus@linux.intel.com>,  Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>,  Srinivas Kandagatla	 <srini@kernel.org>, Marek
 Vasut <marex@nabladev.com>, Vinod Koul	 <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Pankaj Dev	 <pankaj.dev@st.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org
Date: Mon, 24 Aug 2026 16:38:43 +0200
In-Reply-To: <20260821-ucpd-host-fusb340-v7-2-rfc-v1-4-c5e27cbc0795@foss.st.com>
References: 
	<20260821-ucpd-host-fusb340-v7-2-rfc-v1-0-c5e27cbc0795@foss.st.com>
	 <20260821-ucpd-host-fusb340-v7-2-rfc-v1-4-c5e27cbc0795@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fr, 2026-08-21 at 18:23 +0200, Fabrice Gasnier wrote:
> From: Christian Bruel <christian.bruel@foss.st.com>
>=20
> Add support for the STM32 UCPD controller providing USB Type=E2=80=91C
> Configuration Channel (CC) management and USB Power Delivery (PD)
> protocol handling.
>=20
> The driver integrates with the TCPM (Type-C Port Manager) framework.
> On this platform, VBUS monitoring is handled by an external TCPP03
>=20
> Note the driver doesn't allow PD, so the role can only be set at
> plug time.
>=20
> The UCPD can be a wakeup source, in such a case, keep the hardware
> enabled. Else, keep track of the vbus state as provider and as
> consumer, to be restored after low power.
>=20
> Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
>  drivers/usb/typec/tcpm/Kconfig      |  12 +
>  drivers/usb/typec/tcpm/Makefile     |   1 +
>  drivers/usb/typec/tcpm/stm32_ucpd.c | 818 ++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 831 insertions(+)
>=20
[...]
> diff --git a/drivers/usb/typec/tcpm/stm32_ucpd.c b/drivers/usb/typec/tcpm=
/stm32_ucpd.c
> new file mode 100644
> index 000000000000..b5c9dc417814
> --- /dev/null
> +++ b/drivers/usb/typec/tcpm/stm32_ucpd.c
> @@ -0,0 +1,818 @@
[...]
> +static int stm32_ucpd_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct i2c_client *tcpp_client;
> +	struct device_node *tcpp_np;
> +	struct stm32_ucpd *ucpd;
> +	int ret;
> +
> +	ucpd =3D devm_kzalloc(dev, sizeof(*ucpd), GFP_KERNEL);
> +	if (!ucpd)
> +		return -ENOMEM;
> +
> +	ucpd->dev =3D dev;
> +	platform_set_drvdata(pdev, ucpd);
> +
> +	ucpd->vdd =3D devm_regulator_get(&pdev->dev, "ucpd");
> +	if (IS_ERR(ucpd->vdd))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(ucpd->vdd), "vdd get failed\n=
");
> +
> +	ucpd->vconn =3D devm_regulator_get_optional(&pdev->dev, "vconn");
> +	if (IS_ERR(ucpd->vconn)) {
> +		if (PTR_ERR(ucpd->vconn) !=3D -ENODEV)
> +			return dev_err_probe(&pdev->dev, PTR_ERR(ucpd->vconn),
> +					     "vconn get failed\n");
> +		ucpd->vconn =3D NULL;
> +	}
> +
> +	ucpd->base =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(ucpd->base))
> +		return PTR_ERR(ucpd->base);
> +
> +	ucpd->num_clks =3D devm_clk_bulk_get_all(dev, &ucpd->clks);
> +	if (ucpd->num_clks <=3D 0)
> +		return ucpd->num_clks ? : -ENOENT;
> +
> +	ucpd->reset =3D devm_reset_control_get_exclusive(dev, "ucpd");
> +	if (IS_ERR(ucpd->reset))
> +		return dev_err_probe(dev, PTR_ERR(ucpd->reset), "Failed to get UCPD re=
set\n");
> +
> +	ret =3D stm32_ucpd_get_trim_values(ucpd);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to get trim values\n");
> +
> +	ucpd->vconn_cc1_gpio =3D devm_gpiod_get_optional(dev, "vconn-cc1", GPIO=
D_OUT_LOW);
> +	if (IS_ERR(ucpd->vconn_cc1_gpio))
> +		return dev_err_probe(dev, PTR_ERR(ucpd->vconn_cc1_gpio), "vconn-cc1 ge=
t failed\n");
> +
> +	ucpd->vconn_cc2_gpio =3D devm_gpiod_get_optional(dev, "vconn-cc2", GPIO=
D_OUT_LOW);
> +	if (IS_ERR(ucpd->vconn_cc2_gpio))
> +		return dev_err_probe(dev, PTR_ERR(ucpd->vconn_cc2_gpio), "vconn-cc2 ge=
t failed\n");
> +
> +	ucpd->ucpd_irq =3D platform_get_irq_byname(pdev, "ucpd");
> +	if (ucpd->ucpd_irq < 0)
> +		return ucpd->ucpd_irq;
> +
> +	ucpd->tcpc_dev.fwnode =3D device_get_named_child_node(dev, "connector")=
;
> +	if (IS_ERR(ucpd->tcpc_dev.fwnode))
> +		return dev_err_probe(dev, PTR_ERR(ucpd->tcpc_dev.fwnode), "connector n=
ot found");
> +
> +	tcpp_np =3D of_parse_phandle(dev->of_node, "st,tcpp", 0);
> +	if (!tcpp_np)
> +		return -EINVAL;
> +
> +	tcpp_client =3D of_find_i2c_device_by_node(tcpp_np);
> +	of_node_put(tcpp_np);
> +
> +	/* tcpp driver must be probed so tcpp_init() can be called from tcpm_re=
gister_port() */
> +	if (!tcpp_client || !tcpp_client->dev.driver)
> +		return -EPROBE_DEFER;
> +
> +	ucpd->tcpp_dev =3D &tcpp_client->dev;
> +
> +	/* No irq until tcpm_port is ready */
> +	irq_set_status_flags(ucpd->ucpd_irq, IRQ_NOAUTOEN);
> +	ret =3D devm_request_threaded_irq(dev, ucpd->ucpd_irq, NULL, ucpd_irq_h=
andler, IRQF_ONESHOT,
> +					dev_name(dev), ucpd);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "failed to get irq\n");
> +		goto put_tcpp;
> +	}
> +
> +	init_tcpc_dev(&ucpd->tcpc_dev);
> +
> +	ret =3D regulator_enable(ucpd->vdd);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "failed to enable regulator\n");
> +		goto put_tcpp;
> +	}
> +
> +	ret =3D clk_bulk_prepare_enable(ucpd->num_clks, ucpd->clks);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "failed to enable clocks\n");
> +		goto disable_regulator;
> +	}
> +
> +	ret =3D reset_control_deassert(ucpd->reset);

No reset_control_assert() in the error path and in stm32_ucpd_remove()?

regards
Philipp
