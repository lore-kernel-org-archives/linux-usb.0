Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010035.outbound.protection.outlook.com [52.101.193.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DDAE42377D
	for <linux-usb@vger.kernel.org>; Wed,  5 Aug 2026 11:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785928728; cv=fail; b=WewhuOdYeQSYAT3TIP6uorZ+OgtEbptlOBCUGNlLAOwtK0OMdNJnpxjWqrzNZTpVrgym1VI4cfRg8KJQyWM1zVJvGtqLEy1wqsU/GMsH2XnfHe+ob1s4hrnlDwqToSprM2Mdk39MxVBbGu59j/eN7oGL2g7VC5BWgR/ZoiGLPuY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785928728; c=relaxed/simple;
	bh=kj0H3lKoXW0RtWaXsunvRuWbAV60MC1Xgb8rjWuqNCA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LhCfFCoc7fj/JaPrT/5I5fwIHX7Aeuf/Dp8dKxRiOlUm0aKMp5htgT13VdlRKSx0yQuQLGmaf2y3ilHOr+CQzrtmfgF8vAuxJ141AkSZ6/56no6kCDvovF6XWW9+TrbqXeY+qDuXzlhcYijyk8lw0UBF/DvdWTEnWiXt7TQo7ZE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=dhFKdyEi; arc=fail smtp.client-ip=52.101.193.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="dhFKdyEi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uat1kWPgMH6z7KB/8tQYba5ySKsN+JOqtNpa6RkQd1cpZicOBV0SZPZL1GjsfAOlG2kH76PluVhX+1IYh7DWNCzXzQumWOCuaV7p7mjvlwGYfqSCoRY0wV1iX6+BgeE5B+EsrOME9TgiFQ7g9Q0TTYg+63XbgAlOTHGkQz2P6cl0XPeOCyQZrRrF1do9GfevueEyS5d0MDkP8oKfve6MjlsC8shp+Z5xGTuyo2KMsUcBbMnhvu6GFc83fNn+JGc+OHgZmViHoEbHvthWfi2WH7WeXAX3TXeLHQkhmMwdAzNH2DIODAY7dAiHWE39bW8ZL2a5Zv/OZ5cTxrTkFfo+PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HHMH/AziKAY09PbQw+ax4NdopRjBMVQB4pz6DrI3/7E=;
 b=DOb7QhvuNIngeBAphLB03zKuopkss6HhMXl8YxBqhFWR8/A9bDOIQOoX5lV8EhieLeI+xtOEw0M9eF/4RY/hMuUQgT4ZJYpKzh+sMZmBMKrSK7DRl1CSQkgcfWcV+8ZDdLZa64XErgIVRiJlr95Hp8GLLhVo49fmn4UMV6hR0hadquvumRqpf/JWBOVSgKzn5hbSGjm6O5Tm9s8pDRFJKtWEXzSY61h22TfujUrstzAN/UOCubrVZoagoFX9kgS1OxHXzzr9nNrWzkIlmx6ISBuNzucvbJlFW1JGvHtIR6FALvmpGQL5IsxxLKtBp4aaZra4FYAUnMjhpQQP8emzFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HHMH/AziKAY09PbQw+ax4NdopRjBMVQB4pz6DrI3/7E=;
 b=dhFKdyEiwo1wZz4KuXY08F4edsqaXV55Z5kK2vfjwKi8tXqSa7q/LXd2x+/HU0aJbl25x3IWxYmWuwkP+uDHN+dYQDXueNMQayPmi2FlXthoeSfcI80IO15IgrBBvcAaNoL8o/MVQ0HM4nD2+WrZ6zOcRx+SDv5Yr17Y5s7ko1s=
Received: from DM6PR07CA0089.namprd07.prod.outlook.com (2603:10b6:5:337::22)
 by PH8PR12MB6673.namprd12.prod.outlook.com (2603:10b6:510:1c0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Wed, 5 Aug
 2026 11:18:39 +0000
Received: from DS3PEPF0000C37E.namprd04.prod.outlook.com
 (2603:10b6:5:337:cafe::8a) by DM6PR07CA0089.outlook.office365.com
 (2603:10b6:5:337::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.19 via Frontend Transport; Wed, 5
 Aug 2026 11:18:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS3PEPF0000C37E.mail.protection.outlook.com (10.167.23.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Wed, 5 Aug 2026 11:18:39 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 5 Aug
 2026 06:18:35 -0500
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: <andreas.noever@gmail.com>, <westeri@kernel.org>, <YehezkelShB@gmail.com>,
	<linux-usb@vger.kernel.org>
CC: <Mario.Limonciello@amd.com>, Basavaraj Natikar
	<Basavaraj.Natikar@amd.com>, Sanath S <Sanath.S@amd.com>
Subject: [PATCH -next v2] thunderbolt: Add quirk to reset host interface on DMA path teardown for AMD USB4 routers
Date: Wed, 5 Aug 2026 16:48:11 +0530
Message-ID: <20260805111811.517996-1-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37E:EE_|PH8PR12MB6673:EE_
X-MS-Office365-Filtering-Correlation-Id: a43dd6fe-a85f-4bd3-7a31-08def2e34cba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|1800799024|56012099006|10067099003|11063799006|5023799004|18002099003;
X-Microsoft-Antispam-Message-Info:
	72gH/fXynaGqhyniG3p0ONysnJ+j3t/3bVOqO8yq8K8Asy1cY4Uv1W+gauP7CL0LfhQ2kocMZDZKIJMpHuzvCcMhd5pLloEXivfQvHHKTY5Fk/wDQOEb5fkKm+j+5MQ9pjj2ECQSL0PEbvynlFYgNhrFzq2kCgQOQdz9xvgqqgZu/BRrIuBhJTA9k4DxpA841Ld8hyrtxGjCmZ4fFqRIaFBG5GxBnwxOFB3Mt5l/QtMAMu5l3OaWF1PQmhvb0cNChLDTkYPcoem3LZkkZ5ieIM23Pf1+VLoZOSzpHe1cCdw6oDzAA1bwTyXNqXNmpkdhndzMKN/rTIjQAM4lcAQffppa720IlT82CPOzyo0MMPJoWgLVxNgc5M1fyy0KEa1dE2Pfz9r6SD1wZ32VlYX+swWa1fKmAAMgX0SXfgzP6lk5qVI/PCCryicdNXj3xfbJ1uOn28hT+KnEJxJ8rRgJakj5wynxbtibUOAKbNlAw/LpNIqcRiWvfECQNcVA4Pmzy89J5vQWXxzIS6r67AIvLcwu5JKahG2UTF9mhHfozFlCZRtVBxLcaqgnH8ZbBCCDLbPFGSEdcwegSbB4U2o9OZqI5RHwaSQWs2JPrt1T8TS/9X9WPFSdMYeDnpKA9xII08jBb3K7bgKnWNFCl2579vNLWdnaR/1c+zX6PZJ6mCK8R7HnbhYAHDvkOiOG/cIGpup+Y8GrqKoUvZ8xts2Z0g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(1800799024)(56012099006)(10067099003)(11063799006)(5023799004)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	avZ8wE/ULPmjxG9VbAQHVN/3AZks69Ml1UFMSxJIpiJA4Wrg/E3gMF75Vp84Bnci1UzDJllGhbYZ89ccerjNt56fqehApGu59k4hMfbSifpPSBBMTIzOD3MsrdySIOqOjf8RW/uu1sfKDBIpobYyfhTp7hCu5HM+CwI9tBeWiHEvmnU92LcHkHtY3wJFiRm/m/WrPMc1HnhN1IWucxeZEJHhPTnOhz4Jxs66Xfq6e08znDxUMeOtaa3zmZPWqU8PkIbhjqJjbGf3OAR7ENCVVDv0/BK2bw8s0Anm91jsd8I2Cq5K6DADnL9X29yNFg+nAEMrO/Kg3rYXQpp3JVSKAsvLHdh5AEeaPyYtdtBkBVzH+epvbnz+lH8rhTftUXszLSZgN5LPA/aH7P5j31P3fIYMTTzJ1PB3EliW31lqtputGPsGlkgBcxnSxFO8/XRT
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 11:18:39.1162
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a43dd6fe-a85f-4bd3-7a31-08def2e34cba
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6673

Some AMD USB4 host routers have a bug in the Host Interface where
DMA path setup and teardown cycles may cause the Tx ring to hang.

Fix this by issuing a Host Interface Reset on every DMA path teardown
for affected routers. The Host Interface Reset brings the registers in
the memory BAR to their default state and clears the End-to-End Flow
Control state, preventing the hang condition.

Co-developed-by: Sanath S <Sanath.S@amd.com>
Signed-off-by: Sanath S <Sanath.S@amd.com>
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
v2:
- Move the quirk to the NHI (nhi->quirks), set in nhi_pci_check_quirks()
  by PCI ID following the QUIRK_AUTO_CLEAR_INT convention, instead of the
  tb_quirks[] fabric table.
- Declare nhi_host_interface_reset() in nhi.h instead of tb.h.

v1: https://lore.kernel.org/all/20260804122638.1623429-1-Basavaraj.Natikar@amd.com/
 drivers/thunderbolt/nhi.c      | 37 ++++++++++++++++++++++++++++++++++
 drivers/thunderbolt/nhi.h      |  2 ++
 drivers/thunderbolt/nhi_regs.h |  4 ++++
 drivers/thunderbolt/pci.c      | 21 +++++++++++++++++++
 drivers/thunderbolt/tb.c       |  6 ++++++
 5 files changed, 70 insertions(+)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index 383a36212f70..72a76db5ea68 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -1160,6 +1160,43 @@ static void nhi_reset(struct tb_nhi *nhi)
 	dev_warn(nhi->dev, "timeout resetting host router\n");
 }
 
+/**
+ * nhi_host_interface_reset() - Issue host interface reset
+ * @tb: Domain whose host interface is reset
+ *
+ * Resets the host interface by setting the RST bit in the host interface
+ * reset register. This brings the registers in the memory BAR to their
+ * default state and clears the End-to-End Flow Control state. Does nothing
+ * unless the host interface is known to need this (QUIRK_HOST_INTERFACE_RESET).
+ *
+ * The control channel is stopped over the reset because the reset clears
+ * the ring state as well.
+ */
+void nhi_host_interface_reset(struct tb *tb)
+{
+	struct tb_nhi *nhi = tb->nhi;
+	u32 val;
+
+	if (!(nhi->quirks & QUIRK_HOST_INTERFACE_RESET))
+		return;
+
+	val = ioread32(nhi->iobase + REG_CAPS);
+	/* Only v1 host interfaces implement the reset */
+	if (FIELD_GET(REG_CAPS_VERSION_MASK, val) >= REG_CAPS_VERSION_2)
+		return;
+
+	dev_dbg(nhi->dev, "issuing host interface reset\n");
+
+	tb_ctl_stop(tb->ctl);
+
+	iowrite32(REG_HOST_INTERFACE_RESET_RST,
+		  nhi->iobase + REG_HOST_INTERFACE_RESET);
+	/* Wait for tHIReset (10 ms) to complete */
+	usleep_range(10000, 20000);
+
+	tb_ctl_start(tb->ctl);
+}
+
 static struct tb *nhi_select_cm(struct tb_nhi *nhi)
 {
 	struct tb *tb;
diff --git a/drivers/thunderbolt/nhi.h b/drivers/thunderbolt/nhi.h
index d488eadadfce..9be0372b837e 100644
--- a/drivers/thunderbolt/nhi.h
+++ b/drivers/thunderbolt/nhi.h
@@ -36,6 +36,7 @@ irqreturn_t nhi_msi(int irq, void *data);
 irqreturn_t ring_msix(int irq, void *data);
 int nhi_probe(struct tb_nhi *nhi);
 void nhi_shutdown(struct tb_nhi *nhi);
+void nhi_host_interface_reset(struct tb *tb);
 extern const struct dev_pm_ops nhi_pm_ops;
 
 /**
@@ -121,6 +122,7 @@ struct tb_nhi_ops {
 /* Host interface quirks */
 #define QUIRK_AUTO_CLEAR_INT	BIT(0)
 #define QUIRK_E2E		BIT(1)
+#define QUIRK_HOST_INTERFACE_RESET	BIT(2)
 
 /*
  * Minimal number of vectors when we use MSI-X. Two for control channel
diff --git a/drivers/thunderbolt/nhi_regs.h b/drivers/thunderbolt/nhi_regs.h
index d6a197fabc74..99df60b6db36 100644
--- a/drivers/thunderbolt/nhi_regs.h
+++ b/drivers/thunderbolt/nhi_regs.h
@@ -115,6 +115,10 @@ struct ring_desc {
 #define REG_CAPS_VERSION_MASK		GENMASK(23, 16)
 #define REG_CAPS_VERSION_2		0x40
 
+/* Host Interface Reset - resets TX/RX rings and E2E flow control counters */
+#define REG_HOST_INTERFACE_RESET	0x39858
+#define REG_HOST_INTERFACE_RESET_RST	BIT(0)
+
 #define REG_DMA_MISC			0x39864
 #define REG_DMA_MISC_INT_AUTO_CLEAR     BIT(2)
 #define REG_DMA_MISC_DISABLE_AUTO_CLEAR	BIT(17)
diff --git a/drivers/thunderbolt/pci.c b/drivers/thunderbolt/pci.c
index 8462ccb59b7e..02534287cb43 100644
--- a/drivers/thunderbolt/pci.c
+++ b/drivers/thunderbolt/pci.c
@@ -62,6 +62,27 @@ static void nhi_pci_check_quirks(struct tb_nhi_pci *nhi_pci)
 			nhi->quirks |= QUIRK_E2E;
 			break;
 		}
+	} else if (pdev->vendor == PCI_VENDOR_ID_AMD) {
+		switch (pdev->device) {
+		case 0x1120:
+		case 0x1121:
+		case 0x113b:
+		case 0x113c:
+		case 0x1155:
+		case 0x1158:
+		case 0x1159:
+		case 0x151c:
+		case 0x151d:
+		case 0x158d:
+		case 0x158e:
+			/*
+			 * These AMD hosts may hang the Tx ring when the
+			 * DMA paths are torn down so they need the host
+			 * interface reset after each teardown.
+			 */
+			nhi->quirks |= QUIRK_HOST_INTERFACE_RESET;
+			break;
+		}
 	}
 }
 
diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 47753a5c0f2e..f07f2ada2346 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -2395,6 +2395,12 @@ static void __tb_disconnect_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
 	 * the same host router USB4 downstream port.
 	 */
 	tb_enable_clx(sw);
+
+	/*
+	 * Some hosts may hang the Tx ring after the DMA paths are torn
+	 * down so reset the host interface to prevent that.
+	 */
+	nhi_host_interface_reset(tb);
 }
 
 static int tb_disconnect_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
-- 
2.34.1

