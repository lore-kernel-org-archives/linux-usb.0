Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793349631;
	b=wu/bhfNjVqxXG5VE8MxzLFH8kjO0Y8fvsUgzBsEV2mB2er+G12ucpR5hdcfUk/GGxDUn
	 ASkpngOtbQxXNJ6OdkjraquMvdpSFysWNzQUJ6wvTH+IXibXOSVk/S9HMjMqUS59A5P7o
	 PEOAMSuJJ1YWMj+syGaj2uJ3QTJgFVNt4cvB2IPaK78CCgsz9OXeOp9KWRgtYbtZJj4+R
	 ZBX2YJq0hkTjysjxl62/4cGoBOu8jM4limeXzsR07ru612ezpWOKcEpyDp1d+2BELFr9y
	 z1MbIXzU1hitbfv+PMIh8edL1QyTSvwjwaIOluTeASmnLC8hNzrUYucsem18uC8WXCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793349631;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=vSMGinJHIesqam+8moW+op/gcrDs/oHf97jA91JeeUQ=;
	b=FDMH1IxL4+Uc62VcONk6kSt+yxafdycgpYeFU7BFGH4rMzrg13y8h7/vAAnSdxwX8x1R
	 DFYmL57wwjc3faimtgn1DXBkH6Vq+bDI8s7l+jSxF8TKWDkDN+IGPrSV0I7SJxljF6C7D
	 xl24NUsGgvO7mC4r1c9CDGeB1gsCOenrupT0UWe8dxEP9GO8A/Ke35oXmPIccuSAPHPeD
	 uERM5mYvzLtioDNTQfgQhe1d+b5xW//D/qQCTiyJBHEGCOCYHjhNK8Squ26JgQ63mLJAo
	 2ipPSk2uUmBCnRPm13DjeWASfrI2cn4cxRznBvBGSJ3tTmtb2Bto1dyOsp7gOUJ8XNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ht0/Yxuo";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A78606A32E
	for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 08:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ht0/Yxuo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 478A81F000C1;
	Fri, 30 Oct 2026 08:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793349630;
	bh=vSMGinJHIesqam+8moW+op/gcrDs/oHf97jA91JeeUQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ht0/YxuoXmFNfSm+boiu1ZF7piRKyzY3YCfh1beAn5ovNFfWMdrJxG8fRAv/NZYRV
	 aUviANaDrGq7ouw+AaD3/ITKqoOYcLz009N1FJTXTfdEoBYTzixla3qzydPsd7/EIq
	 DJ5BiXndHXq0MMeYf5cvRomEPaB+PbbrAy6LMiWKY51KALvKrnLs9QjZsWemKjPxhT
	 xYaCtIEchyJYSFQdN3KfHnsKV7kyu2YHzLK4vXhmA5fbLg4BeFNSbfwXOc0RKnIXHO
	 J0THHhEZ+/fxKL9dHXhoQF1XDxCzKspxTxOexTQAVucLlFHlF9aZttaSeHw4jxGFMV
	 EeMgHu9ppoaOg==
Message-ID: <sashiko-outbox-190706@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] thunderbolt: add platform nhi driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chunfeng Yun" <chunfeng.yun@mediatek.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261030082539.1208733-2-chunfeng.yun@mediatek.com>
References: <20261030082539.1208733-1-chunfeng.yun@mediatek.com>
 <20261030082539.1208733-2-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 08:40:29 +0000
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
- [High] thunderbolt: duplicate module_init() across domain.c, pci.c, and p=
lat.c
- [High] thunderbolt: invalid to_pci_dev() cast on platform device in icm_p=
robe()
- [High] thunderbolt: missing nhi_shutdown() cleanup on nhi_probe() error p=
aths
- [Medium] thunderbolt: double pm_runtime_disable() in nhi_plat_init() and =
exit
- [Low] thunderbolt: missing kernel-doc entry for irq member in struct tb_n=
hi
- [Low] thunderbolt: undocumented DT compatible and redundant calls in plat=
.c
- [Low] thunderbolt: nhi_plat_isr() in plat.c duplicates nhi_msi() in nhi.c
--

commit 27d62cb037ec7e4b78f736b27dff7bee6d842f3a
Author: Chunfeng Yun <chunfeng.yun@mediatek.com>

thunderbolt: add platform nhi driver

This commit adds a platform bus NHI driver in drivers/thunderbolt/plat.c and
converts domain.c and pci.c to use separate initcall and module_pci_driver
registrations.

