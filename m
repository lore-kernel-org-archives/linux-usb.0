Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A26388E43
	for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 18:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787597010; cv=none; b=SX8PTAolKRA1xO58g3GNcs26LpOPpC4gkR2VciCUpNY4wsNz8D5dtilzB1SzXSg2L4CrkYxvy1mZCvV3EHSMEP+gviue4d2BKxfuqAcq0YfhHCOUxupRXgimCSCkMLBV6YaLLprjL4tJXViTDYP1ZF0Rowm5FEz4ZwP7b7r8Xnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787597010; c=relaxed/simple;
	bh=jxzMQaiqawHQ/SOA9j7dDopTxyxQQALlbtrm64Kdsbc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YhgPKK9pqUo8TNcNvNnwOLh6DiGEmkDqu4dDwcRtkgn0JD76N263nQYCWoBwBX1kW16usGO+XIwnRCAIShApc9iKkwleI3e8p+5mcxWjIRDZf5WMe4S8xgpF5e/MM7c4a5Bu3OdySMehrW/Zxe/yDWz+5LfyDOcjjCKFbPjj+UI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YmZzlch6; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YmZzlch6"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc1469c1b83so5093709a12.1
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 11:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787597008; x=1788201808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0wanu+zA8D4wAauqMrLFvx0gIfo6i0DJuB1JPGvu6HU=;
        b=YmZzlch6dGLLxnZqIdAPifFuKFWQjwuJbZ07oAqcx/uscuWX8IDlQbFlTj1AeNjq7G
         FiwQFDHLDt9XhIU3lcZTbeh9VTLM7AySkjYhFrA1ZTNEoa9YhEDPy1MZbM2eeIJ2Apar
         M4E3oUu6mfux1JW4aCPGuW3OLVUeZJsr1qDsV8Dnk//SbpclB6BHsv+U7mwXCTeJNZrq
         s/xNmwqEIKlCZbfLQjmBPc8ZWIxfPv5cQQ/Zjncc8xHN92rpEmIhorCc+0vAf9AOYvEL
         Rz8pEiNSwpwCkFseXP/dW/6IWsVI3gwBiUmJhFVfyQp7KuoANet+ptJxgcTWLKFHznBq
         lVTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787597008; x=1788201808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0wanu+zA8D4wAauqMrLFvx0gIfo6i0DJuB1JPGvu6HU=;
        b=OKX5Kfdq4ZDhXQ01YS0S7UuVN8540gb2bKorQKOZOgxZQhrYxiZXcq1MTvcxB3420E
         NMtBWoXzE2MEP+K0LqGNtRQnA3pZemvAEnglIPehKvKewoHJadSxvgVSHtAfH/WyzPrG
         589Z7XpC5xXySg0ZJqLTIZcnI6z3qvZX0DAjT2w9DJVU7k0jta2zAFl79Uq4bfo7i7TK
         nhNfWBELB8t1CKrHLIeWJ+Kya+FYRb9qJAVQ+S+AhPUCKk8xceNaJ+mwZ9FOparwoXSV
         oUF/blCWbfofeQgVB5hDwGs+Uo4xfvn2FWBpbZSrTrc6RPcschXXIWXSMFw9ulZEeG7o
         Gu8Q==
X-Forwarded-Encrypted: i=1; AHgh+RpF9aBQs/Vdd7Xs3iRyAtNAF/CGSJyWisUWSgXQ+A7ipNL/Xxhxt+51lyJHyhfVJEzhKmTTr/SkZOY=@vger.kernel.org
X-Gm-Message-State: AFuF++kYvX5+UZNzBUWqdLdu9ZbgRztRf2c4o0V0XKPhdTMF2DWezgzw
	IfVVp8/zLob/RPVZiknsNWgqeTIL8ADXWzJN3QSA/l2vjfN989UO9+w=
X-Gm-Gg: AR+sD11gMNKNBZD+2kQUFOZ1PnzrVmxnd+WE+n4aCHWbB2o8AHNhOBCzVSGCf3a2Q3/
	Z3C9+YoSx29vx3ADWD7Z1wVbmxoYQX67ot+ecGeD2AXW1+DQtEo1cJDHwpb1rtj+ALFRCGzpld3
	8xsMBmYgPZwKPbduvb4qjR+Zhr3/XBv8/T+DTPYhYsoUCwcvaHo4059faLLndtMGv08ZDagU39t
	zZ5Ky7rCzgbs4gfpOxUq/dno0hs7QKAyN7tX/vhOm+X5w+XaiwRBTCapg2Ccm2KAILR6IrGkkZO
	lX3pdoiW/LOHB7FnTOd7woHqMZpEUFcB5cg8lc38arNAH4BBHeL+Hniqm8MUNifnfkQNOGPCTzd
	Wqtp4loD+MTr78fDGe6wFW1G825RDv8GTLameuoZBRw29Cx/E6lkiarGu1jKj5WasgRjchZn5UR
	IAz8kBOy5shBSHsuXRz1yIX1fBvqqHyKpaXXw2uKZXKRt6wJ25CkAnBSs/cECDaXTVmh5mPolxm
	gwt5jT8fO9dXcUa5Q0yUoRK
