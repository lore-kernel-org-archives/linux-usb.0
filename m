Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA4C43D4FD
	for <linux-usb@vger.kernel.org>; Wed,  3 Jun 2026 09:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780477934; cv=none; b=WFQdIoNtpjBdXNOjjhu5Gm60CYhJghp9YX/ILztIxB0lvCSRm1dyKiBrS/3Uv45J/FZ2KGdXzKiL0PiZ9x1Mu+OxBk9gbtH3shpsBRqou+Tc5NGrP5EMY1qwZZd0NjDcV2NqGRkytfv2Cdw8h479ihtZGiWmbAB2dzETuuEarFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780477934; c=relaxed/simple;
	bh=RiklDHxmLaRlZoFeXz6O7lhJakHMW2Ldg9rwqWbZ2RE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d/yL9eoKWuNgPJY3rPwuI0jNEhKDL5KM0SkUC3BnflCxMGQvOOhNl55FmexVB2+jabAOVliH+3EJ/2RExX9EAE5tpT+LIdF/ACQBJNCuj3k38gceKWvfZgUgXarhypLHevhg5Fse2S6cfbHx1W09VEMPLKgsEEgfp85vRrxlqG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NusOb6FV; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NusOb6FV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780477933; x=1812013933;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RiklDHxmLaRlZoFeXz6O7lhJakHMW2Ldg9rwqWbZ2RE=;
  b=NusOb6FVFnT+AvUkikQUzmSYNu6Msaou9migoqLxWNUyVPCuhfeAdsd1
   r/sUJKszCnztq+YAfV54imBR3lzObJxPW9/gelKW5ogT7X5Lo2DKGH8h7
   d/tiof7+wMGPro2rX+H7pAEn8tl1KlFaLIGomF3hkPhRtj+KLVXWi9Key
   nH30YJSEI1rG/TSItC75azybSF3jesVFEpqOcTczb1Ucc+r6lXnUW6OGq
   2QFXXvM/CFydaQYpAQQjxoxFRAvV9p1z2UfrfYsxSWr46f4axtUsabwm1
   V+eiV8/iIOHHJN8UtEK7/KQ60WHd67B+UbCi7JqbDXKuvm2hwRf2ZHagr
   g==;
X-CSE-ConnectionGUID: E69uGHhkSVy2F0cYmqPrtA==
X-CSE-MsgGUID: /43e3zjHTKy/26f++n2kfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="92657628"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="92657628"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 02:12:13 -0700
X-CSE-ConnectionGUID: wsnO0fYcR5aBrLvWIraQ1w==
X-CSE-MsgGUID: AXmQ9Jf5Q46zR1AUec2MTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="244282016"
Received: from slindbla-desk.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.244.174])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 02:12:12 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 15/15] usb: xhci: allocate internal DCBAA mirror dynamically
Date: Wed,  3 Jun 2026 12:11:32 +0300
Message-ID: <20260603091132.1110849-16-mathias.nyman@linux.intel.com>
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

Allocate the internal virtual device array dynamically based on the
maximum number of slots reported by the host controller. Previously,
the array was always allocated to the absolute maximum of 255 entries.

Repurpose the 'MAX_HC_SLOTS' macro to limit the number of enabled slots.
This mirrors how the maximum number of ports and interrupters are handled.

The allocation now uses kcalloc_node(), which zeroes the memory
automatically, making the explicit memset() call unnecessary.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 14 ++++++++++++--
 drivers/usb/host/xhci.c     |  4 +---
 drivers/usb/host/xhci.h     |  9 ++++++---
 3 files changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 939151e5440e..a5e7f363922f 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1947,8 +1947,11 @@ void xhci_mem_cleanup(struct xhci_hcd *xhci)
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Freed command ring");
 	xhci_cleanup_command_queue(xhci);
 
-	for (i = xhci->max_slots; i > 0; i--)
-		xhci_free_virt_devices_depth_first(xhci, i);
+	if (xhci->devs) {
+		for (i = xhci->max_slots; i > 0; i--)
+			xhci_free_virt_devices_depth_first(xhci, i);
+		kfree(xhci->devs);
+	}
 
 	dma_pool_destroy(xhci->segment_pool);
 	xhci->segment_pool = NULL;
@@ -2005,6 +2008,7 @@ void xhci_mem_cleanup(struct xhci_hcd *xhci)
 	xhci->rh_bw = NULL;
 	xhci->port_caps = NULL;
 	xhci->interrupters = NULL;
+	xhci->devs = NULL;
 
 	xhci->usb2_rhub.bus_state.bus_suspended = 0;
 	xhci->usb3_rhub.bus_state.bus_suspended = 0;
@@ -2411,6 +2415,12 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
 
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Starting %s", __func__);
 
+	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Allocating internal virtual device array");
+	xhci->devs = kcalloc_node(xhci->max_slots + 1, sizeof(*xhci->devs), flags,
+				  dev_to_node(dev));
+	if (!xhci->devs)
+		goto fail;
+
 	xhci->dcbaa.ctx_array =
 		dma_alloc_coherent(dev, array_size(sizeof(*dcbaa->ctx_array), xhci->max_slots + 1),
 				   &dcbaa->dma, flags);
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 14d7f866f220..6922cc5496c1 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -5457,7 +5457,7 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
 	if (xhci->hci_version > 0x100)
 		xhci->hcc_params2 = readl(&xhci->cap_regs->hcc_params2);
 
-	xhci->max_slots = HCS_MAX_SLOTS(hcs_params1);
+	xhci->max_slots = min(HCS_MAX_SLOTS(hcs_params1), MAX_HC_SLOTS);
 	xhci->max_ports = min(HCS_MAX_PORTS(hcs_params1), MAX_HC_PORTS);
 	/* xhci-plat or xhci-pci might have set max_interrupters already */
 	if (!xhci->max_interrupters)
@@ -5530,8 +5530,6 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
 	init_completion(&xhci->cmd_ring_stop_completion);
 	xhci_hcd_page_size(xhci);
 
-	memset(xhci->devs, 0, MAX_HC_SLOTS * sizeof(*xhci->devs));
-
 	/* Allocate xHCI data structures */
 	retval = xhci_mem_init(xhci, GFP_KERNEL);
 	if (retval)
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index cb80acac97d4..d02046a573e4 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -33,8 +33,11 @@
 /* xHCI PCI Configuration Registers */
 #define XHCI_SBRN_OFFSET	(0x60)
 
-/* Max number of USB devices for any host controller - limit in section 6.1 */
-#define MAX_HC_SLOTS		256
+/*
+ * Max number of Devices Slots. xHCI specification section 5.3.3
+ * Valid values are in the range of 1 to 255.
+ */
+#define MAX_HC_SLOTS		255
 /*
  * Max Number of Ports. xHCI specification section 5.3.3
  * Valid values are in the range of 1 to 255.
@@ -1551,7 +1554,7 @@ struct xhci_hcd {
 	/* these are not thread safe so use mutex */
 	struct mutex mutex;
 	/* Internal mirror of the HW's dcbaa */
-	struct xhci_virt_device	*devs[MAX_HC_SLOTS];
+	struct xhci_virt_device	**devs;
 	/* For keeping track of bandwidth domains per roothub. */
 	struct xhci_root_port_bw_info	*rh_bw;
 
-- 
2.43.0