> diff --git a/drivers/thunderbolt/Makefile b/drivers/thunderbolt/Makefile
> index beb054c3126b1..9c941682f3d6c 100644
> --- a/drivers/thunderbolt/Makefile
> +++ b/drivers/thunderbolt/Makefile
> @@ -3,7 +3,7 @@ ccflags-y :=3D -I$(src)
>  obj-${CONFIG_USB4} :=3D thunderbolt.o
>  thunderbolt-objs :=3D nhi.o ctl.o tb.o switch.o cap.o pci.o path.o tunne=
l.o eeprom.o
>  thunderbolt-objs +=3D domain.o dma_port.o icm.o property.o xdomain.o lc.=
o tmu.o usb4.o
> -thunderbolt-objs +=3D usb4_port.o nvm.o retimer.o quirks.o clx.o
> +thunderbolt-objs +=3D usb4_port.o nvm.o retimer.o quirks.o clx.o plat.o
> =20
>  thunderbolt-${CONFIG_ACPI} +=3D acpi.o
>  thunderbolt-$(CONFIG_DEBUG_FS) +=3D debugfs.o
> diff --git a/drivers/thunderbolt/domain.c b/drivers/thunderbolt/domain.c
> index 24611f05b3cda..bec7e6ebc4a88 100644
> --- a/drivers/thunderbolt/domain.c
> +++ b/drivers/thunderbolt/domain.c
> @@ -881,7 +881,7 @@ int tb_domain_unregister_unplugged_xdomains(struct tb=
 *tb)
