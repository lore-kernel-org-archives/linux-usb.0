Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D194252BC
	for <linux-usb@vger.kernel.org>; Tue, 28 Jul 2026 11:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785239507; cv=none; b=Snr1Y5ZefqApsfttXQ+rXGShYzCnGuCMbK1u2TRJMY2+grYR2xCHr/OlXbuDKPlFoY2dDCUE4/zAluT0nHLIvQ1tP7hWcS/hNMLbaBF33W+WFGJoa3ND/sYuSykzXToIpoG5griA2KaDWebxLkJq4KryTwbrAa19hRWc5DgvKZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785239507; c=relaxed/simple;
	bh=ZeKqylhk5U6pFG9C+guDnUCQ32gbKmFZMeYtkd9yUAc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dnopL9KXSDSd18U+l9x+ejJsFw+qdz6I+ZjXNO8MnOe40YY/VWy7ErVuZ5J+jkpLigLraajozaNYf8GsKGsXtvJQd8Kl6BtqF3O3DvWThTLckoBqDYsFDowjljrXih4ktE6nrkFNBO0E/8nk+blUEZnXOiFmQhsfkFDLcOQfUuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kQFgQq1Y; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kQFgQq1Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785239507; x=1816775507;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZeKqylhk5U6pFG9C+guDnUCQ32gbKmFZMeYtkd9yUAc=;
  b=kQFgQq1YKXuI55CFg97lkNiDdX1lX3E6pmS7b3m5NSHHCwZnKs4Nu5rG
   fzmKwWYRMuuKwIRWN0527rLbj3te2OYiVTnBIXj5mPbNpIQoibQVuWfXn
   jUlnRFDnl1/1wVbCzK+UM9eGDZvO1P/ymyBUZ0OKBzolOzk0hNSjy6/qV
   PCQQOvLa9x+bdU/bQTyA8PhD5hvnIx39KAT56PQTWsSF1e2FxnOqotXKN
   5iMeWAFIB2FjPOl6J79S/MyYt1NI4RFkFrxg9wdGWREvQFWNd3kRMKOle
   9D3pf+mCzabE83n4wW6aQ7QRvr+h4g0R7aBfxgM7vD+t9fh+voZdeve99
   Q==;
X-CSE-ConnectionGUID: ZrFMnzuLSxeX3DjcQodKdg==
X-CSE-MsgGUID: G0LUa2+fSIixPvpLkOPpyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="103227210"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="103227210"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 04:51:44 -0700
X-CSE-ConnectionGUID: bZkmlFKcQW+Y5v9qkfPkxA==
X-CSE-MsgGUID: cEpynJhVQFqQOLRcRzbWBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="263991659"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa005.jf.intel.com with ESMTP; 28 Jul 2026 04:51:43 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 5FCA2A1; Tue, 28 Jul 2026 13:51:41 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 4/5] thunderbolt: Make interrupt optional for rings
Date: Tue, 28 Jul 2026 13:51:40 +0200
Message-ID: <20260728115141.2585464-5-mika.westerberg@linux.intel.com>
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

