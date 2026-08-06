Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85C6459ACC
	for <linux-usb@vger.kernel.org>; Thu,  6 Aug 2026 14:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786026098; cv=none; b=p9BK6CII4DgbmiHr30EaGmBoo46NAKnTRxA2WHEk9sTcmg1x1Y1zIp3Gnz/0TWM+J0+2hgNAbeNLm63YS2DbxIY7p1DY7/mNG6vUW0Fh84ZBezPMxS+eVZDh1wBiy4WQJn+nFQUnbjZi4otuOMmItqcDXu9v2HtHiYNNF5VMRJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786026098; c=relaxed/simple;
	bh=9urzM+9tKndSgj/lw5pGxyI4LhHlxbGE0UXMwD/M1Ao=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dAzg6BrFtfPw4Mqvf+b3+ZuptMZ4mPnmMS8YpHmC3AWuON0StuQzsaqOkD2JyPk064lGsg9pqn4Zigkzb67L4cc2GOg5Hk0a8CU3T3TgDfYtgHvie3mEqYwAzlb95XzJvlOa48AWb7sicvUO1aINrUtCNmNfhnNyvSeJUSMghz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UT1UUhoS; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UT1UUhoS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786026094; x=1817562094;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9urzM+9tKndSgj/lw5pGxyI4LhHlxbGE0UXMwD/M1Ao=;
  b=UT1UUhoS/FWhtNTkoVUdj5Tz20VsKLh6sARyRxpedBbkh8bzcmMmeep9
   bmIdYOkeDYf5A3lso2ApVdhPY+tD/gt84l+06NkGZ4P77WhdbhvvyCPic
   rWvQhHQG3V0RaEeizL8SirmqdtaiOmYwTzGsLSXALJ2ViGGjgGPAGo60q
   hIn5nJV1FzjKcHTU1nxUiwSYz9iSUzw62DRpOBzQwT0/HxonYzZuIGBY1
   L35h1zznS5HuPQsQz8sw3LywvhupQNvafwljqp7u9xpfSK1Q1G2Ygx1Sz
   D2wOYJF6h3+M2TKywNpnzwKhnOTVrp9Vs3+HnVlxuIprIREC1xzSgecEf
   g==;
X-CSE-ConnectionGUID: OJmzOVVrQpq8EBA1OBqJtw==
X-CSE-MsgGUID: GHsBnlKaQze5LIBM1XfMrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="97268124"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="97268124"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 07:21:30 -0700
X-CSE-ConnectionGUID: 1vFb9KGSRw2nxqrJvo7V+A==
X-CSE-MsgGUID: Q4E6wxBIR8m5bX9P3sN3cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="285500339"
Received: from amilburn-desk.amilburn-desk (HELO mnyman-desk.home) ([10.245.244.235])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 07:21:29 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	Dylan Robinson <dylan_robinson@motu.com>
Subject: [PATCH 02/17] xhci: Set frame ID field of isoc TRB when starting an isoch stream
Date: Thu,  6 Aug 2026 17:20:58 +0300
Message-ID: <20260806142113.2436238-3-mathias.nyman@linux.intel.com>
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

The frame id field can be set for the first TD of the first isoc
URB to schedule the start of an isoc stream even in host doesn't
support CFC (Contiguous Frame ID Capability)

Set the frame ID TRB field of the first isoc TD unless URB has the
schedule immediately 'URB_ISO_ASAP' transfer flag set.

cc: Dylan Robinson <dylan_robinson@motu.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 31 ++++++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index bc998692589d..3ab0d1b68d85 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -3955,6 +3955,23 @@ static int xhci_ist_microframes(struct xhci_hcd *xhci)
 	return ist;
 }
 
+
+static bool xhci_isoc_td_uses_frame_id(struct xhci_hcd *xhci, struct urb *urb,
+				       struct xhci_virt_ep *ep, int i)
+{
+	if (urb->transfer_flags & URB_ISO_ASAP)
+		return false;
+
+	if (xhci->hcc_params & HCC_CFC)
+		return true;
+
+	/* set frame id for first TD of first URB in stream */
+	if (ep->next_uframe == -1 && i == 0)
+		return true;
+
+	return false;
+}
+
 /*
  * Check if frame is in the valid frame window, including start and end.
  * If start > end then assume window wrapped around at a limit the frame
@@ -4066,7 +4083,6 @@ static int xhci_queue_isoc_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 	int i, j;
 	bool more_trbs_coming;
 	struct xhci_virt_ep *xep;
-	int frame_id;
 	int uinterval = urb->interval;
 	int start_uframe;
 
@@ -4122,12 +4138,13 @@ static int xhci_queue_isoc_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 		}
 		td = &urb_priv->td[i];
 
-		/* use SIA as default, if frame id is used overwrite it */
-		sia_frame_id = TRB_SIA;
-		if (!(urb->transfer_flags & URB_ISO_ASAP) && (xhci->hcc_params & HCC_CFC)) {
-			frame_id = (start_uframe + i * uinterval) / 8;
-			frame_id %= MAX_FRAMES;
-			sia_frame_id = TRB_FRAME_ID(frame_id);
+
+		/* Choose SIA or frame ID based scheduling for this TD */
+		if (xhci_isoc_td_uses_frame_id(xhci, urb, xep, i)) {
+			sia_frame_id = (start_uframe + i * uinterval) / 8;
+			sia_frame_id = TRB_FRAME_ID(sia_frame_id % MAX_FRAMES);
+		} else {
+			sia_frame_id = TRB_SIA;
 		}
 
 		/*
-- 
2.43.0

