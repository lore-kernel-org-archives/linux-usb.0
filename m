Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794312938;
	b=QbHnGcYpLgcivbPvTSsqHLxVNqQ221JFHBgFDOwebJVLFmfCF7bUltbhiAQs9TDoHrcr
	 f2T4qjgn3g1Qd9xHfxymsUQWKZoV487oTu6hD26RVUD7opYmmLy9k8tMISRoRdaDrOTPU
	 xrydRd9ZdMxcAdkfw8QQFIzqhqlNyAUsk/OrE3eI7dtgsAeSbLv0FK1+4cbPiF9zYVK9y
	 PMSaVWsLvsL6As11et/Jw0baYTYstfouUrQ3hyESUaWoEY+kcCqao7XvlMIazyLa7dgTg
	 cAXvYbR2FiEt9SQXd4qcW8itvnZ3uZm1Lju2101fKR+wVB73LCA4FwCQmHIDYx9p3OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794312938;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=aYDVrGZPL+4Ry/DGPuF6veRzVwxRnk959cKqose84UA=;
	b=nVeoP11Lp8I9zQPKtfXs37IozHj1fZ5wU+fkGl23k5mKOAO3UQWPb/ZfUHc+Mz42MIq6
	 0hrpPDGxJb3QmACfh6Z5Ub8KGdfX+fhZoqHmKAwuxoSyoo8XpZRa6bcaJWRd8NBVAZvbO
	 VUTF9D1n022vfbTseI3HNz7prqd0vi/eHOPxnUsvYWv7bjxEA+CBblgcYtuLaLLyBAw1d
	 9Xb4+dkZya4RV/6YkkYNsPvnPBEZK+QZx1cx8KXL/uWh+EGyCxhVz4FPa9a6o2hi7V1am
	 y2EI1A0xlmhCgPgcS6rGYGf4yuRBD6qAufrOitlbLVRFdj/f3dNYfD4OowIZBD6HgIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V7DtxKFX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209EB606A326
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 12:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V7DtxKFX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7D171F0089F;
	Tue, 10 Nov 2026 12:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794312938;
	bh=aYDVrGZPL+4Ry/DGPuF6veRzVwxRnk959cKqose84UA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V7DtxKFX/lfEx83r1rhu4G/Pw2sS+kewgHM5QV3kOrXE+rF1dK+iS2l+ccFALbbT7
	 Um1iD4eeOBnJlOxpR4KPLVDcoFV3CCpO/f2qPjOzpExHM5zFKmUV2h/fvf3u8WGIhm
	 C50AQ3wuiPFSdqBWw7F17Fm4yfV4ZahwyCuDk4wBqZEvdTxA/6I84wQPTrvW5EO0hv
	 jMryRUtx51ouS+IWfdItt+A5kXVlERfX+lIVYAlaCSrEwTGxoaYEgZ3Kyt2+5t5p5w
	 U9RUONI4O4VgHdk8mtmUcJb2kxf2ppD6Y1hAzDhNh3S+haJ5zrx8IMRQ91phIRtWiI
	 uW0BYW/tJuN9A==
Message-ID: <sashiko-outbox-206992@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/7] thunderbolt: add platform NHI driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chunfeng Yun" <chunfeng.yun@mediatek.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110114925.722014-5-chunfeng.yun@mediatek.com>
References: <20261110114925.722014-1-chunfeng.yun@mediatek.com>
 <20261110114925.722014-5-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 12:15:37 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] thunderbolt: broken system PM when sharing tb_nhi_pm_ops on
  platform_driver
- [Medium] thunderbolt: missing cleanup in nhi_platform_init_irq() and
  tb_nhi_probe()
--

commit 185e80648753aea8ed254f3effc097c624617d73
Author: Chunfeng Yun <chunfeng.yun@mediatek.com>

thunderbolt: add platform NHI driver

This commit adds a platform driver for Thunderbolt/USB4 Native Host Interfa=
ce
(NHI) controllers integrated as memory-mapped platform devices via Device T=
ree
or ACPI, including support for an optional dedicated wakeup interrupt.

> diff --git a/drivers/thunderbolt/platform.c b/drivers/thunderbolt/platfor=
m.c
> new file mode 100644
> index 0000000000000..3562b6c7ea7db
> --- /dev/null
> +++ b/drivers/thunderbolt/platform.c
> @@ -0,0 +1,172 @@
[ ... ]
> +static int nhi_platform_init(struct tb_nhi *nhi)
> +{
> +	/* avoid device link fail for pcie tunnel */
> +	pm_runtime_set_active(nhi->dev);
> +	pm_runtime_get_noresume(nhi->dev);
> +	pm_runtime_enable(nhi->dev);
> +
> +	device_set_wakeup_capable(nhi->dev, true);
> +	device_enable_async_suspend(nhi->dev);
> +
> +	return 0;
> +}
> +
> +static void nhi_platform_clear_wake_irq(void *dev)
> +{
> +	dev_pm_clear_wake_irq(dev);
> +}
> +
> +static int nhi_platform_init_irq(struct tb_nhi *nhi)
> +{
> +	struct device *dev =3D nhi->dev;
> +	int ret;
> +
> +	ret =3D devm_request_irq(dev, nhi->irq, tb_nhi_isr, IRQF_NO_SUSPEND,
> +			       dev_name(dev), nhi);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "request irq failed\n");
> +
> +	if (nhi->wake_irq) {
> +		ret =3D dev_pm_set_dedicated_wake_irq(dev, nhi->wake_irq);
> +		if (ret) {
> +			return dev_err_probe(dev, ret, "set wake irq %d failed\n", nhi->wake_=
irq);
> +		}
> +
> +		dev_info(dev, "wake irq %d\n", nhi->wake_irq);
> +
> +		ret =3D devm_add_action_or_reset(dev, nhi_platform_clear_wake_irq, dev=
);
> +	}
> +
> +	return ret;
> +}
> +
> +static void nhi_platform_exit(struct tb_nhi *nhi)
> +{
> +	devm_free_irq(nhi->dev, nhi->irq, nhi);
> +	flush_work(&nhi->interrupt_work);
> +
> +	pm_runtime_put_noidle(nhi->dev);
> +	pm_runtime_disable(nhi->dev);
> +	pm_runtime_set_suspended(nhi->dev);
> +}

