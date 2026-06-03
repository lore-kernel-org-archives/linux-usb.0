Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DC143CEE7
	for <linux-usb@vger.kernel.org>; Wed,  3 Jun 2026 09:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780477931; cv=none; b=jFFayPpboaM5xuSwN1Ppi4CuOIPlXwAee8yCKrqzmGWL6zFd14ZgJf7sqNP3kaJqSK6gqJpLGh1KhNaNiFhF+q7xSBiMfYB2syIVpH3gTFAE3HFCipB7xRCT1trGfPXgqy1+N0krVQ4kE87X3KcQFryiXCg+/ShuHvGhg+FRQAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780477931; c=relaxed/simple;
	bh=k0v7v+JG+LQuALq6uojh7S9H/T4HKbGOHWMPFB5qqMY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W1AcXPLaULn0UKSrvDI23PRgXREqKtsJyCuX7p/lXiGD9LLp4+zFWEv8X1XYTwLZOI/KQTmkySz5RLgpZGpDVsx9xrkdeibH++ny24hHTS17NxVXKRhyR8IlGW3ERcMeLlv1IQ2Ykkon7alilft9GaFsPDM86D3nrL/tS4ujUSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eH0xBEok; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eH0xBEok"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780477930; x=1812013930;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=k0v7v+JG+LQuALq6uojh7S9H/T4HKbGOHWMPFB5qqMY=;
  b=eH0xBEoklHtpdZPsE2zLcv39CTlZO71f1wDFhReiTbdtRRFK2uUB3ald
   uriNmR1XzLE3hcy+nGifj9+r8EGeUh8IG3JfMOkzsh2s8SXZgTHYFp/np
   fb+trLTASNR5bXS+g5Yu2EnZqVsOlDhm3RDt1lPYxWQ6HmA/867NGrM59
   tQZYs4Yv85bfhCxoYAJwxQ3m7PVxBM7rHj6mIE375hoP1kf1GhE5pQ3fk
   LdwZDKMHd8Ngnp6YPO+9CFMnjU49pT4ZPtD9KKjgqufDBk3Cx1duoV3WU
   HQifecZQBq9AqWxylFpCi368+HD2A7DoUrwbELr3X9x0IxDv4kPNgpN0r
   w==;
X-CSE-ConnectionGUID: L6/iGPCdS2ewIRVGP+nvEQ==
X-CSE-MsgGUID: OseY4YO0RJuwoKXMGOwmVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="92657612"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="92657612"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 02:12:09 -0700
X-CSE-ConnectionGUID: hsWv86vPRdGrsIq+wq098A==
X-CSE-MsgGUID: 1cam5SSYQh2wDKcIRg/7jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="244282007"
Received: from slindbla-desk.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.244.174])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 02:12:09 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 13/15] usb: xhci: refactor DCBAA struct
Date: Wed,  3 Jun 2026 12:11:30 +0300
Message-ID: <20260603091132.1110849-14-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603091132.1110849-1-mathias.nyman@linux.intel.com>
References: <20260603091132.1110849-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Niklas Neronin <niklas.neronin@linux.intel.com>

Embed the 'xhci_device_context_array' structure directly within 'xhci_hcd'
instead of allocating it as a separate block. Only the array of device
context addresses is now allocated separately.

Since the device context addresses are no longer part of an array
structure, rename 'dev_context_ptrs' to 'ctx_array' for clearer access
semantics.

Also remove the redundant comment next to the 'ctx_array' allocation;
using dma_alloc_coherent() for 64-bit * N allocations guarantees both
physically contiguous and properly aligned for 64-byte boundaries.
The xHCI section (5.4.6) refers to DCBAAP instead of DCBAA (6.1).

