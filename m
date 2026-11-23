Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.61.82.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795433863;
	b=LP5VLuNRLhrJpFVC7AMkMG5Z8Im1RBkpXHK/wuotgdTvmsQYpixXzd4KPZXXs3nWFLAb
	 LtHdwMi+LTu+Wj69P3NYVtBmE/eNT/PM+MPm/wbXSdLZhpIN+nc++TK/AWkaPE9r6UEeA
	 TqyASYNUQWO3/6vuDI0VYyT6TL2al9RAQJAYu04Yhx1NoY0IGKIDnW00wxvrVKIBzncXN
	 Zr7K62UCinxzevPh9UU9WTYx8YGYTwVmqlmWq2i5kfX2E8erbwmtis6ZkEhLYnJCyfVjf
	 pZPQpv5Hg/gCjonxR/bo0AzcmH4AgPA0RO9yQStUc3Jt27bIbfgrHGwWYmhX3Q7Pr1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795433863;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-MTK;
	bh=uPonIazvhtwlionX0JdWgS6bOubakgFn+KZJzc2mFgs=;
	b=xcFT0mJCw1y6GBHV1dXl3OiX4Dkm7ACd7CTG9j/fd0EXXU75SrzLVUFfdeuiZCd4yi1G
	 nAc8AD+PXI5OBvYiK2+vCRQK37N5WO+YBxlTHVFvzbCyRyDfANokSTYvlOEsi7jHSAz0l
	 w7LqPrK9evlQQcABhXW0Op8qSY2hsVTUYmbxmoBZgDzyabSXRBGv/2Pdk+yH2O+ukJpAk
	 bXdHiHRi/oWyJTtMc5nJUod6JYesxu1BsoIdGMZDTonu6RktRHgGhl/cbMFs2Cru7PYEA
	 t4IPPYiD5jKI4wMYnZO8HKz/xog2h5DSr8G2t0As9/+uGHHEX7qrqotqR4ABjE6s6KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=sEmky8sY;
	arc=none smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83E460A2608;
	Mon, 23 Nov 2026 11:37:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D83E460A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=sEmky8sY
X-UUID: 485a6cd4e73211f18dc8c9802ae25ab1-20261123
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=uPonIazvhtwlionX0JdWgS6bOubakgFn+KZJzc2mFgs=;
	b=sEmky8sYmg35VM7obtiLel1V00I0OXHWqpVu+z95vNV/MGvrHedScxmgNh2B61kHQxebh8thKgwRAPieuFIzYM5+aCCzg/OUi0Sktwp20cPdti0NRlE89us2jKiFNxjFvQStkQP40hKd8duFmJeT3uCT6dEQFYjy18nJ5YTMnoU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:dcc98971-d932-4ce4-8cf2-0d65339f3372,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0318ac,CLOUDID:79f7f319-ae4c-4a2b-b1c4-72e411efd0c9,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,CO
	L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 485a6cd4e73211f18dc8c9802ae25ab1-20261123
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 849168554; Mon, 23 Nov 2026 19:37:37 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 19:37:35 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.53 via Frontend Transport; Mon, 23 Nov 2026 19:37:35 +0800
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
Subject: [PATCH v3 3/8] thunderbolt: Make PCIe NHI support opt-in
Date: Mon, 23 Nov 2026 19:36:50 +0800
Message-ID: <20261123113705.2297329-4-chunfeng.yun@mediatek.com>
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
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: 8bit
X-MTK: N

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Currently, the USB4/Thunderbolt subsystem directly depends on PCI,
tightly bundling the core framework with the PCIe-attached Native Host
Interface (NHI) driver (pci.c) and the Intel Connection Manager (icm.c)
into a single module (thunderbolt.o).

With support for platform/SoC-attached USB4 host controllers coming in
(such as on ARM64 systems), the core USB4 framework should no longer
have a hard dependency on PCI. Furthermore, embedded or SoC systems
without PCIe-attached host routers should be able to omit PCIe NHI
support to reduce kernel footprint.

Decouple the PCIe NHI and ICM drivers from the core framework:

1. Kconfig & Makefile:
   - Remove "depends on PCI" from CONFIG_USB4.
   - Introduce CONFIG_USB4_PCI to build PCIe NHI and ICM support as
     a separate module (thunderbolt_pci.ko).

