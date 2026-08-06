Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329D5471CF6
	for <linux-usb@vger.kernel.org>; Thu,  6 Aug 2026 14:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786026104; cv=none; b=bYHR+jFZg8v68xhd5SJva2MleNxlsMABiGIhXR8p4griTQVq6UhWNDxlsGvzdf/H3JAPUXvDiiqfA++4YvE1Bu9kzyoGoKFqXBaS4O9Eb/kQdZGXqtseQj1CNeBLgHENgaKZOKtcSmoZ1x7Jay4oV2styW+njYyZThelS5Fne2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786026104; c=relaxed/simple;
	bh=BRrIf9wxlg1whLE1l/4OI4dS4leOTkX4kBjxbKreswE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mq2x+zUUg9pXIxJ6ANkOZ8Q6tFO5Mh67+5ps5/BJxvhLADZeThpdbkKacdiV/aOZlnp3PsnwKTKTJ0B66XI5aOOXDJm2/+Si7+dbFaOJqC5wwX10YRnTj/aWZrtvEGcnjXGmw6EywPMwS3p9Y4NblmswDfFAmlEv0jo48vLYSlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X/YHBE4D; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X/YHBE4D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786026101; x=1817562101;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BRrIf9wxlg1whLE1l/4OI4dS4leOTkX4kBjxbKreswE=;
  b=X/YHBE4DUXFqXJ5weODF20TyCZWZN6sfrpW/KMuDay3OT1g+Rf/tZunD
   VyzW67pqXsu9XRPjL7rUFO0TxyhC3SwkSxd2na2WpPXAvFNOlldNXF7LB
   CZyCgVFlgBsYn0n+lSxcQsje1rnBj+25uVziHq+VDnJbU6GCSD0JWOn8j
   3ZQDwVlWrPLHadWHiZVY7ntCB+NKQ5mmwnqRk5ORRuYIO2Lre0aZmtX9K
   R6Z/T/AGTPzbSilRh9Et49uBOzKr0y973ta7i2RLou3rMwkBol/pvVaoE
   7IGdnzwH2+6q5+02NKtKaBduzQ/NrmeWg/hLukw7MyMUaPQzIn86g5Qht
   A==;
X-CSE-ConnectionGUID: TCBKKnAKTdmLNO3RzIRFiQ==
X-CSE-MsgGUID: oq+CcqNrTLa6ftZKf2AicA==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="97268155"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="97268155"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 07:21:36 -0700
X-CSE-ConnectionGUID: CbTDIr5OQxmsOEzZvvcGzg==
X-CSE-MsgGUID: FOnEc/xHRuK7IUH/T3MhAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="285500402"
Received: from amilburn-desk.amilburn-desk (HELO mnyman-desk.home) ([10.245.244.235])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 07:21:35 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 06/17] xhci: move dequeue to next valid td instead of past cancelled one
Date: Thu,  6 Aug 2026 17:21:02 +0300
Message-ID: <20260806142113.2436238-7-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806142113.2436238-1-mathias.nyman@linux.intel.com>
References: <20260806142113.2436238-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If a ring stops on a TD that is about to be cancelled then the xHC ring
hardware dequeue pointer needs to move past the TD to flush TRBs from
xHC cache.

The TRB after the cancelled TD might be a no-op TRB, or a link TRB.
Moving the dequeue to a link TRB has caused isses on some hosts, and
moving it to a no-op TRB can be an issue for control endpoints as
xhci specification 4.8.3 'Endpoint Context State" states that
The Default Control Endpoint shall return to the Running state when the
Doorbell is rung for the next Setup Stage TD sent to the endpoint.

Solve this by always moving the dequeue pointer to the next valid
TD. If ring is empty and there are no queued TDs then move the dequeue
pointer to the enqueue pointer.
If enqueue points to a link TRB on a empty ring then propagate enqueue
to next segment before pointing dequeue to it.

Note that this patch ended up almost identical to a simplifiaction patch
done earlier by Michal Pecio, see link. That patch was not added due to a
potential, somewhat theoretical issue of moving dequeue backwards.
Turns out improving cancelled control transfers end up with the same code,
and is now worth taking.
Code is very likely subconsciously based the patch by Michal Pecio.

Link: https://lore.kernel.org/linux-usb/20250225125939.7a248e38@foxbook/
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 140 ++++++++++++++++-------------------
 1 file changed, 63 insertions(+), 77 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 51008bad16cd..c868bf4deaef 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -686,112 +686,100 @@ static u64 xhci_get_hw_deq(struct xhci_hcd *xhci, struct xhci_virt_device *vdev,
 	return le64_to_cpu(ep_ctx->deq);
 }
 
