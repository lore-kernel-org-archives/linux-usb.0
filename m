Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDA923183B
	for <linux-usb@vger.kernel.org>; Fri, 27 Mar 2026 12:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774615279; cv=none; b=XBBJAs1mzRhaIvDbQrl9Li9GCi7SoGcZU8rKXkKUrFE259pEiqw6gVZbsXjOOfKx5XNineK/aRLRrrSapZ02prXHL65NyRMSgRqsWVOi+0SGJyA0o2LP25/yaJ8xPD9YG29gEgPB4llgdB2HVT3A2m14FKbMOO4iVqOl3MiS/BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774615279; c=relaxed/simple;
	bh=iF8CfOZHPhBXC64tHc9bfGaGm4w85ln1Y7ArumYqzJI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PLh7+LiXnPdERRFwWE+N+fTKOWm1B8GZ9hFcWAaX4TaB6G72z0PSJijHnyMAQneAH+OZg65vfbcb+e/YMmlLQeFRVXQsjYyJy1rIoy9JyO54/SjbDHYXJ5EOEGWZ2opSe0wBPJbghh6E2bjfUKWZeZho3YLN3BXLApR/bimp+R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JIqsz+zw; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JIqsz+zw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774615279; x=1806151279;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iF8CfOZHPhBXC64tHc9bfGaGm4w85ln1Y7ArumYqzJI=;
  b=JIqsz+zwXbODGkuiC+JPlQ1sSGQeIiFL54CkmuZ9FST7S7GwK1zYCM22
   KwKLRBznBkYIWE1olHJY7RmBPcOBbzaYZmK2+sP+ZPNwkZXZvbjK1poVl
   3bgp061KLphosdp3ME5hk1Jc4v/hHbBxdCWGYEcJTfU88eXK8xqmJXwG6
   dR92ghAmZOsk02agS9UgUs86/dqaIOSCgoB3gdRWsMNpAjgzCX1aNP5W0
   0RyQWDE5ESAVfZLWxruJ4LQ0mIot3zVRdM/ESziaMIfhIbC3MJTOiJd3J
   fVtPMrbFoDichRIQrqBD1483OD3r7/hOltBXLyvi6mZ+4vC+SL7nNzHCZ
   g==;
X-CSE-ConnectionGUID: /Nqt2P4ITMKjn8YS8yY0YQ==
X-CSE-MsgGUID: qwbmXPOjQMm4p7lAe9gu0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="87160622"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="87160622"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 05:41:18 -0700
X-CSE-ConnectionGUID: PIqV92mgSNuEGCZYh9SRcg==
X-CSE-MsgGUID: hGHW98zKQJGhFrTawj00ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="248347689"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 27 Mar 2026 05:41:16 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 8C8059B; Fri, 27 Mar 2026 13:41:15 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	raoxu@uniontech.com,
	michal.pecio@gmail.com,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 3/9] usb: xhci: factor out roothub bandwidth cleanup
Date: Fri, 27 Mar 2026 13:34:34 +0100
Message-ID: <20260327123441.806564-4-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260327123441.806564-1-niklas.neronin@linux.intel.com>
References: <20260327123441.806564-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce xhci_rh_bw_cleanup() to release all bandwidth tracking
structures associated with xHCI roothub ports.

The new helper clears:
 * TT bandwidth entries
 * Per-interval endpoint lists

This refactors and consolidates the existing per-port cleanup logic
previously embedded in xhci_mem_cleanup(), reducing duplication and
making the teardown sequence easier to follow.

The helper will also be reused for upcoming S4 resume handling.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 50 +++++++++++++++++++++----------------
 1 file changed, 29 insertions(+), 21 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 75bc1eb98b76..d4a9dbed8f16 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1895,10 +1895,36 @@ void xhci_remove_secondary_interrupter(struct usb_hcd *hcd, struct xhci_interrup
 }
 EXPORT_SYMBOL_GPL(xhci_remove_secondary_interrupter);
 
+/* Cleanup roothub bandwidth data */
+static void xhci_rh_bw_cleanup(struct xhci_hcd *xhci)
+{
+	struct xhci_root_port_bw_info *rh_bw;
+	struct xhci_tt_bw_info *tt_info, *tt_next;
+	struct list_head *eps, *ep, *ep_next;
+
+	for (int i = 0; i < xhci->max_ports; i++) {
+		rh_bw = &xhci->rh_bw[i];
+
+		/* Clear and free all TT bandwidth entries */
+		list_for_each_entry_safe(tt_info, tt_next, &rh_bw->tts, tt_list) {
+			list_del(&tt_info->tt_list);
+			kfree(tt_info);
+		}
+
+		/* Clear per-interval endpoint lists */
+		for (int j = 0; j < XHCI_MAX_INTERVAL; j++) {
+			eps = &rh_bw->bw_table.interval_bw[j].endpoints;
+
+			list_for_each_safe(ep, ep_next, eps)
+				list_del_init(ep);
+		}
+	}
+}
+
 void xhci_mem_cleanup(struct xhci_hcd *xhci)
 {
 	struct device	*dev = xhci_to_hcd(xhci)->self.sysdev;
-	int i, j;
+	int i;
 
 	cancel_delayed_work_sync(&xhci->cmd_timer);
 
@@ -1917,15 +1943,6 @@ void xhci_mem_cleanup(struct xhci_hcd *xhci)
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Freed command ring");
 	xhci_cleanup_command_queue(xhci);
 
-	for (i = 0; i < xhci->max_ports && xhci->rh_bw; i++) {
-		struct xhci_interval_bw_table *bwt = &xhci->rh_bw[i].bw_table;
-		for (j = 0; j < XHCI_MAX_INTERVAL; j++) {
-			struct list_head *ep = &bwt->interval_bw[j].endpoints;
-			while (!list_empty(ep))
-				list_del_init(ep->next);
-		}
-	}
-
 	for (i = xhci->max_slots; i > 0; i--)
 		xhci_free_virt_devices_depth_first(xhci, i);
 
@@ -1959,18 +1976,9 @@ void xhci_mem_cleanup(struct xhci_hcd *xhci)
 
 	scratchpad_free(xhci);
 
-	if (!xhci->rh_bw)
-		goto no_bw;
+	if (xhci->rh_bw)
+		xhci_rh_bw_cleanup(xhci);
 
-	for (i = 0; i < xhci->max_ports; i++) {
-		struct xhci_tt_bw_info *tt, *n;
-		list_for_each_entry_safe(tt, n, &xhci->rh_bw[i].tts, tt_list) {
-			list_del(&tt->tt_list);
-			kfree(tt);
-		}
-	}
-
-no_bw:
 	xhci->cmd_ring_reserved_trbs = 0;
 	xhci->usb2_rhub.num_ports = 0;
 	xhci->usb3_rhub.num_ports = 0;
-- 
2.50.1

