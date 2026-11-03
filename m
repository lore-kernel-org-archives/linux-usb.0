Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793693721;
	b=dcgP4h3bUVbIqeRzIg0FoRN/pkE/qCC9sQwI/2AXLPk7XDbG0Jt4eDL7iCO+rkAVIG28
	 mLGKJsbRzoptK9dG5DWvpE/I0znGVgocnMVgklddK2vlEeRD6jvvToTXiOSkEjDNpyZAp
	 qQAgotcgXNUuUUkZQ9qLGx+6qfhDLyfHJ4jiqQ4S2YW+IDn8WERy7VQkoMnvMZjknDRG/
	 e6PJ3mzKCTegepen4Vokoomt2otiXKOt1Za71Gynwv6VCWVBQ9dF4N5CRUUuqdHBAVXKB
	 kcFV3QG2a/CuyDyC3nhxvqpcuVXU7kSFYpmzZfWLGyt400T/ouRiLfOGbLcjFEKntgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793693721;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=CcgPpD+aTeak1mqbZyGMOZp4xNDrUHsfBN4CRBbTcy4=;
	b=UhotnRsb9NBNi2WKBwpwS6NCqi34GdfstArrAV31a6Fn+w7zDEgxjtpR3RMexLTA9MMg
	 7zT6gUacklVMf9Jgor7mXGuQvGpbHRnAiWCDTD+XjNLA1ko2k2w6twpKYO5PanTY43ruI
	 xjV+QXuoLrrW4RBum3pgT9A2lEySWEfnm87YJNqFhW75opmUereDFhpnNkLpZ/hh7i1q0
	 2ucF0Gz8eMzP4hWONTdPxjp9z83n/UpqBL4E3PFZLiX1pf6o5OGSm0AiwUxM5tK+dxiNC
	 SPEUoWxEWSnb1CJYnizm4QMOltaO2VDf9sa0UanJsJFgv7do1RjqwE2UjKh6rpNzVpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VJfW4vrH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A60A606D803;
	Tue,  3 Nov 2026 08:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VJfW4vrH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A6CE1F0093A;
	Tue,  3 Nov 2026 08:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793693720;
	bh=CcgPpD+aTeak1mqbZyGMOZp4xNDrUHsfBN4CRBbTcy4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VJfW4vrHFGP5rr9TSl87BB1v9ko3wkRHy+4UtCmGOnsccBQ6QgXt0RigISkaGZRpO
	 OkFCeMyznHfrp3s9e4rwZAaC9RmPQG2hYNasC7W5rvFISLcM/gQ0g9kzxtnEuEZNm2
	 R8YCsVJAII0/GpLmILMINFoFPv/WwspDWn2x4g0sgGm/pfIsiBexseCbXwo648hZ+C
	 jFwjLVSNfWQ9cM3vXg7q/u2pmgNMiFncN9Ey9sAl30z8NG6muEFiE5JFgCEZ/UmHFy
	 DSP54JqtaIkR08CHYxl+w8r7JfC3gLrxajG/LQU1bj7g4jKlV2LtvFzHRJ0+a7DWie
	 qd20tpgL0fCOQ==
Message-ID: <sashiko-outbox-194811@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/3] usb: cdns3: Add CIX Sky1 glue driver
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SG9uZ2xpYW5nIFlhbmcgKOadqOWuj+S6rik=?= <hongliang.yang@cixtech.com>
Cc: =?utf-8?b?bGludXgtdXNiQHZnZXIua2VybmVsLm9yZw==?= <linux-usb@vger.kernel.org>,
 =?utf-8?b?ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc=?= <devicetree@vger.kernel.org>, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261103074929.1971195-3-hongliang.yang@cixtech.com>
References: <20261103074929.1971195-1-hongliang.yang@cixtech.com>
 <20261103074929.1971195-3-hongliang.yang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 08:15:19 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 10 potential issue=
(s) to consider:
- [High] usb: cdns3: unclocked MMIO access and host_dev race in cdnsp_sky1_=
shutdown()
- [High] usb: cdns3: controller reset in cdnsp_sky1_system_suspend() breaks=
 system resume
- [Medium] usb: cdns3: positive probe return, pointer-sign mismatch, and DT=
 mismatch
