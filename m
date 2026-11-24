Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795536590;
	b=afgRVcR+ORqY1Nt5MYhcMZrgDWAfpBqJMeW1z9JCUKvK4VYvAZOFlWJJpULFa3S+MzR1
	 yid8AjrNmSzUFNpbOcKC84fRkfAwo7IVORvEIgM2KDXZhKaddr4Ao0sBs8JnL42NqhJ9h
	 MbFsutRefhPnPl4wefzH+vVmNOxu5TFP+VgzyzEJjrDP5sOOvlbzEfs3aiERAmoOxSYER
	 nAhSg2uMmMTM/K2r8M5O+zIv43bGzkxhfSX4auZv9azUPdv2VUxK52zYkWVVYD6YnaN13
	 AD3RvmBTOWr/zX+/uqOzXDcGrVZ0psPj7VUXrpFe2m4tayPHqCt0a9aH1/VbOMmSbGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795536590;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=TEfWbgH5n8m6wnjvvj9bq97jvlJW6gpIdlhIUJNhzvE=;
	b=MDzxx26dCeOJOvwqQVdZ88puAOKtSbTGXels1jKFI/gLgLJrQRMqRU62KdqHUUBQDya/
	 Pu8xJ7ZXR3u8IXPWTSbz0Mqo2mMAFD0/uJBCUsvuSM+i9eExN3bbONaqeM0/sOnwuNUM0
	 Cv+OolFXFeNxBu4VpiL2U3H1El+R8vlg2UI57UqIwTQopslfuRIjr5POX781Yf1SFm539
	 wIzvvsvAXrGDzOQu8HZHM4XA0iQGqp9PouwEr586WLgXsundc9XhEM1BvRHbVU3sL0BGy
	 lVQFkUiTQC0l7wjasepmsUhBHwM/Hw7JQy+8iLfArYxdxiJOWkOcaz0Me6YUhYqT+Ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AIanoQVj;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020A0606A31E;
	Tue, 24 Nov 2026 16:09:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 020A0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AIanoQVj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795536590; x=1827072590;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=u3PhYphT4mdfPdZi1G74mqjUfqkml1ZLpURLu+JHDXo=;
  b=AIanoQVjD6du5U252GUHVrRmaJeg7hU34rFjJhifSwE9rpGTuQoc+YCi
   mHl5gcwd4vhu++uGHw8G5Sp0frnzTDSUJKDw6Pa2S9d1BCUo4IyU4lLo3
   KBT76uJ7fF8T9qPtL7OQtgKk4PMc0/EzlwGQoXzIP+W/mbbhraknX9Zj8
   EcY1OF8VC+aGOJqvV3BzMY+cDt+KpoA9TmH5aUu358i9qcBavBhn3vdg7
   OOgwfLeWuZ+akO2c7oyUW9ynZNh3LLv3qaFus8yBxeoVnUrjUIKrzhfY8
   SJzKlnDHo9pxzsW/GFAniUsxSGi7js7VcJNm1fnXMN/uRTgjndZF7CJJ7
   g==;
X-CSE-ConnectionGUID: rF9lyOqRQryj+rbYK+L9lQ==
X-CSE-MsgGUID: lxoKhBawSUeoISykXcCtbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4405594"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4405594"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 07:55:56 -0800
X-CSE-ConnectionGUID: DzTZy3gURLixZM7/qy4Jug==
X-CSE-MsgGUID: Qgla0oTjQ3KKKw0Togge9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="11799258"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 24 Nov 2026 07:55:52 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id A32D994; Tue, 24 Nov 2026 16:55:51 +0100 (CET)
Date: Tue, 24 Nov 2026 16:55:51 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Mika Westerberg <westeri@kernel.org>,
	Andreas Noever <andreas.noever@gmail.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Sven Peter <sven@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 5/8] thunderbolt: Add platform NHI driver
Message-ID: <20261124155551.GQ229695@black.igk.intel.com>
References: <20261123113705.2297329-1-chunfeng.yun@mediatek.com>
 <20261123113705.2297329-6-chunfeng.yun@mediatek.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261123113705.2297329-6-chunfeng.yun@mediatek.com>

