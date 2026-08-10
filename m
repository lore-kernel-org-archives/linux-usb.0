Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012057.outbound.protection.outlook.com [52.101.48.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7533328C037;
	Mon, 10 Aug 2026 15:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786376770; cv=fail; b=tK4UvGyduAftgxCuni/VjPtVm0ibjf0GJC5M5n3A+CjrBH3XbABZqD4rAO+7WMQyFU47+4gijwv/wZqSi3kJIQq+5++AqCWVLRgvt0ZCpuvGIGHZztucaODB0IWk9lBp4mXT+97CNYY/WzZXaYmVVF9H17WC5ekkWhU7V0/k7WM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786376770; c=relaxed/simple;
	bh=4k0wTJCsF9alb04plCMrW+A5YX+JJfwZqUua3RoSv3k=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EvQLo8oLzJk05wIYO4gfO6OcESh/xc5r8zRRQaIO/4JJZpczbhCpxCAJDIyutIwGqKxHMZ7/jzNhfpHFeK9vwopR7VAWKXPjIrqRH2GztatalOHTfRun+2eG6mVhI2YOX/6cVpzcG2SG1o9W3xf81iK/vjzG82iw1s9rtfWcvpI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=oyYBw7B6; arc=fail smtp.client-ip=52.101.48.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="oyYBw7B6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GCaqNCRkMvx0AitpJIGoUW1wnUp2W7LxD/b+feVdI82lg7+tF7TFxlNwz67EfOtdvAlkdrBAfKnFW1h1ng9FzSziL9eEvaSMe8PSDzp75DbkoD8bcaMHyM9ASjGpTlbv+XeF6FKofC/BmTUlt1WU5UfS78m8ruh2knf39opa1sM1Rdm/MBZr770SzFRgsEzycJYmr90+OSE47d9t7/4ivIrrqKTksXNXATQKk+XODKOrLKH3gIVM2k/oIswuRPTXradj35Aw9eLNydE+vT0w8oRgbtLaULojtO+5UHL1VZMc8YtJZZaEvWFavdmDZM96KiGn/tYXSB4hrlK8+SrQwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MBCpWTAT+/WY9l5Gqw00y64hFH2fWZ208mCkjY34bm8=;
 b=D7H3VMVWt42MlCPRxi6xICtzRLWAEwRKm3YUxR98MHdvhWFmhvZEcAzqHAS43bDA8SeKy2a8kx5PQKnSbQvZuIRWQZCPKnWIO6eSPDpc2yBBonSzt6ZmCe1/bqqcGkpWumTyikyst9XYip/hYbH1aG7tToOcTPDCTRFq60Scyo+eDcoMfQJoN2Ykb5caDnKRha4MLjvzykVedh6VlClcXcGFm2vcCe2SP3HlQbfXS02U3SSN+m5y45+6bTNmTalMnqSXKOuQFanDBwDX5g1v0iEVGd+PWOc27ElONAW20sAq96r7RYHd+c/hhBghAc8Dp7kOOnVCvxgFGyBkKB0IEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MBCpWTAT+/WY9l5Gqw00y64hFH2fWZ208mCkjY34bm8=;
 b=oyYBw7B6jd88a8nSWCVmHlgIx48ITDb8BuWScS+x4+J9CCfCjKiEgFSynvNk3KfuYjlHQ56+lcpSXzySWqdNcPoLBusiMtnaUHOfvpiiB3dml3wGHX+rSv52HlFAak2651A/8WFSeUgIUD8r33fS8EtyLQkL7Bgr5I6YJY0MQy0=
Received: from CH5PR04CA0012.namprd04.prod.outlook.com (2603:10b6:610:1f4::28)
 by DS2PR12MB9639.namprd12.prod.outlook.com (2603:10b6:8:27a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 15:46:03 +0000
Received: from CH2PEPF0000009B.namprd02.prod.outlook.com
 (2603:10b6:610:1f4:cafe::a7) by CH5PR04CA0012.outlook.office365.com
 (2603:10b6:610:1f4::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Mon,
 10 Aug 2026 15:46:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF0000009B.mail.protection.outlook.com (10.167.244.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Mon, 10 Aug 2026 15:46:00 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 10 Aug
 2026 10:45:59 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 10 Aug
 2026 10:45:58 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Mon, 10 Aug 2026 10:45:56 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <gregkh@linuxfoundation.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, Radhey Shyam Pandey
	<radhey.shyam.pandey@amd.com>
Subject: [PATCH] dt-bindings: usb: xlnx,usb2: Make clocks required
Date: Mon, 10 Aug 2026 21:15:48 +0530
Message-ID: <20260810154548.2133565-1-radhey.shyam.pandey@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009B:EE_|DS2PR12MB9639:EE_
X-MS-Office365-Filtering-Correlation-Id: e5bc8700-2642-4800-4711-08def6f67a07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|23010399003|18002099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	Y0qihZ8+s4aH9oWzl8QuHFnBjrTivnPezN7zneUXjWDf1QgrhCBsApixYYK5VisDUJ+8I/+WPgYODjDtukTpDsUGt9Gt6+v888XW9b74HudP0RyLK1DivgAq585Tdcc10SXCBc7bc1zOzAY7yyanV1ljAetcdH0voiP0woRbOO0Y0IkPHermys7WGln2kmPB4bEP8eUziWmjXb8l934GjfNsgO19rktQ/fV06d49jnYbZT9gbTfyy35LMNBrqq+qbkVTnvrtZTcDfy+5caWaeoXRaoa3nkRYCJx+uuWvMXX0eExsh1p8e3BXR7OT4c1dVN4L6XU8qPZ7GGIckDS9DkfbitmPvOAtNe1Zsldy0O7a0RtFVGNOkDZSAowXruCdX05wdmyeePjKrqD7vtBEUO+j1E4Ptv3G/Q1vYCXdHt2EydZjGqZvdJDXRFvA5k/jAlCMkd+c8XLSsJlyv2ecKK3DcSFtty/7P7ncr9en60da2UFDI5Roap3bcvquRQODy3gsf9wzMoxNNIXpC2ig/aN4npvNRFgkefHJN2bgnGSk6C/wdkF28ANlYT7GrMWG13J3JpTQWVulP3tb2edIvHw0OgGuiihXx0CdAF8bxL8r26b4MvxA3WeSW0C5QSjIbRxabluJaLK+d66h28E8F+ibUpkno/rySdVySV67pLDQJB7YVPHuA5oIWpX/M4egv+0wg22FFwpzkAxqvqRrFw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(23010399003)(18002099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cd1KM+aXsUa7fSl8+GrdmRIAJehYiDLF2RGyzsAcFM5Pe7zUyKq+zoucBamgHiQcDqPpotq2RYvDKVueOT9HiJ5kt9x2VNDwQUQeffHVLL5/ulxL5j5Tv37NQwepTnBXK54R1qi9YCTc4vLTkc28E74BcerpFVfAhxyvhW0+NToNF15Eww4mGoTsuk/XDXDnT0pUJrdmfFSZ1sV23u0+nkjwe7LHJrTiDB2iYbfSVwFPlwqgubowXeuBYGA3FvclW6ReEXIcVwfZ1Y9N2osaGg1J0AgfQpEUqHBOzrQiXoJ5B/YEXmcP5Nkz2YKOBia1awtxGOekEVc+m1djCdTBuDTnVzqaE8UYuEURNblErQRg9VO7HdnrvrlVJwC7q2YQuiGE0VWFCGFHl8P5wO3NijMKbTNZ2gO12vO991ulHf0TtPLIKdWh3pdWr/unFzMe
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 15:46:00.2309
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5bc8700-2642-4800-4711-08def6f67a07
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000009B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9639

Add s_axi_aclk AXI4 clock support as a required property. Traditionally
this IP was used on MicroBlaze platforms which had fixed clocks enabled
all the time. But since it is a PL IP, it can also be used on SoC
platforms like Zynq UltraScale+ MPSoC which combines processing system
(PS) and user programmable logic (PL) into the same device. On these
platforms instead of fixed enabled clocks it is mandatory to explicitly
enable IP clocks for proper functionality.

So make clocks and clock-names required properties.

Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
Similiar changes were done for emaclite YAML in commit
60dbdc6e08d6 dt-bindings: net: emaclite: Add clock support
---
 Documentation/devicetree/bindings/usb/xlnx,usb2.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/xlnx,usb2.yaml b/Documentation/devicetree/bindings/usb/xlnx,usb2.yaml
index f295aa9d9ee7..156d3676f9f9 100644
--- a/Documentation/devicetree/bindings/usb/xlnx,usb2.yaml
+++ b/Documentation/devicetree/bindings/usb/xlnx,usb2.yaml
@@ -34,6 +34,8 @@ required:
   - compatible
   - reg
   - interrupts
+  - clocks
+  - clock-names
 
 additionalProperties: false
 
@@ -43,5 +45,7 @@ examples:
         compatible = "xlnx,usb2-device-4.00.a";
         interrupts = <0x0 0x39 0x1>;
         reg = <0xee000000 0xc00>;
+        clocks = <&dummy>;
+        clock-names = "s_axi_aclk";
         xlnx,has-builtin-dma;
     };

base-commit: 6b8c8af514d739d0335f5579b585e02babe8a727
-- 
2.43.0

