Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793961731;
	b=OOxBtFWGdlQTJlynr8q7kGewHX1VVRTtZ+7f7Atb8V72yji/3Ccx1tAsnN8D6OLAa62a
	 U7VUc7vB9Z/911LC4XERb/3bfx7T4RrlKMCl/lkdJ49R9UoHs61ReqgGi5gMBCwUuAfUY
	 NYsk1G3ljmQ8eZ0BJssi5UvbIa8lbMHCiOYsj6npkj5/Myh7BqOGAz3YLwM5bX/uvdaec
	 lgFFYOvhxrtOjN8ys4zH9FvLVRgCsiIWPLVYZ2gOAh0W56zHrXuU1Kknfr921G0SYK8Im
	 VxBwpixuV3FqY3deCFQuLHlp4608o3/NZlm/HRnVy5PUmKYWYIxLmI6fZEHDx+vlsbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793961731;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/1pIR7uO8MMbg1jGUy24/5izHh7m3AWU3hFda2RImt4=;
	b=dAqheiqKZr8HYqFlpAWQAout60Fr0Nz2DDPQyXbMpJkZQQH1XmbxbgFSr7QjQ4vL9BFP
	 66yVFCGy4sa84vodGtwEn8tiHOjXketkcCbogjHi3VGH2OyrwUwRdPuWj54L+TVz4hHvy
	 ks6aWwLHgmlBrZGvLKhQbgOyPjNgd5FpRPbCw4AjnhHtqT4BBtwhj7NP0aYiylWjvA3P9
	 HACwvYNGBaNUk2YyqXlNoBqPFXh7mcbCTY5TT1TQVm/QVXq+ADTlYKIJo8oqcQtvTJvf7
	 mCg/ZLRPvIr/vnkrbw8NUNSctk7GBr2ZP2VST4JPadtIi4SU74HpNnrsUCttgmCUi7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W+bWHJbe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689A0606A33C;
	Fri,  6 Nov 2026 10:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W+bWHJbe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AE3C1F008A3;
	Fri,  6 Nov 2026 10:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793961730;
	bh=/1pIR7uO8MMbg1jGUy24/5izHh7m3AWU3hFda2RImt4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W+bWHJbexhlEj7HuUM0Ptn2Hhp1n9ta1/OQcdbgv9ih+PMepmqj9SPcT24s8hY6ZS
	 6c7U3e3V4tqQaSY5JfVwqacEpinbNuZXMUG+MMrVdQGEcbYeESNKGZgBU0PI4TzQkf
	 f1DPZZ1d2PoqeQx94se3YmVz3Wsu4kwdwQPHG1KeOT4zIJnSURpvpa0SHmLeQppKf1
	 br0K6g5wk+XRnnv5n7Wt3K7p7E5pXLQqHM1yUSSI4tMS37ZvEhosn+tZyFhx+k9n2P
	 /UquWURhGR2iCftsEpLgpwvlvvke4bkpPxb01n3oxYqzFQOtId4WpJagWE7sPa7xbc
	 OjZMEhZif1ruw==
Message-ID: <sashiko-outbox-201226@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/2] usb: cdns3: Add CIX Sky1 glue driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hongliang Yang" <hongliang.yang@cixtech.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261106101210.1059256-3-hongliang.yang@cixtech.com>
References: <20261106101210.1059256-1-hongliang.yang@cixtech.com>
 <20261106101210.1059256-3-hongliang.yang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 10:42:09 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 6 potential
issues to consider:
- [High] usb: cdns3: incomplete teardown before clock disable in
  cdnsp_sky1_shutdown()
- [High] usb: cdns3: unrecovered OTG state after reset in
  cdnsp_sky1_system_resume()
- [High] usb: cdns3: invalid kfree() of devres cdns_sky1_pdata on child
  release
- [Medium] usb: cdns3: broken D0 poll and error return in
  cdns_sky1_platform_suspend()
- [Medium] usb: cdns3: inconsistent wakeup checks across suspend and
  shutdown in cdnsp-sky1
- [Medium] usb: cdns3: unconditional data->wakeup overwrite in
  cdns_sky1_platform_suspend()
--

