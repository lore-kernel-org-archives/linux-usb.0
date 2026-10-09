Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810DD4A5C2F
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 09:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791539944; cv=none; b=dGSpGbD0qdi9eRqOuu5l/dU4MoT8ZVT6o3p2R73ILaXHo2C7yORijuXit8Uk7wmXX8G8eOxnO9uvAyGN5UwGiJQTYVWGhlOwioQDasdhSK1AT8Wp3qM74m5seD8hulsZjktv5pywtqxYAarjWhd8wZprEWn/M+ZLIYRoQ81z6GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791539944; c=relaxed/simple;
	bh=ig3m3YHufLWzs5vZIb1aCUAiAT6JzYle+G5EMLgIwvY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ET/7hWc/9kiBKwkmM1loHfK7O7VpRFRU2TC6PE4iBQe8P4NjzyMTYTy8yffUD3NaAMysQjSgXsiOkirlAGIxteye+nJ+A7hfqZNRX7cCB7GYHQlKu3JTJl3MTy/sbgMD9b+B+z2iYpf9hAAERo7cbZbWZY2WeITN32Rh3T9kP5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lXVT8boO; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lXVT8boO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791539944; x=1823075944;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ig3m3YHufLWzs5vZIb1aCUAiAT6JzYle+G5EMLgIwvY=;
  b=lXVT8boOiTdsDbK0vWKyBlJmsyB9b/WHPZIYaVb6yizHNBnZ94/Q6OQp
   LE7/DqQhf1/c3Hw1uK1UVyTUZFKr60ao8trmexiPqNAWb6jY/tqnK9p3Y
   W+tfOISDJRF/D25eWGrWO9JVP7MDUEkIGNwnXpwFS0Xf+zUX/3b8/kmmx
   e8iwofmTN9/bchKDFTxVLh5gl0pmjUaa39Amkmib8iiLYPZD0mse0wuvP
   zCQoM63dulpNLEzK5GFv0uMNiHO2qyloewETpqS3TWDdRzYvkKQ40toAY
   9MzRPoGM+CtXiJbfMhIJhZpzgCkaqnprS2L6uH2bjw/urU9Bv47J+JPPA
   A==;
X-CSE-ConnectionGUID: Y/LUW+4aRCWVil5bZVxQkQ==
X-CSE-MsgGUID: seAoO6MZShSGXzpyjvThVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="224116"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="224116"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 02:59:03 -0700
X-CSE-ConnectionGUID: +wrUl1yZSXmDZNEcibdyWg==
X-CSE-MsgGUID: fcZ7ufrtQKyBT0RDz3mHAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="613401"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.244.17])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 02:59:01 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
	Mathias Nyman <mathias.nyman@intel.com>
Subject: [PATCH 07/14] usb: xhci: sideband: fix ring sg table for sub-page TRB segments
Date: Fri,  9 Oct 2026 12:58:27 +0300
Message-ID: <20261009095834.561578-8-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009095834.561578-1-mathias.nyman@linux.intel.com>
References: <20261009095834.561578-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>

xhci_ring_to_sgtable() populated its sg_table via dma_get_sgtable()
per segment and sg_alloc_table_from_pages(), both of which only
operate at whole PAGE_SIZE granularity. Since TRB_SEGMENT_SIZE (4096)
can be smaller than PAGE_SIZE, multiple ring segments can share the
same physical page on larger-PAGE_SIZE kernels (16K/64K), which these
helpers cannot correctly represent.

Build the sg_table directly instead: allocate one sg entry per ring
segment with sg_alloc_table(), and fill each entry explicitly with
sg_set_page() using the segment's own page (resolved via
is_vmalloc_addr()/vmalloc_to_page() or virt_to_page()),
TRB_SEGMENT_SIZE as the length, and offset_in_page() for the exact
intra-page offset. This guarantees each segment gets its own sg
entry regardless of page sharing.

Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Signed-off-by: Mathias Nyman <mathias.nyman@intel.com>
---
 drivers/usb/host/xhci-sideband.c | 57 ++++++++++----------------------
 1 file changed, 18 insertions(+), 39 deletions(-)

