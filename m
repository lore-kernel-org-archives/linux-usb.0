Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C32E42AFAC;
	Tue, 25 Aug 2026 12:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787661454; cv=none; b=qrqk9uYnK34lOiGikneAojOe6oWmYlhqtmcrYw7abXKOCASaHF2855HuFYQPIEFoFRvHGl5ejWUFTu6MFSRQPtrI3v9N72HYFAvEoexJ7ynSEb9RXG1jADJdCkF1QNGqAWq71F6RPMx2PGRwIRHrgRLZ9NPHmxQv77Xc/q3anUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787661454; c=relaxed/simple;
	bh=dufAVmdzFuqWntoX3cRqx130NfOalyvJ1JRWWzFBgG0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=obOOQXp1Vu/9KudChFb4dGgLNElZkOa0owFkTIMqddNMStQ5pdMYFKkl3/vC/V7W1SFTEVZ1s2NilAhYvz4lKR4h87m2VNlodl3hB9inKU962VT7pl6WIJjj7/OpVfKtFq0Kwbe3FCcir7v0buBotGy4LpkHflkJIu4eH+NkXSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C22P4iqx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C22P4iqx"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1E3D7C4AF0E;
	Tue, 25 Aug 2026 12:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787661453;
	bh=dufAVmdzFuqWntoX3cRqx130NfOalyvJ1JRWWzFBgG0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=C22P4iqxvGv+DRv0oRYrskllnfgn/X8ZGr296+k6MS5zp0/0G3e1wo/Cf17zjQA80
	 tW0uqu05DD86JVHqJntzN1ZXxhp68amTUw9YSbhu4WTl+GXyJt1o+xe4VALtHoDms5
	 DWYUi9tD26Pdw7WSpYBZPKYVQdbX1ADi+A6LonVmRkJfJymi8D/Ju14c80vy2ff6sE
	 1YttUn0B7i+ahz7uilItBvIMQFSukjCDBoicnGyTmloij2eoD4YcKtpeM9X5u2tJ/n
	 JfbLseSz4FDgoeWKBICAHz7UKFJ03Tnba4qrjl7F/HZt6tmBjGkhhov8oFNwaL9RJJ
	 UTX6363oEmOGg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04D62C61DC4;
	Tue, 25 Aug 2026 12:37:33 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Tue, 25 Aug 2026 16:37:21 +0400
Subject: [PATCH v3 04/12] phy: qualcomm: qcom-uniphy-pcie-usb3-28lp:
 Refactor init regs table definitions
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-ipq5018-usb3-v3-4-39be0955a6aa@outlook.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787661450; l=4215;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=KPA9nos1wOXZZh3JS71ONF0Nr0uo+3X8zKZyQLdCnWs=;
 b=7QikhM252gw6zGC4x2fdMyYaRgbnTtJNJTiJWD+EWysIZptZkghI1foJHk+nIJxkd3sPjIo7K
 FY5btJCbNN6CfIDnmPBkPn5h333+ZfFOWu4e/8tu7URbp5fGfvjuT61
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: George Moussalem <george.moussalem@outlook.com>

Refactor the IPQ5018/IPQ5332 UNIPHY PCIe init data by introducing a
helper macro for register/value entries and converting open-coded struct
initializers to the compact form.

Also remove an unused include, drop unused macro register definitions,
and rename the IPQ5332-specific PHY CFG register macros to make their
combo PCIe/USB3 scope explicit.

No functional change intended.

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 .../phy/qualcomm/phy-qcom-uniphy-pcie-usb3-28lp.c  | 94 ++++++++--------------
 1 file changed, 33 insertions(+), 61 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-usb3-28lp.c b/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-usb3-28lp.c
index aeb8f7ddbd7a..44ab8f440b8a 100644
--- a/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-usb3-28lp.c
+++ b/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-usb3-28lp.c
@@ -10,7 +10,6 @@
 #include <linux/io.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
 #include <linux/of.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
@@ -24,24 +23,21 @@
 #define PIPE_CLK_DELAY_MAX_US		5100
 #define CLK_EN_DELAY_MIN_US		30
 #define CLK_EN_DELAY_MAX_US		50