commit a740c36e5f7b737668f9904cdc187603aff7c8f4
Author: Hongliang Yang <hongliang.yang@cixtech.com>

usb: cdns3: Add CIX Sky1 glue driver

This commit adds a platform glue driver for the Cadence USBSSP dual-role
controller on the CIX Sky1 SoC, managing clocks, resets, RCSU AXI settings,
mode straps, and power management.

> diff --git a/drivers/usb/cdns3/cdnsp-sky1.c b/drivers/usb/cdns3/cdnsp-sky=
1.c
> new file mode 100644
> index 0000000000000..65c2c692d2a35
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

[Severity: Medium]
Can overwriting data->wakeup on every call cause cdnsp_sky1_system_suspend()
to reset an active controller?

cdns3_controller_resume() calls platform_suspend(dev, false, false), which
clears data->wakeup.  During system suspend with wakeup enabled on the child
device, runtime PM remains enabled until the suspend_late phase:

CPU0                              CPU1
cdns3_plat_suspend()
  cdns3_controller_suspend()
    cdns_sky1_platform_suspend(..., true, true)
      data->wakeup =3D true;
    cdns->in_lpm =3D true;
                                  cdns_wakeup_irq()
                                    pm_request_resume(...)
                                    cdns3_controller_resume()
                                      cdns_sky1_platform_suspend(..., false=
, false)
                                        data->wakeup =3D false;
                                      cdns->in_lpm =3D false;
cdnsp_sky1_system_suspend()
  if (!data->wakeup)
    reset_control_assert(...)     <-- resets active controller

On the subsequent system resume, cdns3_controller_resume() sees
!cdns->in_lpm and returns early without reinitializing the controller.

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
> +				ctst =3D sky1_rcsu_read_status(data);
> +				dev_dbg(dev, "enter D3 failed, register value:%x\n",
> +					ctst);
> +			} else {
> +				break;
> +			}
> +		}
> +		if (count < 0) {
> +			u32 ctst;
> +
> +			ctst =3D sky1_rcsu_read_status(data);
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
Does the D0 polling loop treat value =3D=3D U32_MAX as a successful transit=
ion,
and does cdns_sky1_platform_suspend() always return 0 even when all retries
fail?

In the resume path, readl_poll_timeout() returns 0 whenever its condition
holds, so reading U32_MAX breaks out of the retry loop without checking for
U32_MAX (unlike sky1_rcsu_handshake()).  Also, ret is never updated when
count < 0 in either the suspend or resume branch, and the suspend branch
sets PS_PME_En unconditionally even when wakeup is false.

[ ... ]

> +	/*
> +	 * The platform data is devm-allocated, so it stays alive as long as
> +	 * this device; the child devices are depopulated before it is freed.
> +	 */
> +	cdns_sky1_pdata =3D devm_kzalloc(dev, sizeof(*cdns_sky1_pdata), GFP_KER=
NEL);
> +	if (!cdns_sky1_pdata) {
> +		ret =3D -ENOMEM;
> +		goto err_quiesce;
> +	}
> +	cdns_sky1_pdata->platform_suspend =3D cdns_sky1_platform_suspend;
> +	cdns_sky1_pdata->quirks =3D CDNS3_DEFAULT_PM_RUNTIME_ALLOW;
> +	cdns_sky1_auxdata[0].platform_data =3D cdns_sky1_pdata;
> +	ret =3D of_platform_populate(node, NULL, cdns_sky1_auxdata, dev);

[Severity: High]
Does passing devm-allocated cdns_sky1_pdata via of_dev_auxdata cause an
invalid kfree() and double free when the child platform device is released?

of_platform_populate() passes auxdata->platform_data to
of_platform_device_create_pdata(), which assigns pdev->dev.platform_data
directly on a platform_device allocated with platform_device_alloc().  When
of_platform_depopulate() unregisters that child in cdnsp_sky1_remove(),
platform_device_release() frees platform_data with kfree():

drivers/base/platform.c:platform_device_release() {
	struct platform_object *pa =3D container_of(dev, struct platform_object,
						  pdev.dev);

	of_node_put(pa->pdev.dev.of_node);
	kfree(pa->pdev.dev.platform_data);
	kfree(pa->pdev.mfd_cell);
	kfree(pa->pdev.resource);
	kfree(pa->pdev.driver_override);
	kfree(pa);
}

Because devm_kzalloc() returns an interior pointer (dr->data) inside struct
devres, kfree(pa->pdev.dev.platform_data) corrupts the slab allocator and
devres later frees the enclosing allocation a second time.  Keeping struct
cdns3_platform_data as a field inside struct cdnsp_sky1 breaks only if
platform_device_release() still calls kfree() on it, so platform_data passed
through of_dev_auxdata cannot be devres-managed or embedded unless
pdev->dev.platform_data is cleared before put_device() or allocated with
kzalloc().

[ ... ]

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
> +		writel(CIX_USB_AXI_WR_CACHE_VALUE, data->rcsu_base);
> +		cdnsp_sky1_set_mode(data->dev, MODE_STRAP_OTG);
> +		reset_control_deassert(data->preset);
> +		cdnsp_sky1_configure_controller(data);
> +		reset_control_deassert(data->reset);
> +	}
> +	return 0;
> +}

