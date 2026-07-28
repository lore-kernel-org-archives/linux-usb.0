Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE0042CB0A
	for <linux-usb@vger.kernel.org>; Tue, 28 Jul 2026 11:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785239508; cv=none; b=iNocEcpRB7Br12RrI+Y2kclzsChbrN0u4SG0MonwRqnXlWh317uAco+1BK08+UvqjZcGigTQveha3XKwJ3B34MghGyjNWQEPVWtoKA06tlSRhMjUSD1F6+C8Rv5YxqE/Ah2xqcuX39RH0/K8AzL7t6EF2u5iLOMq/yKBqqHInt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785239508; c=relaxed/simple;
	bh=JKv13jN/7ryP6ULexYMG2RRjfa9GeGotcXDWsmxcIDg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QXzqIxKfiAa9GJP4oB46RDLPivGKE8d1qAFSkvzfvYWzrtcBT5ZcXbzZ2vZEPkYUMduvov6ReAZf3NTcVK/4t2RQycNITjNwrXWwbzOzcRJtz88Djlor2k/IbFV47f+E+71MzCa3nnxCYU1cytFdG/dSeZuJHe7QYA4Fx33m7jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FurbRMOu; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FurbRMOu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785239507; x=1816775507;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JKv13jN/7ryP6ULexYMG2RRjfa9GeGotcXDWsmxcIDg=;
  b=FurbRMOuuKn4kKNRUaquLwCCo4mIqM7BTZ12cvVDAYO3IN5+OrSJXAY/
   d0904tfBvzn0KJxHHdVm5g96az5y5Pse0/QPVluF5W1t8Z/Onw4m0k2fE
   erXFQhvvaHNwPuH6YFdkWoohNJsOhAyjCtSfKpiyKw/4pIu8Fr1R2xUCi
   4s9fmxW7YrVugDB4l1aud8oKqdR9Lz2I1ZwkYzNDkAkayNxVEhvxhfSvK
   2HWLRFNT09HrsHr5thfyCkLquzXKH1brSyaEOtHIbZ4sbni5kg4Y/MccK
   h+NA9Qq+XzfLZCjCHBvYPVPnA58lkVVOuYNTHHynu6WYOHN6girX/S0gU
   w==;
X-CSE-ConnectionGUID: DX9+e9/gTYGTZGGRiBrUGw==
X-CSE-MsgGUID: 3SteBicLTUuKjpKN7R5T5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="103227213"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="103227213"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 04:51:44 -0700
X-CSE-ConnectionGUID: ehSNGpmYS4S5fU0qPCF+VQ==
X-CSE-MsgGUID: MHAwA/srQHOKdVR/xTojAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="263991658"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa005.jf.intel.com with ESMTP; 28 Jul 2026 04:51:43 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 5C7F99E; Tue, 28 Jul 2026 13:51:41 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 3/5] thunderbolt: stream: Support IOCB_NOWAIT in non-blocking I/O as well
Date: Tue, 28 Jul 2026 13:51:39 +0200
Message-ID: <20260728115141.2585464-4-mika.westerberg@linux.intel.com>
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

For read_iter/write_iter() it is also possible to pass IOCB_NOWAIT with
the kiocb to indicate non-blocking read/write. For instance io_uring
does this. So take this into account on read and write paths.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/stream.c | 40 +++++++++++++++++++++++++++---------
 1 file changed, 30 insertions(+), 10 deletions(-)

diff --git a/drivers/thunderbolt/stream.c b/drivers/thunderbolt/stream.c
index 20e6ad586879..06c8620708b1 100644
--- a/drivers/thunderbolt/stream.c
+++ b/drivers/thunderbolt/stream.c
@@ -633,10 +633,23 @@ static void tbstream_dev_stop(struct tbstream_dev *sdev)
 	sdev->tx_ring.ring = NULL;
 }
 
