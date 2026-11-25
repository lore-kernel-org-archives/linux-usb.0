Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795621286;
	b=AItdDoWpxjTJIFdgPkrhXrUj/on8biMeARHQn3rFaKwjwWwuUR3wQJYSaafs+nIgSoCb
	 Q6iQrWvaa0kVhPIUuVEpV+46suWSAZ7RL9gj3aNLrTcXHP72vqNAdg94dB5M7IHsC9gfL
	 o+3ubsZLKBhkMXEFou6g7sBHZbcETTWHB5IkVKgUyd+nG4vumS3N9ZJgEqvyOJ/PC63VI
	 z6PxEXwVO6+kW2pvLF7hVZlKP7ktxvAmL2aV9H1MHFWPJmJFEb9oeLp/TTpYLmHbampKK
	 3KJt12GKOKeJ78C8Bz1aDhuPd/Z37ruv5/XQ3NaUBM9B6/W5F4uGld//eOcMn2QhzWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795621286;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=A1P3eqW6wSWnfgh6eMJtvsRwWebMP0I3ter4qPZ7JaQ=;
	b=jce18gZSv5V6Ko4cT19fdWyem+WVtgWwKBFHA6ZevAwHDsNidDaGX+GyzODGqLhOVNaS
	 lZFU/s7bPv2da5n3Rtojk6YSslsPr4SFQmmFRPZBw+RUfGnG15HqzztiCl7sYxKHxIXK5
	 RPV/a2fb3w3sSNSGgGOmlp7ubgv4Rh2oTkP5dGfRVi5FgDj2pjIYleCaQP/Rnb44IUhGi
	 1pVCxTF9lhuexnrLG3UuQOued8HO+oqKDZJL+fbYleEhE0wBG+pPPA/7dwa/ZOtJg8zpo
	 NvpMaqsexGBvf881nQh16JP87zXc2A2EKa2FmXi8v454jC+/FxEHlu8vHMk2O4oPeYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Zd1dsHNq;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6DB60A2616
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 15:41:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A6DB60A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Zd1dsHNq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795621285; x=1827157285;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uk7JzW2jl6+I3Xfz4nJJgELqOrdELOakV6ea8GXFkUI=;
  b=Zd1dsHNqDL0gfcbHvvqjXe4GZRHbiuG6QwPOMulSmnXTm/fZIDyr8yVb
   qOnTtrg3q8G4v4u9rJKBEjSd+fz6q3vPAe5GRZOK4WT++g9owgU9rdjM3
   +BLqj1vZ7/pv0QHPLcxAmnWpx3pndPguTQPm9+S8Q2vVqjdj62gM43jvF
   ZLrGZYzJKjT1hnSbNkLBG5DjM26tgdUZ97UGbnRQH7fw75ZuakulWqzEe
   ewAqT9cNxX2kShD1cbcMVwql/nKiFthUWNt0SFhnAeFLnoEGqtA8YKs1P
   9L/IkkBmGOScky5SY/HgFkFGvfOUr9uqXsFo24UcghLat2Tiiq0Et5GbT
   g==;