2. Driver Registration:
   - Make the core thunderbolt module standalone by converting
     tb_domain_init/exit() to postcore_initcall() and module_exit().
   - Register the PCIe driver in thunderbolt_pci via module_pci_driver().

3. Connection Manager Selection:
   - Add an optional .select_cm() hook to struct tb_nhi_ops so that the
     PCIe driver can invoke icm_probe() for legacy/firmware-CM controllers
     without hardcoding ICM calls into the core nhi.c.

4. Symbol Exports:
   - Export necessary APIs required by pci and platform drivers.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v3:
Added 'default USB4' to CONFIG_USB4_PCI in Kconfig;
Exported tb_xdomain_remove symbol immediately after its definition;

v2:
cherry-pick the patch of Konrad to fix the issues of this series, and
also do some changes:

* Renamed CONFIG_USB4_PCIE and thunderbolt_pcie.ko to CONFIG_USB4_PCI
  and thunderbolt_pci.ko.
* Updated exported NHI symbols to standard tb_ / tb_ring_ prefixes
  (e.g., ring_msix → tb_ring_msix, nhi_msi → tb_nhi_isr).
* Eliminated exports for nhi_mailbox_* and nhi_interrupt_work by
  keeping them internal/static (handled by preparatory patches in v2).
* Added missing trailing semicolon to module_pci_driver(nhi_driver);.
* Expanded the commit message;
* Fix cherry-pick conflict caused by .reset_interface();
---
 drivers/thunderbolt/Kconfig   | 12 ++++++++++-
 drivers/thunderbolt/Makefile  |  7 +++++--
 drivers/thunderbolt/ctl.c     |  6 +++++-
 drivers/thunderbolt/domain.c  | 14 +++++++++++--
 drivers/thunderbolt/nhi.c     | 14 ++++++-------
 drivers/thunderbolt/nhi.h     |  2 ++
 drivers/thunderbolt/pci.c     | 39 +++++++++++++----------------------
 drivers/thunderbolt/switch.c  |  9 ++++++++
 drivers/thunderbolt/tb.h      |  2 --
 drivers/thunderbolt/tunnel.c  |  1 +
 drivers/thunderbolt/xdomain.c |  5 +++++
 11 files changed, 71 insertions(+), 40 deletions(-)

diff --git a/drivers/thunderbolt/Kconfig b/drivers/thunderbolt/Kconfig
index 294b3227a545..80960555a364 100644
--- a/drivers/thunderbolt/Kconfig
+++ b/drivers/thunderbolt/Kconfig
@@ -1,7 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 menuconfig USB4
 	tristate "Unified support for USB4 and Thunderbolt"
-	depends on PCI
 	select APPLE_PROPERTIES if EFI_STUB && X86
 	select CRC32
 	select CRYPTO_LIB_SHA256
@@ -18,6 +17,17 @@ menuconfig USB4
 
 if USB4
 
+config USB4_PCI
+	tristate "Support for PCIe-attached USB4 and Thunderbolt controllers"
+	depends on PCI
+	default USB4
+	help
+	  Say Y here to add support for the USB4 and Thunderbolt host
+	  routers attached over the PCIe bus, commonly found on x86 PCs.
+
+	  To compile this driver a module, choose M here. The module will be
+	  called thunderbolt_pci.
+
 config USB4_CONFIGFS
 	def_tristate USB4
 	depends on CONFIGFS_FS && !(USB4=y && CONFIGFS_FS=m)
diff --git a/drivers/thunderbolt/Makefile b/drivers/thunderbolt/Makefile
index beb054c3126b..a563bf2b0345 100644
--- a/drivers/thunderbolt/Makefile
+++ b/drivers/thunderbolt/Makefile
@@ -1,10 +1,13 @@
 # SPDX-License-Identifier: GPL-2.0-only
 ccflags-y := -I$(src)
 obj-${CONFIG_USB4} := thunderbolt.o
-thunderbolt-objs := nhi.o ctl.o tb.o switch.o cap.o pci.o path.o tunnel.o eeprom.o
-thunderbolt-objs += domain.o dma_port.o icm.o property.o xdomain.o lc.o tmu.o usb4.o
+thunderbolt-objs := nhi.o ctl.o tb.o switch.o cap.o path.o tunnel.o eeprom.o
+thunderbolt-objs += domain.o dma_port.o property.o xdomain.o lc.o tmu.o usb4.o
 thunderbolt-objs += usb4_port.o nvm.o retimer.o quirks.o clx.o
 
