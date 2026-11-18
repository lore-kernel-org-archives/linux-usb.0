Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795006295;
	b=Epmqt6VctyhOs/FV+jwx1LvG4548PjHi3bI8k/LSFMVMJfsCaxAtGnTwD+RYTqWNUBBi
	 jogzWtd0eISYPts+8ak5E+oTN1iebTJw14pR9mZeqov/cAH+nVt7uQ4zqXXi1WJedPX1k
	 yN2xXq4JCbq0+4ZJc5oCxek1RKIZmXWEH6q/nNqjCav+bWHgq/KHd8cKAGF3lsdgg/z6Z
	 KuxRNExDr38WYaVGZhedF+dJ7cAhCDB9nEitpOXTdq/U+WOWLuH+0BzY7JxB14v2yateS
	 riBew5cscrKgkjPBy2ZYdC0POJoq1C1REAFIJ7TiPFBNE/Q3MJTkSNmqypa0h7Zc8pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795006295;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NPI7mEt3Lo2ZwN5jsziZWQ/rSOBi2ZLwsCXpTVPHOnI=;
	b=ocGD/a0Zo+nm9yrOegoSpZGo6IMtSHf0m0Ujsafb0a83ADJotJnGc2glOxtHV2z4+84m
	 MYzbvaNttr291Ult2MyvFWCaKr3zhWNR5eaCDMjHwXii+D0nyk9UfzyQ6hDzlA0XQY1hT
	 KNPmQUdtA6DtB+lt5QjvbLa1Sy0h+geNL/KAYcK5mOUnIeN4K2TBfTrYxFiXplrNGbJC9
	 6znBDRfxl0q8TxFD1NDRI+nc1JbO9vHINGXs25wJKgaYo7jfYIrmkCQv55pDZf6j/S+9z
	 U7jSa7ZaAlLDfzzayJFkslLBXIBsNZMehCbiCvXZ8g/xQqmkwHxMYZdVqXZTao7F1wA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PpvU4OZO;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABF0606A320
	for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 12:51:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6ABF0606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PpvU4OZO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795006296; x=1826542296;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PlaWpfv1g+0aTOPFnRHvoU7etFD6lu0ImTsOzx/N7VM=;
  b=PpvU4OZO08nnWnKTBdbYudM+j9wvnPYXWVuOc0De81znWgkfa7ISWfmS
   kZ+XAinmETM8R9R5YLGVIHJLVGAMpe6j19OEeQbeVhYeqXNbHK4/G3Ll8
   SWEOP5kP6CeNlEQGy7mrPzIbs2uE91mfTlNVYgvq3faxIvY4yDJCTlC2I
   AVLeOtsYBuM4vnC/JJsFhibU/skg0M+RqNALKelLQkbXPoSmecj8bdMLR
   EzQ4sSYHjHUooZ/LYdOMhlcv1eJJWCETS3J5dLtsMNaqrJG51l4/Vs0TP
   m4/8qj7L0S+8RndxhVntn6xmpjLvgFYvJ5FNyL9EajMfC2+/c5R+HWF4z
   Q==;
X-CSE-ConnectionGUID: H8aMweBZQF2bsmZPEX8D/g==
X-CSE-MsgGUID: lRaXJMwkQEuTmQf4+pkrzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3709111"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3709111"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 04:51:27 -0800
X-CSE-ConnectionGUID: 1kn6lkx1R86EitMboBwHMQ==
X-CSE-MsgGUID: MKZwCnRyQ5qUjAycuv8GrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10476219"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.244.233])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 04:51:26 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: quic_wcheng@quicinc.com,
	hulianqin@vivo.com,
	selvarasu.g@samsung.com
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [RFT PATCH 2/2] xhci: sideband: check virt device under xhci lock when stopping endpoints
Date: Wed, 18 Nov 2026 14:51:09 +0200
Message-ID: <20261118125109.1429538-3-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118125109.1429538-1-mathias.nyman@linux.intel.com>
References: <20261118125109.1429538-1-mathias.nyman@linux.intel.com>
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

The sideband virt device lookup and the endpoint checks in
xhci_sideband_stop_endpoint(), xhci_sideband_remove_endpoint() and
xhci_sideband_unregister() are done without holding the xhci lock.
The xhci driver may free or reallocate the virt device between the check
and the actual stop endpoint command. This can happen during xHC reset
in resume, reset-resume, or retried enumeration.

Move the stop endpoint code from xhci_stop_endpoint_sync() in xhci.c to
a new sideband_stop_endpoint_sync() helper in xhci-sideband.c. It
verifies the virt device and endpoint, and queues the stop endpoint
command, while holding the xhci lock. Removing an endpoint from the
sideband is done in the same locked section.

xhci_stop_endpoint_sync() has no other users, so remove it.

