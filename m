Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108785;
	b=jyXJh9OfIC/XKedQGnhugQdGuB3QThUHzNGi6RHUZpdf8FKgPoYQhLM6I4dwWmkZItbr
	 QaLWlcVSaxsqSMhGHUOMCDIGRYg1p/hVNVSy0CYldUE7UBd4pMzJptmD9TEyKiAk+3LXd
	 iX5yJW0/vMy5dgg3J1NTdhfgYQIl4ZpQZSbmXB2xUopuJi+RiBEVFU6yDPiYQhKLt64hO
	 Q79WgMVdW/d2Y75D+5wVHqhbdh93c9ZSc/QY1JCsjq5sqp+Z5Nb3G9O2ystVKScn0XisM
	 6cm4mkNGHBK63HVgh9XYWkG3RWUIoQMKlKwZYf/HHd7Xt4SpWLcLy+kii0C/9So/BjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108785;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=55B6oJte8NpnBjWNdx4qGISF3kwlruLCMWskJnuCtsQ=;
	b=3532oVdXU5kF/tdlu6YKghIVIDYbu1jEaqeq+hNc6keavzLZuI0iMlf+7q0j6V83xuZ8
	 tL5iamvb9N6yCSb6vaizzgIYR3ELx7Y1DoexRkefSc4hpmMwabEWkUbaV2C1mMPHy38ec
	 bdXD/2JM2JwzR8yL41P8vM4r3HUad03bJy273Wsr+xX1ycBGQ2BxzfThwA5SwNZ3kJHxH
	 xlU3hHqO9Mq4rrKtkW81m6WT+mUfVTSpmVkaH2n9/K57Qzx+azaErAikLnpWy7d1LOh/D
	 NfFYDVvFte74F+/bhVIeJWpj6pBsbv7etQI2pAwg0I80gUxwagsBCqWuvpBdIh/WLXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RvWq6uTv;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF39606A320
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 17:19:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EF39606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RvWq6uTv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795108784; x=1826644784;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0yNhlL91G1vju7h4g5xNJYWWaAe8EXR54fwi2ylMEzI=;
  b=RvWq6uTvk5f0R7/fcyz7Y3+/BRVdawHyCKx21V1oo54AFgIEZSJRpm38
   oWmwjy9MTgmlQbNKUm/CGiJHxaSJI69I0STIRRPuOY3X8dr3OufJlCw0y
   DdbOJzfZcs2S6qd5avGUpcVZhO3u2firtapIkUh625ttIJCAWqhGpg92D
   TZCtgWBeYCtsNYWWS2waYdD6ko51c2WPbf2JXvqSLiYBmOyfY9ZUTSuiM
   TDHOInt184+dxdq/ma89VvCqjnT6BVrYCOyk/8nDOWhLFQK8H2N2mUgB6
   RYdUEuV4UySdx1DwNTHo1isQA9vb4Qu6UEtBnkjn3ldnyOLlYLu7iKgVH
   Q==;
X-CSE-ConnectionGUID: Gai81MmJSPa50pun9+DRQQ==
X-CSE-MsgGUID: hx0vsxbVT2eYqJ3BYyOmUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3959017"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3959017"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 09:12:41 -0800
X-CSE-ConnectionGUID: xQciMaL9TeG3FREq/2GM9g==
X-CSE-MsgGUID: 4NtpQMLWSwGgYmVjNjKDhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10381751"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa003.jf.intel.com with ESMTP; 19 Nov 2026 09:12:39 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 33FD2B3; Thu, 19 Nov 2026 18:12:33 +0100 (CET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Rene Sapiens <rene.sapiens@linux.intel.com>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 18/18] thunderbolt: Add KUnit tests for shared buffering
Date: Thu, 19 Nov 2026 18:12:32 +0100
Message-ID: <20261119171232.1616316-19-mika.westerberg@linux.intel.com>
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

This adds various test cases to check the shared buffering support.

While there, check the per-hop flow control settings in the existing
credit allocation and tunnel test cases too. Egress flow control
follows the ingress flow control of the next hop except on the last hop
where it depends on the protocol, so make sure that is covered as well.

Signed-off-by: Mika Westerberg (Intel) <westeri@kernel.org>
---
 drivers/thunderbolt/test.c | 598 +++++++++++++++++++++++++++++++++++++
 1 file changed, 598 insertions(+)

diff --git a/drivers/thunderbolt/test.c b/drivers/thunderbolt/test.c
index d6679bcc4ac3..3fa9c4661541 100644
--- a/drivers/thunderbolt/test.c
+++ b/drivers/thunderbolt/test.c
@@ -1381,6 +1381,30 @@ static void tb_test_path_mixed_chain_reverse(struct kunit *test)
 	tb_path_free(path);
 }
 
+static void tb_test_check_path_fc(struct kunit *test,
+				  const struct tb_path *path, bool last_efc)
+{
+	int i;
+
+	for (i = 0; i < path->path_length; i++) {
+		bool efc = i < path->path_length - 1 ? true : last_efc;
+
+		KUNIT_EXPECT_TRUE(test, path->hops[i].ingress_fc_enable);
+		KUNIT_EXPECT_EQ(test, path->hops[i].egress_fc_enable, efc);
+	}
+}
+
+static void tb_test_check_path_nfc(struct kunit *test,
+				   const struct tb_path *path)
+{
+	int i;
+
+	for (i = 0; i < path->path_length; i++) {
+		KUNIT_EXPECT_FALSE(test, path->hops[i].ingress_fc_enable);
+		KUNIT_EXPECT_FALSE(test, path->hops[i].egress_fc_enable);
+	}
+}
+
 static void tb_test_tunnel_pcie(struct kunit *test)
 {
 	struct tb_switch *host, *dev1, *dev2;
@@ -1523,6 +1547,10 @@ static void tb_test_tunnel_dp_chain(struct kunit *test)
 	KUNIT_ASSERT_EQ(test, tunnel->paths[2]->path_length, 3);
 	KUNIT_EXPECT_PTR_EQ(test, tunnel->paths[2]->hops[0].in_port, out);
 	KUNIT_EXPECT_PTR_EQ(test, tunnel->paths[2]->hops[2].out_port, in);
+	tb_test_check_path_nfc(test, tunnel->paths[0]);
+	tb_test_check_path_fc(test, tunnel->paths[1], false);
+	tb_test_check_path_fc(test, tunnel->paths[2], false);
+
 	tb_tunnel_put(tunnel);
 }
 
