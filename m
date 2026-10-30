Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793350252;
	b=roSZnn4dH4bWp2//7qEAC+hZQNHvAysvI1bdwi8umgrwD/SdUdqw/T62iOHOnpuAuP5d
	 HELI2+XV9a1OOHVqJEIk8ACL6msyciqsBtypp6HB+ZdmIx4PsWqONHN6O5Q9isvqYx3vL
	 Q/HVifD833fUhgvKYGPP7S4IlMrE6JSPa9voBmb91xFaix4ZhJYSmPC6QYNW2zBWtN9QE
	 XHNcrXIkInLWeT+ARTOv4zFWfb6sNwIwBlqw+AMbFkMNEyp45A+HnsSr8/aExFHNQf6Gt
	 2b9nYAJP5kkBzqlTK+VLtBFC8CF58KjaBsofHl3I9U5pWb9XdXnbcQQSUcDoHEKyvKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793350252;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=QHudfTXL29erVF/iYtCMFPfPaLDRerjlwrKIl7h7JxI=;
	b=v8NPjQVexoLSvY5IjyhM1E3I3tuDq9vUfn+oeFU11Z5xnY8mgqNBJK7SMjOl2O6e9SHT
	 Hs5rjuOrlRoOnPWNgEk2/flvFAJ48HyOJJijiBV66W3iz7s94MSfzIuUROZwteG5EIznf
	 ULnTeAc546dVZYUVbwOlr2QxOM3jZUeM473GQcNap08O+mpkHKvZNg5YvoM38RGzZALfY
	 SyIUfOC7Jz5ZpkP1kSAqp2m1BRRJNUnAsK96th7lRXFm+xKcPLMjV1WPwvWEmPeNooUZr
	 08INgnQ55AbNA/x9bmNR74Nz88DZYrK492p/g5kALS08sQpXlRgm6KXUmBnbbscmRHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SeXxdAUa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDFD3606A320
	for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 08:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SeXxdAUa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67F7D1F0093A;
	Fri, 30 Oct 2026 08:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793350251;
	bh=QHudfTXL29erVF/iYtCMFPfPaLDRerjlwrKIl7h7JxI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SeXxdAUaXCmhzp7Ex7tfTdEgGZ8uKwUCeq2LQ2ioigBdjLsblC+SO/sFfZ1qHAe9o
	 3bBNPe7hvlop66ldzkdFyBM0qs/YP8luFkoav98cVo7rvKGQBDWM+5bwtkmtK97eY6
	 mrfH7S8GlIF9FkBcQnhQzxArCfcNrm7QmD2jCoZg8IKC9SUpjWWRgcJMYbpekkYTo1
	 8NJi2SF8LTtPsqLOOwAQRLtlcSXr+6RaDfuWrVkJfV4eLV1tGYo48TXVJ76tS3rNRA
	 RY9DHPPDhjZyJZNGHDNwEGvocKKrm+nNnMB+O+dRHx1Tq7dtMJcumb7+YwYwAi4c+p
	 VcHMo+qWZAG5g==
Message-ID: <sashiko-outbox-190715@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] thunderbolt: add support optional dedicated wakeup
 irq
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chunfeng Yun" <chunfeng.yun@mediatek.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261030082539.1208733-3-chunfeng.yun@mediatek.com>
References: <20261030082539.1208733-1-chunfeng.yun@mediatek.com>
 <20261030082539.1208733-3-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 08:50:50 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Medium] thunderbolt: wake_irq never armed for suspend due to unset can_w=
akeup
- [Medium] thunderbolt: wake_irq leaked on nhi_probe() error after nhi_plat=
_init_irq()
- [Medium] thunderbolt: nhi_plat_probe() ignores -EPROBE_DEFER for optional=
 wake_irq
- [Low] thunderbolt: missing kernel-doc entry for wake_irq in struct tb_nhi
--

commit 0039f17f466f2a19ba5fd45e19c6de293662f588
Author: Chunfeng Yun <chunfeng.yun@mediatek.com>

thunderbolt: add support optional dedicated wakeup irq

This commit adds support for an optional dedicated wakeup IRQ to the
platform Thunderbolt NHI driver for NVIDIA N1/N2 SoCs.

> diff --git a/drivers/thunderbolt/plat.c b/drivers/thunderbolt/plat.c
> index 85a00cd391d4e..8d83b484d942c 100644
> --- a/drivers/thunderbolt/plat.c
> +++ b/drivers/thunderbolt/plat.c
> @@ -11,6 +11,7 @@
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/pm_wakeirq.h>
>  #include <linux/slab.h>
> =20
>  #include "nhi.h"
> @@ -46,6 +47,15 @@ static int nhi_plat_init_irq(struct tb_nhi *nhi)
>  	if (ret)
>  		return dev_err_probe(nhi->dev, ret, "request irq failed\n");
> =20
> +	if (nhi->wake_irq) {
> +		ret =3D dev_pm_set_dedicated_wake_irq(nhi->dev, nhi->wake_irq);
> +		if (ret) {
> +			dev_err_probe(nhi->dev, ret, "set wake irq %d failed\n", nhi->wake_ir=
q);
> +			return ret;
> +		}
> +		dev_info(nhi->dev, "wake irq %d\n", nhi->wake_irq);
> +	}

