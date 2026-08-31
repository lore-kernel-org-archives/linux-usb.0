Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019293EBF16
	for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 10:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788170433; cv=none; b=eou7bdmqJmcvkPJf6Ilymvo9XCTpXPcmVEoCUwTGTIFXs6QX0Iu1sB4MFgIG4rQwqR2DVGggBmTmaBZAwLvv0SD/bAYXUKlzhiCvLApQBDWzlF+aPkBUPCIYFCB2D8z5d8tpuBRbJQ/KimknglO5wmNxTPttj5PISzH1PzInRyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788170433; c=relaxed/simple;
	bh=H40nQmlzRvZAztr+2KTEhkNrFpG57LT42jUX5JbWneo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NyMxoasDsjPBM5xJXDkPFUT+546lsX6KI7Aur0Z/QIdOgIXAOh/2mkuZlYoexdJ5ZpfiC81GHWECPAyMZU/V5tkwI0tXluHKAX8+S71Ve7asRrUtfjevcgstuYXKDMzIxtKhOlHiZ/atGqj0SVdST+tLAHm5RJDTBDfheOaNZ4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z5QSzJ33; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z5QSzJ33"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788170432; x=1819706432;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=H40nQmlzRvZAztr+2KTEhkNrFpG57LT42jUX5JbWneo=;
  b=Z5QSzJ33E/Aw6zv+qzjfbx4wH4Oeu2fdTvPNeCgrXgRxQpxSnYQ5CSwT
   w1Frm0kyL6jOsi4fTdu9CqS3FZialE2n7rMfpZl5++Dv77xrqGlErSptp
   cq+pRd0kF9WeMuRbIR7/Qv8iPVZFxP6d6jgHz0tbjbzcBTrqwrMujAFMp
   L7gbiDHOrsBRKLYHNoGRdORxqAo/O2t69tTyoGNqroKktxARmEDoqBfPg
   KErEVkEXx0oB9rVyZsfG0bModf07JymUl6f3d9Ht6962bl74DSiKHXvsA
   M3iQxfN5RlOnaDj0KuaeZSX59LyFWQ4NatNRJhWbA6kPmHB2z5OIDr4AU
   Q==;
X-CSE-ConnectionGUID: o6p/e2KKQLCIl6RfWsJkJA==
X-CSE-MsgGUID: yTJIvV58R5mlkrwK+JUXww==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="88585123"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="88585123"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 03:00:29 -0700
X-CSE-ConnectionGUID: n+V6fe66QYOAHH7MaIqNTg==
X-CSE-MsgGUID: 8umgrg/sQdSR3pGJ6+FwwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="268197125"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa008.jf.intel.com with ESMTP; 31 Aug 2026 03:00:27 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 4D3D79B; Mon, 31 Aug 2026 12:00:26 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Alexander Fischer <alexander.fischer@kait2en.org>,
	Andre Eikmeyer <andre@negmaster.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v10 1/3] thunderbolt: Move tb_apple_add_links() to pci.c
Date: Mon, 31 Aug 2026 12:00:24 +0200
Message-ID: <20260831100026.1783663-2-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260831100026.1783663-1-mika.westerberg@linux.intel.com>
References: <20260831100026.1783663-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>

Due to historical reasons the software connection manager in tb.c
directly sets up the device link between the tunneled PCIe ports and the
NHI. Now as we are starting to support non-PCIe host interfaces as well
we are trying to keep the connection manager implementation agnostic of
the underlying host interface. For this reason move the device link
creation into pci.c and expose it through a new NHI operation that the
host interface code calls when it sets up the connection manager.

Suggested-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/nhi.c | 34 ++++++++++++-----
 drivers/thunderbolt/nhi.h |  2 +
 drivers/thunderbolt/pci.c | 76 ++++++++++++++++++++++++++++++++++++++
 drivers/thunderbolt/tb.c  | 78 ---------------------------------------
 4 files changed, 103 insertions(+), 87 deletions(-)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index d4d1efa2afa0..5827c498c628 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -1208,24 +1208,40 @@ void nhi_reset_interface(struct tb_nhi *nhi)
 
 static struct tb *nhi_select_cm(struct tb_nhi *nhi)
 {
+	bool linked = false;
 	struct tb *tb;
 
 	/*
 	 * USB4 case is simple. If we got control of any of the
 	 * capabilities, we use software CM.
 	 */
-	if (tb_acpi_is_native())
-		return tb_probe(nhi);
+	if (!tb_acpi_is_native()) {
+		/*
+		 * Either firmware based CM is running (we did not get
+		 * control from the firmware) or this is pre-USB4 PC so
+		 * try first firmware CM and then fallback to software CM.
+		 */
+		tb = icm_probe(nhi);
+		if (tb)
+			return tb;
+	}
 
-	/*
-	 * Either firmware based CM is running (we did not get control
-	 * from the firmware) or this is pre-USB4 PC so try first
-	 * firmware CM and then fallback to software CM.
-	 */
-	tb = icm_probe(nhi);
+	tb = tb_probe(nhi);
 	if (!tb)
-		tb = tb_probe(nhi);
+		return NULL;
 
+	if (nhi->ops->add_links)
+		linked = nhi->ops->add_links(nhi);
+	if (!linked)
+		linked = tb_acpi_add_links(nhi);
+	/*
+	 * Device links are needed to make sure we establish tunnels
+	 * before protocol stacks are resumed so complain here if we
+	 * found them missing.
+	 */
+	if (!linked)
+		dev_warn(nhi->dev,
+			 "device links to tunneled native ports are missing!\n");
 	return tb;
 }
 
