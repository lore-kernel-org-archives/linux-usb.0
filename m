Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108756;
	b=RxtKcooME1WqdjxoChJ1d4mh73kOQ7DVFBUi2v8l5X3YqzVOAJuqX/7Zk5nj9FxIY/fQ
	 qMwgak2kYKgt4IpsA3cS3LfWPZv4RlGuWFqgr1EawfCiWVdmkp0H+TQNHxgSM/5Dnlj5c
	 l+88d6FzEGf1H9/Fug925lbKbwKCqF1CK6EPxEd0uc/H+nCboLLGkIhUu6XvtJfIcVDTG
	 3/0MzN+VC5XROz3IVq21p17jDSOWYlW8pLAop3oDw5bdS6lwuVmwryJJmQKzBd9jP0/9y
	 7MFrGN/7r2P3SK3rD2Xtmtxp3o8KenX9K0/xo8Q8uvnJr0uIq6vTJsNnrnfkCNmRliQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108756;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6a3EoWOylQDY9v/jQEBnEETG+BbMcI5n8WPlXpBLMl4=;
	b=nSTRtCwl6KEN16r/yVjd5gxj9WC0dSos8Eu/M4fuAGqa+DLLibHY2nQbhXYC873sOYAB
	 WyRJaGG9/3drGuexvyjamPvs1yKLjbDvAsSwZU57t8l378nDmINFVZs3dRTw59vCUcToa
	 l4boUDKBpDNot6jIWSggZETO5Sqd1qxpu2SnlDNlWrk5FsLVJTMO5oVK1uRvm8lsZmvee
	 9GYeXWCo50+e3mkCXcElWEB66mlPJittaeSMyPg3a8GVDp37YrK67LMSpI3EoN73qzYZa
	 IzBtgNq7TaA9E4xbG8lc8p2qNU/yoxcvjRNsXu7OlRFwpj7FinIc2uzLHvqtmVtdRzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aOVh998B;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42423606A320
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 17:19:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42423606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aOVh998B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795108756; x=1826644756;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QLbpNSL0gtWJ2UyLw4FaQr7Be7I1DvwJrgBBT1QzSN0=;
  b=aOVh998BqLD5QHsF/NCuqBqBzAdJu/P4LAbBzuIOIhmjehVGI+z5QHt2
   bM0VVFgtIqv/+4ahLOfiA46Bgseel8G3kXuRZtOufYWXNiT306l1Mgge6
   vcRqUhuOFt2yrax8+TuXUSfi8Axs9JrOAr9WmQ77EhXkSpvOdUp7wPe3L
   SEnIbklJfwj7pEoSqJaTqtOiiWvf0enEMaqp9MLYDA8aWhY+9LSY28jXg
   UTGqefEDPuyqIlujpZdCf3tbNKEzyoTfLn0TvzGftyYtviaNLAL6qj94J
   LNiEXtirf3q92QgJIC1O8AT/I0v1HT2Jf2eAueG9kOuFfktdKnVzaEA6i
   g==;
X-CSE-ConnectionGUID: QFnx9FcSSH6U1TpTydoW7w==
X-CSE-MsgGUID: Qz6mxBRlTqqmitENS3l1Qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3958976"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3958976"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 09:12:36 -0800
X-CSE-ConnectionGUID: xx9dSPHlRgOTlzVT5qj+mg==
X-CSE-MsgGUID: zyEnqwyGRnS5m/1vKcseZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10381715"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa003.jf.intel.com with ESMTP; 19 Nov 2026 09:12:34 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id F25859B; Thu, 19 Nov 2026 18:12:32 +0100 (CET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Rene Sapiens <rene.sapiens@linux.intel.com>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 01/18] thunderbolt: Avoid leaking of DMA tunnel after XDomain removal
Date: Thu, 19 Nov 2026 18:12:15 +0100
Message-ID: <20261119171232.1616316-2-mika.westerberg@linux.intel.com>
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

When XDomain is disconnected the service drivers remain bound until
tb_domain_unregister_unplugged_xdomains() runs outside of tb->lock, and
during that window a service driver can still enable a tunnel by calling
tb_xdomain_enable_paths(). This tunnel is also added to the tunnel list.
Then later when the service driver is unbound
tb_disconnect_xdomain_paths() checks for xd->is_unplugged and skips the
tear down leaking the tunnel.

Fix this by checking xd->is_unplugged and doing the adapter lookups
under tb->lock (tb->root_switch is NULL once domain is being removed) in
tb_approve_xdomain_paths() and tb_disconnect_xdomain_paths().

Fixes: a8937f35cf39 ("thunderbolt: Remove XDomain from the bus without holding tb->lock")
Cc: stable@vger.kernel.org
Signed-off-by: Mika Westerberg (Intel) <westeri@kernel.org>
---
 drivers/thunderbolt/tb.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 418ad0a61a5d..655bcc699410 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -2336,12 +2336,18 @@ static int tb_approve_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
 	struct tb_switch *sw;
 	int ret;
 
+	mutex_lock(&tb->lock);
+
+	/* The XDomain is going away so no new tunnels allowed */
+	if (xd->is_unplugged) {
+		ret = -ENODEV;
+		goto err_unlock;
+	}
+
 	sw = tb_to_switch(xd->dev.parent);
 	dst_port = tb_port_at(xd->route, sw);
 	nhi_port = tb_switch_find_port(tb->root_switch, TB_TYPE_NHI);
 
-	mutex_lock(&tb->lock);
-
 	/*
 	 * When tunneling DMA paths the link should not enter CL states
 	 * so disable them now.
@@ -2370,6 +2376,7 @@ static int tb_approve_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
 	tb_tunnel_put(tunnel);
 err_clx:
 	tb_enable_clx(sw);
+err_unlock:
 	mutex_unlock(&tb->lock);
 
 	return ret;
@@ -2411,13 +2418,12 @@ static int tb_disconnect_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
 				       int transmit_path, int transmit_ring,
 				       int receive_path, int receive_ring)
 {
-	if (!xd->is_unplugged) {
-		mutex_lock(&tb->lock);
+	mutex_lock(&tb->lock);
+	if (!xd->is_unplugged)
 		__tb_disconnect_xdomain_paths(tb, xd, transmit_path,
 					      transmit_ring, receive_path,
 					      receive_ring);
-		mutex_unlock(&tb->lock);
-	}
+	mutex_unlock(&tb->lock);
 	return 0;
 }
 
-- 
2.50.1