[Severity: Medium]
Will nhi->wake_irq ever be armed for system suspend when dev->power.can_wak=
eup
has not been set on the platform device?

In nhi_plat_probe() -> nhi_probe() -> nhi_plat_init_irq(),
dev_pm_set_dedicated_wake_irq(nhi->dev, nhi->wake_irq) attaches wirq to
dev->power.wakeirq while dev->power.wakeup is still NULL. Later at the end =
of
nhi_probe() in drivers/thunderbolt/nhi.c:

	device_wakeup_enable(dev);

In drivers/base/power/wakeup.c, device_wakeup_enable() checks:

	if (!dev || !dev->power.can_wakeup)
		return -EINVAL;

Unlike PCI devices (where pci_pm_init() marks the device wakeup-capable),
neither the platform bus nor nhi_plat_probe() / nhi_plat_init_irq() calls
device_set_wakeup_capable(nhi->dev, true) or device_init_wakeup(nhi->dev,
true) for DT or ACPI platform devices without _PRW. As a result,
device_wakeup_enable() returns -EINVAL, dev->power.wakeup remains NULL,
device_may_wakeup() returns false in nhi_suspend_noirq() and
nhi_poweroff_noirq(), and device_wakeup_arm_wake_irqs() never arms
nhi->wake_irq during system suspend.

Should device_set_wakeup_capable(nhi->dev, true) be called before
device_wakeup_enable(dev) is invoked?

> +
>  	return 0;
>  }
> =20
> @@ -53,6 +63,7 @@ static void nhi_plat_exit(struct tb_nhi *nhi)
>  {
>  	devm_free_irq(nhi->dev, nhi->irq, nhi);
>  	flush_work(&nhi->interrupt_work);
> +	dev_pm_clear_wake_irq(nhi->dev);

[Severity: Medium]
Does this leak the dedicated wake_irq if nhi_probe() fails after
nhi_plat_init_irq() succeeds?

Unlike devm_request_irq() used for nhi->irq, dev_pm_set_dedicated_wake_irq()
is not devres-managed: it allocates struct wake_irq, requests a threaded IR=
Q,
and sets dev->power.wakeirq. However, dev_pm_clear_wake_irq(nhi->dev) is on=
ly
called in nhi_plat_exit() via nhi_shutdown().

In drivers/thunderbolt/nhi.c, nhi_probe() has several error paths after
nhi->ops->init_interrupts(nhi) that return directly without calling
nhi_shutdown():

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

If any of those steps fail, the requested threaded wake IRQ and struct
wake_irq remain allocated and dev->power.wakeirq stays set, causing any lat=
er
probe attempt to fail with -EEXIST or -EBUSY. Could devm_add_action_or_rese=
t()
or proper error unwinding be used to ensure dev_pm_clear_wake_irq() is call=
ed
on probe failure?

> =20
>  	pm_runtime_put_noidle(nhi->dev);
>  	pm_runtime_disable(nhi->dev);
> @@ -85,6 +96,11 @@ static int nhi_plat_probe(struct platform_device *pdev)
>  	if (nhi->irq < 0)
>  		return dev_err_probe(dev, nhi->irq, "get irq failed\n");
> =20
> +	/* ignore error */
> +	nhi->wake_irq =3D platform_get_irq_optional(pdev, 1);
> +	if (nhi->wake_irq < 0)
> +		nhi->wake_irq =3D 0;

[Severity: Medium]
Can this silently drop -EPROBE_DEFER when the optional wake_irq provider is
not ready yet?

In nhi_plat_probe(), platform_get_irq_optional(pdev, 1) returns -ENXIO when
the optional interrupt is absent, but returns -EPROBE_DEFER (or another
negative error code) if the interrupt is specified in firmware and its
interrupt controller has not probed yet. Clamping all negative values to 0
causes probe to proceed without the wakeup IRQ instead of deferring.

Should this only ignore -ENXIO and return dev_err_probe() on other negative
errors?

> diff --git a/include/linux/thunderbolt.h b/include/linux/thunderbolt.h
> index 212c8fea65711..06b90d452ee24 100644
> --- a/include/linux/thunderbolt.h
> +++ b/include/linux/thunderbolt.h
> @@ -533,6 +533,7 @@ struct tb_nhi {
>  	bool going_away;
>  	bool iommu_dma_protection;
>  	int irq;
> +	int wake_irq;

[Severity: Low]
This isn't a bug, but struct tb_nhi in include/linux/thunderbolt.h has a
kernel-doc comment block above it; should @wake_irq be documented there to
avoid a kernel-doc warning under W=3D1 builds?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030082539.1208=
733-1-chunfeng.yun@mediatek.com?part=3D2
