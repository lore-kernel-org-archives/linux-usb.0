Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4291145C6E5
	for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2026 08:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789634291; cv=none; b=u8XbWT3dNQykZqDxGXFsjuoahgUqMBHs2rg0VO2ad+7TS5PcjllXPTLuA2WekGzETZnDTwEEwx5eZDiPZ7E7mN9+rCg3XE2ZbX33EV+OlLohxNzM0UWVJKzmrlJP0QsEPDWpYIS+kSxyFVxEllbPiHDuc/LSS5hSeuNskTsDv6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789634291; c=relaxed/simple;
	bh=NFiuvprUd9xl7Cql19hMxPPGA2Xy/C1R4FO820KTX1o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T97gU+A9ULmAYMH8qt5Mi7TZjsE7iNpX7YWT+v0a03e/OwTnPbdox3txZ/L6uEVOSmpTrcCuT3aCw19d8g1qJ0oakee0THxtVTuik04zvEny7hNwxsfJWIwJHHZy2TW0GGXuQD06FF6ndjCIc2J2wr2Pe/LiirOD3i54mVqaHPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kFDa+Qj9; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kFDa+Qj9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789634281; x=1821170281;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NFiuvprUd9xl7Cql19hMxPPGA2Xy/C1R4FO820KTX1o=;
  b=kFDa+Qj9JJEcrwnSM6n0lwPbT2m3BdIxasGEmX5FWbQUHc7WvsJZhoyb
   ai88C36u2+XbTqQ+/iCwULlcfwPodLDvZuBzsYHPXB+UHldsDHa1FPIl2
   maNWsXZNV4cwrkm7KmgpRQnNBPyM2eLZfuCX1eKcZ+ovSS4YeTZTochz3
   RrRCHryw86GmV9NVJxLFZ1krdFmb58sGqbBq58dNvRkgK2WHZlsFh1I7e
   rZ9esVaW415YSX1remfkLZCjrSMGAWxLDPWzuYYdSGz4qzdm+ibVeUeT5
   iXFELCk5LQIi5UIWfQGUf8Uz/OFvxRGk0nLVp2n9KZHr5q0EuQoNhYRhJ
   g==;
X-CSE-ConnectionGUID: SRRrE2/cTEiKaoSqu0aBaQ==
X-CSE-MsgGUID: GYHNKzfLSKavTkO5HvPKWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="101377944"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="101377944"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 01:37:54 -0700
X-CSE-ConnectionGUID: KjR4/YFrTaSYg93VapwdmA==
X-CSE-MsgGUID: RLFFPWBfT1qudZf1ioAOJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="2061652"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa013.fm.intel.com with ESMTP; 17 Sep 2026 01:37:53 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id A9EA29B; Thu, 17 Sep 2026 10:37:51 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH] thunderbolt: stream: Improve CLOSE handling on write side
Date: Thu, 17 Sep 2026 10:37:51 +0200
Message-ID: <20260917083751.1016703-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If there is only a writer in the stream (i.e the other side just reads
and this side just writes) then if the other side is closed the CLOSE
packet does is never picked up from the writers RX ring because we do
not complete the RX poll. Currently we do that only when something is
actually reading the stream.

To make this work on write-only stream, complete the RX poll also during
->write_iter(), and then make the stream return -EPIPE to the writer.

While there make sdev->closed to use READ/WRITE_ONCE() analogous to
other flags.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/stream.c | 148 ++++++++++++++++++++++++++---------
 1 file changed, 111 insertions(+), 37 deletions(-)

