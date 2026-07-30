Received: from mx5.mail-out.lima-city.de (mx5.mail-out.lima-city.de [91.216.248.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9203C063F
	for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2026 21:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.248.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785445629; cv=none; b=iCc5KjjknpD2JWoUUxxWYyekJ8THRibv9VeLz6dPjFanDZ2yxhw/tO8yhewLwMEJ5ZH4ErlmZPaROe5gXj7cqsgfIRsUn2SVE/gbcMkczjdd39iyJfCvY0HC6LRkZzhOLKNSlSiq+/IxEBnzx83hKgkldyzf4mxcB+/iVk3Ko1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785445629; c=relaxed/simple;
	bh=UxBLNp8+CSiGtvPrGul2W7+YR/AWBxheFtNG7mslw/I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S/X8qIYJX5FeAqKQM8kXrXaIWQstQ6MOwpd4K4lxDmIyHDtc1FK8Gp/aA3RQGJEqnICUHC6TpUWxnF0OCLM1XcXG06u70vZYDAMRmS9Y5PZzFYUyvMU2N/lk85D1X8ZUTMroq0E7377aaIqYlYbbqyT3BKtcJ2a8lrsCVUIGHS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks; spf=none smtp.mailfrom=deq.rocks; dkim=pass (2048-bit key) header.d=deq.rocks header.i=@deq.rocks header.b=bdzNjjXk; arc=none smtp.client-ip=91.216.248.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=deq.rocks
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deq.rocks header.i=@deq.rocks header.b="bdzNjjXk"
From: Andre Eikmeyer <dev@deq.rocks>
X-Lima-ML-UUID: 87d34faa-0718-4cb8-9ea6-8c76b8c31ff8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1785445617;
	bh=UxBLNp8+CSiGtvPrGul2W7+YR/AWBxheFtNG7mslw/I=;
	h=From:To:Cc:Subject:Date:From;
	b=bdzNjjXknMrLhPAKE5bkhWun63rfzM47DSNjhkZrTQHsd2391nTVvEwUUlCffVc9D
	 Kb+8UOPIBORp7MNVZlX8ftDNq+BVqccLFg/COrxVgtYK4jowMkewhcxsliiQ3M5XCb
	 BO3RX9gsR7XQmN3T2YKunA+B91IL4GE44FAepN2s1TEXJqW6LTkhjaiUAx8gMxfLwG
	 agFg3KdeKkSbgB2PPUYqAiynaejWycfN5DCUuHfsbZTh75ppG/nIqICGzb9GI4xYC3
	 pGPDa4NSU9X8dUu3PB3ighDiY7Ig3eUs3d3TxcAHRMEGPHbV8CAhz53KPyB9GL1/E/
	 txCz6HKyzwSvQ==
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org,
	Andre Eikmeyer <dev@deq.rocks>
Subject: [PATCH] xhci-pci: keep Titan Ridge active on MacBookPro15,1
Date: Thu, 30 Jul 2026 23:06:55 +0200
Message-ID: <20260730210655.15514-1-dev@deq.rocks>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the MacBookPro15,1, the Titan Ridge xHCI controllers do not report
SuperSpeed connect events after runtime suspend when the firmware follows
its OSDW path. USB 2 devices routed through the PCH controller and
DisplayPort continue to work, while USB 3 mass-storage hotplug remains
completely silent. Writing on to the xHCI power/control attribute restores
detection.

We mark the Titan Ridge 4C xHCI controllers as unable to enter D3 during
xHCI quirk setup. The common xHCI PCI probe then keeps its runtime-PM
reference because pci_choose_state() returns D0, so the controller remains
able to report hotplug events.

The quirk is limited to the MacBookPro15,1 and has been tested on its 2018
and 2019 revisions. Suspend and repeated resume continue to work.

Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
---
 drivers/usb/host/xhci-pci.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 6b3fcba44b08..6bc1a3c786c1 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/pci.h>
+#include <linux/dmi.h>
 #include <linux/slab.h>
 #include <linux/module.h>
 #include <linux/acpi.h>
@@ -347,6 +348,12 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
 		xhci->quirks |= XHCI_INTEL_HOST;
 		xhci->quirks |= XHCI_AVOID_BEI;
 	}
+
+	if (pdev->vendor == PCI_VENDOR_ID_INTEL &&
+	    pdev->device == PCI_DEVICE_ID_INTEL_TITAN_RIDGE_4C_XHCI &&
+	    dmi_match(DMI_PRODUCT_NAME, "MacBookPro15,1"))
+		pdev->dev_flags |= PCI_DEV_FLAGS_NO_D3;
+
 	if (pdev->vendor == PCI_VENDOR_ID_INTEL &&
 			pdev->device == PCI_DEVICE_ID_INTEL_PANTHERPOINT_XHCI) {
 		xhci->quirks |= XHCI_EP_LIMIT_QUIRK;
-- 
2.55.0