+obj-${CONFIG_USB4_PCI} += thunderbolt_pci.o
+thunderbolt_pci-y := pci.o icm.o
+
 thunderbolt-${CONFIG_ACPI} += acpi.o
 thunderbolt-$(CONFIG_DEBUG_FS) += debugfs.o
 thunderbolt-$(CONFIG_USB4_CONFIGFS) += configfs.o
diff --git a/drivers/thunderbolt/ctl.c b/drivers/thunderbolt/ctl.c
index 965988b18608..96717a0a94b1 100644
--- a/drivers/thunderbolt/ctl.c
+++ b/drivers/thunderbolt/ctl.c
@@ -9,7 +9,6 @@
 #include <linux/crc32.h>
 #include <linux/delay.h>
 #include <linux/slab.h>
-#include <linux/pci.h>
 #include <linux/dmapool.h>
 #include <linux/workqueue.h>
 
@@ -96,6 +95,7 @@ struct tb_cfg_request *tb_cfg_request_alloc(void)
 
 	return req;
 }
+EXPORT_SYMBOL_GPL(tb_cfg_request_alloc);
 
 /**
  * tb_cfg_request_get() - Increase refcount of a request
@@ -128,6 +128,7 @@ void tb_cfg_request_put(struct tb_cfg_request *req)
 	kref_put(&req->kref, tb_cfg_request_destroy);
 	mutex_unlock(&tb_cfg_request_lock);
 }
+EXPORT_SYMBOL_GPL(tb_cfg_request_put);
 
 static int tb_cfg_request_enqueue(struct tb_ctl *ctl,
 				  struct tb_cfg_request *req)
@@ -575,6 +576,7 @@ int tb_cfg_request(struct tb_ctl *ctl, struct tb_cfg_request *req,
 	tb_cfg_request_dequeue(req);
 	return ret;
 }
+EXPORT_SYMBOL_GPL(tb_cfg_request);
 
 /**
  * tb_cfg_request_cancel() - Cancel a control request
@@ -634,6 +636,7 @@ struct tb_cfg_result tb_cfg_request_sync(struct tb_ctl *ctl,
 
 	return req->result;
 }
+EXPORT_SYMBOL_GPL(tb_cfg_request_sync);
 
 /* public interface, alloc/start/stop/free */
 
@@ -1009,6 +1012,7 @@ struct tb_cfg_result tb_cfg_read_raw(struct tb_ctl *ctl, void *buffer,
 		memcpy(buffer, &reply.data, 4 * length);
 	return res;
 }
