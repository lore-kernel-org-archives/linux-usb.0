Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432FF40627D
	for <linux-usb@vger.kernel.org>; Mon, 29 Jun 2026 12:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782736255; cv=none; b=Eh/aiS/T5186v9t11Mo76wI6eOM8tF7SwiZxBtJBL8Dm62/hLmEpEpZLRLevR5TYK3N08t/bfOtgV6MmFx9jkJNBFPFyI1eKJV8ddByQHzMv5Vg6e2IYDeHHy4DVjBHNsm87XrpYm8aZb8459axMzcQhY7K/lFoSGGIpsILIXTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782736255; c=relaxed/simple;
	bh=HL94h7eXIOzQtbVahWsUJTvzuiEFnDQoKG6gnjMnYP0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ESSpy97vDkXYIk+I8eKgVGe1hjPwTrHSQiMReALtCFpTp1LFZB1+BBvXfKBk3x5/axejCTFrvUetCqbs1bR0yH7tN5VCxnGMWDEL8ggxOLZsK8BOZDIBzfw6avEUkIMGMDJ9PxwHqCXrepSVgdPZr9SHhvvlXaV0IvxikT68mi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aBW2D+1E; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aBW2D+1E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782736253; x=1814272253;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HL94h7eXIOzQtbVahWsUJTvzuiEFnDQoKG6gnjMnYP0=;
  b=aBW2D+1EvDSwUwguON/BSJ+wrU6iKdIJi5y+Pw/5bCFI3reHChcTuNhx
   jpjuJ0w6oy/xa9kGzwKJEwUTGrqvvTH4aqF/+NRSIVS/qU6FJ3jYwtotd
   v3J4MdOs4vp9KKWg9u/PGt9AHxI99yHAIZE3PVqr2b09OH4g314EjIn9U
   n9f/U/sZaSg3efclSb/rRDydYavk34hS4xT5TqZka8iXxEpOj7RfQSz1Y
   2sRE2TJPdow/TVHoMVQHkbTs7AQ7oM1muON6crtkKHRE+yGLDhTQ2N0e/
   7r7aB+b8N5CRYun97+JwAFxlt8PBD44bFBEjACTm5j/bvJeFXp6z21VvD
   w==;
X-CSE-ConnectionGUID: PA+kgPeoRyGifhVBpLKOSQ==
X-CSE-MsgGUID: JkVtP8w9SyWyxcoeGAHFsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="70943967"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="70943967"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 05:30:52 -0700
X-CSE-ConnectionGUID: khKS7vdJSmSXGu0l4ICKEw==
X-CSE-MsgGUID: CleZgCwfRQKaaw0b4eag8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="252081326"
Received: from vpanait-mobl.ger.corp.intel.com (HELO mnyman-desk.home) ([10.245.244.241])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 05:30:50 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <linux-usb@vger.kernel.org>
Cc: raoxu@uniontech.com,
	michal.pecio@gmail.com,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [RFT PATCH 3/3] xhci: avoid xHC endpoint changes after disconnect or link error.
Date: Mon, 29 Jun 2026 15:30:31 +0300
Message-ID: <20260629123031.142133-4-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260629123031.142133-1-mathias.nyman@linux.intel.com>
References: <20260629123031.142133-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Avoid all extra endpoint state changes after the roothub link
is lost due to disconnect or link error, and endpoint is known
to be in a non-running state.

Rapid endpoint state changes involving endpoint reset, restart, and
stopping the endpoint have caused xHC failures to complete stop
endpoint command. xhci driver sees this as a fatal flaw and tears
down xhci.

These endpoint state changes are normally part of recovery from
transaction errors or URB cancel.
In this case recovery is not needed.

Add an endpoint state called EP_DROP_PENDING.
Set ep->ep_state |= EP_DROP_PENDING when an endpoint is found in a
halted or stopped non-running state, and the roothub link is
lost. Prevent endpoint from restarting.

