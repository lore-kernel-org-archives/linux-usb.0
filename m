Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108360;
	b=PdXZfCEy/VzA9bNXvAcNX5pX8+zvu91bjrWWISgsDuw+5TVbgbjcfj0eMQyEklcsUymJ
	 WxwWuqVbtHLdh7+qzH4oJhYwETXcyt4THYzRVrRerxqKez94DexSjikDeL6FE8p5uRLRD
	 v44ughQ8ugWfFH7qwCoQRrMriAGxw2oSO3kCurnOpWYrrTKqwadnWc29KmmdiBpvHqzp5
	 Sh1efgrJfmgZr91v5U3QW7WI6WSvbmF9F95DCatFLnLSGxL+zydftRXTIc/8oxDdQbiy1
	 Ypd508WyP411YDRfS48MjlchiQLBnSkEonly3uaFtMJ3J96yMJEaPS8HpeDyGXaeimQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108360;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LDXyRCziLdTxuX7Ru1GFNxI15Vgkwy5HSVbWjF+mi2w=;
	b=tDZfwvkWf5UaEM6TwCYnfl4vltv7hXSFNY6gQReKXlnm2fH3Vw7eCW9CowE/1BEbH+nw
	 dffoOgpowg+QTyXGQ8laA/p7Vqxy317GSCPNoF5+RnOCRni5wulIqlncAb6Il27H8cezj
	 2aZKO7XbtK3o5BUfRVQMWcewE24ifbNYRQwyZAGcGLL5AaEGfEz9nLLvzkN4MiOd59980
	 mcVD1Nh2AFuq/xgAXP05hEZWhNCVnIJxFgJ3Jf5oKqG/QXvyCPAwLa0HhTeLpN73g2W2S
	 UAtAcNiramHxfECV9P4rbVs7ntSJ2LQf6YKVzh+hmXto8XjXAq/gCTWQMdtNiH0IQtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bWp8Yr5e;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14251606A634
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 17:12:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14251606A634
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bWp8Yr5e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795108360; x=1826644360;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2nzy7S/W6JBrRjjsJ8TW8lJ+P3TP2QN/Fm7YYmpLQ14=;
  b=bWp8Yr5eLJMyEmrHPCubJQVyD5Ach34OpqrNuf4XgETZnw9CiyuK1JeH
   RCRXPQioKxg+6q6Dn7bxpHtw3oaUw924lEKbq/4JqXLHNK5LB9WpRA81U
   +LCaGlEHAJp3+bX0bXARmRfOy5U+3dn/XqAlt1W+6OZRXkwsycrb04p+x
   auAmW8szRAMXO78+VSFldZYFAe4mbNTHppjT3Pu8PEQZT7AfG+rmLInS4
   jjLyaQr4K8Qmh16eKbduV2lIwO+9X/t9IV6Ggnk5NmKSBhI01nQm3hhVg
   r2nTKPIcl67kAw1g/G5NKtvArNJTxvCVN4rBbiqZSmH2hXUaDVhtIG4WN
   A==;
X-CSE-ConnectionGUID: NUZxEavwSUWb1hzruWkGrQ==
X-CSE-MsgGUID: vebGSkEjQyChKY3XF61g7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4013004"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="4013004"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 09:12:39 -0800
X-CSE-ConnectionGUID: UGwqSeb4QwewbbxBhr4lKw==
X-CSE-MsgGUID: GvNzjKD5RTWgBsZBghXtNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10575078"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa005.fm.intel.com with ESMTP; 19 Nov 2026 09:12:36 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 20A8AAA; Thu, 19 Nov 2026 18:12:33 +0100 (CET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Rene Sapiens <rene.sapiens@linux.intel.com>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 12/18] thunderbolt: Drop tunnel discovery without HopID allocation
Date: Thu, 19 Nov 2026 18:12:26 +0100
Message-ID: <20261119171232.1616316-13-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261119171232.1616316-1-mika.westerberg@linux.intel.com>
References: <20261119171232.1616316-1-mika.westerberg@linux.intel.com>
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

The only user of tunnel discovery without HopID allocation was the
resume path from suspend-to-disk, which now resets the topology
instead. Remove the now unused alloc_hopid parameter and always
allocate HopIDs when discovering paths.

