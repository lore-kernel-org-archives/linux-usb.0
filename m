Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012038.outbound.protection.outlook.com [40.93.195.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A08C3D6CDE;
	Thu, 18 Jun 2026 07:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781768887; cv=fail; b=SR8iMXHvFgWXVQWdNwLWVVCou57Ul/f63ooxTmL2zDCTslps0lb6tkexFbsI0R3hJ7hk7MhYR5+dHJ/rdSijjE7fLwKzPKpBEO4hK/gho6rSZS0nCBR877x0BDGTW918Wqc1OlNjvrW9gxkOlrZQp3ZzvRq8jEqA2AxNPPK5SFM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781768887; c=relaxed/simple;
	bh=R65+b5zL8EuVliR9VR+5A7uTryOEzNiIQYJ+Jl9zc1M=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=L/sylBbHIK4DuoroFz6Cwxz2uXV+cKUes1rlIL0CuQPQ5CQYcOyn5j/gE5MnecETknPMMG5Kbwpe6m105SkxrXQIFtdBthnvl7tmQx+zlIPXZjfIjncyR4Ue6Lj5dzHC+OW+nR4oKCnDhkOTGIFCDbSqHN0PSRJvj6jC0WZCN2o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=urh3yl+I; arc=fail smtp.client-ip=40.93.195.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="urh3yl+I"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aCATvPvnDt7ilDWhGe8uugPrgo3oWvel/uWt12n4YoJjbVLDP97qujDHljL1a7fx53wyGPl9FVlUgHwgXZoslXE/iXBEsSdEHMcCH2tqjLpS5m3kBrKOp3MnVko6cK9AeqHDRBKuwxuT3g5oQQ80sxrXloHf+OKulLD3Z+YDskOneODiZpzn07JSQowWdBf9Y7dYsibS/QC7wzo/yoINPiXzXB7yAWe1rgdBRmbdw0k/GxM7bkqllWc6b5QXAMUBhAFg9/rIYaLR92smE6cW60JUz1X0uHImx2iMutREmEQBDH8xRI8mHWDHSGR06G6qQtQtExQw8UOZQ0167ETkag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ij7MGnFQxVPF4ZUHtT68EdfSNe4AxG53l7zWPypYEKc=;
 b=O0PPAGMg4sKMWziWbmfqhMMG+/10zCllu/uL6IzAK66GzW/J8hQEOdNa8TGw/juFAJnBZFIWuVF6i4P8fGBtka2Xurppe81aUe8B1lHGPnmzfWOUhjyAeaEJlFNK2xtrgyHXFVlc1x4FqTq+fMdSYTkBFrXfI3lhROgEB4jF6CkWBUiR+HDIjdjt6jyr8rxnsuzPqPp7R624z1G9e0OaD1Z7yqt6DwTx5SmzLyRZWaaKpqo4TRijWA0JdkGSZIBJTxW2Uyt9kJIcZ4OZZ91eEnaPYFXRkrl41xuVlDT1dFQT/ZsM+FJ/ZPHD4Fp/vpaNxEtcaZ5VIpEtNjthSgAhBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ij7MGnFQxVPF4ZUHtT68EdfSNe4AxG53l7zWPypYEKc=;
 b=urh3yl+IXbbveI9tc/am8YIV7EmYwLSRS0/cutFKqK5pDyR56dTiDO45OPXhVZi853d5LlM0CE8OEK2uBwZ6eB3q0mqYtlU7qWu8VZo/zVBg7vue5ZoLPZJosDW13BCv2OuhcSAGBU+9OZ+XXkUcZtMoIDAonBcs4D+eWUzEFKg=
Received: from SA1P222CA0062.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2c1::13)
 by DM6PR12MB4236.namprd12.prod.outlook.com (2603:10b6:5:212::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.18; Thu, 18 Jun
 2026 07:48:01 +0000
Received: from SN1PEPF0002636E.namprd02.prod.outlook.com
 (2603:10b6:806:2c1:cafe::a7) by SA1P222CA0062.outlook.office365.com
 (2603:10b6:806:2c1::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.14 via Frontend Transport; Thu,
 18 Jun 2026 07:48:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SN1PEPF0002636E.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Thu, 18 Jun 2026 07:48:01 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 18 Jun
 2026 02:48:01 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 18 Jun
 2026 02:48:00 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 18 Jun 2026 02:47:58 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <heikki.krogerus@linux.intel.com>, <gregkh@linuxfoundation.org>
CC: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<git@amd.com>, Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [PATCH v3 0/3] usb: typec: tipd: improve probe diagnostics and POWER_STATUS handling
Date: Thu, 18 Jun 2026 13:17:41 +0530
Message-ID: <20260618074745.629638-1-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636E:EE_|DM6PR12MB4236:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c9cd776-7a76-4eda-4ac8-08decd0dec4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|23010399003|82310400026|1800799024|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	DkMlyob7Lw7azzePnN5/WdkEclD6koQsPP5l6MbQT6L8bazgSUACfWYxwv1TpPZOKxXmyd5GL+Kwdj6jBlim1HwOo0KlObZuGfcRY7p4x84IySUjoF5XPCtLBZJ+plVBOIsxGuC0X8wgrQS6yeugRjlccmFJV4H6fWtepdCDtJuI6xUrzidLbQ6ozGiTFS36KptAys+4tLfL7Sv8RkL8fDsH3Mg1Z1SXqVPBRZf/Mbjjc0Zvv6/SBkD9VDPrDUDMQV+VGxJVO4G9kXSt5dJhltiFlIrwzIIEEDPccE4hVxAV8DwtkWw1s+1fzXW8OnZhk5IS5cutOpDb9Cl+fbib+5ok4JGuPfmt0RMFfR2f3BoIFBpEvi3zP1MHVsizp2cos/roswOCZVbJwypVxUgj0UeIRLZLCDdCZ16IYU1rR3fqAfu54vDXIyHPpPsYG1z+UOhL6hpUVDLJ0WjCY8t+umf8zvc0IYMLV8PjR+7A/VspKOtdHVqnc/SyEYmKTipV5g9bC74utFCm3g6QQNwuKtKz7O8N8+5lTyEkzrCDeuymMIB9Pt3Gik35mSH92yFwtS3LmAbsJzC00RSxJ7XI7aRk2QEKiRH5dBgvBtXnKxIm9616ZWBCPbxwOQ4oj/+NvekjcqC5oq3jHkREhNBrXFA0tY93cYo49oZ0zSp7anskNZ03hR4a18uwFZCzusTMaScFJVyMb620cEdaLDcywwG9agsZJljDz1zulINT5Dw=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(82310400026)(1800799024)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qgeFdC6OT8FZb1DidxQKPTuO7TNcml0GA2VwTf7mBQ6dBsphRxb3AuIhqi4GGO2DGo3ELZFsmt/Emyx8v2+heNy8V+FgSS8Lq2qUpxokSp5chmpGdtuK5eJRwG/8ZCupOt6CK7CpX7zEvInkOMjKrQEWuFTxRyQ0J/gcXw8psvEWkgzAuE069HVUEfsyvY7c18Usctv3+SfLv9uS+p4q0sHpREbGKImqPuiwVLlhKu5UvHNTbd73FObWL+LksVtFfxSAVcOgTnXXkM2FRcKpUjqOuQCg1EBoMzc6GmRr6YOIE+xh3OusxHRR4CZ9f0QFojfjKHyRgYzTuCpaIEywnoCPsPISro20OhEFjbQxhC21K+Svp8guhUb4/u2R7iuCHJqOQH49a4nae8VnXSUI2CAPJefgDmf6QO2rg0KnS2gULoFmDkqeOQx5jvY42AoD
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 07:48:01.5128
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c9cd776-7a76-4eda-4ac8-08decd0dec4a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4236

This series tightens TI TIPD (TPS6598x family) bring-up ergonomics and
cleans up register bit definitions:

- Log vendor ID read failures with I2C return code and register value so
  boards with wiring or address mistakes are easier to debug at probe
  time.

- Treat operation without an interrupt line as a normal polling setup and
  log at debug instead of warning.

- Name TPS_REG_POWER_STATUS connection/source-sink bit masks and use
  them consistently with TPS_FIELD_GET (no behavior change).

Changes for v3:
- Add Heikki Krogerus Reviewed-by tag in 1 and 2nd patch.

Changes for v2:
- Extend commit description in 1/3 patch.
- Move to _dbg() for missing IRQ message in 2/3 patch.
- Add Heikki Krogerus Reviewed-by tag in 3/3 patch.

Radhey Shyam Pandey (3):
  usb: typec: tipd: add error message for vendor ID read failure
  usb: typec: tipd: demote missing IRQ message to debug
  usb: typec: tipd: name TPS_REG_POWER_STATUS field masks

 drivers/usb/typec/tipd/core.c     |  9 ++++++---
 drivers/usb/typec/tipd/tps6598x.h | 10 +++++++---
 2 files changed, 13 insertions(+), 6 deletions(-)


base-commit: 4fa3f5fabb30bf00d7475d5a33459ea83d639bf9
-- 
2.43.0

