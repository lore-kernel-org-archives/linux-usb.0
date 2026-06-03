Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012025.outbound.protection.outlook.com [40.107.200.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235913845D9
	for <linux-usb@vger.kernel.org>; Wed,  3 Jun 2026 18:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780509844; cv=fail; b=sAjIG02+9+Y+NJnBWV+0/DsRMqKnmW2vWPgEyYx+gn6IJ6GNMXcAPNiF9kwbhUAFueTwPU7SwIHXGFipMqF0qY+dgBoCxQfJue0q4Fkdgn4h4tBXV/HeveaoOVUtX5tVk2wn+hoyBmweLt8BN8ohuaJSX+AtVeWElQGP42k1SJQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780509844; c=relaxed/simple;
	bh=Xpp5jXgMRNW8cQyWGX8pfbl8ZjIE+MpjazM2CZlq1dc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lHkgd5SKPZgA+1+apioCU2Bo1qZoptfIHY73laxEMLfzJCl/7JgtKUR1s9m2N3TPpxyA9SOQkEkSNyMD6DOzvb/fTHLYE1DsVrR6Jc9Xgr6aXAV7b0gaKnk0cxaN1DYWDgkT8qy6oR1lKFPqP29FGg+3O9t4AsVUMlWmroiIwlw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=h2Ji4bZp; arc=fail smtp.client-ip=40.107.200.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="h2Ji4bZp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YtOMqee8lTIQTnP59Ytfvdmvpp7HZrvrIrALDIKLI/LYk6EHUp3tuABCEDYbC0w3/9cPfO2CxPCmC8mWhErnR0rKaC5L7qvyd/frTEFOGVghKLo6Top9zsFFHrSIgNS+wNjHba42srBiQ41O8Zod7orh3ob8+CAiSWIgont/aBm3lZXzTJ550ek2dixpiZx73r1gDQ5VSKV9rz8V829Y6VR/55vCU0EWNqj6a9rknDY7wBEoX7atpx240I6+GzZCm+cimaEh+LS3Tm4ICQjW8cWgWD/Qx6l/38HkXxzvM7vi9Y4wkLE+8/f1XuoSJjBbwcnl005IV7ffulZo2b/acQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vYQyP+a6lEkoMmyczbRmShqVrQmhTN81yrlKd9eiiWQ=;
 b=B1A6KNxBtly7Hfs1wCg/knLexxrqROlSG7/jn1jC74bRBrnrZR5QNLAwrwY54GegImOD7kOCAAPCOcLNcFu/SA/DOsE+qXY08IynqYDOFGRRU5pV99bYyGYfi15B+W7Gk8gVRB7jpM+y+6PXcQFWUmYDoUgnhD7e1gEcrvAWd8FRdv99m1Sbsp1mcOOWYDUauVvaEmiLC9J+U9EhXi8ENt+22XXGW6oe94nU0U94P1qbklVEgyAa0e7jyvqaKlsyoZFbqnQRNbptvufkRQ0bZ0K+Yy753m+ZU6R2Lf3l37lR3ejwbWbOfljzCX1x5gB5XLvMdmtGihhT2AFq22KJhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vYQyP+a6lEkoMmyczbRmShqVrQmhTN81yrlKd9eiiWQ=;
 b=h2Ji4bZpgTtsjAayOP7VfvI5OI3kC9Qt8FAnrov0gLV22ND/vvuTCzcSly3bDGDamejnNYb5aImS2aGWYErjJWIboV9a6ekZEdrxGvZj5lhfCIlKTju7R8Bq+x5kzPzwB+Wy5FEqeZTVDPJvN8OHJ9eqixVY1RqN0TTml80DA2w=
Received: from BL0PR0102CA0034.prod.exchangelabs.com (2603:10b6:207:18::47) by
 DS0PR12MB7745.namprd12.prod.outlook.com (2603:10b6:8:13c::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.7; Wed, 3 Jun 2026 18:03:56 +0000
Received: from BN2PEPF000055E0.namprd21.prod.outlook.com
 (2603:10b6:207:18:cafe::6b) by BL0PR0102CA0034.outlook.office365.com
 (2603:10b6:207:18::47) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 18:03:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF000055E0.mail.protection.outlook.com (10.167.245.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.0 via Frontend Transport; Wed, 3 Jun 2026 18:03:55 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 3 Jun
 2026 13:03:55 -0500
Received: from airavat.amd.com (10.180.168.240) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 3 Jun
 2026 11:02:53 -0700
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: <andreas.noever@gmail.com>, <westeri@kernel.org>, <YehezkelShB@gmail.com>,
	<linux-usb@vger.kernel.org>
CC: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Sanath S <Sanath.S@amd.com>
Subject: [PATCH] thunderbolt: Assert downstream port reset on shutdown
Date: Wed, 3 Jun 2026 23:31:46 +0530
Message-ID: <20260603180146.3949001-1-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E0:EE_|DS0PR12MB7745:EE_
X-MS-Office365-Filtering-Correlation-Id: 605b3d34-f5f8-4d6c-de3b-08dec19a7a96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	E4E1AWcaSkFfM1/tMPovr3zDVFKez/0XjMqtj53B+HwOxeILmn0kDGPu+CFzsKF/VMkJFFXKkB3yghoYQWwXxMV3CiHjFEM+B73fKYXGDX0EX1OXhyfFsoR1Oz3UtIghODiG+ApI+EZb7fsO5qutatCG2qOEn4j1MDuvNQc8G+oD72V0hmjr8ts+9qPdesplluIl2dPCnrB1pYYATdvhsmbS4k9j9LFFaHNbj1K1M36YzmtmZ14PV5gsDLMG0VIxqQR2kcTv4wuYV01tMiSSxoDNsoB1LrTmZ18nGd3+uoUyXg09AigI41VGBkS9ry/mJnMpd6/yWUQGmQ6na/IR1+z7E22tDR0SGNpCvSEuNMH+H25zJp8NF+AgCDFgrQOi49pcPl2yJ4MKgCaYg1kuQBYWVeJHXvWax5q0rSVVYrILoMiGV3Bsm3aPjMr/+UnJgjkY/a7VvdWls1HEmyUkTLmiGy6yj4pXGc6g3VbJDzaSYXM8WQRkRvOkiPTPJcrXGvK26uxiMsgyVbdes7qsWbSWHCrtR8NwOdhqeZkKr1/SSgovyE9sI9wLRwS7tOpJ7rxS4pF/AjrFD6f8RI5b1cdkyIN2IUp/LgTABs3HP0tpiNAJHc0RVknMG6WHPxlGBTylMQbThnPPV95LGXpN+0dnEOVbpXAZlEfy1kSuuNUBOMiIl/X1QC7TpuP8ENS7Xpmr0pi7qbZY9Cc6nuR0Bjrxgdh4eEDDETbaTuvYwNA=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	IiTNlyCxlYUpWak/pItZJI6WiPXBMNzkXMYdYSC9O0G81BQCAyjZ2ZJ5NqSVqIf2mbjXHWcSBEBzbdn8wkPClocRfjk01q6nJKEG2uhCuB6cqdjjQrJj1jzxADAa0D0ogOSAOiHoBmao6mrpRlpndbRpmHoyTXnrUsvNxBS+7zLrM/4kyJfPgauS4YAiTiwK8sAcO+1PEPgsyvSh2+wnC8WQpb42CeMx9q22DvkLB3ljDJ+hXfgb0ntHV4BXsyCIJlOF5iL2TVvXMNOOmZqr7zTHXifVy4+F9pS5Cz/RawAn3cc2KqbmIMsEDVmCAbbloQw772EE7r1LrBFAgtVZWvi5EaZQhNLZ4U9mFG5WoS+vAQ7ptN6US8TIhcEYD9l2fJYZOP4RcezaUV2qHJT3agDQ19gEL1umAANTGh9mnrrRMEreObd3ersE0U2yjqu1
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 18:03:55.8620
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 605b3d34-f5f8-4d6c-de3b-08dec19a7a96
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055E0.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7745

On shutdown the connection manager tears down the switch tree without
signalling connected devices. Thunderbolt 3 devices directly connected
to a USB4 host never receive a disconnect indication and during shutdown
this can cause polling the dead link for up to 60 seconds. On some
platforms this behavior leads to a warm reset instead of a shutdown due
to this timeout.

Fix this by asserting PORT_CS_19.DPR on each connected downstream port
before tearing down the switch tree. This drives SBTX low unconditionally
(USB4 spec section 6.9), causing the device to detect SBRX low and
transition to Uninitialized Unplugged state immediately.

Co-developed-by: Sanath S <Sanath.S@amd.com>
Signed-off-by: Sanath S <Sanath.S@amd.com>
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/thunderbolt/switch.c |  2 +-
 drivers/thunderbolt/tb.c     | 11 +++++++++++
 drivers/thunderbolt/tb.h     |  1 +
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index c2ad58b19e7b..52812908818b 100644
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
index c69c323e6952..ca57b5181422 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -2935,6 +2935,7 @@ static void tb_stop(struct tb *tb)
 	struct tb_cm *tcm = tb_priv(tb);
 	struct tb_tunnel *tunnel;
 	struct tb_tunnel *n;
+	struct tb_port *port;
 
 	cancel_delayed_work(&tcm->remove_work);
 	/* tunnels are only present after everything has been initialized */
@@ -2948,6 +2949,16 @@ static void tb_stop(struct tb *tb)
 			tb_tunnel_deactivate(tunnel);
 		tb_tunnel_put(tunnel);
 	}
+	/*
+	 * Assert DPR to drive SBTX low, signalling disconnect and avoiding
+	 * ~60 s of link polling before warm reset on shutdown.
+	 */
+	tb_switch_for_each_port(tb->root_switch, port) {
+		if (!tb_port_is_null(port) || !tb_port_has_remote(port))
+			continue;
+		if (tb_port_reset(port))
+			tb_port_dbg(port, "DPR on shutdown failed, continuing\n");
+	}
 	tb_switch_remove(tb->root_switch);
 	tcm->hotplug_active = false; /* signal tb_handle_hotplug to quit */
 }
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 217c3114bec8..875eb538eacf 100644
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
-- 
2.34.1

