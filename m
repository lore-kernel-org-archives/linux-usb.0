Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010046.outbound.protection.outlook.com [52.101.85.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49EC40B373;
	Mon, 10 Aug 2026 17:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786384084; cv=fail; b=iqWxlh0DSSW/G6PoS7nyHEaot5rCkYmFYjMJPBuqjcQqXiG89syPY3LJCbVmrXq+jGr+NjPkOdvlqD1mex4nbmk5DUSvZyUZ/S12bumbkAz5rPcumlKr7Ei+LICFGpC8Cg8ItfP86MGopixusq54H2CnLKOgWB8n+tt7DTO7uXo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786384084; c=relaxed/simple;
	bh=KdyDJasczCFaulzxkVf5//DWhi0C0Mx/QguvnQDIr+A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WqMkoXWMNzgyExHfrUXsXBzBMKaZRsBNBO4rSAborfR90sTrPE2x8WoMK9N/ZmLm9A7GmRZej0PPzpJxWzIIwkJkoMynk06qgUkQ+ld176173WW5WquezPVs0vpEvnQCLwItNinZFK0CgMzLzUjtZeWMK0tOwcdOfYUunONv2RE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=tgQBKFEk; arc=fail smtp.client-ip=52.101.85.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="tgQBKFEk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cPjKV7QjUsfiLtsp1GrKbdllg0T2qk83PO6g931xggIbYPVY7fK4pZeTsLqs65oXoIy5fkdtjMoMj+JBfXW8n584Owa3TgqwyLI1LZTxMdhur6EQXzbv2z/fjzFUl2VtEU3NdS3dqd2UVsiLV3vVyTeX+K1mzlgfQ947G/Zb8mf1ZFWxgSb7XlPx32a8RvYjl5mQyYaW3o9ySUAih5vxuyFwn4fTwaCXj+PUOXYNNqixlYS6BVoO2JEsm3EjXodtS3Af1Eno2+BndCoGwHv2tostqKK6uTVi9lMxLXsH8ow4NgH/kbm4P3EPWk4uvvDri81QE2v+zWemH+uZkPV+IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1vsqQGQwSXZOQRlDJgMhiN0zTxvcbuYLnr18qx7LHKw=;
 b=VdveD57mdloTBmoWNkA769iNAghkLTfatcUjrSonoC8ETlIFvYv4bbaY7BQo8NqHvr32uQz4FOmRSc76OZ7kI+3eRGUT844MDGsy699Wa8gbGBQfxzYZdIzg4hRBuoU++xFAmhKYiJj0dT+wVbuasgPjHLN8qOAR1eHG/LR4KAqybG4PVnwsPNOG8jU1DplT7cCdBL910iHHFxCZO8+BTVLnPU7ObPX2XIq/WITC8bXrbocvG7p/VyekzEqxCOEHnjjGRx0I769cvAIj2uQSPw/1J4IyFoqEbxHxj4V1kAF/7TXLIItNzf2GQaX1LrE7VXnyrHNKW9qYfcamyGpevg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=synopsys.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1vsqQGQwSXZOQRlDJgMhiN0zTxvcbuYLnr18qx7LHKw=;
 b=tgQBKFEk5zmoKFSVx2e5lxQwb1+9BzfzN2dPgdE1V4krmBqKNnpKqVdTHjgHMsYzWfROysCQrfQlIohcg+3wskCLxnAE0zF2Fcznb3jrCMTNK8WQWMq2OtWb+CvvKniLtFiT5G15fJmHcr4e67LxcXLpmpmtv+5WScdwFi91BTE=
Received: from MW4PR03CA0228.namprd03.prod.outlook.com (2603:10b6:303:b9::23)
 by DM4PR12MB8560.namprd12.prod.outlook.com (2603:10b6:8:189::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 17:47:57 +0000
Received: from CO1PEPF00012E82.namprd03.prod.outlook.com
 (2603:10b6:303:b9:cafe::96) by MW4PR03CA0228.outlook.office365.com
 (2603:10b6:303:b9::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Mon,
 10 Aug 2026 17:47:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF00012E82.mail.protection.outlook.com (10.167.249.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Mon, 10 Aug 2026 17:47:57 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 10 Aug
 2026 12:47:56 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 10 Aug
 2026 12:47:55 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Mon, 10 Aug 2026 12:47:53 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <Thinh.Nguyen@synopsys.com>, <gregkh@linuxfoundation.org>,
	<michal.simek@amd.com>, <p.zabel@pengutronix.de>
CC: <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, Radhey Shyam Pandey
	<radhey.shyam.pandey@amd.com>
Subject: [PATCH 3/5] usb: dwc3: xilinx: fix system suspend and resume PHY handling
Date: Mon, 10 Aug 2026 23:17:11 +0530
Message-ID: <20260810174713.2325292-4-radhey.shyam.pandey@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E82:EE_|DM4PR12MB8560:EE_
X-MS-Office365-Filtering-Correlation-Id: 675ca1a4-37b1-4a5f-7acb-08def707834c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|1800799024|376014|11063799006|56012099006|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	5khULMpBQJ7PgIcGvbrjRPFhmUz+8cQTnE2CmYJwxcO+es3S5T4Rw7paClCXMy9zC5Wrr+HFN+rGU5tzi5PEWx4uFx6pWJDKSuDbIAqGD6rLQ/Ot3hKCxt8C2SgrfR6uhfTHq/FSlp2Mf7KZbEAaeZl+hj2s6HCxMUMkjTNk8AUyKu1dc7W2+LaNMTPpaAeAMtwbOuOLRLmz3Xb3p76J5cjRXhcrNB2AW/A/32bHRLVPoGn0Pjt1HWnrMhrnHD8R9UNua8RadaahbCxNoqIKsVyvjvMhdVl5apdXX0hb7nER6xzYebdqTYNV9qU+ZGdmF0izlYj8K1Nsa3wmMYfsfseVINfZKnjsrBJjdS1O+Nnyu2OSfJS3lRe50DPtkPYrTfJmePR/sjgPnuWS8gWEE/I8rouHcw2dYDvLI4CaF2oqrecL2GGbkxgaiq2iSqwVsREjPhgveBywF9tZLRPQHcLhKkEVs0rbN5H1gMYAORE7WWB+hzs4HzpuwwCEE0e5VIxnWFZSYMBJDBxHBD2oM+7MhN0wOAt0UnQkYXKw2VZMxHBxahBLOW20RaS5yF1T5L9gQHR9Bs4oBv4/egT1f81gBKj0+BccDvoc/WagTOTTuajXz3c6h9RChZo5mpBa6k5Bw7evNlpWQrGBx4Frz2QZHHCjnD8og50HdFigu3O+NhIx9w5EFvjiDvYTsMegXpUpIekwM8JkJ6A7uVJpAg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(1800799024)(376014)(11063799006)(56012099006)(10067099003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	E5gEHE0uHdFnxea8ekUkSJJnK3ks0+uwS33cYKpTcXaxAUm20W8mT5xr6VOAbnUGNlHEhkfmWcZ3mgIRGJEOyaO+DZC3Bkpwo0BAJmTx74j9UVmLTrWX5gj2WUgfVxuguLOkI5q8mkrqbSDi4t5TuEmoW3MjOV+KTw4yRoRNFDT8Y0Y3ZcBc7NFpSzk7RQk1cJh4rcNljf5urXB/pevEdXYYo+1OhTh4jtqRuuPFeH0Id6IZNWHFkkdLTKuENJB2gKavGeEwMdtsGukpLuPLMi75Z9NPMwDPtWvd8PuuLjbjr9WoCHpH3HQnQfe4OiWtRHmy9NUCbWGaoQWN/EBUeR6eBaHqRQd0UHWRG57j98mMbWTwOJ8tCi+U7bGDIVxVrCpWqzEeykqEMd9w2LndY8YHYjT+HtmHaSwpC+uJuBv+AncF9SjBlER8EPp4H1A6
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 17:47:57.1512
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 675ca1a4-37b1-4a5f-7acb-08def707834c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E82.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8560

System suspend and resume error paths do not handle PHY and clock
resources correctly. Suspend calls phy_exit() without first powering
off the PHY and ignores failures, while resume can leave clocks
enabled if PHY reinitialization fails.

Propagate errors to the PM core and unwind resources to ensure a
consistent state on suspend and resume failures.

Fixes: d6edcdc1ef06 ("usb: dwc3: xilinx: fix usb3 non-wakeup source resume failure")
Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
 drivers/usb/dwc3/dwc3-xilinx.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-xilinx.c b/drivers/usb/dwc3/dwc3-xilinx.c
index 4a04d158f872..894f5f5e8b7a 100644
--- a/drivers/usb/dwc3/dwc3-xilinx.c
+++ b/drivers/usb/dwc3/dwc3-xilinx.c
@@ -403,13 +403,25 @@ static int __maybe_unused dwc3_xlnx_runtime_idle(struct device *dev)
 static int __maybe_unused dwc3_xlnx_suspend(struct device *dev)
 {
 	struct dwc3_xlnx *priv_data = dev_get_drvdata(dev);
+	int ret;
 
-	phy_exit(priv_data->usb3_phy);
+	ret = phy_power_off(priv_data->usb3_phy);
+	if (ret < 0)
+		return ret;
+
+	ret = phy_exit(priv_data->usb3_phy);
+	if (ret < 0)
+		goto err_phy_power_on;
 
 	/* Disable the clocks */
 	clk_bulk_disable(priv_data->num_clocks, priv_data->clks);
 
 	return 0;
+
+err_phy_power_on:
+	phy_power_on(priv_data->usb3_phy);
+
+	return ret;
 }
 
 static int __maybe_unused dwc3_xlnx_resume(struct device *dev)
@@ -423,15 +435,20 @@ static int __maybe_unused dwc3_xlnx_resume(struct device *dev)
 
 	ret = phy_init(priv_data->usb3_phy);
 	if (ret < 0)
-		return ret;
+		goto err_clk_disable;
 
 	ret = phy_power_on(priv_data->usb3_phy);
 	if (ret < 0) {
 		phy_exit(priv_data->usb3_phy);
-		return ret;
+		goto err_clk_disable;
 	}
 
 	return 0;
+
+err_clk_disable:
+	clk_bulk_disable(priv_data->num_clocks, priv_data->clks);
+
+	return ret;
 }
 
 static const struct dev_pm_ops dwc3_xlnx_dev_pm_ops = {
-- 
2.43.0

