Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE9119CC0F;
	Wed, 12 Aug 2026 01:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786496568; cv=none; b=KzuRAyn28BynXoXms0kZLFl+A2eQMV4gWtngBauVqllBGHhiAAwRoxe459M1WyEBWcjuFlbw1MOdTO9IcJuFvs976v0GpD+zRt0LajfwUIdFdp3zsmaiYULeSo9o1xCSrE1dzEx+/HnyxZWIGkp1Qt6fPd7xcEH6Qvz4OVDRNTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786496568; c=relaxed/simple;
	bh=Q37VI9VkNh1tiUmaLYg5nQyvcXYWhRCSRud1KsuLHuI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OoMsLcLW06M6YM9Z+saK0GZoXJTmDypmiM/0caGtQe+pMdEy+U+g2pMh5DxeARYv0dE+8Ww2IHOSvgV3toxXvYthVofxsQgMzfdjq+wEMDNJH7yFNZPkt6KA+OYTWPkB1x8LYiyTvJqlS4NEvDhGjlBwukn0UA2mwBm+hjKHB6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=CGz+ZNWB; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="CGz+ZNWB"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2680711A0C6;
	Wed, 12 Aug 2026 03:02:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1786496560; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=z8pZrf4Gtk8+ekwt54vGpwfhfI6JebdT3Yg7Td3HQdc=;
	b=CGz+ZNWBMgE9RvIW3hu+FtrZ8o74enZFYYt11xvA9w0/D7+KU8J2t0QKlEkVJitChfuf5D
	+iGoHw+S4JTxEhOB4KgQfJ9is1Djdw6BTgA02R+0xe6fl18Wofzi+tzhV4XoSBbLQKw29g
	olzy0Mbrhe1Io4vQL9sBkvN6Azc/4FsPuvimvlSNj4vFt8ahkLCW/Vi7iSzAz63L+Rypyb
	LeKTDgQHcZdVxS5v0JVM+vt8qXZF/n9ZJf9lIGicYVHPiD8EPaXvPjK7S7V26bRGTrtD6o
	wXbPdMGmNqwFltx61ups/w/U0a6LMHF2UMl6yLemKc40u2c6jutCtDGyAk780g==
From: Marek Vasut <marex@nabladev.com>
To: linux-usb@vger.kernel.org
Cc: Pankaj Dev <pankaj.dev@st.com>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Marek Vasut <marex@nabladev.com>,
	Rahul Kumar <rahul.kumar05@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Rosen Penev <rosenp@gmail.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	devicetree@vger.kernel.org,
	kernel@dh-electronics.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 2/8] phy: stm32: Add support for ST STM32MP25 USB2-FEMTO PHY
Date: Wed, 12 Aug 2026 02:55:42 +0200
Message-ID: <20260812010157.1772849-3-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260812010157.1772849-1-marex@nabladev.com>
References: <20260812010157.1772849-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Pankaj Dev <pankaj.dev@st.com>

Add USB2 PHY driver for STM32MP25 USB2 controllers, which includes the
USB2.0 host-only controller and USB 2.0 part of the DWC3 controller.
Two such PHYs in total are present in STM32MP25 SoC, they both are
slightly different, therefore they use different compatible string
to discern them.

Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Signed-off-by: Marek Vasut <marex@nabladev.com>
Signed-off-by: Pankaj Dev <pankaj.dev@st.com>
Signed-off-by: Rahul Kumar <rahul.kumar05@st.com>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Christian Bruel <christian.bruel@foss.st.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Pankaj Dev <pankaj.dev@st.com>
Cc: Rahul Kumar <rahul.kumar05@st.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Rosen Penev <rosenp@gmail.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-phy@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-usb@vger.kernel.org
---
 drivers/phy/st/Kconfig             |  10 +
 drivers/phy/st/Makefile            |   1 +
 drivers/phy/st/phy-stm32-usb2phy.c | 356 +++++++++++++++++++++++++++++
 3 files changed, 367 insertions(+)
 create mode 100644 drivers/phy/st/phy-stm32-usb2phy.c

