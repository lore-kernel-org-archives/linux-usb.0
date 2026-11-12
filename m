Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794452101;
	b=GirkOBsgcXdWXwpz1y0jWz+WZBAhFs2BVxo3gX1AxCwYZPUv7twDOkvFJAx4syZtDheJ
	 XhQfEFGku4Ptx7PzmY9fw/wNyBIy8re78+dgXnZAFAFCvT+eiHTC9ZefKLFYGRr+Xy82p
	 0tJavlDMJad5PDiqMj7p94rCJnDpAmMjAlaeRZPk5V/Ee71R1G+4u8ol26dwyEInh4U1X
	 bfFi9vzJIdPA+VQJFjxyNtY2UYP1ZHJrZleVriQSDr5G4nOy2OlPnGvVb5j+V455baBhO
	 qXIO+3w/nM0wVgGz3y68Aw48Y3v22IQbADkYMxEbKqjMyvChvJ1UpDcaTgpsSlxUf5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794452101;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=iZI/A4HYQLesTu969GyCEqPOTdDuKUrOn51OVWs8WkU=;
	b=mxQ9zTydSWKvBXZ+GMMfMsjnhs/eLEejIomARhfKXOuOwUpnUW0WmyGviQxTOAxH2yoy
	 TXOLGGmb8PcAvdjIU5N2+826S7DecxoFT/FRLIMrlEuvtjMQl+L7Q4SlCY6XeemEoSQPx
	 zAjyRN/h0ISNLUw+Hy5EPgjffj0Q3gTdie1nft8XB5EWvG/1Oyd09xsaHjUFMx18AEAx2
	 VzmmsmJehpCe0geXTf4ZCxsN3wcK7sSHTodJYvRx/3Mt9tIjCOjDKLDIRNyc0JWD9Bbez
	 d9VPCrRxQoS3wrk+h5DtyiBPF0/i9yKflgbA8kY96lCQkaBbV9obyWcVZwAovt2yekg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eK3w+IRG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E118606A31C;
	Thu, 12 Nov 2026 02:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eK3w+IRG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 104AA1F00A05;
	Thu, 12 Nov 2026 02:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794452101;
	bh=iZI/A4HYQLesTu969GyCEqPOTdDuKUrOn51OVWs8WkU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eK3w+IRGAYVuPxZh4gTd4Yizn/q8B4gfT3DP8Od/Z4EMUmWyhBC9C3bUVw4Mkl70q
	 XOb9ItKec1k2dcQvrlhh77qWZ8A/xyQJb+HdyYy6gUQV0LGVqTQIMT9TO+kbnrBa9N
	 K4eysCiGWGR7W1aNQhHy2AVXYtqJDsdZjRGH6m/FEBCN8Ld1sHdgj+XM52EpBozEdp
	 aAxQ314HubhxdWumhMXvKdHXMb8qIp+xdi1LQ6kFYDhl5Wrx2ZF3jInG6+uplJuiYv
	 Vq6pYLbalXUCYmTf3vwlsklWOVJLespSVYRPiz9J3LAt/AF4zW3Zu/2YFRlfwJUPoF
	 PqlikZ86yp+2g==
Message-ID: <sashiko-outbox-210229@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/2] usb: cdns3: Add CIX Sky1 glue driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hongliang Yang" <hongliang.yang@cixtech.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261112022141.4136099-3-hongliang.yang@cixtech.com>
References: <20261112022141.4136099-1-hongliang.yang@cixtech.com>
 <20261112022141.4136099-3-hongliang.yang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 02:55:00 +0000
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
- [Medium] usb: cdns3: cdns_sky1_pdata leak in cdnsp_sky1_probe()
- [Medium] usb: cdns3: unconditional clock gating in
  cdnsp_sky1_system_suspend()
- [Medium] usb: cdns3: cdnsp-sky1: clock refcount underflow after resume
  failure
- [Low] usb: cdns3: PS_PME_En not cleared in
  cdns_sky1_platform_suspend()
- [Low] usb: cdns3: missing MFD_SYSCON dependency for USB_CDNSP_SKY1
--

commit 7c5b7619382aea292ee4e64d01413bfd07b37097
Author: Hongliang Yang <hongliang.yang@cixtech.com>

usb: cdns3: Add CIX Sky1 glue driver

This commit adds a glue driver for the Cadence USBSSP DRD controller on
CIX Sky1 SoCs, managing clocks, resets, S5 syscon mode straps, and RCSU
registers.

> diff --git a/drivers/usb/cdns3/Kconfig b/drivers/usb/cdns3/Kconfig
> index 39ad23d1ada89..678cedd8de97b 100644
> --- a/drivers/usb/cdns3/Kconfig
> +++ b/drivers/usb/cdns3/Kconfig
> @@ -77,6 +77,19 @@ config USB_CDNSP_PCI
>  	  If you choose to build this driver as module it will
>  	  be dynamically linked and module will be called cdnsp-pci.ko
> =20
> +config USB_CDNSP_SKY1
> +	tristate "Cadence USB3 support on CIX Sky1 SoC platforms"
> +	depends on ARCH_CIX || COMPILE_TEST
> +	default USB_CDNS3

[Severity: Low]
Should USB_CDNSP_SKY1 select or depend on MFD_SYSCON?  Without
CONFIG_MFD_SYSCON, syscon_regmap_lookup_by_phandle_args() is a stub that
returns ERR_PTR(-ENOTSUPP), so cdnsp_sky1_probe() always fails.

[ ... ]

