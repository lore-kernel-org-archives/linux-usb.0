Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010007.outbound.protection.outlook.com [52.101.61.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D71B24E4C6
	for <linux-usb@vger.kernel.org>; Thu,  6 Aug 2026 12:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786021196; cv=fail; b=ERMv/M/HaKzPCZCBzm5ks8OjhQECJlHlg2ObpJYtStkFS9jJipWtOwSB/p3Ou30rZoaZBmx8xufsNrmbWEKRXcHBOefcLe7rBWp+bvnCueamqGRMEEnb0rEdTdmvZ8wnDOuCx2VeRABW1FgymB+qoUXW7rmhPkQGvYPXiGiJhzQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786021196; c=relaxed/simple;
	bh=ix1xGRPaH6ilDEaITcBZ/scb6WBKEmbtEz5MWNI3wIc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jpjzjzDB4b9HysvmBPD4myKi0RK3Jp3aasCGUNMPYeikp6Aj8iNW3eY2zHuL1PEHHLwf7qU5mGoDz038X48fJ7JiJ2de8bR0xq4scCHRHKpX2dwxvIILtX61rbulrlNUXEGjS6vQNbcIck/3VjL0W1eCoHoo+2MscVqs+0rqYKA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=AAGZnBAA; arc=fail smtp.client-ip=52.101.61.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="AAGZnBAA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ea0tIIALzLSvwMZw8gkIZTytoOeCRTO2mDnET6bIwuOYWvs5QlzhQy+u4jfbSxUfwHTbRHauR7vSM3Lj0JE83ZyqZgiVtMUVEy5sRBUFmUcbf/KTqf8PySKFPgo7asRb2XUhizE6wB2Zx23mWZ/gmXmfuZFvm77xqbZo6Npsn5nfPh616b6mv83ukxtHBSzFIEZxzaa0K02gPgw2b8kjr/E/AlECgOgq2KJ1FoT3978lQWcykr9GikjLWMp4wHWwMZZbI6iwzBS9Qq8y76we1kIKvE7ZbSeH7YONHpSMDcM8gzmva8EKXG/cVbIOG0hBfLHHDVD0WOEw5XyheVUtUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JiH9ofRmm8nLaqta7U5spHVbzobJHlS25iPqazdDjOw=;
 b=MPuhtdkqmQC8wphmmE2dPdYZqlPyesPWc9i+SRWYzpAJU0fvtsNSJEJFIb8nzCUJYnSXGUZAuyOFTf7RA6Xz1MONk3WDuGnWnAv3CRHfzgycGmj5EBuGKFSgiMUpPW5wwSmpP9ZBef13jiWkUpxoNLO99A7N1rpMUPC15rPVOGznxu9J1TO5fkIRl+ER3gg17UNVSh+4CQ+VGT4RD+Bm2VtUoub1s+BkrtdqQHhAJWBxwora0LTgdhm6+cgFqvUB4hlJ7eLZJZ67E8p/dtrVz+741XSZj3afiQnN6zYNI+40ZyBL0sXmiu5323s9EfpsWi2udwjpFqHStzlKbwYBLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JiH9ofRmm8nLaqta7U5spHVbzobJHlS25iPqazdDjOw=;
 b=AAGZnBAANbP2/bn72sZ4d0he9iifKdA76Gnk74AVdooYixK5lzy2thRHIA18bNJ+t8Xq6ali3LxbJ+csluLm0f8V4n2/S4ZNYxDJKCWfr6MHfbxrNRLXtN4yeHeAhfyCCmTnkq4FcQMBU/R+4Xj+I1kvGke31IKpGlZ/gGlQqQ8=
Received: from BN9PR03CA0588.namprd03.prod.outlook.com (2603:10b6:408:10d::23)
 by DS2PR12MB9639.namprd12.prod.outlook.com (2603:10b6:8:27a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Thu, 6 Aug
 2026 12:59:47 +0000
Received: from BL6PEPF0001AB4A.namprd04.prod.outlook.com
 (2603:10b6:408:10d:cafe::d) by BN9PR03CA0588.outlook.office365.com
 (2603:10b6:408:10d::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.20 via Frontend Transport; Thu, 6
 Aug 2026 12:59:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB4A.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Thu, 6 Aug 2026 12:59:46 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 6 Aug
 2026 07:59:44 -0500
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: <andreas.noever@gmail.com>, <westeri@kernel.org>, <YehezkelShB@gmail.com>,
	<linux-usb@vger.kernel.org>
CC: <Mario.Limonciello@amd.com>, Basavaraj Natikar
	<Basavaraj.Natikar@amd.com>, Sanath S <Sanath.S@amd.com>
Subject: [PATCH -next v3] thunderbolt: Add quirk to reset host interface on DMA path teardown for AMD USB4 routers
Date: Thu, 6 Aug 2026 18:29:29 +0530
Message-ID: <20260806125929.1238914-1-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4A:EE_|DS2PR12MB9639:EE_
X-MS-Office365-Filtering-Correlation-Id: 5396e0c4-a487-49f0-d228-08def3ba97bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|23010399003|18002099003|13003099007|6133799003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	4IP55Rnh8LftKyfg4DGRXMFF21REyg3Fw6ufYp2rF69eYb2rPZ7wqI8qz0WkEusFzs6xXqjsJnmHvQaNSogMfoYjS+O+URQqEmCISqnTCjcjgCCwD6dkjWIs/4g23zNA0wFLVpLc19jGiljJRtXHHHEfa1YgTs6YcrKV217zpk8uWFqLJkryZlOU3GAScKkQrPiZlob9vVIkzaU92Q9AguOccHL5oVIPibCiZGFs2rkNgUF8YXGKZlMyFwxRNugdlroGRJBd214hjXMUtyoFSHBNv6f9iMvEEvrMAmLKH/8lFcXeYVkMo3yBIuw6zdQ4I7zXOrTX13fZFLSz656QMsejhRNCMcxOftuGOfDRjLSiwbngnoVkEJlEQOIt4bUDsDLLo0dP1wxMH1M2fcmxTOj/2ECPKcidZ6kOmHNlXgMStWktgLRZpM8fYsDGPHj9JgXmrcYz9uhnD4QU9zlM4PSRTT+nzMy9gJbYH9FCvYvp0toIW6LMAM6kJIL3fuHBtVZpa4Jv2nBZIln94fiEexspOjleNXZcbQY8rpwKni2Jd8KbUM7asq/bv2s/CWOw8SWrOO6dF9AHJZWT8vn8TH8W4J65K8VV39kwS3QIRQwicaIOYrl95xgX0qhAYtp50Zh6ASMW6mgoFuxpws7MNMT3j/uL31xJvp1c3NpkuDo0mZ3UMsN4shBdFiisjKnnrBCl/f2UeEUvwokHHy4csg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(23010399003)(18002099003)(13003099007)(6133799003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	EtKvrbxF4PjqzQaoT0vdGzjx5s/nMFa0yf4cpqmq+yM0+2tj1HoQDYcSkMX/+9/vbR2K9pXum6sY413C7+b5RrCdTMLg0kORSHvdWzFF2awIMC1cA40QRSszIzaBal9TxZXu7NdQk1EWAS0MZ+o6ZOZCF2ovJSGuh3stEi4nse1szcMpJVXUCW/Kc+uEY/ehtYJgCAiM/ijr07F/c8OoRYpSPHx9KZV6XiH+A21dSjjrQTrQJq3f8v31Q8E0T+yFTWv79Nfwo/vtU0QRPFj5V0wpbp/EDFxNkdetfh3Y46hXWOGI02hh6fxIYswB+myN4xuPUL80obdeRU5mZ3757TzEHyDMDVeE3QVJrm2xtSuLV5VGo+vr8HviBjuV+5fhLXuE5TdtfN6gF0eZAPZ7C3q42I+n/je2vhBgnvWIVeCwfIbW8HaKCxaZhGOuzxfd
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 12:59:46.7882
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5396e0c4-a487-49f0-d228-08def3ba97bb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9639

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
v3:
- nhi_reset_interface() takes struct tb_nhi.
- Rename the quirk to QUIRK_RESET_DMA_ON_TEARDOWN.
- Give the AMD NHI PCI device IDs symbolic names in nhi.h.
- Reset the host interface through nhi->ops->reset_interface.

v2: https://lore.kernel.org/all/20260805111811.517996-1-Basavaraj.Natikar@amd.com/
v1: https://lore.kernel.org/all/20260804122638.1623429-1-Basavaraj.Natikar@amd.com/

 drivers/thunderbolt/domain.c   | 28 +++++++++++++++++++++++++++-
 drivers/thunderbolt/nhi.c      | 26 ++++++++++++++++++++++++++
 drivers/thunderbolt/nhi.h      | 16 ++++++++++++++++
 drivers/thunderbolt/nhi_regs.h |  4 ++++
 drivers/thunderbolt/pci.c      | 23 +++++++++++++++++++++++
 5 files changed, 96 insertions(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/domain.c b/drivers/thunderbolt/domain.c
index 24611f05b3cd..62896930c93e 100644
--- a/drivers/thunderbolt/domain.c
+++ b/drivers/thunderbolt/domain.c
@@ -788,6 +788,23 @@ int tb_domain_approve_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
 			transmit_ring, receive_path, receive_ring);
 }
 
+static void tb_domain_reset_interface(struct tb *tb)
+{
+	struct tb_nhi *nhi = tb->nhi;
+
+	if (!nhi->ops->reset_interface)
+		return;
+
+	mutex_lock(&tb->lock);
+
+	/* The reset clears the ring state so stop the control channel */
+	tb_ctl_stop(tb->ctl);
+	nhi->ops->reset_interface(nhi);
+	tb_ctl_start(tb->ctl);
+
+	mutex_unlock(&tb->lock);
+}
+
 /**
  * tb_domain_disconnect_xdomain_paths() - Disable DMA paths for XDomain
  * @tb: Domain disabling the DMA paths
@@ -810,11 +827,20 @@ int tb_domain_disconnect_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
 				       int transmit_path, int transmit_ring,
 				       int receive_path, int receive_ring)
 {
+	int ret;
+
 	if (!tb->cm_ops->disconnect_xdomain_paths)
 		return -ENOTSUPP;
 
-	return tb->cm_ops->disconnect_xdomain_paths(tb, xd, transmit_path,
+	ret = tb->cm_ops->disconnect_xdomain_paths(tb, xd, transmit_path,
 			transmit_ring, receive_path, receive_ring);
+	if (ret)
+		return ret;
+
+	if (tb->nhi->quirks & QUIRK_RESET_DMA_ON_TEARDOWN)
+		tb_domain_reset_interface(tb);
+
+	return 0;
 }
 
 static int disconnect_xdomain(struct device *dev, void *data)
diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index 383a36212f70..76fb14221438 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -1160,6 +1160,32 @@ static void nhi_reset(struct tb_nhi *nhi)
 	dev_warn(nhi->dev, "timeout resetting host router\n");
 }
 
+/**
+ * nhi_reset_interface() - Reset the host interface
+ * @nhi: Host interface to reset
+ *
+ * Brings the registers in the memory BAR back to their default state and
+ * clears the End-to-End Flow Control state. The caller is responsible for
+ * stopping the control channel over the reset because it clears the ring
+ * state as well.
+ */
+void nhi_reset_interface(struct tb_nhi *nhi)
+{
+	u32 val;
+
+	val = ioread32(nhi->iobase + REG_CAPS);
+	/* Only v1 host interfaces implement the reset */
+	if (FIELD_GET(REG_CAPS_VERSION_MASK, val) >= REG_CAPS_VERSION_2)
+		return;
+
+	dev_dbg(nhi->dev, "issuing host interface reset\n");
+
+	iowrite32(REG_HOST_INTERFACE_RESET_RST,
+		  nhi->iobase + REG_HOST_INTERFACE_RESET);
+	/* Wait for tHIReset (10 ms) to complete */
+	usleep_range(10000, 20000);
+}
+
 static struct tb *nhi_select_cm(struct tb_nhi *nhi)
 {
 	struct tb *tb;
diff --git a/drivers/thunderbolt/nhi.h b/drivers/thunderbolt/nhi.h
index d488eadadfce..15bff76c66bc 100644
--- a/drivers/thunderbolt/nhi.h
+++ b/drivers/thunderbolt/nhi.h
@@ -36,6 +36,7 @@ irqreturn_t nhi_msi(int irq, void *data);
 irqreturn_t ring_msix(int irq, void *data);
 int nhi_probe(struct tb_nhi *nhi);
 void nhi_shutdown(struct tb_nhi *nhi);
+void nhi_reset_interface(struct tb_nhi *nhi);
 extern const struct dev_pm_ops nhi_pm_ops;
 
 /**
@@ -52,6 +53,7 @@ extern const struct dev_pm_ops nhi_pm_ops;
  * @release_ring_irq: NHI specific interrupt release hook
  * @is_present: Whether the device is currently present on the parent bus
  * @init_interrupts: NHI specific interrupt initialization hook
+ * @reset_interface: Resets the host interface
  */
 struct tb_nhi_ops {
 	int (*init)(struct tb_nhi *nhi);
@@ -66,6 +68,7 @@ struct tb_nhi_ops {
 	void (*release_ring_irq)(struct tb_ring *ring);
 	bool (*is_present)(struct tb_nhi *nhi);
 	int (*init_interrupts)(struct tb_nhi *nhi);
+	void (*reset_interface)(struct tb_nhi *nhi);
 };
 
 /*
@@ -116,11 +119,24 @@ struct tb_nhi_ops {
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
 #define QUIRK_AUTO_CLEAR_INT	BIT(0)
 #define QUIRK_E2E		BIT(1)
+#define QUIRK_RESET_DMA_ON_TEARDOWN	BIT(2)
 
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
index 8462ccb59b7e..99333729f3c2 100644
--- a/drivers/thunderbolt/pci.c
+++ b/drivers/thunderbolt/pci.c
@@ -62,6 +62,27 @@ static void nhi_pci_check_quirks(struct tb_nhi_pci *nhi_pci)
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
+			 * These AMD hosts may hang the Tx ring when the
+			 * DMA paths are torn down so they need the host
+			 * interface reset after each teardown.
+			 */
+			nhi->quirks |= QUIRK_RESET_DMA_ON_TEARDOWN;
+			break;
+		}
 	}
 }
 
@@ -258,6 +279,7 @@ static const struct tb_nhi_ops pci_nhi_default_ops = {
 	.shutdown = nhi_pci_release_irq,
 	.is_present = nhi_pci_is_present,
 	.init_interrupts = nhi_pci_init_msi,
+	.reset_interface = nhi_reset_interface,
 };
 
 /* Ice Lake specific NHI operations */
@@ -441,6 +463,7 @@ static const struct tb_nhi_ops icl_nhi_ops = {
 	.release_ring_irq = nhi_pci_ring_release_msix,
 	.is_present = nhi_pci_is_present,
 	.init_interrupts = nhi_pci_init_msi,
+	.reset_interface = nhi_reset_interface,
 };
 
 static int nhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
-- 
2.34.1

