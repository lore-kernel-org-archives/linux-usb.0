Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C047485941
	for <linux-usb@vger.kernel.org>; Mon, 21 Sep 2026 11:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789989566; cv=none; b=BNrXiofW0s9H6naWN5mno+dVHj5DxaiDly5L9XI4S5dcyQ2dYd7Y3rjvqBsVdVWpwpN6V36o7D/xf/oHf3diLBK6xvz9/aCcUugpa8mEjgl75WFWnp9/HVjNLoGIVG+4uciwrRh1Gdl3DKTCPX85vwGLvRt+0gJj8hq4QpPpbXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789989566; c=relaxed/simple;
	bh=wF6YMwsDN/bA80suYDczDRXETF+9kFaD30fMz9MLx0I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CwzZDXKEBQjUuzmjOBoDzKCUYVCG+kHWlhWEjFJIKPafG8QOYt85oPmAL1p2CtjjmZ/Z969cFwKHQEUzAuwUUarxXwEem+48jKXDM6xEfyr9Ae1kWJB/vuj922NAgVJV4pcXj3xmYKFG6M9PTBwx67pT1E7GRV+3Le68QHzxOdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JE8hUM70; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JE8hUM70"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789989564; x=1821525564;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wF6YMwsDN/bA80suYDczDRXETF+9kFaD30fMz9MLx0I=;
  b=JE8hUM70gynpC9jRoonLdw2YYodyH10ZegJ7LXBJsRC1/Lo0XCpR0tJV
   X+6e8UNV0G1MZvOz8dLFOfAOr3Uzm/QSOnm6+VyWT5s5YnB3g5/SH2Ovx
   1e2hBIqejnm8Uyh4ECihbza1q8yPHCPj/z26Bmjfyarr+dhah1ny7Gcg6
   vbcuJYHONTIcNSxfoaOm/6VNaQHvotS5VBNcVooYJA84g69Z4LZ+/Eazd
   qmQhNzZ+cwHph1XOcmtBVFQlSQfvfSeHNIr1s9vGe7cCIan8MVTo6WhFN
   Qi3IwKgLIPhImfAOcUN9ywtvduhLs7vS/uVGZQJV3ylHO42pxHCr2jh+w
   A==;
X-CSE-ConnectionGUID: X1VsENinQLGt3kFfNUcOjg==
X-CSE-MsgGUID: ndG/2soyQmSTER/LDV8Qtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="116022112"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="116022112"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 04:19:24 -0700
X-CSE-ConnectionGUID: gIfvFEqxRXyy4Of8z+5ldA==
X-CSE-MsgGUID: qi7BfFnDTcm3wu/lpbtOIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="280649193"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa005.fm.intel.com with ESMTP; 21 Sep 2026 04:19:22 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id BF17299; Mon, 21 Sep 2026 13:19:21 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH] thunderbolt: stream: Make read return framing error to the userspace
Date: Mon, 21 Sep 2026 13:19:21 +0200
Message-ID: <20260921111921.3289289-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If any of the frames are corrupted during the receive we currently log a
warning and pass them to the userspace without it knowing they were
corrupted. Make the driver behave better and return an error (-EIO) to
the userspace in that case.

For the CLOSE packet, payload does not matter so we handle it the usual
way.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/stream.c | 36 ++++++++++++++++++++++++------------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/drivers/thunderbolt/stream.c b/drivers/thunderbolt/stream.c
index a49b0b62518d..bdcca78f3449 100644
--- a/drivers/thunderbolt/stream.c
+++ b/drivers/thunderbolt/stream.c
@@ -375,6 +375,7 @@ tbstream_dev_rx_callback(struct tb_ring *ring, struct ring_frame *frame,
 {
 	struct tbstream_frame *sf = container_of(frame, typeof(*sf), frame);
 	struct tbstream_dev *sdev = sf->sdev;
+	__poll_t mask;
 
 	if (canceled)
 		return;
@@ -382,19 +383,17 @@ tbstream_dev_rx_callback(struct tb_ring *ring, struct ring_frame *frame,
 	sf->completed = true;
 	sdev->rx_ring.prod++;
 
-	if (sf->frame.flags & RING_DESC_CRC_ERROR) {
-		pr_warn("RX CRC error\n");
-	} else if (sf->frame.flags & RING_DESC_BUFFER_OVERRUN) {
-		pr_warn("RX buffer overrun\n");
-	} else {
-		__poll_t mask = EPOLLIN | EPOLLRDNORM;
-
-		if (sf->frame.eof == TBSTREAM_CLOSE) {
-			WRITE_ONCE(sdev->close_received, true);
-			mask |= EPOLLHUP;
-		}
-		wake_up_interruptible_poll(&sdev->wait, mask);
+	mask = EPOLLIN | EPOLLRDNORM;
+	/*
+	 * The CLOSE packet does not have a payload so the flags do not
+	 * matter. The read_iter() deals with the flags.
+	 */
+	if (sf->frame.eof == TBSTREAM_CLOSE) {
+		WRITE_ONCE(sdev->close_received, true);
+		mask |= EPOLLHUP;
 	}
+
+	wake_up_interruptible_poll(&sdev->wait, mask);
 }
 
 static struct tbstream_frame *
@@ -875,6 +874,19 @@ tbstream_dev_fops_read_iter(struct kiocb *kiocb, struct iov_iter *to)
 				WRITE_ONCE(sdev->closed, true);
 			}
 			break;
+		} else if (sf->frame.flags &
+			   (RING_DESC_CRC_ERROR | RING_DESC_BUFFER_OVERRUN)) {
+			/*
+			 * If something was already read return that now
+			 * and next read will report the error.
+			 */
+			if (!nbytes) {
+				pr_warn("corrupted frame received, flags %#x\n",
+					sf->frame.flags);
+				tbstream_dev_consume_rx(sdev);
+				ret = -EIO;
+			}
+			break;
 		}
 
 		sf_size = tb_ring_frame_size(&sf->frame);
-- 
2.50.1