@@ -1655,6 +1683,10 @@ static void tb_test_tunnel_dp_max_length(struct kunit *test)
 	KUNIT_EXPECT_PTR_EQ(test, tunnel->paths[2]->hops[6].out_port,
 			    &host->ports[1]);
 	KUNIT_EXPECT_PTR_EQ(test, tunnel->paths[2]->hops[12].out_port, in);
+	tb_test_check_path_nfc(test, tunnel->paths[0]);
+	tb_test_check_path_fc(test, tunnel->paths[1], false);
+	tb_test_check_path_fc(test, tunnel->paths[2], false);
+
 	tb_tunnel_put(tunnel);
 }
 
@@ -1948,6 +1980,8 @@ static void tb_test_tunnel_dma_rx(struct kunit *test)
 	KUNIT_EXPECT_PTR_EQ(test, tunnel->paths[0]->hops[0].out_port, nhi);
 	KUNIT_EXPECT_EQ(test, tunnel->paths[0]->hops[0].next_hop_index, 2);
 
+	tb_test_check_path_fc(test, tunnel->paths[0], false);
+
 	tb_tunnel_put(tunnel);
 }
 
@@ -1985,6 +2019,8 @@ static void tb_test_tunnel_dma_tx(struct kunit *test)
 	KUNIT_EXPECT_PTR_EQ(test, tunnel->paths[0]->hops[0].out_port, port);
 	KUNIT_EXPECT_EQ(test, tunnel->paths[0]->hops[0].next_hop_index, 15);
 
+	tb_test_check_path_fc(test, tunnel->paths[0], true);
+
 	tb_tunnel_put(tunnel);
 }
 
@@ -2051,6 +2087,9 @@ static void tb_test_tunnel_dma_chain(struct kunit *test)
 	KUNIT_EXPECT_PTR_EQ(test, tunnel->paths[1]->hops[2].out_port, port);
 	KUNIT_EXPECT_EQ(test, tunnel->paths[1]->hops[2].next_hop_index, 8);
 
+	tb_test_check_path_fc(test, tunnel->paths[0], false);
+	tb_test_check_path_fc(test, tunnel->paths[1], true);
+
 	tb_tunnel_put(tunnel);
 }
 
@@ -2123,6 +2162,7 @@ static void tb_test_credit_alloc_legacy_not_bonded(struct kunit *test)
 
 	path = tunnel->paths[0];
 	KUNIT_ASSERT_EQ(test, path->path_length, 2);
+	tb_test_check_path_fc(test, path, false);
 	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 7U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
@@ -2130,6 +2170,7 @@ static void tb_test_credit_alloc_legacy_not_bonded(struct kunit *test)
 
 	path = tunnel->paths[1];
 	KUNIT_ASSERT_EQ(test, path->path_length, 2);
+	tb_test_check_path_fc(test, path, false);
 	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 7U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
@@ -2156,6 +2197,7 @@ static void tb_test_credit_alloc_legacy_bonded(struct kunit *test)
 
 	path = tunnel->paths[0];
 	KUNIT_ASSERT_EQ(test, path->path_length, 2);
+	tb_test_check_path_fc(test, path, false);
 	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 7U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
@@ -2163,6 +2205,7 @@ static void tb_test_credit_alloc_legacy_bonded(struct kunit *test)
 
 	path = tunnel->paths[1];
 	KUNIT_ASSERT_EQ(test, path->path_length, 2);
+	tb_test_check_path_fc(test, path, false);
 	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 7U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
@@ -2192,6 +2235,7 @@ static void tb_test_credit_alloc_pcie(struct kunit *test)
 
 	path = tunnel->paths[0];
 	KUNIT_ASSERT_EQ(test, path->path_length, 2);
+	tb_test_check_path_fc(test, path, false);
 	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
@@ -2199,6 +2243,7 @@ static void tb_test_credit_alloc_pcie(struct kunit *test)
 
 	path = tunnel->paths[1];
 	KUNIT_ASSERT_EQ(test, path->path_length, 2);
+	tb_test_check_path_fc(test, path, false);
 	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
@@ -2409,6 +2454,7 @@ static void tb_test_credit_alloc_without_dp(struct kunit *test)
 	/* PCIe downstream path */
 	path = tunnel->paths[0];
 	KUNIT_ASSERT_EQ(test, path->path_length, 2);
+	tb_test_check_path_fc(test, path, false);
 	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
@@ -2417,6 +2463,7 @@ static void tb_test_credit_alloc_without_dp(struct kunit *test)
 	/* PCIe upstream path */
 	path = tunnel->paths[1];
 	KUNIT_ASSERT_EQ(test, path->path_length, 2);
+	tb_test_check_path_fc(test, path, false);
 	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