diff --git a/drivers/phy/st/Kconfig b/drivers/phy/st/Kconfig
index 49206185e5633..2835bb67bca9e 100644
--- a/drivers/phy/st/Kconfig
+++ b/drivers/phy/st/Kconfig
@@ -58,3 +58,13 @@ config PHY_STM32_USBPHYC
 	  used by an HS USB Host controller, and the second one is shared
 	  between an HS USB OTG controller and an HS USB Host controller,
 	  selected by a USB switch.
+
+config PHY_STM32_USB2PHY
+	tristate "STMicroelectronics STM32MP25 USB2.0 PHY Controller driver"
+	depends on ARCH_STM32 || COMPILE_TEST
+	depends on COMMON_CLK
+	select GENERIC_PHY
+	help
+	  Enable this to support the High-Speed USB 2.0 transceivers that are
+	  part of the STMicroelectronics STM32MP25 SoCs. The PHY itself is a
+	  Synopsys FEMTO-PHY.
diff --git a/drivers/phy/st/Makefile b/drivers/phy/st/Makefile
index cb80e954ea9f0..4945df5ed78a8 100644
--- a/drivers/phy/st/Makefile
+++ b/drivers/phy/st/Makefile
@@ -5,3 +5,4 @@ obj-$(CONFIG_PHY_ST_SPEAR1340_MIPHY)	+= phy-spear1340-miphy.o
 obj-$(CONFIG_PHY_STIH407_USB)		+= phy-stih407-usb.o
 obj-$(CONFIG_PHY_STM32_COMBOPHY)	+= phy-stm32-combophy.o
 obj-$(CONFIG_PHY_STM32_USBPHYC) 	+= phy-stm32-usbphyc.o
