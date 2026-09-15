Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010014.outbound.protection.outlook.com [52.101.56.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD1239E16B
	for <linux-usb@vger.kernel.org>; Tue, 15 Sep 2026 20:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789505214; cv=fail; b=Emtg2MMPY7Asb7eaXFA404w0XUzXHmvE+AhKFoDGGBtbrp8xBBVWPZ6pdwpyb9tFTaF1Qoo3du8PgAXLA2XGBWL2pBxmmyk+NHT+BR2Xat5sd1abC6CPBmLuK4aejd4Ef19ru23/fJ79sHnQkqIsByaqhNiQUMn851+07IHkU7Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789505214; c=relaxed/simple;
	bh=HKkY60st0f2te5GOZ2nzZyeLeBJHGuvdFgDqduKp2U4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HhmtUlYfxf0ZS5DoX094FEW1t8j9sTIuudkdenot3Off9qXFUbWxe2p1/zo4EJCCIqeMt1Ifj3s5jO6pEM8Wd8Lkf6qZvTSnFuyUYW0D1Mi/0Bizcv5LOW+D9fuWTfXtfN7DyYuLpThlcw7EvoYgHy5033kJ+R1TgJe/rPxQ3D4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ZQWY3+vL; arc=fail smtp.client-ip=52.101.56.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ZQWY3+vL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wAT5QjVuatxmW/ZJgeOmXkn5bpP/zpgH7LCvakEGikN/mGZMNovrVbNQr7+M8Wqu3pRN34c0Ga3wMnuE5L4iQnHmtuoA2mdRxcs8qYsv9C2QGqS/n0gznnIleHnZV+fFTjc+C8zS4tg0LgyYr7AsHro2o2TZIa3GdXs75t2qInjaBnJUifSB0wASwDpVCE7r+uXdLzBYC/vh8ZxXBQHR1ymy6FKAGvkgNfdoSlWEnG3Xc++BssQqLk/3dzmerj/PpU7F1vyFTXNmj29xSTRaUx4qfwz9nNGklZKOugY7JbaEMsuqtqMHYeHhzJs1uhVCb2altN9OpQSgolGnPCBbxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=juKZO7r29WY+4IS7ZccynNE+jAidaZ0efo2DOhafxQI=;
 b=cUsRIrHBCuFDDCAVkMf9OeIJnd0PIB8167fdxnhN+YFqHFUQIbhdKg42NZrZzmBa4DreEH9OSRs6K4qoDu719j4DKbyb6VgcOBrhmwS33a8Lvb4Fmlrg6tdz9dMWtCn9GcLSkoDLsMKABg5sxIB4VHyB+9fxj8uIDmwbVCdMyEjC0co0jS4KCq5pv46VnADdFrl4swcKw5jWIFTL7Scu9/269OExA67NmqTODeOIeNVQuu8pRt6RdjXxCq2rWulMv3gsPWy3DuwoiWdcfcBkTR7y6q0IBnUemfkzfuBo5226+f+2vyvd9Nhtr69/aoEUUkg3zwxpmsihaz+5obaxRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=juKZO7r29WY+4IS7ZccynNE+jAidaZ0efo2DOhafxQI=;
 b=ZQWY3+vLO2eq4Fcnv27PYW3OdP2vJ2XzKLHfG0hUgtnE/WyZDcPQ03PUgL84aKEuYKQbsNVS6v8GQoWp18W3Mnu+PhqJzFe51xU5jSEqohYWV0IyfgIyhxXTnfQX9pSPZ8SFk7fppdiCGQj+kC+77Hpyb4t5iF1TZmI/P1vQNUw=
Received: from CH0P221CA0040.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11d::20)
 by LV2PR12MB5992.namprd12.prod.outlook.com (2603:10b6:408:14e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 20:46:39 +0000
Received: from BN2PEPF0000A802.namprd02.prod.outlook.com
 (2603:10b6:610:11d:cafe::46) by CH0P221CA0040.outlook.office365.com
 (2603:10b6:610:11d::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Tue,
 15 Sep 2026 20:46:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF0000A802.mail.protection.outlook.com (10.167.245.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Tue, 15 Sep 2026 20:46:39 +0000
Received: from aus0006770c4n-lx01.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 15 Sep 2026 15:46:38 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: <andreas.noever@gmail.com>, <westeri@kernel.org>, <YehezkelShB@gmail.com>
CC: Mario Limonciello <mario.limonciello@amd.com>, <juan.martinez@amd.com>,
	Sanath S <Sanath.S@amd.com>, Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	<linux-usb@vger.kernel.org>
Subject: [PATCH] Revert "thunderbolt: Add quirk to reset host interface on DMA path teardown for AMD USB4 routers"
Date: Tue, 15 Sep 2026 15:46:23 -0500
Message-ID: <20260915204625.2239505-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A802:EE_|LV2PR12MB5992:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c276fb9-073a-4e7c-15f2-08df136a7121
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|23010399003|36860700016|10067099003|56012099006|11063799006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	kjxHRA5TuaZLuxzst7Is8eBVIsJOV3f9cbG07TsBx4VhzosAqTngBRE0rfqwQKKq0r7ELUjqC/c/xkgKflvdibpu9D4tZEzvc6+q8vnNBjZafiLHdL+rfXBVDT6ieUwAWUf3VwhCyOCubnaL0knyQytwcOgy7gX9xljPduRUj6aOrPbXtqC9d7J55yzeOXxx4G5xNTWczSjjyIJ1yeCP9nwiONH+SPn2yxcKLrulD3w7RRLvyQhfNHC0g0C5zEHtJUWki/QIxtV5wMStdmpbWKJ4wkTcQmqgwCIzRnF5ulutUEDhC/vqgx3bQVtmvg46GLvIqpsHIMrADk9dFlqAItyuTCzENxXMnvlN9h+cPZGr0oQjVli/F6qJLQ1lHMELllhOJzGR97oF4Q7X1neoyEkP+4zADqVPxUQVUQPhf6iB+jbKw3H4qqtaCZdsQeyrRKIeiW5xCoxAFQoTgzaiaxXLykH+ESmT9l//5fpnJ/m87c2Af3kHKj5kw2x2YUlOItsECI+1JoWfsGR+zcZO7f74889mR1WDX8doq69UnAFrqoeEaZ2h7+njpCE+vA+XAMSRxMQuPkwjpbEBLsw0941yGfOCzOFFB0f7+7CFeJkkcVn7g2klkVCIgiJj/JCOJZkN8NJ/I1Xn2Ar8EmSjV24SWsFkaB3G1koDGiP0CHtPYPuVuXriJuyLpmsBs95f8JTQ0CL1412X8nloTeJ8kg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(23010399003)(36860700016)(10067099003)(56012099006)(11063799006)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZjGAqBLp3oYtoRvJkBPdzukUDjDNX1h0eWr2BuBrza+XGfcSLxa+EwiX7tUM/CKnWSqI9No5WJ2YSr2Cn8UtraitXlz9gfQAvwAs9burv+4J99G21dEtFgXPEs7YkW69GfA2WeaCHayNxIMqUBScBxLFRklyztj6eMCZ8r6BDddN8A4p4+2lyT/W4Z6MjrChEESmxIV2X9L0iI8N9DFXwScv8CFQzZOC1Vhjck/Q3qnmHmcsUftgZ7IBkpzax+UYQdrzk6YPTZiXnvjGTCC51dyGEX+dgp4jJg1kx08eI2nZNa7LfCb/ejW/h4t8ocj5t7UXOQWpFs3h0PmVwm8VVi12aIbklTztL5jHcRMnOv3xEUX3fCrqWgtaw5sEA/DNp7kSs9hof2QQ/HZsyg+rBnv3LfSKvZHfYmwLz9+2BMtV5Uwt0hsEe0uzAmY4A4yM
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 20:46:39.4907
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c276fb9-073a-4e7c-15f2-08df136a7121
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000A802.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5992

This commit has caused a deadlock at shutdown. A proper fix with
another approach will be coming later.  Revert commit
f1de1fc5f632cdeae1f5c2984572ab710d4dfcaa for now.

Reported-by: juan.martinez@amd.com
Closes: https://lore.kernel.org/linux-usb/20260825214237.4179813-1-juan.martinez@amd.com/
Cc: Sanath S <Sanath.S@amd.com>
Cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/thunderbolt/domain.c   | 26 +-------------------------
 drivers/thunderbolt/nhi.c      | 26 --------------------------
 drivers/thunderbolt/nhi.h      | 21 ++-------------------
 drivers/thunderbolt/nhi_regs.h |  4 ----
 drivers/thunderbolt/pci.c      | 23 -----------------------
 5 files changed, 3 insertions(+), 97 deletions(-)

diff --git a/drivers/thunderbolt/domain.c b/drivers/thunderbolt/domain.c
index 12c88509a54fa..24611f05b3cda 100644
--- a/drivers/thunderbolt/domain.c
+++ b/drivers/thunderbolt/domain.c
@@ -788,21 +788,6 @@ int tb_domain_approve_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
 			transmit_ring, receive_path, receive_ring);
 }
 
-static void tb_domain_reset_interface(struct tb *tb)
-{
-	struct tb_nhi *nhi = tb->nhi;
-
-	if (!nhi->ops->reset_interface)
-		return;
-
-	guard(mutex)(&tb->lock);
-
-	/* The reset clears the ring state so stop the control channel */
-	tb_ctl_stop(tb->ctl);
-	nhi->ops->reset_interface(nhi);
-	tb_ctl_start(tb->ctl);
-}
-
 /**
  * tb_domain_disconnect_xdomain_paths() - Disable DMA paths for XDomain
  * @tb: Domain disabling the DMA paths
@@ -825,20 +810,11 @@ int tb_domain_disconnect_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
 				       int transmit_path, int transmit_ring,
 				       int receive_path, int receive_ring)
 {
-	int ret;
-
 	if (!tb->cm_ops->disconnect_xdomain_paths)
 		return -ENOTSUPP;
 
-	ret = tb->cm_ops->disconnect_xdomain_paths(tb, xd, transmit_path,
+	return tb->cm_ops->disconnect_xdomain_paths(tb, xd, transmit_path,
 			transmit_ring, receive_path, receive_ring);
-	if (ret)
-		return ret;
-
-	if (tb->nhi->quirks & QUIRK_RESET_DMA_ON_TEARDOWN)
-		tb_domain_reset_interface(tb);
-
-	return 0;
 }
 
 static int disconnect_xdomain(struct device *dev, void *data)
diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index 5809809f64d42..b7c1c826f0f5c 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -1175,32 +1175,6 @@ static void nhi_reset(struct tb_nhi *nhi)
 	dev_warn(nhi->dev, "timeout resetting host router\n");
 }
 
-/**
- * nhi_reset_interface() - Reset the host interface
- * @nhi: Host interface to reset
- *
- * Brings the registers in the memory BAR back to their default state and
- * clears the End-to-End Flow Control state. The caller is responsible for
- * stopping the control channel over the reset because it clears the ring
- * state as well.
- */
-void nhi_reset_interface(struct tb_nhi *nhi)
-{
-	u32 val;
-
-	val = ioread32(nhi->iobase + REG_CAPS);
-	/* Only v1 host interfaces implement the reset */
-	if (FIELD_GET(REG_CAPS_VERSION_MASK, val) >= REG_CAPS_VERSION_2)
-		return;
-
-	dev_dbg(nhi->dev, "issuing host interface reset\n");
-
-	iowrite32(REG_HOST_INTERFACE_RESET_RST,
-		  nhi->iobase + REG_HOST_INTERFACE_RESET);
-	/* Wait for tHIReset (10 ms) to complete */
-	usleep_range(10000, 20000);
-}
-
 static struct tb *nhi_select_cm(struct tb_nhi *nhi)
 {
 	struct tb *tb;
diff --git a/drivers/thunderbolt/nhi.h b/drivers/thunderbolt/nhi.h
index f72d6b2745018..d488eadadfcee 100644
--- a/drivers/thunderbolt/nhi.h
+++ b/drivers/thunderbolt/nhi.h
@@ -36,8 +36,6 @@ irqreturn_t nhi_msi(int irq, void *data);
 irqreturn_t ring_msix(int irq, void *data);
 int nhi_probe(struct tb_nhi *nhi);
 void nhi_shutdown(struct tb_nhi *nhi);
-void nhi_reset_interface(struct tb_nhi *nhi);
-
 extern const struct dev_pm_ops nhi_pm_ops;
 
 /**
@@ -54,7 +52,6 @@ extern const struct dev_pm_ops nhi_pm_ops;
  * @release_ring_irq: NHI specific interrupt release hook
  * @is_present: Whether the device is currently present on the parent bus
  * @init_interrupts: NHI specific interrupt initialization hook
- * @reset_interface: Resets the host interface
  */
 struct tb_nhi_ops {
 	int (*init)(struct tb_nhi *nhi);
@@ -69,7 +66,6 @@ struct tb_nhi_ops {
 	void (*release_ring_irq)(struct tb_ring *ring);
 	bool (*is_present)(struct tb_nhi *nhi);
 	int (*init_interrupts)(struct tb_nhi *nhi);
-	void (*reset_interface)(struct tb_nhi *nhi);
 };
 
 /*
@@ -120,24 +116,11 @@ struct tb_nhi_ops {
 #define PCI_DEVICE_ID_INTEL_PTL_P_NHI0			0xe433
 #define PCI_DEVICE_ID_INTEL_PTL_P_NHI1			0xe434
 
-#define PCI_DEVICE_ID_AMD_1AH_M60H_NHI0			0x1120
-#define PCI_DEVICE_ID_AMD_1AH_M60H_NHI1			0x1121
-#define PCI_DEVICE_ID_AMD_1AH_M68H_NHI0			0x113b
-#define PCI_DEVICE_ID_AMD_1AH_M68H_NHI1			0x113c
-#define PCI_DEVICE_ID_AMD_1AH_M80H_NHI0			0x1155
-#define PCI_DEVICE_ID_AMD_1AH_M80H_NHI1			0x1158
-#define PCI_DEVICE_ID_AMD_1AH_M80H_NHI2			0x1159
-#define PCI_DEVICE_ID_AMD_1AH_M24H_NHI0			0x151c
-#define PCI_DEVICE_ID_AMD_1AH_M24H_NHI1			0x151d
-#define PCI_DEVICE_ID_AMD_1AH_M70H_NHI0			0x158d
-#define PCI_DEVICE_ID_AMD_1AH_M70H_NHI1			0x158e
-
 #define PCI_CLASS_SERIAL_USB_USB4			0x0c0340
 
 /* Host interface quirks */
-#define QUIRK_AUTO_CLEAR_INT				BIT(0)
-#define QUIRK_E2E					BIT(1)
-#define QUIRK_RESET_DMA_ON_TEARDOWN			BIT(2)
+#define QUIRK_AUTO_CLEAR_INT	BIT(0)
+#define QUIRK_E2E		BIT(1)
 
 /*
  * Minimal number of vectors when we use MSI-X. Two for control channel
diff --git a/drivers/thunderbolt/nhi_regs.h b/drivers/thunderbolt/nhi_regs.h
index 99df60b6db36a..d6a197fabc74a 100644
--- a/drivers/thunderbolt/nhi_regs.h
+++ b/drivers/thunderbolt/nhi_regs.h
@@ -115,10 +115,6 @@ struct ring_desc {
 #define REG_CAPS_VERSION_MASK		GENMASK(23, 16)
 #define REG_CAPS_VERSION_2		0x40
 
-/* Host Interface Reset - resets TX/RX rings and E2E flow control counters */
-#define REG_HOST_INTERFACE_RESET	0x39858
-#define REG_HOST_INTERFACE_RESET_RST	BIT(0)
-
 #define REG_DMA_MISC			0x39864
 #define REG_DMA_MISC_INT_AUTO_CLEAR     BIT(2)
 #define REG_DMA_MISC_DISABLE_AUTO_CLEAR	BIT(17)
diff --git a/drivers/thunderbolt/pci.c b/drivers/thunderbolt/pci.c
index 99333729f3c2a..8462ccb59b7e2 100644
--- a/drivers/thunderbolt/pci.c
+++ b/drivers/thunderbolt/pci.c
@@ -62,27 +62,6 @@ static void nhi_pci_check_quirks(struct tb_nhi_pci *nhi_pci)
 			nhi->quirks |= QUIRK_E2E;
 			break;
 		}
-	} else if (pdev->vendor == PCI_VENDOR_ID_AMD) {
-		switch (pdev->device) {
-		case PCI_DEVICE_ID_AMD_1AH_M60H_NHI0:
-		case PCI_DEVICE_ID_AMD_1AH_M60H_NHI1:
-		case PCI_DEVICE_ID_AMD_1AH_M68H_NHI0:
-		case PCI_DEVICE_ID_AMD_1AH_M68H_NHI1:
-		case PCI_DEVICE_ID_AMD_1AH_M80H_NHI0:
-		case PCI_DEVICE_ID_AMD_1AH_M80H_NHI1:
-		case PCI_DEVICE_ID_AMD_1AH_M80H_NHI2:
-		case PCI_DEVICE_ID_AMD_1AH_M24H_NHI0:
-		case PCI_DEVICE_ID_AMD_1AH_M24H_NHI1:
-		case PCI_DEVICE_ID_AMD_1AH_M70H_NHI0:
-		case PCI_DEVICE_ID_AMD_1AH_M70H_NHI1:
-			/*
-			 * These AMD hosts may hang the Tx ring when the
-			 * DMA paths are torn down so they need the host
-			 * interface reset after each teardown.
-			 */
-			nhi->quirks |= QUIRK_RESET_DMA_ON_TEARDOWN;
-			break;
-		}
 	}
 }
 
@@ -279,7 +258,6 @@ static const struct tb_nhi_ops pci_nhi_default_ops = {
 	.shutdown = nhi_pci_release_irq,
 	.is_present = nhi_pci_is_present,
 	.init_interrupts = nhi_pci_init_msi,
-	.reset_interface = nhi_reset_interface,
 };
 
 /* Ice Lake specific NHI operations */
@@ -463,7 +441,6 @@ static const struct tb_nhi_ops icl_nhi_ops = {
 	.release_ring_irq = nhi_pci_ring_release_msix,
 	.is_present = nhi_pci_is_present,
 	.init_interrupts = nhi_pci_init_msi,
-	.reset_interface = nhi_reset_interface,
 };
 
 static int nhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
-- 
2.43.0