Also take the sideband mutex in xhci_sideband_stop_endpoint(), and keep
holding it in xhci_sideband_unregister() until the sideband is detached
from the virt device. Doing so serializes these with the other sideband
API calls.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-sideband.c | 110 +++++++++++++++++++++----------
 drivers/usb/host/xhci.c          |  55 ----------------
 drivers/usb/host/xhci.h          |   2 -
 3 files changed, 76 insertions(+), 91 deletions(-)

diff --git a/drivers/usb/host/xhci-sideband.c b/drivers/usb/host/xhci-sideband.c
index ad4849903df3..39d790bb6a2b 100644
--- a/drivers/usb/host/xhci-sideband.c
+++ b/drivers/usb/host/xhci-sideband.c
@@ -92,19 +92,72 @@ sideband_to_vdev(struct xhci_sideband *sb)
 }
 
 /* Caller must hold sb->mutex */
-static void
-__xhci_sideband_remove_endpoint(struct xhci_sideband *sb, struct xhci_virt_ep *ep)
+static int
+sideband_stop_endpoint_sync(struct xhci_sideband *sb, u32 ep_index, bool remove)
 {
+	struct xhci_virt_device *vdev;
+	struct xhci_command *cmd;
+	struct xhci_virt_ep *ep;
+	struct xhci_ep_ctx *ctx;
+	unsigned long flags;
+	bool queued = false;
+	int ret = -ENODEV;
+
 	lockdep_assert_held(&sb->mutex);
 
-	/*
-	 * Issue a stop endpoint command when an endpoint is removed.
-	 * The stop ep cmd handler will handle the ring cleanup.
-	 */
-	xhci_stop_endpoint_sync(sb->xhci, ep, 0, GFP_KERNEL);
+	cmd = xhci_alloc_command(sb->xhci, true, GFP_KERNEL);
+	if (!cmd)
+		return -ENOMEM;
+
+	spin_lock_irqsave(&sb->xhci->lock, flags);
+
+	vdev = sideband_to_vdev(sb);
+	ep = sb->eps[ep_index];
+
+	if (remove)
+		sb->eps[ep_index] = NULL;
+
+	/* validate xhci didn't free or replace vdev during resume */
+	if (!vdev || !ep || ep->sideband != sb) {
+		spin_unlock_irqrestore(&sb->xhci->lock, flags);
+		goto out;
+	}
+
+	if (remove) {
+		ep->sideband = NULL;
+		/* endpoint is removed, not running is not an error */
+		ret = 0;
+	}
+
+	/* make sure endpoint is running before stopping it */
+	if (ep->ring) {
+		ctx = xhci_get_ep_ctx(sb->xhci, vdev->out_ctx, ep_index);
+		if (GET_EP_CTX_STATE(ctx) == EP_STATE_RUNNING) {
+			ret = xhci_queue_stop_endpoint(sb->xhci, cmd,
+						       vdev->slot_id,
+						       ep_index, 0);
+			queued = !ret;
+			if (queued)
+				xhci_ring_cmd_db(sb->xhci);
+		}
+	}
+
+	spin_unlock_irqrestore(&sb->xhci->lock, flags);
+
+	if (!queued)
+		goto out;
+
+	wait_for_completion(cmd->completion);
 
-	ep->sideband = NULL;
-	sb->eps[ep->ep_index] = NULL;
+	if (cmd->status == COMP_COMMAND_ABORTED ||
+	    cmd->status == COMP_COMMAND_RING_STOPPED) {
+		xhci_warn(sb->xhci, "Timeout while waiting for stop endpoint command\n");
+		ret = -ETIME;
+	}
+out:
+	xhci_free_command(sb->xhci, cmd);
+
+	return ret;
 }
 
 /* Caller must hold sb->mutex */
@@ -212,21 +265,13 @@ int
 xhci_sideband_remove_endpoint(struct xhci_sideband *sb,
 			      struct usb_host_endpoint *host_ep)
 {
-	struct xhci_virt_ep *ep;
 	unsigned int ep_index;
 
 	guard(mutex)(&sb->mutex);
 
 	ep_index = xhci_get_endpoint_index(&host_ep->desc);
-	ep = sb->eps[ep_index];
 
-	if (!sideband_to_vdev(sb) || !ep || ep->sideband != sb) {
-		sb->eps[ep_index] = NULL;
-		return -ENODEV;
-	}
-	__xhci_sideband_remove_endpoint(sb, ep);
-
-	return 0;
+	return sideband_stop_endpoint_sync(sb, ep_index, true);
 }
 EXPORT_SYMBOL_GPL(xhci_sideband_remove_endpoint);
 
@@ -234,16 +279,13 @@ int
 xhci_sideband_stop_endpoint(struct xhci_sideband *sb,
 			    struct usb_host_endpoint *host_ep)
 {
-	struct xhci_virt_ep *ep;
 	unsigned int ep_index;
 
-	ep_index = xhci_get_endpoint_index(&host_ep->desc);
-	ep = sb->eps[ep_index];
+	guard(mutex)(&sb->mutex);
 
-	if (!sideband_to_vdev(sb) || !ep || ep->sideband != sb)
-		return -EINVAL;
+	ep_index = xhci_get_endpoint_index(&host_ep->desc);
 
-	return xhci_stop_endpoint_sync(sb->xhci, ep, 0, GFP_KERNEL);
+	return sideband_stop_endpoint_sync(sb, ep_index, false);
 }
 EXPORT_SYMBOL_GPL(xhci_sideband_stop_endpoint);
 
