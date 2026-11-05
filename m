Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793843069;
	b=oWVCz0YsPst7Gi4NU9omBS/OXjXdlO1f67RUonsPsYmJMxcViDaUqZ7vutq6GTUZmuyg
	 BjQ+ktNjtOLeVidbKMhcDXXShMOdrnZUaCat+U0aUs4AiI1HqKtYvx/zP7aS/MYTHebzR
	 71wsOe6IuCJ0Ysg8/Cf8NM0KYmS86VzfB9IUmwx0a55QqThQ1UQN4/w4I8VEF205wxb7C
	 yyep4sv9mrQDa3ggiUPLsO/f52frz4W7fGGRVcxRAJ4vtEuBpcjp78/sFh+PZp4s2Qqyl
	 1deciPbuUZMsQW5LWg3Re8HKuxZnhCppcIO8FXxEDf0FnVAny5xOmv0GSVLqLcUx7TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793843069;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=YblE3kckv4zEH3vu/UPQVMpa44daCBfboYd+xShBaHs=;
	b=Vr06jj+FlDRkDF+FdmLxGIRT22MLC7nprsOh/Pt1Iyrze0iUpbx4mHQS5yyndxQaXVTS
	 sXVmrfSFwurJTr9RFGsXRvi1+KRYlFqj+ycJtApXcnNtUHz//1SPHFXFXzlqgx2gihyzq
	 lcPg6BOTo/eHP06LCkMQvfRhBh6SolaBBhs/Q9jzZcRpSoLJ5m3LuVw7tYZe8FMemoJuf
	 8gYfgBMnOfA597rB5qunc2ELPTxl1OCEh5hKoQHfERTWjh/FRYe9/YLU6uL0xel5yRuwH
	 S+BHV0df3yfW+eBsMzl+24qJXDk9EXR53hDuKdgq56n08hSRws+bArQIU7CAopwgDNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oNYCIK2l;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35D8606A31B;
	Thu,  5 Nov 2026 01:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oNYCIK2l
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 263E21F000C1;
	Thu,  5 Nov 2026 01:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793843068;
	bh=YblE3kckv4zEH3vu/UPQVMpa44daCBfboYd+xShBaHs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oNYCIK2lDoWFP0SmSrJYxy03CWpAjLfyoAm8wmqAPOyQi16m93KNvfPlp+ZjgOqbq
	 DTMUwjNxOOPt9CKNLbzmHdsCNzo0SfuaF7SzuDHmSsHzeB1RLvIgqPUqA0gF9GO9zD
	 rdFR9SH6lBRdO/U27zfFr1/hm74duVw5MKKkl+XKEc5Q1YlHy2ZIb7ZUth1FgeXFs4
	 BqfTh58hVB012ut2JlGqMVEg7VTanhVAlQg9eo528iouLdN6kBYY13yI0PNYAArVLD
	 0zYel8JlyBqz0eyfjN9WJcOc1YSgPM29iI9kPOlQWrfZ1KkPLLKgmZ8q7YCBmeO3xx
	 kK2NHZjQHN1Zw==
Message-ID: <sashiko-outbox-198413@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/3] usb: cdns3: Add CIX Sky1 glue driver
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SG9uZ2xpYW5nIFlhbmcgKOadqOWuj+S6rik=?= <hongliang.yang@cixtech.com>
Cc: =?utf-8?b?bGludXgtdXNiQHZnZXIua2VybmVsLm9yZw==?= <linux-usb@vger.kernel.org>,
 =?utf-8?b?ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc=?= <devicetree@vger.kernel.org>, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261105011803.4058557-3-hongliang.yang@cixtech.com>
References: <20261105011803.4058557-1-hongliang.yang@cixtech.com>
 <20261105011803.4058557-3-hongliang.yang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 01:44:27 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] usb: cdns3: unclocked MMIO access and host_dev race in cdnsp_sky1_=
shutdown()
- [High] usb: cdns3: controller reset in cdnsp_sky1_system_suspend() breaks=
 resume