[Severity: High]
When wakeup is disabled, does asserting data->reset and data->preset across
system suspend leave the child cdns3 OTG registers uninitialized on resume?

Resetting the controller clears cdns->otg_cdnsp_regs->override
(OVERRIDE_IDPULLUP) and cdns->otg_irq_regs->ien, which are only programmed
during probe in cdns_drd_init() -> cdns_drd_update_mode().  When the child
device resumes afterwards in cdns3_controller_resume(), it first calls
cdns_sky1_platform_suspend(dev, false, false) to poll XECP_PM_PMCSR in
hcd->regs before cdns_resume() has re-enabled the host bus in the OTG block,
and cdns_resume() never re-runs cdns_drd_update_mode(), leaving ID detection
and OTG interrupts disabled after resume.

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
Why does cdnsp_sky1_shutdown() check device_may_wakeup(dev) on the parent
glue device while cdnsp_sky1_system_suspend() checks data->wakeup from the
child cdns-usb3 device?

Both cdnsp_sky1_probe() and cdns3_plat_probe() call
device_set_wakeup_capable(dev, true) on their respective devices.  If
userspace enables wakeup on the child cdns-usb3 device (which owns the
wakeup IRQ), device_may_wakeup(dev) on the parent glue device remains false,
so cdnsp_sky1_shutdown() still asserts resets and disables all clocks.

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
Can asserting resets and disabling all clocks in cdnsp_sky1_shutdown()
while child interrupts and role switches are still active cause an unclocked
MMIO access or use-after-free?

Unlike cdnsp_sky1_remove(), which calls pm_runtime_get_sync(dev) and
of_platform_depopulate(dev) before asserting resets and disabling clocks,
cdnsp_sky1_shutdown() leaves the child cdns3 device bound:

- cdns_dev may be runtime-suspended (CDNS3_DEFAULT_PM_RUNTIME_ALLOW is set)
  when device_release_driver(gadget_dev) accesses controller registers in
  cdnsp_gadget_pullup() and cdnsp_gadget_udc_stop().
- device_release_driver(gadget_dev) only unbinds the gadget function driver;
  cdns->dev_irq, cdns->otg_irq, and cdns->wakeup_irq remain enabled and
  registered, so any in-flight or subsequent interrupt after
  reset_control_assert() and cdnsp_sky1_clk_disable_all() reads unclocked,
  reset-asserted MMIO registers.
- cdns->host_dev is read without holding cdns->mutex while
  cdns_drd_thread_irq() can concurrently run cdns_hw_role_switch() ->
  cdns_host_exit() and unregister cdns->host_dev, and only the primary
  hcd->flags has HCD_FLAG_HW_ACCESSIBLE cleared while xhci->shared_hcd
  remains marked accessible.

Could cdnsp_sky1_shutdown() instead wake the device with
pm_runtime_get_sync(dev) and call of_platform_depopulate(dev) like
cdnsp_sky1_remove() does?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106101210.1059=
256-1-hongliang.yang@cixtech.com?part=3D2