On Mon, Nov 23, 2026 at 07:36:52PM +0800, Chunfeng Yun wrote:
> Historically, the Thunderbolt/USB4 Native Host Interface (NHI)
> controller has been exposed as a PCI device handled by pci.c.
> However, some SoCs (such as MediaTek mt8901/mt8992) integrate
> the NHI as a memory-mapped platform device described via ACPI.
> 
> To support platform-attached NHI controllers:
> 
> Introduce platform.c to register a platform driver matching
> "ACPI0015" (ACPI), implement platform tb_nhi_ops hooks for PM,
> interrupts related;
> 
> Support an optional dedicated wake interrupt: on integrated SoCs,
> the MAC/PHY reside in a power domain whose clocks and power can be
> gated during sleep, preventing the primary NHI interrupt from
> acting as a wakeup source; so add an optional dedicated wakeup
> interrupt which comes from the always-on power domain; it is
> implementation specific.
> 
> Unlike the PCI bus core (pci_pm_suspend()), the platform bus does
> not automatically runtime-resume a runtime-suspended device prior
> to calling system suspend callbacks. Call pm_runtime_resume() in
> nhi_suspend() to ensure the controller are in an active state before
> nhi_suspend_noirq() stops them.
> 
> Clean up the unused nhi_enable_int_throttling() prototype.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v3 changes:
> * Added 'depends on ACPI' to CONFIG_USB4_PLATFORM.
> * Drop OF matching.
> * Runtime PM Fix in Suspend.
> * Cleaner Wake IRQ Handling.
> * Kernel Coding Cleanups.
> 
> v2 changes:
> * Added CONFIG_USB4_PLATFORM to build the platform driver as a separate
>   module (thunderbolt_platform.ko), instead of statically embedding it
>   into thunderbolt.o.
> * Renamed plat.c to platform.c, renamed internal functions from nhi_plat_*
>   to nhi_platform_*, and updated the Device Tree compatible string from
>   "thunderbolt-platform" to "usb4-nhi-platform".
> * Removed domain lifecycle changes (domain.c) and PCI driver cleanups
>   (pci.c) from this patch, handled by previous patches.
> * Squashed the optional dedicated wake IRQ support (previously a separate
>   patch in v1) directly into this patch.
> * Replaced the custom local ISR with the shared tb_nhi_isr(), adopted
>   the renamed tb_nhi_probe() / tb_nhi_shutdown() / tb_nhi_pm_ops
>   interfaces, and added -EPROBE_DEFER handling for the wake IRQ.
> ---
>  drivers/thunderbolt/Kconfig    |  10 ++
>  drivers/thunderbolt/Makefile   |   3 +
>  drivers/thunderbolt/nhi.c      |   8 ++
>  drivers/thunderbolt/nhi.h      |   1 -
>  drivers/thunderbolt/platform.c | 170 +++++++++++++++++++++++++++++++++
>  include/linux/thunderbolt.h    |   4 +
>  6 files changed, 195 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/thunderbolt/platform.c
> 
> diff --git a/drivers/thunderbolt/Kconfig b/drivers/thunderbolt/Kconfig
> index 80960555a364..ff4b1d4a0c19 100644
> --- a/drivers/thunderbolt/Kconfig
> +++ b/drivers/thunderbolt/Kconfig
> @@ -28,6 +28,16 @@ config USB4_PCI
>  	  To compile this driver a module, choose M here. The module will be
>  	  called thunderbolt_pci.
>  
> +config USB4_PLATFORM
> +	tristate "Support for platform USB4 and Thunderbolt controllers"
> +	depends on ACPI
> +	help
> +	  Say Y here to add support the USB4 and Thunderbolt host routers
> +	  enumerated via ACPI (such as devices matching ACPI0015).
> +
> +	  To compile this driver a module, choose M here. The module will be
> +	  called thunderbolt_platform.
> +
>  config USB4_CONFIGFS
>  	def_tristate USB4
>  	depends on CONFIGFS_FS && !(USB4=y && CONFIGFS_FS=m)
> diff --git a/drivers/thunderbolt/Makefile b/drivers/thunderbolt/Makefile
> index a563bf2b0345..334fa4ebdfc8 100644
> --- a/drivers/thunderbolt/Makefile
> +++ b/drivers/thunderbolt/Makefile
> @@ -8,6 +8,9 @@ thunderbolt-objs += usb4_port.o nvm.o retimer.o quirks.o clx.o
>  obj-${CONFIG_USB4_PCI} += thunderbolt_pci.o
>  thunderbolt_pci-y := pci.o icm.o
>  
> +obj-${CONFIG_USB4_PLATFORM} += thunderbolt_platform.o
> +thunderbolt_platform-y := platform.o
> +
>  thunderbolt-${CONFIG_ACPI} += acpi.o
>  thunderbolt-$(CONFIG_DEBUG_FS) += debugfs.o
>  thunderbolt-$(CONFIG_USB4_CONFIGFS) += configfs.o
> diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
> index f687b37aac91..e083493c50e0 100644
> --- a/drivers/thunderbolt/nhi.c
> +++ b/drivers/thunderbolt/nhi.c
> @@ -1107,6 +1107,14 @@ static int nhi_suspend(struct device *dev)
>  {
>  	struct tb *tb = dev_get_drvdata(dev);
>  
> +	/*
> +	 * Unlike the PCI bus, the platform bus does not automatically
> +	 * runtime-resume the device before invoking system suspend callbacks.
> +	 * Ensure the device is runtime-active before suspending the domain.
> +	 */
> +	if (pm_runtime_suspended(dev))
> +		pm_runtime_resume(dev);

PCI does not do that either if the drivers allow that and I don't think we
should do it here. There is no reason to wake it up here. The domain sleep
is same for both cases anyway.

> +
>  	return tb_domain_suspend(tb);
>  }
>  
> diff --git a/drivers/thunderbolt/nhi.h b/drivers/thunderbolt/nhi.h
> index 65f9daf36068..ef5d24d81251 100644
> --- a/drivers/thunderbolt/nhi.h
> +++ b/drivers/thunderbolt/nhi.h
> @@ -27,7 +27,6 @@ enum nhi_mailbox_cmd {
>  	NHI_MAILBOX_ALLOW_ALL_DEVS = 0x23,
>  };
>  
> -void nhi_enable_int_throttling(struct tb_nhi *nhi);
>  void nhi_disable_interrupts(struct tb_nhi *nhi);
>  irqreturn_t tb_nhi_isr(int irq, void *data);
>  irqreturn_t tb_ring_msix(int irq, void *data);
> diff --git a/drivers/thunderbolt/platform.c b/drivers/thunderbolt/platform.c
> new file mode 100644
> index 000000000000..05dd858ac834
> --- /dev/null
> +++ b/drivers/thunderbolt/platform.c
> @@ -0,0 +1,170 @@
> +// SPDX-License-Identifier: GPL
> +/*
> + * Thunderbolt driver - NHI driver (Platform bus specific implementation)
> + *
> + * Author: Chunfeng Yun <chunfeng.yun@mediatek.com>
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/interrupt.h>
> +#include <linux/errno.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/pm_wakeirq.h>
> +#include <linux/slab.h>
> +
> +#include "nhi.h"
> +#include "tb.h"
> +
> +static int nhi_platform_init(struct tb_nhi *nhi)
> +{
> +	/* avoid device link fail for PCIe tunnel */

