Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795621288;
	b=Iun7bI/WAKqOPUVLofyBlXeSDUZEAMCQnOHuti5HGu/a/3E1rPMnRmZ4XrmyV7hIhz/V
	 2iaNVcQeLVMEW1RHz369Jfo9OlUOgmoNImptCPF6XH1H+UB96fUHeNxZgPyAUdJjOsNM2
	 8xmJaXRpmN7/rsq1U2RIdHxRrMTue41nESZ8LaM1M85H6ce3sJqF7LCpA+o47YtXufRif
	 E73oa23QTDu7TRn6VO60dkKiv1JrYkK4vZcsxnhkDOotX/LRMnVBjjNbNyQ4fay80MU4k
	 JDtDwXFoC6FP6RuCf1CLqtEBmKrIF/7uh8pr2vZzcKk1YAfLNVM9aNu+TuPt84OOYuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795621288;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mrnYh+A3duq26qJF365lMH0U609uM0xrvvNIx0wr4LY=;
	b=gUKcoRhIyMPNzt54sjRshRc73YhGy55PKHe7a7eS8KX9t9tKaHml6QCiUBEpBlb7wI6k
	 2bPHucrb3lkUlX/Wdz4Q3uwNF6Osv7e+ARrjy1b3K5GaQ9nBO4cNrcWnDvkdJy9MUgJsh
	 CQo9AULPIn5v8wGKJG9WFNRTubk+OAmizAHCS4uOA29nKbXeJQpDDsJzhzBw4virQGXSY
	 eg7SU4ei9aaqvgPER05HJTOqL/FfCYZQptL+J6o7SfTr1/JMRMbftew4lRAF2g/oYSfKI
	 4SXGW6rpZ0IQ0cPeTX7RHSO1gKZO5rc7aH687IfuZRyIQRzE9QyCNiAGY7TD0evAx3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UGyAa8Ii;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8952D60A5BC1
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 15:41:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8952D60A5BC1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UGyAa8Ii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795621286; x=1827157286;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bzmP2T/dwH9Yzbi4/gSRF+NIfd5XUFwfGa1uHQ1mXCw=;
  b=UGyAa8IiYpI5uI3Hs+5pZ0X8oJthNvb2n4fE+YGdx2jzEvIuieJTOp77
   IwAg1g554gDv74O1PED7erm8IS0a0giiK/ResqOGFyHm7SNJ1IIPy+nEn
   isCLrMA39gewwwddIwpp+MulNqClRjA+IrsszF2ueS2yJ1hDIassMsu6b
   fkAdRYu+GmX3SMi8d55BC68ToSPJH4fBW4XoPTTyObC+h+sSbS0RK5rMF
   Om8oM1okH7L7SW2sOxtK06hk26i7MpddrMStXAyCcaVCW5hJKealCHphN
   SlH7MdaRC5k2PnmbJRoDdoflXzTKVxQcl2q8JU4A9HVHb+Mk/ynFAp0oh
   w==;