+static int tbstream_dev_lock(struct tbstream_dev *sdev, bool nowait)
+{
+	if (nowait) {
+		if (!mutex_trylock(&sdev->lock))
+			return -EAGAIN;
+	} else {
+		if (mutex_lock_interruptible(&sdev->lock))
+			return -ERESTARTSYS;
+	}
+	return 0;
+}
+
 static ssize_t
 tbstream_dev_fops_read_iter(struct kiocb *kiocb, struct iov_iter *to)
 {
 	struct file *file = kiocb->ki_filp;
+	bool nowait = file->f_flags & O_NONBLOCK || kiocb->ki_flags & IOCB_NOWAIT;
 	struct tbstream_dev *sdev = to_tbstream_dev(file->private_data);
 	size_t nbytes;
 	int ret;
@@ -645,14 +658,16 @@ tbstream_dev_fops_read_iter(struct kiocb *kiocb, struct iov_iter *to)
 	if (ret)
 		return ret;
 
-	if (mutex_lock_interruptible(&sdev->lock))
-		return -ERESTARTSYS;
+	ret = tbstream_dev_lock(sdev, nowait);
+	if (ret)
+		return ret;
 
 	while (!tbstream_ring_available(&sdev->rx_ring)) {
 		mutex_unlock(&sdev->lock);
 
-		if (file->f_flags & O_NONBLOCK)
+		if (nowait)
 			return -EAGAIN;
+
 		ret = wait_event_interruptible(sdev->wait,
 				tbstream_ring_available(&sdev->rx_ring) ||
 				tbstream_dev_valid(sdev) != 0 ||
@@ -668,8 +683,9 @@ tbstream_dev_fops_read_iter(struct kiocb *kiocb, struct iov_iter *to)
 		if (tbstream_dev_closed(sdev) || tbstream_dev_removed(sdev))
 			return 0;
 
-		if (mutex_lock_interruptible(&sdev->lock))
-			return -ERESTARTSYS;
+		ret = tbstream_dev_lock(sdev, nowait);
+		if (ret)
+			return ret;
 	}
 
 	nbytes = 0;
@@ -729,6 +745,7 @@ static ssize_t
 tbstream_dev_fops_write_iter(struct kiocb *kiocb, struct iov_iter *from)
 {
 	struct file *file = kiocb->ki_filp;
+	bool nowait = file->f_flags & O_NONBLOCK || kiocb->ki_flags & IOCB_NOWAIT;
 	struct tbstream_dev *sdev = to_tbstream_dev(file->private_data);
 	size_t nbytes;
 	int ret;
@@ -737,14 +754,16 @@ tbstream_dev_fops_write_iter(struct kiocb *kiocb, struct iov_iter *from)
 	if (ret)
 		return ret;
 
-	if (mutex_lock_interruptible(&sdev->lock))
-		return -ERESTARTSYS;
+	ret = tbstream_dev_lock(sdev, nowait);
+	if (ret)
+		return ret;
 
 	while (!tbstream_ring_available(&sdev->tx_ring)) {
 		mutex_unlock(&sdev->lock);
 
-		if (file->f_flags & O_NONBLOCK)
+		if (nowait)
 			return -EAGAIN;
+
 		ret = wait_event_interruptible(sdev->wait,
 				tbstream_ring_available(&sdev->tx_ring) ||
 				tbstream_dev_valid(sdev) != 0 ||
@@ -760,8 +779,9 @@ tbstream_dev_fops_write_iter(struct kiocb *kiocb, struct iov_iter *from)
 		if (tbstream_dev_closed(sdev) || tbstream_dev_removed(sdev))
 			return -ENXIO;
 
-		if (mutex_lock_interruptible(&sdev->lock))
-			return -ERESTARTSYS;
+		ret = tbstream_dev_lock(sdev, nowait);
+		if (ret)
+			return ret;
 	}
 
 	nbytes = 0;
-- 
2.50.1

