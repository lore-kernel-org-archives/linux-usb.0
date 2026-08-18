Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2205E449B26
	for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 09:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787046623; cv=none; b=Tj1dnDxakpHmWGsnRcsuK7ah4bvkBT1fm4YqQxU4OAHfCPD6MHVhjnLNNMBhgKOxPOSGYVggQKyi8ZdgBqqVvvG52IF2Y7yXH5EMbtL+p9996K5r6PFJs1xtjmPDzH2wa80Oqw5KL2LOCngua6ughUU+V9eah8KDVdBcdgjRkLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787046623; c=relaxed/simple;
	bh=jxzMQaiqawHQ/SOA9j7dDopTxyxQQALlbtrm64Kdsbc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pGUfo2uexTnv3X0+ua/vRDn0/3n+Ky3wCuyFaYGQbwC9PXU7syX9MPU5Y6hGD/JjYUtWS9gUGnIxP7LvMr3oKpSzQ5Mb+vpQ8PPxNV25zI84b662lVszEuRSqStZTJP0gILX7vCJdlZorXu7GmvGZ+rcvfdsFSK0SGMlo3JJqgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=snhdaJpe; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="snhdaJpe"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso6398004a91.1
        for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 02:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787046621; x=1787651421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0wanu+zA8D4wAauqMrLFvx0gIfo6i0DJuB1JPGvu6HU=;
        b=snhdaJpe9kqeUB/go73FcvaMLwFDiepTKMHnyU5m32xLkeCB5nLLcFYXE5zav669PE
         8SR1p0wTBNzEGUqKKqdoNmRPyasI4FJpzjCcymiw19d8kBbkca2KPIB6f8U5hVAonXcf
         Iog2Tw6A2IiikPyN6XTF2XHbiY0u9uHavrsqEiJM63lr8in6Btbby5C9ndCsuk6onLho
         0QBBoCuXl62vElyuR9lYzywdja7m26PakMYSMckob+tEPFKr3j5jooCpbpbO3um+hUFi
         ObqFwO0ZdELeaj5+LLZGRc0xHxNyyPsRUYO2jWcSl0yi9qEiq36RnshtKzi4e9vq+cnM
         8UaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787046621; x=1787651421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0wanu+zA8D4wAauqMrLFvx0gIfo6i0DJuB1JPGvu6HU=;
        b=JQ1Z/YeodTQHdzRfgsC79kAKtptlbDgOso2ILhLHcy8wZesY/RJod9In4iZuTd2lnz
         MSBo2n6DvwHGYo+HOhkzfGki+ydSI72uN3wOFp4I7DXbLSrOwrGTnFKGrhmDnvOAbs8L
         qMBYyRsjY0Qcd1A8xlkiOpvh41z6QhHwWw9WhS1laQ0gd/wiDI/LEG+hESmCQpwX4fZc
         P2q154hzzeLyAw6Eh8Scu/7djXCeQLSvmCoqZ4j1BQ7xlp+Kh6Q5amCC90CdlxEU6yIb
         AOlx2MxAEGmvUkeaXPPeDtJbqVY3A2cZQxAvtCSVIbKJqBnmRAz9zSEn2TW83qFARBcZ
         Gdrw==
X-Forwarded-Encrypted: i=1; AHgh+Ropepn6vKjRqhe1o/Cy7rYHdmY10IEh3HdgdB6xd71H28JvVP0hqPcvYaNS/9qz91PqX1/Tpiy9QOo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/vOY6mzxCGJtKH/xoGuX8J1b1s1CWjHvco/p0hutjgTdWRPIh
	PDcSW+zF9/B6MYZEgisCPK7Gm1dWFuGubD2xAT93Hyoh4gxad1IdxpQ=
X-Gm-Gg: AR+sD12494YPHtNjswe/aQgUZOfS2IPqYlkCeCuimeX9HU/DafEzT+vyR4ComwMTt/H
	4YgX8KFdJ5mqmCvKdYWy9qZ4oym5f8FJ6k4J8Ko2GzT0v2bWKRtOM0wMZcRf6uSrPVAQSiFjrLG
	jRv/GjBHP/aJBh89LUQzxMsgDclubhLut2ggcj7H2g8aKgB8/U82tTf0XkqUcJ6MTpG2dfsIk7c
	s+vye3Hjfpm4pyb4NjwP42OzZLwLfjNlAlfGakbD++vAxKrBiXKMZ1QkuR6APpeYatAUNwBOZPy
	uFGHtS4K6c3EcV5l11PaaDl8Ox9K8giaMpXTYTw+6t4FkJ/pLOrkjLNZiFoduFfBQKy61byFm2F
	VmfcTE4Epo3WrGuT8aQ6kCC1j3kSiF76h5voLKqmxC1nIPe+tDapBneSmg/6EOPcGd39S3OtII3
	ezfoE339EQ8hvUIN6I2x0seNSnXQN9Lb657Fe12qTell8g1Aw0jNM5GCdAg4QlBnDwzSDJLEZ32
	3Bsz/CC5w+AhfssucY3ht0=
X-Received: by 2002:a17:90b:1c0a:b0:38a:c3f:3b87 with SMTP id 98e67ed59e1d1-3933b8721acmr28569070a91.12.1787046621291;
        Tue, 18 Aug 2026 02:50:21 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009.. ([14.97.72.18])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-326798cb9f5sm18466759eec.13.2026.08.18.02.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 02:50:20 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 1/3] thunderbolt: Shift tb_apple_add_links to pci.c
Date: Tue, 18 Aug 2026 05:50:02 -0400
Message-ID: <20260818095010.1857-2-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818095010.1857-1-atharvatiwarilinuxdev@gmail.com>
References: <20260818095010.1857-1-atharvatiwarilinuxdev@gmail.com>
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

