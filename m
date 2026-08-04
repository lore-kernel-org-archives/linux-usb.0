Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011001.outbound.protection.outlook.com [52.101.62.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB17284B2F
	for <linux-usb@vger.kernel.org>; Tue,  4 Aug 2026 12:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785846436; cv=fail; b=LeMxYbRDo8wz9393YaWIHoxj4qVNo8hgPw/hsoshroYVb2c1AzS8O1LLihyhRd+SertWbDhwQ6xLPdWfCKYe29CwimqkESjYy0pDYh2m+L+xpdSYLCzWQDkcsVA5NCPv8qE3VLO4CNdOftaMWhWOn7GnmrH0T0su/p35Xu6Qnl4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785846436; c=relaxed/simple;
	bh=hfewGhXz889jP/ZWnvS412MFZEXr2+go7wSZraEPnic=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=I4PX0k5qUK+8qlPy72WovPORAAjSJufUxv4gbNl06YgTKz4oXVhoIGgJV8CjhN0uZN2WVnkPh3W37/WrsORoiVg6z81G8/93Gblbq+jetVsaf2WpSF5RO+e1jT27bYsLSwGD+kLtZDBkffCI0IC73HDrN43IoxesNyoIjeyFA3s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=auRUjEyj; arc=fail smtp.client-ip=52.101.62.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="auRUjEyj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=taj8diAMVdzre51gQmBmSDORNsfQPGTU6L2bJEftSsV3dlsXhhgnY6YGmEkE2O6D14cvsDd4LRo+ozOFPpjlbpHshkf17X7fyOoouAjm/puLz8cuXa9n5Z4N1IX4vGizygGmvazlUDK/ZuJBaqT05M6UNjrYg4hr1Pj9HryE+m/vgOdJl22ROZJzH7feARPjzNVJx8Nz8QCsR+TGbkF9src5zCDUMRdY7s3xzmGfomemtGHnxKtC3lC8U36SzaJASU6eJj2WPJyi1e5Dr2SX1Ln+zdVVuX+4UbX9MA+A8PzJdOtkkJMrTrH/5UrpOPXCLtbt98pE3mT+pR0SIsiuYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p7cAnBq5Gi7egiPygTtBPjJhlbTDAHd1ge54qqms0bA=;
 b=VId4t4MjsWugLVx8wc02jOBLQVKaeMQV491HKJES+PecXGO+2KlFuI8zVaH0KfxlEv+o/pAQQs1FVsnQNIB+8/+wO+gXEu0qp4CSA66PXPEIW3ts3QQL6lSTIKycJfrNm7k9dngalCTXf4a3yCwfiPu/L1/CX1kX0rXEduBsz7JN+sxN2jpGIdcF9yNGmdoGSUmFYNMpngGSFmnIHOGMePyrKvhnGy6Ip2M3F7ffwKHHTU2oVYlTvM/TdUkA1tXWs01yS/XqOQPEiuiFODvEKlb9zAub5A1mWPSRc2XaqL6Ad4VMNO1QDkRVTTG+sDiYGqsGhQxqJpx+sG584SlWGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p7cAnBq5Gi7egiPygTtBPjJhlbTDAHd1ge54qqms0bA=;
 b=auRUjEyjtLIMj1CIc+Cs0z/7DWYk9VT/ltCJuyLk6ZBY3ZZ05ciLwNu08dX5weFIU+5umHHj2Xd4uJFClRZ6dYJqTphkkQVGDEos0cj1E56zVvjPpGopDewX336pD+8uyQ21RnuJ5zhPAsdksHBVEpo9KzMg51++iR4PLDzpc14=
Received: from SJ0PR13CA0161.namprd13.prod.outlook.com (2603:10b6:a03:2c7::16)
 by PH8PR12MB6844.namprd12.prod.outlook.com (2603:10b6:510:1cb::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 12:27:09 +0000
Received: from CO1PEPF000066E9.namprd05.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::7) by SJ0PR13CA0161.outlook.office365.com
 (2603:10b6:a03:2c7::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.15 via Frontend Transport; Tue, 4
 Aug 2026 12:27:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000066E9.mail.protection.outlook.com (10.167.249.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Tue, 4 Aug 2026 12:27:09 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 4 Aug
 2026 07:27:05 -0500
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: <andreas.noever@gmail.com>, <westeri@kernel.org>, <YehezkelShB@gmail.com>,
	<linux-usb@vger.kernel.org>
CC: <Mario.Limonciello@amd.com>, Basavaraj Natikar
	<Basavaraj.Natikar@amd.com>, Sanath S <Sanath.S@amd.com>
Subject: [PATCH -next] thunderbolt: Add quirk to reset host interface on DMA path teardown for AMD USB4 routers
Date: Tue, 4 Aug 2026 17:56:38 +0530
Message-ID: <20260804122638.1623429-1-Basavaraj.Natikar@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E9:EE_|PH8PR12MB6844:EE_
X-MS-Office365-Filtering-Correlation-Id: a98b9fca-4760-4956-d51e-08def223b405
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|36860700016|1800799024|82310400026|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	No/iV6y5hIj/bLCYFIhRS0mDXolwia0NTMgtuSHkws2iXxjHYBPoWrQ07CNEARGsg5YAh4IJUe3QpWqbNzsySElhVA6PGzrnYKG1Y3x6Dh8h8CCBvzc4dRgEOlIbsVMwWLcIYO4wkc3+9pi6zwQ5khWQAlKNOyIf39ZbaMd1VnrEs7KuiDOmqJjMOkTkk7fcXzRvAWQUnANQLZmX3BbbHUKfwGdle3GfYhKs0AyTaFqAUleAulhY6JhJotZjZCFT725koLqu3kJu+GW4chkxGwNNEIXGPUzSVy5rlDjadr0VhvyDld99GQQK/L7Gx56LV4GIBKS7AgaNn9f8cO1BAVyjaHMxJfFh197karTtGdGYGDzgb5Rdp+BtI9TpwCan96alQ5OmzoHKmCzQgQy9wUMrGmBQpl/ua23ixpQXtGra155hsCYQyNHi9pWnyyuXvgQVkRmUuU9o+k244naplSg9tDFZllmSg8zJhWj3ACOUTs7EtYFnFA8Kggyhb71EjxT/XCpB+czr3wfmcO38RB/MikmnrFFgmYrsCZryyt+H7aZo74Oif1CXgtBW96XKQJy4/KdxrJ4NjgbXJcgqYWf8RwpU0ECQMPQddf7evvIKfA2g9aHf+GdnHbb43OsKzmqv+ZQzGwnYFUiNvOLbpbkGfN0SzWFEVpnLn+mkerhjIjwKLRWv1n+wYGLBPiXVHpW1l6sCYbn9KKNMqov14w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(1800799024)(82310400026)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZGdbPvrId8oKier4TQzgy2VvALoZQrnuHWdyKYLTEjTcRgq3v07JtwNhh+9D30lJkO0wB7OPm1UGiSMRxfciol6pXoYuK2mSIwzMnyxRRP3TGVmDSDsK0Or6t1eWg93YOKMtggmm0YfJ5de8JeFowJTwBsuSUDiVxp9kFKUNkTJa9rOHUquICqUUSL4JTJjGsybAp6akT1TaAZKDB2+NnIZQmekH5OrFmKCXfxcIyarD8Bl6cTRJ5S5BoZ4W+rzWASAoNLxVzboBI8xGNbkW0MljWPtX2BJWrHCRt/XYaUqbDD8aMTBYAuJk9vo++Q/mRh8WL3FhzzfiSFMLhj6eu42aR1Jpr4HGbnSoVChbNHji9eFnTnxTKFU+TNB9pfV9MLX5vIV9PJZVjSTW9Fbc8aIIePkpDkKHI5/b56LkkUqORWjufIqJ4P5cIJ9RALvL
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 12:27:09.0440
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a98b9fca-4760-4956-d51e-08def223b405
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6844

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
 drivers/thunderbolt/nhi.c      | 48 ++++++++++++++++++++++++++++++++++
 drivers/thunderbolt/nhi_regs.h |  4 +++
 drivers/thunderbolt/quirks.c   | 16 ++++++++++++
 drivers/thunderbolt/tb.c       |  7 +++++
 drivers/thunderbolt/tb.h       |  3 +++
 5 files changed, 78 insertions(+)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index 383a36212f70..0865cab582e7 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -1160,6 +1160,54 @@ static void nhi_reset(struct tb_nhi *nhi)
 	dev_warn(nhi->dev, "timeout resetting host router\n");
 }
 
+/**
+ * nhi_host_interface_reset() - Issue a host interface reset
+ * @nhi: Pointer to the NHI structure
+ *
+ * Resets the Host Interface by setting the RST bit in the Host Interface
+ * Reset register. This brings the registers in the memory BAR to their
+ * default state and clears the End-to-End Flow Control state.
+ *
+ * The caller must ensure that the control channel (Ring 0) is stopped
+ * before calling this function, since the reset clears ring state.
+ * The caller is responsible for restarting Ring 0 afterward.
+ *
+ * After setting the RST bit, waits for tHIReset (10 ms) for the reset
+ * to complete.
+ */
+static void nhi_host_interface_reset(struct tb_nhi *nhi)
+{
+	struct device *dev = nhi->dev;
+	u32 val;
+
+	val = ioread32(nhi->iobase + REG_CAPS);
+	/* Host Interface Reset only applies to Ver. 1 routers */
+	if (FIELD_GET(REG_CAPS_VERSION_MASK, val) >= REG_CAPS_VERSION_2)
+		return;
+
+	dev_dbg(dev, "issuing host interface reset\n");
+
+	iowrite32(REG_HOST_INTERFACE_RESET_RST,
+		  nhi->iobase + REG_HOST_INTERFACE_RESET);
+
+	/* Wait for tHIReset (10 ms) for the reset to complete */
+	usleep_range(10000, 20000);
+}
+
+/**
+ * tb_nhi_host_interface_reset() - Reset host interface with control channel
+ * @tb: Pointer to the thunderbolt domain
+ *
+ * Stops the control channel, issues a Host Interface Reset, and restarts
+ * the control channel.
+ */
+void tb_nhi_host_interface_reset(struct tb *tb)
+{
+	tb_ctl_stop(tb->ctl);
+	nhi_host_interface_reset(tb->nhi);
+	tb_ctl_start(tb->ctl);
+}
+
 static struct tb *nhi_select_cm(struct tb_nhi *nhi)
 {
 	struct tb *tb;
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
diff --git a/drivers/thunderbolt/quirks.c b/drivers/thunderbolt/quirks.c
index 9f7914ac2f48..cc04d0873931 100644
--- a/drivers/thunderbolt/quirks.c
+++ b/drivers/thunderbolt/quirks.c
@@ -52,6 +52,12 @@ static void quirk_block_rpm_in_redrive(struct tb_switch *sw)
 	tb_sw_dbg(sw, "preventing runtime PM in DP redrive mode\n");
 }
 
+static void quirk_host_interface_reset(struct tb_switch *sw)
+{
+	sw->quirks |= QUIRK_HOST_INTERFACE_RESET;
+	tb_sw_dbg(sw, "enabling host interface reset on DMA path teardown\n");
+}
+
 struct tb_quirk {
 	u16 hw_vendor_id;
 	u16 hw_device_id;
@@ -114,6 +120,16 @@ static const struct tb_quirk tb_quirks[] = {
 	{ 0x0438, 0x0209, 0x0000, 0x0000, quirk_clx_disable },
 	{ 0x0438, 0x020a, 0x0000, 0x0000, quirk_clx_disable },
 	{ 0x0438, 0x020b, 0x0000, 0x0000, quirk_clx_disable },
+	/*
+	 * AMD USB4 host routers may hang the Tx ring after repeated
+	 * DMA path teardowns. Issue a Host Interface Reset on each
+	 * teardown to prevent the hang.
+	 */
+	{ 0x0438, 0x020d, 0x0000, 0x0000, quirk_host_interface_reset },
+	{ 0x0438, 0x020e, 0x0000, 0x0000, quirk_host_interface_reset },
+	{ 0x0438, 0x020f, 0x0000, 0x0000, quirk_host_interface_reset },
+	{ 0x0438, 0x0210, 0x0000, 0x0000, quirk_host_interface_reset },
+	{ 0x0438, 0x0211, 0x0000, 0x0000, quirk_host_interface_reset },
 };
 
 /**
diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 47753a5c0f2e..d40cc9e57364 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -2395,6 +2395,13 @@ static void __tb_disconnect_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
 	 * the same host router USB4 downstream port.
 	 */
 	tb_enable_clx(sw);
+
+	/*
+	 * Some host routers may hang the Tx ring after DMA path teardowns.
+	 * Issue a Host Interface Reset to prevent it.
+	 */
+	if (tb->root_switch->quirks & QUIRK_HOST_INTERFACE_RESET)
+		tb_nhi_host_interface_reset(tb);
 }
 
 static int tb_disconnect_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 4373336d9425..d21feb631f3e 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -26,6 +26,8 @@
 #define QUIRK_NO_CLX					BIT(1)
 /* Need to keep power on while USB4 port is in redrive mode */
 #define QUIRK_KEEP_POWER_IN_DP_REDRIVE			BIT(2)
+/* Reset Host Interface on DMA path teardown to prevent Tx ring hang */
+#define QUIRK_HOST_INTERFACE_RESET			BIT(3)
 
 /**
  * struct tb_nvm - Structure holding NVM information
@@ -1507,6 +1509,7 @@ static inline bool usb4_port_device_is_offline(const struct usb4_port *usb4)
 }
 
 void tb_check_quirks(struct tb_switch *sw);
+void tb_nhi_host_interface_reset(struct tb *tb);
 
 #ifdef CONFIG_ACPI
 bool tb_acpi_add_links(struct tb_nhi *nhi);
-- 
2.34.1

