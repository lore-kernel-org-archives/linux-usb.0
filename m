Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784EC4E781A
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 15:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791559004; cv=none; b=oqZohDPBAfg2aCBUuxq3oqr7tlJ3iZ9DRZYmoR+POsM8gXGJzzb2dRVA7VVPBhSLLTJiD/AfGK22P240SSSW6hd30iPjymlCDgfVzoeY6xGsSzva8iyVl9MV4hc9bAns5ssS1R+59UvbmCq6jo6DJhMYvx1PjNdB1P9/703jyX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791559004; c=relaxed/simple;
	bh=TZXnOyrDH4zYmyRbogWFe6JB88S4UafaY/6s6F9G9nY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S940zLvr1L9G/8D/OUAfP3c6iObSxIJ7RCJRJJMdB9lFLsmX0LZikUukc+KvINPcaELMmrhhhbK+MfD1xBZbpu7NZkeNNf0qtQE1UDAg1w9/F5FgVZvUU/Rsd9GmCTmmBPAwEUW/Y9aQHLIiRhkQhGDQKQMVSbMKrdcLfNTd/Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dqlGt85V; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dqlGt85V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791559003; x=1823095003;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TZXnOyrDH4zYmyRbogWFe6JB88S4UafaY/6s6F9G9nY=;
  b=dqlGt85VTcHp7vVep4SMgYQJIFeV5nKT7nhlQHgySgFiGzaiEF6NudSH
   LamsOmyKIIqm2QV1x3iM3GblHP7MINsdnrM0REJixi50CJ2nLsA/cR6cR
   mxmhHfaQpen3bdcuVhQT8JpnTDQattNeQ1+sm6Xv1XUB8qR4cMGJbOTrO
   6v4YiPKt2bfV/iVosRW/qWzLXV24JNplaQZexvDfj9gnlLQreK+oNrJcj
   m4mPJdq3GlLX+EOLEgCQNREYxjJszFEu82LDcH9mwLJW0m+cfBazmOWPd
   q7kSho8W1l1uae+4fZ9WSnQxbwReXbYR8rjahsl2ogZlOjeEZAMvLv11R
   Q==;
X-CSE-ConnectionGUID: ykkE5uX2Tg2SryNyCRLNiw==
X-CSE-MsgGUID: 208ZAAtEQS2ijzupx46O0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="351684"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="351684"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 08:16:43 -0700
X-CSE-ConnectionGUID: MM8H1nb4S/aRAMV8QzSopw==
X-CSE-MsgGUID: GUYsV2c3RtW1Zle6ZP2urQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="650055"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.244.17])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 08:16:42 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Michal Pecio <michal.pecio@gmail.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH v2 06/11] usb: xhci: Guarantee URB giveback on Ring Underrun/Overrun
Date: Fri,  9 Oct 2026 18:16:19 +0300
Message-ID: <20261009151624.618967-7-mathias.nyman@linux.intel.com>
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

In this case we know that the xHC has released ownership of all missed
TDs, we only don't know which were missed and which were queued later.

URBs are queued atomically, so we can safely give back all TDs of the
currently executing URB. Unlike the previous policy, this does actually
ensure that the class driver will learn about the error and won't see
all of its URBs still in progress when all TDs are missed on xHCI 1.0.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
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

