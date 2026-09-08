Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0323B4E94
	for <linux-usb@vger.kernel.org>; Tue,  8 Sep 2026 08:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788855300; cv=none; b=ByY2RLaAqZLPw/H+2IZUkz06IBVkyWfT/hPvyyMABUIlV7gkWwdtMBlFyL8xyU3QB0zzEJ+Y8HjaZ+4bE3eD//YInkq3ia67MWI0Tv5ynM5RxEmE4NZABqzKFEuSrymcN7HUsfG1pzUc9utI04+3/8bnixark73HsFF1//LzyZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788855300; c=relaxed/simple;
	bh=vfJNeYhuYXZt33Z0YHaRWAD5Iu4/fkK1zsHlaEqDmJk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NF+iTf7mGuh2l3NqdSWogk3+hM5YULBeGes9Klbg1Tf+8h5AZ5KKodPWZ2D17eRD5+s+x282xv8kuNJrdUgH73h8wGugx+napYXeog8ds8V5htep1uyAdJOByA86pEC/c+vlF+eMA5WqevJR31N4aBOQH8Pywj6NQQKDYqla+MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QBxP2upZ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QBxP2upZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788855298; x=1820391298;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vfJNeYhuYXZt33Z0YHaRWAD5Iu4/fkK1zsHlaEqDmJk=;
  b=QBxP2upZKw+p4yEhSNGlQ68VSnzbnrHIIdsqBIBlXuHM1ObBEKYT50PY
   gcCXj3B8MffgdGoVNzpA1QILotqKQ5l2/1WJUH2inXAvOZD8OHf9vS55s
   srI7a09hTB9DkmWk4ByajXClfVHzNP1wdqxa9RLXeLwYnkXwVoJZUe/1T
   5euPXEfo4RFxiKYCUI8okO0IhhMIXpoUO6V9Q6YzEQZaG+9v3lCL7+Y6H
   wEaM/2IITQVE8/HfAVCVHn+qIV1MFFD/bBTpxduDdukZp6Dmp9tbqbJ6Z
   LF9Yz13XyxHDBqi2ZpwrE+T2bFxZpe6rqPkN8gzS2EKyWnQ6uhZBENWEK
   w==;
X-CSE-ConnectionGUID: UStkxo/MSLmT8du3s4es/Q==
X-CSE-MsgGUID: 0MGvPJUiS7yx9cxcz2D7zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="88399798"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="88399798"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 01:14:52 -0700
X-CSE-ConnectionGUID: nHw4H4gqQqm9zTKrCZTwvw==
X-CSE-MsgGUID: E1pr0zndRj+iLgl5MUGYew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="268353669"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 08 Sep 2026 01:14:50 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id C601E9D; Tue, 08 Sep 2026 10:14:49 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 2/4] thunderbolt: Add tb_ring_poll_pending()
Date: Tue,  8 Sep 2026 10:14:47 +0200
Message-ID: <20260908081449.3424884-3-mika.westerberg@linux.intel.com>
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

This helper can be used to figure out whether tb_ring_poll() has a frame
to be returned. This can be used without the caller needing to take its
own lock.

Assisted-by: LLM
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/nhi.c   | 19 +++++++++++++++++++
 include/linux/thunderbolt.h |  1 +
 2 files changed, 20 insertions(+)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index 371ee155d98f..020db5a1f029 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -455,6 +455,25 @@ struct ring_frame *tb_ring_poll(struct tb_ring *ring)
 }
 EXPORT_SYMBOL_GPL(tb_ring_poll);
 
+/**
+ * tb_ring_poll_pending() - Does the ring have completed frame
+ * @ring: Ring to check
+ *
+ * Can be used to check whether there is a completed frame in the ring
+ * that next call to tb_ring_poll() returns.
+ *
+ * Return: %true if a completed frame is waiting, %false otherwise.
+ */
+bool tb_ring_poll_pending(struct tb_ring *ring)
+{
+	guard(spinlock_irqsave)(&ring->lock);
+
+	if (!ring->running || ring_empty(ring))
+		return false;
+	return !!(ring->descriptors[ring->tail].flags & RING_DESC_COMPLETED);
+}
+EXPORT_SYMBOL_GPL(tb_ring_poll_pending);
+
 static void __ring_interrupt_mask(struct tb_ring *ring, bool mask)
 {
 	int interrupt_index = ring_interrupt_index(ring);
diff --git a/include/linux/thunderbolt.h b/include/linux/thunderbolt.h
index 8ca941e8b5d0..779381ebeea2 100644
--- a/include/linux/thunderbolt.h
+++ b/include/linux/thunderbolt.h
@@ -757,6 +757,7 @@ static inline int tb_ring_tx_more(struct tb_ring *ring, struct ring_frame *frame
 
 /* Used only when the ring is in polling mode */
 struct ring_frame *tb_ring_poll(struct tb_ring *ring);
+bool tb_ring_poll_pending(struct tb_ring *ring);
 void tb_ring_poll_complete(struct tb_ring *ring);
 
 int tb_ring_throttling(struct tb_ring *ring, unsigned int interval_nsec);
-- 
2.50.1