- [Medium] usb: cdns3: ignored D3 errors and broken D0 poll in cdns_sky1_pl=
atform_suspend()
- [Medium] usb: cdns3: cdnsp_sky1_system_suspend() disables wakeup clocks w=
hen wakeup is set
- [Medium] usb: cdns3: clock disable underflow on remove/shutdown after res=
ume failure
- [Medium] usb: cdns3: raw ~AXI_HALT write in cdnsp_sky1_configure_controll=
er()
- [Medium] usb: cdns3: 125us prescaler off-by-one in cdnsp_sky1_configure_c=
ontroller()
- [Low] usb: cdns3: cdnsp_sky1_drd_init() disables clocks before devm_clk_g=
et()
- [Low] usb: cdns3: dead fields, unused oc_gpio, and wrong compatible in Kc=
onfig
--

commit fcb2f6f1fc38d7bbecb98bf69c74a74c7c5ceec3
Author: Hongliang Yang (=E6=9D=A8=E5=AE=8F=E4=BA=AE) <hongliang.yang@cixtec=
h.com>

usb: cdns3: Add CIX Sky1 glue driver

This commit adds a platform glue driver for the Cadence USBSSP dual-role
controller on the CIX Sky1 SoC, managing clocks, resets, S5 system
controller mode straps, and per-controller glue registers.

> diff --git a/drivers/usb/cdns3/Kconfig b/drivers/usb/cdns3/Kconfig
> index 39ad23d1ada89..03d8e170a98af 100644
> --- a/drivers/usb/cdns3/Kconfig
> +++ b/drivers/usb/cdns3/Kconfig
> @@ -77,6 +77,19 @@ config USB_CDNSP_PCI
>  	  If you choose to build this driver as module it will
>  	  be dynamically linked and module will be called cdnsp-pci.ko
> =20
> +config USB_CDNSP_SKY1
> +	tristate "Cadence USB3 support on CIX Sky1 SoC platforms"
> +	depends on USB_CDNS3
> +	depends on ARCH_CIX || COMPILE_TEST
> +	default USB_CDNS3
> +	help
> +	  Glue driver for the Cadence USB dual-role controllers on CIX Sky1
> +	  (device tree compatible cix,sky1-usb3). It enables clocks and resets
> +	  from the SoC, then uses the shared cdns3 platform core (cdns.ko).

[Severity: Low]
This isn't a bug, but the help text for USB_CDNSP_SKY1 mentions compatible
cix,sky1-usb3 whereas cdns_sky1_of_match and
Documentation/devicetree/bindings/usb/cix,sky1-usbssp.yaml use
cix,sky1-usbssp, and the depends on USB_CDNS3 line is inside the enclosing =
if
USB_CDNS3 block. Also, in struct cdnsp_sky1 in drivers/usb/cdns3/cdnsp-sky1=
.h,
are the dr_base and cdnsp_pdev members, as well as oc_gpio in
cdnsp_sky1_probe() (where gpiod_direction_input() is called after requesting
with GPIOD_IN, and the descriptor is never referenced again), still needed?

> diff --git a/drivers/usb/cdns3/cdnsp-sky1.c b/drivers/usb/cdns3/cdnsp-sky=
1.c
> new file mode 100644
> index 0000000000000..1f7870289a35f
> --- /dev/null
> +++ b/drivers/usb/cdns3/cdnsp-sky1.c

[ ... ]

