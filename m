Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011021.outbound.protection.outlook.com [52.101.57.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27747434E39;
	Mon, 10 Aug 2026 17:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786384087; cv=fail; b=Z0PSpYDoY8AHx8wePEa37NwyTiwMBDB2LQ1VZJ6Kft13FBmDetkoB5xQbxv6lpV5Z87zFisX8YZ5pqzl+XFgkcwQXopyV2mc3ux6ef4Xf9/FVjPij6IGadpr6CBsss4dgGvkhtJAOSgbLWDmB+I3CI1Mg3VyusboL1xyCFvzIq0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786384087; c=relaxed/simple;
	bh=Jxah6QFCGDtaljH1Vt4Zk4i0AyeEnX2QUs9UK2LAcmg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eNV4mX0UzMmgUfWsPYI/7bxWzuCZzL9OnBOJnd05cBbWxmGDjnL/NJfEb13UnxsHj4FXw5sT2twxxkxaHNqz0vzWD9I7vjBU8Fflj03sEMahWU7kqWk2/gZ4oU+VS4Ndd46BqUwo2B7boERRGS2Prmpry53wBinX1OrWd/fRurc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=SNIRX3gA; arc=fail smtp.client-ip=52.101.57.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="SNIRX3gA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RSwvlH4ImBHgDzolp2dF6eeqoLAhNgUoJi3lnR/BPJTF/o31ahjhlsSKE6mL03RlgibC1N4o4neWMgOyKx4LOuI7fTPVEgzVdXoNvT8hF1gXF5FATh+puHL7ece3z+T54j78fiGYmxvA2Pd8rfTWkBgvAtR9DCa7OuqYMCL+tbk9T4pbJakwqDdYtD7UmdTWDyfpEAJWUqvI7HjAB7wUDIGphfN1vL/woBG8xZTpj/MTscHhR1Tj64Mj32iffRJBnpDgwscG+d4e6fTc9YZ7l3/TvtHyKSvHTCLNiYg8wfX+9N1rf/drL20U7waSnTrYn56TygR73zK8Xfaiu/alxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KJHBxuvXyX/Ou+ZCPLPoJAhWUmuoxbSOhKjv5XUkImE=;
 b=cCT26ryxHFaUYo+mOfU9BNxn3rpK4MdtSr6X9O9RryixF1vsEWk8nrVquw6g6x+2OermsniiJfxbGZPKMyIC0THyIggLcAZZ2kOf50BGhWzZZCduw3oy4fzCP2NrWkaozKK1oWipBIBTE7wnf0C+vOYGTPUTfhjgOtimHj34/du9TdL1zA9ljUTzaBadyqA8G4cNdmibO8gS7tORSwYj7zX3cqOUNCS9+ExOk037BFTobJ8jEvsLLx9s0uOZEfmt66Azj7iHyV34XTAVzahWb3Gb/+pn/YiUTTbgUeGyu9SeSbaNeVplvHOub2v3VvujTJ5urZgg+/gJIANlN10PQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=synopsys.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KJHBxuvXyX/Ou+ZCPLPoJAhWUmuoxbSOhKjv5XUkImE=;
 b=SNIRX3gAlT0YPBK7U6ScOY4UfLo3kEI60IGGp2RGzyXPWeRFT0e5XhPEGL/02uj1X1RU2PV7IP+0KX/WNzsPUU8D2TxlYw5pExyhtNtPmUMyOa6eyh2Y8AFEdE61es3EPVOAXFrt2Vp7LzLNiLkp4/tFKbo+FYpeyWkSkzNadR0=
Received: from CH0P223CA0006.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:116::24)
 by SN7PR12MB6983.namprd12.prod.outlook.com (2603:10b6:806:261::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 17:47:59 +0000
Received: from CH2PEPF000000A0.namprd02.prod.outlook.com
 (2603:10b6:610:116:cafe::41) by CH0P223CA0006.outlook.office365.com
 (2603:10b6:610:116::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Mon,
 10 Aug 2026 17:47:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF000000A0.mail.protection.outlook.com (10.167.244.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Mon, 10 Aug 2026 17:47:59 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 10 Aug
 2026 12:47:59 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 10 Aug
 2026 12:47:58 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Mon, 10 Aug 2026 12:47:56 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <Thinh.Nguyen@synopsys.com>, <gregkh@linuxfoundation.org>,
	<michal.simek@amd.com>, <p.zabel@pengutronix.de>
CC: <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, Radhey Shyam Pandey
	<radhey.shyam.pandey@amd.com>
Subject: [PATCH 4/5] usb: dwc3: xilinx: re-assert resets on ZynqMP init error paths
Date: Mon, 10 Aug 2026 23:17:12 +0530
Message-ID: <20260810174713.2325292-5-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810174713.2325292-1-radhey.shyam.pandey@amd.com>
References: <20260810174713.2325292-1-radhey.shyam.pandey@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF000000A0:EE_|SN7PR12MB6983:EE_
X-MS-Office365-Filtering-Correlation-Id: 36f2f27d-2dd7-487d-1688-08def70784c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|82310400026|36860700016|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	1NtcVcNiR/lL0JfwiLS6EbmG6TjEMl5AYZPWTJgOvHh28Us+ZHvdrTvacSVTX0b8Cg3gv6UqkzGp/Ar6C44/aitpU1w4DMsli2jHj54/FKltHK2+xu8rU3zRkuzKLmpQWyKlGi2IYbkD4Kckv/rSFO7GwhnujkH2aWuTtpc5AYDpga4V6cCb7SXGGI5lS/AdTkoIUuH6DpEKc2Rc0YxXS/XPziAHVYPLN+V/AnkxyTomO1gCdwiJoY5nOqguOofe3d055IG4/wg7vkCk0NBsEk8aYWLdKUPOcf8KTC2pEA6cWJocjqr0x3WmfUTwNbXvYZz98HbbXPdmcNCwHIHUI0mMXR4SpbSXdFGK6jKh69Zy7+7ViLb2voqcRF+T9SsZUcpC5gqHIyB+f9aBnBbMGwC9Nx8x3qnCQysKfO3grp2l2UJP7C/0rY+lrChWCww0C2/Flz5NmjFFI/e33dEDL65hXs+9fHVnFPaWCWwrSdiby8lprmZNCmm23WmB0HYOYFPg8gRhQCPDMqloaSaqY9aXj+FgRGLw5hyIa8uAgWeCYFdv4y1kizYEIooi5KWSGOdmaGL+jMHrPLt6hNnwlQflB59tGeCFYxdCBJm1dY2MAGG3q1kK2f7G8Ogmf4f1NPofNdA8/jDTzLkQ59C76aVTwKaCcA2kro10fQjvlueEpW4dGczi890qegNFUt52ntNnCcNsVqTToy2wbqRTOg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(82310400026)(36860700016)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XfmITssEu+KqdyKNtUkqJDxIkDpt3ShJnEm12BJNYnqBA8K6hgwyx/mF1lzLLdQP1KNxzbNjwJIX1nYw/2DQFa+z98szr0+L14x7Q8/Ka/9TbKUBdBXWls9WpohehHWfeNi5t4oOvOc6xn/HpQ6WkLszVuIAEhN0wdUFppvZIEzHMNofXGTlw4zAcwV4I+rPvNqVSaDbL8nOzK0QH7krR9D7lt37YS8EmoUTpO0Brn36qf94umljOPlXmGt0aPnzNdRT0QbaN+sGEza5TAiOr7Ocwalzj/PkAPhetirJDGr4+TXporHLIeeGgtgG6iBkimnToowH0TX37wyXD1GTezE+AooIZLAaxMTxzo16Mk6HwQRPvWB/JDe1lBQysDBFG5mipbVOokwFg3nAHAx/pnM83ct77q7Jnz6nI5gIzdpmXU9gCAeqCRT3jvAH0i73
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 17:47:59.6925
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36f2f27d-2dd7-487d-1688-08def70784c5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF000000A0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6983

If reset deassert or PHY setup fails partway through
dwc3_xlnx_init_zynqmp(), re-assert any resets that were already
released before unwinding the PHY. Use fall-through error labels so
unwind matches how far init progressed, for both USB2 and USB3 paths.

Save the ZynqMP reset handles in driver private data so later probe
teardown can re-assert released resets.

Fixes: 84770f028fab ("usb: dwc3: Add driver for Xilinx platforms")
Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
 drivers/usb/dwc3/dwc3-xilinx.c | 49 +++++++++++++++++++++-------------
 1 file changed, 30 insertions(+), 19 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-xilinx.c b/drivers/usb/dwc3/dwc3-xilinx.c
index 894f5f5e8b7a..38613553937e 100644
--- a/drivers/usb/dwc3/dwc3-xilinx.c
+++ b/drivers/usb/dwc3/dwc3-xilinx.c
@@ -56,6 +56,10 @@ struct dwc3_xlnx {
 	void __iomem			*regs;
 	const struct dwc3_xlnx_platdata	*plat;
 	struct phy			*usb3_phy;
+	struct reset_control		*usb_crst;
+	struct reset_control		*usb_hibrst;
+	struct reset_control		*usb_apbrst;
+	bool				usb_resets_released;
 };
 
 static void dwc3_xlnx_mask_phy_rst(struct dwc3_xlnx *priv_data, bool mask)
@@ -120,7 +124,6 @@ static int dwc3_xlnx_init_versal(struct dwc3_xlnx *priv_data)
 static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx *priv_data)
 {
 	struct device		*dev = priv_data->dev;
-	struct reset_control	*crst, *hibrst, *apbrst;
 	struct gpio_desc	*reset_gpio;
 	int			ret = 0;
 
@@ -132,25 +135,25 @@ static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx *priv_data)
 		goto err;
 	}
 
-	crst = devm_reset_control_get_exclusive(dev, "usb_crst");
-	if (IS_ERR(crst)) {
-		ret = PTR_ERR(crst);
+	priv_data->usb_crst = devm_reset_control_get_exclusive(dev, "usb_crst");
+	if (IS_ERR(priv_data->usb_crst)) {
+		ret = PTR_ERR(priv_data->usb_crst);
 		dev_err_probe(dev, ret,
 			      "failed to get core reset signal\n");
 		goto err;
 	}
 
-	hibrst = devm_reset_control_get_exclusive(dev, "usb_hibrst");
-	if (IS_ERR(hibrst)) {
-		ret = PTR_ERR(hibrst);
+	priv_data->usb_hibrst = devm_reset_control_get_exclusive(dev, "usb_hibrst");
+	if (IS_ERR(priv_data->usb_hibrst)) {
+		ret = PTR_ERR(priv_data->usb_hibrst);
 		dev_err_probe(dev, ret,
 			      "failed to get hibernation reset signal\n");
 		goto err;
 	}
 
-	apbrst = devm_reset_control_get_exclusive(dev, "usb_apbrst");
-	if (IS_ERR(apbrst)) {
-		ret = PTR_ERR(apbrst);
+	priv_data->usb_apbrst = devm_reset_control_get_exclusive(dev, "usb_apbrst");
+	if (IS_ERR(priv_data->usb_apbrst)) {
+		ret = PTR_ERR(priv_data->usb_apbrst);
 		dev_err_probe(dev, ret,
 			      "failed to get APB reset signal\n");
 		goto err;
@@ -164,19 +167,19 @@ static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx *priv_data)
 	 * absent.
 	 */
 	if (priv_data->usb3_phy) {
-		ret = reset_control_assert(crst);
+		ret = reset_control_assert(priv_data->usb_crst);
 		if (ret < 0) {
 			dev_err(dev, "Failed to assert core reset\n");
 			goto err;
 		}
 
-		ret = reset_control_assert(hibrst);
+		ret = reset_control_assert(priv_data->usb_hibrst);
 		if (ret < 0) {
 			dev_err(dev, "Failed to assert hibernation reset\n");
 			goto err;
 		}
 
-		ret = reset_control_assert(apbrst);
+		ret = reset_control_assert(priv_data->usb_apbrst);
 		if (ret < 0) {
 			dev_err(dev, "Failed to assert APB reset\n");
 			goto err;
@@ -187,7 +190,7 @@ static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx *priv_data)
 	if (ret < 0)
 		goto err;
 
-	ret = reset_control_deassert(apbrst);
+	ret = reset_control_deassert(priv_data->usb_apbrst);
 	if (ret < 0) {
 		dev_err(dev, "Failed to release APB reset\n");
 		goto err_phy_exit;
@@ -203,21 +206,21 @@ static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx *priv_data)
 		writel(PIPE_CLK_DESELECT, priv_data->regs + XLNX_USB_FPD_PIPE_CLK);
 	}
 
-	ret = reset_control_deassert(crst);
+	ret = reset_control_deassert(priv_data->usb_crst);
 	if (ret < 0) {
 		dev_err(dev, "Failed to release core reset\n");
-		goto err_phy_exit;
+		goto err_apbrst_assert;
 	}
 
-	ret = reset_control_deassert(hibrst);
+	ret = reset_control_deassert(priv_data->usb_hibrst);
 	if (ret < 0) {
 		dev_err(dev, "Failed to release hibernation reset\n");
-		goto err_phy_exit;
+		goto err_crst_assert;
 	}
 
 	ret = phy_power_on(priv_data->usb3_phy);
 	if (ret < 0)
-		goto err_phy_exit;
+		goto err_hibrst_assert;
 
 	/* ulpi reset via gpio-modepin or gpio-framework driver */
 	reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
@@ -234,10 +237,18 @@ static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx *priv_data)
 
 	dwc3_xlnx_set_coherency(priv_data, XLNX_USB_TRAFFIC_ROUTE_CONFIG);
 
+	priv_data->usb_resets_released = true;
+
 	return 0;
 
 err_phy_power_off:
 	phy_power_off(priv_data->usb3_phy);
+err_hibrst_assert:
+	reset_control_assert(priv_data->usb_hibrst);
+err_crst_assert:
+	reset_control_assert(priv_data->usb_crst);
+err_apbrst_assert:
+	reset_control_assert(priv_data->usb_apbrst);
 err_phy_exit:
 	phy_exit(priv_data->usb3_phy);
 err:
-- 
2.43.0