- [Medium] usb: cdns3: ignored D3 errors and bad D0 poll in cdns_sky1_platf=
orm_suspend()
- [Medium] usb: cdns3: wakeup clocks disabled on suspend in cdnsp_sky1_syst=
em_suspend()
- [Medium] usb: cdns3: inconsistent wakeup checks between parent and child =
in cdnsp-sky1
- [Medium] usb: cdns3: clock disable underflow after failed cdnsp_sky1_syst=
em_resume()
- [Low] usb: cdns3: missing Return sections in cdnsp-sky1 kernel-doc commen=
ts
--

commit 0410eea3b97afaa677cd0ee5ca265bc4f7a11f31
Author: Hongliang Yang (=E6=9D=A8=E5=AE=8F=E4=BA=AE) <hongliang.yang@cixtec=
h.com>

usb: cdns3: Add CIX Sky1 glue driver

This commit adds a glue driver for the Cadence USBSSP dual-role controller
on the CIX Sky1 SoC, managing clocks, resets, mode strap controls in the
S5 system controller, and per-controller glue registers.

> diff --git a/drivers/usb/cdns3/cdnsp-sky1.c b/drivers/usb/cdns3/cdnsp-sky=
1.c
> new file mode 100644
> index 0000000000000..ca1a37c61baa6
> --- /dev/null
> +++ b/drivers/usb/cdns3/cdnsp-sky1.c
> @@ -0,0 +1,680 @@

[ ... ]

> +/**
> + * cdnsp_sky1_clk_enable_all() - enable all clocks for usb controller
> + * @dev:	Pointer to the device of platform_device
> + *
> + */
> +
> +static int cdnsp_sky1_clk_enable_all(struct device *dev)
> +{

[ ... ]

> +};
> +
> +/**
> + * cdnsp_sky1_clk_disable_all() - disable all clocks for usb controller
> + * @dev:	Pointer to the device of platform_device
> + *
> + */
> +
> +static void cdnsp_sky1_clk_disable_all(struct device *dev)
> +{
> +	int i;
> +	struct cdnsp_sky1 *data =3D dev_get_drvdata(dev);
> +	struct clk **cix_usb_clks =3D data->cix_usb_clks;
> +
> +	for (i =3D 0; i < CIX_USB_CLK_NUM; i++)
> +		clk_disable_unprepare(cix_usb_clks[i]);
> +};
> +
> +/**
> + * cdnsp_sky1_clk_enable_resume() - enable the clocks that are turned
> + * off while suspend
> + * @dev:	Pointer to the device of platform_device
> + *
> + */
> +
> +static int cdnsp_sky1_clk_enable_resume(struct device *dev)

[Severity: Low]
This isn't a bug, but both cdnsp_sky1_clk_enable_all() and
cdnsp_sky1_clk_enable_resume() have kernel-doc comments without a Return:
section. Will scripts/kernel-doc emit warnings here when building with
W=3D1?

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
As reported by Sashiko on v5 [1], are there several issues in
cdns_sky1_platform_suspend()?

First, ret is initialized to 0 and never updated on failure. When
sky1_rcsu_handshake() fails all retries on suspend (count < 0) or
readl_poll_timeout() fails all retries on resume (count < 0),
cdns_sky1_platform_suspend() logs an error via dev_err() but still returns
0. On suspend, won't callers then proceed to power off PHYs and disable the
AXI and SOF clocks in cdnsp_sky1_system_suspend() while AXI_CLOCK_VALID is
still asserted?

Second, in the resume (!suspend) branch, readl_poll_timeout() polls
hcd->regs + XECP_PM_PMCSR with the condition (value & PS_MASK) =3D=3D 0 ||
value =3D=3D U32_MAX. Unlike sky1_rcsu_handshake(), which checks if
result =3D=3D U32_MAX and returns -ENODEV, this loop only checks if (poll) =
and
breaks out when poll =3D=3D 0. If reading XECP_PM_PMCSR returns U32_MAX (wh=
ere
value & PS_MASK is PS_D3), won't readl_poll_timeout() return 0 and cause
the loop to exit immediately as if the controller had reached D0?

Third, in the suspend branch, value |=3D PS_D3 | PS_PME_En sets PS_PME_En
unconditionally even when wakeup is false.

