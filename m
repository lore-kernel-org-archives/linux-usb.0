Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626966;
	b=CvwSxjp96Upo0ykhgDApmHQ3aGHYTKHxoe8fYKX/4te1LQngEfupDKZSZe2GSIek2tSo
	 Ewnu8uBLU9SmnkAUXrsTn0/ySe5XjnInjEUGlHSGBNDnsQMDl8zXTj1KS0eo1nwlZYFBI
	 7R/AR3U2fycaj88xqaNuUoOdKpZb09dXF02hslfPk840tu8FJO7EWldJRvRWdB7ZIoFl3
	 EZRjhnBmaVLbIoyTXuJ1Mg131uHR+LEyL8zDP/jpqcjYmfWjYj0hdQYvGtiYwZ1qChijl
	 LxKynYyHIF2kt0aM6iZ9n2kpou/mZxREVLQwu9qTIe7VeyEIei1bX4ZjcSUnvkUF9pA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626966;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YJomZ+4sKJmFur2ImfbezXcSH+olTQMcR2GZZid877M=;
	b=i8JNdQUCSaiawQMhl3U2RIcNNaZlqgLGK6NXXszkXSAJCWPO1q9Xj+NNnYJE+Rz44J/x
	 X9gk1DFlIjS+oZ1A5lyORRnYPGIvFPZV66mL43qOh1Bg+Ifu+X6ZoWPq+qFI1tCJPkiWg
	 qy0z+LKcKL1zRHDksKN0bTugFNJnWpniXsu5cLa54rh6qOHAGayf4fDBW4OssaExDh1oc
	 nz/fF7I2ryXSVnajXgM6AfiehDIEauy1fuFWhuCDETjGhmZl4jGexLdeYYkQKZ2oGM/Ar
	 N4d+/Ij0JWzQlRLdfsPyrED+fxAe1nvpdT7jwrNe4rss8RXcscU+tvrYkV1Oqw+5dGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EB48nNSY;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F7D606A911
	for <linux-usb@vger.kernel.org>; Mon,  2 Nov 2026 13:42:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1F7D606A911
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EB48nNSY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793626966; x=1825162966;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SCrs7bQP4U0G1p/tK/VypuwKHtrmOexEfF/e9x5aQEk=;
  b=EB48nNSYL+GFcuCLOjwmnQ6L6Wwv9TU21BfEVl2x03qgbAeTjhHpnrc3
   bG8nAisxh1jHIopRKLOyaLHkzvUsWT28TtXusRXAPclEomc9WkejrOyWO
   vUxInk8NoNJhGiBYpAAQBI2lDt8GXIT3Wi6IZ9njng3ctGEDYIxhASfm2
   qIow7hCwZ4aSq8Y8oCQLEaSyF5xExTGzQDgo8vSlZLGZ7vAmQBx+whAQf
   9Z6VooY+OawDmh1ZUTNQ3UNBRDLqpKd+EsTdiNXrnMUOa7iAwkjgwVjzS
   nZCJSBzCQxFL9Z4XMlP3op31bbK3DMnlGDRsma6JPKjmko4gK512bX4cI
   w==;
X-CSE-ConnectionGUID: 2koTnVlYQ3WM8xZHSqLr+A==
X-CSE-MsgGUID: hYknWOzxTjGRkaC4QqBTnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2311671"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2311671"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 05:42:45 -0800
X-CSE-ConnectionGUID: rF3kzlL/TVq/GnpWbBPK4A==
X-CSE-MsgGUID: TnourAV8QL6mLh+vv0x1Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6671566"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 02 Nov 2026 05:42:43 -0800
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id ECD8A9B; Mon, 02 Nov 2026 14:42:41 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	michal.pecio@gmail.com,
	regressions@leemhuis.info,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Harald Judt <h.judt@gmx.at>,
	Lovekesh Solanki <lovekeshsolanki00@gmail.com>
Subject: [PATCH v2 1/2] usb: xhci: clear stale bandwidth data after hibernation
Date: Mon,  2 Nov 2026 14:42:27 +0100
Message-ID: <20261102134228.584032-2-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261102134228.584032-1-niklas.neronin@linux.intel.com>
References: <20261102134228.584032-1-niklas.neronin@linux.intel.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Controllers using software managed bandwidth accounting maintain
periodic endpoint bandwidth information in struct 'xhci_interval_bw_table'.

Each root hub port owns a bandwidth table and a list of TT bandwidth
domains, where each TT has its own bandwidth table. Virtual devices
reference the bandwidth table of their current bandwidth domain through
'bw_table' or 'tt_info'.

Historically, resume from S4 reinitialized the entire xHCI driver state,
which implicitly cleared all bandwidth accounting data. After the
hibernation resume path was optimized to preserve parts of the driver
state, virtual devices and TT bandwidth information were freed and
recreated, but the root hub bandwidth tables were left intact.

As a result, stale bandwidth accounting data could remain in the root
hub bandwidth tables across hibernation resume, leading to incorrect
bandwidth calculations after devices were rediscovered.

Fix this by resetting all bandwidth accounting data in xhci_rh_bw_cleanup()
so that resume starts with a clean bandwidth state, and resetting the total
active endpoints count.

Fixes: 2a70e5dc0301 ("usb: xhci: optimize resuming from S4 (suspend-to-disk)")
Reported-by: Harald Judt <h.judt@gmx.at>
Link: https://bugzilla.kernel.org/show_bug.cgi?id=222071
Suggested-by: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
Tested-by: Harald Judt <h.judt@gmx.at>
Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
v2:
 * Fix commit message format

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
index 30ac1bc4559b..0361dfaecdd7 100644
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

