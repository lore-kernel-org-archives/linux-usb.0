Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CF637EFE3
	for <linux-usb@vger.kernel.org>; Wed,  3 Jun 2026 09:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780477915; cv=none; b=uJSOYRTnbyjpl9y6AY21BLliV23vyTEJ0arGoUlVvEIWOLk3ZbUjYWAiyYN3UxEg8hqRGmmQ94cVGFD1LzN4Cai3n6cL/U/wIGm1zD8HqprAEwGbE8uX2dANvStvy6F7fewWPmlDEW77SuB1Z7O+S0UKr78izxJl4wSMCm1ndDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780477915; c=relaxed/simple;
	bh=t2yXxZEUbU3XCW7+OOu7KuBQl3juVXxjk4luTd4MTIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tRq/PnGCVohOborniAuMIl4YPH4LXjwFDRS+LfHfWS7C2rS3975edV19GKErGjh4joTxShckPoaep/g3rqkmNm5yCK/ETJukm8fw/cVr9gPLdeXtdlsXKbtIBjrI70mm7dQU+wXj7620I95gu9I37gkvygVqbCuOIJJAABZ4pVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cwW5QSVc; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cwW5QSVc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780477913; x=1812013913;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=t2yXxZEUbU3XCW7+OOu7KuBQl3juVXxjk4luTd4MTIE=;
  b=cwW5QSVcYY4oyUIzm7BDCjBF9Nzu9aXVS8jnu4RiuFPZd4Tw5mcDDd4t
   HcvEIlSxpoDU4bVCXRHR9jzlBQWyHBFIC4o44A9XJsXc62MpcSo68EDu0
   GacXq8kYDfEpE24JxUgziNEKyPXGJrtoRxiiQMspdpoWh5AtyzIeqomNq
   0q1bLbVQAHEpxQMv31lFqSNZLvKR2Uloug5eJuoYEWLyua1A6ktpw67Rt
   +3KhlteRlD/8WoJzfVSzn7vC9GV18OcRzSWBNF8l9kMVRGc8BjFf93gGm
   esriEn3XH8xAc3cv9VmRThW/49444m8PmG5ycaZ4JpTr51JEeXjMXQYZw
   Q==;
X-CSE-ConnectionGUID: wSLdaQEdTDCAy9YoI8YHYg==
X-CSE-MsgGUID: bsK81DenRUuNVm9EtETWzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="92657524"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="92657524"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 02:11:53 -0700
X-CSE-ConnectionGUID: LL0MWrD2RoqJYZOZnAo0SQ==
X-CSE-MsgGUID: Pu13xBWxR5qiOvhYTk9K+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="244281792"
Received: from slindbla-desk.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.244.174])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 02:11:52 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 02/15] usb: xhci: remove legacy 'num_trbs_free' tracking
Date: Wed,  3 Jun 2026 12:11:19 +0300
Message-ID: <20260603091132.1110849-3-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603091132.1110849-1-mathias.nyman@linux.intel.com>
References: <20260603091132.1110849-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Niklas Neronin <niklas.neronin@linux.intel.com>

Keeping track of free TRBs in a ring by adding and subtracting each time
a enqueue or dequeue pointer is modified has proven to be buggy and
complicated, especially over long periods of time.
The xhci driver has already moved to calculating free TRBs dynamically
based on ring size and the enqueue/dequeue positions.