Fourth, data->wakeup =3D wakeup is assigned before returning early when
cdns->role !=3D USB_ROLE_HOST. In peripheral or idle OTG role, the
controller is not placed into D3 and AXI_CLOCK_VALID is not cleared, yet
if wakeup is true, cdnsp_sky1_system_suspend() skips asserting resets while
disabling the sof and axi clocks with the controller still active in D0.

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
As reported by Sashiko on v5 [1], the comment above
cdnsp_sky1_system_suspend() notes that closing the axi and sof clocks
prevents generating a port status change wakeup interrupt. However,
cdnsp_sky1_system_suspend() only guards reset_control_assert() with
if (!data->wakeup) and then unconditionally calls
cdnsp_sky1_clk_disable_suspend(dev), which disables the first
CIX_USB_CLK_OFF_NUM clocks (sof and axi).

Doesn't this disable the sof and axi clocks even when data->wakeup is
true, preventing wakeup interrupts during system sleep?

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
> +		cdnsp_sky1_set_mode(data->dev, MODE_STRAP_OTG);
> +		reset_control_deassert(data->preset);
> +		cdnsp_sky1_configure_controller(data);
> +		reset_control_deassert(data->reset);
> +	}
> +	return 0;
> +}

[Severity: High]
As reported by Sashiko on v5 [1], how does system resume recover after
cdnsp_sky1_system_suspend() asserts data->reset and data->preset when
!data->wakeup?

Asserting data->reset and data->preset resets the entire Cadence USBSSP
controller, clearing all OTG/DRD, xHCI, and gadget registers. On system
resume, cdnsp_sky1_system_resume() deasserts preset, runs
cdnsp_sky1_configure_controller(), and deasserts reset, leaving the DRD
block in its post-reset state (OTGCMD_HOST_BUS_REQ is not set,
OTGSTS_CDNSP_XHCI_READY is 0, OVERRIDE_IDPULLUP is cleared, and OTG
interrupts in otg_cdnsp_regs->ien are disabled).

When the child device then resumes in
cdns3_plat_resume() -> cdns3_controller_resume():

drivers/usb/cdns3/cdns3-plat.c:cdns3_controller_resume() {
	...
	cdns3_set_platform_suspend(cdns->dev, false, false);

	spin_lock_irqsave(&cdns->lock, flags);
	cdns_resume(cdns);
	cdns->in_lpm =3D false;
	spin_unlock_irqrestore(&cdns->lock, flags);
	...
}

First, cdns3_set_platform_suspend() invokes cdns_sky1_platform_suspend()
before cdns_resume() runs, reading and writing hcd->regs + XECP_PM_PMCSR
before cdns_drd_host_on() has re-enabled the host controller in the DRD
block.

Second, cdns3_controller_resume() calls cdns_resume(cdns) while holding
spin_lock_irqsave(&cdns->lock, flags). In cdns_resume(),
cdns_power_is_lost(cdns) is checked (which for CDNSP_CONTROLLER_V2 reads
&cdns->otg_v1_regs->simulate at offset 0x40 rather than simulate at 0x28
in struct cdnsp_otg_regs, and simulate is never written in cdns_drd_init()
for CDNSP_CONTROLLER_V2). If cdns_power_is_lost() returns true (after the
reset or during runtime resume enabled by CDNS3_DEFAULT_PM_RUNTIME_ALLOW),
cdns_resume() calls cdns_hw_role_switch() (which calls
pm_runtime_get_sync() and mutex_lock(&cdns->mutex)) or cdns_drd_host_on() /
cdns_drd_gadget_on() (which call phy_set_mode() -> mutex_lock(&phy->mutex))
under the spinlock, sleeping in atomic context. If cdns_power_is_lost()
returns false, cdns_drd_host_on() and xHCI restore are skipped, and
neither cdnsp_sky1_system_resume() nor cdns_resume() calls
cdns_drd_update_mode() to restore OVERRIDE_IDPULLUP and
otg_irq_regs->ien.

[Severity: Medium]
As reported by Sashiko on v5 [1], what happens if
cdnsp_sky1_clk_enable_resume() fails in cdnsp_sky1_system_resume()?

