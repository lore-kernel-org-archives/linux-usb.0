Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013070.outbound.protection.outlook.com [40.107.201.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C92D3D75D7;
	Thu, 18 Jun 2026 07:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781768893; cv=fail; b=LXHUuYUgQAF6Dcby4psEFRT0EnoAiSs62WMopXYAzU2X4fYb7feI8YYcUePWODhPoS8HiPsorEogfYi9MbPaOSkjGGgAKqs3WFKe0uHkEBfeOkDvA1sjWgfYkQjAgIZa5/3Isxx4NiTcFIOdMUytajKctY7nS0e3noYJ2V3z8X8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781768893; c=relaxed/simple;
	bh=fSsEYnRHB5+mgyU69pQWCuk/zymrNKYHUhBYFavxgP0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QR+ffd6iG8MHJjqS6ml2esEcRwAQEldMjI8mGhYOdjrKeHPdcErXwzIEJdAFo09KM+hcf6Qifabp78s53mLM5CVwnNHoe8KvDx9kmZoMuAF0clXSIV6GXkCFFDTGaY1MP/n8GIFcOEjfpLEms2+a7qtFoSW/qM0z7Rlv/qJKE9M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4y/P+Mcn; arc=fail smtp.client-ip=40.107.201.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4y/P+Mcn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HyPzFwL/5wgUofaldFmZHBP55296eWzbDuTfyCrvRLLn1wrH0H9jttZ2UW7+jZxAkdUOm7uK7Wgwr2Ah+TGhm9Z8FEq3P5I4DETDuSXVbcBx3IX7yR1NNwIkQJuiBlNa1u9XdxCcceznFRX/qdrjTzBz8xyrJSjIFmFKO/JJIJE4AjcG0vgl4I8WK7sd4rQBxUtxKDyjUh9c8LiOtgV8+blPkR4MPMDawAKsQxADEuOCUqiZ/jhoraPSIZCNe3BY1Jzq4bfIE2wdJAc4Qi0mGLNrdNUXwBOencq96f2M84rEUjMjyzoz4RsZiGYgtnSNr8RpBpjB12W8owvcCyDlvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oO8qhwYCDfcmTbY9SZfwp7Habnoc+pXm9voB7z++IQI=;
 b=gCuirguXYxtu1B4omEkXnH4liCEzFWhbfqz0wEYSdMIEpVMRhsuq3RFirfe5WoqyT8k1EJlGlOTks2JgGMvPsHb70MBW25TbYMGaXxDExL0WPzQ3IR3FQiEVOM7IJnFI1slaFbze3arYi54u/agQUqUuOULvTO7vuwgfCmitkdu/rldhSSU16JZVj2ht7y/+zvBl3ZJI+CLOkS81ogHwOJfKkOHhASU8nMrJScN6GOoyKDW+3mibIaE+WD5ce2VAL6HZ5kw57Ox3kegD0JH5dollLRM+kkQKYGl4njJb2LDmuzxUmids0PdsLvcREvB/Yqmkd5mVYCMQKkXMQKg8yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oO8qhwYCDfcmTbY9SZfwp7Habnoc+pXm9voB7z++IQI=;
 b=4y/P+Mcn1dJv7O/5Jpra7BQhSBFFm+efho/DUfpFa6VpGbo9WkWaQNoP+geMov7aebtbwwjCHOc/WepREnzgDgx+PKiwRYzzqNl6VLoQ1VKUdrQ2XXthDi3J8XsDAzTYd8gNoxSxWl0DiGtEAN/GR65NtiqfLK0vmFRwkKe1wnM=
Received: from SA1P222CA0065.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2c1::16)
 by CH3PR12MB8483.namprd12.prod.outlook.com (2603:10b6:610:15c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Thu, 18 Jun
 2026 07:48:06 +0000
Received: from SN1PEPF0002636E.namprd02.prod.outlook.com
 (2603:10b6:806:2c1:cafe::a6) by SA1P222CA0065.outlook.office365.com
 (2603:10b6:806:2c1::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.13 via Frontend Transport; Thu,
 18 Jun 2026 07:48:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SN1PEPF0002636E.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Thu, 18 Jun 2026 07:48:05 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 18 Jun
 2026 02:48:05 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 18 Jun
 2026 02:48:04 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 18 Jun 2026 02:48:02 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <heikki.krogerus@linux.intel.com>, <gregkh@linuxfoundation.org>
CC: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<git@amd.com>, Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [PATCH v3 2/3] usb: typec: tipd: demote missing IRQ message to debug
Date: Thu, 18 Jun 2026 13:17:43 +0530
Message-ID: <20260618074745.629638-3-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618074745.629638-1-radhey.shyam.pandey@amd.com>
References: <20260618074745.629638-1-radhey.shyam.pandey@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636E:EE_|CH3PR12MB8483:EE_
X-MS-Office365-Filtering-Correlation-Id: c088f4c0-2993-47a5-c550-08decd0deed0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|82310400026|36860700016|1800799024|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	HHZ0bL7RwR0zDJti/8dp/b8dVPaFhnJBDYXVR4KINrFPJiIIYma8WBv8o0X/+IEL1xfzp6s3SoMDdDdPDvEPofVp/7Hj73I6kNlZmCBq8B1W8hq90YmuegYyCsZEh2tn213Q9GxsRW073uhq9R+CKL2i7LA/ftkcylRMfVpXXFSbB5qFDHLWtWIADzHYZcbWVsD4p5tb6/MXIbEuGiIxCcrYUyU8bxGyZwG+lI8UQwRM6cWQqNKL5Ud2QSMCd2lKyKWNbF98oNPrKHm25giuKE23zYfr4K4LuVAFsNcAvLwnSXckAZMgKuuZAt638oV3FHS5/ZthaSJW9kfUPZc7c7l23Y9+ZmXmSVCnom2YTUg1dgdjsTcswQivoLDGaW5MfiuCQbVOjGvTtWeogm4/MtYXjt8Iif/s9rP9/fYnlG/jF7xvKr1CNKtnThFRnu3mvIJhpewbb5mZ8pyLABFBjgov/LBPRxwOz3ivMWMwfWL2uvUY0bfy4rOEiva5zF8vcTpvh5t05LPrOX/WMs9uc7pOKve7xzhXCX1lvNohXaYYb+uI3+rSYbMlYIx91CU9Bg1UWIRma66ot7woKe84Yt3zEYkTFFjvZlTfnKsVeqMOfV5d+GlaJWDhgdj303EyVdMeBBoM7919Zk8fUjYz8mQdamBeFwuzBtNw9osxUI/AjCH+nUpK8VEN1WZPESz5QYcKxfJ+n+ExGTHtRheuiagVE0b++p3SlWZFQ77M578=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(36860700016)(1800799024)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3kI24zDv8D9ILXGJP2+B7Uz92l5MV/44blHGk0zLMAmu1+TfwXesmTgEAM+b3v5FRXOyn7wt3/fHBWoCiqhp5O/VJdzlA0zmd44N3FaUKuqpLtXlYKPDhjTsczv/+xt/G+cEErzLU08rBiksNyK0y1qAa5ds8E2iEZeoGQSabfZ6qGae4BAg0mQxxA+91YLQX8ZhPF+yFP24pONvLwzGIhpj6p/4c03BDq3+yK8YmMeI5/Htno3JC5BZ1c5DNe6wAQbd66kCUjhjlAJ5Yc4xYS3VHakB6XFfg9iq21vvqidaq6jQtSp0zcrGRRcJHLT1NKPVbNF9QyUbJTOFqIsrpldlHMt1iYUAkXIYRpy+6mxpPyeFC7fVw8uEJixDKZ2ciBWkfpefdAUCAmqi1wLloRwYMeAOAuY7Mt7Oa3/JZr95R7r+bvYTn5u4Yi3tLkqO
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 07:48:05.7491
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c088f4c0-2993-47a5-c550-08decd0deed0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8483

Operating without an interrupt line and using the driver's polling path
is valid. So move the log level to debug instead of warning.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
Changes for v3:
- Add Heikki reviewed-by tag.

Changes for v2:
- Suggested by Heikki Krogerus - make it dev_dbg.
---
 drivers/usb/typec/tipd/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
index 465788f8490a..b6335b36d384 100644
--- a/drivers/usb/typec/tipd/core.c
+++ b/drivers/usb/typec/tipd/core.c
@@ -1854,7 +1854,7 @@ static int tps6598x_probe(struct i2c_client *client)
 						IRQF_SHARED | IRQF_ONESHOT,
 						dev_name(&client->dev), tps);
 	} else {
-		dev_warn(tps->dev, "Unable to find the interrupt, switching to polling\n");
+		dev_dbg(tps->dev, "no IRQ specified, using polling mode\n");
 		INIT_DELAYED_WORK(&tps->wq_poll, tps6598x_poll_work);
 		queue_delayed_work(system_power_efficient_wq, &tps->wq_poll,
 				   msecs_to_jiffies(POLL_INTERVAL));
-- 
2.43.0

