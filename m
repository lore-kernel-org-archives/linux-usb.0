Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012068.outbound.protection.outlook.com [40.93.195.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285E03F54A4
	for <linux-usb@vger.kernel.org>; Tue,  9 Jun 2026 10:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781001773; cv=fail; b=I9K6jcSpe7kX5Oo2G7gGnT91spiEXe3hJGw4BFHoT9zXWtr69cyaEnuGLP6HCdeOisYXgCBw0sKeDSpxDm5d+I6AKOTVcPz8rAvtYKNaL+dZCSW8RoBM1rupdCTlGS0jrAWd4JfSYyj+gpxv/+3BZ8zPHoCGbehlo/CE/KKDe9Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781001773; c=relaxed/simple;
	bh=cJXmg57C2xUy/aH8pwEu4l3lc5QClu0h5YSHvBXdqtk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FeVu9jrv+YjvyZSVhAkkXwq920GoqjQhD+8NpO8BSRyOFEldtDiz2TLMYHm9iqFQ6QptblT7L4LqPcrB6ZY/WFU6pBEuMj4U5lAquZUO1dw1hGYHOtkoXRIYna4kdnKlFRGfxy+cYjPLrdwKQDTdy3RFB8rSKfNwylVuikWpZKU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=but5Tevz; arc=fail smtp.client-ip=40.93.195.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="but5Tevz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AVv51FOGLu4SDdKcBjYfzf8jHaabSNQEeAx0rpTmU/3tZR7ENXknyvl/8oP+SpfFH7hAnP92W0nCHtgez6Fz7CheZ8DpiMWBOtB3FxW++5RMwHtkfzY4BZOZ9YEyEEHSvl1G7cQBuNkXPL1q/Wtz5l5ePiXTp1zcZ1NHhkDVZSH/krWcpaC1a0pWcjl/qcYJ3WYK4V9SMOrHbNYB7+JkmnrQJ9tKdKn8gcmGKAOS7I2qaUQIFQGDDXkoAKGuRT79mgzHrvhBxMwPcKQXVC7++y0SwN2BM03ab6h4n83V2o5KYPIS1rGmY+2QyG7hWVKBPXRCyiVhRCs3jhAN4R9Oeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=78w68STTy99CetCu8bp9+MB+RL7YLdttXx5VKj38dkw=;
 b=ndcOfPM7G4Tl9BYJtnWKHsWPm4ScOEs8YL/BvxnJDIw5RJEHzvNDZjI5d7VBBgmcgqFpGS5B3YXyIG+TCTiXYUw/nZ22Z36r+JfKRGL3Ehb29aZyb6c5F6dYftgcEYVWpLufpGR7DqWsKppnu7jwAhhVIZcDLQJ0wq8jei+0wps65ul1o7aFSdN6Ln/Rj88Qh/5JgdtgXeXOh27kSO3fDtal8y4us3oRdc1dctjaJZjOBes7CtiWi8cBmLdia1a7fygIBso1sQ0E4wF5Q2E0BgLzLqE8r5loS4ZdE3iKE/70QCQeLtBxP0f7kQoBEP7Cf42vys72qpy0oUbuow/ixA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com;
 dmarc=temperror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=78w68STTy99CetCu8bp9+MB+RL7YLdttXx5VKj38dkw=;
 b=but5TevzYrcxR6jj3UPuDoAiEUEmgLAGY14cL9l/Mo0DDvxTf0L5jcPtRIWIVabFFsRq+PUDY9s7T4CwLmoelTe9zo9p6KKWX/Jsn6tXsfYMY8Xx9IpiCnQZQC8YkzP1jRKcHChEGcNapkroqx4/hmWoVBvKfXr+VfYp+hILXKg=
Received: from PH8P221CA0003.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:2d8::31)
 by PH0PR12MB7471.namprd12.prod.outlook.com (2603:10b6:510:1e9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.11; Tue, 9 Jun 2026
 10:42:45 +0000
Received: from CY4PEPF0000FCC3.namprd03.prod.outlook.com
 (2603:10b6:510:2d8:cafe::48) by PH8P221CA0003.outlook.office365.com
 (2603:10b6:510:2d8::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.10 via Frontend Transport; Tue, 9
 Jun 2026 10:42:44 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=amd.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of amd.com: DNS Timeout)
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000FCC3.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Tue, 9 Jun 2026 10:42:43 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 9 Jun
 2026 05:42:41 -0500
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: <andreas.noever@gmail.com>, <westeri@kernel.org>, <YehezkelShB@gmail.com>,
	<linux-usb@vger.kernel.org>
CC: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Mario Limonciello
	<superm1@kernel.org>, Sanath S <Sanath.S@amd.com>
Subject: [PATCH v2] thunderbolt: Assert downstream port reset on shutdown
Date: Tue, 9 Jun 2026 16:12:18 +0530
Message-ID: <20260609104218.2770725-1-Basavaraj.Natikar@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC3:EE_|PH0PR12MB7471:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b0bf55b-adca-4d62-95f4-08dec613d692
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	KuUpoEBKk83EjCHRD5fi9sAhtnMShIQDoevQtV+WlR64qKrvUby57MbR0J0TjVlWBX9EGrFUtvggrq2tKlT1jyh3NRKRc40ndaArG3bEDwQjOVGvCNevnCPaRD0FQYT4Q3IasAH1CaQfPtFhrvXJYKRRRP+szOq1FLKsV8fkhsMLDDaCXcEPNVLoHGLiuEkl8lmdXRx23AoI98Ft6AN+GYJIBg/rXOjPyXIDRcwHOlZ4HE6XvB42I+wzfc5p8y5u5/mJbFECIICD05Mh1dUbae/tFLVrh7XG4ysSY5j6jvM5YwuomEbDh6WZMeCVDy2mQzW+SAYCF4ncwEATFyTvVnvmaA8wbvlGKKKyrgfRyW2HXq2vEY45eWCjpyawdXZHQHR9ZdrLTnHP2qgk4M+o7cNabeE0zlj+KCiGh94g21/zSnUp5hvHovjBOZBV9jP9nuE61rr+IxxG2hbMdpY4fTO3ylHwJLoH8NQX33X1YzSNNkAELiSWWSuurcAlt7RGGxugpFH53EyTAer/sOLPswOX1lKZKAadXfnF5eQNg0WnGFklsPSAB/M4cYFGxnTuq2OPUfbZjU6neu3NsL88HQZE8XyT/0uUs2e7kKhzRdmzdLjN3As7fjPzhw3+6IBQC9OPTWLGuVW5Gh8iFgSAHcYBFbozGD5sr9TQCpiMvx41pI7jsF2r7Sd8DY0TXVnS+D8cBBdyGrb22m163Q/3brBsLBf7Tqmu6kaSR6qk850=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QWB4ZbxXF1HHeMGzpk6Nc0vjjP4OrWjUQUNtMOU1s8KrfOVUVOAdkvJugpCv4l2qJcKEnYqxxtXDH4oWZBu6wPQTeBQnsmb/sztJ/+n7Y03wnyyX5eqTi4Fyr/iVaziBtwWpbWdcOPd5i+whFrjoTR3OWD881+iOEJj5DBz8e/bTE/MSco32CnZFFDgcjFBeszIWmQV+qZJzyAlbgAazziYCN7xlUmJKMIJYscDKJ5Vwj4q5dBs3iBHGXhrwMyOtUhFEXMpNTKtTeu6AZscwk9KQp50BRk7z/FSMIRe6UrdMm1Ju7r3VnNb44q8Js63gukPNadou/72z/AVV+C9CIk9cWpMV8HEi3Xf4BQctdbmklLiQlc9IilbrQ1CdR3HrIKWhy1vbpY2krr7GcaP5HszZe4OZxWk/kLGInOlGstvCK6W5HL0kBvcB0+HdoQHr
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 10:42:43.8928
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b0bf55b-adca-4d62-95f4-08dec613d692
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7471

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

Always do this on system shutdown/reboot by forcing tb->host_reset in the
PCI ->shutdown callback. On plain driver unload only do it when the host
router was actually reset on load (host_reset=1), since in that case the
tunnels are not preserved across reload anyway; with host_reset=0 the
tunnels are kept alive across unload/reload so the links are left intact.
Restrict the reset to TBT3 devices.

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Co-developed-by: Sanath S <Sanath.S@amd.com>
Signed-off-by: Sanath S <Sanath.S@amd.com>
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
v2:
 - Add Reviewed-by tag from Mario Limonciello.
 - Restrict the DPR assertion to TBT3 devices, since the issue only
   affects TBT3 devices.
 - Only assert DPR on system shutdown/reboot (the PCI ->shutdown callback
   forces tb->host_reset) or when the host router was actually reset on
   load.
 - Reword comments and commit message to refer to the "router tree"
   instead of the "switch tree".
---
 drivers/thunderbolt/domain.c |  2 ++
 drivers/thunderbolt/nhi.c    | 16 +++++++++++++++-
 drivers/thunderbolt/switch.c |  2 +-
 drivers/thunderbolt/tb.c     | 20 ++++++++++++++++++++
 drivers/thunderbolt/tb.h     |  1 +
 include/linux/thunderbolt.h  |  6 ++++++
 6 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/domain.c b/drivers/thunderbolt/domain.c
--- a/drivers/thunderbolt/domain.c
+++ b/drivers/thunderbolt/domain.c
@@ -460,6 +460,8 @@ int tb_domain_add(struct tb *tb, bool reset)
 	if (ret)
 		goto err_ctl_stop;
 
+	tb->host_reset = reset;
+
 	/* Start the domain */
 	if (tb->cm_ops->start) {
 		ret = tb->cm_ops->start(tb, reset);
diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -1436,6 +1436,20 @@ static void nhi_remove(struct pci_dev *pdev)
 	nhi_shutdown(nhi);
 }
 
+static void nhi_pci_shutdown(struct pci_dev *pdev)
+{
+	struct tb *tb = pci_get_drvdata(pdev);
+
+	/*
+	 * On system shutdown/reboot force host_reset so the connection
+	 * manager asserts DPR to signal disconnect before removing the
+	 * router tree. Only TBT3 devices are reset. Plain driver unload
+	 * uses ->remove (nhi_remove) and keeps the host_reset from load.
+	 */
+	tb->host_reset = true;
+	nhi_remove(pdev);
+}
+
 /*
  * The tunneled pci bridges are siblings of us. Use resume_noirq to reenable
  * the tunnels asap. A corresponding pci quirk blocks the downstream bridges
@@ -1558,7 +1572,7 @@ static struct pci_driver nhi_driver = {
 	.id_table = nhi_ids,
 	.probe = nhi_probe,
 	.remove = nhi_remove,
-	.shutdown = nhi_remove,
+	.shutdown = nhi_pci_shutdown,
 	.driver.pm = &nhi_pm_ops,
 };
 
diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -704,7 +704,7 @@ int tb_port_disable(struct tb_port *port)
 	return __tb_port_enable(port, false);
 }
 
-static int tb_port_reset(struct tb_port *port)
+int tb_port_reset(struct tb_port *port)
 {
 	if (tb_switch_is_usb4(port->sw))
 		return port->cap_usb4 ? usb4_port_reset(port) : 0;
diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -2935,6 +2935,7 @@ static void tb_stop(struct tb *tb)
 	struct tb_cm *tcm = tb_priv(tb);
 	struct tb_tunnel *tunnel;
 	struct tb_tunnel *n;
+	struct tb_port *port;
 
 	cancel_delayed_work(&tcm->remove_work);
 	/* tunnels are only present after everything has been initialized */
@@ -2948,6 +2949,25 @@ static void tb_stop(struct tb *tb)
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
+	if (tb->host_reset) {
+		tb_switch_for_each_port(tb->root_switch, port) {
+			if (!tb_port_is_null(port) || !tb_port_has_remote(port))
+				continue;
+			if (tb_switch_is_usb4(port->remote->sw))
+				continue;
+			if (tb_port_reset(port))
+				tb_port_dbg(port, "DPR failed, continuing\n");
+		}
+	}
 	tb_switch_remove(tb->root_switch);
 	tcm->hotplug_active = false; /* signal tb_handle_hotplug to quit */
 }
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -1102,6 +1102,7 @@ int tb_port_clear_counter(struct tb_port *port, int counter);
 int tb_port_unlock(struct tb_port *port);
 int tb_port_enable(struct tb_port *port);
 int tb_port_disable(struct tb_port *port);
+int tb_port_reset(struct tb_port *port);
 int tb_port_alloc_in_hopid(struct tb_port *port, int hopid, int max_hopid);
 void tb_port_release_in_hopid(struct tb_port *port, int hopid);
 int tb_port_alloc_out_hopid(struct tb_port *port, int hopid, int max_hopid);
diff --git a/include/linux/thunderbolt.h b/include/linux/thunderbolt.h
--- a/include/linux/thunderbolt.h
+++ b/include/linux/thunderbolt.h
@@ -76,5 +76,10 @@
  * @index: Linux assigned domain number
  * @security_level: Current security level
  * @nboot_acl: Number of boot ACLs the domain supports
+ * @host_reset: Host router was reset on driver load, or forced on system
+ *		shutdown/reboot. When set, tb_stop() asserts DPR on connected
+ *		downstream ports to signal disconnect before tearing down the
+ *		router tree. Only TBT3 devices are reset; USB4 routers are
+ *		skipped.
  * @privdata: Private connection manager specific data
  */
@@ -89,5 +94,6 @@ struct tb {
 	int index;
 	enum tb_security_level security_level;
 	size_t nboot_acl;
+	bool host_reset;
 	unsigned long privdata[];
 };
-- 
2.34.1