@@ -2452,6 +2499,7 @@ static void tb_test_credit_alloc_dp(struct kunit *test)
 	/* Video (main) path */
 	path = tunnel->paths[0];
 	KUNIT_ASSERT_EQ(test, path->path_length, 2);
+	tb_test_check_path_nfc(test, path);
 	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 18U);
@@ -2460,6 +2508,7 @@ static void tb_test_credit_alloc_dp(struct kunit *test)
 	/* AUX TX */
 	path = tunnel->paths[1];
 	KUNIT_ASSERT_EQ(test, path->path_length, 2);
+	tb_test_check_path_fc(test, path, false);
 	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
@@ -2468,6 +2517,7 @@ static void tb_test_credit_alloc_dp(struct kunit *test)
 	/* AUX RX */
 	path = tunnel->paths[2];
 	KUNIT_ASSERT_EQ(test, path->path_length, 2);
+	tb_test_check_path_fc(test, path, false);
 	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
@@ -2500,6 +2550,7 @@ static void tb_test_credit_alloc_usb3(struct kunit *test)
 
 	path = tunnel->paths[0];
 	KUNIT_ASSERT_EQ(test, path->path_length, 2);
+	tb_test_check_path_fc(test, path, false);
 	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
@@ -2507,6 +2558,7 @@ static void tb_test_credit_alloc_usb3(struct kunit *test)
 
 	path = tunnel->paths[1];
 	KUNIT_ASSERT_EQ(test, path->path_length, 2);
+	tb_test_check_path_fc(test, path, false);
 	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
@@ -2597,6 +2649,7 @@ static void tb_test_credit_alloc_dma(struct kunit *test)
 	/* DMA RX */
 	path = tunnel->paths[0];
 	KUNIT_ASSERT_EQ(test, path->path_length, 2);
+	tb_test_check_path_fc(test, path, false);
 	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 14U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
@@ -2605,6 +2658,7 @@ static void tb_test_credit_alloc_dma(struct kunit *test)
 	/* DMA TX */
 	path = tunnel->paths[1];
 	KUNIT_ASSERT_EQ(test, path->path_length, 2);
+	tb_test_check_path_fc(test, path, true);
 	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
@@ -2664,6 +2718,7 @@ static void tb_test_credit_alloc_dma_multiple(struct kunit *test)
 
 	path = tunnel1->paths[0];
 	KUNIT_ASSERT_EQ(test, path->path_length, 2);
+	tb_test_check_path_fc(test, path, false);
 	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 14U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
@@ -2671,6 +2726,7 @@ static void tb_test_credit_alloc_dma_multiple(struct kunit *test)
 
 	path = tunnel1->paths[1];
 	KUNIT_ASSERT_EQ(test, path->path_length, 2);
+	tb_test_check_path_fc(test, path, true);
 	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
@@ -2682,6 +2738,7 @@ static void tb_test_credit_alloc_dma_multiple(struct kunit *test)
 
 	path = tunnel2->paths[0];
 	KUNIT_ASSERT_EQ(test, path->path_length, 2);
+	tb_test_check_path_fc(test, path, false);
 	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 14U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
@@ -2689,6 +2746,7 @@ static void tb_test_credit_alloc_dma_multiple(struct kunit *test)
 
 	path = tunnel2->paths[1];
 	KUNIT_ASSERT_EQ(test, path->path_length, 2);
+	tb_test_check_path_fc(test, path, true);
 	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
@@ -2700,6 +2758,7 @@ static void tb_test_credit_alloc_dma_multiple(struct kunit *test)
 
 	path = tunnel3->paths[0];
 	KUNIT_ASSERT_EQ(test, path->path_length, 2);
+	tb_test_check_path_fc(test, path, false);
 	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 14U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
@@ -2707,6 +2766,7 @@ static void tb_test_credit_alloc_dma_multiple(struct kunit *test)
 
 	path = tunnel3->paths[1];
 	KUNIT_ASSERT_EQ(test, path->path_length, 2);
+	tb_test_check_path_fc(test, path, true);
 	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
@@ -2718,6 +2778,7 @@ static void tb_test_credit_alloc_dma_multiple(struct kunit *test)
 
 	path = tunnel4->paths[0];
 	KUNIT_ASSERT_EQ(test, path->path_length, 2);
+	tb_test_check_path_fc(test, path, false);
 	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 4U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
@@ -2725,6 +2786,7 @@ static void tb_test_credit_alloc_dma_multiple(struct kunit *test)
 
 	path = tunnel4->paths[1];
 	KUNIT_ASSERT_EQ(test, path->path_length, 2);
+	tb_test_check_path_fc(test, path, true);
 	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
@@ -2736,6 +2798,7 @@ static void tb_test_credit_alloc_dma_multiple(struct kunit *test)
 
 	path = tunnel5->paths[0];
 	KUNIT_ASSERT_EQ(test, path->path_length, 2);
+	tb_test_check_path_fc(test, path, false);
 	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 1U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
@@ -2743,6 +2806,7 @@ static void tb_test_credit_alloc_dma_multiple(struct kunit *test)
 
 	path = tunnel5->paths[1];
 	KUNIT_ASSERT_EQ(test, path->path_length, 2);
+	tb_test_check_path_fc(test, path, true);
 	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
@@ -2759,6 +2823,7 @@ static void tb_test_credit_alloc_dma_multiple(struct kunit *test)
 
 	path = tunnel6->paths[0];
 	KUNIT_ASSERT_EQ(test, path->path_length, 2);
+	tb_test_check_path_fc(test, path, false);
 	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 14U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
@@ -2766,6 +2831,7 @@ static void tb_test_credit_alloc_dma_multiple(struct kunit *test)
 
 	path = tunnel6->paths[1];
 	KUNIT_ASSERT_EQ(test, path->path_length, 2);
