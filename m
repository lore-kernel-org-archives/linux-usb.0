Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B790D3D6689
	for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 09:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788167117; cv=none; b=qvpyINhvbHa2q72xgyn2fBwOB9BZLHheIJRZJhpQ70IpGdWOwISaxu3R3Up7PpjpAJal+2UtAKVjA382n2ekf2rpuTuI6F6M25BcvWlsxteradxnHK2ptzYh6Al9EhhtYMGJGAEC8/QsAnD01XMZoGo4fJjPjI8Doq1p+vlu7e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788167117; c=relaxed/simple;
	bh=toMuFw2vTBcEio7hY5itfk1jYQdj1/A9Kc6SMf423RI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oEGOGhLBFvC3gILYDAH/MJY5zG/eNRLDoLR5xiQPUo4Si1/umbMW36CP3t3J76nqo8Ho4ZhGd+xL74s4iFLORlei5xN4hNtfRR6BYTgi/x1jXopEPiBQpL4aX8Qa9R91wOZypc6lby4RANYJQL7lLmGbRQ5bHVh63dHuKPT8VCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GUpXDwuR; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GUpXDwuR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788167116; x=1819703116;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=toMuFw2vTBcEio7hY5itfk1jYQdj1/A9Kc6SMf423RI=;
  b=GUpXDwuRV6rXISqU2+iswxrVa/P2aa4G95RdV1KAxD5jhmtxAIC+0xHM
   nM3rmuoh173w9DHPKYWdvvZT6miZ3B2yo+XXkwV+0c4YJ5KrGIfhHQfy1
   KNsEOcDCaS1rwgV68/1LpSLNfcOnB3lIMaVL60quMrQwQffwfh8ZHY5ab
   +FxbdAlHwMFKHxb7xZcwtBYYLb9i231ONDBjSAfeucJJalclre6fckiAj
   f0fpQSGqcjHcX3cvh/RYG03l+C9zxNx63gk6t/bxAS1voKkhN/9JkkN0v
   ZgG1rjRPUBDV+Gqx4ogdMxMtGy5cZatGJCQSJ0EtGzbozeHS39WNXmY0P
   g==;
X-CSE-ConnectionGUID: /+tKFe6IRV2XdgjcHcwyhA==
X-CSE-MsgGUID: W+ShvGB4TYmtQQB+7BaSEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="105944715"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="105944715"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 02:05:16 -0700
X-CSE-ConnectionGUID: Yo8f18g2QnGhTnmPlDxbew==
X-CSE-MsgGUID: e2cH1IzsQLGE5Bq2uU92OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="266941544"
Received: from slindbla-desk.ger.corp.intel.com (HELO mnyman-desk.home) ([10.245.244.13])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 02:05:14 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 1/3] usb: xhci: Fix HCS_ERST_MAX conversion
Date: Mon, 31 Aug 2026 12:04:46 +0300
Message-ID: <20260831090448.95644-2-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831090448.95644-1-mathias.nyman@linux.intel.com>
References: <20260831090448.95644-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chen-Yu Tsai <wenst@chromium.org>

This fixes one broken line in commit 6d45e9556d4a ("usb: xhci: standardize
multi bit-field macros") included in 7.3-rc1 kernel

HCS_ERST_MAX holds power of 2 value for maximum number of segments.
In the culprit commit, this was incorrectly converted to "shift up 2".
On hardware where this field is zero, this results in xhci_alloc_erst()
calling dma_alloc_coherent() with size = 0, leading to a horrible splat
and non-usable XHCI.

Revert the shift-up-2 to the BIT() macro.

Fixes: 6d45e9556d4a ("usb: xhci: standardize multi bit-field macros")
Cc: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 7a21ac81f9c8..af8d4b74c4ba 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2301,7 +2301,7 @@ xhci_alloc_interrupter(struct xhci_hcd *xhci, unsigned int segs, gfp_t flags)
 	if (!segs)
 		segs = ERST_DEFAULT_SEGS;
 
-	max_segs = FIELD_GET(HCS_ERST_MAX, xhci->hcs_params2) << 2;
+	max_segs = BIT(FIELD_GET(HCS_ERST_MAX, xhci->hcs_params2));
 	segs = min(segs, max_segs);
 
 	ir = kzalloc_node(sizeof(*ir), flags, dev_to_node(dev));
-- 
2.43.0