+EXPORT_SYMBOL_GPL(tb_cfg_read_raw);
 
 /**
  * tb_cfg_write_raw() - write from buffer into config space
diff --git a/drivers/thunderbolt/domain.c b/drivers/thunderbolt/domain.c
index 24611f05b3cd..114ddd5be25b 100644
--- a/drivers/thunderbolt/domain.c
+++ b/drivers/thunderbolt/domain.c
@@ -313,6 +313,7 @@ const struct bus_type tb_bus_type = {
 	.remove = tb_service_remove,
 	.shutdown = tb_service_shutdown,
 };
+EXPORT_SYMBOL_GPL(tb_bus_type);
 
 static void tb_domain_release(struct device *dev)
 {
@@ -421,6 +422,7 @@ struct tb *tb_domain_alloc(struct tb_nhi *nhi, int timeout_msec, size_t privsize
 
 	return NULL;
 }
+EXPORT_SYMBOL_GPL(tb_domain_alloc);
 
 /**
  * tb_domain_add() - Add domain to the system
@@ -514,6 +516,7 @@ void tb_domain_remove(struct tb *tb)
 
 	device_unregister(&tb->dev);
 }
+EXPORT_SYMBOL_GPL(tb_domain_remove);
 
 /**
  * tb_domain_suspend_noirq() - Suspend a domain
@@ -880,8 +883,9 @@ int tb_domain_unregister_unplugged_xdomains(struct tb *tb)
 
 	return ctx.n;
 }
+EXPORT_SYMBOL_GPL(tb_domain_unregister_unplugged_xdomains);
 
-int tb_domain_init(void)
+static int __init tb_domain_init(void)
 {
 	int ret;
 
@@ -907,7 +911,7 @@ int tb_domain_init(void)
 	return ret;
 }
 
-void tb_domain_exit(void)
+static void __exit tb_domain_exit(void)
 {
 	bus_unregister(&tb_bus_type);
 	ida_destroy(&tb_domain_ida);
@@ -917,3 +921,9 @@ void tb_domain_exit(void)
 	tb_debugfs_exit();
 	tb_configfs_exit();
 }
+
+postcore_initcall(tb_domain_init);
+module_exit(tb_domain_exit);
+
+MODULE_DESCRIPTION("Thunderbolt/USB4 core driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index ce02f96187b0..69783e81dd3b 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -546,6 +546,7 @@ irqreturn_t tb_ring_msix(int irq, void *data)
 
 	return IRQ_HANDLED;
 }
+EXPORT_SYMBOL_GPL(tb_ring_msix);
 
 static int nhi_alloc_hop(struct tb_nhi *nhi, struct tb_ring *ring)
 {
@@ -1018,6 +1019,7 @@ irqreturn_t tb_nhi_isr(int irq, void *data)
 	schedule_work(&nhi->interrupt_work);
 	return IRQ_HANDLED;
 }
+EXPORT_SYMBOL_GPL(tb_nhi_isr);
 
 static int __nhi_suspend_noirq(struct device *dev, bool wakeup)
 {
@@ -1175,6 +1177,7 @@ void tb_nhi_shutdown(struct tb_nhi *nhi)
 	if (nhi->ops->shutdown)
 		nhi->ops->shutdown(nhi);
 }
+EXPORT_SYMBOL_GPL(tb_nhi_shutdown);
 
 static void nhi_reset(struct tb_nhi *nhi)
 {
@@ -1216,13 +1219,8 @@ static struct tb *nhi_select_cm(struct tb_nhi *nhi)
 	 * USB4 case is simple. If we got control of any of the
 	 * capabilities, we use software CM.
 	 */