X-CSE-ConnectionGUID: Er7qD7tDTEG+zvhm8zmW9Q==
X-CSE-MsgGUID: DwFvoLGpR4CLwtfsE8xw1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4408786"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4408786"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 07:35:34 -0800
X-CSE-ConnectionGUID: zkQrRBMlRv6aypJRIz8xFg==
X-CSE-MsgGUID: HbIZ5Hn3S9ic94LbZjF0Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="11884789"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa007.jf.intel.com with ESMTP; 25 Nov 2026 07:26:26 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 1BFCEA5; Wed, 25 Nov 2026 16:26:23 +0100 (CET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Mika Westerberg <westeri@kernel.org>
Subject: [PATCH 7/9] thunderbolt: Add tb_xdomains_enable_paths() and tb_xdomains_disable_paths()
Date: Wed, 25 Nov 2026 16:26:20 +0100
Message-ID: <20261125152623.456054-8-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261125152623.456054-1-mika.westerberg@linux.intel.com>
References: <20261125152623.456054-1-mika.westerberg@linux.intel.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Mika Westerberg (Intel)" <westeri@kernel.org>

A DMA tunnel does not need to end at the host interface. Both ends can
be lane adapters as well, in which case the router forwards the packets
from one remote host to the other. Generalize the DMA path handling to
cover this, and provide two new API functions: tb_xdomains_enable_paths()
and tb_xdomains_disable_paths() that can be used to create DMA tunnels
between two XDomains.

While there replace the only place where -ENOTSUPP is returned over
-EOPNOTSUPP.

Signed-off-by: Mika Westerberg (Intel) <westeri@kernel.org>
---
 drivers/thunderbolt/domain.c  |  70 +++++++++-------
 drivers/thunderbolt/icm.c     |  49 +++++++----
 drivers/thunderbolt/tb.c      | 149 +++++++++++++++++++++-------------
 drivers/thunderbolt/tb.h      |  28 ++++---
 drivers/thunderbolt/xdomain.c | 110 +++++++++++++++++++++++--
 include/linux/thunderbolt.h   |   6 ++
 6 files changed, 291 insertions(+), 121 deletions(-)

diff --git a/drivers/thunderbolt/domain.c b/drivers/thunderbolt/domain.c
index 61666e1a9b39..d4094036837e 100644
--- a/drivers/thunderbolt/domain.c
+++ b/drivers/thunderbolt/domain.c
@@ -797,59 +797,69 @@ int tb_domain_disconnect_pcie_paths(struct tb *tb)
 /**
  * tb_domain_approve_xdomain_paths() - Enable DMA paths for XDomain
  * @tb: Domain enabling the DMA paths
- * @xd: XDomain DMA paths are created to
- * @transmit_path: HopID we are using to send out packets
- * @transmit_ring: DMA ring used to send out packets
- * @receive_path: HopID the other end is using to send packets to us
- * @receive_ring: DMA ring used to receive packets from @receive_path
+ * @xd_a: XDomain DMA paths are created to
+ * @a_in_hopid: HopID @xd_a is using to send packets to us
+ * @a_out_hopid: HopID we are using to send packets to @xd_a
+ * @xd_b: The other end of the DMA paths or %NULL if it is the host
+ *	  interface. In the latter case @b_in_hopid and @b_out_hopid are
+ *	  the DMA ring numbers used to send and receive the packets.
+ * @b_in_hopid: HopID @xd_b is using to send packets to us
+ * @b_out_hopid: HopID we are using to send packets to @xd_b
  *
- * Calls connection manager specific method to enable DMA paths to the
- * XDomain in question.
+ * Calls connection manager specific method to enable DMA paths between the
+ * two ends. Passing %-1 as HopID of a direction leaves that direction out.
  *
  * Return:
  * * %0 - On success.
- * * %-ENOTSUPP - If the connection manager implementation does not support
- *   XDomains.
+ * * %-EOPNOTSUPP - If the connection manager implementation does not support
+ *		    XDomains.
  * * Negative errno - An error occurred.
  */
-int tb_domain_approve_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
-				    int transmit_path, int transmit_ring,
-				    int receive_path, int receive_ring)
+int tb_domain_approve_xdomain_paths(struct tb *tb, struct tb_xdomain *xd_a,
+				    int a_in_hopid, int a_out_hopid,
+				    struct tb_xdomain *xd_b, int b_in_hopid,
+				    int b_out_hopid)
 {
 	if (!tb->cm_ops->approve_xdomain_paths)
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 
-	return tb->cm_ops->approve_xdomain_paths(tb, xd, transmit_path,
-			transmit_ring, receive_path, receive_ring);
+	return tb->cm_ops->approve_xdomain_paths(tb, xd_a, a_in_hopid,
+						 a_out_hopid, xd_b, b_in_hopid,
+						 b_out_hopid);
 }
 
 /**
  * tb_domain_disconnect_xdomain_paths() - Disable DMA paths for XDomain
  * @tb: Domain disabling the DMA paths
- * @xd: XDomain whose DMA paths are disconnected
- * @transmit_path: HopID we are using to send out packets
- * @transmit_ring: DMA ring used to send out packets
- * @receive_path: HopID the other end is using to send packets to us
- * @receive_ring: DMA ring used to receive packets from @receive_path
+ * @xd_a: XDomain whose DMA paths are disconnected
+ * @a_in_hopid: HopID @xd_a is using to send packets to us
+ * @a_out_hopid: HopID we are using to send packets to @xd_a
+ * @xd_b: The other end of the DMA paths or %NULL if it is the host
+ *	  interface. In the latter case @b_in_hopid and @b_out_hopid are
+ *	  the DMA ring numbers.
+ * @b_in_hopid: HopID @xd_b is using to send packets to us
+ * @b_out_hopid: HopID we are using to send packets to @xd_b
  *
- * Calls connection manager specific method to disconnect DMA paths to
- * the XDomain in question.
+ * Calls connection manager specific method to disconnect the DMA paths
+ * previously established by tb_domain_approve_xdomain_paths(). Passing %-1
+ * as any of the HopIDs means don't care.
  *
  * Return:
  * * %0 - On success.
- * * %-ENOTSUPP - If the connection manager implementation does not support
- *   XDomains.
+ * * %-EOPNOTSUPP - If the connection manager implementation does not support
+ *		    XDomains.
  * * Negative errno - An error occurred.
  */