+obj-$(CONFIG_PHY_STM32_USB2PHY) 	+= phy-stm32-usb2phy.o
diff --git a/drivers/phy/st/phy-stm32-usb2phy.c b/drivers/phy/st/phy-stm32-usb2phy.c
new file mode 100644
index 0000000000000..d902354f88b69
--- /dev/null
+++ b/drivers/phy/st/phy-stm32-usb2phy.c
@@ -0,0 +1,356 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * STMicroelectronics STM32 USB2 PHY Controller driver
+ * Currently Only supported for STM32MP25
+ *
+ * Copyright (C) 2022 STMicroelectronics
+ * Author(s): Pankaj Dev <pankaj.dev@st.com>.
+ */
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/reset.h>
+#include <linux/usb/role.h>
+#include <linux/mfd/syscon.h>
+
+#define SYSCFG_USB2PHY2CR_USB2PHY2CMN		BIT(2)
+#define SYSCFG_USB2PHY2CR_VBUSVALID		BIT(4)
+#define SYSCFG_USB2PHY2CR_VBUSVLDEXTSEL		BIT(5)
+#define SYSCFG_USB2PHY2CR_VBUSVLDEXT		BIT(6)
+
+struct stm32_usb2phy {
+	struct phy				*phy;
+	struct regmap				*regmap;
+	struct device				*dev;
+	struct reset_control			*rstc;
+	struct clk				*phyref;
+	struct regulator			*vdd33;
+	struct clk_hw				clk48_hw;
+	const struct stm32mp2_usb2phy_hw_data	*hw_data;
+	atomic_t				en_refcnt;
+	enum phy_mode				mode;
+	u32					cr_offset;
+	bool					is_init;
+};
+
+struct stm32mp2_usb2phy_hw_data {
+	u32			phyrefsel_mask;
+	bool			is_usb2_host_only;
+};
+
+static int stm32_usb2phy_enable(struct stm32_usb2phy *phy_dev)
+{
+	const struct stm32mp2_usb2phy_hw_data *phy_data = phy_dev->hw_data;
+	unsigned long rate;
+	int refsel, ret;
+
+	/* Check if a phy is already init or clk48 in use */
+	if (atomic_inc_return(&phy_dev->en_refcnt) > 1)
+		return 0;
+
+	rate = clk_get_rate(phy_dev->phyref);
+	if (rate == 19200000)
+		refsel = 0;
+	else if (rate == 20000000)
+		refsel = 1;
+	else if (rate == 24000000)
+		refsel = 2;
+	else
+		return -EINVAL;
+
+	ret = regmap_update_bits(phy_dev->regmap,
+				 phy_dev->cr_offset,
+				 phy_data->phyrefsel_mask,
+				 field_prep(phy_data->phyrefsel_mask, refsel));
+	if (ret)
+		return ret;
+
+	if (phy_data->is_usb2_host_only) {
+		/*
+		 * The clock should default to active after standby, as it is
+		 * needed when resuming OHCI to access its registers.
+		 * CMN is default reset to 1, so enforce it is cleared, when the
+		 * clock enable request from OHCI driver comes at resume time.
+		 */
+		ret = regmap_clear_bits(phy_dev->regmap, phy_dev->cr_offset,
+					SYSCFG_USB2PHY2CR_USB2PHY2CMN);
+		if (ret)
+			return ret;
+	}
+
+	ret = regulator_enable(phy_dev->vdd33);
+	if (ret)
+		return ret;
+
+	ret = clk_prepare_enable(phy_dev->phyref);
+	if (ret)
+		goto error_regdis;
+
+	ret = reset_control_deassert(phy_dev->rstc);
+	if (ret)
+		goto error_clkdis;
+
+	return 0;
+
+error_clkdis:
+	clk_disable_unprepare(phy_dev->phyref);
+error_regdis:
+	regulator_disable(phy_dev->vdd33);
+
+	return ret;
+}
+
+static int stm32_usb2phy_disable(struct stm32_usb2phy *phy_dev)
+{
+	int ret;
+
+	/* Check if a phy is still init or clk48 in use */
+	if (atomic_dec_return(&phy_dev->en_refcnt) > 0)
+		return 0;
+
+	ret = reset_control_assert(phy_dev->rstc);
+	if (ret)
+		return ret;
+
+	clk_disable_unprepare(phy_dev->phyref);
+
+	return regulator_disable(phy_dev->vdd33);
+}
+
+static int stm32_usb2phy_set_mode(struct phy *phy, enum phy_mode mode, int submode)
+{
+	struct stm32_usb2phy *phy_dev = phy_get_drvdata(phy);
+	const struct stm32mp2_usb2phy_hw_data *phy_data = phy_dev->hw_data;
+	u32 val, mask = SYSCFG_USB2PHY2CR_USB2PHY2CMN;
+	int ret;
+
+	if (mode == PHY_MODE_USB_HOST) {
+		val = 0;
+		if (!phy_data->is_usb2_host_only) {
+			mask |= SYSCFG_USB2PHY2CR_VBUSVLDEXT |
+				SYSCFG_USB2PHY2CR_VBUSVALID;
+			if (submode != USB_ROLE_NONE)
+				val |= SYSCFG_USB2PHY2CR_VBUSVALID;
+		}
+	} else if (mode == PHY_MODE_USB_DEVICE) {
+		val = SYSCFG_USB2PHY2CR_USB2PHY2CMN |
+		      SYSCFG_USB2PHY2CR_VBUSVLDEXTSEL;
+		mask |= SYSCFG_USB2PHY2CR_VBUSVALID |
+			SYSCFG_USB2PHY2CR_VBUSVLDEXTSEL |
+			SYSCFG_USB2PHY2CR_VBUSVLDEXT;
+		if (submode != USB_ROLE_NONE)
+			val |= SYSCFG_USB2PHY2CR_VBUSVLDEXT;
+	} else {
+		return -EINVAL;
+	}
+
+	ret = regmap_update_bits(phy_dev->regmap, phy_dev->cr_offset, mask, val);
+	if (ret)
+		return ret;
+
+	phy_dev->mode = mode;
+
+	return 0;
+}
+
+static int stm32_usb2phy_init(struct phy *phy)
+{
+	struct stm32_usb2phy *phy_dev = phy_get_drvdata(phy);
+	int ret;
+
+	ret = stm32_usb2phy_enable(phy_dev);
+	if (ret)
+		return ret;
+
+	if (phy_dev->mode != PHY_MODE_INVALID) {
+		ret = stm32_usb2phy_set_mode(phy, phy_dev->mode, USB_ROLE_NONE);
+		if (ret) {
+			stm32_usb2phy_disable(phy_dev);
+			return ret;
+		}
+	}
+
+	phy_dev->is_init = true;
+
+	return 0;
+}
+
+static int stm32_usb2phy_exit(struct phy *phy)
+{
+	struct stm32_usb2phy *phy_dev = phy_get_drvdata(phy);
+	int ret;
+
+	ret = stm32_usb2phy_disable(phy_dev);
+	if (ret)
+		return ret;
+
+	phy_dev->is_init = false;
+
+	return 0;
+}
+
+static const struct phy_ops stm32_usb2phy_data = {
+	.init = stm32_usb2phy_init,
+	.exit = stm32_usb2phy_exit,
+	.set_mode = stm32_usb2phy_set_mode,
+	.owner = THIS_MODULE,
+};
+
+static int stm32_usb2phy_clk48_prepare(struct clk_hw *hw)
+{
+	struct stm32_usb2phy *phy_dev = container_of(hw, struct stm32_usb2phy,
+						     clk48_hw);
+
+	return stm32_usb2phy_enable(phy_dev);
+}
+
+static void stm32_usb2phy_clk48_unprepare(struct clk_hw *hw)
+{
+	struct stm32_usb2phy *phy_dev = container_of(hw, struct stm32_usb2phy,
+						     clk48_hw);
+
+	stm32_usb2phy_disable(phy_dev);
+}
+
+static unsigned long stm32_usb2phy_clk48_recalc_rate(struct clk_hw *hw,
+						     unsigned long parent_rate)
+{
+	return 48000000;
+}
+
+static const struct clk_ops stm32_usb2phy_clk48_ops = {
+	.prepare = stm32_usb2phy_clk48_prepare,
+	.unprepare = stm32_usb2phy_clk48_unprepare,
+	.recalc_rate = stm32_usb2phy_clk48_recalc_rate,
+};
+
+static int stm32_usb2phy_probe(struct platform_device *pdev)
+{
+	struct clk_init_data init = { .ops =  &stm32_usb2phy_clk48_ops };
+	struct phy_provider *phy_provider;
+	struct device *dev = &pdev->dev;
+	struct stm32_usb2phy *phy_dev;
+	struct phy *phy;
+	int ret;
+
+	phy_dev = devm_kzalloc(dev, sizeof(*phy_dev), GFP_KERNEL);
+	if (!phy_dev)
+		return -ENOMEM;
+
+	phy_dev->dev = dev;
+	dev_set_drvdata(dev, phy_dev);
+
+	phy_dev->rstc = devm_reset_control_get(dev, NULL);
+	if (IS_ERR(phy_dev->rstc))
+		return dev_err_probe(dev, PTR_ERR(phy_dev->rstc), "Failed to get USB2PHY reset\n");
+
+	phy_dev->phyref = devm_clk_get(dev, NULL);
+	if (IS_ERR(phy_dev->phyref))
+		return dev_err_probe(dev, PTR_ERR(phy_dev->phyref), "Failed to get phyref clk\n");
+
+	phy_dev->vdd33 = devm_regulator_get_optional(dev, "vdd33");
+	if (IS_ERR(phy_dev->vdd33))
+		return dev_err_probe(dev, PTR_ERR(phy_dev->vdd33), "Failed to get vdd3v3 supply\n");
+
+	phy_dev->regmap = syscon_regmap_lookup_by_phandle_args(dev->of_node, "st,syscfg", 1,
+							       &phy_dev->cr_offset);
+	if (IS_ERR(phy_dev->regmap)) {
+		return dev_err_probe(dev, PTR_ERR(phy_dev->regmap),
+				     "No st,syscfg phandle specified\n");
+	}
+
+	phy_dev->hw_data = device_get_match_data(dev);
+
+	phy = devm_phy_create(dev, NULL, &stm32_usb2phy_data);
+	if (IS_ERR(phy))
+		return dev_err_probe(dev, PTR_ERR(phy), "Failed to create PHY\n");
+
+	phy_dev->phy = phy;
+	phy_set_drvdata(phy, phy_dev);
+
+	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+	if (IS_ERR(phy_provider))
+		return PTR_ERR(phy_provider);
+
+	init.name = devm_kasprintf(dev, GFP_KERNEL, "clk_%s_48m",
+				   of_node_full_name(dev->of_node));
+	if (!init.name)
+		return -ENOMEM;
+
+	phy_dev->clk48_hw.init = &init;
+
+	ret = devm_clk_hw_register(phy_dev->dev, &phy_dev->clk48_hw);
+	if (ret)
+		return dev_err_probe(phy_dev->dev, ret, "Failed to register 48 MHz clock\n");
+
+	ret = devm_of_clk_add_hw_provider(phy_dev->dev, of_clk_hw_simple_get, &phy_dev->clk48_hw);
+	if (ret)
+		return dev_err_probe(phy_dev->dev, ret, "Failed to add 48 MHz clock provider\n");
+
+	return 0;
+}
+
+static int stm32_usb2phy_suspend(struct device *dev)
+{
+	struct stm32_usb2phy *phy_dev = dev_get_drvdata(dev);
+
+	if (phy_dev->is_init)
+		return stm32_usb2phy_disable(phy_dev);
+
+	return 0;
+}
+
+static int stm32_usb2phy_resume(struct device *dev)
+{
+	struct stm32_usb2phy *phy_dev = dev_get_drvdata(dev);
+
+	if (phy_dev->is_init)
+		return stm32_usb2phy_enable(phy_dev);
+
+	return 0;
+}
+
+/* STM32MP25xx USB 2.0 PHY attached to USB 2.0 Host controller */
+static const struct stm32mp2_usb2phy_hw_data stm32mp25_usb2phy1_hwdata = {
+	.phyrefsel_mask = GENMASK(6, 4),
+	.is_usb2_host_only = true,
+};
+
+/* STM32MP25xx USB 2.0 PHY attached to USB 2.0 part of DWC3 controller */
+static const struct stm32mp2_usb2phy_hw_data stm32mp25_usb2phy2_hwdata = {
+	.phyrefsel_mask = GENMASK(14, 12),
+	.is_usb2_host_only = false,
+};
+
+static const struct of_device_id stm32_usb2phy_of_match[] = {
+	{ .compatible = "st,stm32mp25-usb2phy1", .data = &stm32mp25_usb2phy1_hwdata },
+	{ .compatible = "st,stm32mp25-usb2phy2", .data = &stm32mp25_usb2phy2_hwdata },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, stm32_usb2phy_of_match);
+
+static DEFINE_SIMPLE_DEV_PM_OPS(stm32_usb2phy_pm_ops,
+				stm32_usb2phy_suspend, stm32_usb2phy_resume);
+
+static struct platform_driver stm32_usb2phy_driver = {
+	.probe = stm32_usb2phy_probe,
+	.driver = {
+		.name = "stm32-usb2phy",
+		.of_match_table = stm32_usb2phy_of_match,
+		.pm = pm_sleep_ptr(&stm32_usb2phy_pm_ops)
+	}
+};
+
+module_platform_driver(stm32_usb2phy_driver);
+
+MODULE_AUTHOR("Pankaj Dev <pankaj.dev@st.com>");
+MODULE_DESCRIPTION("STMicroelectronics Generic USB2PHY driver for stm32");
+MODULE_LICENSE("GPL");
-- 
2.53.0

