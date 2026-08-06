Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F6B4734E8
	for <linux-usb@vger.kernel.org>; Thu,  6 Aug 2026 14:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786026111; cv=none; b=VXrCFs70tXLwT+04hyieFUqiM/TkPR5gc0p27yoEbvMoyEG2ASodgUK5Mjidc5NQbrTboWP8FkepRTJeBcqglTBqd4GFRIRWjEHdUQRw578Qtx0+V2jG+4IJznMF8kKuLIOTWzmMZRZpFgq/usohvDH6j2raMKXfLz8fPhRJZj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786026111; c=relaxed/simple;
	bh=o+dNDe+wC6iiPmXo1D9bZrjho7Ear0/l9Cn3rQfsw/0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t3g+M75fVi81Z3/52uT0LwsLKVoMuVMKUnYFziEV/86or53SsusQGwr8Qrp+JfQAo54NkLg4iQm+oEfkC3ckW4ulEeluiaN9QmrYVISBZIN5jacA9Kflu5AiyeTCCwxzLb/S1fXL36hihzk8CMRkYo72Rcx56JXbOigPZgUsTWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CO+7PvCQ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CO+7PvCQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786026109; x=1817562109;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=o+dNDe+wC6iiPmXo1D9bZrjho7Ear0/l9Cn3rQfsw/0=;
  b=CO+7PvCQc4oAql7cVhf3OXUbjzu6i0/fk0FFyF7/mf4tJIhB8QhnNDLK
   7M0mq2iP8HJICIpDkZlYJ1hd9bBgVbIwMjcqP1G4j8FBV09ktezCYTxTv
   WMuL5C4zXjydfjCEI6HXBGA1kNo4+Vyib0OfJNsiO+IOVNp9vO6bmitAM
   9k1nwXv2+saqJwUEgeJcjGggv5dWBbtKx6bIhDBJ4xJMc67lWFNVPxfbH
   ywu1gkv0yKs0zucg9A0HJmkWgkz/cwwfGXZ0Z+hlTTpnhyzeniB/+WbU9
   OV8Y0dSKLezAJJUHzp1JTHS0YfK/5eWga1ZSQa5YQ7TBppRF+luxB/p39
   g==;
X-CSE-ConnectionGUID: QJDvC9xQRrqiK2IUJf4weg==
X-CSE-MsgGUID: bn2C1zOURIix0RuxkEhEAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="97268198"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="97268198"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 07:21:49 -0700
X-CSE-ConnectionGUID: MPFl+oUISTe1Wlf9/99H0Q==
X-CSE-MsgGUID: NbZW/PXuSzmFfK8pD05P4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="285500516"
Received: from amilburn-desk.amilburn-desk (HELO mnyman-desk.home) ([10.245.244.235])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 07:21:48 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 14/17] usb: xhci: remove redundant 'xhci' pointer from endpoint struct
Date: Thu,  6 Aug 2026 17:21:10 +0300
Message-ID: <20260806142113.2436238-15-mathias.nyman@linux.intel.com>
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

From: Niklas Neronin <niklas.neronin@linux.intel.com>

The 'xhci_virt_ep' struct currently contains a pointer to its parent
'xhci_hcd' struct. Since all endpoint-related structs are contained
within 'xhci_hcd', this pointer is redundant.

Remove the 'xhci' pointer from 'xhci_virt_ep' and instead pass it
explicitly to functions that require it, as some already do it.
This change reduces unnecessary complexity and aligns the code with
the rest of the xhci driver.