> diff --git a/drivers/usb/cdns3/cdnsp-sky1.c b/drivers/usb/cdns3/cdnsp-sky=
1.c
> new file mode 100644
> index 0000000000000..c5d0ff9141cc9
> --- /dev/null
> +++ b/drivers/usb/cdns3/cdnsp-sky1.c

[ ... ]

> +static int cdnsp_sky1_clk_enable_resume(struct device *dev)
> +{
> +	int i, ret;
> +	struct cdnsp_sky1 *data =3D dev_get_drvdata(dev);
> +	struct clk **cix_usb_clks =3D data->cix_usb_clks;
> +
> +	for (i =3D 0; i < CIX_USB_CLK_OFF_NUM; i++) {
> +		ret =3D clk_prepare_enable(cix_usb_clks[i]);
> +		if (ret) {
> +			dev_err(dev, "failed to enable clock %s: %d\n",
> +				cix_usb_clk_names[i], ret);
> +			goto err_usb_clks;
> +		}
> +	}
> +	return 0;
> +
> +err_usb_clks:
> +	while (--i >=3D 0)
> +		clk_disable_unprepare(cix_usb_clks[i]);
> +	return ret;
> +};

[Severity: Medium]
Can a failure here underflow the enable and prepare counts of the sof and
axi clocks?

If clk_prepare_enable() fails during system resume, those two clocks are
left disabled and unprepared, but a later cdnsp_sky1_remove(),
cdnsp_sky1_shutdown(), or cdnsp_sky1_system_suspend() still calls
clk_disable_unprepare() on them unconditionally.

[ ... ]

> +	if (suspend) {
> +		while (count--) {
> +			value =3D readl(hcd->regs + XECP_PM_PMCSR);
> +			value &=3D ~PS_MASK;
> +			value |=3D PS_D3;
> +			if (wakeup)
> +				value |=3D PS_PME_En;
> +			writel(value, hcd->regs + XECP_PM_PMCSR);

[Severity: Low]
Should this clear PS_PME_En when wakeup is false?  If PS_PME_En is already
set in XECP_PM_PMCSR (for example from initial state or after a prior
resume timeout), suspending with wakeup disabled leaves PME wakeup
signaling enabled in hardware.  Also, cdns3_controller_suspend() and
cdns3_controller_resume() ignore the return value of platform_suspend(),
so the -ETIMEDOUT returned by cdns_sky1_platform_suspend() is discarded.

[ ... ]

> +	cdns_sky1_pdata =3D kzalloc(sizeof(*cdns_sky1_pdata), GFP_KERNEL);
> +	if (!cdns_sky1_pdata) {
> +		ret =3D -ENOMEM;
> +		goto err_quiesce;
> +	}
> +	cdns_sky1_pdata->platform_suspend =3D cdns_sky1_platform_suspend;
> +	cdns_sky1_pdata->quirks =3D CDNS3_DEFAULT_PM_RUNTIME_ALLOW;
> +	cdns_sky1_auxdata[0].platform_data =3D cdns_sky1_pdata;
> +	ret =3D of_platform_populate(node, NULL, cdns_sky1_auxdata, dev);
> +	if (ret) {
> +		dev_err(dev, "failed to create children: %d\n", ret);
> +		kfree(cdns_sky1_pdata);
> +		goto err_quiesce;
> +	}

[Severity: Medium]
Can this leak cdns_sky1_pdata when no child device is created?

of_platform_populate() calls of_platform_bus_create() with matches set to
NULL:

drivers/of/platform.c:of_platform_bus_create() {
    ...
	dev =3D of_platform_device_create_pdata(bus, bus_id, platform_data, parent=
);
	if (!dev || !of_match_node(matches, bus))
		return 0;
    ...
}

Because of_platform_bus_create() returns 0 even when
of_platform_device_create_pdata() fails or when no child node matches
"cdns,usb3", of_platform_populate() returns 0 whenever node is non-NULL.
The if (ret) branch is unreachable and cdns_sky1_pdata is leaked if no
child takes ownership of it (or double freed in platform_device_release()
if more than one child matches "cdns,usb3").

[ ... ]

> +/*
> + * Because the wake-up interrupt and host interrupt are the same interru=
pt,
> + * closing the axi and sof clock will result in the inability to generate
> + * port status change interrupt.
> + *
> + * The resets are left alone here. Asserting them throws away the OTG
> + * registers programmed by cdns_drd_init(), and nothing programs them ag=
ain
> + * after the child device resumes, so the controller keeps its state acr=
oss
> + * system suspend and only the clocks are gated.
> + */
> +static int cdnsp_sky1_system_suspend(struct device *dev)
> +{
> +	cdnsp_sky1_clk_disable_suspend(dev);
> +
> +	return 0;
> +}

[Severity: Medium]
Should cdnsp_sky1_system_suspend() skip gating the sof and axi clocks when
wakeup is enabled or the controller has not entered D3?

As the comment notes, disabling sof and axi prevents port status change
wakeup interrupts, yet cdnsp_sky1_system_suspend() gates both clocks even
when device_may_wakeup() is true on the child device.  In addition,
cdns_sky1_platform_suspend() only puts the controller into D3 and waits for
AXI_CLOCK_VALID to clear when cdns->role =3D=3D USB_ROLE_HOST (and its
-ETIMEDOUT return is ignored by cdns3_controller_suspend()), so in device
or idle OTG role, or after a D3 entry timeout, this gates the AXI and SOF
clocks while AXI_CLOCK_VALID is still asserted.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112022141.4136=
099-1-hongliang.yang@cixtech.com?part=3D2
