Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F0A3D47A3
	for <linux-usb@vger.kernel.org>; Tue, 28 Jul 2026 11:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785239506; cv=none; b=pm+wW4yw+vMc/w7c3/gRHeTm/JLpxLnXIvYGm1rbLQkdN8HnhLxjHGWiTrmUNn0DF1GfzTUOl4eLH/lo/6pSMBrxuLnmveUGRwMkGgrcbsQJNRgjB9TVGlbiUQaWjof7QJ6qwgdhpzLzqiDolIy5dSxLdAWxDXrnQQDmJVNsBLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785239506; c=relaxed/simple;
	bh=K7HlnrvBccx6JDCcUCKbdI5/6FJ9Q1Z+RVwpyHQgPFc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a5MVZf8E7AbzsXKw2nv767C1Y19KpGBEXJQojNjMI5WPMUPtxlxHDk85dheH7bPZxEM5rTQ3+tvGNYjuE6qhpl+OGgXOIfI8ySsBfxzC9xkCEEJyGiWC6tq/3HfP7N2f4//eNAO8b8XFI+sKDl0ssl6yjXSNkIzBjvaDC3uMHgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SVE4L+U3; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SVE4L+U3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785239505; x=1816775505;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=K7HlnrvBccx6JDCcUCKbdI5/6FJ9Q1Z+RVwpyHQgPFc=;
  b=SVE4L+U3nEzArE4FCoEWIkBvQvY2XWI/vaKZKB9JvFReN+JB7Qt/rbIA
   J1ia14q/fmK4XzyNddaY4prBgu51z7wcb1DFP/z7KJep3MkEQP2z3bs1h
   /QbSlyyYe3Kzka18pz1LFK+JEOXDydDpbe6Tcp94VhG80iG02a3Kk39Lx
   zmcYhYOQvOTMSE3kwtwbL6f7udpVKQ5zGpCFt2V2Z7WBGpuqTP2etXvwU
   xQLYOskvpHM+/vFwEGQPVNB9l2eIZyJ5teIQL8sNk2IUhaHjODlHwCC5e
   qwi8UR5MAUMV+yXioLrVwMCT4ruJ7/EG3/Mg/9IEPgQRg5U1j1749zMdz
   w==;
X-CSE-ConnectionGUID: oDdZGKcXRqGouOQ6f/kynw==
X-CSE-MsgGUID: ibzMDunERVyFnUeNTou+zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="103227208"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="103227208"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 04:51:44 -0700
X-CSE-ConnectionGUID: iUZizyUKQh2vOMSNGbUkzQ==
X-CSE-MsgGUID: 4O1UxvgzQiWWypuxdpj1xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="263991657"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa005.jf.intel.com with ESMTP; 28 Jul 2026 04:51:43 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 565209B; Tue, 28 Jul 2026 13:51:41 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 1/5] thunderbolt: stream: Restore consumer if copying from iter fails
Date: Tue, 28 Jul 2026 13:51:37 +0200
Message-ID: <20260728115141.2585464-2-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260728115141.2585464-1-mika.westerberg@linux.intel.com>
References: <20260728115141.2585464-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In tbstream_dev_alloc_tx() if copying data from iterator fails we leave
the consumer pointer as is wasting one entry in the ring. Fix this by
restoring the consumer back in case of failure.

Fixes: 6db21d817b43 ("thunderbolt: Add support for USB4STREAM")
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/stream.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/stream.c b/drivers/thunderbolt/stream.c
index c1f5c55583d0..279a0cfc2ac8 100644
--- a/drivers/thunderbolt/stream.c
+++ b/drivers/thunderbolt/stream.c
@@ -512,8 +512,10 @@ tbstream_dev_alloc_tx(struct tbstream_dev *sdev, enum tbstream_frame_pdf pdf,
 	dma_sync_single_for_cpu(dma_dev, sf->frame.buffer_phy, size,
 				DMA_TO_DEVICE);
 	if (pdf == TBSTREAM_DATA) {
-		if (copy_page_from_iter(sf->page, 0, size, from) != size)
+		if (copy_page_from_iter(sf->page, 0, size, from) != size) {
+			sdev->tx_ring.cons--;
 			return ERR_PTR(-EFAULT);
+		}
 	} else {
 		memset(page_address(sf->page), 0, size);
 	}
-- 
2.50.1

