Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C9649B5C3
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 15:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791559009; cv=none; b=t/+yHkrjTNKrf3ctbN2vbmWdprqx+Y0DRP7YVDoEPLcCJY7PW09HtiJRG23f3ATyp8MacldQW7oVBHNTB1yBjjufx40ZxvrQxfh+4YDgaf78mr3n4xpqPkQfs0vp7l22jIK1x1Br44jQIJDP5b7yOqHegb63aYLH/pAdbKEsI4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791559009; c=relaxed/simple;
	bh=85KxcdPwrie9sxv82hI9q4BULhuY/4LESDXqsXzuPqI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dBKkmfDzTAyCB13WV1A4FCnYrOBaRgsv8wzrdWUQwvf+sHA9wJAyN7kLDpeRMjjOY84+V/xO+lmIqDotZpU91Nuk6a2P2YZYpaSfvy3RUxALwkH2FZf8uAa4p4cLILIFZ95Uf7Dxb2Zk5PJuFsrm+yV1uBa6LhAfJVVu3c75zT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ODFabQFZ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ODFabQFZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791559008; x=1823095008;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=85KxcdPwrie9sxv82hI9q4BULhuY/4LESDXqsXzuPqI=;
  b=ODFabQFZ51eKJ3Ei1WFy3LnII3USj7We/dNtxaYoXRaZZ7jiNlPKVXqV
   atjjkSFa04H4tZRls0OEoCCL3qWXdGTcQ3XdDVIqAKC/2xKZvKKWD8Uim
   V33JU4tnrYrD7BH2TdueelC+6Nj3ockqfNBHfYc3eEkcd+ixWkMWFZ7SX
   uwrmWQJAE1HtQdB6W6CqlqJeY7NvkGK8GZY8ea+vT2JhnW6je87Hba178
   zscB8mFKic1NXMjGZqitH53krN3jouhOd+oII4KvpHQaWcR3BntmDa5Ul
   x/mLqltqg140KQ4d276CUkCFPiQYicu8x4lDpA+VFMNwoFVSksD/14NkJ
   Q==;
X-CSE-ConnectionGUID: rXss5gVsRpK/lDecyH6FhQ==
X-CSE-MsgGUID: nI5GSWhYSo+7lXcV1LU3HQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="351709"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="351709"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 08:16:47 -0700
X-CSE-ConnectionGUID: sBI9BGVnQa+Kc0RmM7RR0A==
X-CSE-MsgGUID: EyhktKo4S6aZjSQdU46T3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="650072"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.244.17])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 08:16:46 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Michal Pecio <michal.pecio@gmail.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH v2 09/11] usb: xhci: Rework and improve the TD matching and skipping logic
Date: Fri,  9 Oct 2026 18:16:22 +0300
Message-ID: <20261009151624.618967-10-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009151624.618967-1-mathias.nyman@linux.intel.com>
References: <20261009151624.618967-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Michal Pecio <michal.pecio@gmail.com>

Matching events with TDs and giving back missed TDs is carried out
by a complicated loop. Replace it with a simpler linear logic:

0. Having verified that 'td_list' isn't empty,
1. Scan it to find the matching TD and count missed TDs,
2. Perform necessary adjustments for corner cases,
3. Give back missed TDs, if applicable, using a short and tidy loop,
4. Check if the event refers to the expected TD and proceed as usual.

Besides cleaning up the code, this provides a few improvements:
- when the skip flag is set, no TD is given back unless we found a match
  or otherwise know how many TDs should be given back
- when the skip flag is clear, we know if the event refers to a "future"
  TD so we can log this in the Scary Error Message to aid debugging.

While altering the error message, drop a pointless goto.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 137 ++++++++++++++++-------------------
 1 file changed, 61 insertions(+), 76 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 7597ef8105c6..243b1fd2b2f6 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -127,11 +127,16 @@ static bool link_trb_toggles_cycle(union xhci_trb *trb)
 	return le32_to_cpu(trb->link.control) & LINK_TOGGLE;
 }
 
