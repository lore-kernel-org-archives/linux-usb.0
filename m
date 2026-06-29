Received: from ultrarisc.com (unknown [218.76.62.146])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D241379C29;
	Mon, 29 Jun 2026 02:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.76.62.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782701315; cv=none; b=m2UYAagnzUXVr+VAGeI7VTUERRjhnIaxsYIfV04hrKitLw+HmdpXobCpbRKWh5xAjOs9KeO/Jm1Xj4XO4S773X983p2zL2+MuoY/wkfSnK1oPvagjzeb0p74qze8p2XvfbGSctjki3tAIcYIMlILGthRV47MtF3D/SPQxABNcvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782701315; c=relaxed/simple;
	bh=0DXV7TBJTEKVHS4/A75aHzTHTLuAWWHcbzjhWo+G0to=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=TqtcwVNTAwDMfGhK3d/+Yi6pZ1BXUfV8Tf+uqe/7OOZsZqtzaSxOTDBH1zz8jRnM9v+yTl87eDYidA2AcEXo1VBp7zETDfucSepRjWCR/OU5S4bJFbOetF8s/EU2l0OY+5K62mYPmb7gJzS53wXg+rtPBCbpc1osQ3ZFTXg1nTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com; spf=pass smtp.mailfrom=ultrarisc.com; dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b=c2aMUCC7; arc=none smtp.client-ip=218.76.62.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b="c2aMUCC7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:From:Date:Subject:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	To:Cc; bh=jI3rkscHq7ZrnXCdHklKwSkU4os5bL2jvsGPGs+nQuY=; b=c2aMUC
	C7z2RgrL5DqQY4empZ+v4o60PY4MDovomggP6dc7SP17zA9bqi31ZOxVVpzqP1aP
	23bm+KE2Ym3qmVPDHCIe3dbVom36Z/ipJuncFt7evfDxYSqOjphuJTNaNPWda+/s
	g+avfUEX3oRJYVy37pwnLWzyhC9/AKwmzgWEU=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwA3cUIW3UFq+98NAA--.14731S2;
	Mon, 29 Jun 2026 10:48:54 +0800 (CST)
From: Xincheng Zhang <zhangxincheng@ultrarisc.com>
Date: Mon, 29 Jun 2026 10:48:13 +0800
Subject: [PATCH v2] usb: xhci-pci: Limit VIA VL805 DMA addressing to 36
 bits
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-xhci-via-dma-fix-v2-1-380167319652@ultrarisc.com>
X-B4-Tracking: v=1; b=H4sIAOzcQWoC/32NzQ6CMBCEX4Xs2TW0CKmefA/DoSyLrJGftNBgC
 O9uwbvHbzLzzQqenbCHW7KC4yBehj6CPiVAre2fjFJHBp3qIi10hktLgkEs1p3FRhakvMgqY65
 s8wvE2eg4xofyUf7Yz9WLado9e6MVPw3uc3wGtff+6INChVmjNBllFTXmPr8nZ514OtPQQblt2
 xdiDZYZxgAAAA==
X-Change-ID: 20260623-xhci-via-dma-fix-c563b889ea54
To: Mathias Nyman <mathias.nyman@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michal Pecio <michal.pecio@gmail.com>, 
 Forest Crossman <cyrozap@gmail.com>, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Xincheng Zhang <zhangxincheng@ultrarisc.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782701301; l=4067;
 i=zhangxincheng@ultrarisc.com; s=20260624; h=from:subject:message-id;
 bh=0DXV7TBJTEKVHS4/A75aHzTHTLuAWWHcbzjhWo+G0to=;
 b=t06XoIEUsWxF/QfR1K8t7CFBHkBP8bMIKNqWOeRZRvGiz/5ZhIZsYummRFDMB/U9xZgvBTprA
 zN5PCPiiWMLC7sPRB3Y98qfFHDit8oEgNm4NvwbR2RbLYBDBqngcebj
X-Developer-Key: i=zhangxincheng@ultrarisc.com; a=ed25519;
 pk=QKwIEfHqvHrwmpA11qRt63ntQ3+BYBPSEvecshGYdOA=
X-CM-TRANSID:AQAAfwA3cUIW3UFq+98NAA--.14731S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAryDXF1xKw4UWF15Ar4fKrg_yoWrWw18pa
	y5XF43CrWrtF4SvasxCw48Zas5J3Z3JFy5KF9rK34akr45Za45WF9rCFWfJF13Xw4fXr1a
	qr1kW3y5WaykJaDanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvI14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
	6r4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2
	IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v2
	6r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2
	IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv
	67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf
	9x0JUBVbkUUUUU=
X-CM-SenderInfo: x2kd0wp0lquxxhqjq3powut2xlvfhudrp/1tbiAQAJDGo8pcwAIQARsL

