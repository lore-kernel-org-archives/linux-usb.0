Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108783;
	b=OJC6gubODQ64iVvlMWUjVqAeUu9K0aKiz7yzHBoL14itTVKxKKCYtuZ7ikahSIXjH7HT
	 8t8NXxm8mVp1EQdwQnvZ6+2EBR55NNNkasMVOmxBQt9O/u113nGc8HSpGcx9y5Bdww1dH
	 IbJkdlZhvjIckI/fbIPlvNWSBa1SoKu3OujaMZf7XczB/G6w4QCDl22CTn4c+QL6Lm41L
	 dRW2GDxzbljtgd8nwBzZrDBSvnJmpT9VKidEqpaEiRMbSHBrq/KXk99RSooulmlQ8vl65
	 59aNUn9YpJ3TdQDRk7qc7xQXdEhBsIjSbKyFqRsvlb6pl1lkkLQdPbu6ciqDvz0utsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108783;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tN+2mIp76Zp/FnRZz28O93q4FOVRgcO1PC3CQWpwDNg=;
	b=KinXpiyBtO88ptiwOdGuBOZwKxYhaPsYIPpT8l8jQcdmpjZxInE8XdGmofL67QZ5qgB6
	 vYiIlyGg2FyRS5us+N989WOvrCWsrbfpDMXe2bjTtUs1t9SDKy+6H9rLKCdRHUjPvog0g
	 ZwWQSv/wHE4SYL0sZCHHKRi+ivm9FFy6OoHIKoDX/clGJjB3I60v0AOLdRabteTCx7EDI
	 3fjMgAta8/yPBWMDLEruqH0mRn7JxsLbg+fC6KkZg1ztW9uduVH2EauCV74yMl2EQMz55
	 CdAXFQeMNW41ag2ovSQ9RvtWtVKaZ5+ZH5EE+353waz9ERPhXymBbCVZ2vGn6QwkHGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TLVZaDSk;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64829606A324
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 17:19:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64829606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TLVZaDSk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795108783; x=1826644783;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XWwzRpJFaI4pE099Zm2ZmOmWD6BlJWZdsLCY7ySrAH0=;
  b=TLVZaDSkcVe+tfozA2IfoHrRHSwcLPG2IHXn6HmbqYnBELdRtZpUCgRS
   BfNndmZKtPwTf/OlVnNVAyeIT+r18X7I0dHGDhosFuwfbY5THaJfcDoer
   /AZEEGt9kxUlQE2t6Z0Yrkzx+ARa02G/iPh0DTcur+ujT7QhWXgQFnol1
   ONlRl/rlnoa59QqkHuy//B4mI/7d1QOrFTxQh1KIsxNR4HffyFMCKysvz
   NKl3mWmh9Kq7RYegBGCyI2Ut1kBeZPJcvMua4ZWIqYCMoOZYVFqFh8T88
   xv/vDgy4o9ZdUra44ZKIxvPui/0tuw2fp65/SJ2M2P3urSaaNbsLEZx4q
   Q==;
X-CSE-ConnectionGUID: JP/UkxjESHmzWEgkoKeekQ==
X-CSE-MsgGUID: AktEroEsRoG61r5Fkcw0PA==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3959011"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3959011"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 09:12:40 -0800
X-CSE-ConnectionGUID: 6XAV9k7cTMy1FWtmzayBmA==
X-CSE-MsgGUID: AX+lybm5TJKx5/wh2UBvUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10381749"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa003.jf.intel.com with ESMTP; 19 Nov 2026 09:12:39 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 30813B2; Thu, 19 Nov 2026 18:12:33 +0100 (CET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Rene Sapiens <rene.sapiens@linux.intel.com>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 17/18] thunderbolt: Use restricted shared flow control for DMA tunnels on intra-domain links
Date: Thu, 19 Nov 2026 18:12:31 +0100
Message-ID: <20261119171232.1616316-18-mika.westerberg@linux.intel.com>
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

From: Gil Fine <gil.fine@linux.intel.com>

Currently all DMA tunnels use the dedicated flow control scheme, which
allocates a separate pool of credits for every DMA tunnel on each link
it crosses.

Take for example the following topology, where the Host1 <-> Hub link is
an intra-domain link and the links from the Hub to Host2, Host3 and
Host4 are inter-domain links carrying DMA tunnels:

          --- Domain 1 ---
          [Host1: USB4 v1]
                 |
                 |
         [Hub:   USB4 v2]
         /       |        \
        /        |         \
   --Domain2-- --Domain3-- --Domain4--
       |         |            |
   [Host2]     [Host3]      [Host4]
   USB4v1      USB4v1       USB4v1

When several DMA tunnels share the same intra-domain link (Host1 <-> Hub)
and that link supports shared flow control, they can use shared
buffering instead, so there is no need to allocate a separate pool of
credits for each additional DMA tunnel.

Change the flow control from dedicated to restricted shared on
intra-domain links when both ends of the link support it. For links
where shared flow control is not supported, and for inter-domain links,
keep the existing dedicated flow control.

This allows more efficient use of credits on the link.

Signed-off-by: Gil Fine <gil.fine@linux.intel.com>
Signed-off-by: Mika Westerberg (Intel) <westeri@kernel.org>
---
 drivers/thunderbolt/tunnel.c | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index 2ed3cb57d8a9..3f2b6f8eb243 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -1679,6 +1679,34 @@ struct tb_tunnel *tb_tunnel_alloc_dp(struct tb *tb, struct tb_port *in,
 	return NULL;
 }
 
+static inline bool tb_port_shared_buffering_possible(const struct tb_port *port)
+{
+	if (!tb_port_is_null(port) || !port->remote)
+		return false;
+	if (!tb_port_use_credit_allocation(port))
+		return false;
+
+	/* Both ends of the link must support it */
+	return port->shared_buffering && port->remote->shared_buffering;
+}
+
+static unsigned int tb_hop_shared_flags(const struct tb_path *path, int i)
+{
+	const struct tb_path_hop *hop = &path->hops[i];
+	unsigned int flags = 0;
+
+	if (tb_port_shared_buffering_possible(hop->in_port))
+		flags |= TB_HOP_ISE;
+	if (i < path->path_length - 1) {
+		const struct tb_path_hop *next = &path->hops[i + 1];
+
+		if (tb_port_shared_buffering_possible(next->in_port))
+			flags |= TB_HOP_ESE;
+	}
+
+	return flags;
+}
+
 static int tb_dma_init_path(struct tb_path *path)
 {
 	struct tb_path_hop *hop;
@@ -1696,7 +1724,8 @@ static int tb_dma_init_path(struct tb_path *path)
 		if (!tb_port_is_nhi(hop->out_port))
 			flags |= TB_HOP_EFC;
 
-		ret = tb_hop_alloc_credits(hop, TB_CREDITS_DMA, flags);
+		ret = tb_hop_alloc_credits(hop, TB_CREDITS_DMA, flags |
+					   tb_hop_shared_flags(path, i));
 		if (ret)
 			return ret;
 	}
-- 
2.50.1