During system suspend, cdnsp_sky1_clk_disable_suspend() disables and
unprepares the first CIX_USB_CLK_OFF_NUM clocks (sof and axi). If
cdnsp_sky1_clk_enable_resume() fails during resume, it unwinds any clock
it just enabled and returns the error, leaving sof and axi disabled
without tracking that those clocks remain off. When cdnsp_sky1_remove() or
cdnsp_sky1_shutdown() later runs, it unconditionally calls
cdnsp_sky1_clk_disable_all(dev) across all CIX_USB_CLK_NUM clocks. Won't
that underflow the enable and prepare counts for sof and axi?

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

[Severity: Medium]
As reported by Sashiko on v5 [1], is the wakeup state checked consistently
between the parent glue device and the child cdns,usb3 device?

cdnsp_sky1_probe() calls device_set_wakeup_capable(dev, true) on the
parent glue device, while cdns3_plat_probe() also marks the child
cdns,usb3 device wakeup-capable.

During system suspend and resume, cdnsp_sky1_system_suspend() and
cdnsp_sky1_system_resume() check data->wakeup (populated from the child
device in cdns_sky1_platform_suspend()), ignoring device_may_wakeup(dev) on
the parent. Conversely, cdnsp_sky1_shutdown() checks
if (!device_may_wakeup(dev)) on the parent glue device, ignoring the child
device's wakeup setting.

Also, during runtime suspend (PMSG_AUTO_SUSPEND),
cdns3_controller_suspend() passes wakeup =3D true to
cdns_sky1_platform_suspend(), setting data->wakeup =3D true; if the child
device remains in cdns->in_lpm when system suspend runs,
cdns3_controller_suspend() returns early without updating data->wakeup to
device_may_wakeup(cdns->dev).

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
As reported by Sashiko on v5 [1], can cdnsp_sky1_shutdown() trigger
unclocked MMIO accesses or race with role switching?

1. Because cdnsp_sky1_probe() sets CDNS3_DEFAULT_PM_RUNTIME_ALLOW, the
child cdns,usb3 device autosuspends when idle or in peripheral mode.
During device_shutdown(), the driver core only calls
pm_runtime_get_noresume(), not pm_runtime_get_sync(). When cdns->host_dev
is not active, usb_hcd_platform_shutdown() does not run to runtime-resume
cdns_dev. Calling device_release_driver(gadget_dev) without first calling
pm_runtime_get_sync(cdns_dev) causes
gadget_unbind_driver() -> cdnsp_gadget_udc_stop() -> cdnsp_stop() to access
controller MMIO registers while the controller is in low-power state.

2. cdnsp_sky1_shutdown() reads cdns->host_dev and accesses its drvdata
struct usb_hcd without holding cdns->mutex or disabling cdns->otg_irq. A
concurrent OTG role switch via cdns_drd_thread_irq() or cdns_role_set()
calls cdns_host_exit() under cdns->mutex:

drivers/usb/cdns3/host.c:cdns_host_exit() {
	kfree(cdns->xhci_plat_data);
	platform_device_unregister(cdns->host_dev);
	cdns->host_dev =3D NULL;
	cdns_drd_host_off(cdns);
}

which unregisters and frees cdns->host_dev and struct usb_hcd before
setting cdns->host_dev =3D NULL, racing with cdnsp_sky1_shutdown().

3. Calling device_release_driver(gadget_dev) only unbinds the gadget
function driver on the gadget bus and does not tear down the gadget or DRD
drivers. Both cdns->otg_irq (requested with IRQF_SHARED for
cdns_drd_irq()) and cdns->dev_irq (requested with IRQF_SHARED for
cdnsp_irq_handler(), and not disabled via hcd->irq when cdns->host_dev is
NULL in device mode) remain enabled when cdnsp_sky1_shutdown() asserts
data->reset and data->preset and disables all clocks via
cdnsp_sky1_clk_disable_all(dev). If a shared or pending interrupt fires on
otg_irq or dev_irq afterward, cdns_drd_irq() or cdnsp_irq_handler() will
read controller MMIO registers while resets are asserted and clocks are
disabled.

[1] https://lore.kernel.org/r/20261103074929.1971195-3-hongliang.yang@cixte=
ch.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105011803.4058=
557-1-hongliang.yang@cixtech.com?part=3D2