diff --git a/drivers/thunderbolt/stream.c b/drivers/thunderbolt/stream.c
index e2b4896dfafb..a49b0b62518d 100644
--- a/drivers/thunderbolt/stream.c
+++ b/drivers/thunderbolt/stream.c
@@ -133,13 +133,18 @@ struct tbstream_ring {
  * @busy_poll: Instead of interrupts, busy poll the rings
  * @rx_pending: Receive ring has completions that need to be advanced
  * @users: Number of times @cdev has been opened
- * @closed: CLOSE packet was received
+ * @close_received: CLOSE packet appeared in the RX ring
+ * @closed: CLOSE packet was handled in the read side
  * @removed: Userspace removed the ConfigFS group underneath.
  * @wait: Waitqueue for open, read and write
  * @lock: Lock protecting this structure
  * @tx_ring: Transmit ring
  * @rx_ring: Receive ring
  * @list: Stream devices are linked through this
+ *
+ * @close_received is used on write side to notify the writer that the
+ * other side sent CLOSE. @closed on the other hand is used on the read
+ * side to make read(2) return EOF to the caller.
  */
 struct tbstream_dev {
 	struct config_group group;
@@ -154,6 +159,7 @@ struct tbstream_dev {
 	bool busy_poll;
 	bool rx_pending;
 	int users;
+	bool close_received;
 	bool closed;
 	bool removed;
 	wait_queue_head_t wait;
@@ -348,9 +354,19 @@ static inline bool tbstream_dev_removed(const struct tbstream_dev *sdev)
 	return sdev->removed;
 }
 
+static inline bool tbstream_dev_close_received(const struct tbstream_dev *sdev)
+{
+	return READ_ONCE(sdev->close_received);
+}
+
 static inline bool tbstream_dev_closed(const struct tbstream_dev *sdev)
 {
-	return sdev->closed;
+	return READ_ONCE(sdev->closed);
+}
+
+static inline bool tbstream_dev_rx_pending(const struct tbstream_dev *sdev)
+{
+	return READ_ONCE(sdev->rx_pending);
 }
 
 static void
@@ -366,12 +382,19 @@ tbstream_dev_rx_callback(struct tb_ring *ring, struct ring_frame *frame,
 	sf->completed = true;
 	sdev->rx_ring.prod++;
 
-	if (sf->frame.flags & RING_DESC_CRC_ERROR)
+	if (sf->frame.flags & RING_DESC_CRC_ERROR) {
 		pr_warn("RX CRC error\n");
-	else if (sf->frame.flags & RING_DESC_BUFFER_OVERRUN)
+	} else if (sf->frame.flags & RING_DESC_BUFFER_OVERRUN) {
 		pr_warn("RX buffer overrun\n");
-	else
-		wake_up_interruptible_poll(&sdev->wait, EPOLLIN | EPOLLRDNORM);
+	} else {
+		__poll_t mask = EPOLLIN | EPOLLRDNORM;
+
+		if (sf->frame.eof == TBSTREAM_CLOSE) {
+			WRITE_ONCE(sdev->close_received, true);
+			mask |= EPOLLHUP;
+		}
+		wake_up_interruptible_poll(&sdev->wait, mask);
+	}
 }
 
 static struct tbstream_frame *
@@ -551,23 +574,24 @@ tbstream_dev_send_data(struct tbstream_dev *sdev, struct iov_iter *from,
 static int tbstream_dev_send_close(struct tbstream_dev *sdev)
 {
 	struct tbstream_frame *sf;
+	ktime_t timeout;
 
-	if (sdev->busy_poll) {
+	/*
+	 * Wait for the ring to have available slots before we send the
+	 * CLOSE packet.
+	 */
+	timeout = ktime_add_ms(ktime_get(), 500);
+	do {
+		if (tbstream_ring_available(&sdev->tx_ring))
+			break;
 		/*
-		 * When busy polling it's the write(2) path that
-		 * advances the completions so it is possible that the
-		 * ring is full at this point. Advance the ring here so
-		 * that there is room for the CLOSE packet to be sent.
+		 * For busy polling we need to advance the ring here as
+		 * well to make the slots available.
 		 */
-		ktime_t timeout = ktime_add_ms(ktime_get(), 500);
-
-		do {
-			if (tbstream_ring_available(&sdev->tx_ring))
-				break;
+		if (sdev->busy_poll)
 			tbstream_ring_poll(&sdev->tx_ring);
-			fsleep(15);
-		} while (ktime_before(ktime_get(), timeout));
-	}
+		fsleep(15);
+	} while (ktime_before(ktime_get(), timeout));
 
 	sf = tbstream_dev_alloc_tx(sdev, TBSTREAM_CLOSE, NULL, SZ_256);
 	if (IS_ERR(sf))
@@ -743,6 +767,13 @@ static int tbstream_dev_busy_poll_wait(struct tbstream_dev *sdev,
 			return -ERESTARTSYS;
 		if (tb_ring_poll_pending(ring->ring))
 			return 0;
+		/*
+		 * For TX ring we need to check the RX side too because
+		 * it might have received CLOSE packet.
+		 */
+		if (ring == &sdev->tx_ring &&
+		    tb_ring_poll_pending(sdev->rx_ring.ring))
+			return 0;
 		if (tbstream_dev_valid(sdev) != 0 ||
 		    tbstream_dev_closed(sdev) || tbstream_dev_removed(sdev))
 			return 0;
@@ -750,6 +781,22 @@ static int tbstream_dev_busy_poll_wait(struct tbstream_dev *sdev,
 	}
 }
 
+static bool
+tbstream_dev_has_event(struct tbstream_dev *sdev, struct tbstream_ring *ring)
+{
+	if (tbstream_dev_valid(sdev) != 0)
+		return true;
+	if (tbstream_dev_closed(sdev))
+		return true;
+	if (tbstream_dev_removed(sdev))
+		return true;
+	if (tbstream_dev_rx_pending(sdev))
+		return true;
+	if (tbstream_ring_available(ring))
+		return true;
+	return tb_ring_poll_pending(sdev->rx_ring.ring);
+}
+
 static ssize_t
 tbstream_dev_fops_read_iter(struct kiocb *kiocb, struct iov_iter *to)
 {
@@ -798,12 +845,7 @@ tbstream_dev_fops_read_iter(struct kiocb *kiocb, struct iov_iter *to)
 				return ret;
 		} else {
 			ret = wait_event_interruptible(sdev->wait,
-					READ_ONCE(sdev->rx_pending) ||
-					tb_ring_poll_pending(sdev->rx_ring.ring) ||
-					tbstream_ring_available(&sdev->rx_ring) ||
-					tbstream_dev_valid(sdev) != 0 ||
-					tbstream_dev_closed(sdev) ||
-					tbstream_dev_removed(sdev));
+				tbstream_dev_has_event(sdev, &sdev->rx_ring));
 			if (ret)
 				return ret;
 		}
@@ -830,7 +872,7 @@ tbstream_dev_fops_read_iter(struct kiocb *kiocb, struct iov_iter *to)
 		if (sf->frame.eof == TBSTREAM_CLOSE) {
 			if (!nbytes) {
 				tbstream_dev_consume_rx(sdev);
-				sdev->closed = true;
+				WRITE_ONCE(sdev->closed, true);
 			}
 			break;
 		}
@@ -866,6 +908,25 @@ tbstream_dev_fops_read_iter(struct kiocb *kiocb, struct iov_iter *to)
 	return nbytes;
 }
 
+static void tbstream_dev_advance_both(struct tbstream_dev *sdev)
+{
+	/*
+	 * When busy polling, advance TX completions manually.
+	 *
+	 * We also need to advance the RX side in both modes to be able
+	 * to receive CLOSE packet from the other peer if there is no
+	 * reader.
+	 */
+	if (sdev->busy_poll) {
+		tbstream_ring_poll(&sdev->tx_ring);
+		tbstream_dev_advance_rx(sdev);
+	} else if (tbstream_dev_rx_pending(sdev) ||
+		   tb_ring_poll_pending(sdev->rx_ring.ring)) {
+		tbstream_dev_advance_rx(sdev);
+		tbstream_dev_complete_rx(sdev);
+	}
+}
+
 static ssize_t
 tbstream_dev_fops_write_iter(struct kiocb *kiocb, struct iov_iter *from)
 {
@@ -884,9 +945,8 @@ tbstream_dev_fops_write_iter(struct kiocb *kiocb, struct iov_iter *from)
 		return ret;
 
 	for (;;) {
-		/* When busy polling, advance any completions manually */
-		if (sdev->busy_poll)
-			tbstream_ring_poll(&sdev->tx_ring);
+		/* Advance TX (and RX) completions */
+		tbstream_dev_advance_both(sdev);
 
 		ret = tbstream_dev_valid(sdev);
 		if (ret) {
@@ -894,7 +954,12 @@ tbstream_dev_fops_write_iter(struct kiocb *kiocb, struct iov_iter *from)
 			return ret;
 		}
 
-		if (tbstream_dev_closed(sdev) || tbstream_dev_removed(sdev)) {
+		if (tbstream_dev_close_received(sdev)) {
+			mutex_unlock(&sdev->lock);
+			return -EPIPE;
+		}
+
+		if (tbstream_dev_removed(sdev)) {
 			mutex_unlock(&sdev->lock);
 			return -ENXIO;
 		}
@@ -913,10 +978,8 @@ tbstream_dev_fops_write_iter(struct kiocb *kiocb, struct iov_iter *from)
 				return ret;
 		} else {
 			ret = wait_event_interruptible(sdev->wait,
-					tbstream_ring_available(&sdev->tx_ring) ||
-					tbstream_dev_valid(sdev) != 0 ||
-					tbstream_dev_closed(sdev) ||
-					tbstream_dev_removed(sdev));
+				tbstream_dev_has_event(sdev, &sdev->tx_ring) ||
+				tbstream_dev_close_received(sdev));
 			if (ret)
 				return ret;
 		}
@@ -976,6 +1039,8 @@ tbstream_dev_fops_poll(struct file *file, struct poll_table_struct *wait)
 	 */
 	tbstream_dev_advance_rx(sdev);
 
+	if (tbstream_dev_close_received(sdev))
+		mask |= EPOLLHUP;
 	if (tbstream_ring_available(&sdev->tx_ring))
 		mask |= EPOLLOUT | EPOLLWRNORM;
 	if (tbstream_ring_available(&sdev->rx_ring)) {
@@ -1035,6 +1100,8 @@ static int tbstream_dev_fops_open(struct inode *inode, struct file *file)
 			sdev->users--;
 			goto err_unlock;
 		}
+
+		sdev->close_received = false;
 		sdev->closed = false;
 	}
 
@@ -1055,12 +1122,19 @@ static int tbstream_dev_fops_release(struct inode *inode, struct file *file)
 
 	mutex_lock(&sdev->lock);
 	if (--sdev->users == 0) {
+		/*
+		 * Advance now in case there is CLOSE waiting in the RX
+		 * ring.
+		 */
+		tbstream_dev_advance_both(sdev);
 		/*
 		 * Send CLOSE tunneled packet to notify the other end
-		 * that we are closing the file. We do this twice if the
-		 * first one fails.
+		 * that we are closing the file, if it is not closed
+		 * already.
 		 */
-		tbstream_dev_send_close(sdev);
+		if (!tbstream_dev_close_received(sdev) &&
+		    tbstream_dev_valid(sdev) == 0)
+			tbstream_dev_send_close(sdev);
 		tbstream_dev_stop(sdev);
 	}
 	mutex_unlock(&sdev->lock);
-- 
2.50.1

