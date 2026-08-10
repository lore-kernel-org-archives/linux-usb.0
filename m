Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012055.outbound.protection.outlook.com [40.93.195.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C6C1D5CFB;
	Mon, 10 Aug 2026 17:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786384078; cv=fail; b=ieTQbdOBJ3W+MLILqKu2Lfv5X/Fw5Tv37JpPTFzkLGProY6+CnIBMsvP7fOfkGZllBJgLrIoJNDB1qjbU0V7S5DhU+QBnhj3Bqaz86cWSd1jcCPPw7RUo9nJNhj+40f2LPpw5klmPBHc47U9EeTxMsryuVajlFRMHYWREsccC3o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786384078; c=relaxed/simple;
	bh=gc20lUiKrAQwdH465jDKumkJWTXx/1BmNQEK68njDEQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZzPYpNgWppPC0dpYFMr8/41gXzFOgPgiJ1sO4NUy16srP+9dpClea64WI9nzZ2uPmXmRPhShxvWiXeUQjg0AElKAHx/IsjFokyU6F79BhiIFNNlbWIjcUG8WMA4Gv/GO229OZ5t4DTgRY+JwmFRfcd+7qQZ9vkmHw0i4HI31HbE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=IHMWHMAr; arc=fail smtp.client-ip=40.93.195.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="IHMWHMAr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V5SFC+AyfOOPodP5EB5kxk6RrTaKo5XCQ+0PS9PIspjuegm2UFDXuZHN/n0RvBTKS8A2STFUCB6kJfiV1qBjg7kjz52CejKvTC3de0m42UgxrxslGwVRZATu+ujYGn2EGUtBjE0Vt910djKpd3jnVA+V/N8x9UlXve/15M5pyGQB+/x+2I2SrICW1rt10+9VOfLQzk+3ZXExOiFdoyF1IPJoLhKTRthfEfQKakdQZ8bCpy0BIfqrPqrL3jfnQM7XZ8JDxnssK647Ub9WR8YWtuPFKR8YL3k3lK4EuNf08fvlDWeV3mrrAByEBa5Qm7rSuLfD0Bd/OH/JM0CxvvrU5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y0KiVVjsGzi9B9l+SyCnrGtTYo6w/3jGTx7xX3VYJU8=;
 b=ezyDwrjj/zygXfCtKEN+d2IkoxBh+pt9Itu0SejzEk/+A2c2ue4IeMkga9JqbjhU/hqX/9j0HGQdOlQyuCX4fgxYuUTREgxy0OUAOGpDLbtySMtQHO/p+lD0bPeKJ4o6soMvBzpO5JVd3GkDFmShs4aGwIDMP2qa9+oUCDDTSIgQewB+POEuoLevncWkktgdLRjKl/8EXQr7N5Mj5Pzm+dtocMl0buXoblxiSZuxeei7UWd3dexe/SaddpSLPUQCmQv8ps4c+dRm+446iTLczp4yfBadWeD1NBZSEPZlugf/XqtvMIh0b4fAmXELejmxhoKbSOVEGSRI4V4gx6aEPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=synopsys.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y0KiVVjsGzi9B9l+SyCnrGtTYo6w/3jGTx7xX3VYJU8=;
 b=IHMWHMArkA3/6EfP7hrCR1MRhn0YmrY1Viy/KF/TGRcdJTD8BENf5EK4W6BTgXDtMKwKlAcA8e6aAsvd9mZ872xkhuk40HOFoF65d7o84zJnrTCmg33A5Xw9fEs+NPj4eeGaTrgLEuBbUyuqUl1Mfv4peVafwQX734v2yE3FVdk=
Received: from SJ2PR07CA0010.namprd07.prod.outlook.com (2603:10b6:a03:505::27)
 by CH3PR12MB8512.namprd12.prod.outlook.com (2603:10b6:610:158::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 17:47:51 +0000
Received: from CO1PEPF00012E7F.namprd03.prod.outlook.com
 (2603:10b6:a03:505:cafe::ab) by SJ2PR07CA0010.outlook.office365.com
 (2603:10b6:a03:505::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Mon,
 10 Aug 2026 17:47:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF00012E7F.mail.protection.outlook.com (10.167.249.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Mon, 10 Aug 2026 17:47:51 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 10 Aug
 2026 12:47:50 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 10 Aug
 2026 12:47:50 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Mon, 10 Aug 2026 12:47:47 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <Thinh.Nguyen@synopsys.com>, <gregkh@linuxfoundation.org>,
	<michal.simek@amd.com>, <p.zabel@pengutronix.de>
CC: <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, Radhey Shyam Pandey
	<radhey.shyam.pandey@amd.com>
Subject: [PATCH 1/5] usb: dwc3: xilinx: use device_get_match_data() in probe
Date: Mon, 10 Aug 2026 23:17:09 +0530
Message-ID: <20260810174713.2325292-2-radhey.shyam.pandey@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E7F:EE_|CH3PR12MB8512:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f86093f-ff79-44a5-f374-08def7077feb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|82310400026|36860700016|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	UOHQ8S/1GeIYIARqbx1kEhziYoN7NjgNfAx7Gj7eSFm7yBaK9T0qxu3gHFbvzRu6q5D+Sb2MGjgXn7gHg5Ckybio5sgBMC1vxIjtUskVxXJuTaxKgDGVCEvmunqpI+F1CvFl5T5CNmYxsSBv2EhhI5BAPNC2n2PJBLGpYcH6CaUBEevDaclivu381kZvhfVEDR2KYhvKwE8h9tblg+mycsbdvaCoF3TS7an1sNfoddv4HoQLMMuoekw6QoejNsHEupDhUF9jppfF60IcCFJY1CGfMIZoB7SNEr2m0jqChyegnaXQwjxRphkA3yIYgQ8ax0Clu4zhu4GfeRX2bFxb06RkMm+2oN4QvNMf+voZWaSuvJQBLP0jz2mrwQN/qVxmNHpmFev2OvOJlpXZFSF4tVCN7F5K0NvC+AyAZKaz/P/QociNpz4N065ne/knhX/n6t8DJ+86w9LmZvhxqsrioSCs1pjZhn+HZ+GUOOooOIuy4IH8306P6ivOjoSLQHLJuPLYZmy/zrsgu+QhuVlJLqw57bq+sJlqaC/1ocOuRnXwElR2UHSnxAKl39FN/NkktWcctL8jrSRRbKBdrcpLFBAAh3yKVBf3J6Fksoj4PjBbtiWnG3rPqD9eRjXyUiDdYh5NOLSk4ldb+dgWW7sHZXOPMKuEp5YUMEDo43NIYj7GqTPPtsZu5ecKy6O44hc8GLPjkkpSLDLaBMv4OebvRw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(82310400026)(36860700016)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jKaP3KPDfKuEHo4zjHJBZxxtZru6VSgM1fdfiWD6fHGkI9ubbf/sJUZ7pJMhKUHAzByAe0hSYWXO7VW/dH8WA9Ee91+kQWlHbB4oBEkBYxj+QsOFaQNMvjHACrYoGNSviwQqGTJJQ3gJIkneJe6s1j8KemBRY0dX9HNlcIGNm+j4zv4ED32850RGNjVHVmHv8kMRBLTz03wK6lCFacJJsxKh0BIxqjkfzDwuF2IwN0Om0i2gNH5qxZ+X6kHE9eNr4gJf63UXA0xk2hlaq0rQfJsy+GSwtyya2K0T7t/3luYC9QnitEeLTxRFgfGBlLoM8HDTVZkgYoOVEKStQPXmVsBpHfOrxh3VuIvXRubO8RiH/Yf2xNxVfpqfTkh1uYcrao+sYWcDj/aX19wyKmhMPnuvg0WRLxVd3j8Vqf3UIkKrRROnXFPZfT8cky0M9d96
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 17:47:51.4846
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f86093f-ff79-44a5-f374-08def7077feb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E7F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8512

Use device_get_match_data() to obtain the platform init callback from
the OF match table instead of calling of_match_node() and dereferencing
match->data directly.

Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
 drivers/usb/dwc3/dwc3-xilinx.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-xilinx.c b/drivers/usb/dwc3/dwc3-xilinx.c
index b832505e1b04..1a8619854d6d 100644
--- a/drivers/usb/dwc3/dwc3-xilinx.c
+++ b/drivers/usb/dwc3/dwc3-xilinx.c
@@ -12,6 +12,7 @@
 #include <linux/clk.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/dma-mapping.h>
 #include <linux/gpio/consumer.h>
 #include <linux/of_platform.h>
@@ -279,7 +280,6 @@ static int dwc3_xlnx_probe(struct platform_device *pdev)
 	struct dwc3_xlnx		*priv_data;
 	struct device			*dev = &pdev->dev;
 	struct device_node		*np = dev->of_node;
-	const struct of_device_id	*match;
 	void __iomem			*regs;
 	int				ret;
 
@@ -291,9 +291,11 @@ static int dwc3_xlnx_probe(struct platform_device *pdev)
 	if (IS_ERR(regs))
 		return dev_err_probe(dev, PTR_ERR(regs), "failed to map registers\n");
 
-	match = of_match_node(dwc3_xlnx_of_match, pdev->dev.of_node);
+	priv_data->pltfm_init = device_get_match_data(dev);
+	if (!priv_data->pltfm_init)
+		return dev_err_probe(dev, -ENODEV,
+				     "missing platform init handler\n");
 
-	priv_data->pltfm_init = match->data;
 	priv_data->regs = regs;
 	priv_data->dev = dev;
 
-- 
2.43.0

