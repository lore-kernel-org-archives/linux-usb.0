Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795621285;
	b=giUJRciCTEdYLODyz2BnMjMdEbZiTRW3NzW69DbGMwqM1oeYU58QH7OS+7KO3H9TqM5m
	 Dfs87Cdk9Vs5LmRP0vYeWyxUVLbmmnawRU8vPGJzLroMNmmn8oU7oUCp7lRf0pEjtaYkY
	 GF4mCnSSYxnWK6qYga5y6t9OQik13ZuDDEPUC3A4BBWZKQc27/RCIH/NV2giIjG9Lo2Cm
	 VUnBbnD1T1kMAjHYrNbEuEzRUBouXVDsLIO1W6a3m0MO5AuWwpgJjVCEBiDZi+6PirmrJ
	 /RFB16e3JiVF7heWcfOdkBQZ4KzaUjBmLQr0UuINYWr1g3ybhLVvou8TlrRtCuLgW7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795621285;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZCBh+1QIWiplcxG/3ZmM0eRhCFF6ngcjfDVFxFTyT4Y=;
	b=BuRYI3aXw6KCVVtF0pXV60X43cCwJLMSnkGp8nKcNxowLwrD3aJyl5wssiwlLNaooXjY
	 1RX4agyd3xdnL3h/xheWT0+aA5OmputUnZygMpijtoOcyhjAdBDvLeRPBYKyYsjPNMVvY
	 IIyMdcTSX+c4BzPTjM40dg7mWfiPfDufGuIg2FEH6Nsq7On6IOG/MqyK29XJIwh0LQHPY
	 UQ99mycO6IdfCPz2Y6Xxd9VsqS2t5ieHjq5cRe3oZcCIY7lMN4PS5Zuxxafq23UoDyKlS
	 uRZNWphIepcQvd9MArpORC0GhM5VFt7RCNF5yBWU/00OdCBx00gIQGCREh0tZIg48zA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CHzOOrrv;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7006560A2622
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 15:41:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7006560A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CHzOOrrv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795621284; x=1827157284;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8tUsJs/es27pESYex6oXlxFXB4aN4jRi3UFrSCSpvqg=;
  b=CHzOOrrvfAYnf2t8VVYMcA75iChOEkaIlpZUdQVgNVnP2MRN9q+luh2H
   XllNJM6BMszTRkW+gvoUHySzvk9RzRzYsFFRvZsUHghwjaFGjiBK3Mo8t
   YIglpaOugvzwIcxgHUKhnl6B2GQbpmBkMeMgKfeK3sdg0N1NbQR5nbQUS
   DvLzMCMaZis6EOXhVzLmzOQaMsSm5Zwbza6b9axM75+mSpGUlNgeFdlUY
   C9hYS505/M+eOvlvbmjCLUZxka/H5SC2zrinstzPL9XslP/aiRoZdRDgA
   DKhfjqJmdQ/BsZwyjRf77qrFbcvJWBHNkXD2gynVbYhDlvWjhb4BjBf5d
   A==;
X-CSE-ConnectionGUID: GEQ68dCdSZ+kBLJfmBrR0w==
X-CSE-MsgGUID: AfZQ0d2DRBWm15tdiia6Ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4408779"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4408779"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 07:35:34 -0800
X-CSE-ConnectionGUID: kR22XQn8SDih1u5DE1iUBQ==
X-CSE-MsgGUID: 2WpSSMWvSiGH6JYgtFdeRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="11884788"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa007.jf.intel.com with ESMTP; 25 Nov 2026 07:26:26 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 1899EA4; Wed, 25 Nov 2026 16:26:23 +0100 (CET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Mika Westerberg <westeri@kernel.org>
Subject: [PATCH 6/9] thunderbolt: Add KUnit tests for lane to lane DMA tunnels
Date: Wed, 25 Nov 2026 16:26:19 +0100
Message-ID: <20261125152623.456054-7-mika.westerberg@linux.intel.com>
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

This adds KUnit tests for the lane to lane DMA tunnels we just started
to support.

Signed-off-by: Mika Westerberg (Intel) <westeri@kernel.org>
---
 drivers/thunderbolt/test.c | 408 +++++++++++++++++++++++++++++++++++++
 1 file changed, 408 insertions(+)

diff --git a/drivers/thunderbolt/test.c b/drivers/thunderbolt/test.c
index 0321408fe91c..b36bbe8bd7c1 100644
--- a/drivers/thunderbolt/test.c
+++ b/drivers/thunderbolt/test.c
@@ -2154,6 +2154,239 @@ static void tb_test_tunnel_dma_match(struct kunit *test)
 #undef MATCH
 }
 