Can you get rid of this comment. Each time I see it it makes me think this
is some kind of hack.

This code is here to enable runtime PM.

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
> +static int nhi_platform_init_irq(struct tb_nhi *nhi)
> +{
> +	struct device *dev = nhi->dev;
> +	int ret;
> +
> +	if (nhi->wake_irq) {
> +		ret = dev_pm_set_dedicated_wake_irq(dev, nhi->wake_irq);
> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "failed to set wake interrupt %d\n", nhi->wake_irq);

Split this to 3 lines maybe?

> +	}
> +
> +	ret = devm_request_irq(dev, nhi->irq, tb_nhi_isr, IRQF_NO_SUSPEND,
> +			       dev_name(dev), nhi);
> +	if (ret) {
> +		if (nhi->wake_irq)
> +			dev_pm_clear_wake_irq(dev);
> +
> +		return dev_err_probe(dev, ret, "failed to request interrupt %d\n", nhi->irq);

This one also after the ,

> +	}
> +
> +	return 0;
> +}
> +
> +static void nhi_platform_exit(struct tb_nhi *nhi)
> +{
> +	struct device *dev = nhi->dev;
> +
> +	/*
> +	 * Have to release the irq before calling flush_work. Otherwise an
> +	 * already executing IRQ handler could call schedule_work again.
> +	 */
> +	devm_free_irq(dev, nhi->irq, nhi);
> +	flush_work(&nhi->interrupt_work);
> +
> +	if (nhi->wake_irq)
> +		dev_pm_clear_wake_irq(dev);
> +
> +	if (pm_runtime_enabled(dev)) {

Can't you call these unconditionally?

> +		pm_runtime_put_noidle(dev);
> +		pm_runtime_disable(dev);
> +		pm_runtime_set_suspended(dev);
> +	}
> +}
> +
> +static const struct tb_nhi_ops nhi_platform_default_ops = {
> +	.init = nhi_platform_init,
> +	.shutdown = nhi_platform_exit,

nhi_platform_shutdown? Okay you use it below already but we should really
look at what goes into these "ops" structs so that they actually make
sense. It is not just a garbage bin where we can throw all random
callbacks. I feel we are already crossing that line :-(

> +	.init_interrupts = nhi_platform_init_irq,
> +};
> +
> +static int nhi_platform_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct tb_nhi *nhi;
> +
> +	nhi = devm_kzalloc_obj(dev, *nhi);
> +	if (!nhi)
> +		return -ENOMEM;
> +
> +	nhi->dev = dev;
> +	nhi->ops = &nhi_platform_default_ops;
> +
> +	nhi->iobase = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(nhi->iobase))
> +		return PTR_ERR(nhi->iobase);
> +
> +	nhi->irq = platform_get_irq(pdev, 0);

