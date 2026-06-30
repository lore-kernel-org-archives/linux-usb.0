Received: from ultrarisc.com (unknown [218.76.62.146])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A549F257824;
	Tue, 30 Jun 2026 01:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.76.62.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782782841; cv=none; b=nTrETxjLgKsg7LV4kvuBiAyhunE54zVl5nX/eJ9vapjsOCr8x2Rvwsf5Dlpmx9UDBy1HSjLzqDVfI0JGYFohrPpUKwVB6T4IcShWz7j+aNHj5J9kRWCnXmc6rH7PORfIVpWhZSk4y1dx+eIbvXwMGtqtmk6RHIk3TRyr+oxApuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782782841; c=relaxed/simple;
	bh=53plWYcXg7dRHkMjeOTTLC0De2vpp4XJpUviuouYYhw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=kzmjT+8zkyzpDGMNfyQ2HDYn6bYx0sXx1eyCuVxdOXvzqnpfwENqYD+R35E7osggoWk5UuToVra8VvOfB/8WAay+Qa7CMKC5xM+/QBxHMY35HFsiJ6ikgMip6Y/WQtMe5tWhF14LoaycW0kBRhzwyFzTbctj7wJkA155EGw6gvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com; spf=none smtp.mailfrom=ultrarisc.com; dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b=RhPbf673; arc=none smtp.client-ip=218.76.62.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b="RhPbf673"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:From:Date:Subject:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	To:Cc; bh=kWyYSh9U7/2QyAu4eQEIiPhdgN79fJo5sNNkM2lBq9c=; b=RhPbf6
	73/S7ePwwdc8hdv3wE2EErcBQioGhJxzkKDp3fUX4FxAvjp+xOZWfGWPz+U+9CRF
	WIVrah7xx8V0EEQ4HCYnqYjqnBhWMqAbmmtyARH0la366CWjGNk8JRmHIFX7tkRb
	GxyhwM+MZp0mfbxu7CDv6tYV7HnpkVGPiGCmw=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwDXEEKKG0NqLhgOAA--.14719S2;
	Tue, 30 Jun 2026 09:27:38 +0800 (CST)
From: Xincheng Zhang <zhangxincheng@ultrarisc.com>
Date: Tue, 30 Jun 2026 09:26:48 +0800
Subject: [PATCH v3] usb: xhci-pci: Limit VIA VL805 DMA addressing to 36
 bits
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-xhci-via-dma-fix-v3-1-690dcb8cf75a@ultrarisc.com>
X-B4-Tracking: v=1; b=H4sIAFcbQ2oC/33NQQ6CMBAF0KuQrq1hWqnFlfcwLspQZIyCaaHBE
 O5uixtjjMs/+fP+zLx1ZD07ZDNzNpCnvotBbjKGrekullMdMxO5ULkSkk8tEg9keH03vKGJY6F
 kpXVpTbFj8e3hbDyv5On8zn6srhaH5KRGS37o3XPdDJB6f/gAHLhsQKAGA9jo43gbnHHkcYv9n
 aWJID6R8gciEqJzUHsJpSrEN7IsywsO/mdgCwEAAA==
X-Change-ID: 20260623-xhci-via-dma-fix-c563b889ea54
To: Mathias Nyman <mathias.nyman@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michal Pecio <michal.pecio@gmail.com>, 
 Forest Crossman <cyrozap@gmail.com>, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Xincheng Zhang <zhangxincheng@ultrarisc.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782782825; l=4525;
 i=zhangxincheng@ultrarisc.com; s=20260624; h=from:subject:message-id;
 bh=53plWYcXg7dRHkMjeOTTLC0De2vpp4XJpUviuouYYhw=;
 b=4CIpsc+NWz0tnrNdSe6z0ovZoL1QQJGon0TcBpFGIzyWkIOcizUsutBl1zN/ofXMLLODAsyrs
 KZv5g0EkH51CXMwOjxJlvUpsmgtiDoXG2zDR8nB28MMW9c6B1296nhE
X-Developer-Key: i=zhangxincheng@ultrarisc.com; a=ed25519;
 pk=QKwIEfHqvHrwmpA11qRt63ntQ3+BYBPSEvecshGYdOA=
X-CM-TRANSID:AQAAfwDXEEKKG0NqLhgOAA--.14719S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAryDXF47Cr4DAFW7Zw4UCFg_yoWrtr1UpF
	45Ww4UCrs3tF4Sv3Z3Ca18Za4rJ3Z5Ar98KFy7K34Y9w45AryUWF1kCw15Z3ZrWw4xXr1Y
	qr1kWrW5WayxGaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
X-CM-SenderInfo: x2kd0wp0lquxxhqjq3powut2xlvfhudrp/1tbiAQAODGpB680ANwAAs5

The VIA VL805/806 xHCI controller advertises AC64, but fails to handle
DMA addresses at or above 0x1000000000. On systems with large amounts of
RAM, this can cause USB device failures when the controller is given DMA
addresses beyond its usable address width.

