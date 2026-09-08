Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38723B4E80
	for <linux-usb@vger.kernel.org>; Tue,  8 Sep 2026 08:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788855296; cv=none; b=qSiNQ0T8vhMmMLKd4iFD5GPESu/DSaA2JeGlmNDP4Ir5hHgly5jHwaVs1YnBYPPrdKBMKIcHKp19mcQy/+tPQp74MnDxLeGnbu65KhYX7IegzxAB05VGeL/x36KTTR5e5A5YwoEDD8pfjyCWm9x9aoKTAmMOLsw7SMYPhWTqweQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788855296; c=relaxed/simple;
	bh=GQZ8rBMCtgRpamSw5aTame04KWoaA4tbe+3vY4nle/8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MkeYllkxmXqADhTqvEmSj3rpCSradiIIV6vpRkc2j9301NFwG3UyIwrSAE3F+D/ql8J/tYDRYE52HlK6MlDGrFwGAt3OgNnRr7q5Ii0czg5o7Ix8rE3tsySCsElEa+wPDpF9k8GDEir2JV/yvNRIPFQ3w6VeDQCR9+dxkmjnhWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZHpZ0i3z; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZHpZ0i3z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788855294; x=1820391294;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GQZ8rBMCtgRpamSw5aTame04KWoaA4tbe+3vY4nle/8=;
  b=ZHpZ0i3zM7wf4kPsZYdNi6JxNmBlGGGGnr31h8BWWhEx7QM+GQMtCMpo
   KxvJrM8zVidFAz7J6u/Im/uNFIg75r5k1N34zHplw9Okaxs+Fa73x5+If
   rP5cWeJSiX9n7BFvMZzYecflJA9MjFJquQv1PBLJxjaJno2WTIjUA6cFF
   R/RUf6OQUt42qS7vVHF/Eugd61bB3a3v6K06AhVttHvVZom8/mHV/egOJ
   4s5Tr0Cky7SQPxlK7LtlCeKMQT51lvdcwLpyOl7syKv3Al7d263ZblMy6
   6RJOHwAC0/GWakdNqcCZTklsHaVl9rr4yK5CYL6Srdkl+OVqmRsH0VwR/
   w==;
X-CSE-ConnectionGUID: ON5dh5kRSrmrLxpUJ2A9Fw==
X-CSE-MsgGUID: MYJaFjyKQLOt5fGCaC5sqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="88399795"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="88399795"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 01:14:52 -0700
X-CSE-ConnectionGUID: P52Ha7QwSnuH3ml766MGHA==
X-CSE-MsgGUID: eeWmhZUyRimCxGWmbCt2qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="268353667"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 08 Sep 2026 01:14:50 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id C2A5E9B; Tue, 08 Sep 2026 10:14:49 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 1/4] thunderbolt: Write descriptors in tb_ring_poll()
Date: Tue,  8 Sep 2026 10:14:46 +0200
Message-ID: <20260908081449.3424884-2-mika.westerberg@linux.intel.com>
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

When the ring is not in interrupt mode, it depends on something
enqueuing new frames to write the descriptors from ring->queue to the
hardware, and that can take a long time. Since we know that we just
released one slot, we can push the next frame directly from
tb_ring_poll().

Reported-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Assisted-by: LLM
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/nhi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index a7e6184cdfe1..371ee155d98f 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -440,6 +440,13 @@ struct ring_frame *tb_ring_poll(struct tb_ring *ring)
 		}
 
 		ring->tail = (ring->tail + 1) % ring->size;
+
+		/*
+		 * There is one more slot available so we can push next
+		 * descriptor to the ring. This is needed when the ring
+		 * is created with %RING_FLAG_NO_INTERRUPT.
+		 */
+		ring_write_descriptors(ring, true);
 	}
 
 unlock:
-- 
2.50.1

