Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E45641A933
	for <linux-usb@vger.kernel.org>; Thu,  6 Aug 2026 14:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786026109; cv=none; b=ellZvvweBy7QaWLyi6SjjBeizBCz+02gCt/Gk+Rsu3blskkSAD26ucY5iywM2MnIzoBCI/WVAkeT2BZbNr4bnJmHVJG05516NA/0R2oBRRZ5/nnsGBL4DshKH0Q7pgj9HegVzf/zWHxwh/bjgmv2YuWdhtgihWiNYfjyb0mq3Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786026109; c=relaxed/simple;
	bh=vLASXcSaE68zhDGPcrmvgzq8WUIsMjndiPYBahhw5pQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nIwDRyAIXkf746jgLT6wYhMlJCtng4iNS3GAiZ/55tDTt73JHnUUFG163tGKczm73Z4xithcRB2a43Tfd8rfZDg0NmXuVUHzZT205dl4IXluXMmFnUFps17VMs5NTuBhVAznsTpfyTtdwKBKcqod9MdZ5drkXZpIkzIgFSj6gcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ibkTUB8Y; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ibkTUB8Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786026108; x=1817562108;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vLASXcSaE68zhDGPcrmvgzq8WUIsMjndiPYBahhw5pQ=;
  b=ibkTUB8YaLECSaY63YCkcZ9YaIwKmdbmUDmcHeeHzJOOfoNPrFv219Xt
   jXsvdxawMABnOEIeQENPrTQ2ZYD8zbidOJG8E9yW8aEShwXMXFPuPStUV
   l2bCt7z56GLD1Kbawtl4XgZcALAHXf40b2uinD0b1CN0VBbuC0TtjPli6
   A8sNVhNIvPq6RP93+j5mOi7/zZ/DipI5rGSnewEDyZWJFqYfz+YiNHOjN
   baXRn1S/aOtZMIHzZDFeCBps2LrJn96cvUvOqCpnOY2A78Us/iXxcwzYa
   JxUqK461MfYm6NecY55vEw/R8NkqUoCa8uGdbNul/1+3rk4jy0hPkLLnz
   Q==;
X-CSE-ConnectionGUID: i5h8oeaIRyOaZ0XR7d/7BQ==
X-CSE-MsgGUID: UlFValOwQO2nYXZ1q1ifcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="97268192"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="97268192"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 07:21:47 -0700
X-CSE-ConnectionGUID: ixj8hs6HQrGH1LnJZARV9g==
X-CSE-MsgGUID: 0rkRC2DNQqyqrBezPxR29w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="285500500"
Received: from amilburn-desk.amilburn-desk (HELO mnyman-desk.home) ([10.245.244.235])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 07:21:46 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 13/17] usb: xhci: remove redundant function wrapper
Date: Thu,  6 Aug 2026 17:21:09 +0300
Message-ID: <20260806142113.2436238-14-mathias.nyman@linux.intel.com>
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

From: Niklas Neronin <niklas.neronin@linux.intel.com>

The function ring_doorbell_for_active_rings() rings the doorbell
for any rings with pending URBs. It has a trivial wrapper,
xhci_ring_doorbell_for_active_rings(), which takes the same
arguments and simply calls the former.

Since the wrapper adds no functionality, remove it and rename
ring_doorbell_for_active_rings() to xhci_ring_doorbell_for_active_rings().

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 80d53acc37fd..21ef7284e957 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -575,9 +575,8 @@ void xhci_ring_ep_doorbell(struct xhci_hcd *xhci,
 }
 
 /* Ring the doorbell for any rings with pending URBs */
-static void ring_doorbell_for_active_rings(struct xhci_hcd *xhci,
-		unsigned int slot_id,
-		unsigned int ep_index)
+void xhci_ring_doorbell_for_active_rings(struct xhci_hcd *xhci, unsigned int slot_id,
+					 unsigned int ep_index)
 {
 	unsigned int stream_id;
 	struct xhci_virt_ep *ep;
@@ -600,13 +599,6 @@ static void ring_doorbell_for_active_rings(struct xhci_hcd *xhci,
 	}
 }
 
-void xhci_ring_doorbell_for_active_rings(struct xhci_hcd *xhci,
-		unsigned int slot_id,
-		unsigned int ep_index)
-{
-	ring_doorbell_for_active_rings(xhci, slot_id, ep_index);
-}
-
 static struct xhci_virt_ep *xhci_get_virt_ep(struct xhci_hcd *xhci,
 					     unsigned int slot_id,
 					     unsigned int ep_index)
@@ -1303,7 +1295,7 @@ static void xhci_handle_cmd_stop_ep(struct xhci_hcd *xhci, int slot_id,
 
 	/* Otherwise ring the doorbell(s) to restart queued transfers */
 	xhci_giveback_invalidated_tds(ep);
-	ring_doorbell_for_active_rings(xhci, slot_id, ep_index);
+	xhci_ring_doorbell_for_active_rings(xhci, slot_id, ep_index);
 }
 
 static void xhci_kill_ring_urbs(struct xhci_hcd *xhci, struct xhci_ring *ring)
@@ -1546,13 +1538,13 @@ static void xhci_handle_cmd_set_deq(struct xhci_hcd *xhci, int slot_id,
 			 __func__);
 		xhci_invalidate_cancelled_tds(ep);
 		/* Try to restart the endpoint if all is done */
-		ring_doorbell_for_active_rings(xhci, slot_id, ep_index);
+		xhci_ring_doorbell_for_active_rings(xhci, slot_id, ep_index);
 		/* Start giving back any TDs invalidated above */
 		xhci_giveback_invalidated_tds(ep);
 	} else {
 		/* Restart any rings with pending URBs */
 		xhci_dbg(ep->xhci, "%s: All TDs cleared, ring doorbell\n", __func__);
-		ring_doorbell_for_active_rings(xhci, slot_id, ep_index);
+		xhci_ring_doorbell_for_active_rings(xhci, slot_id, ep_index);
 	}
 }
 
@@ -1587,7 +1579,7 @@ static void xhci_handle_cmd_reset_ep(struct xhci_hcd *xhci, int slot_id,
 
 	/* if this was a soft reset, then restart */
 	if ((le32_to_cpu(trb->generic.field[3])) & TRB_TSP)
-		ring_doorbell_for_active_rings(xhci, slot_id, ep_index);
+		xhci_ring_doorbell_for_active_rings(xhci, slot_id, ep_index);
 }
 
 static void xhci_handle_cmd_enable_slot(int slot_id, struct xhci_command *command,
-- 
2.43.0

