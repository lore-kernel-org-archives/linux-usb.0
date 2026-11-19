Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795124942;
	b=MvpURP7rhbEmaMdW1GlS/MdwumJVgkfe++YUTv6BYsg6ryOX2yD8kPdM4nlWLyp7O9hu
	 z3xt1qow+p/M83sdrzua2Mbt5jjQDHNQA03quKA5OPBz6/He7vGrOF5dqlX8DNvSxjW1u
	 mvP/n5yiNTQz6BxhmsigbLoRSgCsEvLoZK2+omuJXoNzCryuZMjYJzvYDth0G19lA1qaN
	 66MAXPiKkIY7TnKbmPpZHuNK1jUmwnbOJQOdbc+fZVRkTgj+6zqD5S2hNDwp/4TO5sT5g
	 PUiX/pcQKbtwMvzfaUSmU3WoKiD+JwpBAH3EvOAJ7183EHiPqq2KJ1510sPLSRPP1Hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795124942;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vMf4Fea53hcmIoasn2gHUW/2JJPK4tE0y4ohbNs73k0=;
	b=fmSilMz+b2cKYzQqvgFXxdFI+jX71b4VWVc9Yw1YIVonrkdGmKyJs1wh32Gv95cu4UMf
	 jMnNd26LVwgiKygzYNPXcVEGZir2hScifbBe6E779+62qpM2crrDC+0qVYAr3Lsq9tHl1
	 tQQIguCNCzsHsKGZ9N9eKMrhsaGDNBvvRYtZ4KQiP9Hif/wjnp7BucYAjbG5Lz5TyPt0u
	 cnSaqATtFTa9n0HK+URcrcz+FjTdku4n5pV3mS+ItfIAkxfSwU/zpex4qIcAO8PrRRHZl
	 65BaA3EN/2LeHwmXmBdpaeFFiPK14U/m+1k1E+xOzQhnod932t+zZj5DFePMDRKK9eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CKDWAHi2;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30026606A33A
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 21:49:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30026606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CKDWAHi2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795124942; x=1826660942;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8qt+Z+rg2o3gQTktDQokoYz0SEguDri+eaapiuJq+3c=;
  b=CKDWAHi22zQYCgNBBw7aqaI7eFCzX/Ykcfta0IbXPgKTT7EFY81sC9/L
   MqpjJGDqTaan9IeqNEYJ25PCKk7pFKYI5OiqweNZL9TFUki7a+GbRN79h
   Jv4hMBmdZlqXYJ8Rvd1xv4o8KA4eCLPgG5iCiHhmlCkx5y4YEUSE56HR5
   LFWtMxewKQ974ria30EMjOX8JyaEnko49GJdsXVomxPPg7mJh1LH9FyNg
   VnuH5VLV0/lGZUgwhxAH9cuuJP2xahv1asnhbdgHWYnqE8Ei7eUYRnR/0
   xdt8ZbJxkJM4sT0l8q2S+ZSjNqjMfHOUBka06bsCNibsJem/DxadzfK22
   g==;
X-CSE-ConnectionGUID: NxJSjntMTgiCiSCu7fDrOg==
X-CSE-MsgGUID: w4Rc1RmfToKWznsJqW8e1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4001569"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="4001569"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 13:49:02 -0800
X-CSE-ConnectionGUID: xrh1EhxDRWeHhsUSlRZjtQ==
X-CSE-MsgGUID: eYDFYjHFSFijZ+HcaGLC+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10889744"
Received: from amilburn-desk.amilburn-desk (HELO mnyman-desk.intel.com) ([10.245.245.137])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 13:49:00 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: quic_wcheng@quicinc.com,
	hulianqin@vivo.com,
	selvarasu.g@samsung.com
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [[RFT PATCH v2] 2/2] xhci: sideband: check virt device under xhci lock when stopping endpoints
Date: Thu, 19 Nov 2026 23:48:40 +0200
Message-ID: <20261119214841.1552318-3-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119214841.1552318-1-mathias.nyman@linux.intel.com>
References: <20261119214841.1552318-1-mathias.nyman@linux.intel.com>
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

Start work to protect sideband API functions against the xhci driver
freeing or reallocating the virt device (vdev) in the middle of an API
call.

Make the following sideband API calls hold xhci->lock while validating
the vdev and its endpoint, and while queueing the stop endpoint command:

xhci_sideband_unregister()
xhci_sideband_stop_endpoint()
xhci_sideband_remove_endpoint()

Locking changes are still needed in several xhci 'core' driver vdev free
paths before the above calls are fully serialized against vdev free.
Cases involve xHC reset in resume, enumeration retry, and reset-resume.

Move the stop endpoint code from xhci_stop_endpoint_sync() in xhci.c to
a new sideband_stop_endpoint_sync() helper in xhci-sideband.c.

xhci_stop_endpoint_sync() has no other users, so remove it.

Also take sb->mutex in xhci_sideband_stop_endpoint(), and keep holding
it in xhci_sideband_unregister() until the sideband is detached from the
vdev.

Fixes: de66754e9f80 ("xhci: sideband: add initial api to register a secondary interrupter entity")
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-sideband.c | 121 ++++++++++++++++++++++---------
 drivers/usb/host/xhci.c          |  55 --------------
 drivers/usb/host/xhci.h          |   2 -
 3 files changed, 87 insertions(+), 91 deletions(-)