This change does not modify the number of host controller slots but
simplifies memory management and prepares the driver for a variable number
of HC slots in the future.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c  | 40 ++++++++++++++++++------------------
 drivers/usb/host/xhci-ring.c |  2 +-
 drivers/usb/host/xhci.c      |  6 +++---
 drivers/usb/host/xhci.h      | 13 +++++++-----
 4 files changed, 32 insertions(+), 29 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 289461c06bf9..019dac47c5d6 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -877,8 +877,8 @@ void xhci_free_virt_device(struct xhci_hcd *xhci, struct xhci_virt_device *dev,
 
 	/* If device ctx array still points to _this_ device, clear it */
 	if (dev->out_ctx &&
-	    xhci->dcbaa->dev_context_ptrs[slot_id] == cpu_to_le64(dev->out_ctx->dma))
-		xhci->dcbaa->dev_context_ptrs[slot_id] = 0;
+	    xhci->dcbaa.ctx_array[slot_id] == cpu_to_le64(dev->out_ctx->dma))
+		xhci->dcbaa.ctx_array[slot_id] = 0;
 
 	trace_xhci_free_virt_device(dev);
 
@@ -1016,11 +1016,11 @@ int xhci_alloc_virt_device(struct xhci_hcd *xhci, int slot_id,
 	dev->udev = udev;
 
 	/* Point to output device context in dcbaa. */
-	xhci->dcbaa->dev_context_ptrs[slot_id] = cpu_to_le64(dev->out_ctx->dma);
+	xhci->dcbaa.ctx_array[slot_id] = cpu_to_le64(dev->out_ctx->dma);
 	xhci_dbg(xhci, "Set slot id %d dcbaa entry %p to 0x%llx\n",
 		 slot_id,
-		 &xhci->dcbaa->dev_context_ptrs[slot_id],
-		 le64_to_cpu(xhci->dcbaa->dev_context_ptrs[slot_id]));
+		 &xhci->dcbaa.ctx_array[slot_id],
+		 le64_to_cpu(xhci->dcbaa.ctx_array[slot_id]));
 
 	trace_xhci_alloc_virt_device(dev);
 
@@ -1671,7 +1671,7 @@ static int scratchpad_alloc(struct xhci_hcd *xhci, gfp_t flags)
 	if (!xhci->scratchpad->sp_buffers)
 		goto fail_sp3;
 
-	xhci->dcbaa->dev_context_ptrs[0] = cpu_to_le64(xhci->scratchpad->sp_dma);
+	xhci->dcbaa.ctx_array[0] = cpu_to_le64(xhci->scratchpad->sp_dma);
 	for (i = 0; i < num_sp; i++) {
 		dma_addr_t dma;
 		void *buf = dma_alloc_coherent(dev, xhci->page_size, &dma,
@@ -1927,6 +1927,7 @@ void xhci_rh_bw_cleanup(struct xhci_hcd *xhci)
 void xhci_mem_cleanup(struct xhci_hcd *xhci)
 {
 	struct device	*dev = xhci_to_hcd(xhci)->self.sysdev;
+	struct xhci_device_context_array *dcbaa;
 	int i;
 
 	cancel_delayed_work_sync(&xhci->cmd_timer);
@@ -1972,10 +1973,12 @@ void xhci_mem_cleanup(struct xhci_hcd *xhci)
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
 			"Freed medium stream array pool");
 
-	if (xhci->dcbaa)
-		dma_free_coherent(dev, sizeof(*xhci->dcbaa),
-				xhci->dcbaa, xhci->dcbaa->dma);
-	xhci->dcbaa = NULL;
+	dcbaa = &xhci->dcbaa;
+	if (dcbaa->ctx_array) {
+		dma_free_coherent(dev, array_size(sizeof(*dcbaa->ctx_array), MAX_HC_SLOTS),
+				  dcbaa->ctx_array, dcbaa->dma);
+		dcbaa->ctx_array = NULL;
+	}
 
 	scratchpad_free(xhci);
 
@@ -2403,23 +2406,20 @@ EXPORT_SYMBOL_GPL(xhci_create_secondary_interrupter);
 
 int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 {
-	struct device	*dev = xhci_to_hcd(xhci)->self.sysdev;
-	dma_addr_t	dma;
+	struct device *dev = xhci_to_hcd(xhci)->self.sysdev;
+	struct xhci_device_context_array *dcbaa = &xhci->dcbaa;
 
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Starting %s", __func__);
 
-	/*
-	 * xHCI section 5.4.6 - Device Context array must be
-	 * "physically contiguous and 64-byte (cache line) aligned".
-	 */
-	xhci->dcbaa = dma_alloc_coherent(dev, sizeof(*xhci->dcbaa), &dma, flags);
-	if (!xhci->dcbaa)
+	dcbaa->ctx_array =
+		dma_alloc_coherent(dev, array_size(sizeof(*dcbaa->ctx_array), MAX_HC_SLOTS),
+				   &dcbaa->dma, flags);
+	if (!dcbaa->ctx_array)
 		goto fail;
 
-	xhci->dcbaa->dma = dma;
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
 		       "Device context base array address = %pad (DMA), %p (virt)",
-		       &xhci->dcbaa->dma, xhci->dcbaa);
+		       &dcbaa->dma, dcbaa->ctx_array);
 
 	/*
 	 * Initialize the ring segment pool.  The ring must be a contiguous
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 83209db29962..3c304372bad3 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -1613,7 +1613,7 @@ static void xhci_handle_cmd_disable_slot(struct xhci_hcd *xhci, int slot_id,
 		/* Delete default control endpoint resources */
 		xhci_free_device_endpoint_resources(xhci, virt_dev, true);
 	if (cmd_comp_code == COMP_SUCCESS) {
-		xhci->dcbaa->dev_context_ptrs[slot_id] = 0;
+		xhci->dcbaa.ctx_array[slot_id] = 0;
 		xhci->devs[slot_id] = NULL;
 	}
 }
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 0646fedf2042..14d7f866f220 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -551,7 +551,7 @@ static void xhci_init(struct usb_hcd *hcd)
 	xhci_set_cmd_ring_deq(xhci);
 
 	/* Set Device Context Base Address Array pointer */