diff --git a/drivers/thunderbolt/nhi.h b/drivers/thunderbolt/nhi.h
index f72d6b274501..b2e2e2c413b2 100644
--- a/drivers/thunderbolt/nhi.h
+++ b/drivers/thunderbolt/nhi.h
@@ -43,6 +43,7 @@ extern const struct dev_pm_ops nhi_pm_ops;
 /**
  * struct tb_nhi_ops - NHI specific optional operations
  * @init: NHI specific initialization
+ * @add_links: Setup device links for tunneling native protocols
  * @suspend_noirq: NHI specific suspend_noirq hook
  * @resume_noirq: NHI specific resume_noirq hook
  * @runtime_suspend: NHI specific runtime_suspend hook
@@ -58,6 +59,7 @@ extern const struct dev_pm_ops nhi_pm_ops;
  */
 struct tb_nhi_ops {
 	int (*init)(struct tb_nhi *nhi);
+	bool (*add_links)(struct tb_nhi *nhi);
 	int (*suspend_noirq)(struct tb_nhi *nhi, bool wakeup);
 	int (*resume_noirq)(struct tb_nhi *nhi);
 	int (*runtime_suspend)(struct tb_nhi *nhi);
diff --git a/drivers/thunderbolt/pci.c b/drivers/thunderbolt/pci.c
index 99333729f3c2..c9c50004a6ac 100644
--- a/drivers/thunderbolt/pci.c
+++ b/drivers/thunderbolt/pci.c
@@ -18,6 +18,7 @@
 #include <linux/property.h>
 #include <linux/string_helpers.h>
 #include <linux/suspend.h>
+#include <linux/platform_data/x86/apple.h>
 
 #include "nhi.h"
 #include "nhi_regs.h"
@@ -129,6 +130,80 @@ static void nhi_pci_check_iommu(struct tb_nhi_pci *nhi_pci)
 		str_enabled_disabled(port_ok));
 }
 