diff --git a/drivers/usb/host/xhci-sideband.c b/drivers/usb/host/xhci-sideband.c
index e4dd298b80f1..6f7712f95033 100644
--- a/drivers/usb/host/xhci-sideband.c
+++ b/drivers/usb/host/xhci-sideband.c
@@ -91,20 +91,78 @@ sideband_to_vdev(struct xhci_sideband *sb)
 	return NULL;
 }
 
-/* Caller must hold sb->mutex */
-static void
-__xhci_sideband_remove_endpoint(struct xhci_sideband *sb, struct xhci_virt_ep *ep)
+/*
+ * Synchronous xHCI stop endpoint helper. Issues a stop endpoint command and
+ * waits for the command completion before returning. This does not call
+ * xhci_handle_cmd_stop_ep(), which has additional handling for 'context error'
+ * cases, along with transfer ring cleanup.
+ *
+ * Caller must hold sb->mutex
+ */
+static int
+sideband_stop_endpoint_sync(struct xhci_sideband *sb, unsigned int ep_index,
+			    bool remove)
 {
+	struct xhci_virt_device *vdev;
+	struct xhci_command *cmd;
+	struct xhci_virt_ep *ep;
+	struct xhci_ep_ctx *ctx;
+	unsigned long flags;
+	int ret = -ENODEV;
+
 	lockdep_assert_held(&sb->mutex);
 
-	/*
-	 * Issue a stop endpoint command when an endpoint is removed.
-	 * The stop ep cmd handler will handle the ring cleanup.
-	 */
-	xhci_stop_endpoint_sync(sb->xhci, ep, 0, GFP_KERNEL);
+	cmd = xhci_alloc_command(sb->xhci, true, GFP_KERNEL);
+
+	spin_lock_irqsave(&sb->xhci->lock, flags);
+
+	vdev = sideband_to_vdev(sb);
+	ep = sb->eps[ep_index];
+
+	/* validate that xhci didn't reallocate vdev during reset or resume */
+	if (!vdev || !ep || ep->sideband != sb)
+		goto out_unlock;
+
+	if (remove) {
+		ep->sideband = NULL;
+		/* endpoint is removed, not running is not an error */
+		ret = 0;
+	}
+
+	if (!ep->ring)
+		goto out_unlock;
+
+	/* Stop the endpoint if it's running */
+	ctx = xhci_get_ep_ctx(sb->xhci, vdev->out_ctx, ep_index);
+	if (GET_EP_CTX_STATE(ctx) == EP_STATE_RUNNING) {
+		if (!cmd) {
+			ret = -ENOMEM;
+			goto out_unlock;
+		}
+		ret = xhci_queue_stop_endpoint(sb->xhci, cmd, vdev->slot_id,
+					       ep_index, 0);
+		if (ret)
+			goto out_unlock;
+
+		xhci_ring_cmd_db(sb->xhci);
+		spin_unlock_irqrestore(&sb->xhci->lock, flags);
+		wait_for_completion(cmd->completion);
+
+		if (cmd->status == COMP_COMMAND_ABORTED ||
+		    cmd->status == COMP_COMMAND_RING_STOPPED) {
+			xhci_warn(sb->xhci, "Timeout while waiting for stop endpoint command\n");
+			ret = -ETIME;
+		}
+		xhci_free_command(sb->xhci, cmd);
+		return ret;
+	}
 
-	ep->sideband = NULL;
-	sb->eps[ep->ep_index] = NULL;
+out_unlock:
+	spin_unlock_irqrestore(&sb->xhci->lock, flags);
+	if (cmd)
+		xhci_free_command(sb->xhci, cmd);
+
+	return ret;
 }
 
 /* Caller must hold sb->mutex */
@@ -212,21 +270,17 @@ int
 xhci_sideband_remove_endpoint(struct xhci_sideband *sb,
 			      struct usb_host_endpoint *host_ep)
 {
-	struct xhci_virt_ep *ep;
 	unsigned int ep_index;
+	int ret;
 
 	guard(mutex)(&sb->mutex);
 
 	ep_index = xhci_get_endpoint_index(&host_ep->desc);
-	ep = sb->eps[ep_index];
 
-	if (!sideband_to_vdev(sb) || !ep || ep->sideband != sb) {
-		sb->eps[ep_index] = NULL;
-		return -ENODEV;
-	}
-	__xhci_sideband_remove_endpoint(sb, ep);
+	ret = sideband_stop_endpoint_sync(sb, ep_index, true);
+	sb->eps[ep_index] = NULL;
 
-	return 0;
+	return ret;
 }
 EXPORT_SYMBOL_GPL(xhci_sideband_remove_endpoint);
 
@@ -234,16 +288,13 @@ int
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
 
@@ -489,24 +540,26 @@ xhci_sideband_unregister(struct xhci_sideband *sb)
 
 	xhci = sb->xhci;
 
-	scoped_guard(mutex, &sb->mutex) {
-		vdev = sideband_to_vdev(sb);
-
-		for (i = 0; i < EP_CTX_PER_DEV; i++)
-			if (vdev && sb->eps[i])
-				__xhci_sideband_remove_endpoint(sb, sb->eps[i]);
+	mutex_lock(&sb->mutex);
 
-		__xhci_sideband_remove_interrupter(sb);
-
-		sb->udev = NULL;
+	for (i = 0; i < EP_CTX_PER_DEV; i++) {
+		if (sb->eps[i]) {
+			sideband_stop_endpoint_sync(sb, i, true);
+			sb->eps[i] = NULL;
+		}
 	}
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