>  	return ctx.n;
>  }
> =20
> -int tb_domain_init(void)
> +static int __init tb_domain_init(void)
>  {
>  	int ret;
> =20
> @@ -907,7 +907,7 @@ int tb_domain_init(void)
>  	return ret;
>  }
> =20
> -void tb_domain_exit(void)
> +static void __exit tb_domain_exit(void)
>  {
>  	bus_unregister(&tb_bus_type);
>  	ida_destroy(&tb_domain_ida);
> @@ -917,3 +917,9 @@ void tb_domain_exit(void)
>  	tb_debugfs_exit();
>  	tb_configfs_exit();
>  }
> +
> +subsys_initcall(tb_domain_init);
> +module_exit(tb_domain_exit);
> +
> +MODULE_DESCRIPTION("Thunderbolt/USB4 domain driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
> index e99a3fcc4a299..c0f9f1855e8f3 100644
> --- a/drivers/thunderbolt/nhi.c
> +++ b/drivers/thunderbolt/nhi.c
> @@ -1379,8 +1379,10 @@ int nhi_probe(struct tb_nhi *nhi)
>  	device_wakeup_enable(dev);
> =20
>  	pm_runtime_allow(dev);
> +	device_enable_async_suspend(dev);
>  	pm_runtime_set_autosuspend_delay(dev, TB_AUTOSUSPEND_DELAY);
>  	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_mark_last_busy(dev);
>  	pm_runtime_put_autosuspend(dev);
> =20
>  	return 0;

[ ... ]

> diff --git a/drivers/thunderbolt/pci.c b/drivers/thunderbolt/pci.c
> index 4408229d8ac7b..91d2363007034 100644
> --- a/drivers/thunderbolt/pci.c
> +++ b/drivers/thunderbolt/pci.c
> @@ -715,7 +715,7 @@ static struct pci_device_id nhi_ids[] =3D {
>  };
> =20
>  MODULE_DEVICE_TABLE(pci, nhi_ids);
> -MODULE_DESCRIPTION("Thunderbolt/USB4 core driver");
> +MODULE_DESCRIPTION("Thunderbolt/USB4 PCI host interface driver");
>  MODULE_LICENSE("GPL");
> =20
>  static struct pci_driver nhi_driver =3D {
> @@ -727,26 +727,4 @@ static struct pci_driver nhi_driver =3D {
>  	.driver.pm =3D &nhi_pm_ops,
>  };
> =20
> -static int __init nhi_init(void)
> -{
> -	int ret;
> -
> -	ret =3D tb_domain_init();
> -	if (ret)
> -		return ret;
> -
> -	ret =3D pci_register_driver(&nhi_driver);
> -	if (ret)
> -		tb_domain_exit();
> -
> -	return ret;
> -}
> -
> -static void __exit nhi_unload(void)
> -{
> -	pci_unregister_driver(&nhi_driver);
> -	tb_domain_exit();
> -}
> -
> -rootfs_initcall(nhi_init);
> -module_exit(nhi_unload);
> +module_pci_driver(nhi_driver);

[Severity: High]
Does this break modular builds when CONFIG_USB4=3Dm?

In drivers/thunderbolt/Makefile, domain.o, pci.o, and plat.o are all linked
into the single thunderbolt.o module. When CONFIG_USB4=3Dm,
subsys_initcall(tb_domain_init) and module_exit(tb_domain_exit) in domain.c,
module_pci_driver(nhi_driver) in pci.c, and
module_platform_driver(nhi_plat_driver) in plat.c all expand to definitions
of init_module and cleanup_module, causing multiple-definition linker errors
(along with duplicate MODULE_DESCRIPTION and MODULE_LICENSE entries).

Also, when CONFIG_USB4=3Dy, decoupling tb_domain_init() from driver registr=
ation
means pci_register_driver(&nhi_driver) and
platform_driver_register(&nhi_plat_driver) will still run even if
tb_domain_init() fails, and replacing rootfs_initcall(nhi_init) with
module_pci_driver(nhi_driver) moves PCI NHI initialization back to
device_initcall, before rootfs_initcall IOMMU initialization (regressing
commit eafa717bc145 ("thunderbolt: Initialize after IOMMUs")).

Should thunderbolt.ko keep a single module init/exit pair that initializes
the domain first, registers both the PCI and platform drivers in order, and
unregisters them before calling tb_domain_exit()?

> diff --git a/drivers/thunderbolt/plat.c b/drivers/thunderbolt/plat.c
> new file mode 100644
> index 0000000000000..85a00cd391d4e
> --- /dev/null
> +++ b/drivers/thunderbolt/plat.c
> @@ -0,0 +1,155 @@

[ ... ]

> +static int nhi_plat_init(struct tb_nhi *nhi)
> +{
> +	/*
> +	 * avoid device link fail for pcie tunnel
> +	 */
> +	pm_runtime_set_active(nhi->dev);
> +	pm_runtime_get_noresume(nhi->dev);
> +	devm_pm_runtime_enable(nhi->dev);
> +
> +	return 0;
> +}
> +
> +static irqreturn_t nhi_plat_isr(int irq, void *data)
> +{
> +	struct tb_nhi *nhi =3D data;
> +	schedule_work(&nhi->interrupt_work);
> +	return IRQ_HANDLED;
> +}

[Severity: Low]
This isn't a bug, but nhi_plat_isr() is identical to nhi_msi() in
drivers/thunderbolt/nhi.c, which is already declared in nhi.h. Could
nhi_plat_init_irq() reuse nhi_msi() directly instead of duplicating it here?

> +
> +static int nhi_plat_init_irq(struct tb_nhi *nhi)
> +{
> +	int ret;
> +
> +	INIT_WORK(&nhi->interrupt_work, nhi_interrupt_work);
> +
> +	ret =3D devm_request_irq(nhi->dev, nhi->irq, nhi_plat_isr, IRQF_NO_SUSP=
END,
> +			       dev_name(nhi->dev), nhi);
> +	if (ret)
> +		return dev_err_probe(nhi->dev, ret, "request irq failed\n");
> +
> +	return 0;
> +}
> +
> +static void nhi_plat_exit(struct tb_nhi *nhi)
> +{
> +	devm_free_irq(nhi->dev, nhi->irq, nhi);
> +	flush_work(&nhi->interrupt_work);
> +
> +	pm_runtime_put_noidle(nhi->dev);
> +	pm_runtime_disable(nhi->dev);
> +	pm_runtime_set_suspended(nhi->dev);
> +}

[Severity: Medium]
Won't calling devm_pm_runtime_enable(nhi->dev) in nhi_plat_init() and
pm_runtime_disable(nhi->dev) in nhi_plat_exit() disable runtime PM twice on
driver removal or probe failure?

When nhi_plat_init() calls devm_pm_runtime_enable(nhi->dev) (whose return
value is also unchecked), devres registers pm_runtime_disable_action() to
call pm_runtime_disable() automatically on detach. When nhi_plat_remove() ->
nhi_shutdown() -> nhi_plat_exit() calls pm_runtime_disable(nhi->dev)
manually, and devres then runs pm_runtime_disable_action(),
dev->power.disable_depth is incremented to 2, leaving runtime PM disabled if
the device is bound again.

[Severity: High]
What happens if nhi_probe() fails after nhi_plat_init_irq() or
nhi_plat_init(), but before tb_domain_add()?

In drivers/thunderbolt/nhi.c:

nhi_probe()
    nhi->ops->init_interrupts(nhi); -> nhi_plat_init_irq()
    dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
    nhi->ops->init(nhi); -> nhi_plat_init()
    tb =3D nhi_select_cm(nhi);
    if (!tb)
        return dev_err_probe(...);

If dma_set_mask_and_coherent(), nhi->ops->init(), or nhi_select_cm() fails,
nhi_probe() returns without calling nhi_shutdown(nhi). As a result,
nhi_plat_exit() is not called: the runtime PM reference acquired by
pm_runtime_get_noresume(nhi->dev) in nhi_plat_init() is leaked, and devres
will free the IRQ and the devm-allocated struct tb_nhi without calling
flush_work(&nhi->interrupt_work), which can leave nhi_interrupt_work running
on freed memory.

> +
> +static const struct tb_nhi_ops nhi_plat_default_ops =3D {
> +	.init =3D nhi_plat_init,
> +	.shutdown =3D nhi_plat_exit,
> +	.init_interrupts =3D nhi_plat_init_irq,
> +};
> +
> +static int nhi_plat_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct tb_nhi *nhi;
> +
> +	nhi =3D devm_kzalloc(dev, sizeof(*nhi), GFP_KERNEL);
> +	if (!nhi)
> +		return -ENOMEM;
> +
> +	nhi->dev =3D dev;
> +	nhi->ops =3D &nhi_plat_default_ops;
> +
> +	nhi->iobase =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(nhi->iobase))
> +		return PTR_ERR(nhi->iobase);
> +
> +	nhi->irq =3D platform_get_irq(pdev, 0);
> +	if (nhi->irq < 0)
> +		return dev_err_probe(dev, nhi->irq, "get irq failed\n");
> +
> +	return nhi_probe(nhi);
> +}