@@ -486,24 +528,24 @@ xhci_sideband_unregister(struct xhci_sideband *sb)
 
 	xhci = sb->xhci;
 
-	scoped_guard(mutex, &sb->mutex) {
-		vdev = sideband_to_vdev(sb);
-
-		for (i = 0; i < EP_CTX_PER_DEV; i++)
-			if (vdev && sb->eps[i])
-				__xhci_sideband_remove_endpoint(sb, sb->eps[i]);
+	mutex_lock(&sb->mutex);
 
-		__xhci_sideband_remove_interrupter(sb);
+	for (i = 0; i < EP_CTX_PER_DEV; i++)
+		if (sb->eps[i])
+			sideband_stop_endpoint_sync(sb, i, true);
 
-		sb->udev = NULL;
-	}
+	__xhci_sideband_remove_interrupter(sb);
 
 	spin_lock_irq(&xhci->lock);
-	sb->xhci = NULL;
+	vdev = sideband_to_vdev(sb);
 	if (vdev)
 		vdev->sideband = NULL;
+	sb->udev = NULL;
+	sb->xhci = NULL;
 	spin_unlock_irq(&xhci->lock);
 
+	mutex_unlock(&sb->mutex);
+
 	kfree(sb);
 }
 EXPORT_SYMBOL_GPL(xhci_sideband_unregister);
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 30ac1bc4559b..bcb482795bbc 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -2883,61 +2883,6 @@ static int xhci_reserve_bandwidth(struct xhci_hcd *xhci,
 	return -ENOMEM;
 }
 
-/*
- * Synchronous XHCI stop endpoint helper.  Issues the stop endpoint command and
- * waits for the command completion before returning.  This does not call
- * xhci_handle_cmd_stop_ep(), which has additional handling for 'context error'
- * cases, along with transfer ring cleanup.
- *
- * xhci_stop_endpoint_sync() is intended to be utilized by clients that manage
- * their own transfer ring, such as offload situations.
- */
-int xhci_stop_endpoint_sync(struct xhci_hcd *xhci, struct xhci_virt_ep *ep, int suspend,
-			    gfp_t gfp_flags)
-{
-	struct xhci_command *command;
-	struct xhci_ep_ctx *ep_ctx;
-	unsigned long flags;
-	int ret = -ENODEV;
-
-	command = xhci_alloc_command(xhci, true, gfp_flags);
-	if (!command)
-		return -ENOMEM;
-
-	spin_lock_irqsave(&xhci->lock, flags);
-
-	/* make sure endpoint exists and is running before stopping it */
-	if (ep->ring) {
-		ep_ctx = xhci_get_ep_ctx(xhci, ep->vdev->out_ctx, ep->ep_index);
-		if (GET_EP_CTX_STATE(ep_ctx) == EP_STATE_RUNNING)
-			ret = xhci_queue_stop_endpoint(xhci, command,
-						       ep->vdev->slot_id,
-						       ep->ep_index, suspend);
-	}
-
-	if (ret < 0) {
-		spin_unlock_irqrestore(&xhci->lock, flags);
-		goto out;
-	}
-
-	xhci_ring_cmd_db(xhci);
-	spin_unlock_irqrestore(&xhci->lock, flags);
-
-	wait_for_completion(command->completion);
-
-	/* No handling for COMP_CONTEXT_STATE_ERROR done at command completion*/
-	if (command->status == COMP_COMMAND_ABORTED ||
-	    command->status == COMP_COMMAND_RING_STOPPED) {
-		xhci_warn(xhci, "Timeout while waiting for stop endpoint command\n");
-		ret = -ETIME;
-	}
-out:
-	xhci_free_command(xhci, command);
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(xhci_stop_endpoint_sync);
-
 /*
  * xhci_usb_endpoint_maxp - get endpoint max packet size
  * @host_ep: USB host endpoint to be checked
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index ec4bfeb4887c..6201b6b24252 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1963,8 +1963,6 @@ void xhci_cleanup_command_queue(struct xhci_hcd *xhci);
 void inc_deq(struct xhci_hcd *xhci, struct xhci_ring *ring);
 unsigned int count_trbs(u64 addr, u64 len);
 unsigned int xhci_num_trbs_free(struct xhci_ring *ring);
-int xhci_stop_endpoint_sync(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
-			    int suspend, gfp_t gfp_flags);
 void xhci_process_cancelled_tds(struct xhci_hcd *xhci, struct xhci_virt_ep *ep);
 void xhci_update_erst_dequeue(struct xhci_hcd *xhci,
 			      struct xhci_interrupter *ir,
-- 
2.43.0

