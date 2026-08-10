Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010026.outbound.protection.outlook.com [52.101.56.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3491B43231B;
	Mon, 10 Aug 2026 17:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786384093; cv=fail; b=Luxlk3X9MRkulR6Ihsiys5XBeqLENYAdQ1wtROmiFBz9qcqdf8bDE6fopjAHibg3vB/h6uq2e/uACr6fwztz+hVqUc6THnt4oqYRExKgix8l549aXzPJlJW2xP5Q+INDPXWrwTT2PuNRG3n+zOmNWJ0z0NH/GeSXFrqTIvNhGQU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786384093; c=relaxed/simple;
	bh=XoOJkhLOKh1b1+LPqCquT4kl4P49sN5GapCROaTW/Ds=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n0cP1zDxXiW7w4U95V6Qs2bzM6+aqa4eoWVi4/Hz9fcsLcpwX8Jb0/KLkmBDAVydluXQ6WlOJnITxQR0C09bUQEI9j6+QOQcZ/o748aGdso7naZKzDlVzD5LaOorieElaNsQQiiSEqWa+9g8FuQbAMJWJ3njpQjrl9l8D0XOhEA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=IUK9yVBC; arc=fail smtp.client-ip=52.101.56.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="IUK9yVBC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wfUJmesOQKbl7zlm8OqaJoBBGaJ5h5gplQwZOPiK2aodb1pO56vP+5nMVn8BSVVmV5GqapEeyc8IXnOgE/yRFoSfokk/7PRfhkf2XGrV4dmwA7H2nYBhV9Rs5KOI2MajRx0rhFEOJgpMHEmsmIwzS2ZEUwjktpmBzfq1YHPFIkEmyTJxkJUJtuwOXuGAR/70PbJQ+2Ekc9D5r9gw+hvN1ne0/1eqyWbQHjnPAUFM5ngxJGXIlcARQElimNc75uZa+aI3H4PERbhf10QDiaHGmRJ7dRCsckVmGNiTW6EXEEgBWb8sC72MqiIfdclqrY/jhuJQHU8VYvPgFrWRBe1BtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xy+a/OeoTRaZmYUfNaW0nmPFcUyvrvxy0xwXKh681tU=;
 b=SHV7mBX5tjIRlb867OXfUwtDYGYSui47MH8KbZCyN1OyQC4dYP6VbqgvUe/SDfWaG56saarrxM9HqbNjx1+ZSfgO57KsXvu3sDbAlwVJjNR9ASfzriNVOZdXxQCV+zqwWaTRWWhyVgEMs9p6+QAQVvyjRfnp21uFuruZV1IkDZT0XeZCd/nZUvvaR9OSqPd5f482kBFysRP/I2S04aJI2GJfk13POeEsa1Ab5CS+Eq9CS5/FSyytMqQbsq/w73gUARHbjWoKlBrGHQ3am2Hsdriq4vrshK+U1t/9X5dWez4+ZXNt5Y0kAo9nkxttT/McsaCsPgi67WtZ1UWji7LDaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=synopsys.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xy+a/OeoTRaZmYUfNaW0nmPFcUyvrvxy0xwXKh681tU=;
 b=IUK9yVBCygVCLipBdrjd4XrdbXD8uDqzqNKvz9Wl8+xNiRO8G5BK6PVCRzuFRc3I1jyGjtsdmxFRozgq8QfP6Nr0+2eRMOZXTR3BzNKvjqYB022pM2mjS2Cn639cTjQlgIHFJql1ysYwcZjsFpEmC1jUtZCw3icKN7ydjaNjxk4=
Received: from MW4PR04CA0369.namprd04.prod.outlook.com (2603:10b6:303:81::14)
 by MN2PR12MB4488.namprd12.prod.outlook.com (2603:10b6:208:24e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 17:48:05 +0000
Received: from CO1PEPF00012E81.namprd03.prod.outlook.com
 (2603:10b6:303:81:cafe::3e) by MW4PR04CA0369.outlook.office365.com
 (2603:10b6:303:81::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Mon,
 10 Aug 2026 17:48:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF00012E81.mail.protection.outlook.com (10.167.249.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Mon, 10 Aug 2026 17:48:04 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 10 Aug
 2026 12:48:01 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Mon, 10 Aug 2026 12:47:58 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <Thinh.Nguyen@synopsys.com>, <gregkh@linuxfoundation.org>,
	<michal.simek@amd.com>, <p.zabel@pengutronix.de>
CC: <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, Radhey Shyam Pandey
	<radhey.shyam.pandey@amd.com>
Subject: [PATCH 5/5] usb: dwc3: xilinx: unwind ZynqMP platform init on probe failure and remove
Date: Mon, 10 Aug 2026 23:17:13 +0530
Message-ID: <20260810174713.2325292-6-radhey.shyam.pandey@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E81:EE_|MN2PR12MB4488:EE_
X-MS-Office365-Filtering-Correlation-Id: 2917e050-9b85-447b-47d9-08def70787e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|23010399003|82310400026|376014|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	kvxfngbMbFuUHKRJwDwo+iO1vncIURnhWGkN/hx47MKKGXvCtO/cszVsIGPw8tgKoEezEh9y8fShxVjLQT3El0hd1KPO1iaFxxtKK7gQLHjhORP/QPbk6lyh4PZneUqwP2Coof6kk3Ow3YxipXUajolB7Wyk1ZTaSLT726ssKYfsaiJjnui5TQMd0jNShkA0dM0gpbZHPp5lR8yGd4duEynrZPiDziHULIA1TtN3aPlQGeY+B0vnJ3aYkpB15cW3OzvWs/DlDusmNwc+9Y/mPDA+xj+sJGzAIYlIcHi6W8xFR3pw+cU472+WUftB1wXVCtoDASaKoHAQnwMDmhn6WoZgkLy3yDeFl48Yz0fvgpVVYSit/WUR2DsBuWmXV4j8mzl8N1hVZ+nxKeBSwQ9L2Ruz4hmRcIYxNQZV1H61Kgm79f+q+/sjHcn5oFpz00eOpnRhJsYUmRj9V4hFLLfAkHZ7YHxV5IvlrFL20Saqi2kLzA6tS9WtWb9sO5Io12yHk3wPfJ80qnhMWFZLj/Vob0mvBz3igEdqYBJnFwaefM7i8R1oVlH4ve4XHqc4EbNrTj5ujvBcEXWtFYqi9/ocL835iWCjjH6bMhwoJkkOMP3KKt1opMYCYFuJxuv23qUMTv2cP5xqKqbcJE294cq9DOvndNWA5CkG1/Djsfa9Pucww+8d4OmPhhbDckquoRMVSTNyhA3OsQ1W8vN7DL8zGw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(23010399003)(82310400026)(376014)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KzSWiiuSK999RhtGdNrSXmlUKcocUJzy9+e1u2ZBFhxeDznnVwyvt1WQzt7QkNLrOEiZ0pylfrRDKe6Gx6ylAUozzjdA8yUR71bTKKwNQHNFEIsCBZrpQkvLbzaBq9JiPoQNrlIDEaAnLIypx3EqeIyXKTql2lBrecLuRDSUnOfvs+4969vL7l+xnUMPIcBQeqWFO5yrherwlmThzaVMR/njlfbX/XT8SuRLXZnKJnDes35OC3+/mIste7dW7dzlsMWYyt6JeZY54uwuASPfRnRnDz/mbXAT8Xv3e3s8Q9pcDRvruzoi0GRhrjD/EgNXPzW0iiiPajyJe84M6XIWxLi1cYfS9GnPPL2K7Tig81FVgzgIyvJ5NO1E9JhFqOPtpkTIHAoHeumEpvpWWpln32qQQeYYhOAyFCBgc2n9UWJQzR8QS1sfEUUNHDQROIOU
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 17:48:04.9066
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2917e050-9b85-447b-47d9-08def70787e8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E81.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4488

Add dwc3_xlnx_exit_zynqmp() and wire it as the ZynqMP platform exit
callback. If probe steps fail after a successful plat->init(), call
plat->exit() to re-assert released resets and unwind the PHY before
disabling clocks. Call the same callback from remove() and shutdown.

Fixes: 84770f028fab ("usb: dwc3: Add driver for Xilinx platforms")
Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
 drivers/usb/dwc3/dwc3-xilinx.c | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-xilinx.c b/drivers/usb/dwc3/dwc3-xilinx.c
index 38613553937e..0d2232741d46 100644
--- a/drivers/usb/dwc3/dwc3-xilinx.c
+++ b/drivers/usb/dwc3/dwc3-xilinx.c
@@ -121,6 +121,20 @@ static int dwc3_xlnx_init_versal(struct dwc3_xlnx *priv_data)
 	return 0;
 }
 
+static void dwc3_xlnx_exit_zynqmp(struct dwc3_xlnx *priv_data)
+{
+	phy_power_off(priv_data->usb3_phy);
+
+	if (priv_data->usb_resets_released) {
+		reset_control_assert(priv_data->usb_hibrst);
+		reset_control_assert(priv_data->usb_crst);
+		reset_control_assert(priv_data->usb_apbrst);
+		priv_data->usb_resets_released = false;
+	}
+
+	phy_exit(priv_data->usb3_phy);
+}
+
 static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx *priv_data)
 {
 	struct device		*dev = priv_data->dev;
@@ -257,6 +271,7 @@ static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx *priv_data)
 
 static const struct dwc3_xlnx_platdata zynqmp_platdata = {
 	.init = dwc3_xlnx_init_zynqmp,
+	.exit = dwc3_xlnx_exit_zynqmp,
 };
 
 static const struct dwc3_xlnx_platdata versal_platdata = {
@@ -346,11 +361,11 @@ static int dwc3_xlnx_probe(struct platform_device *pdev)
 
 	ret = dwc3_set_swnode(dev);
 	if (ret)
-		goto err_clk_put;
+		goto err_pltfm_exit;
 
 	ret = of_platform_populate(np, NULL, NULL, dev);
 	if (ret)
-		goto err_clk_put;
+		goto err_pltfm_exit;
 
 	pm_runtime_set_active(dev);
 	ret = devm_pm_runtime_enable(dev);
@@ -367,7 +382,9 @@ static int dwc3_xlnx_probe(struct platform_device *pdev)
 err_pm_set_suspended:
 	of_platform_depopulate(dev);
 	pm_runtime_set_suspended(dev);
-
+err_pltfm_exit:
+	if (priv_data->plat->exit)
+		priv_data->plat->exit(priv_data);
 err_clk_put:
 	clk_bulk_disable_unprepare(priv_data->num_clocks, priv_data->clks);
 
@@ -381,6 +398,9 @@ static void dwc3_xlnx_remove(struct platform_device *pdev)
 
 	of_platform_depopulate(dev);
 
+	if (priv_data->plat->exit)
+		priv_data->plat->exit(priv_data);
+
 	clk_bulk_disable_unprepare(priv_data->num_clocks, priv_data->clks);
 	priv_data->num_clocks = 0;
 
-- 
2.43.0