-int tb_domain_disconnect_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
-				       int transmit_path, int transmit_ring,
-				       int receive_path, int receive_ring)
+int tb_domain_disconnect_xdomain_paths(struct tb *tb, struct tb_xdomain *xd_a,
+				       int a_in_hopid, int a_out_hopid,
+				       struct tb_xdomain *xd_b, int b_in_hopid,
+				       int b_out_hopid)
 {
 	if (!tb->cm_ops->disconnect_xdomain_paths)
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 
-	return tb->cm_ops->disconnect_xdomain_paths(tb, xd, transmit_path,
-			transmit_ring, receive_path, receive_ring);
+	return tb->cm_ops->disconnect_xdomain_paths(tb, xd_a, a_in_hopid,
+				a_out_hopid, xd_b, b_in_hopid, b_out_hopid);
 }
 
 static int disconnect_xdomain(struct device *dev, void *data)
diff --git a/drivers/thunderbolt/icm.c b/drivers/thunderbolt/icm.c
index a295a5e6cc9c..3237ac54b684 100644
--- a/drivers/thunderbolt/icm.c
+++ b/drivers/thunderbolt/icm.c
@@ -580,13 +580,18 @@ static int icm_fr_challenge_switch_key(struct tb *tb, struct tb_switch *sw,
 }
 
 static int icm_fr_approve_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
