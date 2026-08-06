Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE463356773
	for <linux-usb@vger.kernel.org>; Thu,  6 Aug 2026 14:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786026102; cv=none; b=dYjFKZ36UzOynHJwFM1ptClD08ef588U/4mKNzliKWPHDjVZrIVi9XKi+TARuXkdl5D6QFY7mlGRpvE3E/EvMRrGLJJ5zX8KobC9RFLh0LderoKpTdEMY+jQ16uS5CQ8lL7+YIlG3OBfW3Qu5lfN8u5bwdKTt/Cd70+FAMzCJFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786026102; c=relaxed/simple;
	bh=6aIBlgVIqHRM6YL2WCVeaK3Rw5leiXfJ0u9qs25HnXY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IM/f+o41RLmGJ/9pH7v/CumVKod5+c4DGgvjfcgvOL3hOh0+Y0uRdvY2wrPcgSQxauPsohbXwX5nTqVvum/JK6cgmTvVF4Sd+z/XntO0slmaFfUHwdwQC0oGNJbc+hQUfLqNJEggBo5oxYc2lAPzE/5SnOmENTacNNY/JEyP5u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K4SdTfTW; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K4SdTfTW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786026098; x=1817562098;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6aIBlgVIqHRM6YL2WCVeaK3Rw5leiXfJ0u9qs25HnXY=;
  b=K4SdTfTW1t8AePE+mR+tgHKY/mCd9i78qHLrOHcQeujX/NWvxCRQKG9C
   Ndy79umrNjmVeD0Ax+Xprg7hxI8pdy/Y6uid5n4mKDtGBaqcbqxh6CQRQ
   Ry6GquxAHgayMU4PK/4E/VJ3ODYEGeNoOTZVrAo6fYlqbtUwgGodxuN5M
   UR6VmqFqADoEZtYNiwjIQqx7WTm1L3jsFc7eLrtbfOOuIlVxxHbDKUhQv
   lZ938ryuE98rB6sV5F6SxMnrrL7T8JJLJmfcV8R2NAEo4kMEE0IZvKiEO
   aIWa4w6t9jNRcS558cxWkb5RySV49vCl3+ySpRVIzfmMytbo6bu2tLjwh
   w==;
X-CSE-ConnectionGUID: IF7VydemSG6nKrKx6t5sJw==
X-CSE-MsgGUID: wTy9n9weQ0qo+ocFz+vS4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="97268149"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="97268149"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 07:21:34 -0700
X-CSE-ConnectionGUID: 1g1n4rq3Qi2BnaTd+B+kuA==
X-CSE-MsgGUID: sxa0Eu7hQC25FfVsBA8zDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="285500375"
Received: from amilburn-desk.amilburn-desk (HELO mnyman-desk.home) ([10.245.244.235])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 07:21:33 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	Xu Rao <raoxu@uniontech.com>
Subject: [PATCH 05/17] xhci: avoid xHC endpoint changes after disconnect or link error.
Date: Thu,  6 Aug 2026 17:21:01 +0300
Message-ID: <20260806142113.2436238-6-mathias.nyman@linux.intel.com>
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

Tested-by: Xu Rao <raoxu@uniontech.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 19 ++++++++++++++++---
 drivers/usb/host/xhci.c      |  5 ++++-
 drivers/usb/host/xhci.h      |  1 +
 3 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 656ed6470e4a..51008bad16cd 100644
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
index 6f830a43963f..71c25c2e71b9 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1852,7 +1852,7 @@ static int xhci_urb_dequeue(struct usb_hcd *hcd, struct urb *urb, int status)
 	}
 
 	/* In this case no commands are pending but the endpoint is stopped */
-	if (ep->ep_state & EP_CLEARING_TT) {
+	if (ep->ep_state & (EP_CLEARING_TT | EP_DROP_PENDING)) {
 		/* and cancelled TDs can be given back right away */
 		xhci_dbg(xhci, "Invalidating TDs instantly on slot %d ep %d in state 0x%x\n",
 				urb->dev->slot_id, ep_index, ep->ep_state);
@@ -4089,6 +4089,9 @@ static int xhci_discover_or_reset_device(struct usb_hcd *hcd,
 	ret = 0;
 
 command_cleanup:
+	for (i = 0; i < EP_CTX_PER_DEV; i++)
+		virt_dev->eps[i].ep_state &= ~EP_DROP_PENDING;
+
 	xhci_free_command(xhci, reset_device_cmd);
 	return ret;
 }
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index defc5ff5aa55..670533dc1d97 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -682,6 +682,7 @@ struct xhci_virt_ep {
 #define EP_SOFT_CLEAR_TOGGLE	BIT(7)
 /* usb_hub_clear_tt_buffer is in progress */
 #define EP_CLEARING_TT		BIT(8)
+#define EP_DROP_PENDING		BIT(9) /* port disconnect or link error, don't restart */
 	/* ----  Related to URB cancellation ---- */
 	struct list_head	cancelled_td_list;
 	struct xhci_hcd		*xhci;
-- 
2.43.0

