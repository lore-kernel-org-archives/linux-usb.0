Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=60.244.123.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795433865;
	b=CR2TC3oetokcdyVLhE/hAzxB1sBdL3aPcM/j9zSm4X3Qb3kxBVHAME5d4O1sFQBndfyv
	 fYTsi6ocdqtDVuujfuh7JTw5V6GBqSS5shQy9B7HSLDrzkYh5vd8TOdDCzNn0OQYlIC/Q
	 zscNJ1t/zkaqfN5y5h5wTsPCPiqfyVa4RdwmHc5peo6NMbmjiiNPUrGzrMo/Yyy3UHiJs
	 xhOY3FkadVfDKxdzZI1XtaFdnJI06IcNVmxchEvJVRZdawHVzBs3PSx8UvmTbfUbkJbdM
	 vQ5ZyZgjOu6/IBADomtgQoB1jVfE6JdS5YZAkyMbSuUSWm6Iy6j7fnQE+lte19ld1sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795433865;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=3K8C7XKKwN045SctFuHrVrBWkybVNP0CLxz+cS+fbyU=;
	b=qeW92OReIv8/Z0oBu2NdP+ipGfsOtbQCy1TC4e35xHmEYkpSXodlFQI+UjN1Fern86ox
	 48juK5uYgXSl1THixvdh4NFSjZ6rtw3MdbwyZ6LXrTjDV8r5bGXEaq3HYIfsZSxpUSVIh
	 gBLnBhO3vNcHqjni3EQ18IsyxH1FdLw9ssyTdSL/HQ3dzyZwjfInjDVDixKV3hyFV2gYb
	 EPZ0ZSA/bO7912CcIwBZaSi/tPgvavhrLBAoYvkPejNNleQMZK/Cx9NPDFsquQ0VSEM7I
	 QHNGnnnZRYBViz6sHTiaXBH4qF1N2u+Uo1XQGw/0uUohjjy65ggGPorXBr3yNdO0/MQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=uPZYhWN2;
	arc=none smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580C860A380A;
	Mon, 23 Nov 2026 11:37:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 580C860A380A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=uPZYhWN2
X-UUID: 49601426e73211f1b1788b6acf885367-20261123
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=3K8C7XKKwN045SctFuHrVrBWkybVNP0CLxz+cS+fbyU=;
	b=uPZYhWN2kGnPYrwwOugXCE9PDHom/rbWiQC4qGeFnl74y8ZeWX1ztXXBQoYpfz7+ZyWthB/lgFIEqkGp+g6yomWElhtbBQ8D5X9Z5V6rhElLiovqvO2QiLYoiaI8y0kvESmiRo0EOk7FsKiH0pL4vykpWW7yVrMeGv3CBrfNY6Q=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:9f1b94b4-d362-4393-a609-cb1218ed10cf,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0318ac,CLOUDID:9ef7f319-ae4c-4a2b-b1c4-72e411efd0c9,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 49601426e73211f1b1788b6acf885367-20261123
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1225422504; Mon, 23 Nov 2026 19:37:39 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.53; Mon, 23 Nov 2026 19:37:37 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.53 via Frontend Transport; Mon, 23 Nov 2026 19:37:36 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Mika Westerberg <westeri@kernel.org>
CC: Andreas Noever <andreas.noever@gmail.com>, Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>, Sven Peter <sven@kernel.org>, Yehezkel
 Bernat <YehezkelShB@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <linux-kernel@vger.kernel.org>,
	<linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Chunfeng Yun
	<chunfeng.yun@mediatek.com>
Subject: [PATCH v3 5/8] thunderbolt: Add platform NHI driver
Date: Mon, 23 Nov 2026 19:36:52 +0800
Message-ID: <20261123113705.2297329-6-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123113705.2297329-1-chunfeng.yun@mediatek.com>
References: <20261123113705.2297329-1-chunfeng.yun@mediatek.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

Historically, the Thunderbolt/USB4 Native Host Interface (NHI)
controller has been exposed as a PCI device handled by pci.c.
However, some SoCs (such as MediaTek mt8901/mt8992) integrate
the NHI as a memory-mapped platform device described via ACPI.

To support platform-attached NHI controllers:

