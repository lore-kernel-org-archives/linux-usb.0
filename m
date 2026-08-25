Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010046.outbound.protection.outlook.com [52.101.56.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77E539281D;
	Tue, 25 Aug 2026 21:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787694200; cv=fail; b=BjjtzWJZhrjZi2c8fk+BXU/K2lsMMibLag+oc7lMoKPmm5xU8O5UA91x5V7wiKq1pLaBsqo22aTPFzLu7Fq7foPQvwDaoF7Cn/F88G0Bpw/LVn04d6J6uAEl5kSyi08u8nPfottBfdmDzbL3szAvl+yB/lugIo3/YWozU5gyU70=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787694200; c=relaxed/simple;
	bh=jyMWYwm7NmQ8N+ngbg5eTtgNvTSi6dGIPaJRhPegk1A=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iiKSZH909UHZj9Z7RjnjwSH62zgK70QBlBJGr65sWeY0x25BRAQEEmtzR879QyMwCEGWQdKja6nrcdJIiZuztrbrbdOXak/XFt/fcV+QDnz8fbniK309B9h2iV5r1Hr3qDET1Xbh+3U3O9RRCil8kk96JNo808gxAzndJowJf6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=XgLH2rIW; arc=fail smtp.client-ip=52.101.56.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="XgLH2rIW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZAYuMd2vJ3O/t1d2GSayvZcTUnFxiX372ZClJKOWXbskM6DV7g7fgbAYxqjS7KX9J0JNLLUdujyx3NuWrgDafMyr1hapll0Q+I7mTIiymVJMVVb1UqTmERH690PYSZwU7+1oLNW2nYogSt/d/R++xX/SSSbNGCo2EwlURn84LPyl4CPw5O/gwIwOBi85zT1q/NrXc+JVpOT4sV/bf3WTejlZhFF40rQGZ5TAQeRbwfypE+A//TtBZrHD69MneolpZ3VO1XkmgcGbIjTIXA8hBkwxcxxNjZIs1gylOtXqcV9VI8XvC0t9trzjiquHCgD8cAgC1mRIKXoiPj++NqjGCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W+MhIejXhceTKgL3vZhGDh7PDw4O2wOGN+P+AGHiyZU=;
 b=ttI3+SNJtWhmFhnwWevREYDjpUlCQ4QUIA76GeNQ+VYh3w6MUkbkfLnz2zQ4NupIK7755M1ijtY0ghRPWaeeBx0V8b/G9fdlzMIlzNabqediggTBNOB3JUl8UL7o9vBLsS4tZMwpwm4tOaG7kwjvyODUfBNZsj1mnWfPpkTm78IU2v/oj2G8+UgIiQXRXs5vZ9UkfwN9uxFQhpP170O9wGfJ0QDeUcxT1LCFErxzXx2/AyG5RMv6jWakRFcI2bvlTJOP2zJPZjxkjpgSaQmAPUMvl2qPg+HYjdOcUagDxZXC7svv8Q5n/hsQg8wL/P5p7gSjVUpPnVY2LZiOx6LBwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.90.133) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W+MhIejXhceTKgL3vZhGDh7PDw4O2wOGN+P+AGHiyZU=;
 b=XgLH2rIWFiEWh8t7LAZH0k3XDbwVFF9sp0J8nOxaayuc3H3dGJ2n3QwEXbfu6FTUYKoDwBMpgCe5BOyuqMlsfmNKcStKWZITL+alJEn4usL5FqA1UdF2tKDxEPXB+WsLbY4/IdkbuvMqyV/FY3xi5pEdopGTAo21y5XugsACE8k=
Received: from BN9PR03CA0169.namprd03.prod.outlook.com (2603:10b6:408:f4::24)
 by SJ0PR12MB6760.namprd12.prod.outlook.com (2603:10b6:a03:44c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Tue, 25 Aug
 2026 21:43:08 +0000
Received: from BN3PEPF0000B069.namprd21.prod.outlook.com
 (2603:10b6:408:f4:cafe::3b) by BN9PR03CA0169.outlook.office365.com
 (2603:10b6:408:f4::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.12 via Frontend Transport; Tue,
 25 Aug 2026 21:43:08 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.90.133) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.90.133 as permitted sender)
