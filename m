Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011018.outbound.protection.outlook.com [40.93.194.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D7825333F
	for <linux-usb@vger.kernel.org>; Wed, 10 Jun 2026 08:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781081439; cv=fail; b=p6HT/aUFwsyfLZlH/QgNyAY26oxWTxd6X8Ad/XY8HRAJOTxFD04GHW0y3hYY/k3QrE0pNiJ90rtBKXLoAqXl7AGzjc8lA8OaLH8C3NWu/yXd18rQhL/hJlso86pmrW+pUGxKVFsMStL9tR/Iefd665i/wsTaQdoL9YRDQm1yK0E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781081439; c=relaxed/simple;
	bh=2+Q3X5126YbFqZij9uaao+OhW2NsDAZJvqvcpac5/aI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DA9KAuZ26vVBdVEYjWWo4ndaTe2b42wh2iuen4cdh94jOCXSp3NzkrOP6I8RZ/L9I4KuRVFW97/nVhXvQ1krRzXBm+pOIUSJ5J8WCHjOv0VCh+MikxEJDeUSJRVBXD0PQoz++Wy76lvHKO++PRzeOCGWyELz/9X22E3AXjH0c50=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=IVn9lyD+; arc=fail smtp.client-ip=40.93.194.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="IVn9lyD+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MiAq0SZn4AcpAwyEHUJ9tCQxWcItEcUAe4ROiM3OibHyD3ioGS0pINHBBGQYowj4GeMQVHeVrbn2zb6qwkVqmxo1WvuF9wp3B3OrYKEy664KgCOYuqJkLlRVMcW1MyuMikFKiG96n9WSJnsyPkrqJnYaadO+L1NCCkwC9t2VGx+fEPP4eEAIh1VxDRObqLP0wq78btAfpEm6eTlzhKyUn3xMXF6WJYX86OJoT/eAuWODApstnXskPzqG/vrib7WaQKvnySC7rmHvgC4xJKjRJSVPsfask7XS0vBKXrLRqCpYO8j3hgHo/gZok2FRB+TWwaM0MMgl4Z/xGr6K5X0VeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ayv+JoNfsQjItxbB2nnZ8vrOiI92jkqrTVzi8Pr59nw=;
 b=VAh43Ix/xUPTcjDGsHqZHfujxhooKl8GZXUXpriExQHj9BFRmZvHRNSyg67Z8dafKqjwWr4DDCTV4P2KXA2TGv1X38hU2ZYPMAKWbYoehf9lOnJfdIG4d/JUHLfbKADegPvqk3s39RCvLl6i4O766q9pY/WZkQ/ekO7o0UFJEknOZglCakoOdXswjX3kanQhChtXLGPnx7/ZMLTRomxro7j9QXk84aQhgE74lQ2NERtzxASYobNQoKAs0mrp9il/l3en/4nuLvUrdaug8w8eIHC9yov3vdsJJF1VBjBy9L9VSb1DOBQ8vvqPDWuUEr4I6mldnhpC78QgDM0CFx3Nsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ayv+JoNfsQjItxbB2nnZ8vrOiI92jkqrTVzi8Pr59nw=;
 b=IVn9lyD+5UMxsBrlBL40NWXiIkHxgZvym1/sYL8EWROOu0zm3azx3dU5itKlnfiCwZDaMQT9ozXCTLJi/A6JJIGfWzIgj2vhgXyIaZkRUJ6AXxpn2RttSw2EhENCI58hE0RmPlJJrXvPEI4SPZapTqRk4VQMpDv2I+H1SgHMMCE=
Received: from MW4PR04CA0322.namprd04.prod.outlook.com (2603:10b6:303:82::27)
 by DS4PR12MB9610.namprd12.prod.outlook.com (2603:10b6:8:277::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Wed, 10 Jun
 2026 08:50:33 +0000
Received: from MWH0EPF000C618A.namprd02.prod.outlook.com
 (2603:10b6:303:82:cafe::2e) by MW4PR04CA0322.outlook.office365.com
 (2603:10b6:303:82::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.11 via Frontend Transport; Wed,
 10 Jun 2026 08:50:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000C618A.mail.protection.outlook.com (10.167.249.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Wed, 10 Jun 2026 08:50:33 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 10 Jun
 2026 03:50:30 -0500
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: <andreas.noever@gmail.com>, <westeri@kernel.org>, <YehezkelShB@gmail.com>,
	<linux-usb@vger.kernel.org>
CC: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Mario Limonciello
	<superm1@kernel.org>, Sanath S <Sanath.S@amd.com>
Subject: [PATCH v3] thunderbolt: Assert downstream port reset on shutdown
Date: Wed, 10 Jun 2026 14:20:06 +0530
Message-ID: <20260610085006.3735139-1-Basavaraj.Natikar@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C618A:EE_|DS4PR12MB9610:EE_
X-MS-Office365-Filtering-Correlation-Id: 711d41dd-6d49-48ff-6225-08dec6cd5516
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|36860700016|376014|82310400026|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	3y3IsYe42U/Ds6k8ocOckMoo2wgy/ClIA3rm8soSVCSl6xj+FktQg1Ucvp8L5CagjIiRWtlmr/jeCZNr2tVSra4Syoho0+SQeZXc8v2xB6+AvH+wmw+QiQm+7D7MAUxbPmt5c5nxmQFj14f3w4wCc3NdulRPA2u8zx+dUjKVVEpx/vuoW0dAsf8o0CN2edTdI5CJz9GVmtrRg8eFP7BnOxfO79lQ0FT6N5VVmTvIn9Pyx4EI5igs5KGkpnDBQQhuKDQ9Xh72bnxfv/eKk4db+Q4a7c1zMw+/SCWHrL9EHH7wHHjtB/lZIpjvm37VCLqOCxOxlb0byQTLW6I5WOgQz/rbF7j1p0ym2XUB7iWsnrChg02lQDM2iHfhc9LjuTvDAy4nvF7FuMlT7mSmngvNJx9ZQZJ6uSeBX2Yp/A2PfCx0G5D0zvXwGwpz1362y9ejrrHvYd/LEYTKeHDZLt268A4YOfL2cimQZRGrBirxJEL3o0qZr5Q6KSuqZmX4Bx/tKNMuBsHdBSe4l6k0AJuDtis+TREo7AYMY5dl/8pIkAFlRHEldMCfV4vgyLF/qUOuJ3eJBRio7eg7/m1fPiJ7gzI/0ijLDTVOmMek1l53eLmhlItgUhTePxtOo4X8fVHtwnNXGawByg+l939Gz2qJGioq6B+mqPJ2OeljjJH1scfb0GjiseZxLDLMlnrCbu3gW/kepaRw5joblQ7B3LUNoProDomtle3+h+IUIglfHHk=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(36860700016)(376014)(82310400026)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	r+ZNMYYhXWzEMSiJlbUvaDxSNSi3qYSys8x4TzSITB5MEeVIB2/OnozHW/Dil6lpDgRV6vboW7QgWzU+SIliQ3acY6SQZ0XjMHm2lHxou/csGDWOXObDAdOo64wEaR9enc3uZQHVDtq6TBzrgRr1Txkss2j0qAw5ao72SEbAOdtcSw12w1ShM8yOiVMXR9EtrCkFFUB9uPRfkAaxkGzc7C91bgCajeyw/iJSn9rEAPUp53Nt3KT/sYfuWArMIdb3OtmP2SY/nJC12qc2DWQoNkfEtGEntWewueQ6rEOXT0r7/h2QTfeOJohEGfUkzm033FxMz0XErSiLz0Sr1lXtTY61JpZ3tALLkLd4ZgNG7WGQSI7AH30vIP0aXSMigMzjDNN/wf235XYtQ0UouyPeTImD/ZG4h8CLPl4UkZ3m0gFyUfZsg4aNGKWvrj6VEtb0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 08:50:33.0484
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 711d41dd-6d49-48ff-6225-08dec6cd5516
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C618A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9610

On shutdown the connection manager tears down the router tree without
signalling connected devices. A Thunderbolt 3 device directly connected
to a USB4 host never receives a disconnect indication and during shutdown
this can cause polling the dead link for up to 60 seconds. On some
platforms this behavior leads to a warm reset instead of a shutdown due
to this timeout.

Fix this by asserting PORT_CS_19.DPR on each connected downstream port
before tearing down the router tree. This drives SBTX low (USB4 spec
section 6.9), causing the device to detect SBRX low and transition to
Uninitialized Unplugged state immediately.

Always do this on system shutdown/reboot by forcing host_reset in the
PCI ->shutdown callback. On plain driver unload only do it when the host
router was actually reset on load (host_reset=1), since in that case the
tunnels are not preserved across reload anyway; with host_reset=0 the
tunnels are kept alive across unload/reload so the links are left intact.
Restrict the reset to Thunderbolt 3 devices.

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Co-developed-by: Sanath S <Sanath.S@amd.com>
Signed-off-by: Sanath S <Sanath.S@amd.com>
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
v3:
 - Rebase on top of the thunderbolt next branch; the PCI ->shutdown hook
   now lives in drivers/thunderbolt/pci.c (nhi_pci_driver_shutdown()).
 - Add kernel-doc for tb_port_reset() now that it is exported.
 - Move the host_reset flag into struct tb_nhi instead of struct tb, and
   set it from nhi_probe() instead of tb_domain_add().
 - Spell out "Thunderbolt 3" instead of "TBT3" in the kernel-doc.
 - Reword the debug message to "downstream port reset failed, continuing".

v2:
 - Add Reviewed-by tag from Mario Limonciello.
 - Restrict the DPR assertion to Thunderbolt 3 devices, since the issue
   only affects Thunderbolt 3 devices.
 - Only assert DPR on system shutdown/reboot (the PCI ->shutdown callback
   forces host_reset) or when the host router was actually reset on load.
 - Reword comments and commit message to refer to the "router tree"
   instead of the "switch tree".
---
 drivers/thunderbolt/nhi.c    |  2 ++
 drivers/thunderbolt/pci.c    | 16 +++++++++++++++-
 drivers/thunderbolt/switch.c | 11 ++++++++++-
 drivers/thunderbolt/tb.c     | 21 +++++++++++++++++++++
 drivers/thunderbolt/tb.h     |  1 +
 include/linux/thunderbolt.h  |  6 ++++++
 6 files changed, 55 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index 0f795ea58756..698fb124d529 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -1235,6 +1235,8 @@ int nhi_probe(struct tb_nhi *nhi)
 
 	init_completion(&nhi->domain_released);
 
+	nhi->host_reset = host_reset;
+
 	res = tb_domain_add(tb, host_reset);
 	if (res) {
 		/*
diff --git a/drivers/thunderbolt/pci.c b/drivers/thunderbolt/pci.c
index bbd186c29ef7..be63a4647b59 100644
--- a/drivers/thunderbolt/pci.c
+++ b/drivers/thunderbolt/pci.c
@@ -493,6 +493,20 @@ static void nhi_pci_remove(struct pci_dev *pdev)
 	nhi_shutdown(nhi);
 }
 
+static void nhi_pci_driver_shutdown(struct pci_dev *pdev)
+{
+	struct tb *tb = pci_get_drvdata(pdev);
+	struct tb_nhi *nhi = tb->nhi;
+
+	/*
+	 * Force host_reset so the connection manager asserts DPR and signals
+	 * disconnect to connected devices before the router tree is removed.
+	 * Only Thunderbolt 3 devices are reset.
+	 */
+	nhi->host_reset = true;
+	nhi_pci_remove(pdev);
+}
+
 static struct pci_device_id nhi_ids[] = {
 	/*
 	 * We have to specify class, the TB bridges use the same device and
@@ -593,7 +607,7 @@ static struct pci_driver nhi_driver = {
 	.id_table = nhi_ids,
 	.probe = nhi_pci_probe,
 	.remove = nhi_pci_remove,
-	.shutdown = nhi_pci_remove,
+	.shutdown = nhi_pci_driver_shutdown,
 	.driver.pm = &nhi_pm_ops,
 };
 
diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index a830c82bb905..404c0693df50 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -682,7 +682,16 @@ int tb_port_disable(struct tb_port *port)
 	return __tb_port_enable(port, false);
 }
 
-static int tb_port_reset(struct tb_port *port)
+/**
+ * tb_port_reset() - Reset the port
+ * @port: Port to reset
+ *
+ * Resets @port. For USB4 ports this issues a USB4 port reset and for
+ * legacy ports the link controller port is reset.
+ *
+ * Return: %0 on success, negative errno otherwise.
+ */
+int tb_port_reset(struct tb_port *port)
 {
 	if (tb_switch_is_usb4(port->sw))
 		return port->cap_usb4 ? usb4_port_reset(port) : 0;
diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 76323255439a..b7cc6894a598 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -2941,7 +2941,9 @@ static void tb_handle_event(struct tb *tb, enum tb_cfg_pkg_type type,
 static void tb_stop(struct tb *tb)
 {
 	struct tb_cm *tcm = tb_priv(tb);
+	struct tb_nhi *nhi = tb->nhi;
 	struct tb_tunnel *tunnel;
+	struct tb_port *port;
 	struct tb_tunnel *n;
 
 	cancel_delayed_work(&tcm->remove_work);
@@ -2956,6 +2958,25 @@ static void tb_stop(struct tb *tb)
 			tb_tunnel_deactivate(tunnel);
 		tb_tunnel_put(tunnel);
 	}
+	/*
+	 * Signal disconnect to connected devices before the router tree is
+	 * removed below. A Thunderbolt 3 device directly connected to a USB4
+	 * host otherwise never receives a disconnect indication, leaving
+	 * firmware to poll the dead link for up to ~60 s which on some
+	 * platforms turns the shutdown into a warm reset. Asserting
+	 * PORT_CS_19.DPR drives SBTX low (USB4 spec section 6.9) so the device
+	 * detects SBRX low and goes to Uninitialized Unplugged immediately.
+	 */
+	if (nhi->host_reset) {
+		tb_switch_for_each_port(tb->root_switch, port) {
+			if (!tb_port_is_null(port) || !tb_port_has_remote(port))
+				continue;
+			if (tb_switch_is_usb4(port->remote->sw))
+				continue;
+			if (tb_port_reset(port))
+				tb_port_dbg(port, "downstream port reset failed, continuing\n");
+		}
+	}
 	tb_switch_remove(tb->root_switch);
 	tb->root_switch = NULL;
 	tcm->hotplug_active = false; /* signal tb_handle_hotplug to quit */
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index ec9192b61bc0..4373336d9425 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -1103,6 +1103,7 @@ int tb_port_clear_counter(struct tb_port *port, int counter);
 int tb_port_unlock(struct tb_port *port);
 int tb_port_enable(struct tb_port *port);
 int tb_port_disable(struct tb_port *port);
+int tb_port_reset(struct tb_port *port);
 int tb_port_alloc_in_hopid(struct tb_port *port, int hopid, int max_hopid);
 void tb_port_release_in_hopid(struct tb_port *port, int hopid);
 int tb_port_alloc_out_hopid(struct tb_port *port, int hopid, int max_hopid);
diff --git a/include/linux/thunderbolt.h b/include/linux/thunderbolt.h
index feb1af175cfd..cb1621c6b703 100644
--- a/include/linux/thunderbolt.h
+++ b/include/linux/thunderbolt.h
@@ -514,6 +514,11 @@ void tb_service_properties_changed(struct tb_service *svc);
  * @hop_count: Number of rings (end point hops) supported by NHI.
  * @quirks: NHI specific quirks if any
  * @domain_released: Completed when domain has been fully released
+ * @host_reset: Host router was reset on driver load, or forced on system
+ *		shutdown/reboot. When set, tb_stop() asserts DPR on connected
+ *		downstream ports to signal disconnect before tearing down the
+ *		router tree. Only Thunderbolt 3 devices are reset; USB4
+ *		routers are skipped.
  */
 struct tb_nhi {
 	spinlock_t lock;
@@ -528,6 +533,7 @@ struct tb_nhi {
 	u32 hop_count;
 	unsigned long quirks;
 	struct completion domain_released;
+	bool host_reset;
 };
 
 /**
-- 
2.34.1
