Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8590849C4C7
	for <linux-usb@vger.kernel.org>; Tue,  6 Oct 2026 15:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791300288; cv=none; b=WpbgnG1JynzvvnYpnqAPY4LO+MCPTbTGp0T6ckVZdRDcVRg0OmNwItwnQO0BFUcsGRBt1T0auvlp+y4EXQqxKC5OzdQfZRvMVEp7bQb+ckhQPab5I7bEW/omLjkzSAMOJ7himfNdkFOOp48xOe8bePINK7v1Dx3b3ue2WNU04T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791300288; c=relaxed/simple;
	bh=hTw2DP7GVhbVD1AUMYa3hTGp3NrfLCPdZoA+lfcfb2s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sdPPzcm4thUkg5dtI1g/k7FovRuJnNZ2G7XFSWLkya+kSCLjJTFmWFWf1CQR+pxxoIywJjYfFg0MgyIa8XAFesFjkBWzvOG3Wmpd4eK4xpu89RpwIpXyGV2PJHiJZ97xfm/UohSl47inkp14nwfe6pH/M18WRVp3cl6tuLEYMPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XO2ij6+Q; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XO2ij6+Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791300288; x=1822836288;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hTw2DP7GVhbVD1AUMYa3hTGp3NrfLCPdZoA+lfcfb2s=;
  b=XO2ij6+QqvKouXjx3fddZbxVwJn0qszQ0w3yoFGQ6YZvKgl26LRJDv+U
   BpiJnQxILbO3ZnjLc2gEl9//DYH7Y3sf3vu7JfW2LzMDNQr0JiRok9SDM
   aOed+4/FlG+OmUVvHR31ud697+RfRn3gZRA3te646ZenhPC/ku0voU4E5
   HyzP1S1BsULIEiFYVgHFcZYMe8jQYtSWy2apEm6St8ewlcpuyVavfyHi8
   rUcHzaMONeWC1O+L7KfO3SSQIaAJ4sPelVGe3649nxAlqUNNkk9JUkcvp
   Lci83jY10UFFdTzW+2KMtqP84RrosQmJf1c7uWKKYpNrej0kQrIUxdE2q
   g==;
X-CSE-ConnectionGUID: mXF0zQTgR5iIzNH+0lBVXw==
X-CSE-MsgGUID: xFmjRJuLSVCZuk0pW46BMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="43707"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="43707"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 08:24:45 -0700
X-CSE-ConnectionGUID: 8lwaCcPuTyOh3BPGQ2HaWw==
X-CSE-MsgGUID: bsUnxHyJRQCRz90E0YLMng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="280420770"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa003.jf.intel.com with ESMTP; 06 Oct 2026 08:24:45 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 655889D; Tue, 06 Oct 2026 17:24:43 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 3/5] usb: xhci: remove redundant TT active EP update from xhci_free_virt_device()
Date: Tue,  6 Oct 2026 17:24:25 +0200
Message-ID: <20261006152427.3735383-4-niklas.neronin@linux.intel.com>
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

Function xhci_free_virt_device() saves 'tt_info->active_eps' and later
calls xhci_update_tt_active_eps().

However, xhci_update_tt_active_eps() only updates TT accounting when the
number of active endpoints changes. xhci_free_virt_device() does not add
or remove endpoints and therefore leaves 'tt_info->active_eps' unchanged.
As a result, the call to xhci_update_tt_active_eps() never modifies any
state.

Remove the unused active endpoint tracking and the redundant call.

In cases where virtual devices are freed without first dropping their
endpoints, xhci_rh_bw_cleanup() resets all bandwidth accounting data,
making the update unnecessary.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 75577f441cdd..d665cad22c10 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -870,7 +870,6 @@ void xhci_free_virt_device(struct xhci_hcd *xhci, struct xhci_virt_device *dev,
 		int slot_id)
 {
 	int i;
-	int old_active_eps = 0;
 
 	/* Slot ID 0 is reserved */
 	if (slot_id == 0 || !dev)
@@ -883,9 +882,6 @@ void xhci_free_virt_device(struct xhci_hcd *xhci, struct xhci_virt_device *dev,
 
 	trace_xhci_free_virt_device(dev);
 
-	if (dev->tt_info)
-		old_active_eps = dev->tt_info->active_eps;
-
 	for (i = 0; i < 31; i++) {
 		if (dev->eps[i].ring)
 			xhci_ring_free(xhci, dev->eps[i].ring);
@@ -908,8 +904,6 @@ void xhci_free_virt_device(struct xhci_hcd *xhci, struct xhci_virt_device *dev,
 	}
 	/* If this is a hub, free the TT(s) from the TT list */
 	xhci_free_tt_info(xhci, dev, slot_id);
-	/* If necessary, update the number of active TTs on this root port */
-	xhci_update_tt_active_eps(xhci, dev, old_active_eps);
 
 	if (dev->in_ctx)
 		xhci_free_container_ctx(xhci, dev->in_ctx);
-- 
2.50.1

