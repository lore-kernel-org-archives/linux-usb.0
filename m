Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104163B5303
	for <linux-usb@vger.kernel.org>; Tue,  8 Sep 2026 08:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788855299; cv=none; b=r7SxpqRuuvabORQYOfHcCEhy0/2VFwJ3P1mAoNBhWuiuvD2gH7qw89ZWpCERzMqy4aV4gCR1MRevCBYMcSACOc91RFSr2W2X2tq8C5WB+iB3n7bXYBZAy2SUxmAq43XypKKfPdufLeH8QHRsbgavKLcBqLN6pbBzRxDZ5j7sPSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788855299; c=relaxed/simple;
	bh=/so9RyOQolgltVbvI6HrrcGh/KISM0Fcn1FpepLzFik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wq2BydCg2Oh5SdUcGsuvFAF/o/Rq1Kvw6i9kWs2tdZVOcaCpX4SF2m9ltyA8zFLjJNU5X0QJa3Z7Op86qZ9l1bHDs8sgtWzxlegtd7NTR7Cha/L3ytoeEMvvsoPA9OL6ZnDtu2yi2rF1RBGeuIwolapjt/noya4vnK5XBWwsQek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NKipcDI9; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NKipcDI9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788855298; x=1820391298;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/so9RyOQolgltVbvI6HrrcGh/KISM0Fcn1FpepLzFik=;
  b=NKipcDI9/qs177FXLzzU7YS0ziQdh7T/njVD0IGDtxj+7Lt9QhL75MYO
   DCeRTk60leOTZTdrxOvZpeEcF2tG52gXXhiCkhoaynsCSyNiG4PbU3I7i
   2RbQ98ubrxE0rWzK/4qw69fACmwNDQTdv4IUbZzBMryqYcmcbn80lzWpz
   QbZwJhKYVFE3Xfy6SpP0Plhe93mwdAltjblXjk2wbme+r/5xRTD1xsUMa
   wvsbT6dmW/LkfePjVZaI+daReJ6XAJFGEzwMjoRhUJFREn33u7eo/vwW3
   bLLPV/Jd4YKyYRhEF34IW7vxvnMQhfty9wy+cSBxhlLftnRFGbYrI22lW
   A==;
X-CSE-ConnectionGUID: S9GVT48VQc6nSrqweK1XZw==
X-CSE-MsgGUID: npn813TQRL2SNatG0Roi2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="88399807"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="88399807"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 01:14:52 -0700
X-CSE-ConnectionGUID: rmj9h+btSG6xBVHeczbCQg==
X-CSE-MsgGUID: DhLyUGNsTQONezUh0zkBuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="268353670"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 08 Sep 2026 01:14:50 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id CC687A1; Tue, 08 Sep 2026 10:14:49 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 4/4] thunderbolt: stream: Check the Rx ring before task starts sleeping
Date: Tue,  8 Sep 2026 10:14:49 +0200
Message-ID: <20260908081449.3424884-5-mika.westerberg@linux.intel.com>
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

In interrupt mode when tb_ring_poll_complete() is called it is possible
that a frame was completed right before the ring interrupt was unmasked
in which case there will be no interrupt and the task starts sleeping.
Avoid this and check if there is anything completed prior putting the
task to sleep. The same can happen with poll() so check the ring there
too before reporting that there is nothing to read.

Assisted-by: LLM
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/stream.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/stream.c b/drivers/thunderbolt/stream.c
index b4f3b1db9d82..e2b4896dfafb 100644
--- a/drivers/thunderbolt/stream.c
+++ b/drivers/thunderbolt/stream.c
@@ -799,6 +799,7 @@ tbstream_dev_fops_read_iter(struct kiocb *kiocb, struct iov_iter *to)
 		} else {
 			ret = wait_event_interruptible(sdev->wait,
 					READ_ONCE(sdev->rx_pending) ||
+					tb_ring_poll_pending(sdev->rx_ring.ring) ||
 					tbstream_ring_available(&sdev->rx_ring) ||
 					tbstream_dev_valid(sdev) != 0 ||
 					tbstream_dev_closed(sdev) ||
@@ -977,10 +978,13 @@ tbstream_dev_fops_poll(struct file *file, struct poll_table_struct *wait)
 
 	if (tbstream_ring_available(&sdev->tx_ring))
 		mask |= EPOLLOUT | EPOLLWRNORM;
-	if (tbstream_ring_available(&sdev->rx_ring))
+	if (tbstream_ring_available(&sdev->rx_ring)) {
 		mask |= EPOLLIN | EPOLLRDNORM;
-	else
+	} else {
 		tbstream_dev_complete_rx(sdev);
+		if (tb_ring_poll_pending(sdev->rx_ring.ring))
+			mask |= EPOLLIN | EPOLLRDNORM;
+	}
 
 	return mask;
 }
-- 
2.50.1

