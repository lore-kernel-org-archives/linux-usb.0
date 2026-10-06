Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA8548EC99
	for <linux-usb@vger.kernel.org>; Tue,  6 Oct 2026 15:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791300287; cv=none; b=lJDsNPPiIxBZeQcJN+PP5XxpFXIHn5Mw0zTe6VPNCh0CfixOkfqatn2gv0oaEDdMrrAS1O1g/8s+HvpyA3Andz+Ow/MYPT/FDdNhtD5xZE8IhzCVoEhhQXzpAQOTCgUHkjWDYT+nyh91Dkk8pwjIA9Pr74TkK5wmctBqQ2rNBsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791300287; c=relaxed/simple;
	bh=7ZrKewUnVw9NE3OcsWmHkNOTf8onEW/0UR77/7wrQfM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O0zxvjdVAcgAfYDT4hOWzPF5BJ4k1AAOACqnknaCNL7lHMWJOUyOjI3BLf4hjjMDZNPqlLsgM0ZEpGe67YrIi1VnJVm+dv23ipSm1lCFIq15gX5gKxyYgsBbFqi9bWvjpUd5fAx2j+sQSciH0UvTVp/K9rHzmlJSLshPtYmw4z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R1VLo88/; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R1VLo88/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791300286; x=1822836286;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7ZrKewUnVw9NE3OcsWmHkNOTf8onEW/0UR77/7wrQfM=;
  b=R1VLo88/0NrT29pZwF3vN2wkkh/RnJCj9B42hI3ht+GE3kB8UoKWDWTK
   tvbtjQPNlhaIlAxwTZphpyIQj2JgkFg8dbqrTZcHhWWwNwROcktAFgElC
   Z9gWXdo7otzr6yEhTGsImpIJGrPJQU6c7hRwsXCP85nY3upojLW9540Q/
   mPtbJ1p5D442dXxLRbj0ppo/jNLDFV6HfAqYiZSHs3mEXH6U6gOyB2+/S
   BF+N9rbSMySjeWXxnqcS08JMXIrcj/feVavNSlh8E/3OYMolpM/qKNRsZ
   n6NpFHlJRv1OtW0/SKNyxNx60p24aISUkQDMKTxR81frAke64I4rS+o1j
   Q==;
X-CSE-ConnectionGUID: +6MO2ewJRiSVcChex3M8hA==
X-CSE-MsgGUID: PfvNa6s3Qzm3l8sdstA+kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="43704"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="43704"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 08:24:45 -0700
X-CSE-ConnectionGUID: Zl7lJhfdTdGir2x6O2UO9g==
X-CSE-MsgGUID: q2TC8GL0RoufsEYEnh4ykg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="280420763"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa003.jf.intel.com with ESMTP; 06 Oct 2026 08:24:44 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 585AD99; Tue, 06 Oct 2026 17:24:42 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Harald Judt <h.judt@gmx.at>,
	Lovekesh Solanki <lovekeshsolanki00@gmail.com>
Subject: [PATCH 1/5] usb: xhci: clear stale bandwidth data after hibernation
Date: Tue,  6 Oct 2026 17:24:23 +0200
Message-ID: <20261006152427.3735383-2-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261006152427.3735383-1-niklas.neronin@linux.intel.com>
References: <20261006152427.3735383-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Controllers using software managed bandwidth accounting maintain
periodic endpoint bandwidth information in struct 'xhci_interval_bw_table'.

Each root hub port owns a bandwidth table and a list of TT bandwidth
domains, where each TT has its own bandwidth table. Virtual devices
reference the bandwidth table of their current bandwidth domain through
'bw_table' or 'tt_info'.

Historically, resume from S4 re-allocated the entire xHCI driver state,
which implicitly cleared all bandwidth accounting data. After the
hibernation resume path was optimized to preserve parts of the driver
state, virtual devices and TT bandwidth information were freed and
recreated, but the root hub bandwidth tables were left intact.

As a result, stale bandwidth accounting data could remain in the root
hub bandwidth tables across hibernation resume, leading to incorrect
bandwidth calculations after devices were rediscovered.

Fix this by resetting all software bandwidth accounting state in
xhci_rh_bw_cleanup() so that resume starts with a clean bandwidth state.
This includes 'xhci->num_active_eps', which must remain consistent with
the cleared bandwidth tables.

Fixes: <2a70e5dc0301> ("usb: xhci: optimize resuming from S4 (suspend-to-disk)")
Reported-by: Harald Judt <h.judt@gmx.at>
Link: https://bugzilla.kernel.org/show_bug.cgi?id=222071
Suggested-by: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
Tested-by: Harald Judt <h.judt@gmx.at>
Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 16 +++++++++++++++-
 drivers/usb/host/xhci.c     |  1 +
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index af8d4b74c4ba..75577f441cdd 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1903,24 +1903,38 @@ EXPORT_SYMBOL_GPL(xhci_remove_secondary_interrupter);
 void xhci_rh_bw_cleanup(struct xhci_hcd *xhci)
 {
 	struct xhci_root_port_bw_info *rh_bw;
+	struct xhci_interval_bw_table *bw_table;
+	struct xhci_interval_bw *interval_bw;
 	struct xhci_tt_bw_info *tt_info, *tt_next;
 	struct list_head *eps, *ep, *ep_next;
 
 	for (int i = 0; i < xhci->max_ports; i++) {
 		rh_bw = &xhci->rh_bw[i];
 
+		rh_bw->num_active_tts = 0;
 		/* Clear and free all TT bandwidth entries */
 		list_for_each_entry_safe(tt_info, tt_next, &rh_bw->tts, tt_list) {
 			list_del(&tt_info->tt_list);
 			kfree(tt_info);
 		}
 
+		bw_table = &rh_bw->bw_table;
+		bw_table->interval0_esit_payload = 0;
+		bw_table->bw_used = 0;
+		bw_table->ss_bw_in = 0;
+		bw_table->ss_bw_out = 0;
+
 		/* Clear per-interval endpoint lists */
 		for (int j = 0; j < XHCI_MAX_INTERVAL; j++) {
-			eps = &rh_bw->bw_table.interval_bw[j].endpoints;
+			interval_bw = &bw_table->interval_bw[j];
+			eps = &interval_bw->endpoints;
 
+			interval_bw->num_packets = 0;
 			list_for_each_safe(ep, ep_next, eps)
 				list_del_init(ep);
+			interval_bw->overhead[LS_OVERHEAD_TYPE] = 0;
+			interval_bw->overhead[FS_OVERHEAD_TYPE] = 0;
+			interval_bw->overhead[HS_OVERHEAD_TYPE] = 0;
 		}
 	}
 }
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index a9e47e178c28..4708fabba84a 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1185,6 +1185,7 @@ int xhci_resume(struct xhci_hcd *xhci, bool power_lost, bool is_auto_resume)
 		for (int i = xhci->max_slots; i > 0; i--)
 			xhci_free_virt_devices_depth_first(xhci, i);
 
+		xhci->num_active_eps = 0;
 		xhci_rh_bw_cleanup(xhci);
 
 		xhci->cmd_ring_reserved_trbs = 0;
-- 
2.50.1