Introduce platform.c to register a platform driver matching
"ACPI0015" (ACPI), implement platform tb_nhi_ops hooks for PM,
interrupts related;

Support an optional dedicated wake interrupt: on integrated SoCs,
the MAC/PHY reside in a power domain whose clocks and power can be
gated during sleep, preventing the primary NHI interrupt from
acting as a wakeup source; so add an optional dedicated wakeup
interrupt which comes from the always-on power domain; it is
implementation specific.

Unlike the PCI bus core (pci_pm_suspend()), the platform bus does
not automatically runtime-resume a runtime-suspended device prior
to calling system suspend callbacks. Call pm_runtime_resume() in
nhi_suspend() to ensure the controller are in an active state before
nhi_suspend_noirq() stops them.

Clean up the unused nhi_enable_int_throttling() prototype.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v3 changes:
* Added 'depends on ACPI' to CONFIG_USB4_PLATFORM.
* Drop OF matching.
* Runtime PM Fix in Suspend.
* Cleaner Wake IRQ Handling.
* Kernel Coding Cleanups.

v2 changes:
* Added CONFIG_USB4_PLATFORM to build the platform driver as a separate
  module (thunderbolt_platform.ko), instead of statically embedding it
  into thunderbolt.o.
* Renamed plat.c to platform.c, renamed internal functions from nhi_plat_*
  to nhi_platform_*, and updated the Device Tree compatible string from
  "thunderbolt-platform" to "usb4-nhi-platform".
* Removed domain lifecycle changes (domain.c) and PCI driver cleanups
  (pci.c) from this patch, handled by previous patches.
* Squashed the optional dedicated wake IRQ support (previously a separate
  patch in v1) directly into this patch.
* Replaced the custom local ISR with the shared tb_nhi_isr(), adopted
  the renamed tb_nhi_probe() / tb_nhi_shutdown() / tb_nhi_pm_ops
  interfaces, and added -EPROBE_DEFER handling for the wake IRQ.
---
 drivers/thunderbolt/Kconfig    |  10 ++
 drivers/thunderbolt/Makefile   |   3 +
 drivers/thunderbolt/nhi.c      |   8 ++
 drivers/thunderbolt/nhi.h      |   1 -
 drivers/thunderbolt/platform.c | 170 +++++++++++++++++++++++++++++++++
 include/linux/thunderbolt.h    |   4 +
 6 files changed, 195 insertions(+), 1 deletion(-)
 create mode 100644 drivers/thunderbolt/platform.c

diff --git a/drivers/thunderbolt/Kconfig b/drivers/thunderbolt/Kconfig
index 80960555a364..ff4b1d4a0c19 100644
--- a/drivers/thunderbolt/Kconfig
+++ b/drivers/thunderbolt/Kconfig
@@ -28,6 +28,16 @@ config USB4_PCI
 	  To compile this driver a module, choose M here. The module will be
 	  called thunderbolt_pci.
 
+config USB4_PLATFORM
+	tristate "Support for platform USB4 and Thunderbolt controllers"
+	depends on ACPI
+	help
+	  Say Y here to add support the USB4 and Thunderbolt host routers
+	  enumerated via ACPI (such as devices matching ACPI0015).
+
+	  To compile this driver a module, choose M here. The module will be
+	  called thunderbolt_platform.
+
 config USB4_CONFIGFS
 	def_tristate USB4
 	depends on CONFIGFS_FS && !(USB4=y && CONFIGFS_FS=m)
diff --git a/drivers/thunderbolt/Makefile b/drivers/thunderbolt/Makefile
index a563bf2b0345..334fa4ebdfc8 100644
--- a/drivers/thunderbolt/Makefile
+++ b/drivers/thunderbolt/Makefile
@@ -8,6 +8,9 @@ thunderbolt-objs += usb4_port.o nvm.o retimer.o quirks.o clx.o
 obj-${CONFIG_USB4_PCI} += thunderbolt_pci.o
 thunderbolt_pci-y := pci.o icm.o
 