> +static int cdns_sky1_platform_suspend(struct device *dev,
> +				      bool suspend, bool wakeup)
> +{
> +	struct cdns *cdns =3D dev_get_drvdata(dev);
> +	struct platform_device *xhci_dev =3D cdns->host_dev;
> +	struct usb_hcd  *hcd;
> +	struct device *parent =3D cdns->dev->parent;
> +	struct cdnsp_sky1 *data =3D dev_get_drvdata(parent);
> +	u32 value;
> +	int poll;
> +	int ret =3D 0;
> +	int count =3D 3;
> +
> +	data->wakeup =3D wakeup;
> +
> +	if (cdns->role !=3D USB_ROLE_HOST)
> +		return 0;
> +
> +	if (!xhci_dev) {
> +		dev_dbg(dev, "host controller has not been registered\n");
> +		return 0;
> +	}
> +
> +	hcd =3D dev_get_drvdata(&xhci_dev->dev);
> +	if (!hcd) {
> +		dev_dbg(dev, "host controller have not registered\n");
> +		return 0;
> +	}
> +
> +	if (suspend) {
> +		while (count--) {
> +			value =3D readl(hcd->regs + XECP_PM_PMCSR);
> +			value &=3D ~PS_MASK;
> +			value |=3D PS_D3 | PS_PME_En;
> +			writel(value, hcd->regs + XECP_PM_PMCSR);
> +			/* After controller enters D3, disable AXI and SOF
> +			 * until AXI valid flag changes to 0.
> +			 */
> +			if (sky1_rcsu_handshake(data, AXI_CLOCK_VALID, 0,
> +						100ULL * 1000)) {
> +				u32 ctst;
> +
> +				ctst =3D readl(data->rcsu_ctst_base);
> +				dev_dbg(dev, "enter D3 failed, register value:%x\n",
> +					ctst);
> +			} else {
> +				break;
> +			}
> +		}
> +		if (count < 0) {
> +			u32 ctst;
> +
> +			ctst =3D readl(data->rcsu_ctst_base);
> +			dev_err(dev, "enter D3 failed after retries, register value:%x\n",
> +				ctst);
> +		}
> +	} else {
> +		while (count--) {
> +			value =3D readl(hcd->regs + XECP_PM_PMCSR);
> +			value &=3D ~PS_MASK;
> +			value |=3D PS_D0;
> +			value &=3D ~PS_PME_En;
> +			writel(value, hcd->regs + XECP_PM_PMCSR);
> +			/* Wait power state back to D0 */
> +			poll =3D readl_poll_timeout(hcd->regs + XECP_PM_PMCSR,
> +						  value,
> +						  (value & PS_MASK) =3D=3D 0 ||
> +						  value =3D=3D U32_MAX,
> +						  10, 100ULL * 1000);
> +			if (poll) {
> +				dev_dbg(dev, "exit D3 timeout, power state=3D0x%lx\n",
> +					value & PS_MASK);
> +			} else {
> +				break;
> +			}
> +		}
> +		if (count < 0) {
> +			dev_err(dev, "exit D3 timeout after retries, power state=3D0x%lx\n",
> +				value & PS_MASK);
> +		}
> +	}
> +
> +	return ret;
> +}

[Severity: Medium]
In cdns_sky1_platform_suspend(), ret is initialized to 0 and never updated,=
 so
when sky1_rcsu_handshake() or readl_poll_timeout() fails all retries (count=
 <
0), the function logs an error but still returns 0 to
cdns3_controller_suspend() or cdns3_controller_resume().

In addition, in the resume (!suspend) branch, readl_poll_timeout() stops wh=
en
(value & PS_MASK) =3D=3D 0 || value =3D=3D U32_MAX, but unlike sky1_rcsu_ha=
ndshake()
it does not treat value =3D=3D U32_MAX as an error, so reading U32_MAX (whe=
re
value & PS_MASK is 3) is treated as a successful transition to D0.

Also, in the suspend branch, value |=3D PS_D3 | PS_PME_En enables PS_PME_En
even when wakeup is false, and when cdns->role !=3D USB_ROLE_HOST the funct=
ion
returns early without clearing AXI_CLOCK_VALID before
cdnsp_sky1_system_suspend() disables the sof and axi clocks. Should
cdns_sky1_platform_suspend() propagate an error code on failure, check for
U32_MAX on D0 polling, and only set PS_PME_En when wakeup is enabled?

