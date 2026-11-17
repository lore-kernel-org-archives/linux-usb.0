Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794930950;
	b=0X6LQtcFGVrL0gpg7m7s1nRt2RkD5+nBWLb6GAKyXXgdEz361HZy4JjSr916GNlVFZ58
	 JJI212ePDGiW8EPioxR79eJoECxzDXQWdxT060js6HyYtill6rCVqydJlzYTyx/jWkWIP
	 Pjj24xeOIIvuAMvhiBy0aXs0vsn+q5+jlkReD5AHqDbhHLcjhVE5bm4rXSo+ACnmaGgGe
	 YPs8Oj3UgVEh2yKROmCYD2Nlb/HZeNg5d1RtqcEYvggB37M9MXsVBOgNBb7ITR7oS/dpM
	 D9yC/m2DNRGhpfKWxH6mUE77nL9uNdX153grHZ9gZP8LmpEbBTlKlxRe8/cDHOvNSNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794930950;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+6OsAGsJJvhMgbe8Io4tzF4ZW1F6ZPIYM7lz/r3Om0g=;
	b=1jL/VmtEEgS2Ee1CFYV3C5WsgzcTUS6HQfkeD9zA+m7rpesKvXjhd+QLX+cyiTTwf8uJ
	 xhtDDC9FOnyTHmYKNGlt8hFe53uooyYes30tL+0cjAH98J15zEnzWjavwfa1Tzfe+jFGz
	 VmBzaW5/xGyTqGdxBj4ZLZZI+qMbk6rnz+UgnfoAL5BiybJXtSVxQrz2sxxZ9JuqMlU5E
	 v0nltUFnTaCoMaoxWUjzOrN9Krn0CyyopDdKNIwCcWGm7sXpuKwgvUEOUpOxed99uMWYO
	 Sc5H9QjhaIuJJ/OmPGW2xsMx+4vpgxDmpF5JhQPWD3pB3FmHYCBDX86TX0L+EJ52vNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="F+S/WL44";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5249606A31C;
	Tue, 17 Nov 2026 15:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F+S/WL44
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00D9C1F000C5;
	Tue, 17 Nov 2026 15:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794930950;
	bh=+6OsAGsJJvhMgbe8Io4tzF4ZW1F6ZPIYM7lz/r3Om0g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F+S/WL44CP+J5NTBSzOm74yaLjx2CJVk6bnEDHAhvkFYC+c1SSZHOBwo8P9PQ/e0S
	 0KhCqXhL5H1SoQrbOZ97c5yaqj7DYCPlcLNZHZVAc3D5Bi/N+AAshYKfm1eyKw2nqL
	 Lsky0aAwkG+8xnQv6SaFw0w95ic/7ar3SDBz3yV750zo5RkwaZz0Vr4tcjutS6Q1UD
	 6nB/cX6mpq87d1Ao0/ncN8+/cHNvuWzQb6Xjrcur8g6zMWgv52lp9ejH7XWcthpJL1
	 ZYYN1QmbXmuCjrDFNCAZGCuhAZrmoKvjiIyYhA5oqQt0mHZt/f03pejKldUXrOmQw4
	 p3GBhC1+mUK9g==
Message-ID: <sashiko-outbox-219119@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/4] usb: dwc3: xilinx: Add Versal2 MMI USB 3.2
 controller support with flat probe model
Reply-To: sashiko-reviews@lists.linux.dev
To: "Radhey Shyam Pandey" <radhey.shyam.pandey@amd.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261117150219.1326693-4-radhey.shyam.pandey@amd.com>
References: <20261117150219.1326693-1-radhey.shyam.pandey@amd.com>
 <20261117150219.1326693-4-radhey.shyam.pandey@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 15:55:48 +0000
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
- [High] usb: dwc3: xilinx: unclocked access and clk underflow in
  dwc3_xlnx_suspend()
- [High] usb: dwc3: xilinx: wrong gsbuscfg0_reqinfo 0xf0f0 in
  dwc3_xlnx_probe_flat()
- [High] usb: dwc3: xilinx: double usb3-phy management in flat probe
  model
--

commit 18ab81bda6f0f5fc8594e87f3a2015f5b9af6de1
Author: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>

usb: dwc3: xilinx: Add Versal2 MMI USB 3.2 controller support with flat pro=
be model

This commit adds a flat probe model to dwc3-xilinx that embeds struct dwc3
in struct dwc3_xlnx and uses it to support the Versal Gen2 MMI USB 3.2 DRD
controller.

