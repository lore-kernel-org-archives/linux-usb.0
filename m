Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94912874FB;
	Tue, 28 Jul 2026 01:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785201438; cv=none; b=EdwZ2Bnv1KvIsnTJbq01yTrS5SEtVzOnwGuEhnn8csLt6dZiNMRyZcvVpqFq9YXxz2Mi8OVtl9cVwwHHGLnW1MCeSr3y8Lt78vnhF80a59cSUexWlMiRYFUDb+zOYseYzdeAGO5JWNheNrPEDoqnoSxgg+oM+Xck8ch1R2kY3K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785201438; c=relaxed/simple;
	bh=4kk3DIi3hSeJaKg4+WCxopCMwm57xBawPHQg2dH8qeM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mP8DukQwdfPx9bECTfl3dGiJEwRizlC+lnbVRGsVihLCNMAyB5yi4CILYfXqhlZ5DVX7OeCfuySwe9NfSwxG5oJyMmw3X+KdZJpXz+40kvP8NEL0BbBEUha5AKhgTyP556ylUJun+fEoFzOoyfgvkm+h8dxWsusXIJoyBKxp8+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=wYwybWiP; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=OBGMvRel; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="wYwybWiP";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="OBGMvRel"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4h8Hch0NnLzMlSl;
	Tue, 28 Jul 2026 03:17:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1785201428;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5CLFfspPnUGdZYl6Z1z8fzTCeZlqO+IczWtXHc5c3eM=;
	b=wYwybWiPXKnXvG7Q0vz4meL03FYrm2Hihcl+iMG1GXEYrVsGFrWc2NOR/JAx08XoIBWccA
	RHrMPtNE9Go4OGVm0qCeZ9jkT9UjrIufwc4UzBXtltzgkhyrlOIm2oSZZ/5T+Ol108qatB
	WX+8cS+10IJ4oR+sqcs2OjT7bwToEbylJOdIvB1h8zjbBMsk+1aJI23PKEEATAje/0Iasu
	S0I2azGLK0lm7HOVNeKiObYbvXI+nobVeJwWwG2OXaGGmdEdXi6VNvwZH84mB2f1vCAsUD
	T+WoTj/McBcVIeB2RT6CE7btjQXD2WPHDXVUejuiI4jxq0st5j3qaWfLCX/LMg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=OBGMvRel;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1785201426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5CLFfspPnUGdZYl6Z1z8fzTCeZlqO+IczWtXHc5c3eM=;
	b=OBGMvRelaGWJnHitRDk+1ek9TsXEvD0YhQXO8M0gvefRHvxQ+jLRTSQBfIX8Y7/+CPjHPX
	7Gy3XgPHYfhK4NQ2fiET5m1W8LzfCEftKXfYWUsN+mUjZGn8P+OHWzokpAzMxZ1oj3oz+w
	IVaIAwOSCW7WBawKkjCalfBDqsuT4DruDt79hVJ8y1I4Qlo/ZjnRa2l++xogqfGxqtQnxU
	TB/dE67gZMZ6nFJqa8WP3t1MVYur4kV949Qh139j/RJoA5epj2bzrsfoAYJiZI1OIFohBw
	9v48MuYDL8HDF3W4LeQ3tE5ojyN/BQ3pMC3ViFYqs6EIgL0Sxuq0+Rn4zy9usg==
To: linux-usb@vger.kernel.org
Cc: Thanh Quan <thanh.quan.xn@renesas.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v1 2/2] usb: dwc3: Add Renesas R-Car Gen5 DWC3 xHCI USB controller glue
Date: Tue, 28 Jul 2026 03:14:59 +0200
Message-ID: <20260728011656.465040-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260728011656.465040-1-marek.vasut+renesas@mailbox.org>
References: <20260728011656.465040-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: w6s96og8o5wye9q3xpjma6gwcijxdpff
X-MBO-RS-ID: cb3a2a15fd7947fff26
X-Rspamd-Queue-Id: 4h8Hch0NnLzMlSl

From: Thanh Quan <thanh.quan.xn@renesas.com>

The Renesas R-Car Gen5 SoC contains multiple instances of DWC3 USB
controller with glue logic wrapper around them. Add driver for the
glue logic around the DWC3 USB controller core.

Signed-off-by: Thanh Quan <thanh.quan.xn@renesas.com>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Cc: linux-usb@vger.kernel.org
---
 drivers/usb/dwc3/Kconfig          |  10 ++
 drivers/usb/dwc3/Makefile         |   1 +
 drivers/usb/dwc3/dwc3-rcar-gen5.c | 150 ++++++++++++++++++++++++++++++
 3 files changed, 161 insertions(+)
 create mode 100644 drivers/usb/dwc3/dwc3-rcar-gen5.c

diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
index 18169727a413e..7d8ee192b1241 100644
--- a/drivers/usb/dwc3/Kconfig
+++ b/drivers/usb/dwc3/Kconfig
@@ -234,4 +234,14 @@ config USB_DWC3_GOOGLE
 	  To compile this driver as a module, choose M here: the
 	  module will be called dwc3-google.ko.
 
+config USB_DWC3_RCAR_GEN5
+	tristate "Renesas R-Car Gen5 DWC3 Platform Driver"
+	depends on ARCH_RENESAS || COMPILE_TEST
+	default USB_DWC3
+	help
+	  Support the DesignWare Core USB3 IP found on Renesas R-Car Gen5
+	  SoC. This driver provides the glue layer for the USB controller
+	  on Renesas R-Car Gen5 platform.
+	  Say 'Y' or 'M' if you have such device.
+
 endif