Do not use XHCI_NO_64BIT_SUPPORT for this controller. That quirk clears
the cached AC64 capability and limits DMA to 32 bits, causing unnecessary
bouncing for addresses between 4GiB and 64GiB and hiding the controller's
real AC64 capability from code that may need to distinguish register
access width from usable DMA address width.

Track the usable DMA address width separately from the AC64 capability.
Initialize the generic xhci->dma_mask_bits field to 64 and let PCI quirks
reduce it for controllers with narrower DMA support. Set VIA VL805/806 to
36 bits so the DMA API only hands it addresses in the range it can handle
while keeping HCCPARAMS1.AC64 visible.

Cc: stable@vger.kernel.org
Signed-off-by: Xincheng Zhang <zhangxincheng@ultrarisc.com>
---
Changes in v3:
- Replace the dedicated 36-bit quirk bit with generic xhci->dma_mask_bits.
- Let PCI quirks set the usable DMA address width directly.
- Keep the existing 32-bit fallback behavior unchanged.
- Link to v2: https://lore.kernel.org/all/20260629-xhci-via-dma-fix-v2-1-380167319652@ultrarisc.com/

Changes in v2:
- Replace XHCI_NO_64BIT_SUPPORT with a dedicated 36-bit DMA mask quirk.
- Preserve HCCPARAMS1.AC64 instead of clearing it for VL805/806.
- Limit VL805/806 DMA to DMA_BIT_MASK(36) instead of 32-bit.
- Add a stable Cc trailer.
- Link to v1: https://lore.kernel.org/all/20260623-xhci-via-dma-fix-v1-1-3f12c81a1cf8@ultrarisc.com/
---
 drivers/usb/host/xhci-pci.c |  1 +
 drivers/usb/host/xhci.c     | 15 ++++++++++-----
 drivers/usb/host/xhci.h     |  1 +
 3 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 039c26b241d0..6b3fcba44b08 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -448,6 +448,7 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
 	if (pdev->vendor == PCI_VENDOR_ID_VIA && pdev->device == PCI_DEVICE_ID_VIA_VL805) {
 		xhci->quirks |= XHCI_LPM_SUPPORT;
 		xhci->quirks |= XHCI_TRB_OVERFETCH;
+		xhci->dma_mask_bits = 36;
 	}
 
 	if (pdev->vendor == PCI_VENDOR_ID_ASMEDIA &&
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 6922cc5496c1..5e6f8f0bb901 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -5457,6 +5457,7 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
 	if (xhci->hci_version > 0x100)
 		xhci->hcc_params2 = readl(&xhci->cap_regs->hcc_params2);
 
+	xhci->dma_mask_bits = 64;
 	xhci->max_slots = min(HCS_MAX_SLOTS(hcs_params1), MAX_HC_SLOTS);
 	xhci->max_ports = min(HCS_MAX_PORTS(hcs_params1), MAX_HC_PORTS);
 	/* xhci-plat or xhci-pci might have set max_interrupters already */
@@ -5506,12 +5507,16 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
 	if (xhci->quirks & XHCI_NO_64BIT_SUPPORT)
 		xhci->hcc_params &= ~BIT(0);
 
-	/* Set dma_mask and coherent_dma_mask to 64-bits,
-	 * if xHC supports 64-bit addressing */
+	/*
+	 * Set dma_mask and coherent_dma_mask to 64-bits if xHC supports
+	 * 64-bit addressing, unless a controller-specific quirk callback
+	 * limits the usable address width.
+	 */
 	if ((xhci->hcc_params & HCC_64BIT_ADDR) &&
-			!dma_set_mask(dev, DMA_BIT_MASK(64))) {
-		xhci_dbg(xhci, "Enabling 64-bit DMA addresses.\n");
-		dma_set_coherent_mask(dev, DMA_BIT_MASK(64));
+	    !dma_set_mask(dev, DMA_BIT_MASK(xhci->dma_mask_bits))) {
+		xhci_dbg(xhci, "Enabling %u-bit DMA addresses.\n",
+			 xhci->dma_mask_bits);
+		dma_set_coherent_mask(dev, DMA_BIT_MASK(xhci->dma_mask_bits));
 	} else {
 		/*
 		 * This is to avoid error in cases where a 32-bit USB
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index d02046a573e4..2d3941b5e1e3 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1526,6 +1526,7 @@ struct xhci_hcd {
 	/* imod_interval in ns (I * 250ns) */
 	u32		imod_interval;
 	u32		page_size;
+	unsigned int	dma_mask_bits;
 	/* MSI-X/MSI vectors */
 	int		nvecs;
 	/* optional clocks */

---
base-commit: 502d801f0ab03e4f32f9a33d203154ce84887921
change-id: 20260623-xhci-via-dma-fix-c563b889ea54

Best regards,
--  
Xincheng Zhang <zhangxincheng@ultrarisc.com>

