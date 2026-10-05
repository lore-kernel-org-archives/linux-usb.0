Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012015.outbound.protection.outlook.com [40.107.209.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B872472F83;
	Mon,  5 Oct 2026 13:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791207869; cv=fail; b=tY0IY+9G91dsJgDvkJ/H3HJ7jLAYrhdQdDRnquE+5FUquKgQRiOpHSU9KT7WjDgd58XnraYhEcR5sSjODvg3OKb2HPbdmYOnWv/mncIlWX8PdODwxd7SmZ3tjIm4An13KpI16qzSwH5YZskOzl03Hjc79VpNJZeV0JHKp6K5u9I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791207869; c=relaxed/simple;
	bh=2Jvh0PtYPei68ROwg28LrpNxsiwO+U0k9evcBRVEI58=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E84hAjtmTlNbSC+R1W5vWEvG48OWfcIfaXg1mkW64/itIQlCUTwaHcfXX9y0V6igtDEcp4rLQfZ3EUcOiKy93L5L2p1wB2NbfJVGEvvplC3i+moWSudvwQY6HIhgJ7KzAjHAvUSkS0g83TnPDR9ac3niD2QT3TsidZfF6qN1GJM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=uP8tmUxO; arc=fail smtp.client-ip=40.107.209.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="uP8tmUxO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ChRUXprKUNK2B30B69zpMYBLxSRD5drhq6duX6u/by4eyd3+e0Nouk4SbMYUo5B1alEjgVJ01aVPECqVrHxfysucA5+a6Kwjw/3Au4dlr3cBjdyarM3xxbE38DfkvSypjRCD7tW9ANDLQiek975YDiBJsxmb+/rJ8PR77X2Dx/C1bBNqLi7wRRk9BLj+1p0n0zDjLyYVABsPFIWob6ToTPxtg3wtuRLR3Zr1zXVSOMu9b0BzhccnnusEkl2NGkSbG7ScyhFZHnhaz/OlJdPxooTSLSjMcom2dpO04q2jID4yU5BNsUgGH6e7/DrZ9JXZScpZNtraKNldUYvZxD8tmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1/2u2ht7PsmF0ZyBR8zxRs4JPXbQwVw8maNgE6icbjI=;
 b=rBowBIXY/McAlksr5Q9gIiIim9pAc9cv3bb3Dy6InJ72KjxvhN7SOYkrhix1378sF1oOJK37yrBCEB88aL1Rww3LE/+GBtTCVwpzYrNjNrvsUIxCnd4WEFFFRkGwI0VwZEV8GevBmM4jx4vNZtylongYw5uC9HmhEOej6zkQA4PDytwxpqa4NWPTNdslT6UdaBDfJlvNlzmnbYN2G7nd696yPu4jIzOYmW/rKCp5LFU1Wua1ybcTsuyVJQ00EWSR6glNXs8SR4kUNpEVp8srsYDBbnTpdcAfJ44a2FmdOOubhqedgRAMS5rfOdwCMytC4VHsUuhnYJDNatxdibWNWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1/2u2ht7PsmF0ZyBR8zxRs4JPXbQwVw8maNgE6icbjI=;
 b=uP8tmUxOyS2udsWyORfU/FIIY+Kuqn1Aa2VeH97aLppfHBp/Cx+zdWUGW6SgstQ6cVp0puZrj6ObnHby5axOyIFK6BNhAyI+NYT7kmJVDS+OSRMY2Npd4rrGH/6TChAsv7Lw1ZLnP0IHQfLCuZ1Ajc8Dj/mhyujKpmIRJ1D6HSI=
Received: from CH0PR04CA0049.namprd04.prod.outlook.com (2603:10b6:610:77::24)
 by CH3PR12MB7644.namprd12.prod.outlook.com (2603:10b6:610:14f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Mon, 5 Oct
 2026 13:44:16 +0000
Received: from DM2PEPF00003FC2.namprd04.prod.outlook.com
 (2603:10b6:610:77:cafe::50) by CH0PR04CA0049.outlook.office365.com
 (2603:10b6:610:77::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Mon, 5
 Oct 2026 13:44:16 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DM2PEPF00003FC2.mail.protection.outlook.com (10.167.23.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Mon, 5 Oct 2026 13:44:16 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 5 Oct
 2026 08:44:11 -0500
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: Andreas Noever <andreas.noever@gmail.com>, Mika Westerberg
	<westeri@kernel.org>, Yehezkel Bernat <YehezkelShB@gmail.com>, "Jonathan
 Corbet" <corbet@lwn.net>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S .
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
CC: <linux-usb@vger.kernel.org>, <linux-doc@vger.kernel.org>, "Mario
 Limonciello" <Mario.Limonciello@amd.com>, Sanath S <Sanath.S@amd.com>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Mika Westerberg
	<mika.westerberg@linux.intel.com>
Subject: [PATCH 2/3] thunderbolt: Reset the host interface before reusing a DMA HopID
Date: Mon, 5 Oct 2026 19:13:40 +0530
Message-ID: <a7e066c3da8e1a92fb018008861775b33909ab0a.1790854235.git.Basavaraj.Natikar@amd.com>
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
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC2:EE_|CH3PR12MB7644:EE_
X-MS-Office365-Filtering-Correlation-Id: cfc321b6-755c-43d9-9029-08df22e6bfce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|7416014|23010399003|1800799024|36860700016|3023799007|56012099006|6133799003|11063799006|10067099003|5023799004|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	LXhQVUuAGnDwT0N8FDRGYGAZakfD8zKNq6OHS5ZDpEbcSHN8eV7rh/7diUPa3hlqalACI0ExGLR0M+dTr2K1kYGqqPs0TTL548w/wWCIEdnU65xqdfDv3w4UNv3wa22GavKP0aSPhtHI8k2METh0Rz3WbuMjx5p0DnnylQNf2wNFyaIS4xL4f3QSXCtqZlnLMo4ixUmgoo0ggzHL6S1bSSfwP/n35M2LYKOi/gNMBu0hLYo9ImuFOW3xm+sEp0x0JQZcDWcsgkXpbV8RTswFRs5mS8d1Rl0iSXN+HW5PK4fu32SyqFbg/YXJ7D5d1D1Z553HYhfanwNg7/dpcUezsO0GL0uX/pcVp2pJ4av+XorhRUIkFZCk55JXAXdZp9+ob3U3mkYAOZ7tfMClOYxJW4DkKYxHwFzKWyb4K3/IZkRTl3ajWw26Cp8lCxeEEaqYWNoBybHNs9f3EI6vEYD8gg9qSitbPkOAhqrCpKiQoPWsm44caTV/lnIn1L3cREf8kD43v4bBZoezjYb2JBv0Aefl0pjUNMZJsWgL2nFaEQAmnXEQxARKq843zL5dAB2FWj30fBUxXeoICQWeKaG8d7f66MxTfyl+PTSxzgfEfsUlHY2L+t/VX60Dtwfywrohu/y3Ra6IUeZSE3SO6ScrJFjfZ7E+Gvore9pI9i26YWQ=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(7416014)(23010399003)(1800799024)(36860700016)(3023799007)(56012099006)(6133799003)(11063799006)(10067099003)(5023799004)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zyQjFyyZ/VnmuawXGu9lOliYKktsWN+W+GIrjz1Cf4fBCahbu8dmozg3V6jEUphbhU9h0TOHiXxOXYJqBSOWH7+7lY/5rdgx59GCWqcsNWdHswnlquu2fRwvTP44sMy4eqZXXR8GrzwR0DKE3QS7x32/fucbJlmFUYBrjptfi37En3DDMkvazgeGcuAmtPCFJoEewVtamQGqZPosgpOrQ+C5d6UFobMkRKpIXdKI++0UyuJ9lRAZXu3kvwWCL8nkT+u9N2gs+c4pwDi5LN/yoyhmx4tU9l4wOUjLpUkfHgK6PMikVkybVRphtT9duRYXi7GekUHLac+IF3l4w9QA91vFBLFmN7ITSIjx4C9Z/EQqJeJEsbqjeqOs3gniVdfXHa0sCq+YYNz+ggO4/DgrNfDI4KQEddAvHvG3HlPUfu7fm2a3a2jQikuuP2wLxjJS
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 13:44:16.4955
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cfc321b6-755c-43d9-9029-08df22e6bfce
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM2PEPF00003FC2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7644

Reusing a DMA HopID without an intervening host interface reset can hang
the TX ring on some host routers. Resetting on every DMA tunnel teardown
clears the state but, as the reset affects all rings, also disturbs
unrelated active tunnels.

Hence, track the DMA HopIDs programmed since the last reset, prefer unused
HopIDs when allocating rings, and check for reuse at tb_ring_start() too,
since networking retains its rings across reconnect. Return -EAGAIN instead
of programming a HopID that still needs a reset.

Run the reset from a work item once all DMA rings are idle: serialize it
with the connection manager, stop the control channel around it, and block
DMA rings from starting during the reset. Fence the work across domain
removal and PM transitions, preserve live DMA rings across freeze/thaw, and
restore the interrupt-mask shadow under the NHI lock after the reset.

On -EAGAIN, retry the networking login asynchronously and block the work
producers before teardown cancels the workers. Keep peer disconnection
separate from administrative shutdown so it cannot reopen the login gate,
while stream and DMA-test callers unwind immediately and return the error
to userspace.

Enable this only for reset-capable host interfaces marked with
QUIRK_RESET_DMA_ON_REUSE. A competing DMA tunnel must stop before its dirty
HopID can be reused, and retrying does not interrupt that tunnel.

Suggested-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Link: https://lore.kernel.org/linux-usb/20260831130638.GK124825@black.igk.intel.com/T/#m668c2efcfe2f298632537721d72b17445b39211a
Co-developed-by: Sanath S <Sanath.S@amd.com>
Signed-off-by: Sanath S <Sanath.S@amd.com>
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---

 Documentation/admin-guide/thunderbolt.rst |   6 +
 drivers/net/thunderbolt/main.c            | 106 ++++++----
 drivers/thunderbolt/ctl.c                 |  13 ++
 drivers/thunderbolt/ctl.h                 |   1 +
 drivers/thunderbolt/domain.c              |  66 +++++-
 drivers/thunderbolt/nhi.c                 | 239 ++++++++++++++++++++--
 drivers/thunderbolt/nhi.h                 |   1 +
 drivers/thunderbolt/nhi_regs.h            |   4 +
 include/linux/thunderbolt.h               |  20 ++
 9 files changed, 399 insertions(+), 57 deletions(-)

diff --git a/Documentation/admin-guide/thunderbolt.rst b/Documentation/admin-guide/thunderbolt.rst
index ff25fe853706..5595d307ac86 100644
--- a/Documentation/admin-guide/thunderbolt.rst
+++ b/Documentation/admin-guide/thunderbolt.rst
@@ -410,6 +410,12 @@ transfer data::
   host2 # cat /dev/tbstream0
   host1 # dmesg > /dev/tbstream0

+On affected host interfaces a DMA HopID cannot be reused until the host
+interface has been reset. Opening a stream or starting a DMA test can return
+``EAGAIN`` until all other DMA tunnels stop and the reset completes. Retry
+the complete operation; it does not interrupt an active networking tunnel.
+If stream resume fails, close and reopen the stream to retry setup.
+
 Once you are done with the stream you can remove them::

   host2 # cd /sys/kernel/config/thunderbolt/stream
diff --git a/drivers/net/thunderbolt/main.c b/drivers/net/thunderbolt/main.c
index 93ccccc5cf8b..f2dbb6fb30c6 100644
--- a/drivers/net/thunderbolt/main.c
+++ b/drivers/net/thunderbolt/main.c
@@ -160,6 +160,9 @@ struct tbnet_ring {
  * @login_sent: ThunderboltIP login message successfully sent
  * @login_received: ThunderboltIP login message received from the remote
  *		    host
+ * @stopping: Administrative teardown blocks all connection work
+ * @disconnecting: Peer logout blocks login until teardown completes
+ * @connected: DMA rings and paths were successfully enabled
  * @local_transmit_path: HopID we are using to send out packets
  * @remote_transmit_path: HopID the other end is using to send packets to us
  * @connection_lock: Lock serializing access to @login_sent,
@@ -190,6 +193,9 @@ struct tbnet {
 	atomic_t command_id;
 	bool login_sent;
 	bool login_received;
+	bool stopping;
+	bool disconnecting;
+	bool connected;
 	int local_transmit_path;
 	int remote_transmit_path;
 	struct mutex connection_lock;
@@ -311,17 +317,21 @@ static void start_login(struct tbnet *net)
 {
 	netdev_dbg(net->dev, "login started\n");

-	mutex_lock(&net->connection_lock);
+	guard(mutex)(&net->connection_lock);
 	net->login_sent = false;
 	net->login_received = false;
-	mutex_unlock(&net->connection_lock);
-
+	net->stopping = false;
+	net->disconnecting = false;
 	queue_delayed_work(system_long_wq, &net->login_work,
 			   msecs_to_jiffies(1000));
 }

 static void stop_login(struct tbnet *net)
 {
+	scoped_guard(mutex, &net->connection_lock)
+		net->stopping = true;
+
+	cancel_work_sync(&net->disconnect_work);
 	cancel_delayed_work_sync(&net->login_work);
 	cancel_work_sync(&net->connected_work);

@@ -371,11 +381,7 @@ static void tbnet_tear_down(struct tbnet *net, bool send_logout)
 	netif_carrier_off(net->dev);
 	netif_stop_queue(net->dev);

-	stop_login(net);
-
-	mutex_lock(&net->connection_lock);
-
-	if (net->login_sent && net->login_received) {
+	if (net->connected) {
 		int ret, retries = TBNET_LOGOUT_RETRIES;

 		while (send_logout && retries-- > 0) {
@@ -413,13 +419,13 @@ static void tbnet_tear_down(struct tbnet *net, bool send_logout)
 		net->remote_transmit_path = 0;
 	}

+	guard(mutex)(&net->connection_lock);
+	net->connected = false;
 	net->login_retries = 0;
 	net->login_sent = false;
 	net->login_received = false;

 	netdev_dbg(net->dev, "network traffic stopped\n");
-
-	mutex_unlock(&net->connection_lock);
 }

 static int tbnet_handle_packet(const void *buf, size_t size, void *data)
@@ -459,7 +465,11 @@ static int tbnet_handle_packet(const void *buf, size_t size, void *data)
 		if (!ret) {
 			netdev_dbg(net->dev, "remote login response sent\n");

-			mutex_lock(&net->connection_lock);
+			guard(mutex)(&net->connection_lock);
+			if (net->stopping || net->disconnecting ||
+			    (net->login_received &&
+			     net->remote_transmit_path != pkg->transmit_path))
+				break;
 			net->login_received = true;
 			net->remote_transmit_path = pkg->transmit_path;

@@ -473,8 +483,6 @@ static int tbnet_handle_packet(const void *buf, size_t size, void *data)
 				queue_delayed_work(system_long_wq,
 						   &net->login_work, 0);
 			}
-			mutex_unlock(&net->connection_lock);
-
 			queue_work(system_long_wq, &net->connected_work);
 		}
 		break;
@@ -484,7 +492,12 @@ static int tbnet_handle_packet(const void *buf, size_t size, void *data)
 		ret = tbnet_logout_response(net, route, sequence, command_id);
 		if (!ret) {
 			netdev_dbg(net->dev, "remote logout response sent\n");
-			queue_work(system_long_wq, &net->disconnect_work);
+			guard(mutex)(&net->connection_lock);
+			if (netif_running(net->dev) && !net->stopping &&
+			    !net->disconnecting) {
+				net->disconnecting = true;
+				queue_work(system_long_wq, &net->disconnect_work);
+			}
 		}
 		break;

@@ -644,9 +657,9 @@ static void tbnet_connected_work(struct work_struct *work)
 	if (netif_carrier_ok(net->dev))
 		return;

-	mutex_lock(&net->connection_lock);
-	connected = net->login_sent && net->login_received;
-	mutex_unlock(&net->connection_lock);
+	scoped_guard(mutex, &net->connection_lock)
+		connected = !net->stopping && !net->disconnecting &&
+			    net->login_sent && net->login_received;

 	if (!connected)
 		return;
@@ -697,8 +710,13 @@ static void tbnet_connected_work(struct work_struct *work)
 		goto err_free_tx_buffers;
 	}

-	netif_carrier_on(net->dev);
-	netif_start_queue(net->dev);
+	scoped_guard(mutex, &net->connection_lock) {
+		net->connected = true;
+		if (!net->stopping && !net->disconnecting) {
+			netif_carrier_on(net->dev);
+			netif_start_queue(net->dev);
+		}
+	}

 	netdev_dbg(net->dev, "network traffic started\n");
 	return;
@@ -714,24 +732,34 @@ static void tbnet_connected_work(struct work_struct *work)
 err_release_hopid:
 	tb_xdomain_release_in_hopid(net->xd, net->remote_transmit_path);
 	tbnet_connect_failed(net);
+	if (ret == -EAGAIN) {
+		guard(mutex)(&net->connection_lock);
+		if (!net->stopping && !net->disconnecting)
+			queue_delayed_work(system_long_wq, &net->login_work,
+					   msecs_to_jiffies(TBNET_LOGIN_DELAY));
+	}
 }

 static void tbnet_login_work(struct work_struct *work)
 {
 	struct tbnet *net = container_of(work, typeof(*net), login_work.work);
 	unsigned long delay = msecs_to_jiffies(TBNET_LOGIN_DELAY);
-	int ret;
-
-	if (netif_carrier_ok(net->dev))
-		return;
+	int ret, retries;

-	netdev_dbg(net->dev, "sending login request, retries=%u\n",
-		   net->login_retries);
+	scoped_guard(mutex, &net->connection_lock) {
+		if (net->stopping || net->disconnecting || net->connected)
+			return;
+		retries = net->login_retries;
+	}

-	ret = tbnet_login_request(net, net->login_retries % 4);
+	netdev_dbg(net->dev, "sending login request, retries=%u\n", retries);
+	ret = tbnet_login_request(net, retries % 4);
 	if (ret) {
 		netdev_dbg(net->dev, "sending login request failed, ret=%d\n",
 			   ret);
+		guard(mutex)(&net->connection_lock);
+		if (net->stopping || net->disconnecting)
+			return;
 		if (net->login_retries++ < TBNET_LOGIN_RETRIES) {
 			queue_delayed_work(system_long_wq, &net->login_work,
 					   delay);
@@ -741,13 +769,12 @@ static void tbnet_login_work(struct work_struct *work)
 	} else {
 		netdev_dbg(net->dev, "received login reply\n");

-		net->login_retries = 0;
-
-		mutex_lock(&net->connection_lock);
-		net->login_sent = true;
-		mutex_unlock(&net->connection_lock);
-
-		queue_work(system_long_wq, &net->connected_work);
+		guard(mutex)(&net->connection_lock);
+		if (!net->stopping && !net->disconnecting) {
+			net->login_retries = 0;
+			net->login_sent = true;
+			queue_work(system_long_wq, &net->connected_work);
+		}
 	}
 }

@@ -755,7 +782,11 @@ static void tbnet_disconnect_work(struct work_struct *work)
 {
 	struct tbnet *net = container_of(work, typeof(*net), disconnect_work);

+	cancel_delayed_work_sync(&net->login_work);
+	cancel_work_sync(&net->connected_work);
 	tbnet_tear_down(net, false);
+	guard(mutex)(&net->connection_lock);
+	net->disconnecting = false;
 }

 static bool tbnet_check_frame(struct tbnet *net, const struct tbnet_frame *tf,
@@ -1008,9 +1039,8 @@ static int tbnet_stop(struct net_device *dev)
 {
 	struct tbnet *net = netdev_priv(dev);

+	stop_login(net);
 	napi_disable(&net->napi);
-
-	cancel_work_sync(&net->disconnect_work);
 	tbnet_tear_down(net, true);

 	tb_ring_free(net->rx_ring.ring);
@@ -1397,6 +1427,7 @@ static int tbnet_probe(struct tb_service *svc)
 	net->svc = svc;
 	net->dev = dev;
 	net->xd = xd;
+	net->stopping = true;

 	tbnet_generate_mac(dev);

@@ -1456,7 +1487,10 @@ static void tbnet_remove(struct tb_service *svc)

 static void tbnet_shutdown(struct tb_service *svc)
 {
-	tbnet_tear_down(tb_service_get_drvdata(svc), true);
+	struct tbnet *net = tb_service_get_drvdata(svc);
+
+	stop_login(net);
+	tbnet_tear_down(net, true);
 }

 static int tbnet_suspend(struct device *dev)
diff --git a/drivers/thunderbolt/ctl.c b/drivers/thunderbolt/ctl.c
index 94b29430ffe4..368b50b1ef2a 100644
--- a/drivers/thunderbolt/ctl.c
+++ b/drivers/thunderbolt/ctl.c
@@ -779,6 +779,19 @@ void tb_ctl_stop(struct tb_ctl *ctl)
 	tb_ctl_dbg(ctl, "control channel stopped\n");
 }

+/* Close the enqueue gate only after all existing requests have drained. */
+bool tb_ctl_stop_if_idle(struct tb_ctl *ctl)
+{
+	scoped_guard(mutex, &ctl->request_queue_lock) {
+		if (!ctl->running || !list_empty(&ctl->request_queue))
+			return false;
+		ctl->running = false;
+	}
+
+	tb_ctl_stop(ctl);
+	return true;
+}
+
 /* public interface, commands */

 /**
diff --git a/drivers/thunderbolt/ctl.h b/drivers/thunderbolt/ctl.h
index db1646eb4fd0..a88c61fd628a 100644
--- a/drivers/thunderbolt/ctl.h
+++ b/drivers/thunderbolt/ctl.h
@@ -25,6 +25,7 @@ struct tb_ctl *tb_ctl_alloc(struct tb_nhi *nhi, int index, int timeout_msec,
 			    event_cb cb, void *cb_data);
 void tb_ctl_start(struct tb_ctl *ctl);
 void tb_ctl_stop(struct tb_ctl *ctl);
+bool tb_ctl_stop_if_idle(struct tb_ctl *ctl);
 void tb_ctl_free(struct tb_ctl *ctl);

 /* configuration commands */
diff --git a/drivers/thunderbolt/domain.c b/drivers/thunderbolt/domain.c
index 24611f05b3cd..9b814fe1b68c 100644
--- a/drivers/thunderbolt/domain.c
+++ b/drivers/thunderbolt/domain.c
@@ -314,11 +314,20 @@ const struct bus_type tb_bus_type = {
 	.shutdown = tb_service_shutdown,
 };

+/* Reset work needs tb->lock to finish. */
+static void tb_domain_cancel_nhi_reset(struct tb *tb)
+{
+	lockdep_assert_not_held(&tb->lock);
+	cancel_delayed_work_sync(&tb->nhi->reset_work);
+}
+
 static void tb_domain_release(struct device *dev)
 {
 	struct tb *tb = container_of(dev, struct tb, dev);
 	struct tb_nhi *nhi = tb->nhi;

+	/* The host interface reset runs against this domain */
+	tb_domain_cancel_nhi_reset(tb);
 	tb_ctl_free(tb->ctl);
 	destroy_workqueue(tb->wq);
 	ida_free(&tb_domain_ida, tb->index);
@@ -505,8 +514,14 @@ void tb_domain_remove(struct tb *tb)
 		tb->cm_ops->stop(tb);
 	/* Stop the domain control traffic */
 	tb_ctl_stop(tb->ctl);
+	/* Keep reset_work from restarting it again below */
+	scoped_guard(spinlock_irq, &tb->nhi->lock) {
+		if (tb->nhi->dma_hops_used)
+			tb->nhi->removing = true;
+	}
 	mutex_unlock(&tb->lock);

+	tb_domain_cancel_nhi_reset(tb);
 	flush_workqueue(tb->wq);

 	if (tb->cm_ops->deinit)
@@ -535,10 +550,24 @@ int tb_domain_suspend_noirq(struct tb *tb)
 	mutex_lock(&tb->lock);
 	if (tb->cm_ops->suspend_noirq)
 		ret = tb->cm_ops->suspend_noirq(tb);
-	if (!ret)
+	if (!ret) {
+		/* Keep reset_work from restarting the control channel below */
+		scoped_guard(spinlock_irq, &tb->nhi->lock) {
+			if (tb->nhi->dma_hops_used)
+				tb->nhi->suspended = true;
+		}
 		tb_ctl_stop(tb->ctl);
+	}
 	mutex_unlock(&tb->lock);

+	/*
+	 * Make sure a host interface reset queued by cm_ops->suspend_noirq()
+	 * tearing down a DMA tunnel above either finishes or is cancelled
+	 * outright before the NHI is powered down below - either outcome
+	 * is fine since a dirty bitmap is handled again on resume.
+	 */
+	tb_domain_cancel_nhi_reset(tb);
+
 	return ret;
 }

@@ -556,6 +585,10 @@ int tb_domain_resume_noirq(struct tb *tb)
 	int ret = 0;

 	mutex_lock(&tb->lock);
+	scoped_guard(spinlock_irq, &tb->nhi->lock) {
+		if (tb->nhi->dma_hops_used)
+			tb->nhi->suspended = false;
+	}
 	tb_ctl_start(tb->ctl);
 	if (tb->cm_ops->resume_noirq)
 		ret = tb->cm_ops->resume_noirq(tb);
@@ -576,10 +609,18 @@ int tb_domain_freeze_noirq(struct tb *tb)
 	mutex_lock(&tb->lock);
 	if (tb->cm_ops->freeze_noirq)
 		ret = tb->cm_ops->freeze_noirq(tb);
-	if (!ret)
+	if (!ret) {
+		/* Keep reset_work from restarting the control channel below */
+		scoped_guard(spinlock_irq, &tb->nhi->lock) {
+			if (tb->nhi->dma_hops_used)
+				tb->nhi->suspended = true;
+		}
 		tb_ctl_stop(tb->ctl);
+	}
 	mutex_unlock(&tb->lock);

+	tb_domain_cancel_nhi_reset(tb);
+
 	return ret;
 }

@@ -588,6 +629,10 @@ int tb_domain_thaw_noirq(struct tb *tb)
 	int ret = 0;

 	mutex_lock(&tb->lock);
+	scoped_guard(spinlock_irq, &tb->nhi->lock) {
+		if (tb->nhi->dma_hops_used)
+			tb->nhi->suspended = false;
+	}
 	tb_ctl_start(tb->ctl);
 	if (tb->cm_ops->thaw_noirq)
 		ret = tb->cm_ops->thaw_noirq(tb);
@@ -609,13 +654,30 @@ int tb_domain_runtime_suspend(struct tb *tb)
 		if (ret)
 			return ret;
 	}
+
+	/* Keep reset_work from restarting the control channel below */
+	mutex_lock(&tb->lock);
+	scoped_guard(spinlock_irq, &tb->nhi->lock) {
+		if (tb->nhi->dma_hops_used)
+			tb->nhi->suspended = true;
+	}
 	tb_ctl_stop(tb->ctl);
+	mutex_unlock(&tb->lock);
+
+	tb_domain_cancel_nhi_reset(tb);
+
 	return 0;
 }

 int tb_domain_runtime_resume(struct tb *tb)
 {
+	mutex_lock(&tb->lock);
+	scoped_guard(spinlock_irq, &tb->nhi->lock) {
+		if (tb->nhi->dma_hops_used)
+			tb->nhi->suspended = false;
+	}
 	tb_ctl_start(tb->ctl);
+	mutex_unlock(&tb->lock);
 	if (tb->cm_ops->runtime_resume) {
 		int ret = tb->cm_ops->runtime_resume(tb);
 		if (ret)
diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index 1960fa30e13a..a68ecabadcb5 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -17,6 +17,7 @@
 #include <linux/iommu.h>
 #include <linux/lockdep.h>
 #include <linux/module.h>
+#include <linux/pci.h>
 #include <linux/delay.h>
 #include <linux/property.h>
 #include <linux/string_choices.h>
@@ -175,7 +176,8 @@ static void ring_interrupt_active(struct tb_ring *ring, bool active)
 /*
  * nhi_disable_interrupts() - disable interrupts for all rings
  *
- * Use only during init and shutdown.
+ * During runtime reset the caller must hold nhi->lock.
+ * Init and shutdown callers must exclude concurrent ring operations.
  */
 void nhi_disable_interrupts(struct tb_nhi *nhi)
 {
@@ -513,7 +515,8 @@ void tb_ring_poll_complete(struct tb_ring *ring)

 	spin_lock_irqsave(&ring->nhi->lock, flags);
 	spin_lock(&ring->lock);
-	if (ring->start_poll)
+	if (ring->start_poll && ring->running && !ring->nhi->resetting &&
+	    !ring->nhi->going_away)
 		__ring_interrupt_mask(ring, false);
 	spin_unlock(&ring->lock);
 	spin_unlock_irqrestore(&ring->nhi->lock, flags);
@@ -549,6 +552,84 @@ irqreturn_t ring_msix(int irq, void *data)
 	return IRQ_HANDLED;
 }

+static bool ring_is_dma(const struct tb_ring *ring)
+{
+	return ring->hop >= RING_FIRST_USABLE_HOPID;
+}
+
+/* TX and RX HopIDs are tracked separately */
+static unsigned int nhi_dma_hops_bits(const struct tb_nhi *nhi)
+{
+	return 2 * nhi->hop_count;
+}
+
+static unsigned int nhi_hop_bit(const struct tb_nhi *nhi, bool is_tx,
+				unsigned int hop)
+{
+	return is_tx ? hop : nhi->hop_count + hop;
+}
+
+/* Returns %true if a DMA HopID has been programmed since the last reset */
+static bool nhi_dma_hops_dirty(const struct tb_nhi *nhi)
+{
+	return nhi->dma_hops_used &&
+	       !bitmap_empty(nhi->dma_hops_used, nhi_dma_hops_bits(nhi));
+}
+
+/* Returns %true if the HopID of @ring cannot be programmed again yet */
+static bool ring_needs_reset(const struct tb_ring *ring)
+{
+	const struct tb_nhi *nhi = ring->nhi;
+
+	lockdep_assert_held(&nhi->lock);
+
+	if (!nhi->dma_hops_used || !ring_is_dma(ring))
+		return false;
+
+	return test_bit(nhi_hop_bit(nhi, ring->is_tx, ring->hop),
+			nhi->dma_hops_used);
+}
+
+static bool nhi_dma_rings_running(const struct tb_nhi *nhi)
+{
+	unsigned int i;
+
+	lockdep_assert_held(&nhi->lock);
+
+	/* ring->running is only updated under nhi->lock */
+	for (i = RING_FIRST_USABLE_HOPID; i < nhi->hop_count; i++) {
+		if (nhi->tx_rings[i] && nhi->tx_rings[i]->running)
+			return true;
+		if (nhi->rx_rings[i] && nhi->rx_rings[i]->running)
+			return true;
+	}
+
+	return false;
+}
+
+static int nhi_find_hop(const struct tb_nhi *nhi, const struct tb_ring *ring,
+			unsigned int start_hop, bool skip_used)
+{
+	unsigned int i;
+
+	lockdep_assert_held(&nhi->lock);
+
+	for (i = start_hop; i < nhi->hop_count; i++) {
+		if (skip_used && test_bit(nhi_hop_bit(nhi, ring->is_tx, i),
+					  nhi->dma_hops_used))
+			continue;
+		if (ring->is_tx) {
+			if (!nhi->tx_rings[i])
+				return i;
+		} else {
+			if (!nhi->rx_rings[i])
+				return i;
+		}
+	}
+
+	return -EBUSY;
+}
+
 static int nhi_alloc_hop(struct tb_nhi *nhi, struct tb_ring *ring)
 {
 	unsigned int start_hop = RING_FIRST_USABLE_HOPID;
@@ -566,25 +647,20 @@ static int nhi_alloc_hop(struct tb_nhi *nhi, struct tb_ring *ring)
 	spin_lock_irq(&nhi->lock);

 	if (ring->hop < 0) {
-		unsigned int i;
+		int hop;

 		/*
 		 * Automatically allocate HopID from the non-reserved
-		 * range 1 .. hop_count - 1.
+		 * range 1 .. hop_count - 1, preferring the ones that do
+		 * not need a host interface reset first.
 		 */
-		for (i = start_hop; i < nhi->hop_count; i++) {
-			if (ring->is_tx) {
-				if (!nhi->tx_rings[i]) {
-					ring->hop = i;
-					break;
-				}
-			} else {
-				if (!nhi->rx_rings[i]) {
-					ring->hop = i;
-					break;
-				}
-			}
-		}
+		hop = -EBUSY;
+		if (nhi->dma_hops_used)
+			hop = nhi_find_hop(nhi, ring, start_hop, true);
+		if (hop < 0)
+			hop = nhi_find_hop(nhi, ring, start_hop, false);
+		if (hop >= 0)
+			ring->hop = hop;
 	}

 	if (ring->hop > 0 && ring->hop < start_hop) {
@@ -736,6 +812,73 @@ struct tb_ring *tb_ring_alloc_rx(struct tb_nhi *nhi, int hop, int size,
 }
 EXPORT_SYMBOL_GPL(tb_ring_alloc_rx);

+/*
+ * Brings the registers in the memory BAR back to their default state and
+ * clears the End-to-End Flow Control state. The caller must stop the
+ * control channel over the reset.
+ */
+static void nhi_reset_interface(struct tb_nhi *nhi)
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
+	/* Flush the posted write without accessing the resetting BAR. */
+	pci_read_config_dword(to_pci_dev(nhi->dev), PCI_VENDOR_ID, &val);
+	/* Wait for tHIReset (10 ms) to complete */
+	usleep_range(10000, 20000);
+
+	/* Serialize the interrupt shadow with late polling completions. */
+	scoped_guard(spinlock_irqsave, &nhi->lock)
+		nhi_disable_interrupts(nhi);
+}
+
+/* Cancel only through tb_domain_cancel_nhi_reset(), outside tb->lock. */
+static void nhi_reset_work(struct work_struct *work)
+{
+	struct tb_nhi *nhi = container_of(to_delayed_work(work), struct tb_nhi,
+					  reset_work);
+	struct tb *tb = dev_get_drvdata(nhi->dev);
+
+	/* The connection manager must be blocked over the reset */
+	guard(mutex)(&tb->lock);
+
+	scoped_guard(spinlock_irq, &nhi->lock) {
+		if (nhi->going_away || nhi->removing || nhi->suspended)
+			return;
+		if (bitmap_empty(nhi->dma_hops_used, nhi_dma_hops_bits(nhi)))
+			return;
+		if (nhi_dma_rings_running(nhi))
+			return;
+
+		/* Keep the DMA rings from starting over the reset */
+		nhi->resetting = true;
+	}
+
+	if (!tb_ctl_stop_if_idle(tb->ctl)) {
+		scoped_guard(spinlock_irq, &nhi->lock) {
+			nhi->resetting = false;
+			queue_delayed_work(system_long_wq, &nhi->reset_work,
+					   msecs_to_jiffies(100));
+		}
+		return;
+	}
+	nhi_reset_interface(nhi);
+	tb_ctl_start(tb->ctl);
+
+	scoped_guard(spinlock_irq, &nhi->lock) {
+		bitmap_zero(nhi->dma_hops_used, nhi_dma_hops_bits(nhi));
+		nhi->resetting = false;
+	}
+}
+
 /**
  * tb_ring_start() - enable a ring
  * @ring: Ring to start
@@ -752,7 +895,7 @@ int tb_ring_start(struct tb_ring *ring)

 	spin_lock_irq(&ring->nhi->lock);
 	spin_lock(&ring->lock);
-	if (ring->nhi->going_away) {
+	if (ring->nhi->going_away || ring->nhi->removing) {
 		ret = -ENODEV;
 		goto err;
 	}
@@ -761,6 +904,16 @@ int tb_ring_start(struct tb_ring *ring)
 		ret = -EBUSY;
 		goto err;
 	}
+	if (ring->nhi->dma_hops_used && ring_is_dma(ring) &&
+	    (ring->nhi->suspended || ring->nhi->resetting ||
+	     ring_needs_reset(ring))) {
+		ret = -EAGAIN;
+		if (!ring->nhi->suspended && !ring->nhi->resetting &&
+		    !nhi_dma_rings_running(ring->nhi))
+			queue_delayed_work(system_long_wq,
+					   &ring->nhi->reset_work, 0);
+		goto err;
+	}
 	dev_dbg(ring->nhi->dev, "starting %s %d\n",
 		RING_TYPE(ring), ring->hop);

@@ -813,6 +966,9 @@ int tb_ring_start(struct tb_ring *ring)
 	if (!(ring->flags & RING_FLAG_NO_INTERRUPT))
 		ring_interrupt_active(ring, true);
 	ring->running = true;
+	if (ring->nhi->dma_hops_used && ring_is_dma(ring))
+		__set_bit(nhi_hop_bit(ring->nhi, ring->is_tx, ring->hop),
+			  ring->nhi->dma_hops_used);
 err:
 	spin_unlock(&ring->lock);
 	spin_unlock_irq(&ring->nhi->lock);
@@ -885,6 +1041,11 @@ void tb_ring_stop(struct tb_ring *ring)
 	ring->notify_pending = false;
 	ring->running = false;

+	if (ring->nhi->dma_hops_used && ring_is_dma(ring) &&
+	    !ring->nhi->removing && !ring->nhi->suspended &&
+	    !nhi_dma_rings_running(ring->nhi))
+		queue_delayed_work(system_long_wq, &ring->nhi->reset_work, 0);
+
 err:
 	spin_unlock(&ring->lock);
 	spin_unlock_irq(&ring->nhi->lock);
@@ -1118,10 +1279,28 @@ static int nhi_freeze_noirq(struct device *dev)
 	return tb_domain_freeze_noirq(tb);
 }

+static void nhi_reset_if_idle(struct tb_nhi *nhi)
+{
+	scoped_guard(spinlock_irq, &nhi->lock) {
+		if (nhi->going_away || nhi->removing ||
+		    !nhi_dma_hops_dirty(nhi) || nhi_dma_rings_running(nhi))
+			return;
+		nhi->resetting = true;
+	}
+
+	nhi_reset_interface(nhi);
+	scoped_guard(spinlock_irq, &nhi->lock) {
+		bitmap_zero(nhi->dma_hops_used, nhi_dma_hops_bits(nhi));
+		nhi->resetting = false;
+	}
+}
+
 static int nhi_thaw_noirq(struct device *dev)
 {
 	struct tb *tb = dev_get_drvdata(dev);

+	/* Freeze can preserve live DMA rings. */
+	nhi_reset_if_idle(tb->nhi);
 	return tb_domain_thaw_noirq(tb);
 }

@@ -1166,6 +1345,8 @@ static int nhi_resume_noirq(struct device *dev)
 			return ret;
 	}

+	nhi_reset_if_idle(nhi);
+
 	return tb_domain_resume_noirq(tb);
 }

@@ -1221,6 +1402,8 @@ static int nhi_runtime_resume(struct device *dev)
 			return ret;
 	}

+	nhi_reset_if_idle(nhi);
+
 	return tb_domain_runtime_resume(tb);
 }

@@ -1318,6 +1501,7 @@ int nhi_probe(struct tb_nhi *nhi)
 {
 	struct device *dev = nhi->dev;
 	struct tb *tb;
+	u32 caps;
 	int res;

 	if (!nhi->ops)
@@ -1326,7 +1510,8 @@ int nhi_probe(struct tb_nhi *nhi)
 	if (!nhi->ops->init_interrupts)
 		return dev_err_probe(dev, -EINVAL, "missing required NHI ops\n");

-	nhi->hop_count = ioread32(nhi->iobase + REG_CAPS) & 0x3ff;
+	caps = ioread32(nhi->iobase + REG_CAPS);
+	nhi->hop_count = caps & 0x3ff;
 	dev_dbg(dev, "total paths: %d\n", nhi->hop_count);

 	nhi->tx_rings = devm_kcalloc(dev, nhi->hop_count,
@@ -1339,6 +1524,22 @@ int nhi_probe(struct tb_nhi *nhi)
 	if (!nhi->tx_rings || !nhi->rx_rings || !nhi->interrupt_mask)
 		return -ENOMEM;

+	INIT_DELAYED_WORK(&nhi->reset_work, nhi_reset_work);
+
+	if (nhi->quirks & QUIRK_RESET_DMA_ON_REUSE) {
+		/* Only v1 host interfaces implement the reset */
+		if (FIELD_GET(REG_CAPS_VERSION_MASK, caps) < REG_CAPS_VERSION_2) {
+			nhi->dma_hops_used = devm_bitmap_zalloc(dev,
+								nhi_dma_hops_bits(nhi),
+								GFP_KERNEL);
+			if (!nhi->dma_hops_used)
+				return -ENOMEM;
+		} else {
+			dev_warn(dev,
+				 "reset-on-reuse quirk requires a v1 host interface, disabling\n");
+		}
+	}
+
 	nhi_reset(nhi);

 	/* In case someone left them on. */
diff --git a/drivers/thunderbolt/nhi.h b/drivers/thunderbolt/nhi.h
index 88af9ab9fde7..13cb94cae658 100644
--- a/drivers/thunderbolt/nhi.h
+++ b/drivers/thunderbolt/nhi.h
@@ -123,6 +123,7 @@ struct tb_nhi_ops {
 /* Host interface quirks */
 #define QUIRK_AUTO_CLEAR_INT	BIT(0)
 #define QUIRK_E2E		BIT(1)
+#define QUIRK_RESET_DMA_ON_REUSE	BIT(2)

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
diff --git a/include/linux/thunderbolt.h b/include/linux/thunderbolt.h
index 5fce1b67c376..2d5efc54c0b6 100644
--- a/include/linux/thunderbolt.h
+++ b/include/linux/thunderbolt.h
@@ -515,6 +515,21 @@ void tb_service_properties_changed(struct tb_service *svc);
  *		    MSI-X is used.
  * @hop_count: Number of rings (end point hops) supported by NHI.
  * @quirks: NHI specific quirks if any
+ * @dma_hops_used: Bitmap of the TX and RX DMA HopIDs programmed after the
+ *		   last host interface reset. Only with
+ *		   %QUIRK_RESET_DMA_ON_REUSE.
+ * @resetting: The host interface reset is in progress. Only with
+ *	       %QUIRK_RESET_DMA_ON_REUSE.
+ * @removing: The domain this host interface belongs to is being removed.
+ *            Set before releasing the domain lock so
+ *            reset_work does not restart the control channel while the
+ *            domain is tearing down. Only with %QUIRK_RESET_DMA_ON_REUSE.
+ * @suspended: The domain's control channel is stopped for system or runtime PM.
+ *             Set before the control channel is stopped so reset_work
+ *             does not restart it while the NHI is about to be powered
+ *             down. Only with %QUIRK_RESET_DMA_ON_REUSE.
+ * @reset_work: Work that runs the host interface reset once all the DMA
+ *		rings are idle. Only with %QUIRK_RESET_DMA_ON_REUSE.
  * @domain_released: Completed when domain has been fully released
  * @host_reset: Host router was reset on driver load, or forced on system
  *		shutdown/reboot. When set, tb_stop() asserts DPR on connected
@@ -535,6 +550,11 @@ struct tb_nhi {
 	struct work_struct interrupt_work;
 	u32 hop_count;
 	unsigned long quirks;
+	unsigned long *dma_hops_used;
+	bool resetting;
+	bool removing;
+	bool suspended;
+	struct delayed_work reset_work;
 	struct completion domain_released;
 	bool host_reset;
 };
-- 
2.34.1

