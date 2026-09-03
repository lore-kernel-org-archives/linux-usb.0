Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B299F4A4991
	for <linux-usb@vger.kernel.org>; Thu,  3 Sep 2026 12:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788438904; cv=none; b=u13qfIXiGsIg+5bj0pSAIbW7JYTb7oU8m5wXKpjIGpefWMKJrvrsTFWf7ci8LXwop7O1cDbY/nHKxMcEfPGnNt6eesR/apUj7zEtybwgIIdh6yW204i8XU8doAqrC0cBadytpCVanx3pPtYGZ6FweNGA+jejjfMJWHRp4Jh4nS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788438904; c=relaxed/simple;
	bh=cyIQzOXFwBdjSKHbyO/ERIQKhEMSL0n/ekCPYuZWuow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lQxueP991AZY3a4lAUF9Bt9Mh3ZGm1t4kKCACjbQqBFVphJ+2Nex0PAh0XxvHp49A/5R6imM0RDxYyWA0WAX4jG5ikhIDtEYvwzF7VV/9/haALI/9gPJCxKxGUmdFKp7iqukV3logrsWOyD1MEmAi6sQkzIjXx1LxvNXS9ARiBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h6xeS2PN; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h6xeS2PN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788438903; x=1819974903;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cyIQzOXFwBdjSKHbyO/ERIQKhEMSL0n/ekCPYuZWuow=;
  b=h6xeS2PN8NffpONO27ECn+tekx4Oh1EniroAH0sctPyMnGAYW0Ch7+GU
   zuM9nLhPQAm1ebrd4Za2A/tB7zKSKCU0hlUXqRw0Z/oUiZZIuinnO7SQg
   0wkKMbd04G7em/YtSxsk45tBNmf6MzpibxUdaGkV2sOGOxI4YrodKeiQg
   dlEBBnoG6ihLIUxLCiFbbgz6QCEDpXNlbG8HpD0+uBnpa4DXQHYxK2mtR
   fxfTW6ABdDeb9bF2cPPSl77sj7g6yXa/VuiQCZvwMEMyMzfofAqJrYgos
   BASeKNUCsMIvK5cSgMpEjf+wVdKbcngS0MZmA5MOvAerbVP8fZvxl1E9u
   g==;
X-CSE-ConnectionGUID: P2Y9cAacS9GBSEzXGmfPEg==
X-CSE-MsgGUID: f3SV6dOIRdGgDN7J6IX6iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="99250168"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="99250168"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 05:34:58 -0700
X-CSE-ConnectionGUID: Oey4FbXXQBSbcAlMWGD0zA==
X-CSE-MsgGUID: T7WCyMxgRpCRra533RanYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="267123216"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 03 Sep 2026 05:34:56 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 164FCA1; Thu, 03 Sep 2026 14:34:55 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 4/4] thunderbolt: stream: Use polling with RX ring
Date: Thu,  3 Sep 2026 14:34:54 +0200
Message-ID: <20260903123455.2048076-5-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260903123455.2048076-1-mika.westerberg@linux.intel.com>
References: <20260903123455.2048076-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ring API already supports polling so that once there is anything in
the RX ring, it will mask the ring interrupt and call the ->start_poll
callback. This is the same mechanism that the USB4/Thunderbolt
networking driver already uses.

We can do the same for the USB4STREAM driver and poll any RX frames
while they are available, until we re-enable the ring interrupt again.
This provides better latency when the stream is in "normal"
(non-busy-polling) mode.

Assisted-by: LLM
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/stream.c | 105 ++++++++++++++++++++++++-----------
 1 file changed, 73 insertions(+), 32 deletions(-)

