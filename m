Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F56350AC3D
	for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 14:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789568175; cv=none; b=jP31LpYjR0j/ZCD0uqmXU/YpIW7C5rqdKVb1MpVajDRlQ+PINWl1rJgaPK7nZ93Vb6PiSsgajR+xN477KkDy1fIJYDBEku4FzNipI2ulYWpskuwkGG5LYpc3c7pMcR+VyOIMRkgqrYX21OUvOXZrsM2Oziz4MeLh1v2/1YZuryM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789568175; c=relaxed/simple;
	bh=Zgx547q2sPcInBtw3XevQSeYiTL3pQn4dy5gJlNFt7A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dtZ+AIyo/GbgkuEPB/BHk1JzDk0iDyqN6S8keNbxp7kQhOt/oLESZYR8nkShjo5F+LJLbv3GTyHOZAQOif74iIkzYFXudRYWpfr2o/Ang5kbd8z/vv4xtIfVAv2Mq/EtNMo5BaezyMuDBGKIwsLtaLjCtc5Ac98XEIzu6ZipPd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yy686o17; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yy686o17"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789568175; x=1821104175;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Zgx547q2sPcInBtw3XevQSeYiTL3pQn4dy5gJlNFt7A=;
  b=Yy686o17CMxneGyplC/yQ7BL1kadOWO/pYVZ9HkswVxvd0NysWjFWESC
   srxzAGpShuej16RAHLqjJvoTuJUHc/s4NHWr5yqdXb7h1OF81xn7jEwtd
   b8pxLNHQXzv5XflDTDsa8G5OvYeji140n7PgmIv1LmW85bIggsjt7sHz+
   NV2vIm//m1W/sB7L3yl3ICdfurpUh7kXvD8ildcFiOpKuhCzQEgsEIdWC
   NhJ/K/8w3fcZKMmOCjR57uZdSuzG33cNWOR3vA3Uj5NJJPJjgSrko5rM1
   bD+/yKVOhbhFcq3EpFzVvVF3k2V2gVSFXfJEDLThONJvvQzQNOXF6ynjc
   A==;
X-CSE-ConnectionGUID: KkUBdbssTkSwe8ygUcwQNg==
X-CSE-MsgGUID: R2yEsAK4RU+4dKCjiaQagg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89967319"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89967319"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 07:16:14 -0700
X-CSE-ConnectionGUID: cAsOdZmsTU2CA5vs1J/cAw==
X-CSE-MsgGUID: UeCOIDjERWWb9dHPosCUJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270720221"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 16 Sep 2026 07:16:13 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 803A29B; Wed, 16 Sep 2026 16:16:12 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH v2 18/20] usb: xhci: preserve RW bits in xhci_port_state_to_neutral()
Date: Wed, 16 Sep 2026 16:14:07 +0200
Message-ID: <20260916141409.629621-19-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260916141409.629621-1-niklas.neronin@linux.intel.com>
References: <20260916141409.629621-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xhci_port_state_to_neutral() prepares a PORTSC value that can be
written back without changing port state by dropping bits with
side effects on write (e.g. Read-Write-1-to-Clear).

Currently the helper preserves Read-Only (RO) and Read/Write Sticky
(RWS) bits, but omits standard Read/Write (RW) bits. This does not
currently cause issues, since the only RW bit, Port Link State Write
Strobe (LWS), always reads as 0 and ignores 0 writes.

Preserve RW bits as well to make the helper consistent with its
intent and robust against future changes to PORTSC definitions.

Update the function comment accordingly.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-hub.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index 5f389773041d..e0d4ee605f82 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -386,25 +386,22 @@ static unsigned int xhci_port_speed(int portsc)
 	return 0;
 }
 
-/**
- * xhci_port_state_to_neutral() - Clean up read portsc value back into writeable
- * @portsc: u32 port value read from portsc register to be cleanup up
+/*
+ * Given a PORTSC register value, return a "neutral" value that can be written
+ * back to the register without changing the current port state.
  *
- * Given a portsc, this function returns a value that would result in the
- * port being in the same state, if the value was written to the port status
- * control register.
- * Save Read Only (RO) bits and save read/write bits where
- * writing a 0 clears the bit and writing a 1 sets the bit (RWS).
- * For all other types (RW1S, RW1CS, RW, and RZ), writing a '0' has no effect.
+ * The function preserves:
+ *  - Read-Only (RO) bits
+ *  - Read/Write (RW) bits
+ *  - Read/Write Sticky (RWS) bits
  *
- * Return: u32 value that can be written back to portsc register without
- * changing port state.
+ * For other bit types (e.g. RW1S, RW1CS, and RsvdZ), writing 0 has no effect,
+ * so they are intentionally cleared in the returned value to avoid unintended
+ * side effects.
  */
-
 u32 xhci_port_state_to_neutral(u32 portsc)
 {
-	/* Save read-only status and port state */
-	return (portsc & PORTSC_RO_BITS) | (portsc & PORTSC_RWS_BITS);
+	return portsc & (PORTSC_RO_BITS | PORTSC_RWS_BITS | PORTSC_RW_BITS);
 }
 EXPORT_SYMBOL_GPL(xhci_port_state_to_neutral);
 
-- 
2.50.1