Or
	ret = platform_get_irq(pdev, 0);
	if (ret < 0)
		return ret;
	nhi->irq = ret;

this reads better INHO.

> +	if (nhi->irq < 0)
> +		return nhi->irq;
> +
> +	/*
> +	 * due to the wake interrupt is implementation specific, make it

Due

> +	 * optional, and ignore error

and end with .

> +	 */
> +	nhi->wake_irq = platform_get_irq_optional(pdev, 1);

Same here wrt. ret.

> +	if (nhi->wake_irq == -EPROBE_DEFER)
> +		return nhi->wake_irq;
> +	else if (nhi->wake_irq < 0)
> +		nhi->wake_irq = 0;
> +
> +	return tb_nhi_probe(nhi);
> +}
> +
> +static void nhi_platform_do_remove(struct platform_device *pdev, bool reset)
> +{
> +	struct tb *tb = platform_get_drvdata(pdev);
> +	struct device *dev = &pdev->dev;
> +	struct tb_nhi *nhi = tb->nhi;
> +
> +	/*
> +	 * On system shutdown/reboot force a host router reset so the
> +	 * CM asserts DPR on connected Thunderbolt 3 devices before the router
> +	 * tree is removed (see tb_stop()).
> +	 */
> +	if (reset)
> +		nhi->host_reset = true;
> +
> +	pm_runtime_get_sync(dev);
> +	pm_runtime_dont_use_autosuspend(dev);
> +
> +	tb_domain_remove(tb);
> +	wait_for_completion(&nhi->domain_released);
> +	tb_nhi_shutdown(nhi);

Isn't this pretty much same as in pci.c? Perhaps that can be factored into
a function that gets called from both?

> +}
> +
> +static void nhi_platform_remove(struct platform_device *pdev)
> +{
> +	nhi_platform_do_remove(pdev, false);
> +}
> +
> +static void nhi_platform_shutdown(struct platform_device *pdev)
> +{
> +	nhi_platform_do_remove(pdev, true);
> +}
> +
> +#ifdef CONFIG_ACPI
> +static const struct acpi_device_id nhi_platform_acpi_match[] = {
> +	{ "ACPI0015", 0 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, nhi_platform_acpi_match);
> +#endif
> +
> +static struct platform_driver nhi_platform_driver = {
> +	.probe = nhi_platform_probe,
> +	.remove = nhi_platform_remove,
> +	.shutdown = nhi_platform_shutdown,
> +	.driver = {
> +		.name = "thunderbolt",
> +		.acpi_match_table = ACPI_PTR(nhi_platform_acpi_match),
> +		.pm = &tb_nhi_pm_ops,
> +	},
> +};
> +
> +module_platform_driver(nhi_platform_driver);
> +MODULE_ALIAS("platform:thunderbolt");
> +MODULE_DESCRIPTION("Thunderbolt/USB4 platform host interface driver");
> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/thunderbolt.h b/include/linux/thunderbolt.h
> index 57502da29080..72497acac254 100644
> --- a/include/linux/thunderbolt.h
> +++ b/include/linux/thunderbolt.h
> @@ -511,6 +511,8 @@ void tb_service_properties_changed(struct tb_service *svc);
>   * @going_away: The host controller device is about to disappear so when
>   *		this flag is set, avoid touching the hardware anymore.
>   * @iommu_dma_protection: An IOMMU will isolate external-facing ports.
> + * @irq: interrupt number of NHI.

@irg: Interrupt number of ..

> + * @wake_irq: optional dedicated wakeup interrupt.

@wake_irq: Optional ..

>   * @interrupt_work: Work scheduled to handle ring interrupt when no
>   *		    MSI-X is used.
>   * @hop_count: Number of rings (end point hops) supported by NHI.
> @@ -532,6 +534,8 @@ struct tb_nhi {
>  	u32 *interrupt_mask;
>  	bool going_away;
>  	bool iommu_dma_protection;
> +	int irq;
> +	int wake_irq;
>  	struct work_struct interrupt_work;
>  	u32 hop_count;
>  	unsigned long quirks;
> -- 
> 2.45.2
