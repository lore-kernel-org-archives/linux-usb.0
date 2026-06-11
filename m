Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012053.outbound.protection.outlook.com [52.101.48.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2112F6577
	for <linux-usb@vger.kernel.org>; Thu, 11 Jun 2026 05:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781156550; cv=fail; b=OyudDamUSAejp1Z7XnmWsh7npKUsICRAkgnoT0Id2iXd8ER4pf4d9IZlK6VzrVaJxT5IKoELXzwiV94Jp8JI/WpUz/B/PtDgrV1q3FxdPdg/SVWzh8r1u2lyBOkmbGckjRqk/tzF4C7w/xW61TL64NR8X1+jEJ7PjDyGxHRbiBc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781156550; c=relaxed/simple;
	bh=zfAN4ds4EYvjzXqqkUYWa3FvXsEoQ2yqHu4aMlGWdEs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IU5U19HJoNc5BC73KJ37y7CEqj4oDt+Az3aF204fOyG4kipvMNNASZvkKec/VmelGQNKID+/FoRTRA4q8JfRewo04zmXFsZFLXoGVOBXQXzRrh9RuE9PX9Lpmmr5LW78/UsUI8zTC5qwxPW6q8KwaNCzdRiqdtjQG3HOOANxFmY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=dyw0HBfk; arc=fail smtp.client-ip=52.101.48.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="dyw0HBfk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ijxWn2PAGVnBiY3BKCMbV/ijH604DJBLDC5csvRhTuWjwOW6PocJX8c/fiuiiGrbiB1ZvOCgO6zZsAmEQXp2amjzRpEy1ZR3jEWhIHofv+qEfBUHWLxf/4kuVvXnQpNroN/oGnSoulrQbiKLFVAfMukT+QFg8jOfcT79eHqUD4cYaRdf0o9Nynmqw5loOxe6iwlDvv8ADelJIJUyCqYdmzIv3S3pVid2rNFoF9XPmhwiqjt3Ln14XXc8HojkKfz+K8UDfrP08RcCAMBJ2ZOWWzPNa8aLb9Xv1F5tlOqNJFgFviSZhGN2GZvk2UbBiVPIIETaaQLJWCZRoMFxxxMVig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2TGxawhucahx2Tcl/I0cwwyjiymViYBq0bjsDYFblp8=;
 b=NkN57jlOrL1/CcGCQk6dxjt9FXwdWqe3JVg2QqW3fwxmR48iIE4SsF0nNZX247AEMbW+2YqufPjL7jhM9vajHI4AFchEHKghhxZlwdx1++FQv7MoI+wrolCbBnEm7Jx5tK0AzkxwauNRhpyBF4L4h0hFLh8yk0rFj/lE0xB/RpSz/ThKQkCDxv99xVUMQkU2loJXAEcNVKt0NL6o/KdItAvh1CVeUpd2Xc7RPxdbDxFaWggbE+9hTqPoVDi2aN6HWoTupR+9rPUHJP3CoBCoEELkVTNwJtN8lvqrdDBZt8s9XNDPXpnl0k2aK7+gN+lxDtR88cfd+3vy7GVYk7nstg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2TGxawhucahx2Tcl/I0cwwyjiymViYBq0bjsDYFblp8=;
 b=dyw0HBfkuQazNlzTmb3yfEMuLPOJ8HRR9UkL9mD4tmjz3d0X3R9yzgmJEjZv8Xf5UMv9U9WlkmKUrduO/Y2Bcx7e+f7JH7VGwbX/niJpfJIQLicTh9lBaDzym+AAORN1TdzSZvztlS9HDfIHUXtfHsOChMsUwKbFJbzSkrzZ5M4=
Received: from SJ0P220CA0024.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::32)
 by MW4PR12MB7431.namprd12.prod.outlook.com (2603:10b6:303:225::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 05:42:20 +0000
Received: from SJ5PEPF00000204.namprd05.prod.outlook.com
 (2603:10b6:a03:41b:cafe::9d) by SJ0P220CA0024.outlook.office365.com
 (2603:10b6:a03:41b::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.10 via Frontend Transport; Thu,
 11 Jun 2026 05:42:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF00000204.mail.protection.outlook.com (10.167.244.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Thu, 11 Jun 2026 05:42:19 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 11 Jun
 2026 00:42:17 -0500
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: <andreas.noever@gmail.com>, <westeri@kernel.org>, <YehezkelShB@gmail.com>,
	<linux-usb@vger.kernel.org>
CC: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Mario Limonciello
	<superm1@kernel.org>, Sanath S <Sanath.S@amd.com>
Subject: [PATCH v4] thunderbolt: Assert downstream port reset on shutdown
Date: Thu, 11 Jun 2026 11:11:57 +0530
Message-ID: <20260611054157.928921-1-Basavaraj.Natikar@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000204:EE_|MW4PR12MB7431:EE_
X-MS-Office365-Filtering-Correlation-Id: 8545c385-260a-4e53-5058-08dec77c3435
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|36860700016|82310400026|1800799024|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	DqOmafcmjbjflbFxuvgTu+Aj2xaGHL+nBOngBIcRqL6fMmw5XTpTpyyW20BuqmmYYU6tCEje6pK2AgIwHNCbyiFlsYHSEzASzCcbGdqxflpezctYChcmoJxdPL2Hyh2VoVJP45WTyo0LwieTT2Zb2bO4ypvXEVo/wRxPzUb9CObHSPwdthRfBz911Gs043uM8TjaEQCehnE9CeL5ZutJ/Q7qmV2VqYbGqJ5wUHwNnch7PZX4WAUkCqN8pSxH0TYm13F8fuWyfs0Vp9WzkMP1fBxn6IrM4+9AS5c+P6Pvsna9tuD4n3G5Aa/HN+uC9U4FmzfXxT7XA2Y7KrayXezwBUH2FiTW6Dmk4yTkimQ4fa7itz7Ic8rQe6xjHKgpEGb4Q34/02Kn0jMmZYuAPnyRE3BEyJBdD/qwYSXJiDwgEhx9KWXCL0FG8BfR/OdFLXTXoJZ433bMarn+IBv9RnY4lXO5IBu0in7ezIZYO3MHn3EUT1aprwP6on1Qrl2wTag8bPadl7gls510Vac8gBSlLfgQjebX3uw09I+W5Z3ML1/e0ufM+Xf5HnN38ts6A4mr0h2LVbwNj9NrR1YFYQMrMmMvLVqAwfBIp6nVZxBWIVMpD2UDDLQ/ZxnDbcG5HPy3hU0BzORj2KQ9p5+EU9Vmtx56pliFyjCuFg/PXeq8GFYDYtc0qL/VavezuCIdhE0Z35taMgnFBdWZqZu3hwTRQIQb6hVqtqKxZCl6deGf5o0=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(82310400026)(1800799024)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	G1aS2BrpXZ9D5hqjj0xYX072zTBfbgtIAm5MKcvaD9knjolJH4BRHu23w/nEvxAqny3G9v2HTp4EhRHWAqUEuUszCrBIJzR1WMTtb9XpwU/Bq3NKZ7cvivpPlo7Fr+9B1DwpYCFMas6FBMDxsxzKm8prUlKcRZzokVoCdvv/lZgreErKfAIX/qB0BOsOgmneRycMtDgvq4lMc1nl1lAHLrI8+wfN1wSwfTfLAzZt4kHn7rasFfB3mIpXkM3oj8fES+cPvTqp1YgEoLnDo52axzRWdOZlc1MvKfgrh4zjS5JpRw00yF87ehoFVDxRLvGBTuj6KLEEEfypeunV1+St9fS1yguxvctMa432lqjt7YeUYxZUHppcJgNEbJDHFHcG8dgtkcIVSIY731CoEvRxVZcYbMvvr9+fCvEIQnuqGOtJ92B3L7YjhengC2CQAjPy
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 05:42:19.8105
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8545c385-260a-4e53-5058-08dec77c3435
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000204.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7431

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
v4:
 - Name the PCI driver ->shutdown hook nhi_pci_shutdown(); rename the
   existing tb_nhi_ops shutdown handler to nhi_pci_release_irq() to free
   the name.
 - Factor the PCI removal into nhi_pci_do_remove(pdev, reset); the
   ->remove and ->shutdown hooks call it with false/true respectively,
   and 'reset' forces host_reset.

v3:
 - Rebase on top of the thunderbolt next branch; the PCI ->shutdown hook
   now lives in drivers/thunderbolt/pci.c.
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
 drivers/thunderbolt/pci.c    | 28 +++++++++++++++++++++++-----
 drivers/thunderbolt/switch.c | 11 ++++++++++-
 drivers/thunderbolt/tb.c     | 21 +++++++++++++++++++++
 drivers/thunderbolt/tb.h     |  1 +
 include/linux/thunderbolt.h  |  6 ++++++
 6 files changed, 63 insertions(+), 6 deletions(-)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
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
--- a/drivers/thunderbolt/pci.c
+++ b/drivers/thunderbolt/pci.c
@@ -230,7 +230,7 @@ static void nhi_pci_ring_release_msix(struct tb_ring *ring)
 	ring->irq = 0;
 }
 
-static void nhi_pci_shutdown(struct tb_nhi *nhi)
+static void nhi_pci_release_irq(struct tb_nhi *nhi)
 {
 	struct tb_nhi_pci *nhi_pci = nhi_to_pci(nhi);
 	struct pci_dev *pdev = to_pci_dev(nhi->dev);
@@ -256,7 +256,7 @@ static bool nhi_pci_is_present(struct tb_nhi *nhi)
 	.post_nvm_auth = nhi_pci_complete_dma_port,
 	.request_ring_irq = nhi_pci_ring_request_msix,
 	.release_ring_irq = nhi_pci_ring_release_msix,
-	.shutdown = nhi_pci_shutdown,
+	.shutdown = nhi_pci_release_irq,
 	.is_present = nhi_pci_is_present,
 	.init_interrupts = nhi_pci_init_msi,
 };
@@ -424,7 +424,7 @@ static int icl_nhi_resume(struct tb_nhi *nhi)
 
 static void icl_nhi_shutdown(struct tb_nhi *nhi)
 {
-	nhi_pci_shutdown(nhi);
+	nhi_pci_release_irq(nhi);
 
 	icl_nhi_force_power(nhi, false);
 }
@@ -479,20 +479,38 @@ static int nhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	return nhi_probe(&nhi_pci->nhi);
 }
 
-static void nhi_pci_remove(struct pci_dev *pdev)
+static void nhi_pci_do_remove(struct pci_dev *pdev, bool reset)
 {
 	struct tb *tb = pci_get_drvdata(pdev);
 	struct tb_nhi *nhi = tb->nhi;
 
+	/*
+	 * On system shutdown/reboot force a host router reset so the
+	 * connection manager asserts DPR on connected Thunderbolt 3 devices
+	 * before the router tree is removed (see tb_stop()).
+	 */
+	if (reset)
+		nhi->host_reset = true;
+
 	pm_runtime_get_sync(&pdev->dev);
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_forbid(&pdev->dev);
 
 	tb_domain_remove(tb);
 	wait_for_completion(&nhi->domain_released);
 	nhi_shutdown(nhi);
 }
 
+static void nhi_pci_remove(struct pci_dev *pdev)
+{
+	nhi_pci_do_remove(pdev, false);
+}
+
+static void nhi_pci_shutdown(struct pci_dev *pdev)
+{
+	nhi_pci_do_remove(pdev, true);
+}
+
 static struct pci_device_id nhi_ids[] = {
 	/*
 	 * We have to specify class, the TB bridges use the same device and
@@ -593,7 +611,7 @@ static struct pci_driver nhi_driver = {
 	.id_table = nhi_ids,
 	.probe = nhi_pci_probe,
 	.remove = nhi_pci_remove,
-	.shutdown = nhi_pci_remove,
+	.shutdown = nhi_pci_shutdown,
 	.driver.pm = &nhi_pm_ops,
 };
 
diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
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
@@ -528,4 +533,5 @@ struct tb_nhi {
 	u32 hop_count;
 	unsigned long quirks;
 	struct completion domain_released;
+	bool host_reset;
 };
-- 
2.34.1
