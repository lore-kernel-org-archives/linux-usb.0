Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD44426D0C;
	Tue, 25 Aug 2026 12:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787661454; cv=none; b=lxUw07xJV8THdNsDDzaqsoS5WEW3GI2+SsX6wNySTw0v0jd0Np3/sxlVj0jGWEsCiC3yBx6fHIcHvmxRANBANXRT/vKk6O+ecsuJhzxgH1CyTt87IZ/fK3ykwPPW5z5/Ji3j1WVowm7N5/Q7IKCKFxAhJFSWE6GcEZ5Knu15u7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787661454; c=relaxed/simple;
	bh=j5WGDZq4JFhhRkNnOtlgnMroG1FmpIpiWmK2eo2bQ9Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kIeEu4ismjDA2uuui5SHiE9PgGZtn+27YJRhJXthLCP+bPLtWs3Rhg6V6RFWHsSKyxi8slAqzEdzFdmouHZeTZYaGdJR9j6l/tmTryIK5wlcmQ9oXlWJdml+bBVp2SU/EJRlotcsEilpbD4XvdU/UkZcuHZuFSZhLo4BPajw4jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WSgOEFaS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WSgOEFaS"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1A531C32786;
	Tue, 25 Aug 2026 12:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787661453;
	bh=j5WGDZq4JFhhRkNnOtlgnMroG1FmpIpiWmK2eo2bQ9Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WSgOEFaSpM/OMAjeXY1/ebR/c20kAD/M996R04ZPZ/+5Y8IbROI4wMZzcVA7XJotk
	 k9DVTBfVxouhe3Dl4rz/ScZ6PBx+Pgdvlj75t2Hd+5BTRSuKJRu1YO0zESoO1jLEtH
	 Km/uNDHiZnUwy1fTPEGDajf8uiwDA9KSkTJIgMinhw3br8+tcBqEAv366SHT29Dy/r
	 sBn+BEe5ZGD2yNx1QS9m8/1uPb7+cf26Bq4jVd2qXVkGd1rU5ZewJa8NwcuRF+ATcr
	 XhKM4A8b/wptMB0Tx+VSYZADqQAXcpa83YzTvqYQm76k1LE/FLnrVgxGUUEjK2mttf
	 bHvGWVFf4W1Gg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E94DCC61DC6;
	Tue, 25 Aug 2026 12:37:32 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Tue, 25 Aug 2026 16:37:20 +0400
Subject: [PATCH v3 03/12] phy: qualcomm: qcom-uniphy-pcie-28lp: Convert to
 PCIe/USB3 combo PHY driver
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-ipq5018-usb3-v3-3-39be0955a6aa@outlook.com>
References: <20260825-ipq5018-usb3-v3-0-39be0955a6aa@outlook.com>
In-Reply-To: <20260825-ipq5018-usb3-v3-0-39be0955a6aa@outlook.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Praveenkumar I <praveenkumar.i@oss.qualcomm.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, 
 Nitheesh Sekar <quic_nsekar@quicinc.com>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787661450; l=10621;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=0yuZk82tzQfyVclB/GgiAcNvs78YUKjs9vvJMW3iyVM=;
 b=/pmvVrLJ6Un6MrwUYxtGn6H/WfZktRg6pUnH0HzlKDelB0n7Do30f5r+ZJRdrLKEBeGwIUm6r
 JWShDzGzv7WApInEnTaKFCHgKE38Y1i7fc5vKgvvSIT9Lfq0oG9vbnU
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: George Moussalem <george.moussalem@outlook.com>

This PHY found in IPQ5332 and IPQ5018 SoCs is actually a multi-purpose
PCIe/USB3 combo PHY. The driver was initially created for PCIe PHY
support only. As such, rename the driver and generalize function and
struct names to reflect that it is a PCIe and USB3 combo PHY driver so
that USB3 support can be added in subsequent patches.

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 drivers/phy/qualcomm/Kconfig                       | 24 +++---
 drivers/phy/qualcomm/Makefile                      |  2 +-
 ...cie-28lp.c => phy-qcom-uniphy-pcie-usb3-28lp.c} | 87 +++++++++++-----------
 3 files changed, 55 insertions(+), 58 deletions(-)

diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
index d910a5d1a1ac..6872aa919cf2 100644
--- a/drivers/phy/qualcomm/Kconfig
+++ b/drivers/phy/qualcomm/Kconfig
@@ -155,19 +155,6 @@ config PHY_QCOM_M31_USB
 	  management. This driver is required even for peripheral only or
 	  host only mode configurations.
 