+obj-${CONFIG_USB4_PLATFORM} += thunderbolt_platform.o
+thunderbolt_platform-y := platform.o
+
 thunderbolt-${CONFIG_ACPI} += acpi.o
 thunderbolt-$(CONFIG_DEBUG_FS) += debugfs.o
 thunderbolt-$(CONFIG_USB4_CONFIGFS) += configfs.o
diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index f687b37aac91..e083493c50e0 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -1107,6 +1107,14 @@ static int nhi_suspend(struct device *dev)
 {
 	struct tb *tb = dev_get_drvdata(dev);
 
+	/*
+	 * Unlike the PCI bus, the platform bus does not automatically
+	 * runtime-resume the device before invoking system suspend callbacks.
+	 * Ensure the device is runtime-active before suspending the domain.
+	 */
+	if (pm_runtime_suspended(dev))
+		pm_runtime_resume(dev);
+
 	return tb_domain_suspend(tb);
 }
 
diff --git a/drivers/thunderbolt/nhi.h b/drivers/thunderbolt/nhi.h
index 65f9daf36068..ef5d24d81251 100644
--- a/drivers/thunderbolt/nhi.h
+++ b/drivers/thunderbolt/nhi.h
@@ -27,7 +27,6 @@ enum nhi_mailbox_cmd {
 	NHI_MAILBOX_ALLOW_ALL_DEVS = 0x23,
 };
 
-void nhi_enable_int_throttling(struct tb_nhi *nhi);
 void nhi_disable_interrupts(struct tb_nhi *nhi);
 irqreturn_t tb_nhi_isr(int irq, void *data);
 irqreturn_t tb_ring_msix(int irq, void *data);