-					int transmit_path, int transmit_ring,
-					int receive_path, int receive_ring)
+					int a_in_hopid, int a_out_hopid,
+					struct tb_xdomain *xd_b, int b_in_hopid,
+					int b_out_hopid)
 {
 	struct icm_fr_pkg_approve_xdomain_response reply;
 	struct icm_fr_pkg_approve_xdomain request;
 	int ret;
 
+	/* The firmware can only tunnel to the host interface */
+	if (xd_b)
+		return -EOPNOTSUPP;
+
 	if (atomic_read(&xd->ntunnels) >= 1) {
 		tb_warn(tb, "only one tunnel is supported by the firmware\n");
 		return -EOPNOTSUPP;
@@ -597,10 +602,10 @@ static int icm_fr_approve_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
 	request.link_info = xd->depth << ICM_LINK_INFO_DEPTH_SHIFT | xd->link;
 	memcpy(&request.remote_uuid, xd->remote_uuid, sizeof(*xd->remote_uuid));
 
-	request.transmit_path = transmit_path;
-	request.transmit_ring = transmit_ring;
-	request.receive_path = receive_path;
-	request.receive_ring = receive_ring;
+	request.transmit_path = a_out_hopid;
+	request.transmit_ring = b_in_hopid;
+	request.receive_path = a_in_hopid;
+	request.receive_ring = b_out_hopid;
 
 	memset(&reply, 0, sizeof(reply));
 	ret = icm_request(tb, &request, sizeof(request), &reply, sizeof(reply),
@@ -616,12 +621,16 @@ static int icm_fr_approve_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
 }
 
 static int icm_fr_disconnect_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
-					   int transmit_path, int transmit_ring,
-					   int receive_path, int receive_ring)
+					   int a_in_hopid, int a_out_hopid,
+					   struct tb_xdomain *xd_b,
+					   int b_in_hopid, int b_out_hopid)
 {
 	u8 phy_port;
 	u8 cmd;
 
+	if (xd_b)
+		return -EOPNOTSUPP;
+
 	phy_port = tb_phy_port_from_link(xd->link);
 	if (phy_port == 0)
 		cmd = NHI_MAILBOX_DISCONNECT_PA;
@@ -1156,13 +1165,17 @@ static int icm_tr_challenge_switch_key(struct tb *tb, struct tb_switch *sw,
 }
 
 static int icm_tr_approve_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
-					int transmit_path, int transmit_ring,
-					int receive_path, int receive_ring)
+					int a_in_hopid, int a_out_hopid,
+					struct tb_xdomain *xd_b, int b_in_hopid,
+					int b_out_hopid)
 {
 	struct icm_tr_pkg_approve_xdomain_response reply;
 	struct icm_tr_pkg_approve_xdomain request;
 	int ret;
 
+	if (xd_b)
+		return -EOPNOTSUPP;
+
 	if (atomic_read(&xd->ntunnels) >= 1) {
 		tb_warn(tb, "only one tunnel is supported by the firmware\n");
 		return -EOPNOTSUPP;
@@ -1172,10 +1185,10 @@ static int icm_tr_approve_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
 	request.hdr.code = ICM_APPROVE_XDOMAIN;
 	request.route_hi = upper_32_bits(xd->route);
 	request.route_lo = lower_32_bits(xd->route);
-	request.transmit_path = transmit_path;
-	request.transmit_ring = transmit_ring;
-	request.receive_path = receive_path;
-	request.receive_ring = receive_ring;
+	request.transmit_path = a_out_hopid;
+	request.transmit_ring = b_in_hopid;
+	request.receive_path = a_in_hopid;
+	request.receive_ring = b_out_hopid;
 	memcpy(&request.remote_uuid, xd->remote_uuid, sizeof(*xd->remote_uuid));
 
 	memset(&reply, 0, sizeof(reply));
@@ -1218,11 +1231,15 @@ static int icm_tr_xdomain_tear_down(struct tb *tb, struct tb_xdomain *xd,
 }
 
 static int icm_tr_disconnect_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
-					   int transmit_path, int transmit_ring,
-					   int receive_path, int receive_ring)
+					   int a_in_hopid, int a_out_hopid,
+					   struct tb_xdomain *xd_b,
+					   int b_in_hopid, int b_out_hopid)
 {
 	int ret;
 
+	if (xd_b)
+		return -EOPNOTSUPP;
+
 	ret = icm_tr_xdomain_tear_down(tb, xd, 1);
 	if (ret)
 		return ret;
diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index c7a009a62411..4db25062b5e5 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -87,9 +87,10 @@ struct tb_hotplug_event {
 	int retry;
 };
 
-static void __tb_disconnect_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
-					  int transmit_path, int transmit_ring,
-					  int receive_path, int receive_ring);
+static void __tb_disconnect_dma_paths(struct tb *tb, struct tb_port *port_a,
+				      int a_in_hopid, int a_out_hopid,
+				      struct tb_port *port_b, int b_in_hopid,
+				      int b_out_hopid);
 static void tb_scan_port(struct tb_port *port);
 static void tb_handle_hotplug(struct work_struct *work);
 static void tb_dp_resource_unavailable(struct tb *tb, struct tb_port *port,
@@ -472,7 +473,7 @@ static void tb_remove_xdomain(struct tb_port *port)
 	xd->is_unplugged = true;
 	tb_xdomain_remove(port->xdomain);
 	port->xdomain = NULL;
-	__tb_disconnect_xdomain_paths(tb, xd, -1, -1, -1, -1);
+	__tb_disconnect_dma_paths(tb, port, -1, -1, NULL, -1, -1);
 	tb_port_unconfigure_xdomain(port);
 	tb_xdomain_put(xd);
 }
@@ -2365,44 +2366,97 @@ static int tb_tunnel_pci(struct tb *tb, struct tb_switch *sw)
 	return 0;
 }
 