-static bool last_td_in_urb(struct xhci_td *td)
+static int num_tds_not_done(struct urb *urb)
 {
-	struct urb_priv *urb_priv = td->urb->hcpriv;
+	struct urb_priv *urb_priv = urb->hcpriv;
 
-	return urb_priv->num_tds_done == urb_priv->num_tds;
+	return urb_priv->num_tds - urb_priv->num_tds_done;
+}
+
+static bool last_td_in_urb(struct xhci_td *td)
+{
+	return !num_tds_not_done(td->urb);
 }
 
 static bool unhandled_event_trb(struct xhci_ring *ring)
@@ -2624,14 +2629,19 @@ static bool xhci_spurious_success_tx_event(struct xhci_hcd *xhci,
 	}
 }
 
-static struct xhci_td *find_td_by_dma(struct xhci_ring *ep_ring, dma_addr_t dma)
+static struct xhci_td *find_td_by_dma(struct xhci_ring *ep_ring, int *missed_tds, dma_addr_t dma)
 {
 	struct xhci_td *td;
 
-	if (dma)
+	if (dma) {
 		list_for_each_entry(td, &ep_ring->td_list, td_list)
 			if (trb_in_td(td, dma))
 				return td;
+			else
+				(*missed_tds)++;
+	}
+
+	*missed_tds = 0;
 	return NULL;
 }
 
@@ -2648,8 +2658,8 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 	struct xhci_ring *ep_ring;
 	unsigned int slot_id;
 	int ep_index;
-	struct xhci_td *td = NULL;
-	struct urb *missed_urb = NULL;
+	struct xhci_td *td;
+	int missed_tds = 0;
 	dma_addr_t ep_trb_dma;
 	union xhci_trb *ep_trb;
 	int status = -EINPROGRESS;
@@ -2832,13 +2842,6 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 		xhci_dequeue_td(xhci, td, ep_ring, td->status);
 	}
 
-	/*
-	 * We don't know how many TDs were missed when ep_trb_dma is zero (as permitted by
-	 * xHCI 1.0) or bogus. Bail out leaving ep->skip set, next event will sort it out.
-	 */
-	if (trb_comp_code == COMP_MISSED_SERVICE_ERROR && !find_td_by_dma(ep_ring, ep_trb_dma))
-		return 0;
-
 	if (list_empty(&ep_ring->td_list)) {
 		/*
 		 * Don't print wanings if ring is empty due to a stopped endpoint generating an
@@ -2858,66 +2861,50 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 		goto check_endpoint_halted;
 	}
 
-	do {
-		td = list_first_entry(&ep_ring->td_list, struct xhci_td,
-				      td_list);
-
-		if (ep->skip) {
-
-			if (!trb_in_td(td, ep_trb_dma)) {
-				/* this event is unlikely to match any TD, don't skip them all */
-				if (trb_comp_code == COMP_STOPPED_LENGTH_INVALID)
-					return 0;
-
-				/*
-				 * If skip flag is still set at xrun, we are on xHCI 1.0 and our TRB
-				 * pointer is zero again. All missed TDs can be given back, but we
-				 * don't know which were missed and which were queued after the xrun
-				 * occurred. We can safely give back the first pending URB.
-				 */
-				if (ring_xrun_event) {
-					if (!missed_urb)
-						missed_urb = td->urb;
-
-					if (td->urb != missed_urb) {
-						xhci_dbg(xhci, "Skipped one URB for slot %u ep %u",
-								slot_id, ep_index);
-						return 0;
-					}
-				}
-
-				/*
-				 * TD was missed, skip it. Core already initialized frame->status
-				 * to -EXDEV and frame->actual_length to 0, nothing more to do.
-				 */
-				xhci_dequeue_td(xhci, td, ep_ring, 0);
+	td = find_td_by_dma(ep_ring, &missed_tds, ep_trb_dma);
 
-				if (!list_empty(&ep_ring->td_list))
-					continue;
+	if (ep->skip) {
+		if (!td) {
+			/*
+			 * xHCI 1.0 allowed MSE events to have zero TRB pointers. Some old chips
+			 * also generate bogus non-zero pointers. We know, don't bother warning.
+			 * Missed TDs will be given back by the next event with a valid pointer.
+			 */
+			if (trb_comp_code == COMP_MISSED_SERVICE_ERROR &&
+			    xhci->hci_version <= 0x100)
+				return 0;
+			/*
+			 * If skip flag is still set at xrun, we are on xHCI 1.0 and our TRB pointer
+			 * is zero again. All missed TDs can be given back, but we don't know which
+			 * were missed and which were queued after the xrun occurred. We can safely
+			 * give back the first pending URB to let the class driver know.
+			 */
+			if (ring_xrun_event)
+				missed_tds = num_tds_not_done(list_first_entry(&ep_ring->td_list,
+								struct xhci_td, td_list)->urb);
+			/* In other cases missed_tds is zero */
+		}
 
-				xhci_dbg(xhci, "All TDs skipped for slot %u ep %u. Clear skip flag.\n",
-					 slot_id, ep_index);
-				ep->skip = false;
-				td = NULL;
-				goto check_endpoint_halted;
-			}
+		/*
+		 * Give back missed TDs. Core already initialized their frame->status to -EXDEV
+		 * and frame->actual_length to 0, nothing more to do.
+		 */
+		for (int i = 0; i < missed_tds; i++)
+			xhci_dequeue_td(xhci,
+				list_first_entry(&ep_ring->td_list, struct xhci_td, td_list),
+				ep_ring, 0);
 
-			xhci_dbg(xhci,
-				 "Found td. Clear skip flag for slot %u ep %u.\n",
-				 slot_id, ep_index);
+		/* the list may become empty on ring_xrun_event */
+		if (td || list_empty(&ep_ring->td_list))
 			ep->skip = false;
-		}
 
