Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011022.outbound.protection.outlook.com [40.93.194.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56CDC47CC61;
	Mon,  5 Oct 2026 13:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791207868; cv=fail; b=D7/0cZtQNZyCIBQCPb/fRMW8+DEwcjDPath+/DXY2LRGMBhL8RI3I1iWPBisxi7YYoP4fYVAF9s2a/WBJoVRFHd2MVTBYGgrDJlbGVECIsqrlFRjJTF0niRR39CGSsbqrDconbm90voKJkrV21JDPiWdsYQb+wIyBz0Y4CSxmRQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791207868; c=relaxed/simple;
	bh=BlREDCqR14QsKISFytfxc1fA3j8PhBZRzoIQXCWTIyg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NbEscU5q090IwRr7aDxmf5j5Lz/BJcC916RecKbczYitXRN0wNcWpeOJyop3Ykt5ByUNu4p4tpJyMA5xwXxr9P9ku1kzr5rIUiX6seE7Vba6MwSOfs7C1Vgx39ok7cuxGEhT+bc0f4H90D0aVbuZEFX8ujhWiQSFfUBBMdN4g+k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=H6lGrBDN; arc=fail smtp.client-ip=40.93.194.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="H6lGrBDN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RHWNRen6aubCZpszkHu2wLVlTBhOrs2eKsweYO+WN5LNgzCgRacdGShfPeMZVSac6CWMe2C58b0UGW3kBY9yErxu3N0pCiVQ5vPsK34n7qQrARL96bChT6h5inmsk5OEuIk+Iz+MffCF1CJ/nYl8LzCUuuwAD5KgcujtNUFemAg/1qNWfG5S6S5RU7pzksy9nqFiTg5u/ZVk2k/3+XuEVorlysZp2SexXHmY30fZtJKM8CEtsGX6BUZya1KlZ86sgMkizLvNb5UdUf//qgcYiiHfDXKfNwOdXp2YsWtj/iWgQnVQIV8/lYvWLudqzZ0cmazetZnoHctCGDfahDGQtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gzWcP1wbqNxtsxOX2WMFgN0s6Ln91H14TkeX+D8SkZM=;
 b=cxruvAD0lB6BwjC9UdM1j88lOjDvM96Vjk+YV01BlnnSngQo8hz//KdIALAZ/RQexARQ//ujFydAhILbYHCYz6O2Kes3FIT4qWayohLOir7L3OdRI/nHnt1tDgFAZ6JJs65W+rJOiI/VVeviinZ15BsNE9Ke79y6bOBEuH5aFAmPQGX+ebXyfGSDPP29aMSUKNXkRnQ6fmEmqSAjhEq6dhKQ17LDVv265TF4sBcx19Lm1YewsiJmIDF1tQgT5zsJk/8vsNr8HKmNUKCmHQF4KxDtcPJCyCllW8uYehqJtbLoQ2hDLz9Yugnp7igU8UCKMjbNqAvs/yIavyazUyzp1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gzWcP1wbqNxtsxOX2WMFgN0s6Ln91H14TkeX+D8SkZM=;
 b=H6lGrBDNCA1nhajQTyUu/qW5B6j973Yckvw0NEcP/ZK7oL+1G3/od8o6RuWt59hU6NOjnhc5dwX80zVnOSQxGLIj65MQ+hH7+2yrml04i/aDgJAi5FqOo5R4rhXxlYVqqRWCXMJBoXKIOVIC0rhlDBVNZf7EDvOThwOTF83fOv4=
Received: from DM6PR04CA0013.namprd04.prod.outlook.com (2603:10b6:5:334::18)
 by LV8PR12MB9207.namprd12.prod.outlook.com (2603:10b6:408:187::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 13:44:21 +0000
Received: from DM2PEPF00003FC9.namprd04.prod.outlook.com
 (2603:10b6:5:334:cafe::3) by DM6PR04CA0013.outlook.office365.com
 (2603:10b6:5:334::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Mon, 5
 Oct 2026 13:44:21 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DM2PEPF00003FC9.mail.protection.outlook.com (10.167.23.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 5 Oct 2026 13:44:20 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 5 Oct
 2026 08:44:15 -0500
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: Andreas Noever <andreas.noever@gmail.com>, Mika Westerberg
	<westeri@kernel.org>, Yehezkel Bernat <YehezkelShB@gmail.com>, "Jonathan
 Corbet" <corbet@lwn.net>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S .
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
CC: <linux-usb@vger.kernel.org>, <linux-doc@vger.kernel.org>, "Mario
 Limonciello" <Mario.Limonciello@amd.com>, Sanath S <Sanath.S@amd.com>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Mika Westerberg
	<mika.westerberg@linux.intel.com>
Subject: [PATCH 3/3] thunderbolt: Add quirk to reset host interface for AMD USB4 routers
Date: Mon, 5 Oct 2026 19:13:41 +0530
Message-ID: <26ea33592937dcd93d06c901443a9b938cc24caf.1790854235.git.Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1790854235.git.Basavaraj.Natikar@amd.com>
References: <cover.1790854235.git.Basavaraj.Natikar@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC9:EE_|LV8PR12MB9207:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f819bff-4604-4bfd-cd43-08df22e6c26a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|7416014|23010399003|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	svjUrFPIQ6RteWmiZe9wOstfGsOtT99ROA3AHYjObltILDHJvFzM2zowiOTvEbEtWIamCgL8S+Cpw9Sk4lYMgjwhzQHmhTRtdhDj8TREaM8pjvwniSxAdTo+qqSv8+FkbEp7Xlp8MQoCe1hK6DqeWAx+5lkptIZWC6ZHLW/Ym/96L0DvUg/kn2n2V1+3VyGOd8skInwoWoEnWdc5cXb35+NP/6sgLtCq1uloVUH6+GNTUOAzUle8m955n1AGkD5wThLVInr2KFYqXccO1FmiY5OP7+EH4qfe6JRO2voXrnDOUvzIYUTZ1iNhVGilimI2WBgRVhU1ZUm8Mzd6mAkMI7SssFtchGIvBclLmHKlXeTQ792DFjHJ2bTTdc3quZY2Fb7lkp6lNvkALak4BbyZPOYX7Qh4oZN4c+zi4W4c79chTzPrUZl0jOIUkUzma1e/urpqGl3qsLkwPGSD8rrHl3oCWJBSllVhnDOSWEpr7l+bwzArTR4zQOvsHNyBDWm5jxSbBMPueRkuyaojWAbVDi8GgeA0Hu2LZ5aENzt8Sbjf8GfJ8g6r3x6TLgMyb12RCrK3+Nz7R0Smh5NQLEYB9Pa4LjcxhtyJsVkx2qfQF637teSB/x3vSdsLOVhTLpv/7jwG3iz+Jj+7XzMDCf02texbuXkqrihB057XK922uCpSv2RQAumDl2X2epQJytfLjk0vGmXkO77c2k6EyPxtkQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(7416014)(23010399003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vKAXtzckYDI3aQCc+dS0xjXkg9n52RrQiCf9ZsK8MWiuKO0bzxuk+vFL/rxcgaWyZuvZuzsgnauMzdIjv0u7clCBWriQSb4QdARgjR9lgURzwbVvFn4iTWtJNk/kSuAACubdibg8p+X9MRL0MJkc6O49xYc0u77x016M4oqhc0127jfrXrNStC2YhnmckJxXRanPtFR4QxoLkLikWAkPOzzWymSIrbUyEb4VbABI5CmR8I5Xio7ABEuPicXNpOPz8h2nl1d8WJlZmKDTkOAbXRdBwrdZetTP31ThGjNNWWt8T3RuXvvJEgnqIre8zVbkg+iFVPAL5tLSOZCduvvsOZjmHc28jynULmq1i1vFM7msTRIKw7N/Y5h3Q6UJgwJOZGo4HpG0J1dY7Uc6xbatbTFRuLBXEIlUMqSTASWfeu3eWr2iRCLWHATl9/erqlx/
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 13:44:20.8812
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f819bff-4604-4bfd-cd43-08df22e6c26a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM2PEPF00003FC9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9207

Affected AMD USB4 host routers hang a TX ring when a DMA HopID is
programmed again after the DMA paths are torn down without an intervening
host interface reset.

Hence, set QUIRK_RESET_DMA_ON_REUSE for these routers so a used DMA HopID
is not reprogrammed until the host interface has been reset. The reset
waits for all DMA rings to stop, leaving unrelated active tunnels
undisturbed.

Suggested-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Co-developed-by: Sanath S <Sanath.S@amd.com>
Signed-off-by: Sanath S <Sanath.S@amd.com>
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---

 drivers/thunderbolt/nhi.h | 12 ++++++++++++
 drivers/thunderbolt/pci.c | 21 +++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/drivers/thunderbolt/nhi.h b/drivers/thunderbolt/nhi.h
index 13cb94cae658..70d6ee0e960a 100644
--- a/drivers/thunderbolt/nhi.h
+++ b/drivers/thunderbolt/nhi.h
@@ -118,6 +118,18 @@ struct tb_nhi_ops {
 #define PCI_DEVICE_ID_INTEL_PTL_P_NHI0			0xe433
 #define PCI_DEVICE_ID_INTEL_PTL_P_NHI1			0xe434

+#define PCI_DEVICE_ID_AMD_1AH_M60H_NHI0			0x1120
+#define PCI_DEVICE_ID_AMD_1AH_M60H_NHI1			0x1121
+#define PCI_DEVICE_ID_AMD_1AH_M68H_NHI0			0x113b
+#define PCI_DEVICE_ID_AMD_1AH_M68H_NHI1			0x113c
+#define PCI_DEVICE_ID_AMD_1AH_M80H_NHI0			0x1155
+#define PCI_DEVICE_ID_AMD_1AH_M80H_NHI1			0x1158
+#define PCI_DEVICE_ID_AMD_1AH_M80H_NHI2			0x1159
+#define PCI_DEVICE_ID_AMD_1AH_M24H_NHI0			0x151c
+#define PCI_DEVICE_ID_AMD_1AH_M24H_NHI1			0x151d
+#define PCI_DEVICE_ID_AMD_1AH_M70H_NHI0			0x158d
+#define PCI_DEVICE_ID_AMD_1AH_M70H_NHI1			0x158e
+
 #define PCI_CLASS_SERIAL_USB_USB4			0x0c0340

 /* Host interface quirks */
diff --git a/drivers/thunderbolt/pci.c b/drivers/thunderbolt/pci.c
index 4408229d8ac7..b26f5b39e923 100644
--- a/drivers/thunderbolt/pci.c
+++ b/drivers/thunderbolt/pci.c
@@ -63,6 +63,27 @@ static void nhi_pci_check_quirks(struct tb_nhi_pci *nhi_pci)
 			nhi->quirks |= QUIRK_E2E;
 			break;
 		}
+	} else if (pdev->vendor == PCI_VENDOR_ID_AMD) {
+		switch (pdev->device) {
+		case PCI_DEVICE_ID_AMD_1AH_M60H_NHI0:
+		case PCI_DEVICE_ID_AMD_1AH_M60H_NHI1:
+		case PCI_DEVICE_ID_AMD_1AH_M68H_NHI0:
+		case PCI_DEVICE_ID_AMD_1AH_M68H_NHI1:
+		case PCI_DEVICE_ID_AMD_1AH_M80H_NHI0:
+		case PCI_DEVICE_ID_AMD_1AH_M80H_NHI1:
+		case PCI_DEVICE_ID_AMD_1AH_M80H_NHI2:
+		case PCI_DEVICE_ID_AMD_1AH_M24H_NHI0:
+		case PCI_DEVICE_ID_AMD_1AH_M24H_NHI1:
+		case PCI_DEVICE_ID_AMD_1AH_M70H_NHI0:
+		case PCI_DEVICE_ID_AMD_1AH_M70H_NHI1:
+			/*
+			 * These hosts may hang the Tx ring if its HopID is
+			 * programmed again without a host interface reset
+			 * in between.
+			 */
+			nhi->quirks |= QUIRK_RESET_DMA_ON_REUSE;
+			break;
+		}
 	}
 }

-- 
2.34.1

