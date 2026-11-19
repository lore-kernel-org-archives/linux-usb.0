Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108362;
	b=SCjvnfTPpiPIq5UHCkrdMOuS6hBxIxu6yxR7AqZAkClm845ejNnH2h5LMd8UuJ9hV2fw
	 gnULlPRhaGgfdPAjBLIv/ITrYLOoM4M778ZmJA3RqFLuKP3kkJx/NR8tvKSnyFdvt5Mkl
	 SGKcf9gmhyBDrmsz0yftUh5hbV0E4FAgPA2jmXWtvo0zktkxv/l4ETHYF/Nbr0pOlxj/M
	 V6VV6KcpD2i9rW5/LzckTP3QE7esJh3VD+BTda1v2P7iqUH3e1OuD5bNCAbT35prD8FTW
	 3NGgjWhlRNCIvKY/5ShFgTpStqhOV3RVi7KM/f0pauHUSBgaUcU7L1XBkBZeSb+ZlQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108362;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6UBGNOweEol/k008QCEZcZ3ntGTNtt1lXFnvki2A2w0=;
	b=jN2em1NLHE/BIK8ZUm+T2ka7sH4IjbDXJ6peA2aoRooJkGZOFmwKXQqv5AKOANX2n1+X
	 CVyjQffxQY/2RFmHLObA7x5JXIZLE1qRHJCAssTPW9LY4aAK+ImztfhkJiYuLX65Ebwq9
	 pdAN9aGLMCS1jSXjN8uFw3OxF0aYt5YcCGhlrcG/2ENvpi84iNTdg/cvjY2tB6JeBuv5p
	 1D/LWnA0kfc8ulXIezWd5HPuExg10yy3hBVk50VD3RBKpmIC72qSZscZkl2Pp7912TR2h
	 Jf6IoxsOBEjir7qg1BrbUJu1n8TY/54kWT/ZDB6qpZsGx/X5jxEC+SLKAMS9axl5PbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="W/qSPw79";
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12739606BFF1
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 17:12:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12739606BFF1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=W/qSPw79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795108361; x=1826644361;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iqIh+Gl7OIzQ1JjOKiyKpCKT6TfAKdCF+kpuU5QWwl4=;
  b=W/qSPw79cNvaGulb5VCHrgxx9UbCkDpFHJp6XOoISPJvKWCxkeiH7Hwt
   obLardIVpnhQStesnBfuXq1Q8dSuikjm7PuzaTf7Nv/aOpIVhW2LlddM+
   YqbjA+Pvi1ksKFvneuiGPAmaM0u7vaYXfRItzAzJ3iQxsS1kcW2VdSFG+
   TlSZTpwzKLgl1YRaRTXoF7L6Qqr5AdTE/Cm2gKwCUgjW8rY71zJ3OCrkb
   n7IbMILgWZ9UA+UHM9lLa3g229NgKLw86QmOsaLDaDWTwnlgLaZdriKod
   x+NH3+MBPU+zVIPYQHAINYqSd5ORPHCqKkZNjbdijLDYfF2/P2zM+7SRU
   Q==;
X-CSE-ConnectionGUID: 7kyIWdI0RsKszdxEYY7B1A==
X-CSE-MsgGUID: Bql3jPbhRRSq/eXmWDZcoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4013010"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="4013010"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 09:12:40 -0800
X-CSE-ConnectionGUID: Uw0+iYbUS9unNO1F2o3IQg==
X-CSE-MsgGUID: 5Mh8hyxxR9ud8UB4uUwghQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10575081"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa005.fm.intel.com with ESMTP; 19 Nov 2026 09:12:38 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 2D849B0; Thu, 19 Nov 2026 18:12:33 +0100 (CET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Rene Sapiens <rene.sapiens@linux.intel.com>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 16/18] thunderbolt: Add support for shared flow control
Date: Thu, 19 Nov 2026 18:12:30 +0100
Message-ID: <20261119171232.1616316-17-mika.westerberg@linux.intel.com>
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

It is possible to make several paths share the ingress adapter buffers.
There are two possible configurations: shared flow control and
restricted shared flow control where the former shares all the
configured buffers and the latter shares specified amount of the
configured buffers for the paths going through an ingress adapter.

This adds support for both methods.

