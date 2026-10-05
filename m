Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010053.outbound.protection.outlook.com [52.101.56.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D694854E6;
	Mon,  5 Oct 2026 16:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791218901; cv=fail; b=XcAVOtSTvk5cXCMd5+cRZUk7j36NWljro28WyNMhqjJVKLwAmg7yvn1GZulpSnloDEmKC2c6aeW4eHsJf8+v8wM4oVqFhLW3lYb1RRqr/t04CQ1GkCULtsu4lorwrMcfR4OvQYHrUA8IrUld2phwV3f/WyfE1DHkMZoQiA+FaMQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791218901; c=relaxed/simple;
	bh=lvzDOr1iflrueADH0jT6IQwBNBbkZp63RdK4bn5jbJc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V4hp3h8VLCRxHF8+Yt5u1SZ0W3SU6RWUd7VdxHfypapqZ790K3XTebeJj/oEmflJ2dlnTK9dzIFAov9YuFiyr/nprsfDb39DceyDaKW0hRT5HNvrZeFKqfU9lgCM3T4clltRQDdaoPXgnPwrJ9nc13lIYWwvvcURN0NUvP2xMwQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=LI3SwaQZ; arc=fail smtp.client-ip=52.101.56.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="LI3SwaQZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=upqdku9DDUIdFaUQpZUAcEz2Hsmm6VqAQ9D4/3fil6fLmlTK6hOmZ3qDaYk5HpGEyfoziJoNmgP2DC8r+ICdKCioo292CJ2whMHevSi/qM3ZVBVGKOgWUoYQqtliEu5zjtBR4hw3wFpSTHL/AkzloeWgihN+BP1qormK5dpXyERK1qyNo6K6ZEGk1neap2EZbfCKN0py/tRB78qRjLXdqsuykLiVU8o4SRibwXmjGsL/tmGue6VqCdfc6WyIkyiNQSAF/aCqYZ4pe5AlnZ9PGRvjOBpAVKRjmYIVmdH8m1EscDuvzrSBPGEkYZZ0Dg8heLp8s58mHW7LLlf06pK8Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kHF7e5EOsc+Ir/sK+sZHExr15+qMNs7hk2/FCZTUOkU=;
 b=hRoExlGOKZyF+5a98bN4nhVIv9pbzYkQAeKckzYnk1s1r82vZAvt5zaNWoVHvEtAcZIchS6i+izrhhxeQkRXIbJYhIhKdSRaN0ADwbQTfkq3ts5e2fYRKQAWbMcn4giDqB4rt+Zy+7CnZxtqz1Ohnnb7cGX5+wZlGSpzAStap21KV+yc1LDYemtJmW8kaDTaWzNyO+Crv3gRMhY0IEYuA7hs5jGP8sBhnvtqr6Ew+CVdjXoPbxPjvQnCI7lVY5t0vGOFc1xuVnpAGEXUQRBkqapgZcVkJZFKj/LBbwPvkXUU078kKrEN8uVsP6KQzAK9yO+SEs6jwty0Az3BkJcQfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kHF7e5EOsc+Ir/sK+sZHExr15+qMNs7hk2/FCZTUOkU=;
 b=LI3SwaQZT7b1No7d4htfxKD1kIMEmKyAwg02QSTh11kK4808gK40MjU7tA69XphxFdQwdVORlPyWUL9zCP0Q2OIcGoDZ/U/PI2T5+C3ZgTBDNlDUW1r4jFiZJvf+o8dEmThx/1ylqfbIq0pL75SQqtxZ4Vab8Ym02o06DYsymwg=
Received: from CH0PR08CA0003.namprd08.prod.outlook.com (2603:10b6:610:33::8)
 by SJ0PR12MB6735.namprd12.prod.outlook.com (2603:10b6:a03:479::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 5 Oct
 2026 16:48:14 +0000
Received: from CH01EPF000BE943.namprd02.prod.outlook.com (2603:10b6:610:33::4)
 by CH0PR08CA0003.outlook.office365.com (2603:10b6:610:33::8) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20
 via Frontend Transport; Mon, 5 Oct 2026 16:48:13 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH01EPF000BE943.mail.protection.outlook.com (10.167.244.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 5 Oct 2026 16:48:13 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 5 Oct
 2026 11:48:00 -0500
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
Subject: [PATCH -next v2 3/3] thunderbolt: Add quirk to reset host interface for AMD USB4 routers
Date: Mon, 5 Oct 2026 22:17:18 +0530
Message-ID: <20261005164718.4166200-4-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261005164718.4166200-1-Basavaraj.Natikar@amd.com>
References: <20261005164718.4166200-1-Basavaraj.Natikar@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH01EPF000BE943:EE_|SJ0PR12MB6735:EE_
X-MS-Office365-Filtering-Correlation-Id: ad4c112f-9168-4cf6-75fe-08df23007281
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|82310400026|1800799024|36860700016|23010399003|376014|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	7ICRSVMLwMv65XgksEiNkHWbU3VT8C3zZMNWMEIjRCwHGwvArndyC2bT6F3gOyWrAn6NOWwZX20NFOGGgqYCjqGX97LVMmSD7oOwV8sWkMS/PMbJp5uSf42qFZFxS5egSmaBRYpmKZqPADPTUKdS/QEsLBh/8+LhNSdJ9eBTlrzbhZtUIeHhk687UO8hvKD/Z4bjQ/nqLWel8Zju+W3ZtyXe9uwlaC78Mog+Kmb2gKmOyHRG0f+fEfqBsZR+NfAoTngZ8N3RtCuJOF2BnXPVGLaKotFuDOBgLzCyXZBz+x3t+IKDRkR9DO36IADfXKiWjrwCOzvpttAtIFC6cnag7qebCChR3AFO8jJK9nCQDRUWK3RVVctyr9/0Cqu/Wq3IIe2+S8X7repXK1zGzfapsYYHMQZOl0myGlKzuuuuL6yVaq9zS1dpucIR5og3s6bkPMt3Vfh2B9MEtHG8yGAEhiNxEb/q3ECDG0hyTyMYOANXgDFoEy/EUcBxdDeh7sgBBc0QJVkzCdfwGF0lM+vtMgI07h+rtNsUZ0I7VOiIt0Cy3oRaKFLGvFmMgYxJYyXNWW6lM5MzYoOET8RDURzePrIKdTwaR/DiNPAvBdEsfoqG8NhekQm4Ex+k3CcjwFtBEDSdk8nqLpPIGoDVYCdBnCeLpy8CgUfGHcdOjRngy2BGjHLmXtD3GMh4hqdYkJ5fIHO1851IeggNppzDddgXig==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(1800799024)(36860700016)(23010399003)(376014)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dhbmsoCD/is2nmriVRgQPPLAS6MRuNm8TPukTznyD1mrI5NhJPPbZwZbcLKXCoYKXODpMncYHzEwe31sIU6REXzSpryfrzBXXqnRNSEUSagmZafW2ciNlvWoONJoCp3pOv4y7Oe6PNChc/+9PBNQtmB1ChGvHkEol7ZFtULzzv5cY4Knc8OghNsX4drKOf4fkKW22ErZxo2i8BeqblXl4UnXoRV+nbCDPYJ5tmnEZLvpoaYPnCg3TXaunc85T+BZvcjEJStQXR2lueUxjz8bsvJij37le0qo0/KX3R3j7msaP9ti0vunrjuxeTd8b6wnWJeX2CZvhSmawQ0lQnhLE6bn8u56s5iklLbtvSGZ0weTwcXy6STeZ36Gz6vxRxiTAxwgb5cs8fIQ2UcWt7sWjpxuIyR383+S63OBioVJ6IoqBKfnzzif+SFXToKkIlPe
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 16:48:13.7378
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad4c112f-9168-4cf6-75fe-08df23007281
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH01EPF000BE943.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6735

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
 drivers/thunderbolt/pci.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/thunderbolt/pci.c b/drivers/thunderbolt/pci.c
index e40d4d6af071..b60b0d136821 100644
--- a/drivers/thunderbolt/pci.c
+++ b/drivers/thunderbolt/pci.c
@@ -77,11 +77,11 @@ static void nhi_pci_check_quirks(struct tb_nhi_pci *nhi_pci)
 		case PCI_DEVICE_ID_AMD_1AH_M70H_NHI0:
 		case PCI_DEVICE_ID_AMD_1AH_M70H_NHI1:
 			/*
-			 * These AMD hosts may hang the Tx ring when the
-			 * DMA paths are torn down so they need the host
-			 * interface reset after each teardown.
+			 * These hosts may hang the Tx ring if its HopID is
+			 * programmed again without a host interface reset
+			 * in between.
 			 */
-			nhi->quirks |= QUIRK_RESET_DMA_ON_TEARDOWN;
+			nhi->quirks |= QUIRK_RESET_DMA_ON_REUSE;
 			break;
 		}
 	}
-- 
2.34.1