X-CSE-ConnectionGUID: EeoXNx8sTQqnaALyVl/XiA==
X-CSE-MsgGUID: ylGh37xsRS+NZmXGh7xgiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4408781"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4408781"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 07:35:34 -0800
X-CSE-ConnectionGUID: YB0CUrIARNemZcRO5tBlSQ==
X-CSE-MsgGUID: EWFRFvN4SpaGHoH89ZpfHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="11884787"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa007.jf.intel.com with ESMTP; 25 Nov 2026 07:26:26 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 15C39A2; Wed, 25 Nov 2026 16:26:23 +0100 (CET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Mika Westerberg <westeri@kernel.org>
Subject: [PATCH 5/9] thunderbolt: Allow DMA tunnel also between two lane adapters
Date: Wed, 25 Nov 2026 16:26:18 +0100
Message-ID: <20261125152623.456054-6-mika.westerberg@linux.intel.com>
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

At the moment we only support DMA tunnels between two hosts so that it
ends up or starts from the host interface adapter. This is the typical
use-case. However, it is entirely possible to make a DMA tunnel from one
lane adapter to another so acting as "passthrough" instead of ending or
starting the traffic.

This modifies the existing DMA tunneling functions to support lane
adapter to lane adapter tunnels as well.

Signed-off-by: Mika Westerberg (Intel) <westeri@kernel.org>
---
 drivers/thunderbolt/tb.c     |  11 +--
 drivers/thunderbolt/test.c   | 150 ++++++++++++++++--------------
 drivers/thunderbolt/tunnel.c | 171 +++++++++++++++++++++--------------
 drivers/thunderbolt/tunnel.h |  14 +--
 4 files changed, 194 insertions(+), 152 deletions(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 10fca534ff78..c7a009a62411 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -2393,8 +2393,8 @@ static int tb_approve_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
 	 */
 	tb_disable_clx(sw);
 
-	tunnel = tb_tunnel_alloc_dma(tb, nhi_port, dst_port, transmit_path,
-				     transmit_ring, receive_path, receive_ring);
+	tunnel = tb_tunnel_alloc_dma(tb, nhi_port, transmit_ring, receive_ring,
+				     dst_port, receive_path, transmit_path);
 	if (!tunnel) {
 		ret = -ENOMEM;
 		goto err_clx;
@@ -2437,11 +2437,10 @@ static void __tb_disconnect_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
 	list_for_each_entry_safe(tunnel, n, &tcm->tunnel_list, list) {
 		if (!tb_tunnel_is_dma(tunnel))
 			continue;
-		if (tunnel->src_port != nhi_port || tunnel->dst_port != dst_port)
-			continue;
 
-		if (tb_tunnel_match_dma(tunnel, transmit_path, transmit_ring,
-					receive_path, receive_ring))
+		if (tb_tunnel_match_dma(tunnel, nhi_port, transmit_ring,
+					receive_ring, dst_port, receive_path,
+					transmit_path))
 			tb_deactivate_and_free_tunnel(tunnel);
 	}
 
diff --git a/drivers/thunderbolt/test.c b/drivers/thunderbolt/test.c
index 3fa9c4661541..0321408fe91c 100644
--- a/drivers/thunderbolt/test.c
+++ b/drivers/thunderbolt/test.c
@@ -1924,7 +1924,7 @@ static void tb_test_tunnel_dma(struct kunit *test)
 	nhi = &host->ports[7];
 	port = &host->ports[1];
 
-	tunnel = tb_tunnel_alloc_dma(NULL, nhi, port, 8, 1, 8, 1);
+	tunnel = tb_tunnel_alloc_dma(NULL, nhi, 1, 1, port, 8, 8);
 	KUNIT_ASSERT_NOT_NULL(test, tunnel);
 	KUNIT_EXPECT_EQ(test, tunnel->type, TB_TUNNEL_DMA);
 	KUNIT_EXPECT_PTR_EQ(test, tunnel->src_port, nhi);
@@ -1967,7 +1967,7 @@ static void tb_test_tunnel_dma_rx(struct kunit *test)
 	nhi = &host->ports[7];
 	port = &host->ports[1];
 
-	tunnel = tb_tunnel_alloc_dma(NULL, nhi, port, -1, -1, 15, 2);
+	tunnel = tb_tunnel_alloc_dma(NULL, nhi, -1, 2, port, 15, -1);
 	KUNIT_ASSERT_NOT_NULL(test, tunnel);
 	KUNIT_EXPECT_EQ(test, tunnel->type, TB_TUNNEL_DMA);
 	KUNIT_EXPECT_PTR_EQ(test, tunnel->src_port, nhi);
@@ -2006,7 +2006,7 @@ static void tb_test_tunnel_dma_tx(struct kunit *test)
 	nhi = &host->ports[7];
 	port = &host->ports[1];
 
-	tunnel = tb_tunnel_alloc_dma(NULL, nhi, port, 15, 2, -1, -1);
+	tunnel = tb_tunnel_alloc_dma(NULL, nhi, 2, -1, port, -1, 15);
 	KUNIT_ASSERT_NOT_NULL(test, tunnel);
 	KUNIT_EXPECT_EQ(test, tunnel->type, TB_TUNNEL_DMA);
 	KUNIT_EXPECT_PTR_EQ(test, tunnel->src_port, nhi);
@@ -2054,7 +2054,7 @@ static void tb_test_tunnel_dma_chain(struct kunit *test)
 
 	nhi = &host->ports[7];
 	port = &dev2->ports[3];
-	tunnel = tb_tunnel_alloc_dma(NULL, nhi, port, 8, 1, 8, 1);
+	tunnel = tb_tunnel_alloc_dma(NULL, nhi, 1, 1, port, 8, 8);
 	KUNIT_ASSERT_NOT_NULL(test, tunnel);
 	KUNIT_EXPECT_EQ(test, tunnel->type, TB_TUNNEL_DMA);
 	KUNIT_EXPECT_PTR_EQ(test, tunnel->src_port, nhi);
@@ -2103,45 +2103,55 @@ static void tb_test_tunnel_dma_match(struct kunit *test)
 	nhi = &host->ports[7];
 	port = &host->ports[1];
 
-	tunnel = tb_tunnel_alloc_dma(NULL, nhi, port, 15, 1, 15, 1);
+	tunnel = tb_tunnel_alloc_dma(NULL, nhi, 1, 1, port, 15, 15);
 	KUNIT_ASSERT_NOT_NULL(test, tunnel);
 
-	KUNIT_ASSERT_TRUE(test, tb_tunnel_match_dma(tunnel, 15, 1, 15, 1));
-	KUNIT_ASSERT_FALSE(test, tb_tunnel_match_dma(tunnel, 8, 1, 15, 1));
-	KUNIT_ASSERT_TRUE(test, tb_tunnel_match_dma(tunnel, -1, -1, 15, 1));
-	KUNIT_ASSERT_TRUE(test, tb_tunnel_match_dma(tunnel, 15, 1, -1, -1));
-	KUNIT_ASSERT_TRUE(test, tb_tunnel_match_dma(tunnel, 15, -1, -1, -1));
-	KUNIT_ASSERT_TRUE(test, tb_tunnel_match_dma(tunnel, -1, 1, -1, -1));
-	KUNIT_ASSERT_TRUE(test, tb_tunnel_match_dma(tunnel, -1, -1, 15, -1));
-	KUNIT_ASSERT_TRUE(test, tb_tunnel_match_dma(tunnel, -1, -1, -1, 1));
-	KUNIT_ASSERT_TRUE(test, tb_tunnel_match_dma(tunnel, -1, -1, -1, -1));
-	KUNIT_ASSERT_FALSE(test, tb_tunnel_match_dma(tunnel, 8, -1, 8, -1));
+#define MATCH(src, src_in, src_out, dst, dst_in, dst_out) \
+	tb_tunnel_match_dma(tunnel, src, src_in, src_out, dst, dst_in, dst_out)
+
+	KUNIT_ASSERT_TRUE(test, MATCH(nhi, 1, 1, port, 15, 15));
+	KUNIT_ASSERT_FALSE(test, MATCH(nhi, 1, 1, port, 15, 8));
+	KUNIT_ASSERT_TRUE(test, MATCH(nhi, -1, 1, port, 15, -1));
+	KUNIT_ASSERT_TRUE(test, MATCH(nhi, 1, -1, port, -1, 15));
+	KUNIT_ASSERT_TRUE(test, MATCH(nhi, -1, -1, port, -1, 15));
+	KUNIT_ASSERT_TRUE(test, MATCH(nhi, 1, -1, port, -1, -1));
+	KUNIT_ASSERT_TRUE(test, MATCH(nhi, -1, -1, port, 15, -1));
+	KUNIT_ASSERT_TRUE(test, MATCH(nhi, -1, 1, port, -1, -1));
+	KUNIT_ASSERT_TRUE(test, MATCH(nhi, -1, -1, port, -1, -1));
+	KUNIT_ASSERT_TRUE(test, MATCH(NULL, -1, -1, NULL, -1, -1));
+	KUNIT_ASSERT_FALSE(test, MATCH(nhi, -1, -1, port, 8, 8));
+	/* The two ends can be given in either order */
+	KUNIT_ASSERT_TRUE(test, MATCH(port, 15, 15, nhi, 1, 1));
+	/* The tunnel does not end to this port */
+	KUNIT_ASSERT_FALSE(test, MATCH(nhi, -1, -1, &host->ports[3], -1, -1));
 
 	tb_tunnel_put(tunnel);
 
-	tunnel = tb_tunnel_alloc_dma(NULL, nhi, port, 15, 1, -1, -1);
+	tunnel = tb_tunnel_alloc_dma(NULL, nhi, 1, -1, port, -1, 15);
 	KUNIT_ASSERT_NOT_NULL(test, tunnel);
-	KUNIT_ASSERT_TRUE(test, tb_tunnel_match_dma(tunnel, 15, 1, -1, -1));
-	KUNIT_ASSERT_TRUE(test, tb_tunnel_match_dma(tunnel, 15, -1, -1, -1));
-	KUNIT_ASSERT_TRUE(test, tb_tunnel_match_dma(tunnel, -1, 1, -1, -1));
-	KUNIT_ASSERT_TRUE(test, tb_tunnel_match_dma(tunnel, -1, -1, -1, -1));
-	KUNIT_ASSERT_FALSE(test, tb_tunnel_match_dma(tunnel, 15, 1, 15, 1));
-	KUNIT_ASSERT_FALSE(test, tb_tunnel_match_dma(tunnel, -1, -1, 15, 1));
-	KUNIT_ASSERT_FALSE(test, tb_tunnel_match_dma(tunnel, 15, 11, -1, -1));
+	KUNIT_ASSERT_TRUE(test, MATCH(nhi, 1, -1, port, -1, 15));
+	KUNIT_ASSERT_TRUE(test, MATCH(nhi, -1, -1, port, -1, 15));
+	KUNIT_ASSERT_TRUE(test, MATCH(nhi, 1, -1, port, -1, -1));
+	KUNIT_ASSERT_TRUE(test, MATCH(nhi, -1, -1, port, -1, -1));
+	KUNIT_ASSERT_FALSE(test, MATCH(nhi, 1, 1, port, 15, 15));
+	KUNIT_ASSERT_FALSE(test, MATCH(nhi, -1, 1, port, 15, -1));
+	KUNIT_ASSERT_FALSE(test, MATCH(nhi, 11, -1, port, -1, 15));
 
 	tb_tunnel_put(tunnel);
 
-	tunnel = tb_tunnel_alloc_dma(NULL, nhi, port, -1, -1, 15, 11);
+	tunnel = tb_tunnel_alloc_dma(NULL, nhi, -1, 11, port, 15, -1);
 	KUNIT_ASSERT_NOT_NULL(test, tunnel);
-	KUNIT_ASSERT_TRUE(test, tb_tunnel_match_dma(tunnel, -1, -1, 15, 11));
-	KUNIT_ASSERT_TRUE(test, tb_tunnel_match_dma(tunnel, -1, -1, 15, -1));
-	KUNIT_ASSERT_TRUE(test, tb_tunnel_match_dma(tunnel, -1, -1, -1, 11));
-	KUNIT_ASSERT_TRUE(test, tb_tunnel_match_dma(tunnel, -1, -1, -1, -1));
-	KUNIT_ASSERT_FALSE(test, tb_tunnel_match_dma(tunnel, -1, -1, 15, 1));
-	KUNIT_ASSERT_FALSE(test, tb_tunnel_match_dma(tunnel, -1, -1, 10, 11));
-	KUNIT_ASSERT_FALSE(test, tb_tunnel_match_dma(tunnel, 15, 11, -1, -1));
+	KUNIT_ASSERT_TRUE(test, MATCH(nhi, -1, 11, port, 15, -1));
+	KUNIT_ASSERT_TRUE(test, MATCH(nhi, -1, -1, port, 15, -1));
+	KUNIT_ASSERT_TRUE(test, MATCH(nhi, -1, 11, port, -1, -1));
+	KUNIT_ASSERT_TRUE(test, MATCH(nhi, -1, -1, port, -1, -1));
+	KUNIT_ASSERT_FALSE(test, MATCH(nhi, -1, 1, port, 15, -1));
+	KUNIT_ASSERT_FALSE(test, MATCH(nhi, -1, 11, port, 10, -1));
+	KUNIT_ASSERT_FALSE(test, MATCH(nhi, 11, -1, port, -1, 15));
 
 	tb_tunnel_put(tunnel);
+
+#undef MATCH
 }
 
 static void tb_test_credit_alloc_legacy_not_bonded(struct kunit *test)
@@ -2642,7 +2652,7 @@ static void tb_test_credit_alloc_dma(struct kunit *test)
 	nhi = &host->ports[7];
 	port = &dev->ports[3];
 
-	tunnel = tb_tunnel_alloc_dma(NULL, nhi, port, 8, 1, 8, 1);
+	tunnel = tb_tunnel_alloc_dma(NULL, nhi, 1, 1, port, 8, 8);
 	KUNIT_ASSERT_NOT_NULL(test, tunnel);
 	KUNIT_ASSERT_EQ(test, tunnel->npaths, (size_t)2);
 
@@ -2712,7 +2722,7 @@ static void tb_test_credit_alloc_dma_multiple(struct kunit *test)
 	 * Tunnel 6 fails initially then we release tunnel 1 and then
 	 * tunnel 6 gets full 14 for both sides.
 	 */
-	tunnel1 = tb_tunnel_alloc_dma(NULL, nhi, port, 8, 1, 8, 1);
+	tunnel1 = tb_tunnel_alloc_dma(NULL, nhi, 1, 1, port, 8, 8);
 	KUNIT_ASSERT_NOT_NULL(test, tunnel1);
 	KUNIT_ASSERT_EQ(test, tunnel1->npaths, (size_t)2);
 
@@ -2732,7 +2742,7 @@ static void tb_test_credit_alloc_dma_multiple(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 14U);
 
-	tunnel2 = tb_tunnel_alloc_dma(NULL, nhi, port, 9, 2, 9, 2);
+	tunnel2 = tb_tunnel_alloc_dma(NULL, nhi, 2, 2, port, 9, 9);
 	KUNIT_ASSERT_NOT_NULL(test, tunnel2);
 	KUNIT_ASSERT_EQ(test, tunnel2->npaths, (size_t)2);
 
@@ -2752,7 +2762,7 @@ static void tb_test_credit_alloc_dma_multiple(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 14U);
 
-	tunnel3 = tb_tunnel_alloc_dma(NULL, nhi, port, 10, 3, 10, 3);
+	tunnel3 = tb_tunnel_alloc_dma(NULL, nhi, 3, 3, port, 10, 10);
 	KUNIT_ASSERT_NOT_NULL(test, tunnel3);
 	KUNIT_ASSERT_EQ(test, tunnel3->npaths, (size_t)2);
 
@@ -2772,7 +2782,7 @@ static void tb_test_credit_alloc_dma_multiple(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 14U);
 
-	tunnel4 = tb_tunnel_alloc_dma(NULL, nhi, port, 11, 4, 11, 4);
+	tunnel4 = tb_tunnel_alloc_dma(NULL, nhi, 4, 4, port, 11, 11);
 	KUNIT_ASSERT_NOT_NULL(test, tunnel4);
 	KUNIT_ASSERT_EQ(test, tunnel4->npaths, (size_t)2);
 
@@ -2792,7 +2802,7 @@ static void tb_test_credit_alloc_dma_multiple(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 10U);
 
-	tunnel5 = tb_tunnel_alloc_dma(NULL, nhi, port, 12, 5, 12, 5);
+	tunnel5 = tb_tunnel_alloc_dma(NULL, nhi, 5, 5, port, 12, 12);
 	KUNIT_ASSERT_NOT_NULL(test, tunnel5);
 	KUNIT_ASSERT_EQ(test, tunnel5->npaths, (size_t)2);
 
@@ -2812,12 +2822,12 @@ static void tb_test_credit_alloc_dma_multiple(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 1U);
 
-	tunnel6 = tb_tunnel_alloc_dma(NULL, nhi, port, 13, 6, 13, 6);
+	tunnel6 = tb_tunnel_alloc_dma(NULL, nhi, 6, 6, port, 13, 13);
 	KUNIT_ASSERT_NULL(test, tunnel6);
 
 	tb_tunnel_put(tunnel1);
 
-	tunnel6 = tb_tunnel_alloc_dma(NULL, nhi, port, 13, 6, 13, 6);
+	tunnel6 = tb_tunnel_alloc_dma(NULL, nhi, 6, 6, port, 13, 13);
 	KUNIT_ASSERT_NOT_NULL(test, tunnel6);
 	KUNIT_ASSERT_EQ(test, tunnel6->npaths, (size_t)2);
 
@@ -2933,7 +2943,7 @@ static void tb_test_credit_alloc_dma_shared(struct kunit *test)
 	 * (port 3) is not part of the link so it uses dedicated
 	 * buffers.
 	 */
-	tunnel = tb_tunnel_alloc_dma(NULL, nhi, port, 8, 1, 8, 1);
+	tunnel = tb_tunnel_alloc_dma(NULL, nhi, 1, 1, port, 8, 8);
 	tb_test_check_dma_tunnel(test, tunnel, 14, 14, 14, true);
 
 	tb_test_check_shared(test, &host->ports[1], 14, 1);
@@ -2974,15 +2984,15 @@ static void tb_test_credit_alloc_dma_multiple_shared(struct kunit *test)
 	 * dev ingress port (3) is still using dedicated for the
 	 * inter-domain link (and runs out of credits the same way).
 	 */
-	tunnel1 = tb_tunnel_alloc_dma(NULL, nhi, port, 8, 1, 8, 1);
+	tunnel1 = tb_tunnel_alloc_dma(NULL, nhi, 1, 1, port, 8, 8);
 	tb_test_check_dma_tunnel(test, tunnel1, 14, 14, 14, true);
-	tunnel2 = tb_tunnel_alloc_dma(NULL, nhi, port, 9, 2, 9, 2);
+	tunnel2 = tb_tunnel_alloc_dma(NULL, nhi, 2, 2, port, 9, 9);
 	tb_test_check_dma_tunnel(test, tunnel2, 14, 14, 14, true);
-	tunnel3 = tb_tunnel_alloc_dma(NULL, nhi, port, 10, 3, 10, 3);
+	tunnel3 = tb_tunnel_alloc_dma(NULL, nhi, 3, 3, port, 10, 10);
 	tb_test_check_dma_tunnel(test, tunnel3, 14, 14, 14, true);
-	tunnel4 = tb_tunnel_alloc_dma(NULL, nhi, port, 11, 4, 11, 4);
+	tunnel4 = tb_tunnel_alloc_dma(NULL, nhi, 4, 4, port, 11, 11);
 	tb_test_check_dma_tunnel(test, tunnel4, 4, 14, 14, true);
-	tunnel5 = tb_tunnel_alloc_dma(NULL, nhi, port, 12, 5, 12, 5);
+	tunnel5 = tb_tunnel_alloc_dma(NULL, nhi, 5, 5, port, 12, 12);
 	tb_test_check_dma_tunnel(test, tunnel5, 1, 14, 14, true);
 
 	tb_test_check_shared(test, &host->ports[1], 14, 5);
@@ -2993,7 +3003,7 @@ static void tb_test_credit_alloc_dma_multiple_shared(struct kunit *test)
 	 * shared buffers are allocated. Releasing the failed tunnel
 	 * must not drop the users of the shared buffers.
 	 */
-	tunnel6 = tb_tunnel_alloc_dma(NULL, nhi, port, 13, 6, 13, 6);
+	tunnel6 = tb_tunnel_alloc_dma(NULL, nhi, 6, 6, port, 13, 13);
 	KUNIT_ASSERT_NULL(test, tunnel6);
 
 	tb_test_check_shared(test, &host->ports[1], 14, 5);
@@ -3004,7 +3014,7 @@ static void tb_test_credit_alloc_dma_multiple_shared(struct kunit *test)
 	tb_test_check_shared(test, &host->ports[1], 14, 4);
 	tb_test_check_shared(test, &dev->ports[1], 14, 4);
 
-	tunnel6 = tb_tunnel_alloc_dma(NULL, nhi, port, 13, 6, 13, 6);
+	tunnel6 = tb_tunnel_alloc_dma(NULL, nhi, 6, 6, port, 13, 13);
 	tb_test_check_dma_tunnel(test, tunnel6, 14, 14, 14, true);
 
 	tb_test_check_shared(test, &host->ports[1], 14, 5);
@@ -3027,17 +3037,17 @@ static void tb_test_credit_alloc_dma_multiple_shared(struct kunit *test)
 	tb_switch_disable_shared_buffering(host);
 	tb_switch_disable_shared_buffering(dev);
 
-	tunnel1 = tb_tunnel_alloc_dma(NULL, nhi, port, 8, 1, 8, 1);
+	tunnel1 = tb_tunnel_alloc_dma(NULL, nhi, 1, 1, port, 8, 8);
 	tb_test_check_dma_tunnel(test, tunnel1, 14, 14, 14, false);
-	tunnel2 = tb_tunnel_alloc_dma(NULL, nhi, port, 9, 2, 9, 2);
+	tunnel2 = tb_tunnel_alloc_dma(NULL, nhi, 2, 2, port, 9, 9);
 	tb_test_check_dma_tunnel(test, tunnel2, 14, 14, 14, false);
-	tunnel3 = tb_tunnel_alloc_dma(NULL, nhi, port, 10, 3, 10, 3);
+	tunnel3 = tb_tunnel_alloc_dma(NULL, nhi, 3, 3, port, 10, 10);
 	tb_test_check_dma_tunnel(test, tunnel3, 14, 14, 14, false);
-	tunnel4 = tb_tunnel_alloc_dma(NULL, nhi, port, 11, 4, 11, 4);
+	tunnel4 = tb_tunnel_alloc_dma(NULL, nhi, 4, 4, port, 11, 11);
 	tb_test_check_dma_tunnel(test, tunnel4, 4, 14, 10, false);
-	tunnel5 = tb_tunnel_alloc_dma(NULL, nhi, port, 12, 5, 12, 5);
+	tunnel5 = tb_tunnel_alloc_dma(NULL, nhi, 5, 5, port, 12, 12);
 	tb_test_check_dma_tunnel(test, tunnel5, 1, 14, 1, false);
-	tunnel6 = tb_tunnel_alloc_dma(NULL, nhi, port, 13, 6, 13, 6);
+	tunnel6 = tb_tunnel_alloc_dma(NULL, nhi, 6, 6, port, 13, 13);
 	KUNIT_ASSERT_NULL(test, tunnel6);
 
 	tb_tunnel_put(tunnel5);
@@ -3071,11 +3081,11 @@ static void tb_test_credit_alloc_dma_shared_partial(struct kunit *test)
 	 * with dedicated buffers. This leaves 52 - 3 * 14 = 10 credits
 	 * there.
 	 */
-	tunnel1 = tb_tunnel_alloc_dma(NULL, nhi, port, 8, 1, 8, 1);
+	tunnel1 = tb_tunnel_alloc_dma(NULL, nhi, 1, 1, port, 8, 8);
 	tb_test_check_dma_tunnel(test, tunnel1, 14, 14, 14, false);
-	tunnel2 = tb_tunnel_alloc_dma(NULL, nhi, port, 9, 2, 9, 2);
+	tunnel2 = tb_tunnel_alloc_dma(NULL, nhi, 2, 2, port, 9, 9);
 	tb_test_check_dma_tunnel(test, tunnel2, 14, 14, 14, false);
-	tunnel3 = tb_tunnel_alloc_dma(NULL, nhi, port, 10, 3, 10, 3);
+	tunnel3 = tb_tunnel_alloc_dma(NULL, nhi, 3, 3, port, 10, 10);
 	tb_test_check_dma_tunnel(test, tunnel3, 14, 14, 14, false);
 
 	/*
@@ -3086,14 +3096,14 @@ static void tb_test_credit_alloc_dma_shared_partial(struct kunit *test)
 	tb_switch_enable_shared_buffering(host);
 	tb_switch_enable_shared_buffering(dev);
 
-	tunnel4 = tb_tunnel_alloc_dma(NULL, nhi, port, 11, 4, 11, 4);
+	tunnel4 = tb_tunnel_alloc_dma(NULL, nhi, 4, 4, port, 11, 11);
 	tb_test_check_dma_tunnel(test, tunnel4, 4, 14, 10, true);
 
 	tb_test_check_shared(test, &host->ports[1], 14, 1);
 	tb_test_check_shared(test, &dev->ports[1], 10, 1);
 
 	/* This one joins the existing shared buffers */
-	tunnel5 = tb_tunnel_alloc_dma(NULL, nhi, port, 12, 5, 12, 5);
+	tunnel5 = tb_tunnel_alloc_dma(NULL, nhi, 5, 5, port, 12, 12);
 	tb_test_check_dma_tunnel(test, tunnel5, 1, 14, 10, true);
 
 	tb_test_check_shared(test, &host->ports[1], 14, 2);
@@ -3117,9 +3127,9 @@ static void tb_test_credit_alloc_dma_shared_partial(struct kunit *test)
 	tb_switch_disable_shared_buffering(host);
 	tb_switch_disable_shared_buffering(dev);
 
-	tunnel4 = tb_tunnel_alloc_dma(NULL, nhi, port, 11, 4, 11, 4);
+	tunnel4 = tb_tunnel_alloc_dma(NULL, nhi, 4, 4, port, 11, 11);
 	tb_test_check_dma_tunnel(test, tunnel4, 4, 14, 10, false);
-	tunnel5 = tb_tunnel_alloc_dma(NULL, nhi, port, 12, 5, 12, 5);
+	tunnel5 = tb_tunnel_alloc_dma(NULL, nhi, 5, 5, port, 12, 12);
 	tb_test_check_dma_tunnel(test, tunnel5, 1, 14, 1, false);
 
 	tb_tunnel_put(tunnel5);
@@ -3153,13 +3163,13 @@ static void tb_test_credit_alloc_dma_shared_reserved(struct kunit *test)
 	common = &up->credit_pool[USB4_CREDIT_POOL_COMMON];
 	dma = &up->credit_pool[USB4_CREDIT_POOL_DMA];
 
-	tunnel1 = tb_tunnel_alloc_dma(NULL, nhi, port, 8, 1, 8, 1);
+	tunnel1 = tb_tunnel_alloc_dma(NULL, nhi, 1, 1, port, 8, 8);
 	tb_test_check_dma_tunnel(test, tunnel1, 14, 14, 14, false);
-	tunnel2 = tb_tunnel_alloc_dma(NULL, nhi, port, 9, 2, 9, 2);
+	tunnel2 = tb_tunnel_alloc_dma(NULL, nhi, 2, 2, port, 9, 9);
 	tb_test_check_dma_tunnel(test, tunnel2, 14, 14, 14, false);
-	tunnel3 = tb_tunnel_alloc_dma(NULL, nhi, port, 10, 3, 10, 3);
+	tunnel3 = tb_tunnel_alloc_dma(NULL, nhi, 3, 3, port, 10, 10);
 	tb_test_check_dma_tunnel(test, tunnel3, 14, 14, 14, false);
-	tunnel4 = tb_tunnel_alloc_dma(NULL, nhi, port, 11, 4, 11, 4);
+	tunnel4 = tb_tunnel_alloc_dma(NULL, nhi, 4, 4, port, 11, 11);
 	tb_test_check_dma_tunnel(test, tunnel4, 4, 14, 10, false);
 
 	KUNIT_EXPECT_EQ(test, usb4_credit_pool_available(common), 0U);
@@ -3174,7 +3184,7 @@ static void tb_test_credit_alloc_dma_shared_reserved(struct kunit *test)
 	 * the shared buffers get the minimum from the DMA pool, same as
 	 * the dedicated buffers would.
 	 */
-	tunnel5 = tb_tunnel_alloc_dma(NULL, nhi, port, 12, 5, 12, 5);
+	tunnel5 = tb_tunnel_alloc_dma(NULL, nhi, 5, 5, port, 12, 12);
 	tb_test_check_dma_tunnel(test, tunnel5, 1, 14, 1, true);
 	tb_test_check_shared(test, up, 1, 1);
 	KUNIT_EXPECT_PTR_EQ(test, up->shared_pool, dma);
@@ -3182,7 +3192,7 @@ static void tb_test_credit_alloc_dma_shared_reserved(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, usb4_credit_pool_used(dma), 1U);
 
 	/* Port 3 has run out so this one goes through port 5 instead */
-	tunnel6 = tb_tunnel_alloc_dma(NULL, nhi, &dev->ports[5], 8, 6, 8, 6);
+	tunnel6 = tb_tunnel_alloc_dma(NULL, nhi, 6, 6, &dev->ports[5], 8, 8);
 	tb_test_check_dma_tunnel(test, tunnel6, 14, 14, 1, true);
 	tb_test_check_shared(test, up, 1, 2);
 	KUNIT_EXPECT_PTR_EQ(test, tunnel6->paths[1]->hops[1].credit_pool, dma);
@@ -3237,7 +3247,7 @@ static void tb_test_credit_alloc_dma_shared_mixed(struct kunit *test)
 	nhi = &host->ports[7];
 	port = &dev2->ports[3];
 
-	tunnel = tb_tunnel_alloc_dma(NULL, nhi, port, 8, 1, 8, 1);
+	tunnel = tb_tunnel_alloc_dma(NULL, nhi, 1, 1, port, 8, 8);
 	KUNIT_ASSERT_NOT_NULL(test, tunnel);
 	KUNIT_ASSERT_EQ(test, tunnel->npaths, (size_t)2);
 
@@ -3297,7 +3307,7 @@ static void tb_test_credit_alloc_dma_shared_no_credit_allocation(struct kunit *t
 	 * host ingress (RX path) can use shared buffers. The device
 	 * ingress uses the fixed dedicated credits.
 	 */
-	tunnel = tb_tunnel_alloc_dma(NULL, nhi, port, 8, 1, 8, 1);
+	tunnel = tb_tunnel_alloc_dma(NULL, nhi, 1, 1, port, 8, 8);
 	KUNIT_ASSERT_NOT_NULL(test, tunnel);
 	KUNIT_ASSERT_EQ(test, tunnel->npaths, (size_t)2);
 
@@ -3517,7 +3527,7 @@ static struct tb_tunnel *TB_TEST_DMA_TUNNEL1(struct kunit *test,
 
 	nhi = &host->ports[7];
 	port = &dev->ports[3];
-	dma_tunnel1 = tb_tunnel_alloc_dma(NULL, nhi, port, 8, 1, 8, 1);
+	dma_tunnel1 = tb_tunnel_alloc_dma(NULL, nhi, 1, 1, port, 8, 8);
 	KUNIT_ASSERT_NOT_NULL(test, dma_tunnel1);
 	KUNIT_ASSERT_EQ(test, dma_tunnel1->npaths, (size_t)2);
 
@@ -3547,7 +3557,7 @@ static struct tb_tunnel *TB_TEST_DMA_TUNNEL2(struct kunit *test,
 
 	nhi = &host->ports[7];
 	port = &dev->ports[3];
-	dma_tunnel2 = tb_tunnel_alloc_dma(NULL, nhi, port, 9, 2, 9, 2);
+	dma_tunnel2 = tb_tunnel_alloc_dma(NULL, nhi, 2, 2, port, 9, 9);
 	KUNIT_ASSERT_NOT_NULL(test, dma_tunnel2);
 	KUNIT_ASSERT_EQ(test, dma_tunnel2->npaths, (size_t)2);
 
diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index 3f2b6f8eb243..b36fed0b52d4 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -1733,36 +1733,54 @@ static int tb_dma_init_path(struct tb_path *path)
 	return 0;
 }
 
+static const char *
+tb_dma_path_name(const struct tb_port *src, const struct tb_port *dst)
+{
+	if (tb_port_is_nhi(src))
+		return "DMA TX";
+	if (tb_port_is_nhi(dst))
+		return "DMA RX";
+	return "DMA";
+}
+
 /**
- * tb_tunnel_alloc_dma() - allocate a DMA tunnel
+ * tb_tunnel_alloc_dma() - Allocate a DMA tunnel
  * @tb: Pointer to the domain structure
- * @nhi: Host controller port
- * @dst: Destination null port which the other domain is connected to
- * @transmit_path: HopID used for transmitting packets
- * @transmit_ring: NHI ring number used to send packets towards the
- *		   other domain. Set to %-1 if TX path is not needed.
- * @receive_path: HopID used for receiving packets
- * @receive_ring: NHI ring number used to receive packets from the
- *		  other domain. Set to %-1 if RX path is not needed.
+ * @src: First end of the tunnel
+ * @src_in_hopid: HopID the packets flowing towards @dst enter @src with. Set
+ *		  to %-1 if the path from @src to @dst is not needed.
+ * @src_out_hopid: HopID the packets flowing towards @src leave with. Set to
+ *		   %-1 if the path from @dst to @src is not needed.
+ * @dst: Second end of the tunnel
+ * @dst_in_hopid: HopID the packets flowing towards @src enter @dst with. Set
+ *		  to %-1 if the path from @dst to @src is not needed.
+ * @dst_out_hopid: HopID the packets flowing towards @dst leave with. Set to
+ *		   %-1 if the path from @src to @dst is not needed.
+ *
+ * Allocates a DMA tunnel between host interface and lane adapter, lane
+ * adapter and host interface or lane adapter and lane adapter.
  *
  * Return: Pointer to @struct tb_tunnel or %NULL in case of failure.
  */
-struct tb_tunnel *tb_tunnel_alloc_dma(struct tb *tb, struct tb_port *nhi,
-				      struct tb_port *dst, int transmit_path,
-				      int transmit_ring, int receive_path,
-				      int receive_ring)
+struct tb_tunnel *tb_tunnel_alloc_dma(struct tb *tb, struct tb_port *src,
+				      int src_in_hopid, int src_out_hopid,
+				      struct tb_port *dst, int dst_in_hopid,
+				      int dst_out_hopid)
 {
+	bool src_to_dst, dst_to_src;
 	struct tb_tunnel *tunnel;
 	size_t npaths = 0, i = 0;
 	struct tb_path *path;
 
-	/* Ring 0 is reserved for control channel */
-	if (WARN_ON(!receive_ring || !transmit_ring))
+	if (WARN_ON(src == dst))
 		return NULL;
 
-	if (receive_ring > 0)
+	src_to_dst = src_in_hopid > 0 && dst_out_hopid > 0;
+	dst_to_src = dst_in_hopid > 0 && src_out_hopid > 0;
+
+	if (src_to_dst)
 		npaths++;
-	if (transmit_ring > 0)
+	if (dst_to_src)
 		npaths++;
 
 	if (WARN_ON(!npaths))
@@ -1772,29 +1790,31 @@ struct tb_tunnel *tb_tunnel_alloc_dma(struct tb *tb, struct tb_port *nhi,
 	if (!tunnel)
 		return NULL;
 
-	tunnel->src_port = nhi;
+	tunnel->src_port = src;
 	tunnel->dst_port = dst;
 
-	if (receive_ring > 0) {
-		path = tb_path_alloc(tb, dst, receive_path, nhi, receive_ring, 0,
-				     "DMA RX");
+	if (dst_to_src) {
+		path = tb_path_alloc(tb, dst, dst_in_hopid, src, src_out_hopid,
+				     0, tb_dma_path_name(dst, src));
 		if (!path)
 			goto err_free;
 		tunnel->paths[i++] = path;
 		if (tb_dma_init_path(path)) {
-			tb_tunnel_dbg(tunnel, "not enough buffers for RX path\n");
+			tb_tunnel_dbg(tunnel, "not enough buffers for %s path\n",
+				      path->name);
 			goto err_free;
 		}
 	}
 
-	if (transmit_ring > 0) {
-		path = tb_path_alloc(tb, nhi, transmit_ring, dst, transmit_path, 0,
-				     "DMA TX");
+	if (src_to_dst) {
+		path = tb_path_alloc(tb, src, src_in_hopid, dst, dst_out_hopid,
+				     0, tb_dma_path_name(src, dst));
 		if (!path)
 			goto err_free;
 		tunnel->paths[i++] = path;
 		if (tb_dma_init_path(path)) {
-			tb_tunnel_dbg(tunnel, "not enough buffers for TX path\n");
+			tb_tunnel_dbg(tunnel, "not enough buffers for %s path\n",
+				      path->name);
 			goto err_free;
 		}
 	}
@@ -1806,67 +1826,78 @@ struct tb_tunnel *tb_tunnel_alloc_dma(struct tb *tb, struct tb_port *nhi,
 	return NULL;
 }
 
-/**
- * tb_tunnel_match_dma() - Match DMA tunnel
- * @tunnel: Tunnel to match
- * @transmit_path: HopID used for transmitting packets. Pass %-1 to ignore.
- * @transmit_ring: NHI ring number used to send packets towards the
- *		   other domain. Pass %-1 to ignore.
- * @receive_path: HopID used for receiving packets. Pass %-1 to ignore.
- * @receive_ring: NHI ring number used to receive packets from the
- *		  other domain. Pass %-1 to ignore.
- *
- * This function can be used to match specific DMA tunnel, if there are
- * multiple DMA tunnels going through the same XDomain connection.
- *
- * Return: %true if there is a match, %false otherwise.
- */
-bool tb_tunnel_match_dma(const struct tb_tunnel *tunnel, int transmit_path,
-			 int transmit_ring, int receive_path, int receive_ring)
+static void tb_dma_end_hopids(const struct tb_tunnel *tunnel,
+			      const struct tb_port *port,
+			      int *in_hopid, int *out_hopid)
 {
-	const struct tb_path *tx_path = NULL, *rx_path = NULL;
 	int i;
 
-	if (!receive_ring || !transmit_ring)
-		return false;
+	*in_hopid = *out_hopid = -1;
 
 	for (i = 0; i < tunnel->npaths; i++) {
 		const struct tb_path *path = tunnel->paths[i];
+		const struct tb_path_hop *first, *last;
 
 		if (!path)
 			continue;
 
-		if (tb_port_is_nhi(path->hops[0].in_port))
-			tx_path = path;
-		else if (tb_port_is_nhi(path->hops[path->path_length - 1].out_port))
-			rx_path = path;
-	}
+		first = &path->hops[0];
+		last = &path->hops[path->path_length - 1];
 
-	if (transmit_ring > 0 || transmit_path > 0) {
-		if (!tx_path)
-			return false;
-		if (transmit_ring > 0 &&
-		    (tx_path->hops[0].in_hop_index != transmit_ring))
-			return false;
-		if (transmit_path > 0 &&
-		    (tx_path->hops[tx_path->path_length - 1].next_hop_index != transmit_path))
-			return false;
+		if (first->in_port == port)
+			*in_hopid = first->in_hop_index;
+		else if (last->out_port == port)
+			*out_hopid = last->next_hop_index;
 	}
+}
 
-	if (receive_ring > 0 || receive_path > 0) {
-		if (!rx_path)
-			return false;
-		if (receive_path > 0 &&
-		    (rx_path->hops[0].in_hop_index != receive_path))
-			return false;
-		if (receive_ring > 0 &&
-		    (rx_path->hops[rx_path->path_length - 1].next_hop_index != receive_ring))
-			return false;
-	}
+static bool tb_dma_match_end(const struct tb_tunnel *tunnel,
+			     const struct tb_port *port, int in_hopid,
+			     int out_hopid)
+{
+	int tunnel_in_hopid, tunnel_out_hopid;
+
+	if (!port)
+		return true;
+
+	tb_dma_end_hopids(tunnel, port, &tunnel_in_hopid, &tunnel_out_hopid);
+
+	/* The tunnel must end to the adapter in the first place */
+	if (tunnel_in_hopid < 0 && tunnel_out_hopid < 0)
+		return false;
+
+	if (in_hopid > 0 && in_hopid != tunnel_in_hopid)
+		return false;
+	if (out_hopid > 0 && out_hopid != tunnel_out_hopid)
+		return false;
 
 	return true;
 }
 
+/**
+ * tb_tunnel_match_dma() - Match DMA tunnel
+ * @tunnel: Tunnel to match
+ * @src: First end of the tunnel. Pass %NULL to ignore.
+ * @src_in_hopid: HopID the packets entering @src use. Pass %-1 to ignore.
+ * @src_out_hopid: HopID the packets leaving @src use. Pass %-1 to ignore.
+ * @dst: Second end of the tunnel. Pass %NULL to ignore.
+ * @dst_in_hopid: HopID the packets entering @dst use. Pass %-1 to ignore.
+ * @dst_out_hopid: HopID the packets leaving @dst use. Pass %-1 to ignore.
+ *
+ * This function can be used to match specific DMA tunnel, if there are
+ * multiple DMA tunnels going through the same XDomain connection.
+ *
+ * Return: %true if there is a match, %false otherwise.
+ */
+bool tb_tunnel_match_dma(const struct tb_tunnel *tunnel,
+			 const struct tb_port *src, int src_in_hopid,
+			 int src_out_hopid, const struct tb_port *dst,
+			 int dst_in_hopid, int dst_out_hopid)
+{
+	return tb_dma_match_end(tunnel, src, src_in_hopid, src_out_hopid) &&
+	       tb_dma_match_end(tunnel, dst, dst_in_hopid, dst_out_hopid);
+}
+
 static int tb_usb3_max_link_rate(struct tb_port *up, struct tb_port *down)
 {
 	int ret, up_max_rate, down_max_rate;
diff --git a/drivers/thunderbolt/tunnel.h b/drivers/thunderbolt/tunnel.h
index 35d026c5bc96..5dedf742b14d 100644
--- a/drivers/thunderbolt/tunnel.h
+++ b/drivers/thunderbolt/tunnel.h
@@ -119,12 +119,14 @@ struct tb_tunnel *tb_tunnel_alloc_dp(struct tb *tb, struct tb_port *in,
 				     struct tb_port *out, int link_nr,
 				     int max_up, int max_down,
 				     void (*callback)(struct tb_tunnel *));
-struct tb_tunnel *tb_tunnel_alloc_dma(struct tb *tb, struct tb_port *nhi,
-				      struct tb_port *dst, int transmit_path,
-				      int transmit_ring, int receive_path,
-				      int receive_ring);
-bool tb_tunnel_match_dma(const struct tb_tunnel *tunnel, int transmit_path,
-			 int transmit_ring, int receive_path, int receive_ring);
+struct tb_tunnel *tb_tunnel_alloc_dma(struct tb *tb, struct tb_port *src,
+				      int src_in_hopid, int src_out_hopid,
+				      struct tb_port *dst, int dst_in_hopid,
+				      int dst_out_hopid);
+bool tb_tunnel_match_dma(const struct tb_tunnel *tunnel,
+			 const struct tb_port *src, int src_in_hopid,
+			 int src_out_hopid, const struct tb_port *dst,
+			 int dst_in_hopid, int dst_out_hopid);
 struct tb_tunnel *tb_tunnel_discover_usb3(struct tb *tb, struct tb_port *down);
 struct tb_tunnel *tb_tunnel_alloc_usb3(struct tb *tb, struct tb_port *up,
 				       struct tb_port *down, int max_up,
-- 
2.50.1

