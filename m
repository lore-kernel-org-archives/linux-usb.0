Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D10A49C4C4
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 09:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791539947; cv=none; b=Lc51ceYjr40hp+N4L0G//OKFTz7dyPvozI5aPwlEnY4c0NTKMJHQ9RtEwDf6yB3dEIOmWLV4pIwD0iJQF4ARWwQv6HokLnGz/7mcJpcxWiLHEnfXld6rO9cHl67QB3/NKIwlLD/68YCD2lpmHT5svepMZ0qDTRI/SpsNvfG8Eh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791539947; c=relaxed/simple;
	bh=ZoUGMZsru5YefgnnG+GOkjYrRjiUDrc0uoC3Bd8Pzqc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=onRvusIAeVykMXocbbRqdVU1tAlhvvXgZLuo7CMbHaBzfsWO68fL7d8PjFX6seQ9oGFJ9OcV9pHDpyfGReIbkW4gmqNp54HOk0gFBCaq4FjSf0Ga4HvZLXVCQTuM6x4vExwje6FGpTcCxj8eGWdFPPvvOrZJFfcoFyuUj7G8eN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EBdu/7Rj; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EBdu/7Rj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791539947; x=1823075947;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZoUGMZsru5YefgnnG+GOkjYrRjiUDrc0uoC3Bd8Pzqc=;
  b=EBdu/7RjRNz6jLnw4CpmzJ4rfg29lDnujj+4gUer990jFOVF6zi9uh9E
   Hglgf+bSr/1xG+a26FEmiYXKgBk+MmopJSi+aAzVOIes3In+r/zsXHUT/
   P14pOzb1+oEuG9h6ZRbg25chO6q8GfGkpTa+2Edf3xBCQK4rYaty6GcIq
   7KWf8Xt94R3Q7t962Cy7dUrzlEn3fh4mePfZ9Ha2pUP301qM4/Pq1dsnl
   qT2gR+4JcBTnNyjCqgaCz2OamQf7AQT2RvybeGcpyIU0czoBwmLm3RO9i
   Rb/PCcfoB8lYncb42cgBiMWkp2Q9hkdnG38FTQ97SyeLN5+AYfNP9+VEx
   w==;
X-CSE-ConnectionGUID: ob25UYkRQAmqWiKF1ejE2A==
X-CSE-MsgGUID: RR/rRkZaRqOIA0lOqXx1Wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="224123"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="224123"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 02:59:06 -0700
X-CSE-ConnectionGUID: WeF9ZeQ7TgCk2mOBHVdVtQ==
X-CSE-MsgGUID: cGdqYtTHTgmo8Y8OSn1ymA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="613427"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.244.17])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 02:59:05 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Michal Pecio <michal.pecio@gmail.com>,
	Mathias Nyman <mathias.nyman@intel.com>
Subject: [PATCH 09/14] usb: xhci: Guarantee URB giveback on Ring Underrun/Overrun
Date: Fri,  9 Oct 2026 12:58:29 +0300
Message-ID: <20261009095834.561578-10-mathias.nyman@linux.intel.com>
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

From: Michal Pecio <michal.pecio@gmail.com>

In this case we know that the xHC has released ownership of all missed
TDs, we only don't know which were missed and which were queued later.

URBs are queued atomically, so we can safely give back all TDs of the
currently executing URB. Unlike the previous policy, this does actually
ensure that the class driver will learn about the error and won't see
all of its URBs still in progress when all TDs are missed on xHCI 1.0.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
Signed-off-by: Mathias Nyman <mathias.nyman@intel.com>
---
 drivers/usb/host/xhci-ring.c | 32 +++++++++++++++++++-------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 7f480db2983e..8b915a1d5b25 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2649,6 +2649,7 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 	unsigned int slot_id;
 	int ep_index;
 	struct xhci_td *td = NULL;
+	struct urb *missed_urb = NULL;
 	dma_addr_t ep_trb_dma;
 	union xhci_trb *ep_trb;
 	int status = -EINPROGRESS;
@@ -2868,26 +2869,31 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 					return 0;
 
 				/*
-				 * TD was missed, skip it. Core already initialized frame->status
-				 * to -EXDEV and frame->actual_length to 0, nothing more to do.
+				 * If skip flag is still set at xrun, we are on xHCI 1.0 and our TRB
+				 * pointer is zero again. All missed TDs can be given back, but we
+				 * don't know which were missed and which were queued after the xrun
+				 * occurred. We can safely give back the first pending URB.
 				 */
-				xhci_dequeue_td(xhci, td, ep_ring, 0);
+				if (ring_xrun_event) {
+					if (!missed_urb)
+						missed_urb = td->urb;
 
-				if (!list_empty(&ep_ring->td_list)) {
-					if (ring_xrun_event) {
-						/*
-						 * If we are here, we are on xHCI 1.0 host with no
-						 * idea how many TDs were missed or where the xrun
-						 * occurred. New TDs may have been added after the
-						 * xrun, so skip only one TD to be safe.
-						 */
-						xhci_dbg(xhci, "Skipped one TD for slot %u ep %u",
+					if (td->urb != missed_urb) {
+						xhci_dbg(xhci, "Skipped one URB for slot %u ep %u",
 								slot_id, ep_index);
 						return 0;
 					}
-					continue;
 				}
 
+				/*
+				 * TD was missed, skip it. Core already initialized frame->status
+				 * to -EXDEV and frame->actual_length to 0, nothing more to do.
+				 */
+				xhci_dequeue_td(xhci, td, ep_ring, 0);
+
+				if (!list_empty(&ep_ring->td_list))
+					continue;
+
 				xhci_dbg(xhci, "All TDs skipped for slot %u ep %u. Clear skip flag.\n",
 					 slot_id, ep_index);
 				ep->skip = false;
-- 
2.43.0