-	/*
-	 * If ep->skip is set, it means there are missed tds on the
-	 * endpoint ring need to take care of.
-	 * Process them as short transfer until reach the td pointed by
-	 * the event.
-	 */
-	} while (ep->skip);
+		xhci_dbg(xhci, "Skipped %d TDs on slot %u ep %u comp_code %u, TD found %d, skip flag %d\n",
+				missed_tds, slot_id, ep_index, trb_comp_code, !!td, ep->skip);
+		missed_tds = 0;
+	}
 
 	/* Handle events not referencing the current TD */
-	if (!trb_in_td(td, ep_trb_dma)) {
+	if (!td || missed_tds) {
 		/* TD was queued after xrun, maybe xrun was on a link, don't panic yet */
 		if (ring_xrun_event)
 			return 0;
@@ -2944,7 +2931,13 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 		}
 
 		/* HC is busted, give up! */
-		goto debug_finding_td;
+		td = list_first_entry(&ep_ring->td_list, struct xhci_td, td_list);
+		xhci_err(xhci, "Event dma %pad for ep %d comp_code %u not part of TD at %016llx - %016llx, missed %d\n",
+				&ep_trb_dma, ep_index, trb_comp_code,
+				(u64)xhci_trb_virt_to_dma(td->start_seg, td->start_trb),
+				(u64)xhci_trb_virt_to_dma(td->end_seg, td->end_trb),
+				missed_tds);
+		return -ESHUTDOWN;
 	}
 
 	ep_ring->old_trb_comp_code = trb_comp_code;
@@ -2982,14 +2975,6 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 
 	return 0;
 
-debug_finding_td:
-	xhci_err(xhci, "Event dma %pad for ep %d status %d not part of TD at %016llx - %016llx\n",
-		 &ep_trb_dma, ep_index, trb_comp_code,
-		 (unsigned long long)xhci_trb_virt_to_dma(td->start_seg, td->start_trb),
-		 (unsigned long long)xhci_trb_virt_to_dma(td->end_seg, td->end_trb));
-
-	return -ESHUTDOWN;
-
 err_out:
 	xhci_err(xhci, "@%016llx %08x %08x %08x %08x\n",
 		 (unsigned long long) xhci_trb_virt_to_dma(
-- 
2.43.0