While there fix the rollback of NFC credits to start from correct index.

Signed-off-by: Gil Fine <gil.fine@linux.intel.com>
Signed-off-by: Mika Westerberg (Intel) <westeri@kernel.org>
---
 drivers/thunderbolt/credits.c | 132 +++++++++++++++++++++++++++++-----
 drivers/thunderbolt/debugfs.c |  14 ++++
 drivers/thunderbolt/path.c    |  56 ++++++++++++---
 drivers/thunderbolt/switch.c  |  83 +++++++++++++++++++--
 drivers/thunderbolt/tb.h      |  45 ++++++------
 drivers/thunderbolt/tb_regs.h |   2 +
 drivers/thunderbolt/tunnel.c  |  10 ---
 7 files changed, 279 insertions(+), 63 deletions(-)

diff --git a/drivers/thunderbolt/credits.c b/drivers/thunderbolt/credits.c
index 84954778b916..58b9fdec19be 100644
--- a/drivers/thunderbolt/credits.c
+++ b/drivers/thunderbolt/credits.c
@@ -32,6 +32,7 @@
  * @common_first: Try first from the common pool
  * @single_user: At most one tunnel of this type goes through a lane
  *		 adapter (only meaningful with @common_first)
+ * @shared: Allow shared buffering to be used
  *
  * If @common_first is true then allocations are first tried from
  * %USB4_CREDIT_POOL_COMMON and if there is not enough room then the
@@ -49,6 +50,7 @@ struct credit_policy {
 	enum usb4_credit_pool_type pool;
 	bool common_first;
 	bool single_user;
+	bool shared;
 };
 
 static const struct credit_policy credit_policy[] = {
@@ -71,6 +73,7 @@ static const struct credit_policy credit_policy[] = {
 	[TB_CREDITS_DMA] = {
 		.pool = USB4_CREDIT_POOL_DMA,
 		.common_first = true,
+		.shared = true,
 	},
 };
 
@@ -362,16 +365,14 @@ static unsigned int tb_switch_dma_credits(const struct tb_switch *sw)
 	return min(credits, MAX_PATH_CREDITS);
 }
 