URB cancel doesn't need to stop the endpoint if EP_DROP_PENDONG is set.
URBs can be given back directly.
Endpoint is, and will remain stopped until it's dropped.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 19 ++++++++++++++++---
 drivers/usb/host/xhci.c      |  5 ++++-
 drivers/usb/host/xhci.h      |  1 +
 3 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 5e9efd3aa629..83947a476f14 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -561,8 +561,8 @@ void xhci_ring_ep_doorbell(struct xhci_hcd *xhci,
 	 * pointer command pending because the device can choose to start any
 	 * stream once the endpoint is on the HW schedule.
 	 */
-	if ((ep_state & EP_STOP_CMD_PENDING) || (ep_state & SET_DEQ_PENDING) ||
-	    (ep_state & EP_HALTED) || (ep_state & EP_CLEARING_TT))
+	if (ep_state & (EP_STOP_CMD_PENDING | SET_DEQ_PENDING | EP_HALTED |
+			EP_CLEARING_TT | EP_DROP_PENDING))
 		return;
 
 	trace_xhci_ring_ep_doorbell(slot_id, DB_VALUE(ep_index, stream_id));
@@ -995,8 +995,10 @@ static int xhci_handle_halted_endpoint(struct xhci_hcd *xhci,
 	 * Can cause host hang.
 	 * Device will be reset to recover an inactive link, so don't do anything
 	 */
-	if (rhub_port->link_inactive || !rhub_port->connected)
+	if (rhub_port->link_inactive || !rhub_port->connected) {
+		ep->ep_state |= EP_DROP_PENDING;
 		return -ENODEV;
+	}
 
 	/* add td to cancelled list and let reset ep handler take care of it */
 	if (reset_type == EP_HARD_RESET) {
@@ -1066,6 +1068,13 @@ static int xhci_invalidate_cancelled_tds(struct xhci_virt_ep *ep)
 				  td->urb, td->urb->stream_id);
 			continue;
 		}
+
+		/* device disconnected or link error, ep will be dropped */
+		if (ep->ep_state & EP_DROP_PENDING) {
+			td->cancel_status = TD_CLEARED;
+			continue;
+		}
+
 		/*
 		 * If a ring stopped on the TD we need to cancel then we have to
 		 * move the xHC endpoint ring dequeue pointer past this TD.
@@ -1296,6 +1305,10 @@ static void xhci_handle_cmd_stop_ep(struct xhci_hcd *xhci, int slot_id,
 		}
 	}
 
+	/* link is inactive or disconnected, ep is not running and shouldn't be restarted */
+	if (ep->vdev->rhub_port->link_inactive || !ep->vdev->rhub_port->connected)
+		ep->ep_state |= EP_DROP_PENDING;
+
 	/* will queue a set TR deq if stopped on a cancelled, uncleared TD */
 	xhci_invalidate_cancelled_tds(ep);
 	ep->ep_state &= ~EP_STOP_CMD_PENDING;
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index cc92b316d877..66e302cdef2f 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1855,7 +1855,7 @@ static int xhci_urb_dequeue(struct usb_hcd *hcd, struct urb *urb, int status)
 	}
 
 	/* In this case no commands are pending but the endpoint is stopped */
-	if (ep->ep_state & EP_CLEARING_TT) {
+	if (ep->ep_state & (EP_CLEARING_TT | EP_DROP_PENDING)) {
 		/* and cancelled TDs can be given back right away */
 		xhci_dbg(xhci, "Invalidating TDs instantly on slot %d ep %d in state 0x%x\n",
 				urb->dev->slot_id, ep_index, ep->ep_state);
@@ -4083,6 +4083,9 @@ static int xhci_discover_or_reset_device(struct usb_hcd *hcd,
 	ret = 0;
 
 command_cleanup:
+	for (i = 0; i < EP_CTX_PER_DEV; i++)
+		virt_dev->eps[i].ep_state &= ~EP_DROP_PENDING;
+
 	xhci_free_command(xhci, reset_device_cmd);
 	return ret;
 }
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index fd5533bdb261..a3293e90857b 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -674,6 +674,7 @@ struct xhci_virt_ep {
 #define EP_SOFT_CLEAR_TOGGLE	BIT(7)
 /* usb_hub_clear_tt_buffer is in progress */
 #define EP_CLEARING_TT		BIT(8)
+#define EP_DROP_PENDING		BIT(9) /* port disconnect or link error, don't restart */
 	/* ----  Related to URB cancellation ---- */
 	struct list_head	cancelled_td_list;
 	struct xhci_hcd		*xhci;
-- 
2.43.0