diff --git a/drivers/usb/dwc3/Makefile b/drivers/usb/dwc3/Makefile
index f37971197203e..99bbd147f0b5f 100644
--- a/drivers/usb/dwc3/Makefile
+++ b/drivers/usb/dwc3/Makefile
@@ -61,3 +61,4 @@ obj-$(CONFIG_USB_DWC3_OCTEON)		+= dwc3-octeon.o
 obj-$(CONFIG_USB_DWC3_RTK)		+= dwc3-rtk.o
 obj-$(CONFIG_USB_DWC3_GENERIC_PLAT)	+= dwc3-generic-plat.o
 obj-$(CONFIG_USB_DWC3_GOOGLE)		+= dwc3-google.o
+obj-$(CONFIG_USB_DWC3_RCAR_GEN5)	+= dwc3-rcar-gen5.o
diff --git a/drivers/usb/dwc3/dwc3-rcar-gen5.c b/drivers/usb/dwc3/dwc3-rcar-gen5.c
new file mode 100644
index 0000000000000..344d0851559f5
--- /dev/null
+++ b/drivers/usb/dwc3/dwc3-rcar-gen5.c
@@ -0,0 +1,150 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Renesas USB device driver with DWC3 integration
+ *
+ * Copyright (C) 2025-2026 Renesas Electronics Corporation
+ */
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/reset.h>
+
+struct dwc3_rcar_gen5_priv {
+	void __iomem		*base;
+	struct clk		*clk;
+	bool			use_usb3_flow;
+};
+
+static int dwc3_rcar_gen5_init(struct dwc3_rcar_gen5_priv *priv)
+{
+	/*
+	 * The datasheet describes initialization procedure without full
+	 * information about the registers. Therefore, the source code is
+	 * based on the bare metal code shared by the board team.
+	 */
+	writew(0x211, priv->base + 0x26);
+
+	/* USB3 does not need additional register programming. */
+	if (priv->use_usb3_flow)
+		return 0;
+
+	writew(0x11, priv->base + 0x81c);
+	writew(0x0, priv->base + 0x81a);
+	writew(0x1, priv->base + 0x802);
+
+	usleep_range(10000, 20000);
+
+	writew(0x0, priv->base + 0x802);
+	writew(0x1, priv->base + 0x2a);
+	writew(0x1, priv->base + 0x81a);
+
+	usleep_range(10000, 20000);
+
+	return 0;
+}
+
+static int dwc3_rcar_gen5_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *subnode;
+	struct reset_control *reset;
+	const char *maximum_speed;
+	struct dwc3_rcar_gen5_priv *priv;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, priv);
+
+	priv->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->base))
+		return dev_err_probe(dev, PTR_ERR(priv->base), "Failed to map registers\n");
+
+	reset = devm_reset_control_get(dev, NULL);
+	if (IS_ERR(reset))
+		return dev_err_probe(dev, PTR_ERR(reset), "Failed to get reset control\n");
+
+	priv->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(priv->clk))
+		return dev_err_probe(dev, PTR_ERR(priv->clk), "Failed to get clock control\n");
+
+	subnode = of_get_compatible_child(dev->of_node, "synopsys,dwc3");
+	if (!subnode)
+		return dev_err_probe(dev, -ENODEV, "Failed to find DWC3 subnode node\n");
+
+	ret = of_property_read_string(subnode, "maximum-speed", &maximum_speed);
+	of_node_put(subnode);
+	if (ret)
+		return dev_err_probe(dev, -ENODEV, "Failed to determine maximum speed\n");
+
+	priv->use_usb3_flow = !strcmp(maximum_speed, "super-speed-plus") ||
+			      !strcmp(maximum_speed, "super-speed");
+
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to resume runtime PM\n");
+
+	return devm_of_platform_populate(dev);
+}
+
+static int __maybe_unused dwc3_rcar_gen5_suspend(struct device *dev)
+{
+	struct dwc3_rcar_gen5_priv *priv = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(priv->clk);
+
+	return 0;
+}
+
+static int __maybe_unused dwc3_rcar_gen5_resume(struct device *dev)
+{
+	struct dwc3_rcar_gen5_priv *priv = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_prepare_enable(priv->clk);
+	if (ret) {
+		dev_err(dev, "Failed to enable clock on resume: %d\n", ret);
+		return ret;
+	}
+
+	usleep_range(10000, 20000);
+
+	return dwc3_rcar_gen5_init(priv);
+}
+
+static DEFINE_RUNTIME_DEV_PM_OPS(dwc3_rcar_gen5_pm_ops,
+				 dwc3_rcar_gen5_suspend,
+				 dwc3_rcar_gen5_resume, NULL);
+
+static const struct of_device_id dwc3_rcar_gen5_of_match[] = {
+	{ .compatible = "renesas,rcar-gen5-usb" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, dwc3_rcar_gen5_of_match);
+
+static struct platform_driver dwc3_rcar_gen5_driver = {
+	.probe		= dwc3_rcar_gen5_probe,
+	.driver		= {
+		.name	= "renesas-rcar-gen5-usb",
+		.of_match_table = dwc3_rcar_gen5_of_match,
+		.pm	= &dwc3_rcar_gen5_pm_ops,
+	},
+};
+
+module_platform_driver(dwc3_rcar_gen5_driver);
+
+MODULE_AUTHOR("Thanh Quan");
+MODULE_DESCRIPTION("Renesas R-Car X5H USB Glue Layer Driver");
+MODULE_LICENSE("GPL");
-- 
2.53.0