> diff --git a/drivers/usb/dwc3/dwc3-xilinx.c b/drivers/usb/dwc3/dwc3-xilin=
x.c
> index b58fe034a94d4..c68246921a4c9 100644
> --- a/drivers/usb/dwc3/dwc3-xilinx.c
> +++ b/drivers/usb/dwc3/dwc3-xilinx.c

[ ... ]

> @@ -113,6 +143,59 @@ static int dwc3_xlnx_init_versal(struct dwc3_xlnx *p=
riv_data)
>  	return 0;
>  }
> =20
> +static void dwc3_xlnx_versal2_teardown(void *data)
> +{
> +	struct dwc3_xlnx *priv_data =3D data;
> +
> +	phy_power_off(priv_data->usb3_phy);
> +	reset_control_assert(priv_data->usb_crst);
> +	phy_exit(priv_data->usb3_phy);
> +}
> +
> +static int dwc3_xlnx_init_versal2(struct dwc3_xlnx *priv_data)
> +{
> +	struct device *dev =3D priv_data->dev;
> +	int ret;
> +
> +	priv_data->usb3_phy =3D devm_phy_optional_get(dev, "usb3-phy");
> +	if (IS_ERR(priv_data->usb3_phy))
> +		return dev_err_probe(dev, PTR_ERR(priv_data->usb3_phy),
> +				     "failed to get USB3 PHY\n");
> +
> +	priv_data->usb_crst =3D devm_reset_control_get_exclusive(dev, NULL);
> +	if (IS_ERR(priv_data->usb_crst))
> +		return dev_err_probe(dev, PTR_ERR(priv_data->usb_crst),
> +				     "failed to get reset signal\n");
> +
> +	ret =3D reset_control_assert(priv_data->usb_crst);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "failed to assert reset\n");
> +
> +	ret =3D phy_init(priv_data->usb3_phy);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D reset_control_deassert(priv_data->usb_crst);
> +	if (ret < 0) {
> +		dev_err_probe(dev, ret, "failed to deassert reset\n");
> +		goto err_phy_exit;
> +	}
> +
> +	ret =3D phy_power_on(priv_data->usb3_phy);
> +	if (ret < 0)
> +		goto err_crst_assert;

[Severity: High]
Does acquiring, initializing, and powering on "usb3-phy" here conflict with
dwc3_core_probe() managing the same PHY in the flat model?

In the legacy wrapper model, "usb3-phy" is on the parent wrapper node while
the DWC3 core is a child device.  In the flat model, priv_data->dev and
priv_data->dwc.dev are the same device, so dwc3_core_probe() ->
dwc3_core_init() -> dwc3_core_get_phy() also calls devm_phy_get(dev,
"usb3-phy") into dwc->usb3_generic_phy[0] and calls dwc3_phy_init() and
dwc3_phy_power_on(), bumping phy->init_count and phy->power_count to 2.

During probe and dwc3_xlnx_resume(), the PHY is initialized and powered on
before dwc3_core_init() runs dwc3_phy_setup(), dwc3_core_soft_reset(), and
dwc3_config_soc_bus().  During dwc3_xlnx_runtime_suspend(),
dwc3_runtime_suspend() drops only the core's reference while
priv_data->usb3_phy is left active, so init_count and power_count stay at 1
(and in host mode the extra runtime PM usage count from the second
phy_power_on() remains held), preventing the PHY from powering off in
runtime suspend or across direct_complete system suspend.

[ ... ]

> +static int dwc3_xlnx_probe_flat(struct platform_device *pdev,
> +				struct dwc3_xlnx *priv_data)
> +{
> +	struct dwc3_probe_data probe_data =3D {};
> +	struct device *dev =3D &pdev->dev;
> +	struct resource *res;
> +	int ret;
> +
> +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res) {
> +		ret =3D -ENODEV;
> +		goto err_clk_put;
> +	}
> +
> +	priv_data->dwc.dev =3D dev;
> +	probe_data.dwc =3D &priv_data->dwc;
> +	probe_data.res =3D res;
> +	probe_data.ignore_clocks_and_resets =3D true;
> +	probe_data.properties =3D DWC3_DEFAULT_PROPERTIES;
> +
> +	if (of_dma_is_coherent(dev->of_node))
> +		probe_data.properties.gsbuscfg0_reqinfo =3D 0xf0f0;

[Severity: High]
Should probe_data.properties.gsbuscfg0_reqinfo be 0xffff instead of 0xf0f0
to match dwc3_set_swnode()?