-static int tb_approve_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
-				    int transmit_path, int transmit_ring,
-				    int receive_path, int receive_ring)
+/*
+ * Tears down the DMA tunnels matching the two ends. Called with @tb->lock
+ * held. See tb_tunnel_match_dma() for the wildcards.
+ */
+static void __tb_disconnect_dma_paths(struct tb *tb, struct tb_port *port_a,
+				      int a_in_hopid, int a_out_hopid,
+				      struct tb_port *port_b, int b_in_hopid,
+				      int b_out_hopid)
 {
 	struct tb_cm *tcm = tb_priv(tb);
-	struct tb_port *nhi_port, *dst_port;
+	struct tb_tunnel *tunnel, *n;
+
+	list_for_each_entry_safe(tunnel, n, &tcm->tunnel_list, list) {
+		struct tb_switch *sw_a, *sw_b;
+
+		if (!tb_tunnel_is_dma(tunnel))
+			continue;
+		if (!tb_tunnel_match_dma(tunnel, port_a, a_in_hopid, a_out_hopid,
+					 port_b, b_in_hopid, b_out_hopid))
+			continue;
+
+		sw_a = tunnel->src_port->sw;
+		sw_b = tunnel->dst_port->sw;
+		tb_deactivate_and_free_tunnel(tunnel);
+
+		/*
+		 * Try to re-enable CL states now, it is OK if this
+		 * fails because we may still have another DMA tunnel
+		 * active through the same router USB4 port.
+		 */
+		tb_enable_clx(sw_a);
+		tb_enable_clx(sw_b);
+	}
+}
+
+/*
+ * Returns the adapter where the DMA paths of @xd end. Passing %NULL means
+ * the host interface.
+ */
+static struct tb_port *tb_xdomain_port(struct tb *tb, struct tb_xdomain *xd)
+{
+	if (!xd)
+		return tb_switch_find_port(tb->root_switch, TB_TYPE_NHI);
+	return tb_xdomain_downstream_port(xd);
+}
+
+static int tb_approve_xdomain_paths(struct tb *tb, struct tb_xdomain *xd_a,
+				    int a_in_hopid, int a_out_hopid,
+				    struct tb_xdomain *xd_b, int b_in_hopid,
+				    int b_out_hopid)
+{
+	struct tb_cm *tcm = tb_priv(tb);
+	struct tb_port *port_a, *port_b;
 	struct tb_tunnel *tunnel;
-	struct tb_switch *sw;
 	int ret;
 
 	mutex_lock(&tb->lock);
 
-	/* The XDomain is going away so no new tunnels allowed */
-	if (xd->is_unplugged) {
+	/* The remote host or hosts need to be still connected */
+	if (xd_a->is_unplugged || (xd_b && xd_b->is_unplugged)) {
 		ret = -ENODEV;
 		goto err_unlock;
 	}
 
-	sw = tb_to_switch(xd->dev.parent);
-	dst_port = tb_port_at(xd->route, sw);
-	nhi_port = tb_switch_find_port(tb->root_switch, TB_TYPE_NHI);
+	port_a = tb_xdomain_port(tb, xd_a);
+	port_b = tb_xdomain_port(tb, xd_b);
 
 	/*
-	 * When tunneling DMA paths the link should not enter CL states
-	 * so disable them now.
+	 * When tunneling DMA paths the links should not enter CL states
+	 * so disable them now. This is a no-op for the host router.
 	 */
-	tb_disable_clx(sw);
+	tb_disable_clx(port_a->sw);
+	tb_disable_clx(port_b->sw);
 
-	tunnel = tb_tunnel_alloc_dma(tb, nhi_port, transmit_ring, receive_ring,
-				     dst_port, receive_path, transmit_path);
+	/*
+	 * Keep the host interface as the first end when it is one of the
+	 * two, the same way as with host-to-host tunnels.
+	 */
+	if (xd_b)
+		tunnel = tb_tunnel_alloc_dma(tb, port_a, a_in_hopid, a_out_hopid,
+					     port_b, b_in_hopid, b_out_hopid);
+	else
+		tunnel = tb_tunnel_alloc_dma(tb, port_b, b_in_hopid, b_out_hopid,
+					     port_a, a_in_hopid, a_out_hopid);
 	if (!tunnel) {
 		ret = -ENOMEM;
 		goto err_clx;
 	}
 
 	if (tb_tunnel_activate(tunnel)) {
-		tb_port_info(nhi_port,
-			     "DMA tunnel activation failed, aborting\n");
+		tb_tunnel_info(tunnel, "tunnel activation failed, aborting\n");
 		ret = -EIO;
 		goto err_free;
 	}
@@ -2414,53 +2468,32 @@ static int tb_approve_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
 err_free:
 	tb_tunnel_put(tunnel);
 err_clx:
-	tb_enable_clx(sw);
+	tb_enable_clx(port_b->sw);
+	tb_enable_clx(port_a->sw);
 err_unlock:
 	mutex_unlock(&tb->lock);
 
 	return ret;
 }
 
-static void __tb_disconnect_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
-					  int transmit_path, int transmit_ring,
-					  int receive_path, int receive_ring)
+static int tb_disconnect_xdomain_paths(struct tb *tb, struct tb_xdomain *xd_a,
+				       int a_in_hopid, int a_out_hopid,
+				       struct tb_xdomain *xd_b, int b_in_hopid,
+				       int b_out_hopid)
 {
-	struct tb_cm *tcm = tb_priv(tb);
-	struct tb_port *nhi_port, *dst_port;
-	struct tb_tunnel *tunnel, *n;
-	struct tb_switch *sw;
-
-	sw = tb_to_switch(xd->dev.parent);
-	dst_port = tb_port_at(xd->route, sw);
-	nhi_port = tb_switch_find_port(tb->root_switch, TB_TYPE_NHI);
-
-	list_for_each_entry_safe(tunnel, n, &tcm->tunnel_list, list) {
-		if (!tb_tunnel_is_dma(tunnel))
-			continue;
-
-		if (tb_tunnel_match_dma(tunnel, nhi_port, transmit_ring,
-					receive_ring, dst_port, receive_path,
-					transmit_path))
-			tb_deactivate_and_free_tunnel(tunnel);
-	}
-
+	mutex_lock(&tb->lock);
 	/*
-	 * Try to re-enable CL states now, it is OK if this fails
-	 * because we may still have another DMA tunnel active through
-	 * the same host router USB4 downstream port.
+	 * If either end is unplugged the tunnels are already torn down by
+	 * tb_remove_xdomain() so there is nothing left to do here.
 	 */
-	tb_enable_clx(sw);
-}
+	if (!xd_a->is_unplugged && !(xd_b && xd_b->is_unplugged)) {
+		struct tb_port *port_a, *port_b;
 
-static int tb_disconnect_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
-				       int transmit_path, int transmit_ring,
-				       int receive_path, int receive_ring)
-{
-	mutex_lock(&tb->lock);
-	if (!xd->is_unplugged)
-		__tb_disconnect_xdomain_paths(tb, xd, transmit_path,
-					      transmit_ring, receive_path,
-					      receive_ring);
+		port_a = tb_xdomain_port(tb, xd_a);
+		port_b = tb_xdomain_port(tb, xd_b);
+		__tb_disconnect_dma_paths(tb, port_a, a_in_hopid, a_out_hopid,
+					  port_b, b_in_hopid, b_out_hopid);
+	}
 	mutex_unlock(&tb->lock);
 	return 0;
 }
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 6da3492fd322..3126610a3602 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -639,12 +639,14 @@ struct tb_cm_ops {
 	int (*challenge_switch_key)(struct tb *tb, struct tb_switch *sw,
 				    const u8 *challenge, u8 *response);
 	int (*disconnect_pcie_paths)(struct tb *tb);
-	int (*approve_xdomain_paths)(struct tb *tb, struct tb_xdomain *xd,
-				     int transmit_path, int transmit_ring,
-				     int receive_path, int receive_ring);
-	int (*disconnect_xdomain_paths)(struct tb *tb, struct tb_xdomain *xd,
-					int transmit_path, int transmit_ring,
-					int receive_path, int receive_ring);
+	int (*approve_xdomain_paths)(struct tb *tb, struct tb_xdomain *xd_a,
+				     int a_in_hopid, int a_out_hopid,
+				     struct tb_xdomain *xd_b, int b_in_hopid,
+				     int b_out_hopid);
+	int (*disconnect_xdomain_paths)(struct tb *tb, struct tb_xdomain *xd_a,
+					int a_in_hopid, int a_out_hopid,
+					struct tb_xdomain *xd_b, int b_in_hopid,
+					int b_out_hopid);
 	int (*usb4_switch_op)(struct tb_switch *sw, u16 opcode, u32 *metadata,
 			      u8 *status, const void *tx_data, size_t tx_data_len,
 			      void *rx_data, size_t rx_data_len);
@@ -896,12 +898,14 @@ int tb_domain_approve_switch(struct tb *tb, struct tb_switch *sw);
 int tb_domain_approve_switch_key(struct tb *tb, struct tb_switch *sw);
 int tb_domain_challenge_switch_key(struct tb *tb, struct tb_switch *sw);
 int tb_domain_disconnect_pcie_paths(struct tb *tb);
-int tb_domain_approve_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
-				    int transmit_path, int transmit_ring,
-				    int receive_path, int receive_ring);
-int tb_domain_disconnect_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
-				       int transmit_path, int transmit_ring,
-				       int receive_path, int receive_ring);
+int tb_domain_approve_xdomain_paths(struct tb *tb, struct tb_xdomain *xd_a,
+				    int a_in_hopid, int a_out_hopid,
+				    struct tb_xdomain *xd_b, int b_in_hopid,
+				    int b_out_hopid);
+int tb_domain_disconnect_xdomain_paths(struct tb *tb, struct tb_xdomain *xd_a,
+				       int a_in_hopid, int a_out_hopid,
+				       struct tb_xdomain *xd_b, int b_in_hopid,
+				       int b_out_hopid);
 int tb_domain_disconnect_all_paths(struct tb *tb);
 int tb_domain_unregister_unplugged_xdomains(struct tb *tb);
 