-config PHY_QCOM_UNIPHY_PCIE_28LP
-	bool "PCIE UNIPHY 28LP PHY driver"
-	depends on ARCH_QCOM
-	depends on COMMON_CLK
-	depends on HAS_IOMEM
-	depends on OF
-	select GENERIC_PHY
-	help
-	  Enable this to support the PCIe UNIPHY 28LP phy transceiver that
-	  is used with PCIe controllers on Qualcomm IPQ5332 chips. It
-	  handles PHY initialization, clock management required after
-	  resetting the hardware and power management.
-
 config PHY_QCOM_M31_EUSB
 	tristate "Qualcomm M31 eUSB2 PHY driver support"
 	depends on USB && (ARCH_QCOM || COMPILE_TEST)
@@ -178,6 +165,17 @@ config PHY_QCOM_M31_EUSB
 	  up of the associated USB repeater that is paired with the eUSB2
 	  PHY.
 
+config PHY_QCOM_UNIPHY_PCIE_USB3_28LP
+	bool "Qualcomm IPQ5332 UNIPHY PCIe USB3 28LP PHY driver"
+	depends on OF && (ARCH_QCOM || COMPILE_TEST)
+	select GENERIC_PHY
+	select MFD_SYSCON
+	help
+	  Enable this to support the Qualcomm USB Super-Speed UNIPHY transceiver
+	  that is used on Qualcomm IPQ5018 and IPQ5332 SoCs with DWC3 USB core.
+	  It handles PHY initialization, clock management required after
+	  resetting the hardware and power management.
+
 config PHY_QCOM_USB_HS
 	tristate "Qualcomm USB HS PHY module"
 	depends on USB_ULPI_BUS
diff --git a/drivers/phy/qualcomm/Makefile b/drivers/phy/qualcomm/Makefile
index 8bf887d58ee4..6e2e9737e387 100644
--- a/drivers/phy/qualcomm/Makefile
+++ b/drivers/phy/qualcomm/Makefile
@@ -18,7 +18,7 @@ obj-$(CONFIG_PHY_QCOM_QMP_USB_LEGACY)	+= phy-qcom-qmp-usb-legacy.o
 
 obj-$(CONFIG_PHY_QCOM_QUSB2)		+= phy-qcom-qusb2.o
 obj-$(CONFIG_PHY_QCOM_EUSB2_REPEATER)	+= phy-qcom-eusb2-repeater.o
-obj-$(CONFIG_PHY_QCOM_UNIPHY_PCIE_28LP)	+= phy-qcom-uniphy-pcie-28lp.o
+obj-$(CONFIG_PHY_QCOM_UNIPHY_PCIE_USB3_28LP)	+= phy-qcom-uniphy-pcie-usb3-28lp.o
 obj-$(CONFIG_PHY_QCOM_USB_HS) 		+= phy-qcom-usb-hs.o
 obj-$(CONFIG_PHY_QCOM_USB_HSIC) 	+= phy-qcom-usb-hsic.o
 obj-$(CONFIG_PHY_QCOM_USB_HS_28NM)	+= phy-qcom-usb-hs-28nm.o
diff --git a/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c b/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-usb3-28lp.c
similarity index 75%
rename from drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c
rename to drivers/phy/qualcomm/phy-qcom-uniphy-pcie-usb3-28lp.c
index 324c0a5d658e..aeb8f7ddbd7a 100644
--- a/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c
+++ b/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-usb3-28lp.c
@@ -43,29 +43,29 @@
 #define PHY_CFG_EIOS_DTCT_REG			0x3e4
 #define PHY_CFG_GEN3_ALIGN_HOLDOFF_TIME		0x3e8
 