diff --git a/drivers/usb/host/xhci-sideband.c b/drivers/usb/host/xhci-sideband.c
index a5deeee4d5dc..beb637407e47 100644
--- a/drivers/usb/host/xhci-sideband.c
+++ b/drivers/usb/host/xhci-sideband.c
@@ -9,57 +9,42 @@
  */
 
 #include <linux/usb/xhci-sideband.h>
-#include <linux/dma-direct.h>
 
 #include "xhci.h"
 
 /* sideband internal helpers */
 static struct sg_table *
-xhci_ring_to_sgtable(struct xhci_sideband *sb, struct xhci_ring *ring)
+xhci_ring_to_sgtable(struct xhci_ring *ring)
 {
 	struct xhci_segment *seg;
 	struct sg_table	*sgt;
-	unsigned int n_pages;
-	struct page **pages;
-	struct device *dev;
-	size_t sz;
+	struct page *page;
 	int i;
 
-	dev = xhci_to_hcd(sb->xhci)->self.sysdev;
-	sz = ring->num_segs * TRB_SEGMENT_SIZE;
-	n_pages = PAGE_ALIGN(sz) >> PAGE_SHIFT;
-	pages = kvmalloc_objs(struct page *, n_pages);
-	if (!pages)
+	seg = ring->first_seg;
+	if (!seg)
 		return NULL;
 
 	sgt = kzalloc_obj(*sgt);
-	if (!sgt) {
-		kvfree(pages);
+	if (!sgt)
+		return NULL;
+
+	if (sg_alloc_table(sgt, ring->num_segs, GFP_KERNEL)) {
+		kfree(sgt);
 		return NULL;
 	}
 
-	seg = ring->first_seg;
-	if (!seg)
-		goto err;
-	/*
-	 * Rings can potentially have multiple segments, create an array that
-	 * carries page references to allocated segments.  Utilize the
-	 * sg_alloc_table_from_pages() to create the sg table, and to ensure
-	 * that page links are created.
-	 */
 	for (i = 0; i < ring->num_segs; i++) {
-		dma_get_sgtable(dev, sgt, seg->trbs, seg->dma,
-				TRB_SEGMENT_SIZE);
-		pages[i] = sg_page(sgt->sgl);
-		sg_free_table(sgt);
+		if (is_vmalloc_addr(seg->trbs))
+			page = vmalloc_to_page(seg->trbs);
+		else
+			page = virt_to_page(seg->trbs);
+
+		sg_set_page(&sgt->sgl[i], page, TRB_SEGMENT_SIZE,
+			    offset_in_page(seg->trbs));
 		seg = seg->next;
 	}
 
-	if (sg_alloc_table_from_pages(sgt, pages, n_pages, 0, sz, GFP_KERNEL))
-		goto err;
-
-	kvfree(pages);
-
 	/*
 	 * Save first segment dma address to sg dma_address field for the sideband
 	 * client to have access to the IOVA of the ring.
@@ -67,12 +52,6 @@ xhci_ring_to_sgtable(struct xhci_sideband *sb, struct xhci_ring *ring)
 	sg_dma_address(sgt->sgl) = ring->first_seg->dma;
 
 	return sgt;
-
-err:
-	kvfree(pages);
-	kfree(sgt);
-
-	return NULL;
 }
 
 /* Caller must hold sb->mutex */
@@ -254,7 +233,7 @@ xhci_sideband_get_endpoint_buffer(struct xhci_sideband *sb,
 	if (!ep || !ep->ring || !ep->sideband || ep->sideband != sb)
 		return NULL;
 
-	return xhci_ring_to_sgtable(sb, ep->ring);
+	return xhci_ring_to_sgtable(ep->ring);
 }
 EXPORT_SYMBOL_GPL(xhci_sideband_get_endpoint_buffer);
 
@@ -276,7 +255,7 @@ xhci_sideband_get_event_buffer(struct xhci_sideband *sb)
 	if (!sb || !sb->ir)
 		return NULL;
 
-	return xhci_ring_to_sgtable(sb, sb->ir->event_ring);
+	return xhci_ring_to_sgtable(sb->ir->event_ring);
 }
 EXPORT_SYMBOL_GPL(xhci_sideband_get_event_buffer);
 
-- 
2.43.0

