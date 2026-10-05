Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012026.outbound.protection.outlook.com [52.101.43.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E05488D95;
	Mon,  5 Oct 2026 13:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791207865; cv=fail; b=FEucMXT1eKJSzdVYmuoSzGcuVrE4jec5b4reFGWKkxHl0UbEtEuCkfIS7qKYeM/fJLtSN9Pb6v3hkVAdf8oAjytLnO2ykmY/37Jm0nfsVEKNnZxDceVIe47WVdgeOiBHKNPps6ZfUnI7wEjU4JAyh3FUOZFF0OVdtrsvDCyAiao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791207865; c=relaxed/simple;
	bh=3qZ8P/R+Vy3wZcgzTTc0/T+nYdks7wFUVcoig1jCKIM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DIk2YIGebc4tbEadDj6Q3h+9aRd0PaXjfAdXX8+HqsnAl01lB+rtmlu9LkS+m6xQiqsq1kYzuV5AlzqUFPmnNSHwF5zmuGV5FlxVwBlWeIoM79cH7Zyzk3MAj7NdeWiR0I6C2MbKNuAE/Mlxo2wR1R7h26+fpThR8MH2Eh8/yCA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=eu7Z5XEE; arc=fail smtp.client-ip=52.101.43.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="eu7Z5XEE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F/m5OilgUI6TrfUIhczr2JTgr0Qx3gsInrjeRDwOt9uBi8b5trcqKBhw0Fm3m/42wzGbmzpdJ3qkliEJ1NjZgS8WzfAtDQv5dEnHWAFVuE+A+Y6TSCfTVhaI+ECvWtGkP8f8w6ffwnuft8p/WxbpzkmXQCQ6tg7YCrNnE81Mzh3r1voa7ziuRmFIXRiaudlYhfRUNn8Hx7mhbnFDtGek9QDvlTf7KA5l+X09fKWpxp2HZVUQSPmrtl9DTTwj4sm42559f/u3XgpHDb0IUdKLjSXuMNzaygukqj/4CLkGSNwHIZN2rK5joPV6ohUfYr0bH4As7V34ADwgorfUBlBQbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wkI6lhUc8Q7BwWZIj8U+iIrHlKUwCZ/Vm77eEw1cLo4=;
 b=CqJDKb5AE3u+XI0+TQ7UbM0tutG9qJQLS2XcDmvhC2V3xBCJS91dA1tY/Hc0gkcAf6vUl4EKmIZiRtAXyMl9Sxh78xy6TJXH2KBBbzC6p56KG/nlUTYuR2ERR8YYM1s1pL+RfL0RKZkUTHR+smkdrgLDZygxsdkaK1fQbKTnthzy6RI0kBLO6P0WZeCk08dmhJAYfcO6+S31wJ8bcwU5NpAOpCtVNUVeXUUS56vw/t8CQuKwvgxSFXTIvayEdCk5ThUHpL49lIdLTFgS6v6uspuK7qjEqVqzCCfw8NdKg01BsjNQfHosS5hJpvCzesEsVCUsfFhDveHYXNYqKnx7Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wkI6lhUc8Q7BwWZIj8U+iIrHlKUwCZ/Vm77eEw1cLo4=;
 b=eu7Z5XEEOCkHnGB2PnVo74lAqiZjTTj1GcAh0wWUGNn4Di1c2HB8rG8/7uZAX0RcSsV8d8TmEs9SnUPPczjvpryB8njpgQWQCCVUEmAVU8hc9DRK3hejA95Lw8leiyu9vunideZoAquDqyMy4BPRLMNlNnKEl3AZTHgVkUTUgG8=
Received: from CH0PR04CA0056.namprd04.prod.outlook.com (2603:10b6:610:77::31)
 by PH7PR12MB8123.namprd12.prod.outlook.com (2603:10b6:510:2bb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Mon, 5 Oct
 2026 13:44:12 +0000
Received: from DM2PEPF00003FC2.namprd04.prod.outlook.com
 (2603:10b6:610:77:cafe::64) by CH0PR04CA0056.outlook.office365.com
 (2603:10b6:610:77::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Mon, 5
 Oct 2026 13:44:12 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DM2PEPF00003FC2.mail.protection.outlook.com (10.167.23.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Mon, 5 Oct 2026 13:44:12 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 5 Oct
 2026 08:44:07 -0500
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: Andreas Noever <andreas.noever@gmail.com>, Mika Westerberg
	<westeri@kernel.org>, Yehezkel Bernat <YehezkelShB@gmail.com>, "Jonathan
 Corbet" <corbet@lwn.net>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S .
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
CC: <linux-usb@vger.kernel.org>, <linux-doc@vger.kernel.org>, "Mario
 Limonciello" <Mario.Limonciello@amd.com>, Sanath S <Sanath.S@amd.com>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 1/3] thunderbolt: Allow tb_ring_start() to fail
Date: Mon, 5 Oct 2026 19:13:39 +0530
Message-ID: <13c3bccc590ec4a87bb718da0de40a3d041846d8.1790854235.git.Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1790854235.git.Basavaraj.Natikar@amd.com>
References: <cover.1790854235.git.Basavaraj.Natikar@amd.com>
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
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC2:EE_|PH7PR12MB8123:EE_
X-MS-Office365-Filtering-Correlation-Id: e1baef4c-7a9d-4d1d-b877-08df22e6bd45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|1800799024|36860700016|376014|82310400026|6133799003|56012099006|10067099003|5023799004|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	EeMCwRAJ/VTb5e0JAEQMNZUV/cP+b4P0QngPQYFFaMeNqzgx6rdl/nmk1iVp24lh4siVp1w2HdC+pZRe/Zq/qYh2dByOinpaNqYpLLuAdpEv2XGvNX3DveXVmcYOrd+O3lk5htfCQcfhNssKhrYoHCrEhu8/T2nQifKbK6pEgPZC8HuQLUIaMVMUpnZc4+4VmQhI8NOeA1i/o9p0zfzkr4jCES+EgGy2H3G/8JYPTwgWzdQvDIbMF/3ynU9QSWHBkv8cpoXV12Fn6k2hU95VfakcnUJr054qCclu9kF3S299g+09tttsWUd25JLUw8OY3vArEMjVEmg4+NOBA+yFqLxUaNvpdy5aqXc/eoz4vJkjAantPdM1NRe4rgpg2ARFvan2kApI7yUcuNK9ZFSixs9F1FW1/VFSfohvq6zoWlNdv2FeuVTq3/0uYHxnQOmkl9JzX3PmBVxVCYjTgzOSWR2YQxk03ZaxR8WE3mLES5GnGzbwSUqUvAJxHg5CA1gqJXvzlwFKK8kgkfueRLOaDcvy7lbCqJ0p84eXlnlGEIoRV24KEiT9u317FDVns9Njmx2o4PdqEscSjfrgN6Iw+0whHIwVchKv1d7mIpDSaqIhTbvJwO+We1WKQm3fv0yGaF2z1QFf50HAvwDAdzP1UFfV+dE7XVjdD7iFa2cRlrBeYn3E8SjndrP3TWfKfhBg9YhV1/xnMqKu5HcAd5ppKw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(1800799024)(36860700016)(376014)(82310400026)(6133799003)(56012099006)(10067099003)(5023799004)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dHt4axZjkFoJNIygSKBh4feHCPnEKbpqmD7jKTwom098XO1CK4E5JoituPFB97mQf/LyN7kN5ir1aHO0ryJT04Mqnv0lVjKVdnmBcRyZqfVNgQQh9oISjsX/UbP0NDV1UETxSzq2wPOR5CuGY66X4I3Mv2grBZjNo0RC/jpZSfe+UgM1/eBOz6jBYgkocXvgHb8zovLPKt76jI3QJKCoGUlVJv/Gmfuja2t2qCU+5NVFx/1HVwF2h4dxvk95AzNfF17aae622mvRZnp/66imMkdRukQP94cXD1ylRjbiHiLgqymMhmJtCWmqGc1agrgbqy8WOL6XKjKH/8015vcAACBBkE5PrP8qAaFnVZaNRjQV+reDAcg5qF6JdbMtZLtdJLCVMFTlBDJ+JmWJclHat9LE+L5UnYAf1e0QbqqKL5ZscRXlYjsPKdXkvI81eqpW
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 13:44:12.2608
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1baef4c-7a9d-4d1d-b877-08df22e6bd45
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM2PEPF00003FC2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8123

tb_ring_start() returns void, so its callers cannot tell when a ring fails
to start and keep building an unusable tunnel. On some host interfaces a
DMA HopID also cannot be reprogrammed until the host interface has been
reset.

Hence, let tb_ring_start() return an error and unwind the callers on
failure: stop an already started TX ring when its RX peer fails to start,
and disable the DMA paths enabled before the rings were started.

A stream can also stay open after a failed resume. Therefore, free the
partial allocations, clear the ring pointers, and let the subsequent I/O
and close return without touching the freed rings. Check readiness under
the device mutex and use a wake token so a wakeup is not lost across the
unlocked sleep.

Co-developed-by: Sanath S <Sanath.S@amd.com>
Signed-off-by: Sanath S <Sanath.S@amd.com>
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---

 drivers/net/thunderbolt/main.c |  14 ++-
 drivers/thunderbolt/ctl.c      |  23 ++++-
 drivers/thunderbolt/dma_test.c |  32 +++++-
 drivers/thunderbolt/nhi.c      |  12 ++-
 drivers/thunderbolt/stream.c   | 175 +++++++++++++++++++++------------
 include/linux/thunderbolt.h    |   2 +-
 6 files changed, 181 insertions(+), 77 deletions(-)

diff --git a/drivers/net/thunderbolt/main.c b/drivers/net/thunderbolt/main.c
index cf51b9c39f4e..93ccccc5cf8b 100644
--- a/drivers/net/thunderbolt/main.c
+++ b/drivers/net/thunderbolt/main.c
@@ -669,8 +669,16 @@ static void tbnet_connected_work(struct work_struct *work)
 	 * the Rx ring before any incoming packets are allowed to
 	 * arrive.
 	 */
-	tb_ring_start(net->tx_ring.ring);
-	tb_ring_start(net->rx_ring.ring);
+	ret = tb_ring_start(net->tx_ring.ring);
+	if (ret) {
+		netdev_dbg(net->dev, "failed to start Tx ring, ret=%d\n", ret);
+		goto err_release_hopid;
+	}
+	ret = tb_ring_start(net->rx_ring.ring);
+	if (ret) {
+		netdev_dbg(net->dev, "failed to start Rx ring, ret=%d\n", ret);
+		goto err_stop_tx;
+	}

 	ret = tbnet_alloc_rx_buffers(net, TBNET_RING_SIZE);
 	if (ret)
@@ -701,7 +709,9 @@ static void tbnet_connected_work(struct work_struct *work)
 	tbnet_free_buffers(&net->rx_ring);
 err_stop_rings:
 	tb_ring_stop(net->rx_ring.ring);
+err_stop_tx:
 	tb_ring_stop(net->tx_ring.ring);
+err_release_hopid:
 	tb_xdomain_release_in_hopid(net->xd, net->remote_transmit_path);
 	tbnet_connect_failed(net);
 }
diff --git a/drivers/thunderbolt/ctl.c b/drivers/thunderbolt/ctl.c
index 965988b18608..94b29430ffe4 100644
--- a/drivers/thunderbolt/ctl.c
+++ b/drivers/thunderbolt/ctl.c
@@ -728,10 +728,27 @@ void tb_ctl_free(struct tb_ctl *ctl)
  */
 void tb_ctl_start(struct tb_ctl *ctl)
 {
-	int i;
+	int i, ret;
 	tb_ctl_dbg(ctl, "control channel starting...\n");
-	tb_ring_start(ctl->tx); /* is used to ack hotplug packets, start first */
-	tb_ring_start(ctl->rx);
+
+	/*
+	 * TX is used to ack hotplug packets so start it first. -ENODEV
+	 * means the host controller itself is already gone (expected on
+	 * an unplug-during-suspend resume), so do not warn about that.
+	 */
+	ret = tb_ring_start(ctl->tx);
+	if (ret) {
+		if (ret != -ENODEV)
+			tb_ctl_WARN(ctl, "failed to start TX ring\n");
+		return;
+	}
+	ret = tb_ring_start(ctl->rx);
+	if (ret) {
+		if (ret != -ENODEV)
+			tb_ctl_WARN(ctl, "failed to start RX ring\n");
+		tb_ring_stop(ctl->tx);
+		return;
+	}
 	for (i = 0; i < TB_CTL_RX_PKG_COUNT; i++)
 		tb_ctl_rx_submit(ctl->rx_packets[i]);

diff --git a/drivers/thunderbolt/dma_test.c b/drivers/thunderbolt/dma_test.c
index bcecb0edcb81..e9c01bcfedf9 100644
--- a/drivers/thunderbolt/dma_test.c
+++ b/drivers/thunderbolt/dma_test.c
@@ -203,12 +203,36 @@ static int dma_test_start_rings(struct dma_test *dt)
 		return ret;
 	}

-	if (dt->tx_ring)
-		tb_ring_start(dt->tx_ring);
-	if (dt->rx_ring)
-		tb_ring_start(dt->rx_ring);
+	if (dt->tx_ring) {
+		ret = tb_ring_start(dt->tx_ring);
+		if (ret)
+			goto err_disable_paths;
+	}
+	if (dt->rx_ring) {
+		ret = tb_ring_start(dt->rx_ring);
+		if (ret)
+			goto err_stop_tx;
+	}

 	return 0;
+
+err_stop_tx:
+	tb_xdomain_disable_paths(dt->xd, dt->tx_hopid,
+				 dt->tx_ring ? dt->tx_ring->hop : -1,
+				 dt->rx_hopid,
+				 dt->rx_ring ? dt->rx_ring->hop : -1);
+	if (dt->tx_ring)
+		tb_ring_stop(dt->tx_ring);
+	goto err_free;
+err_disable_paths:
+	tb_xdomain_disable_paths(dt->xd, dt->tx_hopid,
+				 dt->tx_ring ? dt->tx_ring->hop : -1,
+				 dt->rx_hopid,
+				 dt->rx_ring ? dt->rx_ring->hop : -1);
+err_free:
+	dma_test_free_rings(dt);
+
+	return ret;
 }

 static void dma_test_stop_rings(struct dma_test *dt)
diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index e99a3fcc4a29..1960fa30e13a 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -741,18 +741,24 @@ EXPORT_SYMBOL_GPL(tb_ring_alloc_rx);
  * @ring: Ring to start
  *
  * Must not be invoked in parallel with tb_ring_stop().
+ *
+ * Returns %0 on success and negative errno in case of failure.
  */
-void tb_ring_start(struct tb_ring *ring)
+int tb_ring_start(struct tb_ring *ring)
 {
 	u16 frame_size;
+	int ret = 0;
 	u32 flags;

 	spin_lock_irq(&ring->nhi->lock);
 	spin_lock(&ring->lock);
-	if (ring->nhi->going_away)
+	if (ring->nhi->going_away) {
+		ret = -ENODEV;
 		goto err;
+	}
 	if (ring->running) {
 		dev_WARN(ring->nhi->dev, "ring already started\n");
+		ret = -EBUSY;
 		goto err;
 	}
 	dev_dbg(ring->nhi->dev, "starting %s %d\n",
@@ -810,6 +816,8 @@ void tb_ring_start(struct tb_ring *ring)
 err:
 	spin_unlock(&ring->lock);
 	spin_unlock_irq(&ring->nhi->lock);
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(tb_ring_start);

diff --git a/drivers/thunderbolt/stream.c b/drivers/thunderbolt/stream.c
index 4f9a57b77bfa..48b7e3f01312 100644
--- a/drivers/thunderbolt/stream.c
+++ b/drivers/thunderbolt/stream.c
@@ -259,6 +259,9 @@ static void tbstream_ring_free(struct tbstream_ring *ring)
 	enum dma_data_direction dir;
 	int i;

+	if (!ring->frames)
+		return;
+
 	if (ring->ring->is_tx)
 		dir = DMA_TO_DEVICE;
 	else
@@ -279,6 +282,7 @@ static void tbstream_ring_free(struct tbstream_ring *ring)
 	ring->prod = 0;
 	ring->cons = 0;
 	kfree(ring->frames);
+	ring->frames = NULL;
 }

 static inline bool tbstream_ring_available(const struct tbstream_ring *ring)
@@ -575,6 +579,9 @@ static int tbstream_dev_send_close(struct tbstream_dev *sdev)
 	struct tbstream_frame *sf;
 	ktime_t timeout;

+	if (!sdev->tx_ring.ring)
+		return -ESHUTDOWN;
+
 	/*
 	 * Wait for the ring to have available slots before we send the
 	 * CLOSE packet.
@@ -645,7 +652,7 @@ static int tbstream_dev_start(struct tbstream_dev *sdev)

 	ret = tbstream_dev_alloc_tx_buffers(sdev);
 	if (ret)
-		goto err_free_tx;
+		goto err_free_tx_buffers;

 	e2e_tx_hop = ring->hop;
 	sof_mask = BIT(TBSTREAM_FRAME_START);
@@ -672,8 +679,12 @@ static int tbstream_dev_start(struct tbstream_dev *sdev)

 	sdev->rx_pending = false;

-	tb_ring_start(sdev->tx_ring.ring);
-	tb_ring_start(sdev->rx_ring.ring);
+	ret = tb_ring_start(sdev->tx_ring.ring);
+	if (ret)
+		goto err_disable_paths;
+	ret = tb_ring_start(sdev->rx_ring.ring);
+	if (ret)
+		goto err_stop_tx;

 	ret = tbstream_dev_alloc_rx_buffers(sdev);
 	if (ret)
@@ -682,13 +693,20 @@ static int tbstream_dev_start(struct tbstream_dev *sdev)

 err_stop:
 	tb_ring_stop(sdev->rx_ring.ring);
+	tbstream_ring_free(&sdev->rx_ring);
+err_stop_tx:
 	tb_ring_stop(sdev->tx_ring.ring);
+err_disable_paths:
+	tb_xdomain_disable_paths(xd, sdev->out_hopid, sdev->tx_ring.ring->hop,
+				 sdev->in_hopid, sdev->rx_ring.ring->hop);
 err_free_rx:
 	tb_ring_free(sdev->rx_ring.ring);
+	sdev->rx_ring.ring = NULL;
 err_free_tx_buffers:
 	tbstream_ring_free(&sdev->tx_ring);
-err_free_tx:
 	tb_ring_free(sdev->tx_ring.ring);
+	sdev->tx_ring.ring = NULL;
+	wake_up_interruptible(&sdev->wait);

 	return ret;
 }
@@ -708,6 +726,10 @@ static void tbstream_dev_stop(struct tbstream_dev *sdev)
 {
 	struct tb_xdomain *xd;

+	/* Starting may have failed and freed the rings already */
+	if (!sdev->tx_ring.ring)
+		return;
+
 	if (sdev->busy_poll) {
 		/*
 		 * When busy polling we must advance the ring ourselves
@@ -742,6 +764,7 @@ static void tbstream_dev_stop(struct tbstream_dev *sdev)
 	tbstream_ring_free(&sdev->tx_ring);
 	tb_ring_free(sdev->tx_ring.ring);
 	sdev->tx_ring.ring = NULL;
+	wake_up_interruptible(&sdev->wait);
 }

 /* Use only with read_iter/write_iter() to handle nowait */
@@ -757,29 +780,6 @@ static int tbstream_dev_lock(struct tbstream_dev *sdev, bool nowait)
 	return 0;
 }

-/* Must not be called with @sdev->lock held */
-static int tbstream_dev_busy_poll_wait(struct tbstream_dev *sdev,
-				       struct tbstream_ring *ring)
-{
-	for (;;) {
-		if (signal_pending(current))
-			return -ERESTARTSYS;
-		if (tb_ring_poll_pending(ring->ring))
-			return 0;
-		/*
-		 * For TX ring we need to check the RX side too because
-		 * it might have received CLOSE packet.
-		 */
-		if (ring == &sdev->tx_ring &&
-		    tb_ring_poll_pending(sdev->rx_ring.ring))
-			return 0;
-		if (tbstream_dev_valid(sdev) != 0 ||
-		    tbstream_dev_closed(sdev) || tbstream_dev_removed(sdev))
-			return 0;
-		cond_resched();
-	}
-}
-
 static bool
 tbstream_dev_has_event(struct tbstream_dev *sdev, struct tbstream_ring *ring)
 {
@@ -796,6 +796,52 @@ tbstream_dev_has_event(struct tbstream_dev *sdev, struct tbstream_ring *ring)
 	return tb_ring_poll_pending(sdev->rx_ring.ring);
 }

+static bool tbstream_dev_ready(struct tbstream_dev *sdev,
+			       struct tbstream_ring *ring)
+{
+	lockdep_assert_held(&sdev->lock);
+
+	/* Starting may have failed and freed the rings already */
+	if (!sdev->tx_ring.ring)
+		return true;
+
+	return tbstream_dev_has_event(sdev, ring) ||
+	       tbstream_dev_close_received(sdev) ||
+	       tb_ring_poll_pending(ring->ring);
+}
+
+/* Must not be called with @sdev->lock held. */
+static int tbstream_dev_wait(struct tbstream_dev *sdev,
+			     struct tbstream_ring *ring)
+{
+	DEFINE_WAIT_FUNC(wait, woken_wake_function);
+	int ret = 0;
+
+	add_wait_queue(&sdev->wait, &wait);
+	for (;;) {
+		bool ready;
+
+		ret = mutex_lock_interruptible(&sdev->lock);
+		if (ret)
+			break;
+		ready = tbstream_dev_ready(sdev, ring);
+		mutex_unlock(&sdev->lock);
+		if (ready)
+			break;
+		if (signal_pending(current)) {
+			ret = -ERESTARTSYS;
+			break;
+		}
+		if (sdev->busy_poll)
+			cond_resched();
+		else
+			/* The wake token bridges the unlocked check-to-sleep gap. */
+			wait_woken(&wait, TASK_INTERRUPTIBLE, MAX_SCHEDULE_TIMEOUT);
+	}
+	remove_wait_queue(&sdev->wait, &wait);
+	return ret;
+}
+
 static ssize_t
 tbstream_dev_fops_read_iter(struct kiocb *kiocb, struct iov_iter *to)
 {
@@ -814,6 +860,11 @@ tbstream_dev_fops_read_iter(struct kiocb *kiocb, struct iov_iter *to)
 		return ret;

 	for (;;) {
+		if (!sdev->tx_ring.ring) {
+			mutex_unlock(&sdev->lock);
+			return -ESHUTDOWN;
+		}
+
 		/* Advance RX completions */
 		tbstream_dev_advance_rx(sdev);

@@ -838,16 +889,9 @@ tbstream_dev_fops_read_iter(struct kiocb *kiocb, struct iov_iter *to)
 		if (nowait)
 			return -EAGAIN;

-		if (sdev->busy_poll) {
-			ret = tbstream_dev_busy_poll_wait(sdev, &sdev->rx_ring);
-			if (ret)
-				return ret;
-		} else {
-			ret = wait_event_interruptible(sdev->wait,
-				tbstream_dev_has_event(sdev, &sdev->rx_ring));
-			if (ret)
-				return ret;
-		}
+		ret = tbstream_dev_wait(sdev, &sdev->rx_ring);
+		if (ret)
+			return ret;

 		ret = tbstream_dev_lock(sdev, nowait);
 		if (ret)
@@ -957,6 +1001,11 @@ tbstream_dev_fops_write_iter(struct kiocb *kiocb, struct iov_iter *from)
 		return ret;

 	for (;;) {
+		if (!sdev->tx_ring.ring) {
+			mutex_unlock(&sdev->lock);
+			return -ESHUTDOWN;
+		}
+
 		/* Advance TX (and RX) completions */
 		tbstream_dev_advance_both(sdev);

@@ -984,17 +1033,9 @@ tbstream_dev_fops_write_iter(struct kiocb *kiocb, struct iov_iter *from)
 		if (nowait)
 			return -EAGAIN;

-		if (sdev->busy_poll) {
-			ret = tbstream_dev_busy_poll_wait(sdev, &sdev->tx_ring);
-			if (ret)
-				return ret;
-		} else {
-			ret = wait_event_interruptible(sdev->wait,
-				tbstream_dev_has_event(sdev, &sdev->tx_ring) ||
-				tbstream_dev_close_received(sdev));
-			if (ret)
-				return ret;
-		}
+		ret = tbstream_dev_wait(sdev, &sdev->tx_ring);
+		if (ret)
+			return ret;

 		ret = tbstream_dev_lock(sdev, nowait);
 		if (ret)
@@ -1041,7 +1082,7 @@ tbstream_dev_fops_poll(struct file *file, struct poll_table_struct *wait)

 	poll_wait(file, &sdev->wait, wait);
 	guard(mutex)(&sdev->lock);
-	if (tbstream_dev_valid(sdev) != 0)
+	if (tbstream_dev_valid(sdev) != 0 || !sdev->tx_ring.ring)
 		return EPOLLHUP | EPOLLERR;

 	/*
@@ -1105,6 +1146,11 @@ static int tbstream_dev_fops_open(struct inode *inode, struct file *file)
 		}
 	}

+	if (sdev->users && !sdev->tx_ring.ring) {
+		ret = -ESHUTDOWN;
+		goto err_unlock;
+	}
+
 	/* Only on first open we allocate rings and enable paths */
 	if (!sdev->users++) {
 		ret = tbstream_dev_start(sdev);
@@ -1136,7 +1182,7 @@ static int tbstream_dev_fops_release(struct inode *inode, struct file *file)
 	struct tbstream_dev *sdev = to_tbstream_dev(file->private_data);

 	mutex_lock(&sdev->lock);
-	if (--sdev->users == 0) {
+	if (--sdev->users == 0 && sdev->tx_ring.ring) {
 		/*
 		 * Advance now in case there is CLOSE waiting in the RX
 		 * ring.
@@ -1884,14 +1930,14 @@ static int __maybe_unused tbstream_suspend(struct device *dev)
 	if (!sg)
 		return 0;

+	mutex_lock(&sg->lock);
 	list_for_each_entry_reverse(sdev, &sg->dev_list, list) {
-		tbstream_dev_get(sdev);
-		/* Stop the stream (if it was open) */
+		mutex_lock(&sdev->lock);
 		if (sdev->users)
 			tbstream_dev_stop(sdev);
-		tbstream_dev_put(sdev);
+		mutex_unlock(&sdev->lock);
 	}
-
+	mutex_unlock(&sg->lock);
 	config_group_put(&sg->group);
 	return 0;
 }
@@ -1902,28 +1948,27 @@ static int __maybe_unused tbstream_resume(struct device *dev)
 	struct tbstream *stream = tb_service_get_drvdata(svc);
 	struct tbstream_group *sg;
 	struct tbstream_dev *sdev;
+	int ret = 0;

 	sg = tbstream_group_find(stream);
 	if (!sg)
 		return 0;

+	mutex_lock(&sg->lock);
 	list_for_each_entry(sdev, &sg->dev_list, list) {
-		tbstream_dev_get(sdev);
+		mutex_lock(&sdev->lock);
 		if (sdev->users) {
-			int ret;
+			int err = tbstream_dev_start(sdev);

-			ret = tbstream_dev_start(sdev);
-			if (ret) {
-				tbstream_dev_put(sdev);
-				config_group_put(&sg->group);
-				return ret;
-			}
+			if (err && !ret)
+				ret = err;
 		}
-		tbstream_dev_put(sdev);
+		mutex_unlock(&sdev->lock);
+		wake_up_interruptible(&sdev->wait);
 	}
-
+	mutex_unlock(&sg->lock);
 	config_group_put(&sg->group);
-	return 0;
+	return ret;
 }

 static const struct dev_pm_ops tbstream_pm_ops = {
diff --git a/include/linux/thunderbolt.h b/include/linux/thunderbolt.h
index 57502da29080..5fce1b67c376 100644
--- a/include/linux/thunderbolt.h
+++ b/include/linux/thunderbolt.h
@@ -672,7 +672,7 @@ struct tb_ring *tb_ring_alloc_rx(struct tb_nhi *nhi, int hop, int size,
 				 unsigned int flags, int e2e_tx_hop,
 				 u16 sof_mask, u16 eof_mask,
 				 void (*start_poll)(void *), void *poll_data);
-void tb_ring_start(struct tb_ring *ring);
+int tb_ring_start(struct tb_ring *ring);
 bool tb_ring_flush(struct tb_ring *ring, unsigned int timeout_msec);
 void tb_ring_stop(struct tb_ring *ring);
 void tb_ring_free(struct tb_ring *ring);
-- 
2.34.1

