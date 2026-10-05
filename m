Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010030.outbound.protection.outlook.com [52.101.201.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B354C77A0;
	Mon,  5 Oct 2026 16:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791218886; cv=fail; b=KcMN0/vGwd5CQgbiwBwW++jgB3cr2mw95585aUBZmrRIjalxFnFN0JCzjKz8WKZOzdYZb79XlaGa9YGjsZ2UbJKBvZHzRxLcMvIFtca0vfNYE/M7gDEccqThqbOAcjie+yoSciVHhxCs3TeMvYOYEcuKltB2aXlWOBSs0RSVVIA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791218886; c=relaxed/simple;
	bh=lTXLk8RYSjX41okSdKDLgrnRfvYb8QRWAfXrSjU3I8c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t0lgvtQ3j6Nz/ZyDeTyh4PV5r8UOLpYtAkxWDU+BecTwUWMn8ECGZaCnzqrMyqTzR/HHLD5tdQ2fCotaVMEtdJC5P6Mf9PSk+pknqZZVlLdiHM1OlOf0TneqdhUbOZ7VzwMj2Q4CoTFy7ke8XX2SBGbEREopJNt8sJnKbGGWDNM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=1XayI1TL; arc=fail smtp.client-ip=52.101.201.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="1XayI1TL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sMmveYaetwszSPkW18GsFGLGFqWIYCmNIkroPWbrp1PAdUAqCSskTa5KknmgCgTppIT/wJWKV0N4G0QId8IrKUHvC+PqV0UIOGr+mQYySyQaJpF8hvP8Me00QSRrlduk5THF+AhyA5Z515OrN9fXNme5515nJQyZzNapDZO+I9Ny/R6EMHn1RLtoivoAsMogHlyUDNW/ew1dlK2Xyq4MvI9te5xO7m/FBWsmtgppgSvPnAvVkvUaCwqFeGQ/ZabUqA1skEMguaXFTPUqY4K3ZpaP+qkH7guukSJNsztHm8/XTlMKD534ClT3+tSXeByhSWcyRY3iKMr+q54T+UWytw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K8sYR8zs9/56nbctACmz5QclNwBwXiyZiyOYMlGA8jU=;
 b=j+wHX+gnGLrZrbQ6Rsg4w9F6VnnTrFH9W4l0K8okFbz9fTNXVYv3RNFqKpfEEHZ07l12mbjoP9zpyThGkjV1YPMhnCIhR3naS7tHT8nLjCMQC+k6n8OlBwCYEPOnCyLHNW5f+PFYDdopC6U4dQu0WwZDndRT/HbC+Q/DDp4AQBffMz3/O3A/z4gbsjRz3qHf4oqTXTqRIPDAjIZ1zdB6qS52CW/JBl1xmwTv5y38ERkQq60vY6DGqbIdgMV+BqbsAQ0Ba/4OVdu/pEW12fu+6qAdBEBINTDazVLnMboQU8FU1jgU/cDaa2MPuq+iaXQOvNImdikIDjvOW94gyjIrCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K8sYR8zs9/56nbctACmz5QclNwBwXiyZiyOYMlGA8jU=;
 b=1XayI1TLRBrxjbLjb4so81xfdBTSxtk4L/sAs2VOMGF+1yZhzyDFMk9y5rc1dQsYHJNJGQ84NL5vYB784Mw4VJtKUZI3meGSr4WmOd0DfazlSZGlFOZxBempw0Ub94cmYJETaZ7eH3IejKhAcQNykjQW6/yS9SXFCn+eqBOxPs0=
Received: from CH2PR16CA0003.namprd16.prod.outlook.com (2603:10b6:610:50::13)
 by MW5PR12MB5684.namprd12.prod.outlook.com (2603:10b6:303:1a1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 16:47:57 +0000
Received: from CH01EPF000BE945.namprd02.prod.outlook.com
 (2603:10b6:610:50:cafe::a5) by CH2PR16CA0003.outlook.office365.com
 (2603:10b6:610:50::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Mon, 5
 Oct 2026 16:47:57 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH01EPF000BE945.mail.protection.outlook.com (10.167.244.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Mon, 5 Oct 2026 16:47:57 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 5 Oct
 2026 11:47:52 -0500
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: Andreas Noever <andreas.noever@gmail.com>, Mika Westerberg
	<westeri@kernel.org>, Yehezkel Bernat <YehezkelShB@gmail.com>, "Jonathan
 Corbet" <corbet@lwn.net>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S .
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
CC: <linux-usb@vger.kernel.org>, <linux-doc@vger.kernel.org>, "Mario
 Limonciello" <Mario.Limonciello@amd.com>, Sanath S <Sanath.S@amd.com>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH -next v2 1/3] thunderbolt: Allow tb_ring_start() to fail
Date: Mon, 5 Oct 2026 22:17:16 +0530
Message-ID: <20261005164718.4166200-2-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261005164718.4166200-1-Basavaraj.Natikar@amd.com>
References: <20261005164718.4166200-1-Basavaraj.Natikar@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH01EPF000BE945:EE_|MW5PR12MB5684:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ed7c78e-1cfc-4d68-c8de-08df230068a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|23010399003|376014|7416014|22082099003|18002099003|5023799004|56012099006|11063799006|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	lK8xtp8VhOb+aBFfAGys850Sc1/KbTV3+d23BplYe9nkP1PHTp3ZgKVcZcfoke6MQlq+vFHEJKiFv2ks2AHlPstZcABj+hMoBwzQ6c+1JiLkr2BzrHOK94ACS143Vr9V5M6ghlOhf8t+IyH2E6sqcw188Amu5oANU/DAc44Tk3RjHewuQEohQyqakBfsSwxJLYtIewGc9rMxCEoFpQqa4DBpfLJxyskCYQXQoy8M/5Gfx7dFLSYXNuDdBa6omUHEREHWQQwGVm7/WVt0bKYuvtRDOdNJfkQNze+IU4i3AdxF/UnqpKwjHc3g4wYAlWu8RfJSL0Rj3MrCxFTQNt0dbOuHAX+OXQPsN4O4dFrlIoRuiZD+C7lFhSpWMdHDKHE/6o0jLmdKBfOGIbErSrMBoDMJBbUF3btA8bllWbRsx4sKnn1+eRqz/OtM2PLItgIh24vVqr1BJ8oK9Bp0RFVGWUnJHPI1KmjugsQBcRjRqDENT6Q4Jt2IJ3WRh8gL8ajpDMVNxL8pZ2kWTfXL5gIkrtjgJRBY5kio1u3cHdUMShJZ6+ik6jnCSZ1gTF+x2Gy8/VJKQkhC/MFQ68UDKv8JyAViGtoSD7LdfB+6IDR2phAZk6ddmOWbeWTrNl6Czi367wk4dkAE6VrJzG1GB+9e0r8BLaWjPvqBntmUW+aFZZT0dJ0uRDdfn7vx74Bbc5AcWZYMKIXDccjAV8hk/VhYMg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(23010399003)(376014)(7416014)(22082099003)(18002099003)(5023799004)(56012099006)(11063799006)(10067099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tPmUQ4CF5YrF8/vJRsH0kBSNXRYd5G6YatE14eyF4/Fu4RSJZFpFsLHdjVFYFKmcmuA0djkdP4J/eHjcb3F+UV7FNqYxVnHza8KSHfeWRsHbeRxb8Xkcv3QMGDb7GTmZ2bUhi78z+8UeqILP1KJtElkQWeUvAa16tJZ9/3RJNl0kc4UMWEf6pLOKbXoDTzzwUN4wFth46QgDGHDcr/0giv3dO+jN1vqKn7DeuRprPw8U78NODbwRjoPe0+guulTdywPyBEmpdf1ONfF+kaYsllOhqibtJzBfx8W4voYr68VdK0ddMCXBISqAETqD74+gVFhm9DDAzl6KLO2ju9whXEUZlNLmmgG2IM2W1TJ6JQ2KxsT8O7ducvDqbfTj/nZWrUiVsn1vORzXK414QzOIhnuhF5vRmqOJMyuJqZuIEbTW45tInRfjNgubkCBhbJvu
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 16:47:57.1747
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ed7c78e-1cfc-4d68-c8de-08df230068a1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH01EPF000BE945.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5684

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
index cd47b627f97b..ef98ef83fd61 100644
--- a/drivers/thunderbolt/ctl.c
+++ b/drivers/thunderbolt/ctl.c
@@ -729,10 +729,27 @@ void tb_ctl_free(struct tb_ctl *ctl)
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
index 6d2be7734a00..c44ec3aa04c5 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -737,18 +737,24 @@ EXPORT_SYMBOL_GPL(tb_ring_alloc_rx);
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
@@ -806,6 +812,8 @@ void tb_ring_start(struct tb_ring *ring)
 err:
 	spin_unlock(&ring->lock);
 	spin_unlock_irq(&ring->nhi->lock);
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(tb_ring_start);
 
diff --git a/drivers/thunderbolt/stream.c b/drivers/thunderbolt/stream.c
index fe88341c4e29..c935122a4a3e 100644
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
@@ -577,6 +581,9 @@ static int tbstream_dev_send_close(struct tbstream_dev *sdev)
 	struct tbstream_frame *sf;
 	ktime_t timeout;
 
+	if (!sdev->tx_ring.ring)
+		return -ESHUTDOWN;
+
 	/*
 	 * Wait for the ring to have available slots before we send the
 	 * CLOSE packet.
@@ -647,7 +654,7 @@ static int tbstream_dev_start(struct tbstream_dev *sdev)
 
 	ret = tbstream_dev_alloc_tx_buffers(sdev);
 	if (ret)
-		goto err_free_tx;
+		goto err_free_tx_buffers;
 
 	e2e_tx_hop = ring->hop;
 	sof_mask = BIT(TBSTREAM_FRAME_START);
@@ -674,8 +681,12 @@ static int tbstream_dev_start(struct tbstream_dev *sdev)
 
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
@@ -684,13 +695,20 @@ static int tbstream_dev_start(struct tbstream_dev *sdev)
 
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
@@ -710,6 +728,10 @@ static void tbstream_dev_stop(struct tbstream_dev *sdev)
 {
 	struct tb_xdomain *xd;
 
+	/* Starting may have failed and freed the rings already */
+	if (!sdev->tx_ring.ring)
+		return;
+
 	if (sdev->busy_poll) {
 		/*
 		 * When busy polling we must advance the ring ourselves
@@ -744,6 +766,7 @@ static void tbstream_dev_stop(struct tbstream_dev *sdev)
 	tbstream_ring_free(&sdev->tx_ring);
 	tb_ring_free(sdev->tx_ring.ring);
 	sdev->tx_ring.ring = NULL;
+	wake_up_interruptible(&sdev->wait);
 }
 
 /* Use only with read_iter/write_iter() to handle nowait */
@@ -759,29 +782,6 @@ static int tbstream_dev_lock(struct tbstream_dev *sdev, bool nowait)
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
@@ -798,6 +798,52 @@ tbstream_dev_has_event(struct tbstream_dev *sdev, struct tbstream_ring *ring)
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
@@ -816,6 +862,11 @@ tbstream_dev_fops_read_iter(struct kiocb *kiocb, struct iov_iter *to)
 		return ret;
 
 	for (;;) {
+		if (!sdev->tx_ring.ring) {
+			mutex_unlock(&sdev->lock);
+			return -ESHUTDOWN;
+		}
+
 		/* Advance RX completions */
 		tbstream_dev_advance_rx(sdev);
 
@@ -840,16 +891,9 @@ tbstream_dev_fops_read_iter(struct kiocb *kiocb, struct iov_iter *to)
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
@@ -959,6 +1003,11 @@ tbstream_dev_fops_write_iter(struct kiocb *kiocb, struct iov_iter *from)
 		return ret;
 
 	for (;;) {
+		if (!sdev->tx_ring.ring) {
+			mutex_unlock(&sdev->lock);
+			return -ESHUTDOWN;
+		}
+
 		/* Advance TX (and RX) completions */
 		tbstream_dev_advance_both(sdev);
 
@@ -986,17 +1035,9 @@ tbstream_dev_fops_write_iter(struct kiocb *kiocb, struct iov_iter *from)
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
@@ -1043,7 +1084,7 @@ tbstream_dev_fops_poll(struct file *file, struct poll_table_struct *wait)
 
 	poll_wait(file, &sdev->wait, wait);
 	guard(mutex)(&sdev->lock);
-	if (tbstream_dev_valid(sdev) != 0)
+	if (tbstream_dev_valid(sdev) != 0 || !sdev->tx_ring.ring)
 		return EPOLLHUP | EPOLLERR;
 
 	/*
@@ -1107,6 +1148,11 @@ static int tbstream_dev_fops_open(struct inode *inode, struct file *file)
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
@@ -1135,7 +1181,7 @@ static int tbstream_dev_fops_release(struct inode *inode, struct file *file)
 	struct tbstream_dev *sdev = to_tbstream_dev(file->private_data);
 
 	mutex_lock(&sdev->lock);
-	if (--sdev->users == 0) {
+	if (--sdev->users == 0 && sdev->tx_ring.ring) {
 		/*
 		 * Advance now in case there is CLOSE waiting in the RX
 		 * ring.
@@ -1883,14 +1929,14 @@ static int __maybe_unused tbstream_suspend(struct device *dev)
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
@@ -1901,28 +1947,27 @@ static int __maybe_unused tbstream_resume(struct device *dev)
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
index 577bcf6e3810..598357b048af 100644
--- a/include/linux/thunderbolt.h
+++ b/include/linux/thunderbolt.h
@@ -669,7 +669,7 @@ struct tb_ring *tb_ring_alloc_rx(struct tb_nhi *nhi, int hop, int size,
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