Received: from satlexmb07.amd.com (149.199.90.133) by
 BN3PEPF0000B069.mail.protection.outlook.com (10.167.243.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.0 via Frontend Transport; Tue, 25 Aug 2026 21:43:07 +0000
Received: from jprecision.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 25 Aug
 2026 16:43:06 -0500
From: <juan.martinez@amd.com>
To: <westeri@kernel.org>
CC: <andreas.noever@gmail.com>, <YehezkelShB@gmail.com>,
	<Basavaraj.Natikar@amd.com>, <Sanath.S@amd.com>, <linux-usb@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <mario.limonciello@amd.com>
Subject: [PATCH v2] thunderbolt: Fix tb->lock deadlock during hot-unplug on AMD USB4 routers
Date: Tue, 25 Aug 2026 16:42:37 -0500
Message-ID: <20260825214237.4179813-1-juan.martinez@amd.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B069:EE_|SJ0PR12MB6760:EE_
X-MS-Office365-Filtering-Correlation-Id: ce87158e-ed29-449d-ecc3-08df02f1da0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|82310400026|36860700016|56012099006|11063799006|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	jEsP4VJrHHyxiFKqMfkBfn1befiHG/exZQTusPSQAIstkFXlLZO+mD/jrHBwFzKoxloreh11TMu809sHZqxtyvAl1NjdfoDEqssjh5gJXEHwpE55IqXpa9uPLoBFychEgHCORvrioPFLSHmMm4QjkfMELAGJm9q1u9kmuA2tOo4Ta+U2ksqHMiq4aNeFP8HPji7OVXMdemmBWSzdh7J0CYlbM92Pm1vkVr024UwcBA3Bbj4fK64+IbqDJdgCJctnvYjv66lPzYChIxlpfUdlgPKswSi5VnBd3lw/KXyRwekwAWv5r1G0GR4XI0XlcNal9Cfs2cVBz2+4Epz8Ik2XXlMUPDth8nCxwTRkbCNTtG6DU0n5TFg8J7J4tqa5iysLIvxgHT7t20WdrtjjbETHWYf7b629WcHuYnYiBjDRdQ2fQeBAosl19EUYiqLbzsjvQJysoza2ZPWuCVVKqFVb9xFA986M8iLAiKxb+uyntQiLA31eXH2yCXOV0TKcz0jnE04OrKKq9lf1SFKaUrVZmy+b+8g2WpzlZ2O/ZxsqsAu0kVCFdt8k/Vg2Gmqgcy7eO9B14uFPuSEq/KaKWsFeaepk5EIBMn80kaTw7AXxrhWZe0Xm88qQQ4y6MwE+jjV9XLKeKhMq3e3BGnP9K6Q0UYmzxD4i6osz6D4bIJruccs=
X-Forefront-Antispam-Report:
	CIP:149.199.90.133;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:unknown-90-133.xilinx.com;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(82310400026)(36860700016)(56012099006)(11063799006)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4IVslosBilnoGW9or2AVB4YygVesduD62Cmo+ggVowqKKbLPzQUOemu1vFz6sOv8zJ2U1frQ2jJxna86XzHpAlbeqHZthc1eaCzHsdXHoM0m6v4TtSg0ymSajSidFGOi0/Haa8Uud8kXb74iomj4QmD2e9fv26hqJnlbGgqEt+pw5KACH1qY+lxbLERWDSYnb/308L0RhLHoNBwqtpdXublIwL3G/Wh3SWv/b/7nFxstaP4bF6NZCxIGkDLtBigHJt0mqfojnqIQKw9/aGP1Gaso//FOVoOOVgQ7WekEUVezEHYtteQg1hIgCb8O0RmbCP7lIlDMuxONsa3xmrtKcErv66u05IVb6vJTZCOnGbadPNfTaWP49ac+QEgJfYxeb2pNAV+x6d3zX2rjr0L0GFv4D+B3XU8DprpFOnx4WH9Liqz/cXWLh+f07AkMVCbe
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 21:43:07.6763
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce87158e-ed29-449d-ecc3-08df02f1da0b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[149.199.90.133];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B069.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6760

From: Juan Martinez <juan.martinez@amd.com>

Commit f1de1fc5f632 ("thunderbolt: Add quirk to reset host interface on
DMA path teardown for AMD USB4 routers") introduced a deadlock when
physically unplugging a Thunderbolt cable on AMD systems.

The problem occurs because tb_handle_hotplug() holds tb->lock while
processing the unplug event. When it removes the XDomain services,
tbnet_remove() calls tb_xdomain_disable_paths() which eventually calls
tb_domain_reset_interface(). That function tries to acquire tb->lock
via guard(mutex), but the hotplug worker already holds it, causing a
self-deadlock.

The deadlock manifests as a complete network hang because
tb_handle_hotplug() holds RTNL while waiting on its own mutex, blocking
all network operations system-wide.

The existing code already handles this scenario partially: when
xd->is_unplugged is true, tb_disconnect_xdomain_paths() intentionally
skips the DMA teardown because the hotplug handler will do it later
via __tb_disconnect_xdomain_paths(). However, the reset was still
being called unconditionally.

Fix this by:
1. Splitting tb_domain_reset_interface() into a locked inner function
   __tb_domain_reset_interface_locked() and a locking wrapper
2. Skipping the reset in tb_domain_disconnect_xdomain_paths() when
   xd->is_unplugged is true (matching the existing teardown skip logic)
3. Calling __tb_domain_reset_interface_locked() from tb_handle_hotplug()
   after __tb_disconnect_xdomain_paths() where the actual DMA teardown
   happens and tb->lock is already held

This preserves the reset behavior for normal shutdown paths while
avoiding the deadlock during physical cable unplug.

Fixes: f1de1fc5f632 ("thunderbolt: Add quirk to reset host interface on DMA path teardown for AMD USB4 routers")
Signed-off-by: Juan Martinez <juan.martinez@amd.com>
---
 drivers/thunderbolt/domain.c | 26 +++++++++++++++++++++-----
 drivers/thunderbolt/tb.c     |  1 +
 drivers/thunderbolt/tb.h     |  1 +
 3 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/drivers/thunderbolt/domain.c b/drivers/thunderbolt/domain.c
index 12c88509a54f..253ea8c6b757 100644
--- a/drivers/thunderbolt/domain.c
+++ b/drivers/thunderbolt/domain.c
@@ -788,14 +788,19 @@ int tb_domain_approve_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
 			transmit_ring, receive_path, receive_ring);
 }
 