The DbC path is the last user of 'num_trbs_free'. Rather than maintaining
two separate accounting mechanisms, remove the field entirely and switch
DbC to use xhci_num_trbs_free(). Since 'num_trbs_free' undercounts by one,
and xhci_num_trbs_free() does not, the check for sufficient free TRBs is
adjusted.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-dbgcap.c | 5 +----
 drivers/usb/host/xhci-mem.c    | 6 ------
 drivers/usb/host/xhci-ring.c   | 2 +-
 drivers/usb/host/xhci.h        | 2 +-
 4 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index 7e6f7d72f03e..6a9f73fecb73 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -275,7 +275,6 @@ xhci_dbc_queue_trb(struct xhci_ring *ring, u32 field1,
 	trace_xhci_dbc_gadget_ep_queue(ring, &trb->generic,
 				       xhci_trb_virt_to_dma(ring->enq_seg,
 							    ring->enqueue));
-	ring->num_trbs_free--;
 	next = ++(ring->enqueue);
 	if (TRB_TYPE_LINK_LE32(next->link.control)) {
 		next->link.control ^= cpu_to_le32(TRB_CYCLE);
@@ -296,7 +295,7 @@ static int xhci_dbc_queue_bulk_tx(struct dbc_ep *dep,
 
 	num_trbs = count_trbs(req->dma, req->length);
 	WARN_ON(num_trbs != 1);
-	if (ring->num_trbs_free < num_trbs)
+	if (xhci_num_trbs_free(ring) <= num_trbs)
 		return -EBUSY;
 
 	addr	= req->dma;
@@ -796,7 +795,6 @@ static void dbc_handle_xfer_event(struct xhci_dbc *dbc, union xhci_trb *event)
 		}
 		if (r->status == -COMP_STALL_ERROR) {
 			dev_warn(dbc->dev, "Give back stale stalled req\n");
-			ring->num_trbs_free++;
 			xhci_dbc_giveback(r, 0);
 		}
 	}
@@ -861,7 +859,6 @@ static void dbc_handle_xfer_event(struct xhci_dbc *dbc, union xhci_trb *event)
 		break;
 	}
 
-	ring->num_trbs_free++;
 	req->actual = req->length - remain_length;
 	xhci_dbc_giveback(req, status);
 }
diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 997fe90f54e5..289461c06bf9 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -324,12 +324,6 @@ void xhci_initialize_ring_info(struct xhci_ring *ring)
 	 * handling ring expansion, set the cycle state equal to the old ring.
 	 */
 	ring->cycle_state = 1;
-
-	/*
-	 * Each segment has a link TRB, and leave an extra TRB for SW
-	 * accounting purpose
-	 */
-	ring->num_trbs_free = ring->num_segs * (TRBS_PER_SEGMENT - 1) - 1;
 }
 EXPORT_SYMBOL_GPL(xhci_initialize_ring_info);
 
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index e47e644b296e..f62db238276d 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -340,7 +340,7 @@ static bool trb_in_td(struct xhci_td *td, dma_addr_t suspect_dma)
  * Only for transfer and command rings where driver is the producer, not for
  * event rings.
  */
-static unsigned int xhci_num_trbs_free(struct xhci_ring *ring)
+unsigned int xhci_num_trbs_free(struct xhci_ring *ring)
 {
 	struct xhci_segment *enq_seg = ring->enq_seg;
 	union xhci_trb *enq = ring->enqueue;
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index aeecd301f207..e73c498449e8 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1376,7 +1376,6 @@ struct xhci_ring {
 	u32			cycle_state;
 	unsigned int		stream_id;
 	unsigned int		num_segs;
-	unsigned int		num_trbs_free; /* used only by xhci DbC */
 	unsigned int		bounce_buf_len;
 	enum xhci_ring_type	type;
 	u32			old_trb_comp_code;
@@ -1955,6 +1954,7 @@ void xhci_ring_doorbell_for_active_rings(struct xhci_hcd *xhci,
 void xhci_cleanup_command_queue(struct xhci_hcd *xhci);
 void inc_deq(struct xhci_hcd *xhci, struct xhci_ring *ring);
 unsigned int count_trbs(u64 addr, u64 len);
+unsigned int xhci_num_trbs_free(struct xhci_ring *ring);
 int xhci_stop_endpoint_sync(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 			    int suspend, gfp_t gfp_flags);
 void xhci_process_cancelled_tds(struct xhci_virt_ep *ep);
-- 
2.43.0