The VIA VL805/806 xHCI controller advertises AC64, but fails to handle
DMA addresses at or above 0x1000000000. On systems with large amounts of
RAM, this can cause USB device failures when the controller is given DMA
addresses beyond its usable address width.

Do not use XHCI_NO_64BIT_SUPPORT for this controller. That quirk clears
the cached AC64 capability and limits DMA to 32 bits, causing unnecessary
bouncing for addresses between 4GiB and 64GiB and hiding the controller's
real AC64 capability from code that may need to distinguish register
access width from usable DMA address width.

Add a separate xHCI quirk for controllers whose usable DMA address width
is limited to 36 bits, and apply it to VIA VL805/806. This keeps AC64
visible while restricting the DMA mask to exactly the range that the
controller can handle.

Cc: stable@vger.kernel.org
Signed-off-by: Xincheng Zhang <zhangxincheng@ultrarisc.com>
---
Changes in v2:
- Replace XHCI_NO_64BIT_SUPPORT with a dedicated 36-bit DMA mask quirk.
- Preserve HCCPARAMS1.AC64 instead of clearing it for VL805/806.
- Limit VL805/806 DMA to DMA_BIT_MASK(36) instead of 32-bit.
- Add a stable Cc trailer.
- Link to v1: https://lore.kernel.org/all/20260623-xhci-via-dma-fix-v1-1-3f12c81a1cf8@ultrarisc.com/
---
 drivers/usb/host/xhci-pci.c |  1 +
 drivers/usb/host/xhci.c     | 30 ++++++++++++++++++++++++------
 drivers/usb/host/xhci.h     |  1 +
 3 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 039c26b241d0..e5618551e022 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -448,6 +448,7 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
 	if (pdev->vendor == PCI_VENDOR_ID_VIA && pdev->device == PCI_DEVICE_ID_VIA_VL805) {
 		xhci->quirks |= XHCI_LPM_SUPPORT;
 		xhci->quirks |= XHCI_TRB_OVERFETCH;
+		xhci->quirks |= XHCI_LIMIT_36BIT_DMA;
 	}
 
 	if (pdev->vendor == PCI_VENDOR_ID_ASMEDIA &&
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 6922cc5496c1..fa546e5cd300 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -5506,13 +5506,31 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
 	if (xhci->quirks & XHCI_NO_64BIT_SUPPORT)
 		xhci->hcc_params &= ~BIT(0);
 
-	/* Set dma_mask and coherent_dma_mask to 64-bits,
-	 * if xHC supports 64-bit addressing */
-	if ((xhci->hcc_params & HCC_64BIT_ADDR) &&
-			!dma_set_mask(dev, DMA_BIT_MASK(64))) {
-		xhci_dbg(xhci, "Enabling 64-bit DMA addresses.\n");
-		dma_set_coherent_mask(dev, DMA_BIT_MASK(64));
+	/*
+	 * Set dma_mask and coherent_dma_mask to 64-bits if xHC supports
+	 * 64-bit addressing, unless a controller-specific quirk limits the
+	 * usable address width.
+	 */
+	if (xhci->hcc_params & HCC_64BIT_ADDR) {
+		u64 dma_mask = DMA_BIT_MASK(64);
+		unsigned int dma_bits = 64;
+
+		if (xhci->quirks & XHCI_LIMIT_36BIT_DMA) {
+			dma_mask = DMA_BIT_MASK(36);
+			dma_bits = 36;
+		}
+
+		retval = dma_set_mask(dev, dma_mask);
+		if (!retval) {
+			xhci_dbg(xhci, "Enabling %u-bit DMA addresses.\n",
+				 dma_bits);
+			dma_set_coherent_mask(dev, dma_mask);
+		}
 	} else {
+		retval = -ENODEV;
+	}
+
+	if (retval) {
 		/*
 		 * This is to avoid error in cases where a 32-bit USB
 		 * controller is used on a 64-bit capable system.
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index d02046a573e4..e737ab36d0a3 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1647,6 +1647,7 @@ struct xhci_hcd {
 #define XHCI_CDNS_SCTX_QUIRK	BIT_ULL(48)
 #define XHCI_ETRON_HOST	BIT_ULL(49)
 #define XHCI_LIMIT_ENDPOINT_INTERVAL_9 BIT_ULL(50)
+#define XHCI_LIMIT_36BIT_DMA	BIT_ULL(51)
 
 	unsigned int		num_active_eps;
 	unsigned int		limit_active_eps;

---
base-commit: 502d801f0ab03e4f32f9a33d203154ce84887921
change-id: 20260623-xhci-via-dma-fix-c563b889ea54

Best regards,
--  
Xincheng Zhang <zhangxincheng@ultrarisc.com>