-enum qcom_uniphy_pcie_type {
+enum qcom_uniphy_type {
 	PHY_TYPE_PCIE = 1,
 	PHY_TYPE_PCIE_GEN2,
 	PHY_TYPE_PCIE_GEN3,
 };
 
-struct qcom_uniphy_pcie_regs {
+struct qcom_uniphy_regs {
 	u32 offset;
 	u32 val;
 };
 
-struct qcom_uniphy_pcie_data {
+struct qcom_uniphy_data {
 	int lane_offset; /* offset between the lane register bases */
 	u32 phy_type;
-	const struct qcom_uniphy_pcie_regs *init_seq;
+	const struct qcom_uniphy_regs *init_seq;
 	u32 init_seq_num;
 	u32 pipe_clk_rate;
 };
 
-struct qcom_uniphy_pcie {
+struct qcom_uniphy {
 	struct phy phy;
 	struct device *dev;
-	const struct qcom_uniphy_pcie_data *data;
+	const struct qcom_uniphy_data *data;
 	struct clk_bulk_data *clks;
 	int num_clks;
 	struct reset_control *resets;
@@ -73,9 +73,9 @@ struct qcom_uniphy_pcie {
 	int lanes;
 };
 
-#define phy_to_dw_phy(x)	container_of((x), struct qca_uni_pcie_phy, phy)
+#define phy_to_dw_phy(x)	container_of((x), struct qcom_uniphy, phy)
 
-static const struct qcom_uniphy_pcie_regs ipq5018_regs[] = {
+static const struct qcom_uniphy_regs ipq5018_pcie_regs[] = {
 	{
 		.offset = SSCG_CTRL_REG_4,
 		.val = 0x1cb9,
@@ -109,7 +109,7 @@ static const struct qcom_uniphy_pcie_regs ipq5018_regs[] = {
 	},
 };
 
-static const struct qcom_uniphy_pcie_regs ipq5332_regs[] = {
+static const struct qcom_uniphy_regs ipq5332_pcie_regs[] = {
 	{
 		.offset = PHY_CFG_PLLCFG,
 		.val = 0x30,
@@ -122,26 +122,26 @@ static const struct qcom_uniphy_pcie_regs ipq5332_regs[] = {
 	},
 };
 
-static const struct qcom_uniphy_pcie_data ipq5018_data = {
+static const struct qcom_uniphy_data ipq5018_data = {
 	.lane_offset	= 0x800,
 	.phy_type	= PHY_TYPE_PCIE_GEN2,
-	.init_seq	= ipq5018_regs,
-	.init_seq_num	= ARRAY_SIZE(ipq5018_regs),
+	.init_seq	= ipq5018_pcie_regs,
+	.init_seq_num	= ARRAY_SIZE(ipq5018_pcie_regs),
 	.pipe_clk_rate	= 125 * MEGA,
 };
 
-static const struct qcom_uniphy_pcie_data ipq5332_data = {
+static const struct qcom_uniphy_data ipq5332_data = {
 	.lane_offset	= 0x800,
 	.phy_type	= PHY_TYPE_PCIE_GEN3,
-	.init_seq	= ipq5332_regs,
-	.init_seq_num	= ARRAY_SIZE(ipq5332_regs),
+	.init_seq	= ipq5332_pcie_regs,
+	.init_seq_num	= ARRAY_SIZE(ipq5332_pcie_regs),
 	.pipe_clk_rate	= 250 * MEGA,
 };
 
-static void qcom_uniphy_pcie_init(struct qcom_uniphy_pcie *phy)
+static void qcom_uniphy_pcie_usb3_init(struct qcom_uniphy *phy)
 {
-	const struct qcom_uniphy_pcie_data *data = phy->data;
-	const struct qcom_uniphy_pcie_regs *init_seq;
+	const struct qcom_uniphy_data *data = phy->data;
+	const struct qcom_uniphy_regs *init_seq;
 	void __iomem *base = phy->base;
 	int lane, i;
 
@@ -155,18 +155,18 @@ static void qcom_uniphy_pcie_init(struct qcom_uniphy_pcie *phy)
 	}
 }
 
-static int qcom_uniphy_pcie_power_off(struct phy *x)
+static int qcom_uniphy_pcie_usb3_power_off(struct phy *x)
 {
-	struct qcom_uniphy_pcie *phy = phy_get_drvdata(x);
+	struct qcom_uniphy *phy = phy_get_drvdata(x);
 
 	clk_bulk_disable_unprepare(phy->num_clks, phy->clks);
 
 	return reset_control_assert(phy->resets);
 }
 
-static int qcom_uniphy_pcie_power_on(struct phy *x)
+static int qcom_uniphy_pcie_usb3_power_on(struct phy *x)
 {
-	struct qcom_uniphy_pcie *phy = phy_get_drvdata(x);
+	struct qcom_uniphy *phy = phy_get_drvdata(x);
 	int ret;
 
 	ret = reset_control_assert(phy->resets);
@@ -193,13 +193,13 @@ static int qcom_uniphy_pcie_power_on(struct phy *x)
 
 	usleep_range(CLK_EN_DELAY_MIN_US, CLK_EN_DELAY_MAX_US);
 
-	qcom_uniphy_pcie_init(phy);
+	qcom_uniphy_pcie_usb3_init(phy);
 
 	return 0;
 }
 
-static inline int qcom_uniphy_pcie_get_resources(struct platform_device *pdev,
-						 struct qcom_uniphy_pcie *phy)
+static inline int qcom_uniphy_pcie_usb3_get_resources(struct platform_device *pdev,
+						      struct qcom_uniphy *phy)
 {
 	struct resource *res;
 
@@ -236,9 +236,9 @@ static inline int qcom_uniphy_pcie_get_resources(struct platform_device *pdev,
  *    clk  |   +-------+   |                   +-----+
  *         +---------------+
  */
-static inline int phy_pipe_clk_register(struct qcom_uniphy_pcie *phy, int id)
+static inline int phy_pipe_clk_register(struct qcom_uniphy *phy, int id)
 {
-	const struct qcom_uniphy_pcie_data *data = phy->data;
+	const struct qcom_uniphy_data *data = phy->data;
 	struct clk_hw *hw;
 	char name[64];
 
@@ -252,30 +252,29 @@ static inline int phy_pipe_clk_register(struct qcom_uniphy_pcie *phy, int id)
 	return devm_of_clk_add_hw_provider(phy->dev, of_clk_hw_simple_get, hw);
 }
 
-static const struct of_device_id qcom_uniphy_pcie_id_table[] = {
+static const struct of_device_id qcom_uniphy_pcie_usb3_id_table[] = {
 	{
 		.compatible = "qcom,ipq5018-uniphy-pcie-phy",
 		.data = &ipq5018_data,
 	}, {
 		.compatible = "qcom,ipq5332-uniphy-pcie-phy",
 		.data = &ipq5332_data,
-	}, {
-		/* Sentinel */
 	},
+	{ },
 };
-MODULE_DEVICE_TABLE(of, qcom_uniphy_pcie_id_table);
+MODULE_DEVICE_TABLE(of, qcom_uniphy_pcie_usb3_id_table);
 
-static const struct phy_ops pcie_ops = {
-	.power_on	= qcom_uniphy_pcie_power_on,
-	.power_off	= qcom_uniphy_pcie_power_off,
+static const struct phy_ops qcom_uniphy_ops = {
+	.power_on	= qcom_uniphy_pcie_usb3_power_on,
+	.power_off	= qcom_uniphy_pcie_usb3_power_off,
 	.owner          = THIS_MODULE,
 };
 
-static int qcom_uniphy_pcie_probe(struct platform_device *pdev)
+static int qcom_uniphy_pcie_usb3_probe(struct platform_device *pdev)
 {
 	struct phy_provider *phy_provider;
 	struct device *dev = &pdev->dev;
-	struct qcom_uniphy_pcie *phy;
+	struct qcom_uniphy *phy;
 	struct phy *generic_phy;
 	int ret;
 
@@ -294,12 +293,12 @@ static int qcom_uniphy_pcie_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "Couldn't read num-lanes\n");
 
-	ret = qcom_uniphy_pcie_get_resources(pdev, phy);
+	ret = qcom_uniphy_pcie_usb3_get_resources(pdev, phy);
 	if (ret < 0)
 		return dev_err_probe(&pdev->dev, ret,
 				     "failed to get resources: %d\n", ret);
 
-	generic_phy = devm_phy_create(phy->dev, NULL, &pcie_ops);
+	generic_phy = devm_phy_create(phy->dev, NULL, &qcom_uniphy_ops);
 	if (IS_ERR(generic_phy))
 		return PTR_ERR(generic_phy);
 
@@ -317,15 +316,15 @@ static int qcom_uniphy_pcie_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static struct platform_driver qcom_uniphy_pcie_driver = {
-	.probe		= qcom_uniphy_pcie_probe,
+static struct platform_driver qcom_uniphy_pcie_usb3_driver = {
+	.probe		= qcom_uniphy_pcie_usb3_probe,
 	.driver		= {
-		.name	= "qcom-uniphy-pcie",
-		.of_match_table = qcom_uniphy_pcie_id_table,
+		.name	= "qcom-uniphy-pcie-usb3-28lp",
+		.of_match_table = qcom_uniphy_pcie_usb3_id_table,
 	},
 };
 
-module_platform_driver(qcom_uniphy_pcie_driver);
+module_platform_driver(qcom_uniphy_pcie_usb3_driver);
 
-MODULE_DESCRIPTION("PCIE QCOM UNIPHY driver");
+MODULE_DESCRIPTION("Qualcomm IPQ5332 UNIPHY PCIe USB3 28LP PHY driver");
 MODULE_LICENSE("GPL");

-- 
2.53.0