Memory impact:
For each device connected a struct 'xhci_virt_device' is allocated,
this struct conatains a 31 slot array of struct 'xhci_virt_ep'.
A USB hub consumes 1 slot, but every downstream device consumes
another slot.
This means that the total memory saved buy this patch is:
  Devices * 31 * 8 bytes

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c  |  1 -
 drivers/usb/host/xhci-ring.c | 53 +++++++++++++++++-------------------
 drivers/usb/host/xhci.c      |  2 +-
 drivers/usb/host/xhci.h      |  3 +-
 4 files changed, 27 insertions(+), 32 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 5717bd830189..cc916ee3cb71 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1002,7 +1002,6 @@ int xhci_alloc_virt_device(struct xhci_hcd *xhci, int slot_id,
 	for (i = 0; i < 31; i++) {
 		dev->eps[i].ep_index = i;
 		dev->eps[i].vdev = dev;
-		dev->eps[i].xhci = xhci;
 		INIT_LIST_HEAD(&dev->eps[i].cancelled_td_list);
 		INIT_LIST_HEAD(&dev->eps[i].bw_endpoint_list);
 	}
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 21ef7284e957..6e60959e3faa 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -916,7 +916,7 @@ static void xhci_dequeue_td(struct xhci_hcd *xhci, struct xhci_td *td, struct xh
 }
 
 /* Complete the cancelled URBs we unlinked from td_list. */
-static void xhci_giveback_invalidated_tds(struct xhci_virt_ep *ep)
+static void xhci_giveback_invalidated_tds(struct xhci_hcd *xhci, struct xhci_virt_ep *ep)
 {
 	struct xhci_ring *ring;
 	struct xhci_td *td, *tmp_td;
@@ -924,17 +924,17 @@ static void xhci_giveback_invalidated_tds(struct xhci_virt_ep *ep)
 	list_for_each_entry_safe(td, tmp_td, &ep->cancelled_td_list,
 				 cancelled_td_list) {
 
-		ring = xhci_urb_to_transfer_ring(ep->xhci, td->urb);
+		ring = xhci_urb_to_transfer_ring(xhci, td->urb);
 
 		if (td->cancel_status == TD_CLEARED) {
-			xhci_dbg(ep->xhci, "%s: Giveback cancelled URB %p TD\n",
+			xhci_dbg(xhci, "%s: Giveback cancelled URB %p TD\n",
 				 __func__, td->urb);
-			xhci_td_cleanup(ep->xhci, td, ring, td->status);
+			xhci_td_cleanup(xhci, td, ring, td->status);
 		} else {
-			xhci_dbg(ep->xhci, "%s: Keep cancelled URB %p TD as cancel_status is %d\n",
+			xhci_dbg(xhci, "%s: Keep cancelled URB %p TD as cancel_status is %d\n",
 				 __func__, td->urb, td->cancel_status);
 		}
-		if (ep->xhci->xhc_state & XHCI_STATE_DYING)
+		if (xhci->xhc_state & XHCI_STATE_DYING)
 			return;
 	}
 }
@@ -1017,9 +1017,8 @@ static int xhci_handle_halted_endpoint(struct xhci_hcd *xhci,
  * only call this when ring is not in a running state
  */
 
-static int xhci_invalidate_cancelled_tds(struct xhci_virt_ep *ep)
+static int xhci_invalidate_cancelled_tds(struct xhci_hcd *xhci, struct xhci_virt_ep *ep)
 {
-	struct xhci_hcd		*xhci;
 	struct xhci_td		*td = NULL;
 	struct xhci_td		*tmp_td = NULL;
 	struct xhci_td		*cached_td = NULL;
@@ -1034,8 +1033,6 @@ static int xhci_invalidate_cancelled_tds(struct xhci_virt_ep *ep)
 	if (ep->ep_state & SET_DEQ_PENDING)
 		return 0;
 
-	xhci = ep->xhci;
-
 	list_for_each_entry_safe(td, tmp_td, &ep->cancelled_td_list, cancelled_td_list) {
 		xhci_dbg_trace(xhci, trace_xhci_dbg_cancel_urb,
 			       "Removing canceled TD starting at 0x%llx (dma) in stream %u URB %p",
@@ -1136,23 +1133,23 @@ static int xhci_invalidate_cancelled_tds(struct xhci_virt_ep *ep)
  *
  * Call under xhci->lock on a stopped endpoint.
  */
-void xhci_process_cancelled_tds(struct xhci_virt_ep *ep)
+void xhci_process_cancelled_tds(struct xhci_hcd *xhci, struct xhci_virt_ep *ep)
 {
-	xhci_invalidate_cancelled_tds(ep);
-	xhci_giveback_invalidated_tds(ep);
+	xhci_invalidate_cancelled_tds(xhci, ep);
+	xhci_giveback_invalidated_tds(xhci, ep);
 }
 
 /*
  * Returns the TD the endpoint ring halted on.
  * Only call for non-running rings without streams.
  */
-static struct xhci_td *find_halted_td(struct xhci_virt_ep *ep)
+static struct xhci_td *find_halted_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep)
 {
 	struct xhci_td	*td;
 	u64		hw_deq;
 
 	if (!list_empty(&ep->ring->td_list)) { /* Not streams compatible */
-		hw_deq = xhci_get_hw_deq(ep->xhci, ep->vdev, ep->ep_index, 0);
+		hw_deq = xhci_get_hw_deq(xhci, ep->vdev, ep->ep_index, 0);
 		hw_deq &= TR_DEQ_PTR_MASK;
 		td = list_first_entry(&ep->ring->td_list, struct xhci_td, td_list);
 		if (trb_in_td(td, hw_deq))
@@ -1227,7 +1224,7 @@ static void xhci_handle_cmd_stop_ep(struct xhci_hcd *xhci, int slot_id,
 				reset_type = EP_SOFT_RESET;
 			} else {
 				reset_type = EP_HARD_RESET;
-				td = find_halted_td(ep);
+				td = find_halted_td(xhci, ep);
 				if (td)
 					td->status = -EPROTO;
 			}
@@ -1290,11 +1287,11 @@ static void xhci_handle_cmd_stop_ep(struct xhci_hcd *xhci, int slot_id,
 		ep->ep_state |= EP_DROP_PENDING;
 
 	/* will queue a set TR deq if stopped on a cancelled, uncleared TD */
-	xhci_invalidate_cancelled_tds(ep);
+	xhci_invalidate_cancelled_tds(xhci, ep);
 	ep->ep_state &= ~EP_STOP_CMD_PENDING;
 
 	/* Otherwise ring the doorbell(s) to restart queued transfers */
-	xhci_giveback_invalidated_tds(ep);
+	xhci_giveback_invalidated_tds(xhci, ep);
 	xhci_ring_doorbell_for_active_rings(xhci, slot_id, ep_index);
 }
 
@@ -1516,14 +1513,14 @@ static void xhci_handle_cmd_set_deq(struct xhci_hcd *xhci, int slot_id,
 	/* HW cached TDs cleared from cache, give them back */
 	list_for_each_entry_safe(td, tmp_td, &ep->cancelled_td_list,
 				 cancelled_td_list) {
-		ep_ring = xhci_urb_to_transfer_ring(ep->xhci, td->urb);
+		ep_ring = xhci_urb_to_transfer_ring(xhci, td->urb);
 		if (td->cancel_status == TD_CLEARING_CACHE) {
 			td->cancel_status = TD_CLEARED;
-			xhci_dbg(ep->xhci, "%s: Giveback cancelled URB %p TD\n",
+			xhci_dbg(xhci, "%s: Giveback cancelled URB %p TD\n",
 				 __func__, td->urb);
-			xhci_td_cleanup(ep->xhci, td, ep_ring, td->status);
+			xhci_td_cleanup(xhci, td, ep_ring, td->status);
 		} else {
-			xhci_dbg(ep->xhci, "%s: Keep cancelled URB %p TD as cancel_status is %d\n",
+			xhci_dbg(xhci, "%s: Keep cancelled URB %p TD as cancel_status is %d\n",
 				 __func__, td->urb, td->cancel_status);
 		}
 	}
@@ -1534,16 +1531,16 @@ static void xhci_handle_cmd_set_deq(struct xhci_hcd *xhci, int slot_id,
 
 	/* Check for deferred or newly cancelled TDs */
 	if (!list_empty(&ep->cancelled_td_list)) {
-		xhci_dbg(ep->xhci, "%s: Pending TDs to clear, continuing with invalidation\n",
+		xhci_dbg(xhci, "%s: Pending TDs to clear, continuing with invalidation\n",
 			 __func__);
-		xhci_invalidate_cancelled_tds(ep);
+		xhci_invalidate_cancelled_tds(xhci, ep);
 		/* Try to restart the endpoint if all is done */
 		xhci_ring_doorbell_for_active_rings(xhci, slot_id, ep_index);
 		/* Start giving back any TDs invalidated above */
-		xhci_giveback_invalidated_tds(ep);
+		xhci_giveback_invalidated_tds(xhci, ep);
 	} else {
 		/* Restart any rings with pending URBs */
-		xhci_dbg(ep->xhci, "%s: All TDs cleared, ring doorbell\n", __func__);
+		xhci_dbg(xhci, "%s: All TDs cleared, ring doorbell\n", __func__);
 		xhci_ring_doorbell_for_active_rings(xhci, slot_id, ep_index);
 	}
 }
@@ -1570,12 +1567,12 @@ static void xhci_handle_cmd_reset_ep(struct xhci_hcd *xhci, int slot_id,
 		"Ignoring reset ep completion code of %u", cmd_comp_code);
 
 	/* Cleanup cancelled TDs as ep is stopped. May queue a Set TR Deq cmd */
-	xhci_invalidate_cancelled_tds(ep);
+	xhci_invalidate_cancelled_tds(xhci, ep);
 
 	/* Clear our internal halted state */
 	ep->ep_state &= ~EP_HALTED;
 
-	xhci_giveback_invalidated_tds(ep);
+	xhci_giveback_invalidated_tds(xhci, ep);
 
 	/* if this was a soft reset, then restart */
 	if ((le32_to_cpu(trb->generic.field[3])) & TRB_TSP)
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 174fea16cd50..a9e47e178c28 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1857,7 +1857,7 @@ static int xhci_urb_dequeue(struct usb_hcd *hcd, struct urb *urb, int status)
 		/* and cancelled TDs can be given back right away */
 		xhci_dbg(xhci, "Invalidating TDs instantly on slot %d ep %d in state 0x%x\n",
 				urb->dev->slot_id, ep_index, ep->ep_state);
-		xhci_process_cancelled_tds(ep);
+		xhci_process_cancelled_tds(xhci, ep);
 	} else {
 		/* Otherwise, queue a new Stop Endpoint command */
 		command = xhci_alloc_command(xhci, false, GFP_ATOMIC);
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 670533dc1d97..66235f755f34 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -685,7 +685,6 @@ struct xhci_virt_ep {
 #define EP_DROP_PENDING		BIT(9) /* port disconnect or link error, don't restart */
 	/* ----  Related to URB cancellation ---- */
 	struct list_head	cancelled_td_list;
-	struct xhci_hcd		*xhci;
 	/* Dequeue pointer and dequeue segment for a submitted Set TR Dequeue
 	 * command.  We'll need to update the ring's dequeue segment and dequeue
 	 * pointer after the command completes.
@@ -1961,7 +1960,7 @@ unsigned int count_trbs(u64 addr, u64 len);
 unsigned int xhci_num_trbs_free(struct xhci_ring *ring);
 int xhci_stop_endpoint_sync(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 			    int suspend, gfp_t gfp_flags);
-void xhci_process_cancelled_tds(struct xhci_virt_ep *ep);
+void xhci_process_cancelled_tds(struct xhci_hcd *xhci, struct xhci_virt_ep *ep);
 void xhci_update_erst_dequeue(struct xhci_hcd *xhci,
 			      struct xhci_interrupter *ir,
 			      bool clear_ehb);
-- 
2.43.0