> +static void cdnsp_sky1_configure_controller(struct cdnsp_sky1 *data)
> +{
> +	int clk;
> +	int v0, v1, v2;
> +	u32 val =3D 0;
> +
> +	if (data->u3_disable) {
> +		dev_dbg(data->dev, "disable u3 port\n");
> +		writel(D_XEC_CFG_3XPORT_MODE_VALUE, data->device_base
> +			+ D_XEC_CFG_3XPORT_MODE);
> +	}
> +	writel(AXI_HALT, data->device_base + D_XEC_AXI_CAP);
> +	writel(AXI_HALT, data->xhci_base + D_XEC_AXI_CAP);
> +	writel(data->axi_bmax_value, data->device_base + D_XEC_AXI_CTRL0);
> +	writel(data->axi_bmax_value, data->xhci_base + D_XEC_AXI_CTRL0);
> +	writel((~(u32)(AXI_HALT)), data->device_base + D_XEC_AXI_CAP);
> +	writel((~(u32)(AXI_HALT)), data->xhci_base + D_XEC_AXI_CAP);

[Severity: Medium]
In cdnsp_sky1_configure_controller(), AXI_HALT is defined as BIT(31). Writi=
ng
AXI_HALT and then (~(u32)(AXI_HALT)) directly to D_XEC_AXI_CAP first clears
bits [30:0] to 0 and then writes 0x7fffffff, setting all lower 31 bits to 1.
Should these accesses to D_XEC_AXI_CAP be read-modify-write operations using
readl() and writel() to set and clear only AXI_HALT?

> +	clk =3D data->sof_clk_freq;
> +	v0 =3D  25 * clk / 100000000;
> +	v1 =3D clk / 10000;
> +	v2 =3D clk / 10;
> +	writel(((v0 > 1) ? v0 - 1 : 1), data->device_base
> +		+ D_XEC_PRE_REG_250NS);
> +	writel((unsigned int)((v1 / 100 > 1) > 0 ? (v1 / 100) - 1 : 1),
> +	       data->device_base + D_XEC_PRE_REG_1US);
> +	writel((unsigned int)((v1 / 10 > 1) > 0 ? (v1 / 10) - 1 : 1),
> +	       data->device_base + D_XEC_PRE_REG_10US);
> +	writel(((v1) > 1 ? v1 - 1 : 1), data->device_base
> +		+ D_XEC_PRE_REG_100US);
> +	writel((unsigned int)((125 * clk / 1000000) > 1 ? (125 * clk / 1000000)=
 : 1),
> +	       data->device_base + D_XEC_PRE_REG_125US);

[Severity: Medium]
In cdnsp_sky1_configure_controller(), all of the other prescaler registers
subtract 1 from the cycle count when the value is greater than 1 (for examp=
le,
for the 8 MHz SOF clock, 1us writes 7, 10us writes 79, 100us writes 799, and
1ms writes 7999). However, all four 125us register writes
(D_XEC_PRE_REG_125US, D_XEC_LPM_PRE_REG_125US, XEC_PRE_REG_125US, and
XEC_LPM_PRE_REG_125US) check ((125 * clk / 1000000) > 1) and write
(125 * clk / 1000000) without subtracting 1 (writing 1000 instead of 999 for
8 MHz, and 4 instead of 3 for 32 kHz).

Also, XEC_CFG_3XPORT_MODE on xhci_base handles both data->u3_disable and
data->ssp_disable, whereas D_XEC_CFG_3XPORT_MODE on device_base only checks
data->u3_disable. Should the four 125us prescaler calculations subtract 1, =
and
should data->ssp_disable also be applied to D_XEC_CFG_3XPORT_MODE?

[ ... ]

> +static int cdnsp_sky1_drd_init(struct cdnsp_sky1 *data)
> +{
> +	int ret =3D 0;
> +
> +	reset_control_assert(data->reset);
> +	reset_control_assert(data->preset);
> +	cdnsp_sky1_clk_disable_all(data->dev);
> +	ret =3D cdnsp_sky1_clk_enable_all(data->dev);

[Severity: Low]
In cdnsp_sky1_drd_init(), cdnsp_sky1_clk_disable_all() is called before
cdnsp_sky1_clk_enable_all(). Because devm_clk_get() is called inside
cdnsp_sky1_clk_enable_all() rather than once in cdnsp_sky1_probe(),
data->cix_usb_clks[] still contains NULL pointers when
cdnsp_sky1_clk_disable_all() runs during probe. Should the clocks be acquir=
ed
with devm_clk_get() in cdnsp_sky1_probe() before calling
cdnsp_sky1_drd_init()?

[ ... ]

> +static int cdnsp_sky1_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct device_node *node =3D dev->of_node;
> +	struct of_dev_auxdata cdns_sky1_auxdata[] =3D {
> +		{ .compatible =3D "cdns,usb3", },
> +		{},
> +	};
> +	struct cdnsp_sky1 *data;
> +	struct cdns3_platform_data *cdns_sky1_pdata;
> +	int ret =3D 0;
> +

[ ... ]

> +	platform_set_drvdata(pdev, data);
> +	data->dev =3D dev;
> +	ret =3D of_alias_get_id(dev->of_node, "usb");
> +	if (ret =3D=3D -ENODEV) {
> +		if (device_property_read_u32(dev, "id", &ret))
> +			ret =3D -ENODEV;
> +	}
> +	if (ret < 0 || ret >=3D  SKY1_USB_S5_NUM) {
> +		dev_err(dev, "get alias failed.\n");
> +		return ret;
> +	}
> +	data->id =3D ret;
> +	data->usb_syscon =3D syscon_regmap_lookup_by_phandle(dev->of_node,
> +							   "cix,usb-syscon");
> +	if (IS_ERR(data->usb_syscon)) {
> +		dev_err(dev, "Unable to get cix,usb-syscon regmap");
> +		return PTR_ERR(data->usb_syscon);
> +	}
> +	data->u3_disable =3D device_property_read_bool(dev, "u3-port-disable");
> +	data->ssp_disable =3D device_property_read_bool(dev, "ssp-disable");

[Severity: Medium]
In cdnsp_sky1_probe(), can this ID lookup and property parsing cause a few
issues?

1. ret is declared as int and &ret is passed to device_property_read_u32(),
which expects u32 * and triggers a -Wpointer-sign warning.

2. If ret >=3D SKY1_USB_S5_NUM, cdnsp_sky1_probe() returns a positive value=
 to
really_probe() instead of a negative errno such as -EINVAL.

3. When CONFIG_OF is disabled (under COMPILE_TEST), of_alias_get_id() retur=
ns
-ENOSYS rather than -ENODEV, skipping the device_property_read_u32() fallba=
ck.

4. Documentation/devicetree/bindings/usb/cix,sky1-usbssp.yaml sets
unevaluatedProperties: false and does not define id, u3-port-disable,
ssp-disable, or oc-gpios, nor does its example include a usb alias, so prob=
ing
the DT binding example will fail with -ENODEV.

[ ... ]

> +static void cdnsp_sky1_remove(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct cdnsp_sky1 *data =3D dev_get_drvdata(dev);
> +
> +	pm_runtime_get_sync(dev);
> +	of_platform_depopulate(dev);
> +	sky1_put_addr(data->xhci_base);
> +	sky1_put_addr(data->device_base);
> +	reset_control_assert(data->reset);
> +	reset_control_assert(data->preset);
> +	cdnsp_sky1_clk_disable_all(dev);
> +	pm_runtime_disable(dev);
> +	pm_runtime_set_suspended(dev);
> +	pm_runtime_put_noidle(dev);
> +}
> +
> +/*
> + * Because the wake-up interrupt and host interrupt are the same interru=
pt,
> + * closing the axi and sof clock will result in the inability to generate
> + * port status change interrupt.
> + */
> +static int cdnsp_sky1_system_suspend(struct device *dev)
> +{
> +	struct cdnsp_sky1 *data =3D dev_get_drvdata(dev);
> +
> +	if (!data->wakeup) {
> +		reset_control_assert(data->reset);
> +		reset_control_assert(data->preset);
> +	}
> +	cdnsp_sky1_clk_disable_suspend(dev);
> +	return 0;
> +}

[Severity: Medium]
The comment above cdnsp_sky1_system_suspend() notes that closing the axi and
sof clocks prevents generating the port status change wakeup interrupt.
However, cdnsp_sky1_clk_disable_suspend(dev) (which disables the sof and axi
clocks) is called unconditionally outside the if (!data->wakeup) block. Sho=
uld
cdnsp_sky1_clk_disable_suspend(dev) and the corresponding
cdnsp_sky1_clk_enable_resume(dev) in cdnsp_sky1_system_resume() also be
guarded by !data->wakeup, or should different clocks be gated when wakeup is
enabled?

> +
> +static int cdnsp_sky1_system_resume(struct device *dev)
> +{
> +	int ret =3D 0;
> +	struct cdnsp_sky1 *data =3D dev_get_drvdata(dev);
> +
> +	ret =3D cdnsp_sky1_clk_enable_resume(dev);
> +	if (ret)
> +		return ret;
> +	if (!data->wakeup) {
> +		writel(CIX_USB_AXI_WR_CACHE_VALUE, data->rcsu_axi_base);
> +		cdnsp_sky1_set_mode_by_id(data->dev, MODE_STRAP_OTG);
> +		reset_control_deassert(data->preset);
> +		cdnsp_sky1_configure_controller(data);
> +		reset_control_deassert(data->reset);
> +	}
> +	return 0;
> +}

[Severity: High]
When !data->wakeup during system sleep, cdnsp_sky1_system_suspend() asserts
data->reset and data->preset, which resets all DRD/OTG, xHCI, and gadget
controller registers. On resume, cdnsp_sky1_system_resume() deasserts the
resets and runs cdnsp_sky1_configure_controller(), leaving the DRD block in
its post-reset state with host mode (OTGCMD_HOST_BUS_REQ) disabled.

When the child device then resumes in cdns3_plat_resume() ->
cdns3_controller_resume(), it first calls cdns_sky1_platform_suspend(dev,
false, false), which accesses hcd->regs + XECP_PM_PMCSR before
cdns_drd_host_on() has re-enabled the xHCI block, and then calls
cdns_resume() under spin_lock_irqsave(&cdns->lock, flags) (where
cdns_power_is_lost() for CDNSP_CONTROLLER_V2 either triggers sleeping calls
under the spinlock or skips reinitializing the DRD/host registers). How is =
the
child cdns3 controller expected to recover its DRD and host state after a f=
ull
reset in cdnsp_sky1_system_suspend()?

[Severity: Medium]
Also in cdnsp_sky1_system_resume(), if cdnsp_sky1_clk_enable_resume(dev) fa=
ils
to re-enable the first CIX_USB_CLK_OFF_NUM clocks (sof and axi), those two
clocks remain disabled while lpm and apb remain enabled. When
cdnsp_sky1_remove() or cdnsp_sky1_shutdown() later calls
cdnsp_sky1_clk_disable_all(dev), won't it call clk_disable_unprepare() on a=
ll
four clocks and underflow the enable/prepare counts for sof and axi?

[ ... ]

> +static void cdnsp_sky1_shutdown(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct cdnsp_sky1 *data =3D dev_get_drvdata(dev);
> +	struct device *cdns_dev =3D NULL;
> +	struct device *gadget_dev =3D NULL;
> +	struct cdns *cdns =3D NULL;
> +
> +	if (!device_may_wakeup(dev)) {
> +		/*
> +		 * Find the cdns3 child device, then find its gadget device
> +		 * and release the function driver before disabling clocks.
> +		 * This ensures all register accesses in gadget_unbind_driver
> +		 * complete before clocks are turned off.
> +		 */
> +		device_for_each_child(dev, &cdns_dev, cdnsp_sky1_find_cdns_dev);
> +		if (cdns_dev)
> +			cdns =3D dev_get_drvdata(cdns_dev);
> +		if (cdns)
> +			device_for_each_child(cdns_dev, &gadget_dev,
> +					      cdnsp_sky1_find_gadget_match);
> +		if (gadget_dev)
> +			device_release_driver(gadget_dev);
> +		if (cdns && cdns->host_dev) {
> +			struct usb_hcd *hcd =3D platform_get_drvdata(cdns->host_dev);
> +
> +			if (hcd && hcd->irq > 0) {
> +				/*
> +				 * Clear HCD_FLAG_HW_ACCESSIBLE before disable_irq.
> +				 * This prevents usb_hcd_irq from calling xhci_irq
> +				 * (which reads USBSTS) after clocks are disabled.
> +				 */
> +				clear_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags);
> +				disable_irq(hcd->irq);
> +				synchronize_irq(hcd->irq);
> +			}
> +		}
> +		reset_control_assert(data->reset);
> +		reset_control_assert(data->preset);
> +		cdnsp_sky1_clk_disable_all(dev);
> +		put_device(gadget_dev);
> +		put_device(cdns_dev);
> +	}
> +}

[Severity: High]
Can cdnsp_sky1_shutdown() cause unclocked MMIO accesses or race with role
switching during system shutdown?

1. device_shutdown() does not runtime-resume devices before invoking
->shutdown(). If the controller is runtime-suspended when
device_release_driver(gadget_dev) is called, gadget_unbind_driver() ->
cdnsp_gadget_udc_stop() will access controller registers while the device is
in low-power state.

2. cdns->host_dev is accessed without holding cdns->mutex, which can race w=
ith
a concurrent role switch running cdns_host_exit() ->
platform_device_unregister(cdns->host_dev).

3. Releasing gadget_dev only unbinds the gadget function driver; cdns->otg_=
irq
and cdns->dev_irq remain enabled (and when cdns->role =3D=3D USB_ROLE_DEVIC=
E,
cdns->host_dev is NULL so the controller interrupt is not disabled via
hcd->irq either). After reset_control_assert() and
cdnsp_sky1_clk_disable_all(dev) turn off the APB and AXI clocks, any shared=
 or
pending OTG or gadget interrupt will call cdns_drd_irq() or
cdnsp_irq_handler() and read MMIO registers while the controller is unclock=
ed
and held in reset.

Would it be safer to runtime-resume and depopulate the child device (as in
cdnsp_sky1_remove()) so cdns3 tears down host, gadget, and OTG interrupts
cleanly before asserting resets and disabling clocks?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103074929.1971=
195-1-hongliang.yang@cixtech.com?part=3D2
