Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A524C43CECA
	for <linux-usb@vger.kernel.org>; Wed,  3 Jun 2026 09:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780477932; cv=none; b=TekXW4lklzJt8eGA6LAkn+Tzw94g8hEOnO5j3z+ULae4RU4a8kqsYOQI1nG7/ZBBE0fI0JDI+d4GASya+E0fm0U6HtTA+v4nw5ea+leoZHVfWt76yVuvLpACptLHIvnAj2dXiVjQdxkhb6CVnqkQnEp0zPWNkxE2Maa32yYbzX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780477932; c=relaxed/simple;
	bh=895fG3jqfU4ohgLJUnBI0IuGUw3WuNZyxjgBnLRu8Sg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aw+sM8rQ658tfel89XaSRx+OTY4u8AsB8ZWXcFO6iWQ2DXBPZDRVz0w4T8kcx4rCGzRa+2JCAe7ermNhVIHzYvys1o4HYhH0RwxokMMOM7ZMinT8tfzOeikQ+LBX9tIGbr2SpBMHckzXF9LUDFvlKxCBoek9eUF/3obgA/90L4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CTT+PjSb; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CTT+PjSb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780477931; x=1812013931;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=895fG3jqfU4ohgLJUnBI0IuGUw3WuNZyxjgBnLRu8Sg=;
  b=CTT+PjSb00H5aOPg/L3vRqqXpiaC6BQIywhM2f1T05kYzjO5kaOxKTM+
   vNGXVLwBcw5+/MqACsjj1HMqtMQnB+rUxzhFLcajQxftsk7ykMT8RCPvj
   oPBcJionfbbRM2YXszcfB6qXwsT0gNesVAFrYQSRL3oMRJ9kgjLwni6QG
   uQr2avjiSFtriZaAeVWQUO4BrP6afppfNGiVGBEpq5WVsaFkIguIdgmX8
   SnAkeiBlCL942VZ7XOoKks3nKvRFZIr9W21rSt/BP6PrGe5TsWJ0oy4cT
   0ITC8ugozsd7YhOizMbXcGH92WN47ewaC9YyiWGPsYE3ME5nLMK+DSA96
   g==;
X-CSE-ConnectionGUID: QM6RK6DRR4OzxP0TFTbkig==
X-CSE-MsgGUID: U5i/Ldk8T/CyHYu3vEYSHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="92657617"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="92657617"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 02:12:11 -0700
X-CSE-ConnectionGUID: Kd+eM1glS4+/BYXRWdj9pw==
X-CSE-MsgGUID: A8tnGJLQT7SzYyCk5pU0mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="244282013"
Received: from slindbla-desk.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.244.174])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 02:12:10 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 14/15] usb: xhci: allocate DCBAA based on host controller max slots
Date: Wed,  3 Jun 2026 12:11:31 +0300
Message-ID: <20260603091132.1110849-15-mathias.nyman@linux.intel.com>
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

Allocate the Device Context Base Address Array (DCBAA) according to the
maximum number of device slots supported by the host controller, instead
of always allocating the absolute maximum of 255 entries.

The xHCI specification defines the DCBAA size as (MaxSlotsEnabled + 1)
entries. In the xhci driver there is currently no distinction between
MaxSlots and MaxSlotsEnabled, as all available slots are enabled during
initialization. As a result, 'max_slots' effectively represents both
values.

This change allows the xHCI driver to respect custom slot limits, reduces
unnecessary memory usage, and removes the obsolete "TODO" comment.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c  | 6 +++---
 drivers/usb/host/xhci-ring.c | 4 ++--
 drivers/usb/host/xhci.h      | 7 ++-----
 3 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 019dac47c5d6..939151e5440e 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1975,7 +1975,7 @@ void xhci_mem_cleanup(struct xhci_hcd *xhci)
 
 	dcbaa = &xhci->dcbaa;
 	if (dcbaa->ctx_array) {
-		dma_free_coherent(dev, array_size(sizeof(*dcbaa->ctx_array), MAX_HC_SLOTS),
+		dma_free_coherent(dev, array_size(sizeof(*dcbaa->ctx_array), xhci->max_slots + 1),
 				  dcbaa->ctx_array, dcbaa->dma);
 		dcbaa->ctx_array = NULL;
 	}
@@ -2411,8 +2411,8 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Starting %s", __func__);
 
-	dcbaa->ctx_array =
-		dma_alloc_coherent(dev, array_size(sizeof(*dcbaa->ctx_array), MAX_HC_SLOTS),
+	xhci->dcbaa.ctx_array =
+		dma_alloc_coherent(dev, array_size(sizeof(*dcbaa->ctx_array), xhci->max_slots + 1),
 				   &dcbaa->dma, flags);
 	if (!dcbaa->ctx_array)
 		goto fail;
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 3c304372bad3..4f98d8269625 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -609,7 +609,7 @@ static struct xhci_virt_ep *xhci_get_virt_ep(struct xhci_hcd *xhci,
 					     unsigned int slot_id,
 					     unsigned int ep_index)
 {
-	if (slot_id == 0 || slot_id >= MAX_HC_SLOTS) {
+	if (slot_id == 0 || slot_id > xhci->max_slots) {
 		xhci_warn(xhci, "Invalid slot_id %u\n", slot_id);
 		return NULL;
 	}
@@ -1804,7 +1804,7 @@ static void handle_cmd_completion(struct xhci_hcd *xhci,
 	struct xhci_command *cmd;
 	u32 cmd_type;
 
-	if (slot_id >= MAX_HC_SLOTS) {
+	if (slot_id > xhci->max_slots) {
 		xhci_warn(xhci, "Invalid slot_id %u\n", slot_id);
 		return;
 	}
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 9d57def08ea6..cb80acac97d4 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -792,7 +792,8 @@ struct xhci_tt_bw_info {
 
 /**
  * struct xhci_device_context_array
- * @ctx_array:	Pointer to an array of addresses
+ * @ctx_array:	Pointer to an array of addresses. The array size depends on Max
+ *		Slots read from HCSPARAMS1.
  * @dma:	DMA address to @ctx_array
  *
  * Device Context Base Address Array (DCBAA) - Section 6.1.
@@ -803,10 +804,6 @@ struct xhci_device_context_array {
 	__le64		*ctx_array;
 	dma_addr_t	dma;
 };
-/*
- * TODO: change this to be dynamically sized at HC mem init time since the HC
- * might not be able to handle the maximum number of devices possible.
- */
 
 
 struct xhci_transfer_event {
-- 
2.43.0