-#define CDR_CTRL_REG_1		0x80
-#define CDR_CTRL_REG_2		0x84
-#define CDR_CTRL_REG_3		0x88
-#define CDR_CTRL_REG_4		0x8c
-#define CDR_CTRL_REG_5		0x90
-#define CDR_CTRL_REG_6		0x94
-#define CDR_CTRL_REG_7		0x98
-#define SSCG_CTRL_REG_1		0x9c
-#define SSCG_CTRL_REG_2		0xa0
-#define SSCG_CTRL_REG_3		0xa4
-#define SSCG_CTRL_REG_4		0xa8
-#define SSCG_CTRL_REG_5		0xac
-#define SSCG_CTRL_REG_6		0xb0
-#define PCS_INTERNAL_CONTROL_2	0x2d8
-
-#define PHY_CFG_PLLCFG				0x220
-#define PHY_CFG_EIOS_DTCT_REG			0x3e4
-#define PHY_CFG_GEN3_ALIGN_HOLDOFF_TIME		0x3e8
+
+#define CDR_CTRL_REG_1			0x80
+#define CDR_CTRL_REG_2			0x84
+#define CDR_CTRL_REG_4			0x8c
+#define CDR_CTRL_REG_5			0x90
+#define SSCG_CTRL_REG_1			0x9c
+#define SSCG_CTRL_REG_2			0xa0
+#define SSCG_CTRL_REG_3			0xa4
+#define SSCG_CTRL_REG_4			0xa8
+#define SSCG_CTRL_REG_5			0xac
+
+#define PCIE_USB_COMBO_PHY_CFG_PLLCFG			0x220
+#define PCIE_USB_COMBO_PHY_CFG_PCS_INTERNAL_CONTROL_2	0x2d8
+#define PCIE_USB_COMBO_PHY_CFG_EIOS_DTCT_REG		0x3e4
+#define PCIE_USB_COMBO_PHY_CFG_GEN3_ALIGN_HOLDOFF_TIME	0x3e8
 
 enum qcom_uniphy_type {
 	PHY_TYPE_PCIE = 1,
@@ -73,53 +69,29 @@ struct qcom_uniphy {
 	int lanes;
 };
 
-#define phy_to_dw_phy(x)	container_of((x), struct qcom_uniphy, phy)
+#define PHY_INIT_CFG(o, v)		\
+	{				\
+		.offset = o,		\
+		.val = v,		\
+	}
 
 static const struct qcom_uniphy_regs ipq5018_pcie_regs[] = {
-	{
-		.offset = SSCG_CTRL_REG_4,
-		.val = 0x1cb9,
-	}, {
-		.offset = SSCG_CTRL_REG_5,
-		.val = 0x023a,
-	}, {
-		.offset = SSCG_CTRL_REG_3,
-		.val = 0xd360,
-	}, {
-		.offset = SSCG_CTRL_REG_1,
-		.val = 0x1,
-	}, {
-		.offset = SSCG_CTRL_REG_2,
-		.val = 0xeb,
-	}, {
-		.offset = CDR_CTRL_REG_4,
-		.val = 0x3f9,
-	}, {
-		.offset = CDR_CTRL_REG_5,
-		.val = 0x1c9,
-	}, {
-		.offset = CDR_CTRL_REG_2,
-		.val = 0x419,
-	}, {
-		.offset = CDR_CTRL_REG_1,
-		.val = 0x200,
-	}, {
-		.offset = PCS_INTERNAL_CONTROL_2,
-		.val = 0xf101,
-	},
+	PHY_INIT_CFG(SSCG_CTRL_REG_4, 0x1cb9),
+	PHY_INIT_CFG(SSCG_CTRL_REG_5, 0x023a),
+	PHY_INIT_CFG(SSCG_CTRL_REG_3, 0xd360),
+	PHY_INIT_CFG(SSCG_CTRL_REG_1, 0x1),
+	PHY_INIT_CFG(SSCG_CTRL_REG_2, 0xeb),
+	PHY_INIT_CFG(CDR_CTRL_REG_4, 0x3f9),
+	PHY_INIT_CFG(CDR_CTRL_REG_5, 0x1c9),
+	PHY_INIT_CFG(CDR_CTRL_REG_2, 0x419),
+	PHY_INIT_CFG(CDR_CTRL_REG_1, 0x200),
+	PHY_INIT_CFG(PCIE_USB_COMBO_PHY_CFG_PCS_INTERNAL_CONTROL_2, 0xf101),
 };
 
 static const struct qcom_uniphy_regs ipq5332_pcie_regs[] = {
-	{
-		.offset = PHY_CFG_PLLCFG,
-		.val = 0x30,
-	}, {
-		.offset = PHY_CFG_EIOS_DTCT_REG,
-		.val = 0x53ef,
-	}, {
-		.offset = PHY_CFG_GEN3_ALIGN_HOLDOFF_TIME,
-		.val = 0xcf,
-	},
+	PHY_INIT_CFG(PCIE_USB_COMBO_PHY_CFG_PLLCFG, 0x30),
+	PHY_INIT_CFG(PCIE_USB_COMBO_PHY_CFG_EIOS_DTCT_REG, 0x53ef),
+	PHY_INIT_CFG(PCIE_USB_COMBO_PHY_CFG_GEN3_ALIGN_HOLDOFF_TIME, 0xcf),
 };
 
 static const struct qcom_uniphy_data ipq5018_data = {

-- 
2.53.0