X-Received: by 2002:a05:6a20:9c8c:b0:3c3:b57b:627d with SMTP id adf61e73a8af0-3cd30063b97mr58971485637.12.1787597008427;
        Mon, 24 Aug 2026 11:43:28 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009.. ([223.228.8.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f91d2d1esm29781367eec.17.2026.08.24.11.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 11:43:27 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v9 1/3] thunderbolt: Shift tb_apple_add_links to pci.c
Date: Mon, 24 Aug 2026 14:42:54 -0400
Message-ID: <20260824184305.1234-2-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824184305.1234-1-atharvatiwarilinuxdev@gmail.com>
References: <20260824184305.1234-1-atharvatiwarilinuxdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Shift tb_apple_add_links to pci.c as tb_apple_add_links calls
pci functions.

Suggested-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
 drivers/thunderbolt/pci.c | 71 ++++++++++++++++++++++++++++++++++++++
 drivers/thunderbolt/tb.c  | 72 +--------------------------------------
 drivers/thunderbolt/tb.h  |  1 +
 3 files changed, 73 insertions(+), 71 deletions(-)

diff --git a/drivers/thunderbolt/pci.c b/drivers/thunderbolt/pci.c
index bbd186c29..83a4e1ba9 100644
--- a/drivers/thunderbolt/pci.c
+++ b/drivers/thunderbolt/pci.c
@@ -18,6 +18,7 @@
 #include <linux/property.h>
 #include <linux/string_helpers.h>
 #include <linux/suspend.h>
+#include <linux/platform_data/x86/apple.h>
 
 #include "nhi.h"
 #include "nhi_regs.h"
@@ -261,6 +262,51 @@ static const struct tb_nhi_ops pci_nhi_default_ops = {
 	.init_interrupts = nhi_pci_init_msi,
 };
 
+static bool tb_pci_add_links_discrete(struct pci_dev *nhi_pdev)
+{
+	struct pci_dev *pdev, *upstream = pci_upstream_bridge(nhi_pdev);
+	bool ret = false;
+
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
+	 * For each hotplug downstream port, create add device link
+	 * back to NHI so that PCIe tunnels can be re-established after
+	 * sleep.
+	 */
+	for_each_pci_bridge(pdev, upstream->subordinate) {
+		const struct device_link *link;
+
+		if (!pci_is_pcie(pdev))
+			continue;
+		if (pci_pcie_type(pdev) != PCI_EXP_TYPE_DOWNSTREAM ||
+		    !pdev->is_pciehp)
+			continue;
+
+		link = device_link_add(&pdev->dev, &nhi_pdev->dev,
+				       DL_FLAG_AUTOREMOVE_SUPPLIER |
+				       DL_FLAG_PM_RUNTIME);
+		if (link) {
+			dev_dbg(&nhi_pdev->dev, "created link from %s\n",
+				dev_name(&pdev->dev));
+			ret = true;
+		} else {
+			dev_warn(&nhi_pdev->dev, "device link creation from %s failed\n",
+				 dev_name(&pdev->dev));
+		}
+	}
+
+	return ret;
+}
 /* Ice Lake specific NHI operations */
 
 #define ICL_LC_MAILBOX_TIMEOUT	500 /* ms */
@@ -444,6 +490,31 @@ static const struct tb_nhi_ops icl_nhi_ops = {
 	.init_interrupts = nhi_pci_init_msi,
 };
 
+/*
+ * During suspend the Thunderbolt controller is reset and all PCIe
+ * tunnels are lost. The NHI driver will try to reestablish all tunnels
+ * during resume. This adds device links between the tunneled PCIe
+ * downstream ports and the NHI so that the device core will make sure
+ * NHI is resumed first before the rest.
+ */
+bool tb_pci_add_links(struct tb_nhi *nhi)
+{
+	struct pci_dev *nhi_pdev = to_pci_dev(nhi->dev);
+
+	if (!x86_apple_machine)
+		return false;
+
+	switch (nhi_pdev->device) {
+	case PCI_DEVICE_ID_INTEL_LIGHT_RIDGE:
+	case PCI_DEVICE_ID_INTEL_CACTUS_RIDGE_4C:
+	case PCI_DEVICE_ID_INTEL_FALCON_RIDGE_2C_NHI:
+	case PCI_DEVICE_ID_INTEL_FALCON_RIDGE_4C_NHI:
+		return tb_pci_add_links_discrete(nhi_pdev);
+	default:
+		return false;
+	}
+}
+
 static int nhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 {
 	struct device *dev = &pdev->dev;
diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index f43f2d952..9c2fc7ff1 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -10,7 +10,6 @@
 #include <linux/errno.h>
 #include <linux/delay.h>
 #include <linux/pm_runtime.h>
-#include <linux/platform_data/x86/apple.h>
 
 #include "tb.h"
 #include "tb_regs.h"
@@ -3302,75 +3301,6 @@ static const struct tb_cm_ops tb_cm_ops = {
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
@@ -3400,7 +3330,7 @@ struct tb *tb_probe(struct tb_nhi *nhi)
 	 * before the PCIe/USB stack is resumed so complain here if we
 	 * found them missing.
 	 */
-	if (!tb_apple_add_links(nhi) && !tb_acpi_add_links(nhi))
+	if (!tb_pci_add_links(nhi) && !tb_acpi_add_links(nhi))
 		tb_warn(tb, "device links to tunneled native ports are missing!\n");
 
 	return tb;
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index ec9192b61..6a285fe7f 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -1506,6 +1506,7 @@ static inline bool usb4_port_device_is_offline(const struct usb4_port *usb4)
 }
 
 void tb_check_quirks(struct tb_switch *sw);
+bool tb_pci_add_links(struct tb_nhi *nhi);
 
 #ifdef CONFIG_ACPI
 bool tb_acpi_add_links(struct tb_nhi *nhi);
-- 
2.43.0