+static bool add_link(struct tb_nhi *nhi, struct pci_dev *pdev)
+{
+	const struct device_link *link;
+
+	link = device_link_add(&pdev->dev, nhi->dev,
+			       DL_FLAG_AUTOREMOVE_SUPPLIER |
+			       DL_FLAG_PM_RUNTIME);
+	if (!link) {
+		dev_warn(nhi->dev, "device link creation from %s failed\n",
+			 dev_name(&pdev->dev));
+		return false;
+	}
+
+	dev_dbg(nhi->dev, "created link from %s\n", dev_name(&pdev->dev));
+	return true;
+}
+
+/*
+ * During suspend the Thunderbolt controller is reset and all PCIe
+ * tunnels are lost. The NHI driver will try to reestablish all tunnels
+ * during resume. This adds device links between the tunneled PCIe
+ * downstream ports and the NHI so that the device core will make sure
+ * NHI is resumed first before the rest.
+ */
+static bool nhi_pci_add_links(struct tb_nhi *nhi)
+{
+	struct pci_dev *nhi_pdev = to_pci_dev(nhi->dev);
+	struct pci_dev *upstream, *pdev;
+	bool ret;
+
+	if (!x86_apple_machine)
+		return false;
+
+	switch (nhi_pdev->device) {
+	case PCI_DEVICE_ID_INTEL_LIGHT_RIDGE:
+	case PCI_DEVICE_ID_INTEL_CACTUS_RIDGE_4C:
+	case PCI_DEVICE_ID_INTEL_FALCON_RIDGE_2C_NHI:
+	case PCI_DEVICE_ID_INTEL_FALCON_RIDGE_4C_NHI:
+		break;
+	default:
+		return false;
+	}
+
+	upstream = pci_upstream_bridge(nhi_pdev);
+	while (upstream) {
+		if (!pci_is_pcie(upstream))
+			return false;
+		if (pci_pcie_type(upstream) == PCI_EXP_TYPE_UPSTREAM)
+			break;
+		upstream = pci_upstream_bridge(upstream);
+	}
+
+	if (!upstream)
+		return false;
+
+	/*
+	 * For each hotplug downstream port, create add device link back
+	 * to NHI so that PCIe tunnels can be re-established after
+	 * sleep.
+	 */
+	ret = false;
+	for_each_pci_bridge(pdev, upstream->subordinate) {
+		if (!pci_is_pcie(pdev))
+			continue;
+		if (pci_pcie_type(pdev) != PCI_EXP_TYPE_DOWNSTREAM ||
+		    !pdev->is_pciehp)
+			continue;
+
+		ret |= add_link(nhi, pdev);
+	}
+
+	return ret;
+}
+
 static int nhi_pci_init_msi(struct tb_nhi *nhi)
 {
 	struct tb_nhi_pci *nhi_pci = nhi_to_pci(nhi);
@@ -272,6 +347,7 @@ static bool nhi_pci_is_present(struct tb_nhi *nhi)
 }
 
 static const struct tb_nhi_ops pci_nhi_default_ops = {
+	.add_links = nhi_pci_add_links,
 	.pre_nvm_auth = nhi_pci_start_dma_port,
 	.post_nvm_auth = nhi_pci_complete_dma_port,
 	.request_ring_irq = nhi_pci_ring_request_msix,
diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 47753a5c0f2e..7e39b067e5ff 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -10,7 +10,6 @@
 #include <linux/errno.h>
 #include <linux/delay.h>
 #include <linux/pm_runtime.h>
-#include <linux/platform_data/x86/apple.h>
 
 #include "tb.h"
 #include "tb_regs.h"
@@ -3323,75 +3322,6 @@ static const struct tb_cm_ops tb_cm_ops = {
 	.disconnect_xdomain_paths = tb_disconnect_xdomain_paths,
 };
 
-/*
- * During suspend the Thunderbolt controller is reset and all PCIe
- * tunnels are lost. The NHI driver will try to reestablish all tunnels
- * during resume. This adds device links between the tunneled PCIe
- * downstream ports and the NHI so that the device core will make sure
- * NHI is resumed first before the rest.
- */
-static bool tb_apple_add_links(struct tb_nhi *nhi)
-{
-	struct pci_dev *nhi_pdev = to_pci_dev(nhi->dev);
-	struct pci_dev *upstream, *pdev;
-	bool ret;
-
-	if (!x86_apple_machine)
-		return false;
-
-	switch (nhi_pdev->device) {
-	case PCI_DEVICE_ID_INTEL_LIGHT_RIDGE:
-	case PCI_DEVICE_ID_INTEL_CACTUS_RIDGE_4C:
-	case PCI_DEVICE_ID_INTEL_FALCON_RIDGE_2C_NHI:
-	case PCI_DEVICE_ID_INTEL_FALCON_RIDGE_4C_NHI:
-		break;
-	default:
-		return false;
-	}
-
-	upstream = pci_upstream_bridge(nhi_pdev);
-	while (upstream) {
-		if (!pci_is_pcie(upstream))
-			return false;
-		if (pci_pcie_type(upstream) == PCI_EXP_TYPE_UPSTREAM)
-			break;
-		upstream = pci_upstream_bridge(upstream);
-	}
-
-	if (!upstream)
-		return false;
-
-	/*
-	 * For each hotplug downstream port, create add device link
-	 * back to NHI so that PCIe tunnels can be re-established after
-	 * sleep.
-	 */
-	ret = false;
-	for_each_pci_bridge(pdev, upstream->subordinate) {
-		const struct device_link *link;
-
-		if (!pci_is_pcie(pdev))
-			continue;
-		if (pci_pcie_type(pdev) != PCI_EXP_TYPE_DOWNSTREAM ||
-		    !pdev->is_pciehp)
-			continue;
-
-		link = device_link_add(&pdev->dev, nhi->dev,
-				       DL_FLAG_AUTOREMOVE_SUPPLIER |
-				       DL_FLAG_PM_RUNTIME);
-		if (link) {
-			dev_dbg(nhi->dev, "created link from %s\n",
-				dev_name(&pdev->dev));
-			ret = true;
-		} else {
-			dev_warn(nhi->dev, "device link creation from %s failed\n",
-				 dev_name(&pdev->dev));
-		}
-	}
-
-	return ret;
-}
-
 struct tb *tb_probe(struct tb_nhi *nhi)
 {
 	struct tb_cm *tcm;
@@ -3416,13 +3346,5 @@ struct tb *tb_probe(struct tb_nhi *nhi)
 
 	tb_dbg(tb, "using software connection manager\n");
 
-	/*
-	 * Device links are needed to make sure we establish tunnels
-	 * before the PCIe/USB stack is resumed so complain here if we
-	 * found them missing.
-	 */
-	if (!tb_apple_add_links(nhi) && !tb_acpi_add_links(nhi))
-		tb_warn(tb, "device links to tunneled native ports are missing!\n");
-
 	return tb;
 }
-- 
2.50.1