+	tb_test_check_path_fc(test, path, true);
 	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
@@ -2781,6 +2847,531 @@ static void tb_test_credit_alloc_dma_multiple(struct kunit *test)
 	usb4_switch_free_credit_pools(host);
 }
 
+static void tb_switch_enable_shared_buffering(struct tb_switch *sw)
+{
+	struct tb_port *port;
+
+	tb_switch_for_each_port(sw, port) {
+		if (tb_port_is_null(port))
+			port->shared_buffering = true;
+	}
+}
+
+static void tb_switch_disable_shared_buffering(struct tb_switch *sw)
+{
+	struct tb_port *port;
+
+	tb_switch_for_each_port(sw, port)
+		port->shared_buffering = false;
+}
+
+static void tb_test_check_hop(struct kunit *test, const struct tb_path_hop *hop,
+			      unsigned int initial_credits, bool ingress_shared,
+			      bool egress_shared)
+{
+	KUNIT_EXPECT_EQ(test, hop->nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, hop->initial_credits, initial_credits);
+	KUNIT_EXPECT_EQ(test, hop->ingress_shared_buffer, ingress_shared);
+	KUNIT_EXPECT_EQ(test, hop->egress_shared_buffer, egress_shared);
+}
+
+static void tb_test_check_shared(struct kunit *test, const struct tb_port *port,
+				 unsigned int shared_credits,
+				 unsigned int shared_users)
+{
+	KUNIT_EXPECT_EQ(test, port->shared_credits, shared_credits);
+	KUNIT_EXPECT_EQ(test, port->shared_users, shared_users);
+}
+
+static void tb_test_check_dma_tunnel(struct kunit *test,
+				     const struct tb_tunnel *tunnel,
+				     unsigned int ingress_dev,
+				     unsigned int ingress_host,
+				     unsigned int egress_dev, bool shared)
+{
+	const struct tb_path *path;
+
+	KUNIT_ASSERT_NOT_NULL(test, tunnel);
+	KUNIT_ASSERT_EQ(test, tunnel->npaths, (size_t)2);
+
+	/* DMA RX */
+	path = tunnel->paths[0];
+	KUNIT_ASSERT_EQ(test, path->path_length, 2);
+	tb_test_check_hop(test, &path->hops[0], ingress_dev, false, shared);
+	tb_test_check_hop(test, &path->hops[1], ingress_host, shared, false);
+	tb_test_check_path_fc(test, path, false);
+
+	/* DMA TX */
+	path = tunnel->paths[1];
+	KUNIT_ASSERT_EQ(test, path->path_length, 2);
+	tb_test_check_hop(test, &path->hops[0], 0, false, shared);
+	tb_test_check_hop(test, &path->hops[1], egress_dev, shared, false);
+	tb_test_check_path_fc(test, path, true);
+}
+
+static void tb_test_credit_alloc_dma_shared(struct kunit *test)
+{
+	struct tb_switch *host, *dev;
+	struct tb_port *nhi, *port;
+	struct tb_tunnel *tunnel;
+
+	host = alloc_host_usb4(test);
+	dev = alloc_dev_usb4(test, host, 0x1, true);
+
+	tb_switch_enable_shared_buffering(host);
+	tb_switch_enable_shared_buffering(dev);
+
+	KUNIT_ASSERT_EQ(test, usb4_switch_alloc_credit_pools(host), 0);
+	KUNIT_ASSERT_EQ(test, usb4_switch_alloc_credit_pools(dev), 0);
+
+	nhi = &host->ports[7];
+	port = &dev->ports[3];
+
+	/*
+	 * The link between the host and the device uses shared
+	 * buffering in both directions. The device ingress lane adapter
+	 * (port 3) is not part of the link so it uses dedicated
+	 * buffers.
+	 */
+	tunnel = tb_tunnel_alloc_dma(NULL, nhi, port, 8, 1, 8, 1);
+	tb_test_check_dma_tunnel(test, tunnel, 14, 14, 14, true);
+
+	tb_test_check_shared(test, &host->ports[1], 14, 1);
+	tb_test_check_shared(test, &dev->ports[1], 14, 1);
+	tb_test_check_shared(test, &dev->ports[3], 0, 0);
+
+	tb_tunnel_put(tunnel);
+
+	tb_test_check_shared(test, &host->ports[1], 0, 0);
+	tb_test_check_shared(test, &dev->ports[1], 0, 0);
+
+	usb4_switch_free_credit_pools(dev);
+	usb4_switch_free_credit_pools(host);
+}
+
+static void tb_test_credit_alloc_dma_multiple_shared(struct kunit *test)
+{
+	struct tb_tunnel *tunnel1, *tunnel2, *tunnel3, *tunnel4;
+	struct tb_tunnel *tunnel5, *tunnel6;
+	struct tb_switch *host, *dev;
+	struct tb_port *nhi, *port;
+
+	host = alloc_host_br(test);
+	dev = alloc_dev_usb4(test, host, 0x1, true);
+
+	tb_switch_enable_shared_buffering(host);
+	tb_switch_enable_shared_buffering(dev);
+
+	KUNIT_ASSERT_EQ(test, usb4_switch_alloc_credit_pools(host), 0);
+	KUNIT_ASSERT_EQ(test, usb4_switch_alloc_credit_pools(dev), 0);
+
+	nhi = &host->ports[7];
+	port = &dev->ports[3];
+
+	/*
+	 * Same as tb_test_credit_alloc_dma_multiple() but intra-domain
+	 * links use shared buffering so they get the full credits. The
+	 * dev ingress port (3) is still using dedicated for the
+	 * inter-domain link (and runs out of credits the same way).
+	 */
+	tunnel1 = tb_tunnel_alloc_dma(NULL, nhi, port, 8, 1, 8, 1);
+	tb_test_check_dma_tunnel(test, tunnel1, 14, 14, 14, true);
+	tunnel2 = tb_tunnel_alloc_dma(NULL, nhi, port, 9, 2, 9, 2);
+	tb_test_check_dma_tunnel(test, tunnel2, 14, 14, 14, true);
+	tunnel3 = tb_tunnel_alloc_dma(NULL, nhi, port, 10, 3, 10, 3);
+	tb_test_check_dma_tunnel(test, tunnel3, 14, 14, 14, true);
+	tunnel4 = tb_tunnel_alloc_dma(NULL, nhi, port, 11, 4, 11, 4);
+	tb_test_check_dma_tunnel(test, tunnel4, 4, 14, 14, true);
+	tunnel5 = tb_tunnel_alloc_dma(NULL, nhi, port, 12, 5, 12, 5);
+	tb_test_check_dma_tunnel(test, tunnel5, 1, 14, 14, true);
+
+	tb_test_check_shared(test, &host->ports[1], 14, 5);
+	tb_test_check_shared(test, &dev->ports[1], 14, 5);
+
+	/*
+	 * This fails at the first hop of the RX path, before any of the
+	 * shared buffers are allocated. Releasing the failed tunnel
+	 * must not drop the users of the shared buffers.
+	 */
+	tunnel6 = tb_tunnel_alloc_dma(NULL, nhi, port, 13, 6, 13, 6);
+	KUNIT_ASSERT_NULL(test, tunnel6);
+
+	tb_test_check_shared(test, &host->ports[1], 14, 5);
+	tb_test_check_shared(test, &dev->ports[1], 14, 5);
+
+	tb_tunnel_put(tunnel1);
+
+	tb_test_check_shared(test, &host->ports[1], 14, 4);
+	tb_test_check_shared(test, &dev->ports[1], 14, 4);
+
+	tunnel6 = tb_tunnel_alloc_dma(NULL, nhi, port, 13, 6, 13, 6);
+	tb_test_check_dma_tunnel(test, tunnel6, 14, 14, 14, true);
+
+	tb_test_check_shared(test, &host->ports[1], 14, 5);
+	tb_test_check_shared(test, &dev->ports[1], 14, 5);
+
+	tb_tunnel_put(tunnel6);
+	tb_tunnel_put(tunnel5);
+	tb_tunnel_put(tunnel4);
+	tb_tunnel_put(tunnel3);
+	tb_tunnel_put(tunnel2);
+
+	tb_test_check_shared(test, &host->ports[1], 0, 0);
+	tb_test_check_shared(test, &dev->ports[1], 0, 0);
+
+	/*
+	 * All the shared buffers must have been returned to the common
+	 * pool so with dedicated buffering we should get the same
+	 * allocation as in tb_test_credit_alloc_dma_multiple().
+	 */
+	tb_switch_disable_shared_buffering(host);
+	tb_switch_disable_shared_buffering(dev);
+
+	tunnel1 = tb_tunnel_alloc_dma(NULL, nhi, port, 8, 1, 8, 1);
+	tb_test_check_dma_tunnel(test, tunnel1, 14, 14, 14, false);
+	tunnel2 = tb_tunnel_alloc_dma(NULL, nhi, port, 9, 2, 9, 2);
+	tb_test_check_dma_tunnel(test, tunnel2, 14, 14, 14, false);
+	tunnel3 = tb_tunnel_alloc_dma(NULL, nhi, port, 10, 3, 10, 3);
+	tb_test_check_dma_tunnel(test, tunnel3, 14, 14, 14, false);
+	tunnel4 = tb_tunnel_alloc_dma(NULL, nhi, port, 11, 4, 11, 4);
+	tb_test_check_dma_tunnel(test, tunnel4, 4, 14, 10, false);
+	tunnel5 = tb_tunnel_alloc_dma(NULL, nhi, port, 12, 5, 12, 5);
+	tb_test_check_dma_tunnel(test, tunnel5, 1, 14, 1, false);
+	tunnel6 = tb_tunnel_alloc_dma(NULL, nhi, port, 13, 6, 13, 6);
+	KUNIT_ASSERT_NULL(test, tunnel6);
+
+	tb_tunnel_put(tunnel5);
+	tb_tunnel_put(tunnel4);
+	tb_tunnel_put(tunnel3);
+	tb_tunnel_put(tunnel2);
+	tb_tunnel_put(tunnel1);
+
+	usb4_switch_free_credit_pools(dev);
+	usb4_switch_free_credit_pools(host);
+}
+
+static void tb_test_credit_alloc_dma_shared_partial(struct kunit *test)
+{
+	struct tb_tunnel *tunnel1, *tunnel2, *tunnel3, *tunnel4;
+	struct tb_tunnel *tunnel5;
+	struct tb_switch *host, *dev;
+	struct tb_port *nhi, *port;
+
+	host = alloc_host_br(test);
+	dev = alloc_dev_usb4(test, host, 0x1, true);
+
+	KUNIT_ASSERT_EQ(test, usb4_switch_alloc_credit_pools(host), 0);
+	KUNIT_ASSERT_EQ(test, usb4_switch_alloc_credit_pools(dev), 0);
+
+	nhi = &host->ports[7];
+	port = &dev->ports[3];
+
+	/*
+	 * First take most of the device upstream port common pool
+	 * with dedicated buffers. This leaves 52 - 3 * 14 = 10 credits
+	 * there.
+	 */
+	tunnel1 = tb_tunnel_alloc_dma(NULL, nhi, port, 8, 1, 8, 1);
+	tb_test_check_dma_tunnel(test, tunnel1, 14, 14, 14, false);
+	tunnel2 = tb_tunnel_alloc_dma(NULL, nhi, port, 9, 2, 9, 2);
+	tb_test_check_dma_tunnel(test, tunnel2, 14, 14, 14, false);
+	tunnel3 = tb_tunnel_alloc_dma(NULL, nhi, port, 10, 3, 10, 3);
+	tb_test_check_dma_tunnel(test, tunnel3, 14, 14, 14, false);
+
+	/*
+	 * Now enable shared buffering. The host side still has plenty
+	 * so it gets 14 shared buffers but the device side only gets
+	 * the remaining 10 and the path cannot use more than that.
+	 */
+	tb_switch_enable_shared_buffering(host);
+	tb_switch_enable_shared_buffering(dev);
+
+	tunnel4 = tb_tunnel_alloc_dma(NULL, nhi, port, 11, 4, 11, 4);
+	tb_test_check_dma_tunnel(test, tunnel4, 4, 14, 10, true);
+
+	tb_test_check_shared(test, &host->ports[1], 14, 1);
+	tb_test_check_shared(test, &dev->ports[1], 10, 1);
+
+	/* This one joins the existing shared buffers */
+	tunnel5 = tb_tunnel_alloc_dma(NULL, nhi, port, 12, 5, 12, 5);
+	tb_test_check_dma_tunnel(test, tunnel5, 1, 14, 10, true);
+
+	tb_test_check_shared(test, &host->ports[1], 14, 2);
+	tb_test_check_shared(test, &dev->ports[1], 10, 2);
+
+	tb_tunnel_put(tunnel4);
+
+	tb_test_check_shared(test, &host->ports[1], 14, 1);
+	tb_test_check_shared(test, &dev->ports[1], 10, 1);
+
+	tb_tunnel_put(tunnel5);
+
+	tb_test_check_shared(test, &host->ports[1], 0, 0);
+	tb_test_check_shared(test, &dev->ports[1], 0, 0);
+
+	/*
+	 * The 10 credits must be back in the device common pool so the
+	 * dedicated allocation continues as in
+	 * tb_test_credit_alloc_dma_multiple().
+	 */
+	tb_switch_disable_shared_buffering(host);
+	tb_switch_disable_shared_buffering(dev);
+
+	tunnel4 = tb_tunnel_alloc_dma(NULL, nhi, port, 11, 4, 11, 4);
+	tb_test_check_dma_tunnel(test, tunnel4, 4, 14, 10, false);
+	tunnel5 = tb_tunnel_alloc_dma(NULL, nhi, port, 12, 5, 12, 5);
+	tb_test_check_dma_tunnel(test, tunnel5, 1, 14, 1, false);
+
+	tb_tunnel_put(tunnel5);
+	tb_tunnel_put(tunnel4);
+	tb_tunnel_put(tunnel3);
+	tb_tunnel_put(tunnel2);
+	tb_tunnel_put(tunnel1);
+
+	usb4_switch_free_credit_pools(dev);
+	usb4_switch_free_credit_pools(host);
+}
+
+static void tb_test_credit_alloc_dma_shared_reserved(struct kunit *test)
+{
+	struct tb_tunnel *tunnel1, *tunnel2, *tunnel3, *tunnel4;
+	struct tb_tunnel *tunnel5, *tunnel6;
+	struct usb4_credit_pool *common, *dma;
+	struct tb_port *nhi, *port, *up;
+	struct tb_switch *host, *dev;
+	unsigned int common_used;
+
+	host = alloc_host_br(test);
+	dev = alloc_dev_usb4(test, host, 0x1, true);
+
+	KUNIT_ASSERT_EQ(test, usb4_switch_alloc_credit_pools(host), 0);
+	KUNIT_ASSERT_EQ(test, usb4_switch_alloc_credit_pools(dev), 0);
+
+	nhi = &host->ports[7];
+	port = &dev->ports[3];
+	up = &dev->ports[1];
+	common = &up->credit_pool[USB4_CREDIT_POOL_COMMON];
+	dma = &up->credit_pool[USB4_CREDIT_POOL_DMA];
+
+	tunnel1 = tb_tunnel_alloc_dma(NULL, nhi, port, 8, 1, 8, 1);
+	tb_test_check_dma_tunnel(test, tunnel1, 14, 14, 14, false);
+	tunnel2 = tb_tunnel_alloc_dma(NULL, nhi, port, 9, 2, 9, 2);
+	tb_test_check_dma_tunnel(test, tunnel2, 14, 14, 14, false);
+	tunnel3 = tb_tunnel_alloc_dma(NULL, nhi, port, 10, 3, 10, 3);
+	tb_test_check_dma_tunnel(test, tunnel3, 14, 14, 14, false);
+	tunnel4 = tb_tunnel_alloc_dma(NULL, nhi, port, 11, 4, 11, 4);
+	tb_test_check_dma_tunnel(test, tunnel4, 4, 14, 10, false);
+
+	KUNIT_EXPECT_EQ(test, usb4_credit_pool_available(common), 0U);
+	KUNIT_EXPECT_EQ(test, usb4_credit_pool_used(dma), 0U);
+	common_used = usb4_credit_pool_used(common);
+
+	tb_switch_enable_shared_buffering(host);
+	tb_switch_enable_shared_buffering(dev);
+
+	/*
+	 * The common pool of the device upstream port is exhausted so
+	 * the shared buffers get the minimum from the DMA pool, same as
+	 * the dedicated buffers would.
+	 */
+	tunnel5 = tb_tunnel_alloc_dma(NULL, nhi, port, 12, 5, 12, 5);
+	tb_test_check_dma_tunnel(test, tunnel5, 1, 14, 1, true);
+	tb_test_check_shared(test, up, 1, 1);
+	KUNIT_EXPECT_PTR_EQ(test, up->shared_pool, dma);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel5->paths[1]->hops[1].credit_pool, dma);
+	KUNIT_EXPECT_EQ(test, usb4_credit_pool_used(dma), 1U);
+
+	/* Port 3 has run out so this one goes through port 5 instead */
+	tunnel6 = tb_tunnel_alloc_dma(NULL, nhi, &dev->ports[5], 8, 6, 8, 6);
+	tb_test_check_dma_tunnel(test, tunnel6, 14, 14, 1, true);
+	tb_test_check_shared(test, up, 1, 2);
+	KUNIT_EXPECT_PTR_EQ(test, tunnel6->paths[1]->hops[1].credit_pool, dma);
+	KUNIT_EXPECT_EQ(test, usb4_credit_pool_used(dma), 1U);
+
+	/*
+	 * Release the tunnel that allocated the shared buffers first so
+	 * that the joiner returns them.
+	 */
+	tb_tunnel_put(tunnel5);
+	tb_test_check_shared(test, up, 1, 1);
+	KUNIT_EXPECT_EQ(test, usb4_credit_pool_used(dma), 1U);
+
+	tb_tunnel_put(tunnel6);
+	tb_test_check_shared(test, up, 0, 0);
+	KUNIT_EXPECT_NULL(test, up->shared_pool);
+	KUNIT_EXPECT_EQ(test, usb4_credit_pool_used(dma), 0U);
+	KUNIT_EXPECT_EQ(test, usb4_credit_pool_used(common), common_used);
+
+	tb_tunnel_put(tunnel4);
+	tb_tunnel_put(tunnel3);
+	tb_tunnel_put(tunnel2);
+	tb_tunnel_put(tunnel1);
+
+	usb4_switch_free_credit_pools(dev);
+	usb4_switch_free_credit_pools(host);
+}
+
+static void tb_test_credit_alloc_dma_shared_mixed(struct kunit *test)
+{
+	struct tb_switch *host, *dev1, *dev2;
+	struct tb_port *nhi, *port;
+	struct tb_tunnel *tunnel;
+	struct tb_path *path;
+
+	/*
+	 * Host <-> Dev1 link supports shared buffering but Dev1 <-> Dev2
+	 * does not because Dev2 lacks support so that link must use
+	 * dedicated buffers.
+	 */
+	host = alloc_host_usb4(test);
+	dev1 = alloc_dev_usb4(test, host, 0x1, true);
+	dev2 = alloc_dev_usb4(test, dev1, 0x301, true);
+
+	tb_switch_enable_shared_buffering(host);
+	tb_switch_enable_shared_buffering(dev1);
+
+	KUNIT_ASSERT_EQ(test, usb4_switch_alloc_credit_pools(host), 0);
+	KUNIT_ASSERT_EQ(test, usb4_switch_alloc_credit_pools(dev1), 0);
+	KUNIT_ASSERT_EQ(test, usb4_switch_alloc_credit_pools(dev2), 0);
+
+	nhi = &host->ports[7];
+	port = &dev2->ports[3];
+
+	tunnel = tb_tunnel_alloc_dma(NULL, nhi, port, 8, 1, 8, 1);
+	KUNIT_ASSERT_NOT_NULL(test, tunnel);
+	KUNIT_ASSERT_EQ(test, tunnel->npaths, (size_t)2);
+
+	/* DMA RX */
+	path = tunnel->paths[0];
+	KUNIT_ASSERT_EQ(test, path->path_length, 3);
+	tb_test_check_hop(test, &path->hops[0], 14, false, false);
+	tb_test_check_hop(test, &path->hops[1], 14, false, true);
+	tb_test_check_hop(test, &path->hops[2], 14, true, false);
+	tb_test_check_path_fc(test, path, false);
+
+	/* DMA TX */
+	path = tunnel->paths[1];
+	KUNIT_ASSERT_EQ(test, path->path_length, 3);
+	tb_test_check_hop(test, &path->hops[0], 0, false, true);
+	tb_test_check_hop(test, &path->hops[1], 14, true, false);
+	tb_test_check_hop(test, &path->hops[2], 14, false, false);
+	tb_test_check_path_fc(test, path, true);
+
+	tb_test_check_shared(test, &host->ports[1], 14, 1);
+	tb_test_check_shared(test, &dev1->ports[1], 14, 1);
+	tb_test_check_shared(test, &dev1->ports[3], 0, 0);
+	tb_test_check_shared(test, &dev2->ports[1], 0, 0);
+
+	tb_tunnel_put(tunnel);
+
+	tb_test_check_shared(test, &host->ports[1], 0, 0);
+	tb_test_check_shared(test, &dev1->ports[1], 0, 0);
+
+	usb4_switch_free_credit_pools(dev2);
+	usb4_switch_free_credit_pools(dev1);
+	usb4_switch_free_credit_pools(host);
+}
+
+static void tb_test_credit_alloc_dma_shared_no_credit_allocation(struct kunit *test)
+{
+	struct tb_switch *host, *dev;
+	struct tb_port *nhi, *port;
+	struct tb_tunnel *tunnel;
+	struct tb_path *path;
+
+	host = alloc_host_usb4(test);
+	dev = alloc_dev_usb4(test, host, 0x1, true);
+	dev->credit_allocation = false;
+
+	tb_switch_enable_shared_buffering(host);
+	tb_switch_enable_shared_buffering(dev);
+
+	KUNIT_ASSERT_EQ(test, usb4_switch_alloc_credit_pools(host), 0);
+	KUNIT_ASSERT_EQ(test, usb4_switch_alloc_credit_pools(dev), 0);
+
+	nhi = &host->ports[7];
+	port = &dev->ports[3];
+
+	/*
+	 * Shared buffering needs the credit allocation so only the
+	 * host ingress (RX path) can use shared buffers. The device
+	 * ingress uses the fixed dedicated credits.
+	 */
+	tunnel = tb_tunnel_alloc_dma(NULL, nhi, port, 8, 1, 8, 1);
+	KUNIT_ASSERT_NOT_NULL(test, tunnel);
+	KUNIT_ASSERT_EQ(test, tunnel->npaths, (size_t)2);
+
+	/* DMA RX */
+	path = tunnel->paths[0];
+	KUNIT_ASSERT_EQ(test, path->path_length, 2);
+	tb_test_check_hop(test, &path->hops[0], 6, false, true);
+	tb_test_check_hop(test, &path->hops[1], 14, true, false);
+	tb_test_check_path_fc(test, path, false);
+
+	/* DMA TX */
+	path = tunnel->paths[1];
+	KUNIT_ASSERT_EQ(test, path->path_length, 2);
+	tb_test_check_hop(test, &path->hops[0], 0, false, false);
+	tb_test_check_hop(test, &path->hops[1], 14, false, false);
+	tb_test_check_path_fc(test, path, true);
+
+	tb_test_check_shared(test, &host->ports[1], 14, 1);
+	tb_test_check_shared(test, &dev->ports[1], 0, 0);
+
+	tb_tunnel_put(tunnel);
+
+	tb_test_check_shared(test, &host->ports[1], 0, 0);
+
+	usb4_switch_free_credit_pools(dev);
+	usb4_switch_free_credit_pools(host);
+}
+
+static void tb_test_credit_alloc_shared_hop(struct kunit *test)
+{
+	struct tb_path_hop hop1 = {}, hop2 = {}, hop3 = {};
+	struct tb_switch *host;
+	struct tb_port *port;
+
+	host = alloc_host_usb4(test);
+	KUNIT_ASSERT_EQ(test, usb4_switch_alloc_credit_pools(host), 0);
+
+	port = &host->ports[1];
+
+	/* Shared without dedicated buffers (PCA is not used) */
+	hop1.in_port = port;
+	KUNIT_ASSERT_EQ(test, tb_hop_alloc_credits(&hop1, TB_CREDITS_DMA,
+						   TB_HOP_ISE), 0);
+	KUNIT_EXPECT_EQ(test, hop1.initial_credits, 0U);
+	KUNIT_EXPECT_EQ(test, hop1.nfc_credits, 0U);
+	KUNIT_EXPECT_FALSE(test, hop1.ingress_fc_enable);
+	KUNIT_EXPECT_TRUE(test, hop1.ingress_shared_buffer);
+	tb_test_check_shared(test, port, 14, 1);
+
+	/* Restricted shared joins the same shared buffers */
+	hop2.in_port = port;
+	KUNIT_ASSERT_EQ(test, tb_hop_alloc_credits(&hop2, TB_CREDITS_DMA,
+						   TB_HOP_IFC | TB_HOP_ISE), 0);
+	KUNIT_EXPECT_EQ(test, hop2.initial_credits, 14U);
+	KUNIT_EXPECT_EQ(test, hop2.nfc_credits, 0U);
+	KUNIT_EXPECT_TRUE(test, hop2.ingress_fc_enable);
+	KUNIT_EXPECT_TRUE(test, hop2.ingress_shared_buffer);
+	tb_test_check_shared(test, port, 14, 2);
+
+	/* Releasing hop that was never allocated is a no-op */
+	hop3.in_port = port;
+	hop3.ingress_shared_buffer = true;
+	tb_hop_release_credits(&hop3);
+	tb_test_check_shared(test, port, 14, 2);
+
+	tb_hop_release_credits(&hop1);
+	tb_test_check_shared(test, port, 14, 1);
+	tb_hop_release_credits(&hop2);
+	tb_test_check_shared(test, port, 0, 0);
+	KUNIT_EXPECT_EQ(test, hop2.initial_credits, 0U);
+
+	usb4_switch_free_credit_pools(host);
+}
+
 static struct tb_tunnel *TB_TEST_PCIE_TUNNEL(struct kunit *test,
 			struct tb_switch *host, struct tb_switch *dev)
 {
@@ -3558,6 +4149,13 @@ static struct kunit_case tb_test_cases[] = {
 	KUNIT_CASE(tb_test_credit_alloc_usb3),
 	KUNIT_CASE(tb_test_credit_alloc_dma),
 	KUNIT_CASE(tb_test_credit_alloc_dma_multiple),
+	KUNIT_CASE(tb_test_credit_alloc_dma_shared),
+	KUNIT_CASE(tb_test_credit_alloc_dma_multiple_shared),
+	KUNIT_CASE(tb_test_credit_alloc_dma_shared_partial),
+	KUNIT_CASE(tb_test_credit_alloc_dma_shared_reserved),
+	KUNIT_CASE(tb_test_credit_alloc_dma_shared_mixed),
+	KUNIT_CASE(tb_test_credit_alloc_dma_shared_no_credit_allocation),
+	KUNIT_CASE(tb_test_credit_alloc_shared_hop),
 	KUNIT_CASE(tb_test_credit_alloc_all),
 	KUNIT_CASE(tb_test_property_parse),
 	KUNIT_CASE(tb_test_property_format),
-- 
2.50.1

