Received: from bm.lauterbach.com (bm.lauterbach.com [62.154.241.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F3D29B8D9
	for <linux-usb@vger.kernel.org>; Tue,  3 Mar 2026 13:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.154.241.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772545062; cv=none; b=BjDv6waZkZu71d9K/X32uPx6SpOOSwIyc+jga9iyERjgU6+715r8NS+HkoEh1ANyhM3a8E0eyLFqMqsAtSLPWKOj8szXIW4eca82Xs6op7yema7W153SnrelTsw3kX3u78pGM1D7WgxCvT98QLeKLYQjP+FOgRKjkB3T2cAmqnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772545062; c=relaxed/simple;
	bh=K/CqiPRu9ScLl85rnks7gH9jyunuQ9JtkZmSSGIbB4A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q3P+Wd4pNqZ78wX3lAjP6U7IE5Xmy0GtycTbj9gRgWbVm7MEjw9m0LnwHWcLj0A2/tyWKP9gqGnyWDK3QffTFDQO6t1z4Ae4jY0Em0tfuBcVH+T0mkNnM0+tfwXkgSnmkO17HkSpQx4JrjXjiyQyKXJKOEQsoIscBiZSA1awXUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lauterbach.com; spf=pass smtp.mailfrom=lauterbach.com; arc=none smtp.client-ip=62.154.241.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lauterbach.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lauterbach.com
Received: from ingpc2.intern.lauterbach.com (unknown [10.2.10.44])
	(Authenticated sender: ingo.rohloff@lauterbach.com)
	by bm.lauterbach.com (Postfix) with ESMTPSA id 41835DD8C557;
	Tue, 03 Mar 2026 14:37:32 +0100 (CET)
From: Ingo Rohloff <ingo.rohloff@lauterbach.com>
To: Thinh.Nguyen@synopsys.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	Ingo Rohloff <ingo.rohloff@lauterbach.com>
Subject: [PATCH v4 1/1] usb: dwc3: Support USB3340x ULPI PHY high-speed negotiation.
Date: Tue,  3 Mar 2026 14:37:20 +0100
Message-ID: <20260303133720.17167-2-ingo.rohloff@lauterbach.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260303133720.17167-1-ingo.rohloff@lauterbach.com>
References: <20260303133720.17167-1-ingo.rohloff@lauterbach.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 166a2dfb-2e12-4590-8fa5-72e30323519f
X-Bm-Transport-Timestamp: 1772545052319

The Microchip USB3340x ULPI PHY requires a delay when switching to the
high-speed transmitter. See:
    http://ww1.microchip.com/downloads/en/DeviceDoc/80000645A.pdf
    Module 2 "Device Enumeration Failure with Link IP Systems"

For details on the behavior and fix, refer to the AMD (formerly Xilinx)
forum post: "USB stuck in full speed mode with USB3340 ULPI PHY, ZynqMP."

This patch uses the USB PHY Vendor-ID and Product-ID to detect the
USB3340 PHY and then applies the necessary fix if this PHY is found.

Signed-off-by: Ingo Rohloff <ingo.rohloff@lauterbach.com>
---
 drivers/usb/dwc3/core.c | 16 +++++++++++++++
 drivers/usb/dwc3/core.h |  4 ++++
 drivers/usb/dwc3/ulpi.c | 44 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 64 insertions(+)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index cacc4ec9f7ce..da1572d268d0 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -782,6 +782,20 @@ static int dwc3_hs_phy_setup(struct dwc3 *dwc, int index)
 	return 0;
 }
 
+static void dwc3_ulpi_apply_config(struct dwc3 *dwc)
+{
+	int index;
+	u32 reg;
+
+	if (dwc->enable_usb2_transceiver_delay) {
+		for (index = 0; index < dwc->num_usb2_ports; index++) {
+			reg = dwc3_readl(dwc->regs, DWC3_GUSB2PHYCFG(index));
+			reg |= DWC3_GUSB2PHYCFG_XCVRDLY;
+			dwc3_writel(dwc->regs, DWC3_GUSB2PHYCFG(index), reg);
+		}
+	}
+}
+
 /**
  * dwc3_phy_setup - Configure USB PHY Interface of DWC3 Core
  * @dwc: Pointer to our controller context structure
@@ -1363,6 +1377,8 @@ int dwc3_core_init(struct dwc3 *dwc)
 		dwc->ulpi_ready = true;
 	}
 
+	dwc3_ulpi_apply_config(dwc);
+
 	if (!dwc->phys_ready) {
 		ret = dwc3_core_get_phy(dwc);
 		if (ret)
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 67bcc8dccc89..7d0845184223 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -302,6 +302,7 @@
 #define DWC3_GUSB2PHYCFG_SUSPHY		BIT(6)
 #define DWC3_GUSB2PHYCFG_ULPI_UTMI	BIT(4)
 #define DWC3_GUSB2PHYCFG_ENBLSLPM	BIT(8)
+#define DWC3_GUSB2PHYCFG_XCVRDLY	BIT(9)
 #define DWC3_GUSB2PHYCFG_PHYIF(n)	(n << 3)
 #define DWC3_GUSB2PHYCFG_PHYIF_MASK	DWC3_GUSB2PHYCFG_PHYIF(1)
 #define DWC3_GUSB2PHYCFG_USBTRDTIM(n)	(n << 10)
@@ -1163,6 +1164,8 @@ struct dwc3_glue_ops {
  *	3	- Reserved
  * @dis_metastability_quirk: set to disable metastability quirk.
  * @dis_split_quirk: set to disable split boundary.
+ * @enable_usb2_transceiver_delay: Set to insert a delay before the
+ *			assertion of the TxValid signal during a HS Chirp.
  * @sys_wakeup: set if the device may do system wakeup.
  * @wakeup_configured: set if the device is configured for remote wakeup.
  * @suspended: set to track suspend event due to U3/L2.
@@ -1406,6 +1409,7 @@ struct dwc3 {
 	unsigned		dis_metastability_quirk:1;
 
 	unsigned		dis_split_quirk:1;
+	unsigned		enable_usb2_transceiver_delay:1;
 	unsigned		async_callbacks:1;
 	unsigned		sys_wakeup:1;
 	unsigned		wakeup_configured:1;
diff --git a/drivers/usb/dwc3/ulpi.c b/drivers/usb/dwc3/ulpi.c
index 57daad15f502..7197bddae88a 100644
--- a/drivers/usb/dwc3/ulpi.c
+++ b/drivers/usb/dwc3/ulpi.c
@@ -14,6 +14,8 @@
 #include "core.h"
 #include "io.h"
 
+#define USB_VENDOR_MICROCHIP 0x0424
+
 #define DWC3_ULPI_ADDR(a) \
 		((a >= ULPI_EXT_VENDOR_SPECIFIC) ? \
 		DWC3_GUSB2PHYACC_ADDR(ULPI_ACCESS_EXTENDED) | \
@@ -83,6 +85,46 @@ static const struct ulpi_ops dwc3_ulpi_ops = {
 	.write = dwc3_ulpi_write,
 };
 
+static void dwc3_ulpi_detect_config(struct dwc3 *dwc)
+{
+	u16 product_id;
+	u16 vendor_id;
+	int ret;
+
+	/* Test the interface */
+	ret = dwc3_ulpi_write(dwc->dev, ULPI_SCRATCH, 0xaa);
+	if (ret < 0)
+		return;
+
+	ret = dwc3_ulpi_read(dwc->dev, ULPI_SCRATCH);
+	if (ret < 0)
+		return;
+
+	if (ret != 0xaa)
+		return;
+
+	vendor_id = dwc3_ulpi_read(dwc->dev, ULPI_VENDOR_ID_LOW);
+	vendor_id |= dwc3_ulpi_read(dwc->dev, ULPI_VENDOR_ID_HIGH) << 8;
+
+	product_id = dwc3_ulpi_read(dwc->dev, ULPI_PRODUCT_ID_LOW);
+	product_id |= dwc3_ulpi_read(dwc->dev, ULPI_PRODUCT_ID_HIGH) << 8;
+
+	dev_dbg(
+		dwc->dev, "dwc3_ulpi: VendorID 0x%04x, ProductID 0x%04x\n",
+		vendor_id, product_id
+	);
+	switch (vendor_id) {
+	case USB_VENDOR_MICROCHIP:
+		switch (product_id) {
+		case 0x0009:
+			/* Microchip USB3340 ULPI PHY */
+			dwc->enable_usb2_transceiver_delay = true;
+			break;
+		}
+		break;
+	}
+}
+
 int dwc3_ulpi_init(struct dwc3 *dwc)
 {
 	/* Register the interface */
@@ -92,6 +134,8 @@ int dwc3_ulpi_init(struct dwc3 *dwc)
 		return PTR_ERR(dwc->ulpi);
 	}
 
+	dwc3_ulpi_detect_config(dwc);
+
 	return 0;
 }
 
-- 
2.52.0