dwc3_config_soc_bus() writes gsbuscfg0_reqinfo into DWC3_GSBUSCFG0[31:16],
covering DESWRREQINFO [31:28], DATWRREQINFO [27:24], DESRDREQINFO [23:20],
and DATRDREQINFO [19:16].  Using 0xf0f0 marks descriptor accesses as
cacheable but leaves data read and write accesses (DATWRREQINFO and
DATRDREQINFO) as 0 while dma-coherent tells the DMA layer to skip CPU cache
maintenance on data buffers, which can corrupt USB DMA data transfers.

[ ... ]

> @@ -414,13 +603,24 @@ static void dwc3_xlnx_remove(struct platform_device=
 *pdev)
>  	clk_bulk_disable_unprepare(priv_data->num_clocks, priv_data->clks);
>  	priv_data->num_clocks =3D 0;
> =20
> +	if (priv_data->plat->flat)
> +		return;
> +
>  	pm_runtime_put_noidle(dev);
>  	pm_runtime_set_suspended(dev);
>  }
> =20
>  static int __maybe_unused dwc3_xlnx_runtime_suspend(struct device *dev)
>  {
> -	struct dwc3_xlnx *priv_data =3D dev_get_drvdata(dev);
> +	struct dwc3_xlnx *priv_data =3D dwc3_xlnx_get_priv(dev);
> +	int ret;
> +
> +	/* Quiesce the core while its register interface is still clocked. */
> +	if (priv_data->plat->flat) {
> +		ret =3D dwc3_runtime_suspend(&priv_data->dwc);
> +		if (ret)
> +			return ret;
> +	}
> =20
>  	clk_bulk_disable(priv_data->num_clocks, priv_data->clks);
> =20

[ ... ]

> @@ -443,12 +659,19 @@ static int __maybe_unused dwc3_xlnx_runtime_idle(st=
ruct device *dev)
> =20
>  static int __maybe_unused dwc3_xlnx_suspend(struct device *dev)
>  {
> -	struct dwc3_xlnx *priv_data =3D dev_get_drvdata(dev);
> +	struct dwc3_xlnx *priv_data =3D dwc3_xlnx_get_priv(dev);
>  	int ret;
> =20
> +	/* Quiesce the core while its register interface is still clocked. */
> +	if (priv_data->plat->flat) {
> +		ret =3D dwc3_pm_suspend(&priv_data->dwc);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	ret =3D phy_power_off(priv_data->usb3_phy);
>  	if (ret < 0)
> -		return ret;
> +		goto err_core_resume;
> =20
>  	ret =3D phy_exit(priv_data->usb3_phy);
>  	if (ret < 0)
> @@ -462,13 +685,16 @@ static int __maybe_unused dwc3_xlnx_suspend(struct =
device *dev)
>  err_phy_power_on:
>  	if (phy_power_on(priv_data->usb3_phy))
>  		dev_err(dev, "failed to restore PHY power after suspend error\n");
> +err_core_resume:
> +	if (priv_data->plat->flat)
> +		dwc3_pm_resume(&priv_data->dwc);
> =20
>  	return ret;
>  }

[Severity: High]
What happens if the system suspends while the flat device is already
runtime-suspended?

Unlike dwc3_xlnx_probe_legacy(), which holds a runtime PM reference via
pm_runtime_resume_and_get(), dwc3_core_probe() drops its reference at the
end of probe so the flat device can enter dwc3_xlnx_runtime_suspend(),
which disables priv_data->clks.

When system suspend then runs while pm_runtime_suspended(dev) is true,
dwc3_xlnx_prepare() -> dwc3_pm_prepare() returns 0 in host or OTG mode (or
whenever a genpd power domain is attached, since genpd_prepare() returns 0)
and the PM core calls dwc3_xlnx_suspend() without runtime-resuming the
device:

1. dwc3_pm_suspend() -> dwc3_suspend_common() calls dwc3_core_exit() in
   host and OTG modes without checking pm_runtime_suspended(), accessing
   DWC3 registers while priv_data->clks are disabled.
2. dwc3_xlnx_suspend() unconditionally calls clk_bulk_disable() a second
   time on priv_data->clks (and on error, err_core_resume calls
   dwc3_pm_resume() with clocks disabled), whereas dwc3_xlnx_resume() only
   enables them once and marks the device runtime active.
3. Conversely, if direct_complete is ever used in device mode when
   dwc3_pm_prepare() returns 1, dwc3_xlnx_suspend() is skipped and
   priv_data->usb3_phy remains powered on across system sleep.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117150219.1326=
693-1-radhey.shyam.pandey@amd.com?part=3D3
