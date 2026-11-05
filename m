Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793901093;
	b=bt/H9ncOJWPWOmYrmGiGOxjHWgp7/W6uFTAcLLVTBZe1Z+ZCljtN6SXCRGfE3Fphr5/2
	 1PIecsrsmmv3C9ZUrwmtEqV3C+idVFNJzPkQvVty9FbI7xDanP7cLzz9pXg6gU2mMYN2X
	 viTaXQXPl0lOLmBqj9XFf6S3mMKE0s9OULEkYflxqx6lR6SxbhLJC0uQQOEi/x22/7TV3
	 OaO4dyapEtBGw5HtuwNGJV8mckbuG6a+Wk2uP76xwp1+VdDT8axIJwkjP4qopR1cXCCsn
	 mQpzYG7kzNeIEXpak88mlDC2+/qUsC+FNmf+lXni9uZ4e20XbnvvZr6z8IY/M+acZ3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793901093;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Wd9t4EcZwRn5nF864OY+rVrV4dEyUvV3kt0Zusv00p0=;
	b=KHeur/feXfvYBYRofPhgL6xUwUOT32h534S2ErGmNGg4CcXQwjD+HPgCTyl9t5Aq+peQ
	 lExJZo+0rXS18gI7K6EcdgRGW18Kg93fjdUjgUvcZ5G4zOg+fQMcDQa4WG4inywghkXW2
	 k1lVFv+R65TWfwO2vIjxgmvUvPhch7/8nF6lM9COiNgb20p9c1zsABtvthfM4XAynr3/M
	 U77SoZUUNg81qT8e0Ltmwfr70x8HoJG3hfOhheEe5U66ZGCa8SsmxYvdIV8PeknZhOBpv
	 q9Kwy/ql03fjF1FHfbL2Zrs+pNzt/PtBsrq55vw7zXqzKxyI++81ccE43GIbXlCPg5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lUPxrmb9;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA811606A31B
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 17:51:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA811606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lUPxrmb9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793901093; x=1825437093;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fsbRzJMSn4T0l4s+6WDhChFfvAMVRzXljc4WCw0SI4M=;
  b=lUPxrmb9HFb5L+G85Qp4HnlPPCkQ7gXguzsTvHDOc+onx/Fmv1uFUSSD
   NsqEFLrJucvcwo+AvXb2I3PcdkFhHPYn/D/+hQ0dT7Z0QadGGK8y91zRt
   OxDzx84aBj94gOt47FsqvqBtUu6gFgtpS88ZHhfVi+R3C7amqjMrX0xDg
   6tg/tKjV9o0m1BxvlVO6VRZqvwq6NHEkr/rr90pmjIYY/GMxoR5W8f4kn
   9nTSno/Gi0bgT3D3ibONsH1vbXGviq13PKZ/PQxReZyRLWKr4TwjV/RBc
   02okysyYtaXHdhBeSvr5NUmDZ2QSwgKs51B7UUV4q/QCmkENv6dGvjKvX
   A==;
X-CSE-ConnectionGUID: 9nhhk9z0TUuhkY6bPMecrg==
X-CSE-MsgGUID: uOa5QPsfTGetXOVABI5ruw==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2572565"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2572565"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 09:51:32 -0800
X-CSE-ConnectionGUID: etdZvtk1QHyawj/jSLcLng==
X-CSE-MsgGUID: IC3vxdsnR7ivA/OziXzAiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7064877"
Received: from amilburn-desk.amilburn-desk (HELO mnyman-desk.home) ([10.245.244.193])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 09:51:31 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Harald Judt <h.judt@gmx.at>,
	Lovekesh Solanki <lovekeshsolanki00@gmail.com>,
	stable <stable@kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 4/5] usb: xhci: clear stale bandwidth data after hibernation
Date: Thu,  5 Nov 2026 19:51:05 +0200
Message-ID: <20261105175106.241182-5-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105175106.241182-1-mathias.nyman@linux.intel.com>
References: <20261105175106.241182-1-mathias.nyman@linux.intel.com>
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

From: Niklas Neronin <niklas.neronin@linux.intel.com>

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
Cc: stable <stable@kernel.org>
Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
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
index 94da0268b7b3..a762dd010e8d 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1185,6 +1185,7 @@ int xhci_resume(struct xhci_hcd *xhci, bool power_lost, bool is_auto_resume)
 		for (int i = xhci->max_slots; i > 0; i--)
 			xhci_free_virt_devices_depth_first(xhci, i);
 
+		xhci->num_active_eps = 0;
 		xhci_rh_bw_cleanup(xhci);
 
 		xhci->cmd_ring_reserved_trbs = 0;
-- 
2.43.0