diff --git a/drivers/thunderbolt/platform.c b/drivers/thunderbolt/platform.c
new file mode 100644
index 000000000000..05dd858ac834
--- /dev/null
+++ b/drivers/thunderbolt/platform.c
@@ -0,0 +1,170 @@
+// SPDX-License-Identifier: GPL
+/*
+ * Thunderbolt driver - NHI driver (Platform bus specific implementation)
+ *
+ * Author: Chunfeng Yun <chunfeng.yun@mediatek.com>
+ */
+
+#include <linux/acpi.h>
+#include <linux/interrupt.h>
+#include <linux/errno.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/pm_wakeirq.h>
+#include <linux/slab.h>
+
+#include "nhi.h"
+#include "tb.h"
+
+static int nhi_platform_init(struct tb_nhi *nhi)
+{
+	/* avoid device link fail for PCIe tunnel */
+	pm_runtime_set_active(nhi->dev);
+	pm_runtime_get_noresume(nhi->dev);
+	pm_runtime_enable(nhi->dev);
+
+	device_set_wakeup_capable(nhi->dev, true);
+	device_enable_async_suspend(nhi->dev);
+
+	return 0;
+}
+
+static int nhi_platform_init_irq(struct tb_nhi *nhi)
+{
+	struct device *dev = nhi->dev;
+	int ret;
+
+	if (nhi->wake_irq) {
+		ret = dev_pm_set_dedicated_wake_irq(dev, nhi->wake_irq);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "failed to set wake interrupt %d\n", nhi->wake_irq);
+	}
+
+	ret = devm_request_irq(dev, nhi->irq, tb_nhi_isr, IRQF_NO_SUSPEND,
+			       dev_name(dev), nhi);
+	if (ret) {
+		if (nhi->wake_irq)
+			dev_pm_clear_wake_irq(dev);
+
+		return dev_err_probe(dev, ret, "failed to request interrupt %d\n", nhi->irq);
+	}
+
+	return 0;
+}
+
+static void nhi_platform_exit(struct tb_nhi *nhi)
+{
+	struct device *dev = nhi->dev;
+
+	/*
+	 * Have to release the irq before calling flush_work. Otherwise an
+	 * already executing IRQ handler could call schedule_work again.
+	 */
+	devm_free_irq(dev, nhi->irq, nhi);
+	flush_work(&nhi->interrupt_work);
+
+	if (nhi->wake_irq)
+		dev_pm_clear_wake_irq(dev);
+
+	if (pm_runtime_enabled(dev)) {
+		pm_runtime_put_noidle(dev);
+		pm_runtime_disable(dev);
+		pm_runtime_set_suspended(dev);
+	}
+}
+
+static const struct tb_nhi_ops nhi_platform_default_ops = {
+	.init = nhi_platform_init,
+	.shutdown = nhi_platform_exit,
+	.init_interrupts = nhi_platform_init_irq,
+};
+
+static int nhi_platform_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct tb_nhi *nhi;
+
+	nhi = devm_kzalloc_obj(dev, *nhi);
+	if (!nhi)
+		return -ENOMEM;
+
+	nhi->dev = dev;
+	nhi->ops = &nhi_platform_default_ops;
+
+	nhi->iobase = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(nhi->iobase))
+		return PTR_ERR(nhi->iobase);
+
+	nhi->irq = platform_get_irq(pdev, 0);
+	if (nhi->irq < 0)
+		return nhi->irq;
+
+	/*
+	 * due to the wake interrupt is implementation specific, make it
+	 * optional, and ignore error
+	 */
+	nhi->wake_irq = platform_get_irq_optional(pdev, 1);
+	if (nhi->wake_irq == -EPROBE_DEFER)
+		return nhi->wake_irq;
+	else if (nhi->wake_irq < 0)
+		nhi->wake_irq = 0;
+
+	return tb_nhi_probe(nhi);
+}
+
+static void nhi_platform_do_remove(struct platform_device *pdev, bool reset)
+{
+	struct tb *tb = platform_get_drvdata(pdev);
+	struct device *dev = &pdev->dev;
+	struct tb_nhi *nhi = tb->nhi;
+
+	/*
+	 * On system shutdown/reboot force a host router reset so the
+	 * CM asserts DPR on connected Thunderbolt 3 devices before the router
+	 * tree is removed (see tb_stop()).
+	 */
+	if (reset)
+		nhi->host_reset = true;
+
+	pm_runtime_get_sync(dev);
+	pm_runtime_dont_use_autosuspend(dev);
+
+	tb_domain_remove(tb);
+	wait_for_completion(&nhi->domain_released);
+	tb_nhi_shutdown(nhi);
+}
+
+static void nhi_platform_remove(struct platform_device *pdev)
+{
+	nhi_platform_do_remove(pdev, false);
+}
+
+static void nhi_platform_shutdown(struct platform_device *pdev)
+{
+	nhi_platform_do_remove(pdev, true);
+}
+
+#ifdef CONFIG_ACPI
+static const struct acpi_device_id nhi_platform_acpi_match[] = {
+	{ "ACPI0015", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, nhi_platform_acpi_match);
+#endif
+
+static struct platform_driver nhi_platform_driver = {
+	.probe = nhi_platform_probe,
+	.remove = nhi_platform_remove,
+	.shutdown = nhi_platform_shutdown,
+	.driver = {
+		.name = "thunderbolt",
+		.acpi_match_table = ACPI_PTR(nhi_platform_acpi_match),
+		.pm = &tb_nhi_pm_ops,
+	},
+};
+
+module_platform_driver(nhi_platform_driver);
+MODULE_ALIAS("platform:thunderbolt");
+MODULE_DESCRIPTION("Thunderbolt/USB4 platform host interface driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/thunderbolt.h b/include/linux/thunderbolt.h
index 57502da29080..72497acac254 100644
--- a/include/linux/thunderbolt.h
+++ b/include/linux/thunderbolt.h
@@ -511,6 +511,8 @@ void tb_service_properties_changed(struct tb_service *svc);
  * @going_away: The host controller device is about to disappear so when
  *		this flag is set, avoid touching the hardware anymore.
  * @iommu_dma_protection: An IOMMU will isolate external-facing ports.
+ * @irq: interrupt number of NHI.
+ * @wake_irq: optional dedicated wakeup interrupt.
  * @interrupt_work: Work scheduled to handle ring interrupt when no
  *		    MSI-X is used.
  * @hop_count: Number of rings (end point hops) supported by NHI.
@@ -532,6 +534,8 @@ struct tb_nhi {
 	u32 *interrupt_mask;
 	bool going_away;
 	bool iommu_dma_protection;
+	int irq;
+	int wake_irq;
 	struct work_struct interrupt_work;
 	u32 hop_count;
 	unsigned long quirks;
-- 
2.45.2