-static int xhci_move_dequeue_past_td(struct xhci_hcd *xhci,
-				unsigned int slot_id, unsigned int ep_index,
-				unsigned int stream_id, struct xhci_td *td)
+/*
+ * Move the endpoint dequeue pointer to the next queued TD on ring->td_list or
+ * to enqueue if no TDs are queued (empty ring)
+ * All cancelled TDs on ring->td_list should be moved to ep->cancelled_td_list
+ * before calling this function
+ */
+static int xhci_move_deq_to_next_td(struct xhci_hcd *xhci,
+				    struct xhci_virt_ep *ep,
+				    unsigned int stream_id)
 {
-	struct xhci_virt_device *dev = xhci->devs[slot_id];
-	struct xhci_virt_ep *ep = &dev->eps[ep_index];
-	struct xhci_ring *ep_ring;
 	struct xhci_command *cmd;
-	struct xhci_segment *new_seg;
-	union xhci_trb *new_deq;
-	int new_cycle;
+	struct xhci_ring *ring;
+	struct xhci_td *td;
 	dma_addr_t addr;
-	u64 hw_dequeue;
-	bool hw_dequeue_found = false;
-	bool td_last_trb_found = false;
+	int new_cycle;
 	u32 trb_sct = 0;
-	int ret;
+	int ret = 0;
 
-	ep_ring = xhci_triad_to_transfer_ring(xhci, slot_id,
-			ep_index, stream_id);
-	if (!ep_ring) {
+	ring = xhci_virt_ep_to_ring(xhci, ep, stream_id);
+	if (!ring) {
 		xhci_warn(xhci, "WARN can't find new dequeue, invalid stream ID %u\n",
 			  stream_id);
 		return -ENODEV;
 	}
 
-	hw_dequeue = xhci_get_hw_deq(xhci, dev, ep_index, stream_id) & TR_DEQ_PTR_MASK;
-	new_seg = ep_ring->deq_seg;
-	new_deq = ep_ring->dequeue;
-	new_cycle = le32_to_cpu(td->end_trb->generic.field[3]) & TRB_CYCLE;
-
-	/*
-	 * Walk the ring until both the next TRB and hw_dequeue are found (don't
-	 * move hw_dequeue back if it went forward due to a HW bug). Cycle state
-	 * is loaded from a known good TRB, track later toggles to maintain it.
-	 */
-	do {
-		if (!hw_dequeue_found && xhci_trb_virt_to_dma(new_seg, new_deq)
-		    == (dma_addr_t)hw_dequeue) {
-			hw_dequeue_found = true;
-			if (td_last_trb_found)
-				break;
-		}
-		if (new_deq == td->end_trb)
-			td_last_trb_found = true;
-
-		if (td_last_trb_found && trb_is_link(new_deq) &&
-		    link_trb_toggles_cycle(new_deq))
-			new_cycle ^= 0x1;
-
-		next_trb(&new_seg, &new_deq);
-
-		/* Search wrapped around, bail out */
-		if (new_deq == ep->ring->dequeue) {
-			xhci_err(xhci, "Error: Failed finding new dequeue state\n");
-			return -EINVAL;
-		}
-
-	} while (!hw_dequeue_found || !td_last_trb_found);
-
-	/* Don't update the ring cycle state for the producer (us). */
-	addr = xhci_trb_virt_to_dma(new_seg, new_deq);
-	if (addr == 0) {
-		xhci_warn(xhci, "Can't find dma of new dequeue ptr\n");
-		xhci_warn(xhci, "deq seg = %p, deq ptr = %p\n", new_seg, new_deq);
-		return -EINVAL;
-	}
-
 	if ((ep->ep_state & SET_DEQ_PENDING)) {
-		xhci_warn(xhci, "Set TR Deq already pending, don't submit for %pad\n",
-			  &addr);
+		xhci_warn(xhci, "Set TR Deq already pending\n");
 		return -EBUSY;
 	}
 
 	/* This function gets called from contexts where it cannot sleep */
 	cmd = xhci_alloc_command(xhci, false, GFP_ATOMIC);
 	if (!cmd) {
-		xhci_warn(xhci, "Can't alloc Set TR Deq cmd %pad\n", &addr);
+		xhci_warn(xhci, "Can't alloc Set TR Deq cmd\n");
 		return -ENOMEM;
 	}
 
+	/*
+	 * Move dequeue to the beginning of next td, or to enqueue if ring is
+	 * empty. Avoid moving dequeue to a link trb (empty ring) as it causes
+	 * issues on some hosts. In that case advance the enqueue to next segment
+	 * before moving dequeue to it
+	 */
+
+	if (list_empty(&ring->td_list)) {
+		if (trb_is_link(ring->enqueue))
+			inc_enq_past_link(xhci, ring, 0);
+		ep->queued_deq_seg = ring->enq_seg;
+		ep->queued_deq_ptr = ring->enqueue;
+		new_cycle = ring->cycle_state;
+	} else {
+		td = list_first_entry(&ring->td_list, struct xhci_td, td_list);
+		ep->queued_deq_seg = td->start_seg;
+		ep->queued_deq_ptr = td->start_trb;
+		new_cycle = le32_to_cpu(td->start_trb->generic.field[3]) & TRB_CYCLE;
+	}
+
+	addr = xhci_trb_virt_to_dma(ep->queued_deq_seg, ep->queued_deq_ptr);
+	if (addr == 0) {
+		xhci_warn(xhci, "Can't find new dequeue dma of seg %p, ptr %p\n",
+			  ep->queued_deq_seg, ep->queued_deq_ptr);
+		ret = -EINVAL;
+		goto err_out;
+	}
+
 	if (stream_id)
 		trb_sct = SCT_FOR_TRB(SCT_PRI_TR);
 	ret = queue_command(xhci, cmd,
 		lower_32_bits(addr) | trb_sct | new_cycle,
 		upper_32_bits(addr),
-		STREAM_ID_FOR_TRB(stream_id), SLOT_ID_FOR_TRB(slot_id) |
-		EP_INDEX_FOR_TRB(ep_index) | TRB_TYPE(TRB_SET_DEQ), false);
-	if (ret < 0) {
-		xhci_free_command(xhci, cmd);
-		return ret;
-	}
-	ep->queued_deq_seg = new_seg;
-	ep->queued_deq_ptr = new_deq;
+		STREAM_ID_FOR_TRB(stream_id), SLOT_ID_FOR_TRB(ep->vdev->slot_id) |
+		EP_INDEX_FOR_TRB(ep->ep_index) | TRB_TYPE(TRB_SET_DEQ), false);
+	if (ret < 0)
+		goto err_out;
 
 	xhci_dbg_trace(xhci, trace_xhci_dbg_cancel_urb,
 		       "Set TR Deq ptr 0x%llx, cycle %u\n", addr, new_cycle);
 
-	/* Stop the TD queueing code from ringing the doorbell until
-	 * this command completes.  The HC won't set the dequeue pointer
-	 * if the ring is running, and ringing the doorbell starts the
-	 * ring running.
+	/*
+	 * Stop the TD queueing code from ringing the doorbell until this
+	 * command completes. The HC won't set the dequeue pointer if the ring
+	 * is running, and ringing the doorbell starts the ring.
 	 */
 	ep->ep_state |= SET_DEQ_PENDING;
 	xhci_ring_cmd_db(xhci);
+
 	return 0;
+
+err_out:
+	xhci_free_command(xhci, cmd);
+	ep->queued_deq_seg = NULL;
+	ep->queued_deq_ptr = NULL;
+
+	return ret;
 }
 
 /* flip_cycle means flip the cycle bit of all but the first and last TRB.
@@ -1043,7 +1031,6 @@ static int xhci_invalidate_cancelled_tds(struct xhci_virt_ep *ep)
 	struct xhci_td		*cached_td = NULL;
 	struct xhci_ring	*ring;
 	u64			hw_deq;
-	unsigned int		slot_id = ep->vdev->slot_id;
 	int			err;
 
 	/*
@@ -1126,9 +1113,8 @@ static int xhci_invalidate_cancelled_tds(struct xhci_virt_ep *ep)
 	if (!cached_td)
 		return 0;
 
-	err = xhci_move_dequeue_past_td(xhci, slot_id, ep->ep_index,
-					cached_td->urb->stream_id,
-					cached_td);
+	err = xhci_move_deq_to_next_td(xhci, ep, cached_td->urb->stream_id);
+
 	if (err) {
 		/* Failed to move past cached td, just set cached TDs to no-op */
 		list_for_each_entry_safe(td, tmp_td, &ep->cancelled_td_list, cancelled_td_list) {
-- 
2.43.0

