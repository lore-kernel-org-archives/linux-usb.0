Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D378B49BD7C
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 09:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791539940; cv=none; b=TygLN9epZuXCwRIhieUGAOp4Fvnel+0GhUsnPX168qHSRfm3H0okVJDrGpeFkg0lntSDIV7DTD0Bppo/ZiWSU6tLh3l2w2ejBTSRvS727ny9eePozxLREmogokewBjhUeg/pdCUXiHVUlHT2PheM7AqF03niMjdn1ucA+WnUh5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791539940; c=relaxed/simple;
	bh=T9vh4XgXY5BM9u+Qh8JSUZ3DQrF45ZNFFlr6ztu7dzk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FLrv3VRPKLQV3vJxrqsxajDLqcSq+of7+NnSjxeWUdEq85qD8XvMVaYfLbJ4UOhKEq1h3Q5CLR9nTPNcyoZNmq0z6BIYew/Iu85+IUxrvtQDgjZ43bLXV3WrqiIdk02Nk/2s+OUy4hvon3zqqSlFKcPOtOixMdXxrpzgsCR+Bvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O4fCyMfL; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O4fCyMfL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791539939; x=1823075939;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=T9vh4XgXY5BM9u+Qh8JSUZ3DQrF45ZNFFlr6ztu7dzk=;
  b=O4fCyMfL78sRUkdbz4D4fAmAibpqxMQ+r1rAceoSlj5qSx9fkk+xV2aT
   6PuBnFn72BhKPBUOQFjMzszPXXBYP5DbtzfNmo9SccfFKInmJ9RWuEhUz
   Z8RaxqIVERGnh1WHpOSTMYN2BoRu8ps1Teq3W5jehM1otIoLcBRk/hcOX
   MBH8w3OU1fRGhI8A+1bgmmqbEWs25x1jVFnBX5qvtK+XqAvv63YARF/zo
   5HrC5xM3ZM5Ro5j4nXUViu9Z6/rVge5/vHBEUkjwYsrDndXyqG4RGTUib
   C84IvvYdtvXjcDepAMW+oUHwgGOjcU6p3yEndf0W6UyVfi6IUfYlxJ/3Z
   w==;
X-CSE-ConnectionGUID: iMJcuQf6T+q1dsTFWZdo5g==
X-CSE-MsgGUID: X7Y2cvo+SteZJf2W/oxVWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="224106"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="224106"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 02:58:59 -0700
X-CSE-ConnectionGUID: 3eQUR6XgRsOeIn6QDFibxA==
X-CSE-MsgGUID: ec6ZilOARt2awxiY9r/g8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="613340"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.244.17])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 02:58:57 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Zain Aboobacker <zainaboobacker33@gmail.com>,
	Mathias Nyman <mathias.nyman@intel.com>
Subject: [PATCH 04/14] usb: xhci: fix typos in comments
Date: Fri,  9 Oct 2026 12:58:24 +0300
Message-ID: <20261009095834.561578-5-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009095834.561578-1-mathias.nyman@linux.intel.com>
References: <20261009095834.561578-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zain Aboobacker <zainaboobacker33@gmail.com>

Fix various spelling mistakes in comments found by codespell.