-static int usb4_port_alloc_credits(struct tb_port *port,
-				   const struct credit_policy *policy,
-				   unsigned int min, unsigned int max,
-				   struct usb4_credit_pool **ppool)
+static int __usb4_port_alloc_credits(struct tb_port *port,
+				     const struct credit_policy *policy,
+				     unsigned int min, unsigned int max,
+				     struct usb4_credit_pool **ppool)
 {
 	enum usb4_credit_pool_type primary, secondary, resolved;
 	int ret;
 
-	guard(mutex)(&credits_lock);
-
 	if (policy->common_first) {
 		primary = USB4_CREDIT_POOL_COMMON;
 		secondary = policy->pool;
@@ -397,6 +398,58 @@ static int usb4_port_alloc_credits(struct tb_port *port,
 	}
 
 	*ppool = &port->credit_pool[resolved];
+	return ret;
+}
+
+static inline unsigned int
+usb4_port_total_shared_credits(const struct tb_port *port)
+{
+	/* For now only DMA uses shared credits so LCA == PCA */
+	return tb_switch_dma_credits(port->sw);
+}
+
+static int usb4_port_alloc_shared_credits(struct tb_port *port,
+					  const struct credit_policy *policy,
+					  unsigned int min, unsigned int max,
+					  struct usb4_credit_pool **ppool)
+{
+	int ret;
+
+	if (WARN_ON(!policy->shared))
+		return -EINVAL;
+
+	if (!port->shared_users) {
+		unsigned int lca = usb4_port_total_shared_credits(port);
+
+		ret = __usb4_port_alloc_credits(port, policy, min, lca, ppool);
+		if (ret < 0)
+			return ret;
+		port->shared_pool = *ppool;
+		port->shared_credits = ret;
+	} else if (min > port->shared_credits) {
+		return -ENOBUFS;
+	}
+
+	port->shared_users++;
+	ret = min(max, port->shared_credits);
+	*ppool = port->shared_pool;
+
+	tb_port_dbg(port, "credits: allocated shared: %u users: %u\n", ret,
+		    port->shared_users);
+
+	return ret;
+}
+
+static int usb4_port_alloc_dedicated_credits(struct tb_port *port,
+					     const struct credit_policy *policy,
+					     unsigned int min, unsigned int max,
+					     struct usb4_credit_pool **ppool)
+{
+	int ret;
+
+	ret = __usb4_port_alloc_credits(port, policy, min, max, ppool);
+	if (ret < 0)
+		return ret;
 
 	/* Single user took from common, so return the minimum back there */
 	if (policy->single_user &&
@@ -409,18 +462,52 @@ static int usb4_port_alloc_credits(struct tb_port *port,
 	return ret;
 }
 
+static int usb4_port_alloc_credits(struct tb_port *port,
+				   const struct credit_policy *policy,
+				   unsigned int min, unsigned int max,
+				   bool shared, struct usb4_credit_pool **ppool)
+{
+	guard(mutex)(&credits_lock);
+
+	if (shared)
+		return usb4_port_alloc_shared_credits(port, policy, min, max,
+						      ppool);
+	return usb4_port_alloc_dedicated_credits(port, policy, min, max, ppool);
+}
+
 static void usb4_port_release_credits(struct tb_port *port,
-				      unsigned int credits,
+				      unsigned int credits, bool shared,
 				      struct usb4_credit_pool *pool,
 				      const struct credit_policy *policy)
 {
 	guard(mutex)(&credits_lock);
 
-	usb4_credit_pool_free(pool, credits);
-	/* The minimum went to common at allocation, reserve it again */
-	if (policy->single_user &&
-	    pool == &port->credit_pool[USB4_CREDIT_POOL_COMMON])
-		usb4_port_reserve_credits(port, policy->pool);
+	if (shared) {
+		const struct usb4_credit_pool *shared_pool = port->shared_pool;
+		unsigned int tmp = port->shared_credits;
+
+		if (WARN_ON(!port->shared_users))
+			return;
+
+		if (!--port->shared_users) {
+			usb4_credit_pool_free(port->shared_pool,
+					      port->shared_credits);
+			port->shared_pool = NULL;
+			port->shared_credits = 0;
+		}
+		tb_port_dbg(port,
+			    "credits: released shared %s: %u users: %u\n",
+			    usb4_credit_pool_name(shared_pool), tmp,
+			    port->shared_users);
+	} else {
+		usb4_credit_pool_free(pool, credits);
+		/* The minimum went to common at allocation, reserve it again */
+		if (policy->single_user &&
+		    pool == &port->credit_pool[USB4_CREDIT_POOL_COMMON])
+			usb4_port_reserve_credits(port, policy->pool);
+		tb_port_dbg(port, "credits: released %s: %u\n",
+			    usb4_credit_pool_name(pool), credits);
+	}
 }
 
 /**
@@ -465,7 +552,7 @@ int tb_hop_alloc_credits(struct tb_path_hop *hop, enum tb_credit_type type,
 {
 	struct tb_port *port = hop->in_port;
 	struct tb_switch *sw = port->sw;
-	bool dedicated;
+	bool dedicated, shared;
 	int ret;
 
 	/* Only DP main link is supposed to use flow control disabled */
@@ -473,12 +560,15 @@ int tb_hop_alloc_credits(struct tb_path_hop *hop, enum tb_credit_type type,
 		return -EINVAL;
 
 	dedicated = flags & TB_HOP_IFC;
+	shared = flags & TB_HOP_ISE;
 
 	if (tb_switch_is_usb4(sw) && !tb_port_is_null(port)) {
 		/*
-		 * USB4 protocol adapter path credits allocated is
-		 * vendor defined.
+		 * USB4 protocol adapter path credits allocated and ISE
+		 * bit are vendor defined.
 		 */
+		if (WARN_ON(shared))
+			return -EINVAL;
 		ret = 0;
 	} else if (tb_port_use_credit_allocation(port)) {
 		unsigned int min, max;
@@ -512,11 +602,14 @@ int tb_hop_alloc_credits(struct tb_path_hop *hop, enum tb_credit_type type,
 			return -ENOBUFS;
 
 		ret = usb4_port_alloc_credits(port, &credit_policy[type], min,
-					      max, &hop->credit_pool);
+					      max, shared, &hop->credit_pool);
 		if (ret < 0)
 			return ret;
 		hop->credit_type = type;
 	} else {
+		if (WARN_ON(shared))
+			return -EINVAL;
+
 		switch (type) {
 		case TB_CREDITS_DP_MAIN:
 			ret = min(port->total_credits - 2, 12U);
@@ -547,8 +640,12 @@ int tb_hop_alloc_credits(struct tb_path_hop *hop, enum tb_credit_type type,
 		hop->initial_credits = ret;
 		hop->ingress_fc_enable = true;
 	}
+	if (shared)
+		hop->ingress_shared_buffer = true;
 	if (flags & TB_HOP_EFC)
 		hop->egress_fc_enable = true;
+	if (flags & TB_HOP_ESE)
+		hop->egress_shared_buffer = true;
 	if (!flags)
 		hop->nfc_credits = ret;
 
@@ -573,12 +670,15 @@ void tb_hop_release_credits(struct tb_path_hop *hop)
 			credits = hop->initial_credits;
 
 		usb4_port_release_credits(hop->in_port, credits,
+					  hop->ingress_shared_buffer,
 					  hop->credit_pool,
 					  &credit_policy[hop->credit_type]);
 	}
 
 	hop->ingress_fc_enable = false;
 	hop->egress_fc_enable = false;
+	hop->ingress_shared_buffer = false;
+	hop->egress_shared_buffer = false;
 	hop->credit_pool = NULL;
 	hop->initial_credits = 0;
 	hop->nfc_credits = 0;
diff --git a/drivers/thunderbolt/debugfs.c b/drivers/thunderbolt/debugfs.c
index eac6d564bf18..5e9e087ae237 100644
--- a/drivers/thunderbolt/debugfs.c
+++ b/drivers/thunderbolt/debugfs.c
@@ -2501,6 +2501,20 @@ static void credits_show(const struct tb_port *port, struct seq_file *s)
 			   usb4_credit_pool_used(pool),
 			   usb4_credit_pool_total(pool));
 	}
+
+	if (port->shared_buffering) {
+		const char *name;
+
+		if (port->shared_pool)
+			name = usb4_credit_pool_name(port->shared_pool);
+		else
+			name = "-";
+
+		seq_puts(s, "# shared pool credits users paths\n");
+		seq_printf(s, "shared %s %u %u %u\n", name,
+			   port->shared_credits, port->shared_users,
+			   port->shared_paths);
+	}
 }
 
 static int port_credits_show(struct seq_file *s, void *not_used)
diff --git a/drivers/thunderbolt/path.c b/drivers/thunderbolt/path.c
index 9b18704f8010..89d3046498ce 100644
--- a/drivers/thunderbolt/path.c
+++ b/drivers/thunderbolt/path.c
@@ -368,6 +368,25 @@ static void __tb_path_deallocate_nfc(struct tb_path *path, int first_hop)
 	}
 }
 