No functional changes.

Signed-off-by: Mika Westerberg (Intel) <westeri@kernel.org>
---
 drivers/thunderbolt/path.c   | 41 +++++++++++++++---------------------
 drivers/thunderbolt/tb.c     | 17 ++++++---------
 drivers/thunderbolt/tb.h     |  5 +----
 drivers/thunderbolt/tunnel.c | 26 +++++++++--------------
 drivers/thunderbolt/tunnel.h |  7 ++----
 5 files changed, 37 insertions(+), 59 deletions(-)

diff --git a/drivers/thunderbolt/path.c b/drivers/thunderbolt/path.c
index 05249eed3f64..79c285dd29fb 100644
--- a/drivers/thunderbolt/path.c
+++ b/drivers/thunderbolt/path.c
@@ -85,12 +85,11 @@ static int tb_path_find_src_hopid(struct tb_port *src,
  * @dst_hopid: HopID to the @dst (%-1 if don't care)
  * @last: Last port is filled here if not %NULL
  * @name: Name of the path
- * @alloc_hopid: Allocate HopIDs for the ports
  *
  * Follows a path starting from @src and @src_hopid to the last output
- * port of the path. Allocates HopIDs for the visited ports (if
- * @alloc_hopid is true). Call tb_path_free() to release the path and
- * allocated HopIDs when the path is not needed anymore.
+ * port of the path. Allocates HopIDs for the visited ports. Call
+ * tb_path_free() to release the path and allocated HopIDs when the path
+ * is not needed anymore.
  *
  * Note function discovers also incomplete paths so caller should check
  * that the @dst port is the expected one. If it is not, the path can be
@@ -100,8 +99,7 @@ static int tb_path_find_src_hopid(struct tb_port *src,
  */
 struct tb_path *tb_path_discover(struct tb_port *src, int src_hopid,
 				 struct tb_port *dst, int dst_hopid,
-				 struct tb_port **last, const char *name,
-				 bool alloc_hopid)
+				 struct tb_port **last, const char *name)
 {
 	struct tb_port *out_port;
 	struct tb_regs_hop hop;
@@ -159,7 +157,6 @@ struct tb_path *tb_path_discover(struct tb_port *src, int src_hopid,
 	path->name = name;
 	path->tb = src->sw->tb;
 	path->activated = true;
-	path->alloc_hopid = alloc_hopid;
 
 	tb_dbg(path->tb, "discovering %s path starting from %llx:%u\n",
 	       path->name, tb_route(src->sw), src->port);
@@ -178,14 +175,13 @@ struct tb_path *tb_path_discover(struct tb_port *src, int src_hopid,
 			goto err;
 		}
 
-		if (alloc_hopid && tb_port_alloc_in_hopid(p, h, h) < 0)
+		if (tb_port_alloc_in_hopid(p, h, h) < 0)
 			goto err;
 
 		out_port = &sw->ports[hop.out_port];
 		next_hop = hop.next_hop;
 
-		if (alloc_hopid &&
-		    tb_port_alloc_out_hopid(out_port, next_hop, next_hop) < 0) {
+		if (tb_port_alloc_out_hopid(out_port, next_hop, next_hop) < 0) {
 			tb_port_release_in_hopid(p, h);
 			goto err;
 		}
@@ -261,7 +257,6 @@ struct tb_path *tb_path_alloc(struct tb *tb, struct tb_port *src, int src_hopid,
 		return NULL;
 
 	path->path_length = num_hops;
-	path->alloc_hopid = true;
 
 	in_hopid = src_hopid;
 	out_port = NULL;
@@ -344,19 +339,17 @@ struct tb_path *tb_path_alloc(struct tb *tb, struct tb_port *src, int src_hopid,
  */
 void tb_path_free(struct tb_path *path)
 {
-	if (path->alloc_hopid) {
-		int i;
-
-		for (i = 0; i < path->path_length; i++) {
-			const struct tb_path_hop *hop = &path->hops[i];
-
-			if (hop->in_port)
-				tb_port_release_in_hopid(hop->in_port,
-							 hop->in_hop_index);
-			if (hop->out_port)
-				tb_port_release_out_hopid(hop->out_port,
-							  hop->next_hop_index);
-		}
+	int i;
+
+	for (i = 0; i < path->path_length; i++) {
+		const struct tb_path_hop *hop = &path->hops[i];
+
+		if (hop->in_port)
+			tb_port_release_in_hopid(hop->in_port,
+						 hop->in_hop_index);
+		if (hop->out_port)
+			tb_port_release_out_hopid(hop->out_port,
+						  hop->next_hop_index);
 	}
 
 	kfree(path);
diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 6c1ca4b5ffdd..10fca534ff78 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -382,8 +382,7 @@ static int tb_enable_tmu(struct tb_switch *sw)
 }
 
 static void tb_switch_discover_tunnels(struct tb_switch *sw,
-				       struct list_head *list,
-				       bool alloc_hopids)
+				       struct list_head *list)
 {
 	struct tb *tb = sw->tb;
 	struct tb_port *port;
@@ -393,17 +392,17 @@ static void tb_switch_discover_tunnels(struct tb_switch *sw,
 
 		switch (port->config.type) {
 		case TB_TYPE_DP_HDMI_IN:
-			tunnel = tb_tunnel_discover_dp(tb, port, alloc_hopids,
+			tunnel = tb_tunnel_discover_dp(tb, port,
 						       tb_dp_tunnel_active);
 			tb_increase_tmu_accuracy(tunnel);
 			break;
 
 		case TB_TYPE_PCIE_DOWN:
-			tunnel = tb_tunnel_discover_pci(tb, port, alloc_hopids);
+			tunnel = tb_tunnel_discover_pci(tb, port);
 			break;
 
 		case TB_TYPE_USB3_DOWN:
-			tunnel = tb_tunnel_discover_usb3(tb, port, alloc_hopids);
+			tunnel = tb_tunnel_discover_usb3(tb, port);
 			break;
 
 		default:
@@ -415,10 +414,8 @@ static void tb_switch_discover_tunnels(struct tb_switch *sw,
 	}
 
 	tb_switch_for_each_port(sw, port) {
-		if (tb_port_has_remote(port)) {
-			tb_switch_discover_tunnels(port->remote->sw, list,
-						   alloc_hopids);
-		}
+		if (tb_port_has_remote(port))
+			tb_switch_discover_tunnels(port->remote->sw, list);
 	}
 }
 
@@ -1719,7 +1716,7 @@ static void tb_discover_tunnels(struct tb *tb)
 	struct tb_cm *tcm = tb_priv(tb);
 	struct tb_tunnel *tunnel;
 
-	tb_switch_discover_tunnels(tb->root_switch, &tcm->tunnel_list, true);
+	tb_switch_discover_tunnels(tb->root_switch, &tcm->tunnel_list);
 
 	list_for_each_entry(tunnel, &tcm->tunnel_list, list) {
 		if (tb_tunnel_is_pci(tunnel)) {
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 7f47a5c3c0d3..c31ede3244ac 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -423,7 +423,6 @@ enum tb_path_port {
  * @clear_fc: Clear all flow control from the path config space entries
  *	      when deactivating this path
  * @path_length: How many hops the path uses
- * @alloc_hopid: Does this path consume port HopID
  * @hops: Path hops
  *
  * A path consists of a number of hops (see &struct tb_path_hop). To
@@ -444,7 +443,6 @@ struct tb_path {
 	bool activated;
 	bool clear_fc;
 	int path_length;
-	bool alloc_hopid;
 
 	struct tb_path_hop hops[] __counted_by(path_length);
 };
@@ -1194,8 +1192,7 @@ int tb_dp_port_enable(struct tb_port *port, bool enable);
 
 struct tb_path *tb_path_discover(struct tb_port *src, int src_hopid,
 				 struct tb_port *dst, int dst_hopid,
-				 struct tb_port **last, const char *name,
-				 bool alloc_hopid);
+				 struct tb_port **last, const char *name);
 struct tb_path *tb_path_alloc(struct tb *tb, struct tb_port *src, int src_hopid,
 			      struct tb_port *dst, int dst_hopid, int link_nr,
 			      const char *name);
diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index 9d831a7a1ced..c4e624c94bb0 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -446,15 +446,13 @@ static int tb_pci_init_path(struct tb_path *path)
  * tb_tunnel_discover_pci() - Discover existing PCIe tunnels
  * @tb: Pointer to the domain structure
  * @down: PCIe downstream adapter
- * @alloc_hopid: Allocate HopIDs from visited ports
  *
  * If @down adapter is active, follows the tunnel to the PCIe upstream
  * adapter and back.
  *
  * Return: Pointer to &struct tb_tunnel or %NULL if there was no tunnel.
  */
-struct tb_tunnel *tb_tunnel_discover_pci(struct tb *tb, struct tb_port *down,
-					 bool alloc_hopid)
+struct tb_tunnel *tb_tunnel_discover_pci(struct tb *tb, struct tb_port *down)
 {
 	struct tb_tunnel *tunnel;
 	struct tb_path *path;
@@ -475,7 +473,7 @@ struct tb_tunnel *tb_tunnel_discover_pci(struct tb *tb, struct tb_port *down,
 	 * case.
 	 */
 	path = tb_path_discover(down, TB_PCI_HOPID, NULL, -1,
-				&tunnel->dst_port, "PCIe Up", alloc_hopid);
+				&tunnel->dst_port, "PCIe Up");
 	if (!path) {
 		/* Just disable the downstream port */
 		tb_pci_port_enable(down, false);
@@ -486,7 +484,7 @@ struct tb_tunnel *tb_tunnel_discover_pci(struct tb *tb, struct tb_port *down,
 		goto err_free;
 
 	path = tb_path_discover(tunnel->dst_port, -1, down, TB_PCI_HOPID, NULL,
-				"PCIe Down", alloc_hopid);
+				"PCIe Down");
 	if (!path)
 		goto err_deactivate;
 	tunnel->paths[TB_PCI_PATH_DOWN] = path;
@@ -1610,7 +1608,6 @@ static void tb_dp_dump(struct tb_tunnel *tunnel)
  * tb_tunnel_discover_dp() - Discover existing Display Port tunnels
  * @tb: Pointer to the domain structure
  * @in: DP in adapter
- * @alloc_hopid: Allocate HopIDs from visited ports
  * @callback: Callback that is called when the DP tunnel is fully
  *	      activated (or there is an error)
  *
@@ -1621,7 +1618,6 @@ static void tb_dp_dump(struct tb_tunnel *tunnel)
  * Return: Pointer to &struct tb_tunnel or %NULL if no tunnel found.
  */
 struct tb_tunnel *tb_tunnel_discover_dp(struct tb *tb, struct tb_port *in,
-					bool alloc_hopid,
 					void (*callback)(struct tb_tunnel *))
 {
 	struct tb_tunnel *tunnel;
@@ -1650,7 +1646,7 @@ struct tb_tunnel *tb_tunnel_discover_dp(struct tb *tb, struct tb_port *in,
 	INIT_DELAYED_WORK(&tunnel->dprx_work, tb_dp_dprx_work);
 
 	path = tb_path_discover(in, TB_DP_VIDEO_HOPID, NULL, -1,
-				&tunnel->dst_port, "Video", alloc_hopid);
+				&tunnel->dst_port, "Video");
 	if (!path) {
 		/* Just disable the DP IN port */
 		tb_dp_port_enable(in, false);
@@ -1660,15 +1656,15 @@ struct tb_tunnel *tb_tunnel_discover_dp(struct tb *tb, struct tb_port *in,
 	if (tb_dp_init_video_path(tunnel->paths[TB_DP_VIDEO_PATH_OUT], false))
 		goto err_free;
 
-	path = tb_path_discover(in, TB_DP_AUX_TX_HOPID, NULL, -1, NULL, "AUX TX",
-				alloc_hopid);
+	path = tb_path_discover(in, TB_DP_AUX_TX_HOPID, NULL, -1, NULL,
+				"AUX TX");
 	if (!path)
 		goto err_deactivate;
 	tunnel->paths[TB_DP_AUX_PATH_OUT] = path;
 	tb_dp_init_aux_path(tunnel->paths[TB_DP_AUX_PATH_OUT], false);
 
 	path = tb_path_discover(tunnel->dst_port, -1, in, TB_DP_AUX_RX_HOPID,
-				&port, "AUX RX", alloc_hopid);
+				&port, "AUX RX");
 	if (!path)
 		goto err_deactivate;
 	tunnel->paths[TB_DP_AUX_PATH_IN] = path;
@@ -2237,15 +2233,13 @@ static void tb_usb3_init_path(struct tb_path *path)
  * tb_tunnel_discover_usb3() - Discover existing USB3 tunnels
  * @tb: Pointer to the domain structure
  * @down: USB3 downstream adapter
- * @alloc_hopid: Allocate HopIDs from visited ports
  *
  * If @down adapter is active, follows the tunnel to the USB3 upstream
  * adapter and back.
  *
  * Return: Pointer to &struct tb_tunnel or %NULL if there was no tunnel.
  */
-struct tb_tunnel *tb_tunnel_discover_usb3(struct tb *tb, struct tb_port *down,
-					  bool alloc_hopid)
+struct tb_tunnel *tb_tunnel_discover_usb3(struct tb *tb, struct tb_port *down)
 {
 	struct tb_tunnel *tunnel;
 	struct tb_path *path;
@@ -2266,7 +2260,7 @@ struct tb_tunnel *tb_tunnel_discover_usb3(struct tb *tb, struct tb_port *down,
 	 * case.
 	 */
 	path = tb_path_discover(down, TB_USB3_HOPID, NULL, -1,
-				&tunnel->dst_port, "USB3 Down", alloc_hopid);
+				&tunnel->dst_port, "USB3 Down");
 	if (!path) {
 		/* Just disable the downstream port */
 		tb_usb3_port_enable(down, false);
@@ -2276,7 +2270,7 @@ struct tb_tunnel *tb_tunnel_discover_usb3(struct tb *tb, struct tb_port *down,
 	tb_usb3_init_path(tunnel->paths[TB_USB3_PATH_DOWN]);
 
 	path = tb_path_discover(tunnel->dst_port, -1, down, TB_USB3_HOPID, NULL,
-				"USB3 Up", alloc_hopid);
+				"USB3 Up");
 	if (!path)
 		goto err_deactivate;
 	tunnel->paths[TB_USB3_PATH_UP] = path;
diff --git a/drivers/thunderbolt/tunnel.h b/drivers/thunderbolt/tunnel.h
index 28f49f7e9f56..35d026c5bc96 100644
--- a/drivers/thunderbolt/tunnel.h
+++ b/drivers/thunderbolt/tunnel.h
@@ -108,14 +108,12 @@ struct tb_tunnel {
 	struct tb_path *paths[] __counted_by(npaths);
 };
 
-struct tb_tunnel *tb_tunnel_discover_pci(struct tb *tb, struct tb_port *down,
-					 bool alloc_hopid);
+struct tb_tunnel *tb_tunnel_discover_pci(struct tb *tb, struct tb_port *down);
 struct tb_tunnel *tb_tunnel_alloc_pci(struct tb *tb, struct tb_port *up,
 				      struct tb_port *down);
 bool tb_tunnel_reserved_pci(struct tb_port *port, int *reserved_up,
 			    int *reserved_down);
 struct tb_tunnel *tb_tunnel_discover_dp(struct tb *tb, struct tb_port *in,
-					bool alloc_hopid,
 					void (*callback)(struct tb_tunnel *));
 struct tb_tunnel *tb_tunnel_alloc_dp(struct tb *tb, struct tb_port *in,
 				     struct tb_port *out, int link_nr,
@@ -127,8 +125,7 @@ struct tb_tunnel *tb_tunnel_alloc_dma(struct tb *tb, struct tb_port *nhi,
 				      int receive_ring);
 bool tb_tunnel_match_dma(const struct tb_tunnel *tunnel, int transmit_path,
 			 int transmit_ring, int receive_path, int receive_ring);
-struct tb_tunnel *tb_tunnel_discover_usb3(struct tb *tb, struct tb_port *down,
-					  bool alloc_hopid);
+struct tb_tunnel *tb_tunnel_discover_usb3(struct tb *tb, struct tb_port *down);
 struct tb_tunnel *tb_tunnel_alloc_usb3(struct tb *tb, struct tb_port *up,
 				       struct tb_port *down, int max_up,
 				       int max_down);
-- 
2.50.1