Assisted-by: Claude:claude-opus-5-5 codespell
Signed-off-by: Zain Aboobacker <zainaboobacker33@gmail.com>
Signed-off-by: Mathias Nyman <mathias.nyman@intel.com>
---
 drivers/usb/host/xhci-ring.c | 14 +++++++-------
 drivers/usb/host/xhci.c      | 14 +++++++-------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 82dd93c2afdd..cbce9f8f07fa 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -243,7 +243,7 @@ static void inc_enq_past_link(struct xhci_hcd *xhci, struct xhci_ring *ring, u32
 		 * fixed in the 0.96 specification errata, but we have to assume that all 0.95
 		 * xHCI hardware can't handle the chain bit being cleared on a link TRB.
 		 *
-		 * On 0.95 and some 0.96 HCs the chain bit is set once at segment initalization
+		 * On 0.95 and some 0.96 HCs the chain bit is set once at segment initialization
 		 * and never changed here. On all others, modify it as requested by the caller.
 		 */
 		if (!xhci_link_chain_quirk(xhci, ring->type)) {
@@ -663,7 +663,7 @@ struct xhci_ring *xhci_triad_to_transfer_ring(struct xhci_hcd *xhci,
  * Get the hw dequeue pointer xHC stopped on, either directly from the
  * endpoint context, or if streams are in use from the stream context.
  * The returned hw_dequeue contains the lowest four bits with cycle state
- * and possbile stream context type.
+ * and possible stream context type.
  */
 static u64 xhci_get_hw_deq(struct xhci_hcd *xhci, struct xhci_virt_device *vdev,
 			   unsigned int ep_index, unsigned int stream_id)
@@ -991,7 +991,7 @@ static int xhci_handle_halted_endpoint(struct xhci_hcd *xhci,
 	int err;
 
 	/*
-	 * Avoid resetting endpoint if link is inactive or device disonnected.
+	 * Avoid resetting endpoint if link is inactive or device disconnected.
 	 * Can cause host hang.
 	 * Device will be reset to recover an inactive link, so don't do anything
 	 */
@@ -1386,7 +1386,7 @@ static void xhci_kill_endpoint_urbs(struct xhci_hcd *xhci,
  * held for the URBs to finish during device disconnect, blocking host remove.
  *
  * Call with xhci->lock held.
- * lock is relased and re-acquired while giving back urb.
+ * lock is released and re-acquired while giving back urb.
  */
 void xhci_hc_died(struct xhci_hcd *xhci)
 {
@@ -1971,7 +1971,7 @@ static void handle_device_notification(struct xhci_hcd *xhci,
 }
 
 /*
- * Quirk hanlder for errata seen on Cavium ThunderX2 processor XHCI
+ * Quirk handler for errata seen on Cavium ThunderX2 processor XHCI
  * Controller.
  * As per ThunderX2errata-129 USB 2 device may come up as USB 1
  * If a connection to a USB 1 device is followed by another connection
@@ -3089,7 +3089,7 @@ static void xhci_clear_interrupt_pending(struct xhci_interrupter *ir)
 
 /*
  * Handle all OS-owned events on an interrupter event ring. It may drop
- * and reaquire xhci->lock between event processing.
+ * and reacquire xhci->lock between event processing.
  */
 static int xhci_handle_events(struct xhci_hcd *xhci, struct xhci_interrupter *ir,
 			      bool skip_events)
@@ -3803,7 +3803,7 @@ int xhci_queue_ctrl_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 		/*
 		 * If next available TRB is the Link TRB in the ring segment then
 		 * enqueue a No Op TRB, this can prevent the Setup and Data Stage
-		 * TRB to be breaked by the Link TRB.
+		 * TRB to be broken by the Link TRB.
 		 */
 		if (last_trb_on_seg(ep_ring->enq_seg, ep_ring->enqueue + 1)) {
 			field = TRB_TYPE(TRB_TR_NOOP) | ep_ring->cycle_state;
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 2af6a7b91e55..9564dde8bb34 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -406,7 +406,7 @@ static void compliance_mode_recovery(struct timer_list *t)
  * The quirk creates a timer that polls every 2 seconds the link state of
  * each host controller's port and recovers it by issuing a Warm reset
  * if Compliance mode is detected, otherwise the port will become "dead" (no
- * device connections or disconnections will be detected anymore). Becasue no
+ * device connections or disconnections will be detected anymore). Because no
  * status event is generated when entering compliance mode (per xhci spec),
  * this quirk is needed on systems that have the failing hardware installed.
  */
@@ -796,7 +796,7 @@ static void xhci_save_registers(struct xhci_hcd *xhci)
 	xhci->s3.config_reg = readl(&xhci->op_regs->config_reg);
 
 	/* save both primary and all secondary interrupters */
-	/* fixme, shold we lock  to prevent race with remove secondary interrupter? */
+	/* fixme, should we lock  to prevent race with remove secondary interrupter? */
 	for (i = 0; i < xhci->max_interrupters; i++) {
 		ir = xhci->interrupters[i];
 		if (!ir)
@@ -2046,7 +2046,7 @@ int xhci_add_endpoint(struct usb_hcd *hcd, struct usb_device *udev,
 
 	/*
 	 * Configuration and alternate setting changes must be done in
-	 * process context, not interrupt context (or so documenation
+	 * process context, not interrupt context (or so documentation
 	 * for usb_set_interface() and usb_set_configuration() claim).
 	 */
 	if (xhci_endpoint_init(xhci, virt_dev, udev, ep, GFP_NOIO) < 0) {
@@ -3302,7 +3302,7 @@ static void xhci_endpoint_disable(struct usb_hcd *hcd,
  * state. For software that wishes to reset the data toggle or sequence number
  * of an endpoint that isn't in the halted state this function will issue a
  * configure endpoint command with the Drop and Add bits set for the target
- * endpoint. Refer to the additional note in xhci spcification section 4.6.8.
+ * endpoint. Refer to the additional note in xhci specification section 4.6.8.
  *
  * vdev may be lost due to xHC restore error and re-initialization during S3/S4
  * resume. A new vdev will be allocated later by xhci_discover_or_reset_device()
@@ -4296,7 +4296,7 @@ int xhci_alloc_dev(struct usb_hcd *hcd, struct usb_device *udev)
 		pm_runtime_get_noresume(hcd->self.controller);
 
 	/* Is this a LS or FS device under a HS hub? */
-	/* Hub or peripherial? */
+	/* Hub or peripheral? */
 	return 1;
 
 disable_slot:
@@ -4512,7 +4512,7 @@ static int xhci_enable_device(struct usb_hcd *hcd, struct usb_device *udev)
 
 /*
  * Transfer the port index into real index in the HW port status
- * registers. Caculate offset between the port's PORTSC register
+ * registers. Calculate offset between the port's PORTSC register
  * and port status base. Divide the number of per port register
  * to get the real index. The raw port number bases 1.
  */
@@ -5394,7 +5394,7 @@ static void xhci_hcd_init_usb3_data(struct xhci_hcd *xhci, struct usb_hcd *hcd)
 	/*
 	 * Early xHCI 1.1 spec did not mention USB 3.1 capable hosts
 	 * should return 0x31 for sbrn, or that the minor revision
-	 * is a two digit BCD containig minor and sub-minor numbers.
+	 * is a two digit BCD containing minor and sub-minor numbers.
 	 * This was later clarified in xHCI 1.2.
 	 *
 	 * Some USB 3.1 capable hosts therefore have sbrn 0x30, and
-- 
2.43.0