diff --git a/drivers/thunderbolt/stream.c b/drivers/thunderbolt/stream.c
index c737dd0ca6e7..56e155750466 100644
--- a/drivers/thunderbolt/stream.c
+++ b/drivers/thunderbolt/stream.c
@@ -131,6 +131,7 @@ struct tbstream_ring {
  * @ring_size: Size of the rings
  * @throttling: Interrupt throttling rate in ns
  * @busy_poll: Instead of interrupts, busy poll the rings
+ * @rx_pending: Receive ring has completions that need to be advanced
  * @users: Number of times @cdev has been opened
  * @closed: CLOSE packet was received
  * @removed: Userspace removed the ConfigFS group underneath.
@@ -151,6 +152,7 @@ struct tbstream_dev {
 	unsigned int ring_size;
 	unsigned int throttling;
 	bool busy_poll;
+	bool rx_pending;
 	int users;
 	bool closed;
 	bool removed;
@@ -278,6 +280,14 @@ static inline bool tbstream_ring_available(const struct tbstream_ring *ring)
 	return ring->prod > ring->cons;
 }
 
+static void tbstream_ring_poll(struct tbstream_ring *ring)
+{
+	struct ring_frame *frame;
+
+	while ((frame = tb_ring_poll(ring->ring)))
+		frame->callback(ring->ring, frame, false);
+}
+
 static inline struct tb_xdomain *tbstream_dev_xdomain(struct tbstream_dev *sdev)
 {
 	if (sdev->stream)
@@ -540,18 +550,6 @@ tbstream_dev_send_data(struct tbstream_dev *sdev, struct iov_iter *from,
 	return tb_ring_tx(sdev->tx_ring.ring, &sf->frame);
 }
 
-static void
-tbstream_dev_poll_ring(struct tbstream_dev *sdev, struct tbstream_ring *ring)
-{
-	struct ring_frame *frame;
-
-	if (!sdev->busy_poll)
-		return;
-
-	while ((frame = tb_ring_poll(ring->ring)))
-		frame->callback(ring->ring, frame, false);
-}
-
 static int tbstream_dev_send_close(struct tbstream_dev *sdev)
 {
 	struct tbstream_frame *sf;
@@ -568,7 +566,7 @@ static int tbstream_dev_send_close(struct tbstream_dev *sdev)
 		do {
 			if (tbstream_ring_available(&sdev->tx_ring))
 				break;
-			tbstream_dev_poll_ring(sdev, &sdev->tx_ring);
+			tbstream_ring_poll(&sdev->tx_ring);
 			fsleep(15);
 		} while (ktime_before(ktime_get(), timeout));
 	}
@@ -579,16 +577,45 @@ static int tbstream_dev_send_close(struct tbstream_dev *sdev)
 	return tb_ring_tx(sdev->tx_ring.ring, &sf->frame);
 }
 
+static void tbstream_dev_start_poll(void *data)
+{
+	struct tbstream_dev *sdev = data;
+
+	WRITE_ONCE(sdev->rx_pending, true);
+	wake_up_interruptible_poll(&sdev->wait, EPOLLIN | EPOLLRDNORM);
+}
+
+/* sdev->lock must be held */
+static void tbstream_dev_advance_rx(struct tbstream_dev *sdev)
+{
+	/*
+	 * Clear before running the completions so that an interrupt
+	 * that arrives while we are doing that is not missed.
+	 */
+	WRITE_ONCE(sdev->rx_pending, false);
+	tbstream_ring_poll(&sdev->rx_ring);
+}
+
+/* sdev->lock must be held */
+static void tbstream_dev_complete_rx(struct tbstream_dev *sdev)
+{
+	if (!sdev->busy_poll)
+		tb_ring_poll_complete(sdev->rx_ring.ring);
+}
+
 static int tbstream_dev_start(struct tbstream_dev *sdev)
 {
 	struct tb_xdomain *xd = tbstream_dev_xdomain(sdev);
 	unsigned int flags = RING_FLAG_FRAME | RING_FLAG_E2E;
+	void (*start_poll)(void *) = NULL;
 	u16 sof_mask, eof_mask;
 	struct tb_ring *ring;
 	int ret, e2e_tx_hop;
 
 	if (sdev->busy_poll)
 		flags |= RING_FLAG_NO_INTERRUPT;
+	else
+		start_poll = tbstream_dev_start_poll;
 
 	ring = tb_ring_alloc_tx(xd->tb->nhi, -1, sdev->ring_size, flags);
 	if (!ring)
@@ -604,7 +631,8 @@ static int tbstream_dev_start(struct tbstream_dev *sdev)
 	eof_mask = BIT(TBSTREAM_DATA) | BIT(TBSTREAM_CLOSE);
 
 	ring = tb_ring_alloc_rx(xd->tb->nhi, -1, sdev->ring_size, flags,
-				e2e_tx_hop, sof_mask, eof_mask, NULL, NULL);
+				e2e_tx_hop, sof_mask, eof_mask, start_poll,
+				sdev);
 	if (!ring) {
 		ret = -ENOMEM;
 		goto err_free_tx_buffers;
@@ -621,6 +649,8 @@ static int tbstream_dev_start(struct tbstream_dev *sdev)
 	tb_ring_throttling(sdev->tx_ring.ring, sdev->throttling);
 	tb_ring_throttling(sdev->rx_ring.ring, sdev->throttling);
 
+	sdev->rx_pending = false;
+
 	tb_ring_start(sdev->tx_ring.ring);
 	tb_ring_start(sdev->rx_ring.ring);
 
@@ -667,19 +697,16 @@ static void tbstream_dev_stop(struct tbstream_dev *sdev)
 		do {
 			if (tbstream_dev_tx_drained(sdev))
 				break;
-			tbstream_dev_poll_ring(sdev, &sdev->tx_ring);
+			tbstream_ring_poll(&sdev->tx_ring);
 			fsleep(15);
 		} while (ktime_before(ktime_get(), timeout));
-
-		tb_ring_stop(sdev->tx_ring.ring);
-		tb_ring_stop(sdev->rx_ring.ring);
 	} else {
 		tb_ring_flush(sdev->tx_ring.ring, 500);
-		tb_ring_stop(sdev->tx_ring.ring);
-		tb_ring_flush(sdev->rx_ring.ring, 500);
-		tb_ring_stop(sdev->rx_ring.ring);
 	}
 
+	tb_ring_stop(sdev->tx_ring.ring);
+	tb_ring_stop(sdev->rx_ring.ring);
+
 	xd = tbstream_dev_xdomain(sdev);
 	if (xd) {
 		tb_xdomain_disable_paths(xd, sdev->out_hopid,
@@ -727,8 +754,8 @@ tbstream_dev_fops_read_iter(struct kiocb *kiocb, struct iov_iter *to)
 		return ret;
 
 	for (;;) {
-		/* When busy polling, advance any completions manually */
-		tbstream_dev_poll_ring(sdev, &sdev->rx_ring);
+		/* Advance RX completions */
+		tbstream_dev_advance_rx(sdev);
 
 		ret = tbstream_dev_valid(sdev);
 		if (ret) {
@@ -744,6 +771,8 @@ tbstream_dev_fops_read_iter(struct kiocb *kiocb, struct iov_iter *to)
 		if (tbstream_ring_available(&sdev->rx_ring))
 			break;
 
+		/* Polled all we could. Re-enable the interrupt now. */
+		tbstream_dev_complete_rx(sdev);
 		mutex_unlock(&sdev->lock);
 
 		if (nowait)
@@ -755,6 +784,7 @@ tbstream_dev_fops_read_iter(struct kiocb *kiocb, struct iov_iter *to)
 			cond_resched();
 		} else {
 			ret = wait_event_interruptible(sdev->wait,
+					READ_ONCE(sdev->rx_pending) ||
 					tbstream_ring_available(&sdev->rx_ring) ||
 					tbstream_dev_valid(sdev) != 0 ||
 					tbstream_dev_closed(sdev) ||
@@ -839,7 +869,9 @@ tbstream_dev_fops_write_iter(struct kiocb *kiocb, struct iov_iter *from)
 		return ret;
 
 	for (;;) {
-		tbstream_dev_poll_ring(sdev, &sdev->tx_ring);
+		/* When busy polling, advance any completions manually */
+		if (sdev->busy_poll)
+			tbstream_ring_poll(&sdev->tx_ring);
 
 		ret = tbstream_dev_valid(sdev);
 		if (ret) {
@@ -919,14 +951,23 @@ tbstream_dev_fops_poll(struct file *file, struct poll_table_struct *wait)
 
 	poll_wait(file, &sdev->wait, wait);
 	guard(mutex)(&sdev->lock);
-	if (tbstream_dev_valid(sdev) != 0) {
-		mask |= EPOLLHUP | EPOLLERR;
-	} else {
-		if (tbstream_ring_available(&sdev->tx_ring))
-			mask |= EPOLLOUT | EPOLLWRNORM;
-		if (tbstream_ring_available(&sdev->rx_ring))
-			mask |= EPOLLIN | EPOLLRDNORM;
-	}
+	if (tbstream_dev_valid(sdev) != 0)
+		return EPOLLHUP | EPOLLERR;
+
+	/*
+	 * The RX completions are only advanced from here and from
+	 * read(2) so do that now, otherwise we would never report
+	 * anything to be available.
+	 */
+	tbstream_dev_advance_rx(sdev);
+
+	if (tbstream_ring_available(&sdev->tx_ring))
+		mask |= EPOLLOUT | EPOLLWRNORM;
+	if (tbstream_ring_available(&sdev->rx_ring))
+		mask |= EPOLLIN | EPOLLRDNORM;
+	else
+		tbstream_dev_complete_rx(sdev);
+
 	return mask;
 }
 
-- 
2.50.1