+static void tb_test_tunnel_dma_lane2lane(struct kunit *test)
+{
+	struct tb_port *src_port, *dst_port;
+	struct tb_tunnel *tunnel;
+	struct tb_switch *host;
+
+	/*
+	 * Create DMA tunnel between two hosts that are connected to lane
+	 * adapters 1 and 3 of this host.
+	 *
+	 *   [Host 2]                     [Host 3]
+	 * ............ Domain border ............
+	 *      |                             |
+	 *    1 v In HopID 8 -> Out HopID 8   |
+	 *    1 ^ Out HopID 8 <- In HopID 8   v 3
+	 *              [Host 1]
+	 */
+	host = alloc_host(test);
+	src_port = &host->ports[1];
+	dst_port = &host->ports[3];
+
+	tunnel = tb_tunnel_alloc_dma(NULL, src_port, 8, 8, dst_port, 8, 8);
+	KUNIT_ASSERT_NOT_NULL(test, tunnel);
+	KUNIT_EXPECT_EQ(test, tunnel->type, TB_TUNNEL_DMA);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel->src_port, src_port);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel->dst_port, dst_port);
+	KUNIT_ASSERT_EQ(test, tunnel->npaths, 2);
+	/* Path from the second host to the first one */
+	KUNIT_ASSERT_EQ(test, tunnel->paths[0]->path_length, 1);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel->paths[0]->hops[0].in_port, dst_port);
+	KUNIT_EXPECT_EQ(test, tunnel->paths[0]->hops[0].in_hop_index, 8);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel->paths[0]->hops[0].out_port, src_port);
+	KUNIT_EXPECT_EQ(test, tunnel->paths[0]->hops[0].next_hop_index, 8);
+	KUNIT_EXPECT_TRUE(test, tunnel->paths[0]->hops[0].ingress_fc_enable);
+	KUNIT_EXPECT_TRUE(test, tunnel->paths[0]->hops[0].egress_fc_enable);
+	/* Path from the first host to the second one */
+	KUNIT_ASSERT_EQ(test, tunnel->paths[1]->path_length, 1);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel->paths[1]->hops[0].in_port, src_port);
+	KUNIT_EXPECT_EQ(test, tunnel->paths[1]->hops[0].in_hop_index, 8);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel->paths[1]->hops[0].out_port, dst_port);
+	KUNIT_EXPECT_EQ(test, tunnel->paths[1]->hops[0].next_hop_index, 8);
+	KUNIT_EXPECT_TRUE(test, tunnel->paths[1]->hops[0].ingress_fc_enable);
+	KUNIT_EXPECT_TRUE(test, tunnel->paths[1]->hops[0].egress_fc_enable);
+
+	tb_tunnel_put(tunnel);
+}
+
+static void tb_test_tunnel_dma_lane2lane_one_way(struct kunit *test)
+{
+	struct tb_port *src_port, *dst_port;
+	struct tb_tunnel *tunnel;
+	struct tb_switch *host;
+
+	/*
+	 * Create uni-directional DMA tunnels between two hosts that are
+	 * connected to lane adapters 1 and 3 of this host.
+	 *
+	 *   [Host 2]                     [Host 3]
+	 * ............ Domain border ............
+	 *      |                             |
+	 *    1 v In HopID 8 -> Out HopID 8   v 3
+	 *              [Host 1]
+	 */
+	host = alloc_host(test);
+	src_port = &host->ports[1];
+	dst_port = &host->ports[3];
+
+	tunnel = tb_tunnel_alloc_dma(NULL, src_port, 8, -1, dst_port, -1, 8);
+	KUNIT_ASSERT_NOT_NULL(test, tunnel);
+	KUNIT_ASSERT_EQ(test, tunnel->npaths, 1);
+	KUNIT_ASSERT_EQ(test, tunnel->paths[0]->path_length, 1);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel->paths[0]->hops[0].in_port, src_port);
+	KUNIT_EXPECT_EQ(test, tunnel->paths[0]->hops[0].in_hop_index, 8);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel->paths[0]->hops[0].out_port, dst_port);
+	KUNIT_EXPECT_EQ(test, tunnel->paths[0]->hops[0].next_hop_index, 8);
+
+	tb_tunnel_put(tunnel);
+
+	/* Now the other way around */
+	tunnel = tb_tunnel_alloc_dma(NULL, src_port, -1, 8, dst_port, 8, -1);
+	KUNIT_ASSERT_NOT_NULL(test, tunnel);
+	KUNIT_ASSERT_EQ(test, tunnel->npaths, 1);
+	KUNIT_ASSERT_EQ(test, tunnel->paths[0]->path_length, 1);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel->paths[0]->hops[0].in_port, dst_port);
+	KUNIT_EXPECT_EQ(test, tunnel->paths[0]->hops[0].in_hop_index, 8);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel->paths[0]->hops[0].out_port, src_port);
+	KUNIT_EXPECT_EQ(test, tunnel->paths[0]->hops[0].next_hop_index, 8);
+
+	tb_tunnel_put(tunnel);
+}
+
+static void tb_test_tunnel_dma_lane2lane_chain(struct kunit *test)
+{
+	struct tb_port *src_port, *dst_port;
+	struct tb_switch *host, *dev;
+	struct tb_tunnel *tunnel;
+
+	/*
+	 * Create DMA tunnel between a host connected to lane adapter 1 of
+	 * this host and another one that is behind a device router.
+	 *
+	 *   [Host 2]
+	 * ............ Domain border
+	 *      |
+	 *    1 | In and Out HopID 8
+	 *  [Host 1]
+	 *      3 \
+	 *        1 \
+	 *      [Device #1]
+	 *          3 | In and Out HopID 8
+	 *            v
+	 * ............ Domain border
+	 *            |
+	 *         [Host 3]
+	 */
+	host = alloc_host(test);
+	dev = alloc_dev_default(test, host, 0x3, true);
+
+	src_port = &host->ports[1];
+	dst_port = &dev->ports[3];
+
+	tunnel = tb_tunnel_alloc_dma(NULL, src_port, 8, 8, dst_port, 8, 8);
+	KUNIT_ASSERT_NOT_NULL(test, tunnel);
+	KUNIT_ASSERT_EQ(test, tunnel->npaths, 2);
+	/* Path from the second host to the first one */
+	KUNIT_ASSERT_EQ(test, tunnel->paths[0]->path_length, 2);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel->paths[0]->hops[0].in_port, dst_port);
+	KUNIT_EXPECT_EQ(test, tunnel->paths[0]->hops[0].in_hop_index, 8);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel->paths[0]->hops[0].out_port,
+			    &dev->ports[1]);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel->paths[0]->hops[1].in_port,
+			    &host->ports[3]);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel->paths[0]->hops[1].out_port, src_port);
+	KUNIT_EXPECT_EQ(test, tunnel->paths[0]->hops[1].next_hop_index, 8);
+	/* Path from the first host to the second one */
+	KUNIT_ASSERT_EQ(test, tunnel->paths[1]->path_length, 2);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel->paths[1]->hops[0].in_port, src_port);
+	KUNIT_EXPECT_EQ(test, tunnel->paths[1]->hops[0].in_hop_index, 8);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel->paths[1]->hops[0].out_port,
+			    &host->ports[3]);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel->paths[1]->hops[1].in_port,
+			    &dev->ports[1]);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel->paths[1]->hops[1].out_port, dst_port);
+	KUNIT_EXPECT_EQ(test, tunnel->paths[1]->hops[1].next_hop_index, 8);
+
+	tb_tunnel_put(tunnel);
+}
+
+static void tb_test_tunnel_dma_lane2lane_hub(struct kunit *test)
+{
+	struct tb_port *src_port, *dst_port;
+	struct tb_switch *host, *hub;
+	struct tb_tunnel *tunnel;
+
+	/*
+	 * Create DMA tunnel between two hosts that are both connected to a
+	 * hub below this host. Now the path goes directly from one downstream
+	 * port of the hub to the other one and does not reach this host at
+	 * all.
+	 *
+	 *              [Host 1]
+	 *                  1 |
+	 *                  1 |
+	 *               [Hub #1]
+	 *   3 v In HopID 8 -> Out HopID 8 v 5
+	 *   3 ^ Out HopID 8 <- In HopID 8 ^ 5
+	 * ............ Domain border ............
+	 *     |                              |
+	 *  [Host 2]                      [Host 3]
+	 */
+	host = alloc_host(test);
+	hub = alloc_dev_default(test, host, 0x1, true);
+
+	src_port = &hub->ports[3];
+	dst_port = &hub->ports[5];
+
+	tunnel = tb_tunnel_alloc_dma(NULL, src_port, 8, 8, dst_port, 8, 8);
+	KUNIT_ASSERT_NOT_NULL(test, tunnel);
+	KUNIT_ASSERT_EQ(test, tunnel->npaths, 2);
+	/* Path from the second host to the first one */
+	KUNIT_ASSERT_EQ(test, tunnel->paths[0]->path_length, 1);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel->paths[0]->hops[0].in_port, dst_port);
+	KUNIT_EXPECT_EQ(test, tunnel->paths[0]->hops[0].in_hop_index, 8);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel->paths[0]->hops[0].out_port, src_port);
+	KUNIT_EXPECT_EQ(test, tunnel->paths[0]->hops[0].next_hop_index, 8);
+	/* Path from the first host to the second one */
+	KUNIT_ASSERT_EQ(test, tunnel->paths[1]->path_length, 1);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel->paths[1]->hops[0].in_port, src_port);
+	KUNIT_EXPECT_EQ(test, tunnel->paths[1]->hops[0].in_hop_index, 8);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel->paths[1]->hops[0].out_port, dst_port);
+	KUNIT_EXPECT_EQ(test, tunnel->paths[1]->hops[0].next_hop_index, 8);
+
+	tb_tunnel_put(tunnel);
+}
+
+static void tb_test_tunnel_dma_lane2lane_match(struct kunit *test)
+{
+	struct tb_port *src_port, *dst_port, *nhi;
+	struct tb_tunnel *tunnel;
+	struct tb_switch *host;
+
+	host = alloc_host(test);
+	nhi = &host->ports[7];
+	src_port = &host->ports[1];
+	dst_port = &host->ports[3];
+
+	/*
+	 * Use a different HopID for each end and direction, which is what
+	 * happens when there are already other tunnels going through, so
+	 * that mixing them up gets caught below.
+	 */
+	tunnel = tb_tunnel_alloc_dma(NULL, src_port, 8, 9, dst_port, 10, 11);
+	KUNIT_ASSERT_NOT_NULL(test, tunnel);
+
+#define MATCH(src, src_in, src_out, dst, dst_in, dst_out) \
+	tb_tunnel_match_dma(tunnel, src, src_in, src_out, dst, dst_in, dst_out)
+
+	KUNIT_EXPECT_TRUE(test, MATCH(src_port, 8, 9, dst_port, 10, 11));
+	KUNIT_EXPECT_TRUE(test, MATCH(src_port, 8, -1, NULL, -1, -1));
+	KUNIT_EXPECT_TRUE(test, MATCH(dst_port, 10, -1, NULL, -1, -1));
+	KUNIT_EXPECT_TRUE(test, MATCH(src_port, -1, -1, dst_port, -1, -1));
+	/* The HopIDs of the two ends cannot be mixed up */
+	KUNIT_EXPECT_FALSE(test, MATCH(src_port, 10, 11, dst_port, 8, 9));
+	KUNIT_EXPECT_FALSE(test, MATCH(src_port, 9, -1, NULL, -1, -1));
+	KUNIT_EXPECT_FALSE(test, MATCH(dst_port, -1, 10, NULL, -1, -1));
+	/* Neither end is at the host interface */
+	KUNIT_EXPECT_FALSE(test, MATCH(nhi, -1, -1, NULL, -1, -1));
+
+	tb_tunnel_put(tunnel);
+
+#undef MATCH
+}
+
 static void tb_test_credit_alloc_legacy_not_bonded(struct kunit *test)
 {
 	struct tb_switch *host, *dev;
@@ -3382,6 +3615,174 @@ static void tb_test_credit_alloc_shared_hop(struct kunit *test)
 	usb4_switch_free_credit_pools(host);
 }
 