diff --git a/drivers/thunderbolt/xdomain.c b/drivers/thunderbolt/xdomain.c
index fceaa177b3c1..b9f8ac31bb20 100644
--- a/drivers/thunderbolt/xdomain.c
+++ b/drivers/thunderbolt/xdomain.c
@@ -2474,8 +2474,8 @@ int tb_xdomain_enable_paths(struct tb_xdomain *xd, int transmit_path,
 {
 	int ret;
 
-	ret = tb_domain_approve_xdomain_paths(xd->tb, xd, transmit_path,
-					      transmit_ring, receive_path,
+	ret = tb_domain_approve_xdomain_paths(xd->tb, xd, receive_path,
+					      transmit_path, NULL, transmit_ring,
 					      receive_ring);
 	if (ret)
 		return ret;
@@ -2505,9 +2505,9 @@ int tb_xdomain_disable_paths(struct tb_xdomain *xd, int transmit_path,
 {
 	int ret;
 
-	ret = tb_domain_disconnect_xdomain_paths(xd->tb, xd, transmit_path,
-						 transmit_ring, receive_path,
-						 receive_ring);
+	ret = tb_domain_disconnect_xdomain_paths(xd->tb, xd, receive_path,
+						 transmit_path, NULL,
+						 transmit_ring, receive_ring);
 	if (ret)
 		return ret;
 	atomic_dec(&xd->ntunnels);
@@ -2515,6 +2515,106 @@ int tb_xdomain_disable_paths(struct tb_xdomain *xd, int transmit_path,
 }
 EXPORT_SYMBOL_GPL(tb_xdomain_disable_paths);
 
+static int
+validate_xdomains(const struct tb_xdomain *xd_a, const struct tb_xdomain *xd_b)
+{
+	if (!xd_a || !xd_b)
+		return -EINVAL;
+	if (xd_a == xd_b)
+		return -EINVAL;
+	/* Must belong to the same domain */
+	if (xd_a->tb != xd_b->tb)
+		return -EINVAL;
+	return 0;
+}
+
+/**
+ * tb_xdomains_enable_paths() - Enable DMA paths between two XDomains
+ * @xd_a: First XDomain connection
+ * @a_in_hopid: HopID @xd_a is using to send packets to us
+ * @a_out_hopid: HopID we are using to send packets to @xd_a
+ * @xd_b: Second XDomain connection
+ * @b_in_hopid: HopID @xd_b is using to send packets to us
+ * @b_out_hopid: HopID we are using to send packets to @xd_b
+ *
+ * Like tb_xdomain_enable_paths() but instead of ending at the host
+ * interface, the DMA paths forward packets from one XDomain to the
+ * other through this domain. If only one direction is needed, pass %-1
+ * for both HopIDs of the other one.
+ *
+ * Return: %0 on success, negative errno otherwise.
+ */
+int tb_xdomains_enable_paths(struct tb_xdomain *xd_a, int a_in_hopid,
+			     int a_out_hopid, struct tb_xdomain *xd_b,
+			     int b_in_hopid, int b_out_hopid)
+{
+	bool a_to_b, b_to_a;
+	int ret;
+
+	ret = validate_xdomains(xd_a, xd_b);
+	if (ret)
+		return ret;
+
+	a_to_b = a_in_hopid > 0 && b_out_hopid > 0;
+	b_to_a = b_in_hopid > 0 && a_out_hopid > 0;
+
+	/* A direction needs the HopIDs of both of its ends */
+	if (!a_to_b && (a_in_hopid > 0 || b_out_hopid > 0))
+		return -EINVAL;
+	if (!b_to_a && (b_in_hopid > 0 || a_out_hopid > 0))
+		return -EINVAL;
+	/* And at least one of the two directions is needed */
+	if (!a_to_b && !b_to_a)
+		return -EINVAL;
+
+	ret = tb_domain_approve_xdomain_paths(xd_a->tb, xd_a, a_in_hopid,
+					      a_out_hopid, xd_b, b_in_hopid,
+					      b_out_hopid);
+	if (ret)
+		return ret;
+
+	atomic_inc(&xd_a->ntunnels);
+	atomic_inc(&xd_b->ntunnels);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(tb_xdomains_enable_paths);
+
+/**
+ * tb_xdomains_disable_paths() - Disable DMA paths between two XDomains
+ * @xd_a: First XDomain connection
+ * @a_in_hopid: HopID @xd_a is using to send packets to us
+ * @a_out_hopid: HopID we are using to send packets to @xd_a
+ * @xd_b: Second XDomain connection
+ * @b_in_hopid: HopID @xd_b is using to send packets to us
+ * @b_out_hopid: HopID we are using to send packets to @xd_b
+ *
+ * This does the opposite of tb_xdomains_enable_paths(). The callers should
+ * pass the same values here as they did when the paths were enabled.
+ *
+ * Return: %0 on success, negative errno otherwise.
+ */
+int tb_xdomains_disable_paths(struct tb_xdomain *xd_a, int a_in_hopid,
+			      int a_out_hopid, struct tb_xdomain *xd_b,
+			      int b_in_hopid, int b_out_hopid)
+{
+	int ret;
+
+	ret = validate_xdomains(xd_a, xd_b);
+	if (ret)
+		return ret;
+
+	ret = tb_domain_disconnect_xdomain_paths(xd_a->tb, xd_a, a_in_hopid,
+						 a_out_hopid, xd_b, b_in_hopid,
+						 b_out_hopid);
+	if (ret)
+		return ret;
+
+	atomic_dec(&xd_a->ntunnels);
+	atomic_dec(&xd_b->ntunnels);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(tb_xdomains_disable_paths);
+
 struct tb_xdomain_lookup {
 	const uuid_t *uuid;
 	u8 link;
diff --git a/include/linux/thunderbolt.h b/include/linux/thunderbolt.h
index 03f315934e44..a19d6fede0bd 100644
--- a/include/linux/thunderbolt.h
+++ b/include/linux/thunderbolt.h
@@ -307,6 +307,12 @@ int tb_xdomain_enable_paths(struct tb_xdomain *xd, int transmit_path,
 int tb_xdomain_disable_paths(struct tb_xdomain *xd, int transmit_path,
 			     int transmit_ring, int receive_path,
 			     int receive_ring);
+int tb_xdomains_enable_paths(struct tb_xdomain *xd_a, int a_in_hopid,
+			     int a_out_hopid, struct tb_xdomain *xd_b,
+			     int b_in_hopid, int b_out_hopid);
+int tb_xdomains_disable_paths(struct tb_xdomain *xd_a, int a_in_hopid,
+			      int a_out_hopid, struct tb_xdomain *xd_b,
+			      int b_in_hopid, int b_out_hopid);
 
 static inline int tb_xdomain_disable_all_paths(struct tb_xdomain *xd)
 {
-- 
2.50.1