For some use-cases it does make sense to poll the rings directly instead
of relying on the interrupt. For this reason add a new flag RING_FLAG_NO_INTERRUPT
that can be used to allocate ring in polled mode.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/nhi.c   | 27 +++++++++++++++++++++------
 include/linux/thunderbolt.h |  2 ++
 2 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index 35e3c119d5ee..a4816db5cacd 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -235,6 +235,12 @@ static void ring_write_descriptors(struct tb_ring *ring)
 {
 	struct ring_frame *frame, *n;
 	struct ring_desc *descriptor;
+	u32 flags;
+
+	flags = RING_DESC_POSTED;
+	if (!(ring->flags & RING_FLAG_NO_INTERRUPT))
+		flags |= RING_DESC_INTERRUPT;
+
 	list_for_each_entry_safe(frame, n, &ring->queue, list) {
 		if (ring_full(ring))
 			break;
@@ -242,7 +248,7 @@ static void ring_write_descriptors(struct tb_ring *ring)
 		descriptor = &ring->descriptors[ring->head];
 		descriptor->phys = frame->buffer_phy;
 		descriptor->time = 0;
-		descriptor->flags = RING_DESC_POSTED | RING_DESC_INTERRUPT;
+		descriptor->flags = flags;
 		if (ring->is_tx) {
 			descriptor->length = frame->size;
 			descriptor->eof = frame->eof;
@@ -339,8 +345,9 @@ EXPORT_SYMBOL_GPL(__tb_ring_enqueue);
  * @ring: Ring to poll
  *
  * This function can be called when @start_poll callback of the @ring
- * has been called. It will read one completed frame from the ring and
- * return it to the caller.
+ * has been called or the ring is created with %RING_FLAG_NO_INTERRUPT.
+ * It will read one completed frame from the ring and return it to the
+ * caller.
  *
  * Return: Pointer to &struct ring_frame, %NULL if there is no more
  * completed frames.
@@ -538,6 +545,12 @@ static struct tb_ring *tb_ring_alloc(struct tb_nhi *nhi, u32 hop, int size,
 	dev_dbg(nhi->dev, "allocating %s ring %d of size %d\n",
 		transmit ? "TX" : "RX", hop, size);
 
+	if ((flags & RING_FLAG_NO_INTERRUPT) && start_poll) {
+		dev_WARN(nhi->dev,
+			 "start_poll() and NO_INTERRUPT cannot be used at the same time\n");
+		return NULL;
+	}
+
 	ring = kzalloc_obj(*ring);
 	if (!ring)
 		return NULL;
@@ -568,7 +581,7 @@ static struct tb_ring *tb_ring_alloc(struct tb_nhi *nhi, u32 hop, int size,
 	if (!ring->descriptors)
 		goto err_free_ring;
 
-	if (nhi->ops->request_ring_irq) {
+	if (!(flags & RING_FLAG_NO_INTERRUPT) && nhi->ops->request_ring_irq) {
 		if (nhi->ops->request_ring_irq(ring, flags & RING_FLAG_NO_SUSPEND))
 			goto err_free_descs;
 	}
@@ -701,7 +714,8 @@ void tb_ring_start(struct tb_ring *ring)
 		ring_iowrite32options(ring, flags, 0);
 	}
 
-	ring_interrupt_active(ring, true);
+	if (!(ring->flags & RING_FLAG_NO_INTERRUPT))
+		ring_interrupt_active(ring, true);
 	ring->running = true;
 err:
 	spin_unlock(&ring->lock);
@@ -761,7 +775,8 @@ void tb_ring_stop(struct tb_ring *ring)
 			 RING_TYPE(ring), ring->hop);
 		goto err;
 	}
-	ring_interrupt_active(ring, false);
+	if (!(ring->flags & RING_FLAG_NO_INTERRUPT))
+		ring_interrupt_active(ring, false);
 
 	ring_iowrite32options(ring, 0, 0);
 	ring_iowrite64desc(ring, 0, 0);
diff --git a/include/linux/thunderbolt.h b/include/linux/thunderbolt.h
index feb1af175cfd..42bbfc007324 100644
--- a/include/linux/thunderbolt.h
+++ b/include/linux/thunderbolt.h
@@ -592,6 +592,8 @@ struct tb_ring {
 #define RING_FLAG_FRAME		BIT(1)
 /* Enable end-to-end flow control */
 #define RING_FLAG_E2E		BIT(2)
+/* Do not enable interrupt for the ring */
+#define RING_FLAG_NO_INTERRUPT	BIT(3)
 
 struct ring_frame;
 typedef void (*ring_cb)(struct tb_ring *, struct ring_frame *, bool canceled);
-- 
2.50.1