-	if (!tb_acpi_is_native()) {
-		/*
-		 * Either firmware based CM is running (we did not get
-		 * control from the firmware) or this is pre-USB4 PC so
-		 * try first firmware CM and then fallback to software CM.
-		 */
-		tb = icm_probe(nhi);
+	if (!tb_acpi_is_native() && nhi->ops->select_cm) {
+		tb = nhi->ops->select_cm(nhi);
 		if (tb)
 			return tb;
 	}
@@ -1327,6 +1325,7 @@ int tb_nhi_probe(struct tb_nhi *nhi)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(tb_nhi_probe);
 
 /*
  * The tunneled pci bridges are siblings of us. Use resume_noirq to reenable
@@ -1349,3 +1348,4 @@ const struct dev_pm_ops tb_nhi_pm_ops = {
 	.runtime_suspend = nhi_runtime_suspend,
 	.runtime_resume = nhi_runtime_resume,
 };
+EXPORT_SYMBOL_GPL(tb_nhi_pm_ops);
diff --git a/drivers/thunderbolt/nhi.h b/drivers/thunderbolt/nhi.h
index 3dd6ace6150d..65f9daf36068 100644
--- a/drivers/thunderbolt/nhi.h
+++ b/drivers/thunderbolt/nhi.h
@@ -50,6 +50,7 @@ extern const struct dev_pm_ops tb_nhi_pm_ops;
  * @release_ring_irq: NHI specific interrupt release hook
  * @is_present: Whether the device is currently present on the parent bus
  * @init_interrupts: NHI specific interrupt initialization hook
+ * @select_cm: optional hook to select a custom CM
  */
 struct tb_nhi_ops {
 	int (*init)(struct tb_nhi *nhi);
@@ -65,6 +66,7 @@ struct tb_nhi_ops {
 	void (*release_ring_irq)(struct tb_ring *ring);
 	bool (*is_present)(struct tb_nhi *nhi);
 	int (*init_interrupts)(struct tb_nhi *nhi);
+	struct tb * (*select_cm)(struct tb_nhi *nhi);
 };
 
 /*
diff --git a/drivers/thunderbolt/pci.c b/drivers/thunderbolt/pci.c
index 275389903090..9379c598a221 100644
--- a/drivers/thunderbolt/pci.c
+++ b/drivers/thunderbolt/pci.c
@@ -325,6 +325,16 @@ static bool nhi_pci_is_present(struct tb_nhi *nhi)
 	return pci_device_is_present(to_pci_dev(nhi->dev));
 }
 
+static struct tb *nhi_pci_select_cm(struct tb_nhi *nhi)
+{
+	/*
+	 * Either the firmware-based CM is running (we did not get
+	 * control from the firmware) or this is a pre-USB4 PC, so
+	 * first try using the firmware CM and then fallback to software CM.
+	 */
+	return icm_probe(nhi);
+}
+
 static const struct tb_nhi_ops pci_nhi_default_ops = {
 	.add_links = nhi_pci_add_links,
 	.pre_nvm_auth = nhi_pci_start_dma_port,
@@ -334,6 +344,7 @@ static const struct tb_nhi_ops pci_nhi_default_ops = {
 	.shutdown = nhi_pci_release_irq,
 	.is_present = nhi_pci_is_present,
 	.init_interrupts = nhi_pci_init_msi,
+	.select_cm = nhi_pci_select_cm,
 };
 
 /* Ice Lake specific NHI operations */
@@ -552,6 +563,7 @@ static const struct tb_nhi_ops icl_nhi_ops = {
 	.release_ring_irq = nhi_pci_ring_release_msix,
 	.is_present = nhi_pci_is_present,
 	.init_interrupts = nhi_pci_init_msi,
+	.select_cm = nhi_pci_select_cm,
 };
 
 static int nhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
@@ -713,7 +725,7 @@ static struct pci_device_id nhi_ids[] = {
 };
 
 MODULE_DEVICE_TABLE(pci, nhi_ids);
-MODULE_DESCRIPTION("Thunderbolt/USB4 core driver");
+MODULE_DESCRIPTION("PCIe-attached Thunderbolt/USB4 host interface driver");
 MODULE_LICENSE("GPL");
 
 static struct pci_driver nhi_driver = {
@@ -724,27 +736,4 @@ static struct pci_driver nhi_driver = {
 	.shutdown = nhi_pci_shutdown,
 	.driver.pm = &tb_nhi_pm_ops,
 };
-
-static int __init nhi_init(void)
-{
-	int ret;
-
-	ret = tb_domain_init();
-	if (ret)
-		return ret;
-
-	ret = pci_register_driver(&nhi_driver);
-	if (ret)
-		tb_domain_exit();
-
-	return ret;
-}
-
-static void __exit nhi_unload(void)
-{
-	pci_unregister_driver(&nhi_driver);
-	tb_domain_exit();
-}
-
-rootfs_initcall(nhi_init);
-module_exit(nhi_unload);
+module_pci_driver(nhi_driver);
diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index d22d8db8f890..7ff3da79da76 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -2396,6 +2396,7 @@ const struct device_type tb_switch_type = {
 	.uevent = tb_switch_uevent,
 	.pm = &tb_switch_pm_ops,
 };
+EXPORT_SYMBOL_GPL(tb_switch_type);
 
 static int tb_switch_get_generation(struct tb_switch *sw)
 {
@@ -2571,6 +2572,7 @@ struct tb_switch *tb_switch_alloc(struct tb *tb, struct device *parent,
 
 	return ERR_PTR(ret);
 }
+EXPORT_SYMBOL_GPL(tb_switch_alloc);
 
 /**
  * tb_switch_alloc_safe_mode() - allocate a switch that is in safe mode
@@ -2610,6 +2612,7 @@ tb_switch_alloc_safe_mode(struct tb *tb, struct device *parent, u64 route)
 
 	return sw;
 }
+EXPORT_SYMBOL_GPL(tb_switch_alloc_safe_mode);
 
 /**
  * tb_switch_configure() - Uploads configuration to the switch
@@ -3438,6 +3441,7 @@ int tb_switch_add(struct tb_switch *sw)
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(tb_switch_add);
 
 /**
  * tb_switch_remove() - Remove and release a switch
@@ -3483,6 +3487,7 @@ void tb_switch_remove(struct tb_switch *sw)
 		dev_info(&sw->dev, "device disconnected\n");
 	device_unregister(&sw->dev);
 }
+EXPORT_SYMBOL_GPL(tb_switch_remove);
 
 /**
  * tb_sw_set_unplugged() - set is_unplugged on switch and downstream switches
@@ -3828,6 +3833,7 @@ struct tb_switch *tb_switch_find_by_link_depth(struct tb *tb, u8 link, u8 depth)
 
 	return NULL;
 }
+EXPORT_SYMBOL_GPL(tb_switch_find_by_link_depth);
 
 /**
  * tb_switch_find_by_uuid() - Find switch by UUID
@@ -3854,6 +3860,7 @@ struct tb_switch *tb_switch_find_by_uuid(struct tb *tb, const uuid_t *uuid)
 
 	return NULL;
 }
+EXPORT_SYMBOL_GPL(tb_switch_find_by_uuid);
 
 /**
  * tb_switch_find_by_route() - Find switch by route string
@@ -3883,6 +3890,7 @@ struct tb_switch *tb_switch_find_by_route(struct tb *tb, u64 route)
 
 	return NULL;
 }
+EXPORT_SYMBOL_GPL(tb_switch_find_by_route);
 
 /**
  * tb_switch_find_port() - return the first port of @type on @sw or NULL
@@ -3903,6 +3911,7 @@ struct tb_port *tb_switch_find_port(struct tb_switch *sw,
 
 	return NULL;
 }
+EXPORT_SYMBOL_GPL(tb_switch_find_port);
 
 /*
  * Can be used for read/write a specified PCIe bridge for any Thunderbolt 3
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index e86845762e22..6dfdc47e05d2 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -768,8 +768,6 @@ extern const struct device_type tb_retimer_type;
 extern const struct device_type tb_switch_type;
 extern const struct device_type usb4_port_device_type;
 
-int tb_domain_init(void);
-void tb_domain_exit(void);
 int tb_xdomain_init(void);
 void tb_xdomain_exit(void);
 
diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index 2b911372001c..c92f181f181d 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -274,6 +274,7 @@ void tb_tunnel_event(struct tb *tb, enum tb_tunnel_event event,
 	kfree(envp[1]);
 	kfree(envp[0]);
 }
+EXPORT_SYMBOL_GPL(tb_tunnel_event);
 
 static inline void tb_tunnel_set_active(struct tb_tunnel *tunnel, bool active)
 {
diff --git a/drivers/thunderbolt/xdomain.c b/drivers/thunderbolt/xdomain.c
index b187a60663f5..8ebe6cc18f60 100644
--- a/drivers/thunderbolt/xdomain.c
+++ b/drivers/thunderbolt/xdomain.c
@@ -86,6 +86,7 @@ bool tb_is_xdomain_enabled(void)
 {
 	return tb_xdomain_enabled && tb_acpi_is_xdomain_allowed();
 }
+EXPORT_SYMBOL_GPL(tb_is_xdomain_enabled);
 
 static bool tb_xdomain_match(const struct tb_cfg_request *req,
 			     const struct ctl_pkg *pkg)
@@ -2196,6 +2197,7 @@ struct tb_xdomain *tb_xdomain_alloc(struct tb *tb, struct device *parent,
 
 	return NULL;
 }
+EXPORT_SYMBOL_GPL(tb_xdomain_alloc);
 
 /**
  * tb_xdomain_add() - Add XDomain to the bus
@@ -2211,6 +2213,7 @@ void tb_xdomain_add(struct tb_xdomain *xd)
 	/* Start exchanging properties with the other host */
 	start_handshake(xd);
 }
+EXPORT_SYMBOL_GPL(tb_xdomain_add);
 
 static int unregister_service(struct device *dev, void *data)
 {
@@ -2252,6 +2255,7 @@ void tb_xdomain_remove(struct tb_xdomain *xd)
 		put_device(&xd->dev);
 	}
 }
+EXPORT_SYMBOL_GPL(tb_xdomain_remove);
 
 /**
  * tb_xdomain_unregister() - Unregister XDomain
@@ -2593,6 +2597,7 @@ struct tb_xdomain *tb_xdomain_find_by_link_depth(struct tb *tb, u8 link,
 	xd = switch_find_xdomain(tb->root_switch, &lookup);
 	return tb_xdomain_get(xd);
 }
+EXPORT_SYMBOL_GPL(tb_xdomain_find_by_link_depth);
 
 /**
  * tb_xdomain_find_by_route() - Find an XDomain by route string
-- 
2.45.2