[Severity: High]
Can nhi_plat_probe() -> nhi_probe() -> nhi_select_cm() -> icm_probe() cause
an out-of-bounds read on nhi->dev?

In nhi_plat_probe(), nhi->dev is &pdev->dev (a struct platform_device).
nhi_probe() calls nhi_select_cm(nhi):

drivers/thunderbolt/nhi.c:nhi_select_cm() {
    ...
    if (!tb_acpi_is_native()) {
        tb =3D icm_probe(nhi);
        if (tb)
            return tb;
    }
    ...
}

When CONFIG_ACPI=3Dy, tb_acpi_is_native() returns false on all Device Tree
boots (such as on MediaTek SoCs) as well as on ACPI boots where firmware has
not granted native USB4 control. icm_probe() then unconditionally casts
nhi->dev to struct pci_dev:

drivers/thunderbolt/icm.c:icm_probe() {
    struct pci_dev *pdev =3D to_pci_dev(nhi->dev);
    ...
    switch (pdev->device) {

Because nhi->dev is embedded in a struct platform_device rather than a
struct pci_dev, to_pci_dev(nhi->dev) computes an invalid container pointer
and reads pdev->device out of bounds before the start of the platform_device
allocation. Should icm_probe() check dev_is_pci(nhi->dev) first?

[ ... ]

> +#ifdef CONFIG_OF
> +static const struct of_device_id nhi_plat_of_match[] =3D {
> +	{ .compatible =3D "thunderbolt-platform" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, nhi_plat_of_match);
> +#endif
> +
> +#ifdef CONFIG_ACPI
> +static const struct acpi_device_id nhi_plat_acpi_match[] =3D {
> +	{ "ACPI0015", 0 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, nhi_plat_acpi_match);
> +#endif

[Severity: Low]
This isn't a runtime bug, but there are a few binding and cleanup issues he=
re:

1. The commit message states this driver is for MediaTek mt8901/mt8992 SoCs,
   but nhi_plat_of_match uses a generic "thunderbolt-platform" compatible
   string that is not documented in Documentation/devicetree/bindings/, and
   nhi_plat_acpi_match adds "ACPI0015" without mention in the commit messag=
e.
   Should the DT compatible use a documented SoC-specific binding?

2. In nhi_plat_probe(), platform_get_irq() already calls dev_err_probe() on
   failure, so calling dev_err_probe() again on nhi->irq < 0 logs a duplica=
te
   message. Similarly, nhi_plat_init_irq() calls dev_err_probe() and its
   caller nhi_probe() calls dev_err_probe() again on the returned error.

3. In nhi_probe(), calling pm_runtime_mark_last_busy(dev) right before
   pm_runtime_put_autosuspend(dev) is redundant because
   pm_runtime_put_autosuspend() already calls pm_runtime_mark_last_busy().

[ ... ]

> diff --git a/include/linux/thunderbolt.h b/include/linux/thunderbolt.h
> index 57502da290805..212c8fea65711 100644
> --- a/include/linux/thunderbolt.h
> +++ b/include/linux/thunderbolt.h
> @@ -532,6 +532,7 @@ struct tb_nhi {
>  	u32 *interrupt_mask;
>  	bool going_away;
>  	bool iommu_dma_protection;
> +	int irq;
>  	struct work_struct interrupt_work;
>  	u32 hop_count;
>  	unsigned long quirks;

[Severity: Low]
struct tb_nhi has a kernel-doc comment block right above its definition.
Could @irq be added to that kernel-doc comment so W=3D1 builds do not warn
about an undescribed struct member?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030082539.1208=
733-1-chunfeng.yun@mediatek.com?part=3D1