+static void __tb_path_deallocate_shared(struct tb_path *path, int first_hop)
+{
+	int i;
+
+	for (i = first_hop; i < path->path_length; i++) {
+		int ret;
+
+		if (!path->hops[i].ingress_shared_buffer)
+			continue;
+
+		ret = tb_port_enable_shared_buffering(path->hops[i].in_port,
+						      false);
+		if (ret)
+			tb_port_warn(path->hops[i].in_port,
+				     "shared credits deallocation failed for hop %d\n",
+				     i);
+	}
+}
+
 static int __tb_path_deactivate_hop(struct tb_port *port, int hop_index,
 				    bool clear_fc)
 {
@@ -469,6 +488,7 @@ void tb_path_deactivate(struct tb_path *path)
 	       tb_route(path->hops[path->path_length - 1].out_port->sw),
 	       path->hops[path->path_length - 1].out_port->port);
 	__tb_path_deactivate_hops(path, 0);
+	__tb_path_deallocate_shared(path, 0);
 	__tb_path_deallocate_nfc(path, 0);
 	path->activated = false;
 }
@@ -485,7 +505,6 @@ void tb_path_deactivate(struct tb_path *path)
 int tb_path_activate(struct tb_path *path)
 {
 	int i, res;
-	enum tb_path_port out_mask, in_mask;
 	if (path->activated) {
 		tb_WARN(path->tb, "trying to activate already activated path\n");
 		return -EINVAL;
@@ -513,11 +532,23 @@ int tb_path_activate(struct tb_path *path)
 		res = tb_port_add_nfc_credits(path->hops[i].in_port,
 					      path->hops[i].nfc_credits);
 		if (res) {
-			__tb_path_deallocate_nfc(path, i);
+			__tb_path_deallocate_nfc(path, i + 1);
 			goto err;
 		}
 	}
 
+	/* Add shared credits */
+	for (i = path->path_length - 1; i >= 0; i--) {
+		if (!path->hops[i].ingress_shared_buffer)
+			continue;
+		res = tb_port_enable_shared_buffering(path->hops[i].in_port,
+						      true);
+		if (res) {
+			__tb_path_deallocate_shared(path, i + 1);
+			goto err_nfc;
+		}
+	}
+
 	/* Activate hops. */
 	for (i = 0; i < path->path_length; i++) {
 		struct tb_regs_hop hop = { 0 };
@@ -529,8 +560,10 @@ int tb_path_activate(struct tb_path *path)
 		/* Needed for USB4 routers, read path config space before write */
 		res = tb_port_read(path->hops[i].in_port, &hop, TB_CFG_HOPS,
 				   2 * path->hops[i].in_hop_index, 2);
-		if (res)
-			goto err;
+		if (res) {
+			__tb_path_deactivate_hops(path, 0);
+			goto err_shared;
+		}
 
 		hop.next_hop = path->hops[i].next_hop_index;
 		hop.out_port = path->hops[i].out_port->port;
@@ -538,9 +571,6 @@ int tb_path_activate(struct tb_path *path)
 		hop.unknown1 = 0;
 		hop.enable = 1;
 
-		out_mask = (i == path->path_length - 1) ?
-				TB_PATH_DESTINATION : TB_PATH_INTERNAL;
-		in_mask = (i == 0) ? TB_PATH_SOURCE : TB_PATH_INTERNAL;
 		hop.weight = path->weight;
 		hop.unknown2 = 0;
 		hop.priority = path->priority;
@@ -548,7 +578,7 @@ int tb_path_activate(struct tb_path *path)
 		hop.counter = path->hops[i].in_counter_index;
 		hop.counter_enable = path->hops[i].in_counter_index != -1;
 		hop.egress_fc = path->hops[i].egress_fc_enable;
-		hop.egress_shared_buffer = path->egress_shared_buffer & out_mask;
+		hop.egress_shared_buffer = path->hops[i].egress_shared_buffer;
 		/*
 		 * Protocol adapters IFC and ISE bits, and Path Credits
 		 * Allocated are vendor defined in the USB4 spec so we
@@ -559,7 +589,7 @@ int tb_path_activate(struct tb_path *path)
 			hop.initial_credits = path->hops[i].initial_credits;
 			hop.ingress_fc = path->hops[i].ingress_fc_enable;
 			hop.ingress_shared_buffer =
-				path->ingress_shared_buffer & in_mask;
+				path->hops[i].ingress_shared_buffer;
 		}
 
 		hop.unknown3 = 0;
@@ -570,13 +600,17 @@ int tb_path_activate(struct tb_path *path)
 				    2 * path->hops[i].in_hop_index, 2);
 		if (res) {
 			__tb_path_deactivate_hops(path, 0);
-			__tb_path_deallocate_nfc(path, 0);
-			goto err;
+			goto err_shared;
 		}
 	}
 	path->activated = true;
 	tb_dbg(path->tb, "%s path activation complete\n", path->name);
 	return 0;
+
+err_shared:
+	__tb_path_deallocate_shared(path, 0);
+err_nfc:
+	__tb_path_deallocate_nfc(path, 0);
 err:
 	tb_warn(path->tb, "%s path activation failed: %d\n", path->name, res);
 	return res;
diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index a4b96950f3e6..8899fea713ac 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -459,6 +459,8 @@ static void tb_dump_port(struct tb *tb, const struct tb_port *port)
 	tb_dbg(tb, "  NFC Credits: %#x\n", regs->nfc_credits);
 	tb_dbg(tb, "  Credits (total/control): %u/%u\n", port->total_credits,
 	       port->ctl_credits);
+	tb_dbg(tb, "  Shared buffering: %s\n",
+	       str_yes_no(port->shared_buffering));
 }
 
 /**
@@ -587,7 +589,8 @@ int tb_wait_for_port(struct tb_port *port, bool wait_if_unplugged)
  */
 int tb_port_add_nfc_credits(struct tb_port *port, int credits)
 {
-	u32 nfc_credits;
+	u32 nfc_credits, val;
+	int ret;
 
 	if (credits == 0 || port->sw->is_unplugged)
 		return 0;
@@ -608,11 +611,78 @@ int tb_port_add_nfc_credits(struct tb_port *port, int credits)
 	tb_port_dbg(port, "adding %d NFC credits to %lu", credits,
 		    port->config.nfc_credits & ADP_CS_4_NFC_BUFFERS_MASK);
 
-	port->config.nfc_credits &= ~ADP_CS_4_NFC_BUFFERS_MASK;
-	port->config.nfc_credits |= nfc_credits;
+	val = port->config.nfc_credits & ~ADP_CS_4_NFC_BUFFERS_MASK;
+	val |= nfc_credits;
+
+	ret = tb_port_write(port, &val, TB_CFG_PORT, ADP_CS_4, 1);
+	if (ret)
+		return ret;
+
+	port->config.nfc_credits = val;
+	return 0;
+}
+
+static int tb_port_set_shared_credits(struct tb_port *port,
+				      unsigned int credits)
+{
+	u32 val, lca;
+	int ret;
+
+	ret = tb_port_read(port, &val, TB_CFG_PORT, ADP_CS_5, 1);
+	if (ret)
+		return ret;
+
+	lca = FIELD_GET(ADP_CS_5_LCA_MASK, val);
+	if (lca == credits)
+		return 0;
+
+	val &= ~ADP_CS_5_LCA_MASK;
+	val |= FIELD_PREP(ADP_CS_5_LCA_MASK, credits);
+
+	return tb_port_write(port, &val, TB_CFG_PORT, ADP_CS_5, 1);
+}
 
-	return tb_port_write(port, &port->config.nfc_credits,
-			     TB_CFG_PORT, ADP_CS_4, 1);
+/**
+ * tb_port_enable_shared_buffering() - Enable/disable shared buffering
+ * @port: Ingress lane adapter to enable shared buffering
+ * @enable: Enable or disable shared buffering
+ *
+ * Enables/disables shared buffering for an ingress lane adapter. The
+ * credits should be set in @port->shared_credits before this is called.
+ * Can be called several times, the actual enable/disable happens only
+ * on first/last caller.
+ *
+ * Return: %0 on success, negative errno otherwise.
+ */
+int tb_port_enable_shared_buffering(struct tb_port *port, bool enable)
+{
+	int ret;
+
+	if (port->sw->is_unplugged)
+		return 0;
+
+	if (enable) {
+		if (WARN_ON(!port->shared_credits))
+			return -EINVAL;
+		ret = tb_port_set_shared_credits(port, port->shared_credits);
+		if (ret) {
+			tb_port_warn(port, "failed to set shared buffers\n");
+			return ret;
+		}
+		port->shared_paths++;
+	} else {
+		if (WARN_ON(!port->shared_paths))
+			return -EINVAL;
+		if (--port->shared_paths)
+			return 0;
+		ret = tb_port_set_shared_credits(port, 0);
+		if (ret) {
+			tb_port_warn(port, "failed to clear shared buffers\n");
+			return ret;
+		}
+	}
+
+	return 0;
 }
 
 /**
@@ -770,9 +840,12 @@ static int tb_init_port(struct tb_port *port)
 		 */
 		if (port->cap_usb4) {
 			struct tb_regs_hop hop;
+			u32 val;
 
 			if (!tb_port_read(port, &hop, TB_CFG_HOPS, 0, 2))
 				port->ctl_credits = hop.initial_credits;
+			if (!tb_port_read(port, &val, TB_CFG_PORT, ADP_CS_3, 1))
+				port->shared_buffering = !!(val & ADP_CS_3_SBC);
 		}
 		if (!port->ctl_credits)
 			port->ctl_credits = 2;
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 25d3966521a8..6da3492fd322 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -285,6 +285,10 @@ struct tb_bandwidth_group {
  *     |            | is kept all the time.
  *     +------------+ port->total_credits
  *
+ * Shared buffers follow the same rule as DMA. They are carved out of
+ * %USB4_CREDIT_POOL_COMMON if there is room, otherwise the minimum from
+ * the corresponding reserved pool.
+ *
  * If an XDomain is connected to the adapter only DMA can go through, so
  * all the credits stay in %USB4_CREDIT_POOL_COMMON. Lane 1 adapter of a
  * bonded link has no credits.
@@ -373,6 +377,12 @@ enum tb_credit_type {
  * @total_credits: Total number of buffers available for this port
  * @ctl_credits: Buffers reserved for control path
  * @credit_pool: Pool of credits used for tunneling (USB4 only)
+ * @shared_buffering: Lane adapter supports shared buffering
+ * @shared_paths: Number of paths going through this adapter using
+ *		  shared buffering
+ * @shared_users: Number of paths that have allocated shared buffers
+ * @shared_credits: Number of allocated shared buffers
+ * @shared_pool: Credit pool where shared credits are allocated from (USB4 only)
  * @group: Bandwidth allocation group the adapter is assigned to. Only
  *	   used for DP IN adapters for now.
  * @group_list: The adapter is linked to the group's list of ports through this
@@ -406,6 +416,11 @@ struct tb_port {
 	unsigned int total_credits;
 	unsigned int ctl_credits;
 	struct usb4_credit_pool *credit_pool;
+	bool shared_buffering;
+	unsigned int shared_paths;
+	unsigned int shared_users;
+	unsigned int shared_credits;
+	struct usb4_credit_pool *shared_pool;
 	struct tb_bandwidth_group *group;
 	struct list_head group_list;
 	unsigned int max_bw;
@@ -476,6 +491,8 @@ struct tb_retimer {
  *		 @in_port.
  * @ingress_fc_enable: Enable flow control in ingress adapter
  * @egress_fc_enable: Enable flow control in egress adapter
+ * @ingress_shared_buffer: Enable shared buffering for ingress adapter
+ * @egress_shared_buffer: Enable shared buffering for egress adapter
  * @credit_pool: Pointer to the credit pool used to hold
  *		 @initial_credits or @nfc_credits (%NULL if not used)
  * @credit_type: Type of credits allocated (valid when @credit_pool is set)
@@ -502,33 +519,17 @@ struct tb_path_hop {
 	unsigned int nfc_credits;
 	bool ingress_fc_enable;
 	bool egress_fc_enable;
+	bool ingress_shared_buffer;
+	bool egress_shared_buffer;
 	struct usb4_credit_pool *credit_pool;
 	enum tb_credit_type credit_type;
 	bool pm_support;
 };
 
-/**
- * enum tb_path_port - path options mask
- * @TB_PATH_NONE: Do not activate on any hop on path
- * @TB_PATH_SOURCE: Activate on the first hop (out of src)
- * @TB_PATH_INTERNAL: Activate on the intermediate hops (not the first/last)
- * @TB_PATH_DESTINATION: Activate on the last hop (into dst)
- * @TB_PATH_ALL: Activate on all hops on the path
- */
-enum tb_path_port {
-	TB_PATH_NONE = 0,
-	TB_PATH_SOURCE = 1,
-	TB_PATH_INTERNAL = 2,
-	TB_PATH_DESTINATION = 4,
-	TB_PATH_ALL = 7,
-};
-
 /**
  * struct tb_path - a unidirectional path between two ports
  * @tb: Pointer to the domain structure
  * @name: Name of the path (used for debugging)
- * @ingress_shared_buffer: Shared buffering used for ingress ports on the path
- * @egress_shared_buffer: Shared buffering used for egress ports on the path
  * @priority: Priority group if the path
  * @weight: Weight of the path inside the priority group
  * @drop_packages: Drop packages from queue tail or head
@@ -545,9 +546,6 @@ enum tb_path_port {
 struct tb_path {
 	struct tb *tb;
 	const char *name;
-	enum tb_path_port ingress_shared_buffer;
-	enum tb_path_port egress_shared_buffer;
-
 	unsigned int priority:3;
 	int weight:4;
 	bool drop_packages;
@@ -1211,6 +1209,7 @@ void tb_switch_xhci_disconnect(struct tb_switch *sw);
 int tb_port_state(struct tb_port *port);
 int tb_wait_for_port(struct tb_port *port, bool wait_if_unplugged);
 int tb_port_add_nfc_credits(struct tb_port *port, int credits);
+int tb_port_enable_shared_buffering(struct tb_port *port, bool enable);
 int tb_port_clear_counter(struct tb_port *port, int counter);
 int tb_port_unlock(struct tb_port *port);
 int tb_port_enable(struct tb_port *port);
@@ -1332,6 +1331,10 @@ bool tb_path_port_on_path(const struct tb_path *path,
 #define TB_HOP_IFC		BIT(0)
 /* Use flow control in egress adapter */
 #define TB_HOP_EFC		BIT(1)
+/* Enable shared buffering in ingress adapter */
+#define TB_HOP_ISE		BIT(2)
+/* Enable shared buffering in egress adapter */
+#define TB_HOP_ESE		BIT(3)
 
 int tb_hop_alloc_credits(struct tb_path_hop *hop, enum tb_credit_type type,
 			 unsigned int flags);
diff --git a/drivers/thunderbolt/tb_regs.h b/drivers/thunderbolt/tb_regs.h
index 92d893634d2b..ca0f18798d95 100644
--- a/drivers/thunderbolt/tb_regs.h
+++ b/drivers/thunderbolt/tb_regs.h
@@ -311,6 +311,8 @@ struct tb_regs_port_header {
 } __packed;
 
 /* Basic adapter configuration registers */
+#define ADP_CS_3				0x03
+#define ADP_CS_3_SBC				BIT(31)
 #define ADP_CS_4				0x04
 #define ADP_CS_4_NFC_BUFFERS_MASK		GENMASK(9, 0)
 #define ADP_CS_4_TOTAL_BUFFERS_MASK		GENMASK(29, 20)
diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index ffadd30bff7b..2ed3cb57d8a9 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -348,8 +348,6 @@ static int tb_pci_init_path(struct tb_path *path)
 	struct tb_path_hop *hop;
 	int i;
 
-	path->egress_shared_buffer = TB_PATH_NONE;
-	path->ingress_shared_buffer = TB_PATH_NONE;
 	path->priority = TB_PCI_PRIORITY;
 	path->weight = TB_PCI_WEIGHT;
 	path->drop_packages = 0;
@@ -1413,8 +1411,6 @@ static int tb_dp_init_aux_path(struct tb_path *path, bool pm_support)
 	struct tb_path_hop *hop;
 	int i;
 
-	path->egress_shared_buffer = TB_PATH_NONE;
-	path->ingress_shared_buffer = TB_PATH_NONE;
 	path->priority = TB_DP_AUX_PRIORITY;
 	path->weight = TB_DP_AUX_WEIGHT;
 
@@ -1440,8 +1436,6 @@ static int tb_dp_init_video_path(struct tb_path *path, bool pm_support)
 	struct tb_path_hop *hop;
 	int i;
 
-	path->egress_shared_buffer = TB_PATH_NONE;
-	path->ingress_shared_buffer = TB_PATH_NONE;
 	path->priority = TB_DP_VIDEO_PRIORITY;
 	path->weight = TB_DP_VIDEO_WEIGHT;
 
@@ -1690,8 +1684,6 @@ static int tb_dma_init_path(struct tb_path *path)
 	struct tb_path_hop *hop;
 	int i;
 
-	path->egress_shared_buffer = TB_PATH_NONE;
-	path->ingress_shared_buffer = TB_PATH_NONE;
 	path->priority = TB_DMA_PRIORITY;
 	path->weight = TB_DMA_WEIGHT;
 	path->clear_fc = true;
@@ -1984,8 +1976,6 @@ static int tb_usb3_init_path(struct tb_path *path)
 	struct tb_path_hop *hop;
 	int i;
 
-	path->egress_shared_buffer = TB_PATH_NONE;
-	path->ingress_shared_buffer = TB_PATH_NONE;
 	path->priority = TB_USB3_PRIORITY;
 	path->weight = TB_USB3_WEIGHT;
 	path->drop_packages = 0;
-- 
2.50.1

