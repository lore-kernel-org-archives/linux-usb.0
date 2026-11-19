Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108359;
	b=ngeXQPLKRf6XS/4DJh8VV5x0BdkEU5c4nkx4kjJRNpniKpjrGqyBkXs5ldusC4QNZ28b
	 v+ymSpif6armgZ9KIVxwvBPG3J+N62yNuaT2ixr0MQSBl3Xl3ag5dpYrjWD5KPG/Bswca
	 XtUcmCUeCRP60NCR6/CC8Hdr+FwyBcNjVyHDPuNxjXylV1ugPm01CWhIpzSUyWlC89ZcH
	 FRn0k0BeBEinran9cgBLKFACIaHmQSnE6SggNNWnmpySnqg2V0PzDacbGCbR9qkuHRGiL
	 Nmi1W/Wz25drb+in9gxe7qV1krwDg1xa0JV65FXWYj/hyBcSrEw1Lqs0q2q5V6vv+uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108359;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FMLk6OR9r5Y40b6sNnk/l2EFs9Za7LwBwhQyGEZs7M0=;
	b=TP+bwuSF7bJ/vLpqXuNji+2CYxFqDW+sdftQvrbiFJKgMzUFO8dSNtq+cX1W6gtrTiOJ
	 V1QnHsc5iMkqj/mVfhD9jhEoeMJbevCaCeFmZS9YJGWAtD5VOmahg/y0lLKKaiURFBB/s
	 J3H3jzjVzJJMN+GLMVMlBuwpxtNEKsk1ZDu7CVySfoX1s7wl2uwNzJqrlEI9qFn9y6az4
	 ySA8kmgGaq82He6CTf0WIU3B7UxjRWQqfxSaf7tcrxRghDomkbJLGDwbX3q8U51lTRRuD
	 2lzwahhV6wJKGCnCoLdpbqRYgZmWabS5dY8Nb7vpgytJsjnS21kdHl9UbJcUQ28VoTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Qyc011nE;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09912606A60B
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 17:12:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09912606A60B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Qyc011nE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795108359; x=1826644359;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mHoVjrcJCloFzI3B4GDCOVGJF42ARiiey2B5fcr1SEo=;
  b=Qyc011nE7aa8VTUTARU7POx4KXPJqYtZRTJMLsJEmHJhQFAyEU2ycU6H
   EJAuufCDBlF/bGe3blqPPe11TMmWGzq+KiHNUKpSoSo+SDzdRIOO8ZVUt
   hIoCJ9PTKSgOSZ+TKShuVYXtbKvfU5QKZn80rHG+FvVuTh/itdc/OkO+8
   TzSRbE2D/Vimk2zdmHHJ1LVVvJ8/z1GpQU7Ltu/CA0Wtz6rg7ZOM/jED3
   EUpGVZVcUJGXmm27Md5LUbYhWHa28cJcvyxaXAhKXBBIkYquVqjavhP5x
   06AB5C51wiNNjf/BWDl0pHtObUNZJoJOs4fMsopTLNEuoZOSTCtzZWfMp
   g==;
X-CSE-ConnectionGUID: 6PncOSMhTFCZDBTKquvf9Q==
X-CSE-MsgGUID: Xkfhc67aQHa6a3GdQxsVBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4012999"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="4012999"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 09:12:38 -0800
X-CSE-ConnectionGUID: OWWWam3wRkq53Q68C+dPxg==
X-CSE-MsgGUID: Htx6yGrmT3SVOCX9qE8TWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10575073"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa005.fm.intel.com with ESMTP; 19 Nov 2026 09:12:37 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 267B7AE; Thu, 19 Nov 2026 18:12:33 +0100 (CET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Rene Sapiens <rene.sapiens@linux.intel.com>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 14/18] thunderbolt: Assign domain to the routers in KUnit tests
Date: Thu, 19 Nov 2026 18:12:28 +0100
Message-ID: <20261119171232.1616316-15-mika.westerberg@linux.intel.com>
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

The tests allocate routers without a domain (struct tb) but some of the
tunneling parameters, such as the buffer allocation, need to be read
from the host router which is reached through the domain. For this
reason allocate a dummy domain structure, and fill in the host router
pointer accordingly.

Signed-off-by: Mika Westerberg (Intel) <westeri@kernel.org>
---
 drivers/thunderbolt/test.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/thunderbolt/test.c b/drivers/thunderbolt/test.c
index a1f9dbb66940..9c6da22cd100 100644
--- a/drivers/thunderbolt/test.c
+++ b/drivers/thunderbolt/test.c
@@ -90,6 +90,24 @@ static struct tb_switch *alloc_switch(struct kunit *test, u64 route,
 	return sw;
 }
 
+/*
+ * Allocates a domain for the host router. The routers of the domain need
+ * to be able to reach the host router as some of the parameters, such as
+ * the buffer allocation, are read from it.
+ */
+static int alloc_domain(struct kunit *test, struct tb_switch *host)
+{
+	struct tb *tb;
+
+	tb = kunit_kzalloc(test, sizeof(*tb), GFP_KERNEL);
+	if (!tb)
+		return -ENOMEM;
+
+	tb->root_switch = host;
+	host->tb = tb;
+	return 0;
+}
+
 static struct tb_switch *alloc_host(struct kunit *test)
 {
 	struct tb_switch *sw;
@@ -98,6 +116,9 @@ static struct tb_switch *alloc_host(struct kunit *test)
 	if (!sw)
 		return NULL;
 
+	if (alloc_domain(test, sw))
+		return NULL;
+
 	sw->config.vendor_id = 0x8086;
 	sw->config.device_id = 0x9a1b;
 
@@ -333,6 +354,8 @@ static struct tb_switch *alloc_dev_default(struct kunit *test,
 	if (!parent)
 		return sw;
 
+	sw->tb = parent->tb;
+
 	/* Link them */
 	upstream_port = tb_upstream_port(sw);
 	port = tb_port_at(route, parent);
-- 
2.50.1