[Severity: Medium]
Does a probe failure before tb_domain_add() bypass nhi_platform_exit(),
leaving nhi->interrupt_work unflushed and runtime PM enabled on the unbound
device?

In tb_nhi_probe(), tb_nhi_shutdown() is only called if tb_domain_add() fail=
s:

drivers/thunderbolt/nhi.c:tb_nhi_probe() {
	...
	res =3D nhi->ops->init_interrupts(nhi);
	if (res)
		return dev_err_probe(dev, res, "cannot enable interrupts, aborting\n");

	spin_lock_init(&nhi->lock);

	res =3D dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
	if (res)
		return dev_err_probe(dev, res, "failed to set DMA mask\n");

	if (nhi->ops->init) {
		res =3D nhi->ops->init(nhi);
		if (res)
			return dev_err_probe(dev, res, "NHI specific init failed\n");
	}

	init_completion(&nhi->domain_released);

	tb =3D nhi_select_cm(nhi);
	if (!tb)
		return dev_err_probe(dev, -ENODEV,
			"failed to determine connection manager, aborting\n");
	...
}

If dev_pm_set_dedicated_wake_irq() fails in nhi_platform_init_irq(), or if
dma_set_mask_and_coherent() or nhi_select_cm() fails in tb_nhi_probe(),
devres frees nhi->irq, unmaps nhi->iobase, and frees nhi without ever
flushing nhi->interrupt_work, which can cause a use-after-free if
tb_nhi_isr() scheduled the work item.  In addition, if nhi_select_cm() fails
after nhi_platform_init() has run, runtime PM stays enabled with an elevated
usage count, so pm_runtime_reinit() in device_unbind_cleanup() bails out and
a subsequent re-probe warns on unbalanced pm_runtime_enable().

[ ... ]

> +static struct platform_driver nhi_platform_driver =3D {
> +	.probe =3D nhi_platform_probe,
> +	.remove =3D nhi_platform_remove,
> +	.shutdown =3D nhi_platform_shutdown,
> +	.driver =3D {
> +		.name =3D "thunderbolt",
> +		.of_match_table =3D of_match_ptr(nhi_platform_of_match),
> +		.acpi_match_table =3D ACPI_PTR(nhi_platform_acpi_match),
> +		.pm =3D &tb_nhi_pm_ops,
> +	},
> +};

[Severity: High]
Can system suspend and resume run while the platform NHI is runtime-suspend=
ed
when using tb_nhi_pm_ops directly on a platform_driver?

On PCI, pci_pm_suspend() runtime-resumes the device before calling the
driver's .suspend and .suspend_noirq callbacks.  Neither the platform bus,
genpd, nor nhi_suspend() does that, and device_wakeup_enable() prevents
direct_complete.  If the controller has autosuspended before system suspend:

1. nhi_suspend_noirq() -> tb_domain_suspend_noirq() runs while the device is
   runtime-suspended (with clocks or power domains gated) and calls
   tb_ctl_stop() on rings already stopped by nhi_runtime_suspend(), trigger=
ing
   dev_WARN() in tb_ring_stop().
2. On resume, nhi_resume_noirq() -> tb_domain_resume_noirq() calls
   tb_ctl_start(), touching MMIO while runtime status is still RPM_SUSPENDED
   and queuing ctl->rx_packets[] onto ctl->rx->in_flight.
3. In the complete phase, nhi_complete() sees pm_runtime_suspended(dev) is
    still true and calls pm_runtime_resume(dev) -> nhi_runtime_resume() ->
   tb_ctl_start() a second time:

drivers/thunderbolt/nhi.c:nhi_complete() {
	struct tb *tb =3D dev_get_drvdata(dev);

	/*
	 * If we were runtime suspended when system suspend started,
	 * schedule runtime resume now. It should bring the domain back
	 * to functional state.
	 */
	if (pm_runtime_suspended(dev))
		pm_runtime_resume(dev);
	else
		tb_domain_complete(tb);
}

The second tb_ctl_start() warns that the rings are already started and calls
tb_ctl_rx_submit() -> __tb_ring_enqueue() -> list_add_tail() on
ctl->rx_packets[] frames that are already linked in ctl->rx->in_flight,
corrupting the ring list.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110114925.7220=
14-2-chunfeng.yun@mediatek.com?part=3D4
