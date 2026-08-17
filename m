Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10B53F65EE
	for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 10:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786961634; cv=none; b=TQz6QqB9XrVDCqqF6w7WienkAqzZzMmYXCmiFF6Fe4pifQ/+Y9Hxmk+Dus4cbagvaP5HWC3nj5/ikSpFGdtMZHUlRMqcBmqVCBr3JTjSSpP4H/Try3VRSwnYy+Z08o/6WMJjbcNWiQ17vNxL5phqxihqrL54Yr3pdR7wV8uD0YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786961634; c=relaxed/simple;
	bh=CizFxtplh31MaoRyDhQUklAVO5brshVhPT06PE0+8xg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mebbx1YY8mQjsqNkZDrA5pr1H49HOx8wXUbgxy7/JrKzUXVAQxQyS+qWbrq5zxlV+gGpnq1mqkI4rhQJET+gs/xT+ZusM8LamTr/p+pQpgP7y8yM+iKHKwTdNRy+hWtbhDao02874XxMUrdmI3o7pr2Y4vBfvPoBjUDSF2rdneE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OI7IT0r1; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OI7IT0r1"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so4213587a91.0
        for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 03:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786961632; x=1787566432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CeECLjqLcEJPD/Rw00vUe8sjoJNKjBRQIoIZeyp3OHU=;
        b=OI7IT0r1Bolw6qa/o0tSxBizGX35sJpLMwghqvi6DLyNVOfhfQLj8+x8wnEUWfVYIR
         +OFvr9KEaSrJcmsW+rNzPyflqsCoh+HxWSbY7kslKeroVLzxDmAlKtcxJaFQ/rUoJKj7
         clJUPQq9Qhz9C1Fb9fHsxTNNqrxKbf9hwFqceSFbHZBP9kXh+oHhDGzisf4qLcUZ4+lq
         v3VYD/BAMk/GplaXojSigbY0vlWdw6yOwoI9nMxCUeuhJduhMGCml2HT4KK2ePvfWMQh
         zxwLdVAe5TmzLzI7DPuEpXuGyNU88WlMl75gP5GMKo+LGcQZ8RznRqTy725Dtk/6TMow
         Eenw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786961632; x=1787566432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CeECLjqLcEJPD/Rw00vUe8sjoJNKjBRQIoIZeyp3OHU=;
        b=kfefLNLPvi+WRpIdKPPCjq2FWzSepkqDmgeperCWKL6t+56cmpaCnryAXclR31lJmw
         AxAO18FfRm/pFsMR30jVnGukY/TZMcifXmMPm9DTtzl3rIPH2cnaYW6ctZ9/v0OSmp8o
         rxRP+PcM2TGMZ3su5H2mJTWzzEvoWlgFAdOql/cokiALP8lFJ/RePk/QhZl8zjqVxLsI
         um1AZhgbRERtTfY9A+OQVdwih+okLOFCV/u3FF4qTGLH/lW5BY0OdSjc8MQ+2j7GnZg+
         JKnMqxjDwlm5lULFtTJDt1dh6Qxb0eAGEMTVlUNapsuAIu0UM7TQN+OAJpz+Xzcn3tWW
         t/Qg==
X-Forwarded-Encrypted: i=1; AHgh+Rqz/84wW0+Qw+rNTi0IuItLDqtduDE1LSk8brLryG1Wgx2y6jQj3T2yRuiGGIV5aaNmAVeDiuj5wGA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwW+NwMAgZ7uMJo6nHeG+RX2fUv9S+vXihTj7lIKI4ehyyMDvJB
	66pinP9c5An+TEcMnNy4FYfrOjR/L4gkZAVoSr+Am84v8CUnO4DzAug=
X-Gm-Gg: AR+sD10th25uHCeuJ2JJMMB6c4Z3CbcXIjcjLFhEDu5PwvHYRFzJ7MuBmqykwSJPE5h
	44GWtRS+dLcK5N4GKMEJo5GZZLM6WphF+rZIi+92S+sAQdGOepVYneoLWYD807h1lAieB5wdlaf
	171D+FFePdgLh2mO45OWpOtK7S2+oRIU65D69jtSK4/fsy/VUz7vQ+Eea/x2IqOyreWwPpPc6YC
	pPXhQhdyaxRORcR87VLAurmOyB30XlTfQAbvzwcUIrt22bqjKY4NF51pi/4PnRHU/kUy907045s
	57X7MWCFIGJfIS3ALoXwJZgcC5HDAdhtnN8nigh30tpbPSUeovXzRV4UW2CS3m5NvNDN3MKufMa
	E5+qxYAc9kqHiA5aVKKYYJV/VKPnSmxnyo7U32U9gD3h1Rj93I7zMgcU5mA8d5eP2jci1KKFSZZ
	h6eSaHaqa7cjqQJF3rKX9k3cJ+7D86eDDzfW4W68D5ppOVg6QoPiddg2//yzrX8Q4hVfu3S3frx
	MVwOVMPJVSRz43zU9aqqw==
X-Received: by 2002:a17:90b:3c0e:b0:393:1d92:db5 with SMTP id 98e67ed59e1d1-3933b8f1451mr25461296a91.10.1786961631875;
        Mon, 17 Aug 2026 03:13:51 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009.. ([27.59.94.1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-326761d3539sm4864117eec.0.2026.08.17.03.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 03:13:51 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 1/3] thunderbolt: Shift tb_apple_add_links to pci.c
Date: Mon, 17 Aug 2026 06:13:22 -0400
Message-ID: <20260817101329.1517-2-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260817101329.1517-1-atharvatiwarilinuxdev@gmail.com>
References: <20260817101329.1517-1-atharvatiwarilinuxdev@gmail.com>
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
 drivers/thunderbolt/pci.c | 73 +++++++++++++++++++++++++++++++++++++++
 drivers/thunderbolt/tb.c  | 72 +-------------------------------------
 drivers/thunderbolt/tb.h  |  1 +
 3 files changed, 75 insertions(+), 71 deletions(-)

diff --git a/drivers/thunderbolt/pci.c b/drivers/thunderbolt/pci.c
index bbd186c29..c3d5a36ab 100644
--- a/drivers/thunderbolt/pci.c
+++ b/drivers/thunderbolt/pci.c
@@ -18,6 +18,7 @@
 #include <linux/property.h>
 #include <linux/string_helpers.h>
 #include <linux/suspend.h>
+#include <linux/platform_data/x86/apple.h>
 
 #include "nhi.h"
 #include "nhi_regs.h"
@@ -261,6 +262,53 @@ static const struct tb_nhi_ops pci_nhi_default_ops = {
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
+	pci_lock_rescan_remove();
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
+	pci_unlock_rescan_remove();
+
+	return ret;
+}
 /* Ice Lake specific NHI operations */
 
 #define ICL_LC_MAILBOX_TIMEOUT	500 /* ms */
@@ -444,6 +492,31 @@ static const struct tb_nhi_ops icl_nhi_ops = {
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

