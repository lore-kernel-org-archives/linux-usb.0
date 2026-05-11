Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7713D75C6
	for <linux-usb@vger.kernel.org>; Mon, 11 May 2026 10:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778495275; cv=none; b=I8FK9W3h1yFzbaZwfsRVzlPH5Dymq/SssHKpysEFfYZ9Fwg8GSWAh3i2efMbHsEs164FM8Jx5PXBvsYGPWEzWcQ9d+RYvzrlF2lhNMTkC4aNBR07Kr4koZ6OA6Qdkd8anGbmSNHBde8L9mOJTwDesFo7BnonGGKaHFBLAXOuheY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778495275; c=relaxed/simple;
	bh=HG5kRVIhba2r5dqXMdQ+wk7kg+sfW7FIvNTX7Er9szc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S4cRmF8/qM2GqQCmUVq81QtwvqRsbHSajFMezFrEIwAvoG0vgvdXDpK8CECSVDmCOSOse6prukya+u6kubuFhwN6Qgnks6z3pRId0SXRzKqfH+NaXimGBFTtJCmU4dU3mRCMO1O4BXjzOo5ZfwngNGvzKYoKqrfYTeBiX3bXLO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iRhpFuGR; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iRhpFuGR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778495273; x=1810031273;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HG5kRVIhba2r5dqXMdQ+wk7kg+sfW7FIvNTX7Er9szc=;
  b=iRhpFuGRjx7FXvy5grhQU9ll3eFQDgvCmZY3BblnL8COmFstWe1mO8T4
   8fEHOM6X8g3GHXICh5/dGM6Vooi7WnzCCK6kCfi/9gi468fd/q8PLol+B
   woziCqXlDhayiLNVDWF2AubZgIiekCoKV2q0K88iod045NZtxMZ3uqQN5
   iGDOA6dwOULWA/c/cKFQmbocBkl8xZ2e2Enk8Hnnud8OtTT5RwDIXh0w/
   wsPXoLty/2NI6evLrTuoN6gvJzHaV0mFHpMz79/CHQzmICFug4IW/bpRp
   6ZrncNk/6vnRbGlZHbl53OSDTbFoXjoE95GeNifE8ka0hrKPnwG820sS6
   Q==;
X-CSE-ConnectionGUID: zZjEre6vRhyaTtOSbhzPkg==
X-CSE-MsgGUID: MgtS+O6LQWa86095atYxtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="79099659"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="79099659"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 03:27:52 -0700
X-CSE-ConnectionGUID: lgfikciEQBa/+bQuE2sBVg==
X-CSE-MsgGUID: mrbOFsXzSQWzHYA+r3mUfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="234752253"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 11 May 2026 03:27:49 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 9EA48A1; Mon, 11 May 2026 12:27:44 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 06/10] thunderbolt: Add helper to figure size of the ring
Date: Mon, 11 May 2026 12:27:40 +0200
Message-ID: <20260511102744.1867485-7-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260511102744.1867485-1-mika.westerberg@linux.intel.com>
References: <20260511102744.1867485-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add to common header a function that returns size of the ring. This can
be used in the drivers instead of rolling own version.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 include/linux/thunderbolt.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/thunderbolt.h b/include/linux/thunderbolt.h
index 1160e0bf5c5b..9df8a356396f 100644
--- a/include/linux/thunderbolt.h
+++ b/include/linux/thunderbolt.h
@@ -641,6 +641,11 @@ static inline size_t tb_ring_frame_size(const struct ring_frame *frame)
 	return TB_MAX_FRAME_SIZE;
 }
 
+static inline size_t tb_ring_size(const struct tb_ring *ring)
+{
+	return ring->size;
+}
+
 struct tb_ring *tb_ring_alloc_tx(struct tb_nhi *nhi, int hop, int size,
 				 unsigned int flags);
 struct tb_ring *tb_ring_alloc_rx(struct tb_nhi *nhi, int hop, int size,
-- 
2.50.1

