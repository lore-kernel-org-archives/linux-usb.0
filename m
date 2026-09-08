Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5F83B47EB
	for <linux-usb@vger.kernel.org>; Tue,  8 Sep 2026 08:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788855297; cv=none; b=oqSaZlA1GLTmVQ9jwkwvXJP//2mlKRYU70mrXGyFcOUu/TR5slG/qRIxMauNI6msiqYIR2FGQCA+4jisSF1t+28dgMfKIKay1LxxF9geG+xzzzpZWQW505hHO7iBUoQzcpoA0/alHURK/v7UZ3sff/IZBTyfIyRiD/1vcRhiLcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788855297; c=relaxed/simple;
	bh=Osv5B6K1xqkyaVB5fGyFGFH8xIzDGlqyO+ehHMPxhhg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VAW2XVHD+zJVDgKhdu44vPuVHP+ZQiq89tXW41mv0O1HP78Z9mteeHQ7pFcBsliOJoTs7AgFm6Ek0nvXooJtBXtJQAM9hKRXEsKfrA5kNU6F/XxhOzpbpjlAY/cyxRH9o90aRaPnkAxmfzCIwAsfafVlYHaW7X1dpanZZgvkjLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iN7LVlSd; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iN7LVlSd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788855296; x=1820391296;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Osv5B6K1xqkyaVB5fGyFGFH8xIzDGlqyO+ehHMPxhhg=;
  b=iN7LVlSdgtPf94cjSr16a0FqJJlvkzbBIhv9nuZ+N6qJuPaH60EsDFka
   NUzqxLJRRPd6ak1ZLqLacdGy4VQvLxqh+Kmffp7L98+8wNJnYoPfahKs3
   Mmwdkbc31Pu8NGQczVwvpPEss5ZkZ/Xzc3sIHnHYqD8kWqe9jTdQh+mjv
   yV58hDdPrFIkyhJTE4YNpTIi3rn6ZldVonIs7m/6PpCgUp1zUNB6z+2op
   KZQREEiqzS3Mqjpxen9NUwkvzwryH7fAZRnATj3yr7YqfqrMu6+nSWP9H
   vkcbqeZVlcIua78kno/9S6NjAAqpdjVsH1udEg+8rdR7xvDYv8vJqzfOR
   A==;
X-CSE-ConnectionGUID: 0+XFje8NSf+9KDuafV2ckw==
X-CSE-MsgGUID: 8BUWj3BYRwe3oaZ3rSc8Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="88399801"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="88399801"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 01:14:52 -0700
X-CSE-ConnectionGUID: X6IcTgYWT4iRuu6Nw6quZw==
X-CSE-MsgGUID: xE0bAXEbQkOmezU2F1iDLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="268353668"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 08 Sep 2026 01:14:50 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id C91009E; Tue, 08 Sep 2026 10:14:49 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 3/4] thunderbolt: stream: Do not hold the lock while busy polling
Date: Tue,  8 Sep 2026 10:14:48 +0200
Message-ID: <20260908081449.3424884-4-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260908081449.3424884-1-mika.westerberg@linux.intel.com>
References: <20260908081449.3424884-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When in busy poll mode with a reader and writer, and there is nothing
completed on the rings both sides keep taking and releasing the lock
from each other and this can cause stalls. Avoid this by calling the new
API function tb_ring_poll_pending() that only returns true if there is
anything available in which case they can take the lock and know there
is now work to do.

Reported-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Assisted-by: LLM
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/stream.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/thunderbolt/stream.c b/drivers/thunderbolt/stream.c
index 7b618d8a7d82..b4f3b1db9d82 100644
--- a/drivers/thunderbolt/stream.c
+++ b/drivers/thunderbolt/stream.c
@@ -734,6 +734,22 @@ static int tbstream_dev_lock(struct tbstream_dev *sdev, bool nowait)
 	return 0;
 }
 
+/* Must not be called with @sdev->lock held */
+static int tbstream_dev_busy_poll_wait(struct tbstream_dev *sdev,
+				       struct tbstream_ring *ring)
+{
+	for (;;) {
+		if (signal_pending(current))
+			return -ERESTARTSYS;
+		if (tb_ring_poll_pending(ring->ring))
+			return 0;
+		if (tbstream_dev_valid(sdev) != 0 ||
+		    tbstream_dev_closed(sdev) || tbstream_dev_removed(sdev))
+			return 0;
+		cond_resched();
+	}
+}
+
 static ssize_t
 tbstream_dev_fops_read_iter(struct kiocb *kiocb, struct iov_iter *to)
 {
@@ -777,9 +793,9 @@ tbstream_dev_fops_read_iter(struct kiocb *kiocb, struct iov_iter *to)
 			return -EAGAIN;
 
 		if (sdev->busy_poll) {
-			if (signal_pending(current))
-				return -ERESTARTSYS;
-			cond_resched();
+			ret = tbstream_dev_busy_poll_wait(sdev, &sdev->rx_ring);
+			if (ret)
+				return ret;
 		} else {
 			ret = wait_event_interruptible(sdev->wait,
 					READ_ONCE(sdev->rx_pending) ||
@@ -891,9 +907,9 @@ tbstream_dev_fops_write_iter(struct kiocb *kiocb, struct iov_iter *from)
 			return -EAGAIN;
 
 		if (sdev->busy_poll) {
-			if (signal_pending(current))
-				return -ERESTARTSYS;
-			cond_resched();
+			ret = tbstream_dev_busy_poll_wait(sdev, &sdev->tx_ring);
+			if (ret)
+				return ret;
 		} else {
 			ret = wait_event_interruptible(sdev->wait,
 					tbstream_ring_available(&sdev->tx_ring) ||
-- 
2.50.1