+/* Same as what tb_port_configure_xdomain() does for the credit pools */
+static void tb_test_connect_xdomain(struct kunit *test, struct tb_port *port)
+{
+	port->xdomain = kunit_kzalloc(test, sizeof(*port->xdomain), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, port->xdomain);
+	usb4_port_update_credit_pools(port);
+}
+
+static unsigned int tb_test_dma_credits_used(const struct tb_port *port)
+{
+	return usb4_credit_pool_used(&port->credit_pool[USB4_CREDIT_POOL_COMMON]);
+}
+
+static void tb_test_credit_alloc_dma_lane2lane(struct kunit *test)
+{
+	struct tb_port *src_port, *dst_port;
+	struct tb_switch *host, *dev;
+	struct tb_tunnel *tunnel;
+	struct tb_path *path;
+
+	host = alloc_host_usb4(test);
+	dev = alloc_dev_usb4(test, host, 0x3, true);
+
+	KUNIT_ASSERT_EQ(test, usb4_switch_alloc_credit_pools(host), 0);
+	KUNIT_ASSERT_EQ(test, usb4_switch_alloc_credit_pools(dev), 0);
+
+	src_port = &host->ports[1];
+	dst_port = &dev->ports[3];
+
+	tb_test_connect_xdomain(test, src_port);
+	tb_test_connect_xdomain(test, dst_port);
+
+	tunnel = tb_tunnel_alloc_dma(NULL, src_port, 8, 8, dst_port, 8, 8);
+	KUNIT_ASSERT_NOT_NULL(test, tunnel);
+	KUNIT_ASSERT_EQ(test, tunnel->npaths, (size_t)2);
+
+	/*
+	 * Both directions are treated the same way. The first hop is the
+	 * lane adapter facing the remote host so all its buffers are
+	 * available for DMA, the rest are allocated from the intermediate
+	 * hops. Both paths end to a lane adapter so flow control is
+	 * enabled on egress of every hop.
+	 */
+	path = tunnel->paths[0];
+	KUNIT_ASSERT_EQ(test, path->path_length, 2);
+	tb_test_check_path_fc(test, path, true);
+	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 14U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 14U);
+
+	path = tunnel->paths[1];
+	KUNIT_ASSERT_EQ(test, path->path_length, 2);
+	tb_test_check_path_fc(test, path, true);
+	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 14U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 14U);
+
+	tb_tunnel_put(tunnel);
+
+	usb4_switch_free_credit_pools(dev);
+	usb4_switch_free_credit_pools(host);
+}
+
+static void tb_test_credit_alloc_dma_lane2lane_multiple(struct kunit *test)
+{
+	struct tb_tunnel *tunnel1, *tunnel2, *tunnel3, *tunnel4, *tunnel5;
+	struct tb_port *src_port, *dst_port;
+	struct tb_tunnel *tunnel6;
+	struct tb_switch *host;
+	struct tb_path *path;
+
+	host = alloc_host_usb4(test);
+
+	KUNIT_ASSERT_EQ(test, usb4_switch_alloc_credit_pools(host), 0);
+
+	src_port = &host->ports[1];
+	dst_port = &host->ports[3];
+
+	tb_test_connect_xdomain(test, src_port);
+	tb_test_connect_xdomain(test, dst_port);
+
+	/*
+	 * Couple the two hosts connected to lane adapters 1 and 3 several
+	 * times, each coupling using different HopIDs.
+	 *
+	 * Neither lane adapter tunnels other protocols so all their
+	 * buffers except the ones reserved for control traffic stay in
+	 * the common pool:
+	 *
+	 *   60 - 2 = 58
+	 *
+	 * Each coupling takes 14 of those from both adapters, so the first
+	 * four get what they asked for, the fifth gets the remaining 2 and
+	 * after that we run out of buffers.
+	 */
+	tunnel1 = tb_tunnel_alloc_dma(NULL, src_port, 8, 8, dst_port, 8, 8);
+	KUNIT_ASSERT_NOT_NULL(test, tunnel1);
+	KUNIT_ASSERT_EQ(test, tunnel1->npaths, (size_t)2);
+
+	path = tunnel1->paths[0];
+	KUNIT_ASSERT_EQ(test, path->path_length, 1);
+	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 14U);
+
+	path = tunnel1->paths[1];
+	KUNIT_ASSERT_EQ(test, path->path_length, 1);
+	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 14U);
+
+	tunnel2 = tb_tunnel_alloc_dma(NULL, src_port, 9, 9, dst_port, 9, 9);
+	KUNIT_ASSERT_NOT_NULL(test, tunnel2);
+	tunnel3 = tb_tunnel_alloc_dma(NULL, src_port, 10, 10, dst_port, 10, 10);
+	KUNIT_ASSERT_NOT_NULL(test, tunnel3);
+	tunnel4 = tb_tunnel_alloc_dma(NULL, src_port, 11, 11, dst_port, 11, 11);
+	KUNIT_ASSERT_NOT_NULL(test, tunnel4);
+
+	path = tunnel4->paths[0];
+	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 14U);
+	path = tunnel4->paths[1];
+	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 14U);
+
+	/* Both adapters have now handed out 4 * 14 = 56 of their 58 */
+	KUNIT_EXPECT_EQ(test, tb_test_dma_credits_used(src_port), 56U);
+	KUNIT_EXPECT_EQ(test, tb_test_dma_credits_used(dst_port), 56U);
+
+	/* The fifth one has to make do with what is left */
+	tunnel5 = tb_tunnel_alloc_dma(NULL, src_port, 12, 12, dst_port, 12, 12);
+	KUNIT_ASSERT_NOT_NULL(test, tunnel5);
+
+	path = tunnel5->paths[0];
+	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 2U);
+	path = tunnel5->paths[1];
+	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 2U);
+
+	KUNIT_EXPECT_EQ(test, tb_test_dma_credits_used(src_port), 58U);
+	KUNIT_EXPECT_EQ(test, tb_test_dma_credits_used(dst_port), 58U);
+
+	/* And the sixth one no longer fits */
+	tunnel6 = tb_tunnel_alloc_dma(NULL, src_port, 13, 13, dst_port, 13, 13);
+	KUNIT_ASSERT_NULL(test, tunnel6);
+
+	/* Releasing the first one makes room for another */
+	tb_tunnel_put(tunnel1);
+	KUNIT_EXPECT_EQ(test, tb_test_dma_credits_used(src_port), 44U);
+	KUNIT_EXPECT_EQ(test, tb_test_dma_credits_used(dst_port), 44U);
+
+	tunnel1 = tb_tunnel_alloc_dma(NULL, src_port, 13, 13, dst_port, 13, 13);
+	KUNIT_ASSERT_NOT_NULL(test, tunnel1);
+
+	path = tunnel1->paths[0];
+	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 14U);
+	path = tunnel1->paths[1];
+	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 14U);
+
+	tb_tunnel_put(tunnel5);
+	tb_tunnel_put(tunnel4);
+	tb_tunnel_put(tunnel3);
+	tb_tunnel_put(tunnel2);
+	tb_tunnel_put(tunnel1);
+
+	KUNIT_EXPECT_EQ(test, tb_test_dma_credits_used(src_port), 0U);
+	KUNIT_EXPECT_EQ(test, tb_test_dma_credits_used(dst_port), 0U);
+
+	usb4_switch_free_credit_pools(host);
+}
+
 static struct tb_tunnel *TB_TEST_PCIE_TUNNEL(struct kunit *test,
 			struct tb_switch *host, struct tb_switch *dev)
 {
@@ -4147,6 +4548,11 @@ static struct kunit_case tb_test_cases[] = {
 	KUNIT_CASE(tb_test_tunnel_dma_tx),
 	KUNIT_CASE(tb_test_tunnel_dma_chain),
 	KUNIT_CASE(tb_test_tunnel_dma_match),
+	KUNIT_CASE(tb_test_tunnel_dma_lane2lane),
+	KUNIT_CASE(tb_test_tunnel_dma_lane2lane_one_way),
+	KUNIT_CASE(tb_test_tunnel_dma_lane2lane_chain),
+	KUNIT_CASE(tb_test_tunnel_dma_lane2lane_hub),
+	KUNIT_CASE(tb_test_tunnel_dma_lane2lane_match),
 	KUNIT_CASE(tb_test_credit_alloc_legacy_not_bonded),
 	KUNIT_CASE(tb_test_credit_alloc_legacy_bonded),
 	KUNIT_CASE(tb_test_credit_alloc_pcie),
@@ -4166,6 +4572,8 @@ static struct kunit_case tb_test_cases[] = {
 	KUNIT_CASE(tb_test_credit_alloc_dma_shared_mixed),
 	KUNIT_CASE(tb_test_credit_alloc_dma_shared_no_credit_allocation),
 	KUNIT_CASE(tb_test_credit_alloc_shared_hop),
+	KUNIT_CASE(tb_test_credit_alloc_dma_lane2lane),
+	KUNIT_CASE(tb_test_credit_alloc_dma_lane2lane_multiple),
 	KUNIT_CASE(tb_test_credit_alloc_all),
 	KUNIT_CASE(tb_test_property_parse),
 	KUNIT_CASE(tb_test_property_format),
-- 
2.50.1