-static void tb_domain_reset_interface(struct tb *tb)
+/*
+ * __tb_domain_reset_interface_locked - Reset host interface (lock held)
+ *
+ * Caller must hold tb->lock. Used by hotplug path where lock is already held.
+ */
+void __tb_domain_reset_interface_locked(struct tb *tb)
 {
 	struct tb_nhi *nhi = tb->nhi;
 
-	if (!nhi->ops->reset_interface)
-		return;
+	lockdep_assert_held(&tb->lock);
 
-	guard(mutex)(&tb->lock);
+	if (!(nhi->quirks & QUIRK_RESET_DMA_ON_TEARDOWN))
+		return;
 
 	/* The reset clears the ring state so stop the control channel */
 	tb_ctl_stop(tb->ctl);
@@ -803,6 +808,17 @@ static void tb_domain_reset_interface(struct tb *tb)
 	tb_ctl_start(tb->ctl);
 }
 
+static void tb_domain_reset_interface(struct tb *tb)
+{
+	struct tb_nhi *nhi = tb->nhi;
+
+	if (!nhi->ops->reset_interface)
+		return;
+
+	guard(mutex)(&tb->lock);
+	__tb_domain_reset_interface_locked(tb);
+}
+
 /**
  * tb_domain_disconnect_xdomain_paths() - Disable DMA paths for XDomain
  * @tb: Domain disabling the DMA paths
@@ -835,7 +851,7 @@ int tb_domain_disconnect_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
 	if (ret)
 		return ret;
 
-	if (tb->nhi->quirks & QUIRK_RESET_DMA_ON_TEARDOWN)
+	if (!xd->is_unplugged)
 		tb_domain_reset_interface(tb);
 
 	return 0;
diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index b7cc6894a598..89dfb3381345 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -2489,6 +2489,7 @@ static void tb_handle_hotplug(struct work_struct *work)
 			tb_xdomain_remove(xd);
 			port->xdomain = NULL;
 			__tb_disconnect_xdomain_paths(tb, xd, -1, -1, -1, -1);
+			__tb_domain_reset_interface_locked(tb);
 			tb_xdomain_put(xd);
 			tb_port_unconfigure_xdomain(port);
 		} else if (tb_port_is_dpout(port) || tb_port_is_dpin(port)) {
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 4373336d9425..2e6e0920cb1f 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -789,6 +789,7 @@ int tb_domain_disconnect_pcie_paths(struct tb *tb);
 int tb_domain_approve_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
 				    int transmit_path, int transmit_ring,
 				    int receive_path, int receive_ring);
+void __tb_domain_reset_interface_locked(struct tb *tb);
 int tb_domain_disconnect_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
 				       int transmit_path, int transmit_ring,
 				       int receive_path, int receive_ring);
-- 
2.43.0