-	xhci_write_64(xhci, xhci->dcbaa->dma, &xhci->op_regs->dcbaa_ptr);
+	xhci_write_64(xhci, xhci->dcbaa.dma, &xhci->op_regs->dcbaa_ptr);
 
 	/* Set Doorbell array pointer */
 	xhci_set_doorbell_ptr(xhci);
@@ -4457,9 +4457,9 @@ static int xhci_setup_device(struct usb_hcd *hcd, struct usb_device *udev,
 	xhci_dbg_trace(xhci, trace_xhci_dbg_address,
 		"Slot ID %d dcbaa entry @%p = %#016llx",
 		udev->slot_id,
-		&xhci->dcbaa->dev_context_ptrs[udev->slot_id],
+		&xhci->dcbaa.ctx_array[udev->slot_id],
 		(unsigned long long)
-		le64_to_cpu(xhci->dcbaa->dev_context_ptrs[udev->slot_id]));
+		le64_to_cpu(xhci->dcbaa.ctx_array[udev->slot_id]));
 	xhci_dbg_trace(xhci, trace_xhci_dbg_address,
 			"Output Context DMA address = %#08llx",
 			(unsigned long long)virt_dev->out_ctx->dma);
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index e73c498449e8..9d57def08ea6 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -792,12 +792,15 @@ struct xhci_tt_bw_info {
 
 /**
  * struct xhci_device_context_array
- * @dev_context_ptr	array of 64-bit DMA addresses for device contexts
+ * @ctx_array:	Pointer to an array of addresses
+ * @dma:	DMA address to @ctx_array
+ *
+ * Device Context Base Address Array (DCBAA) - Section 6.1.
+ * ctx_array[0]:		Scratchpad Buffer Array Base Address
+ * ctx_array[1-MaxSlots]:	Device Context Base Address
  */
 struct xhci_device_context_array {
-	/* 64-bit device addresses; we only write 32-bit addresses */
-	__le64			dev_context_ptrs[MAX_HC_SLOTS];
-	/* private xHCD pointers */
+	__le64		*ctx_array;
 	dma_addr_t	dma;
 };
 /*
@@ -1531,7 +1534,7 @@ struct xhci_hcd {
 	/* optional reset controller */
 	struct reset_control *reset;
 	/* data structures */
-	struct xhci_device_context_array *dcbaa;
+	struct xhci_device_context_array	dcbaa;
 	struct xhci_interrupter **interrupters;
 	struct xhci_ring	*cmd_ring;
 	unsigned int            cmd_ring_state;
-- 
2.43.0

