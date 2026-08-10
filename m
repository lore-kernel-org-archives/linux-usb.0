Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011043.outbound.protection.outlook.com [52.101.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494BC3FD139;
	Mon, 10 Aug 2026 17:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786384077; cv=fail; b=obRiwaZInPpj84f6j4ISqswjFr/WCKBkaMOe6zvc/ZfGUyU2W8brbX/lXp0V+OiuAB4eubky78sTcdWdIJ8INbkywLzO0/UMXh86qYkvabIJu/tS3qGNnQSlykPIdaIg3i6n8fXO7M8i2SmhupTZkVjTYYGJbzFYdzTvaJmg0ps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786384077; c=relaxed/simple;
	bh=iHWmM9YJ+hFmAaXOtJb68ZgZ5b0DBBIATttgqgUGGe0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lEVhub1WsrgNVNl2B28rTnpbOmIK23Lf1dGJZQN5dNrD8Sh+KIlrzRgOY0AfHdMhYQF3b9yVeyRvVpqpM5GpNtlV1TNgHK39FtWyG4bRDEaxjjCS0gZpcHOwSRkhsTM9z2d9PegVsm5ptmJYLM0D7zEK7ghzGHrsMInnN/Qzrfw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=j5r15VfK; arc=fail smtp.client-ip=52.101.52.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="j5r15VfK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=awYLmyXQiCJUjJ5jJJ/iHHVgEy5claxGV/2+3fGSKmEoq6RJWFlRHT/pfG2qFaPKe4PpA1C446GThZ4p6EE+efYe+fpjct+MK5d/1SpY/m39GXDgGmiCs32Bntnpgs+fh26Vm2+0F8Qv4sYFa1mlZ5M9mwMUv6k/crchS+bR68cqK1yP3JtsICJPTfSQycAGNWYZAUnFxgYuh3PP5cpiCK4/rNvNRISsicI+fhuWnNx41YHEvaktlGS/RZTIHALSe0fUedXPWu4e4MlM54C5ELXkNpUmGVtotVeRaf8xrHEIBx6WuTH1j/FyhWAyHJFburpWIctygZeHDyujP5Y9OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6fFfwCBLJOJM0hlD/7pHj1tRZd1yh8IUyQiry9Hv4fY=;
 b=Z0r8OQhqHvaD1FPOivuvu2t6BMneptLWmU/hPkauECx0yaFDv9xZoQQO6MRkvB4p01r9nDdAulIZtjC0XE70zJEMQAhTCVKRUWiwKEOtX6Kzr//mNMSJeL6ioGkv3tpMDCA5OHBSFpKZ4RGIA165juI1bQ81z6d7HB8vLu3m72rI23FVdLvKNiapMxdY4YwYEv/iXHTeL1Jp4fpM+JdDGCH1HnhHyDnca3GNFiZetsiwIBtEMwLw3CNczYsTPWmAvhTTltfX7kaSotdM66yfAnKXn8LHeSi7ajUd3NY2ZCVq7YbWFH7fQgj18ASGHaVteJAsVjZGveqKe4pweDY9PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=synopsys.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6fFfwCBLJOJM0hlD/7pHj1tRZd1yh8IUyQiry9Hv4fY=;
 b=j5r15VfKUYGzQvBIOqACuWBgEbFKCt8sXSTmvghDXtuFmH+LMe3wQoUeLNFEFu0LUjtCJOX1IW1JEN/+YR1LxWbwioZJ5aBfA7UZT0X+h0uNmoDEvTDGC82Q/wQmJF/zQU/TSUcciDhB1Nvj/YHlXyQsgXb2NBqqF4e0gzL/JY4=
Received: from CH0PR03CA0433.namprd03.prod.outlook.com (2603:10b6:610:10e::18)
 by MN0PR12MB6054.namprd12.prod.outlook.com (2603:10b6:208:3ce::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 17:47:48 +0000
Received: from CH2PEPF000000A0.namprd02.prod.outlook.com
 (2603:10b6:610:10e:cafe::96) by CH0PR03CA0433.outlook.office365.com
 (2603:10b6:610:10e::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Mon,
 10 Aug 2026 17:47:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF000000A0.mail.protection.outlook.com (10.167.244.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Mon, 10 Aug 2026 17:47:48 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 10 Aug
 2026 12:47:48 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 10 Aug
 2026 12:47:47 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Mon, 10 Aug 2026 12:47:44 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <Thinh.Nguyen@synopsys.com>, <gregkh@linuxfoundation.org>,
	<michal.simek@amd.com>, <p.zabel@pengutronix.de>
CC: <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, Radhey Shyam Pandey
	<radhey.shyam.pandey@amd.com>
Subject: [PATCH 0/5] usb: dwc3: xilinx: error handling and teardown fixes
Date: Mon, 10 Aug 2026 23:17:08 +0530
Message-ID: <20260810174713.2325292-1-radhey.shyam.pandey@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF000000A0:EE_|MN0PR12MB6054:EE_
X-MS-Office365-Filtering-Correlation-Id: d966de85-5b35-470e-e601-08def7077e12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|23010399003|18002099003|11063799006|56012099006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	+JxAmO5Tyg1tsvxrAYgdW9DF2iVADCqq+1bzB6RPt1/JeQVo94g+ToXrSptq6N/rIa53BD3G7EwMZdGPDo/W3RC5RYq05x1JLJ19LNotSs3NtUkoA0EUdx1FwL/OxFPU6ZyxzZYtvroQqoBZIOpqw5wFg3rXTsVzgNALlZQifwaVWD86+6uGxEGL79adxIoOYQOYPC+hH/zrrFXWN9I7hMm9U45L22S9d54F/raSvsjsMyeFKhLH2fP8Kp/vZBk2AyFJ6xliGR9WWJilAD+Z3cMB++vrsAossmag9R2pQuLSDuItdwSZ0u0IXe2GFYQXcUwOWr6Fh1QT8Eq2pEIxG8tCS26zgVv3+ePuahEuU7+4J1yHXKV7vEeDTHAeV3pjSFvYeAGb1DK1k3DfXivJa5OOkvW6zN/7/8P4jMiQGVbtStFeDpapdSDtGNwrzQWwwuuiSHutu8hFl45vRIrLpwkil8KSY/kxunuW/wbmO3TmMQPvoma2Cc3CR05C0Lt6978pDiPeEs7c020/6GFpNHCnlNUiRzcpph9JD2CR1YKk94+iQkft1mMZY4dIXs9EuKb9Q4zeJIjmLKHTOBcINqkvfMThoL843PxZNZ9EMqFLu3sYSnmDrThocVH+fKr9vBXwr2dy3gTEUPxwuiN08fkSE8DGMQIl0ZGwbZJaDN8/Waxi2IlYcX/un9wJ0bqRpmQJFdRQ2F4KHEl7EV4ikg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(23010399003)(18002099003)(11063799006)(56012099006)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KVTW4GLsDfmVLSRaYQF8U9kop0XPJKtF4fHJVJNV+LLT77HmKobLoSBM6wpVWIuyymoAfFXdG9xcJFI4Zewdgq+ZDJ9I2BX+w3VsciVLqJAiELgMMqthWaG2atUDcmcNzue5cdUpZbfM8HYshMQNANmP2T4//K5uZPSrDEFp8dfGI+HLNvBZJg8UCZw7R7OVlfuRJnMfsJFGzIBL4aslD229KHryKqYFwE7jOIzJqTZ4qsKByQqmxqrDy94SlzKP0ahkWLesf3kpvXOUt1Bv1qxfY+Iautr5afCn3y+clA9ipQUS1wZEqE+lQSectolEyrguU6tsPhhPd7VpQHaF90cPYqxOzLteZ0NffRSj/O1sqQl67W2YN1X9MEhIZiuV3SEjZoG7E6e2b78GUCn9DCtm7d5cjVBuk3HwaoD86Rv/WyUJI2fdBam0YuDS7ZCX
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 17:47:48.4620
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d966de85-5b35-470e-e601-08def7077e12
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF000000A0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6054

This series improves error handling, resource teardown, and system sleep
PM robustness in the dwc3-xilinx glue driver for ZynqMP and Versal
platforms.

Patch 1 switches probe to device_get_match_data() and adds the direct
property.h include instead of relying on of.h for that helper.

Patch 2 introduces struct dwc3_xlnx_platdata and moves ZynqMP and
Versal setup behind plat->init(). The struct also defines an exit
callback slot used by the later teardown patches.

Patch 3 fixes system suspend and resume PHY handling: suspend now
powers off the PHY before phy_exit() and propagates errors; resume
disables clocks if PHY reinitialization fails after they were enabled.

Patch 4 fixes ZynqMP init error paths. Reset handles are saved in
driver private data and fall-through error labels re-assert only the
resets already released before unwinding the PHY when init fails
partway through reset deassert or PHY setup.

Patch 5 adds dwc3_xlnx_exit_zynqmp(), wires it as the ZynqMP platform
exit callback, and calls plat->exit() from probe error paths after a
successful plat->init() and from remove()/shutdown.

Radhey Shyam Pandey (5):
  usb: dwc3: xilinx: use device_get_match_data() in probe
  usb: dwc3: xilinx: add platform data struct with init callback
  usb: dwc3: xilinx: fix system suspend and resume PHY handling
  usb: dwc3: xilinx: re-assert resets on ZynqMP init error paths
  usb: dwc3: xilinx: unwind ZynqMP platform init on probe failure and
    remove

 drivers/usb/dwc3/dwc3-xilinx.c | 132 +++++++++++++++++++++++++--------
 1 file changed, 100 insertions(+), 32 deletions(-)


base-commit: 6b8c8af514d739d0335f5579b585e02babe8a727
-- 
2.43.0

