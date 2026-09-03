Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C1F4A4996
	for <linux-usb@vger.kernel.org>; Thu,  3 Sep 2026 12:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788438904; cv=none; b=lrt9xtJnEHNp1pmomJ9lXcY1b/aFAysDiLRArt+meRL2bbcSQ35yvPY3VL5n1KHZfHREYpl/Q1z3e96sRj5E3nd11U5Cwr35NTdvY5zqR71xMfaNLv5UpqTnxNyqcg9K42YZOL6ycomuaVuoF22ae+94JFQzRSPx9UIKfeP73sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788438904; c=relaxed/simple;
	bh=ybV8M8vYY1oK37YSvI31RE96yVmYSgC8XeTBxeeVjWs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iGHsxUoy4Sk9XL6CVZ8K4W87wfYbIHPiUzYZLh/0XopsbYdD7BvaRBfs8hHZWUaDQ+kTeXiEDZLqrSj6fHaRew2TUFY2UCODyuxQgBJGDvfdEfxRbWTpJowMLnGLVym0OWNQbTuJ3DUvNO8CEuuzEyKYy47XBoi22OBhMfNBKas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fc9dLxBR; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fc9dLxBR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788438903; x=1819974903;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ybV8M8vYY1oK37YSvI31RE96yVmYSgC8XeTBxeeVjWs=;
  b=fc9dLxBRmm1qsz6qu3+EpJ6odDGAa472W3ZXEp0vc5YAzQg30FnwWOFV
   dQMgvUc12D+5dsAPaRO9gJwLENTZe/08PrtTSIk1HB4rBPCTGPtpcqGbY
   2E+SpRojpqrACnw0qIWFDvvV+6zF04lNzYC9IKxWha83UlM8nqpuaTbOg
   rEAhR+pcpXw51GuG54zDASWaazWEuWucxK444LHT1CpSz+rGnfP90ICem
   URa1UjhIXrf/7axFRclUdxn1HLAXF/jI5qIB4ux7OrUn6cyWAIWNP1rxv
   xrD+uzSbfsjfk2KYeHM8l6hWuhj0jzj2ezGnMXbAg/I3VwSAqPLVA2nWb
   Q==;
X-CSE-ConnectionGUID: n/gskwCKSwOsuK7/IsKqqQ==
X-CSE-MsgGUID: WVMF4VRhTwC6qspIeyRWyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="99250170"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="99250170"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 05:34:58 -0700
X-CSE-ConnectionGUID: xMsXGJeRQTGDvUvTwVu2gw==
X-CSE-MsgGUID: 8YWFVLk/TsO/ah8g3fZ+og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="267123217"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 03 Sep 2026 05:34:56 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 0FFF29D; Thu, 03 Sep 2026 14:34:55 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 2/4] thunderbolt: Clean up ring interrupt register indexing
Date: Thu,  3 Sep 2026 14:34:52 +0200
Message-ID: <20260903123455.2048076-3-mika.westerberg@linux.intel.com>
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

nhi_mask_interrupt() and nhi_clear_interrupt() take "ring" as parameter
but in fact it is not an actual ring but a byte offset to the interrupt
register. Make this less confusing and name the paramers what it really
is and calculate the offset where it is actually needed.

In addition ring_interrupt_active() has two variables called "index"
with different meanings, and the second one shadows the first one
open-coding ring_interrupt_index() as well. Drop that and rename the
remaining what they actually hold.

While there, make the mask variable u32 and use BIT() to avoid signed
shifting.

No functional changes intended.

Assisted-by: LLM
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/nhi.c | 44 +++++++++++++++++++--------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index 985b53399561..aaaf9e7966c8 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -41,6 +41,7 @@ static bool host_reset = true;
 module_param(host_reset, bool, 0444);
 MODULE_PARM_DESC(host_reset, "reset USB4 host router (default: true)");
 
+/* Returns absolute bit number of the ring in the interrupt registers */
 static int ring_interrupt_index(const struct tb_ring *ring)
 {
 	int bit = ring->hop;
@@ -49,24 +50,28 @@ static int ring_interrupt_index(const struct tb_ring *ring)
 	return bit;
 }
 
-static void nhi_mask_interrupt(struct tb_nhi *nhi, int mask, int ring)
+static void nhi_mask_interrupt(struct tb_nhi *nhi, u32 mask, int reg_index)
 {
+	int offset = reg_index * 4;
+
 	if (nhi->quirks & QUIRK_AUTO_CLEAR_INT) {
 		u32 val;
 
-		val = ioread32(nhi->iobase + REG_RING_INTERRUPT_BASE + ring);
-		iowrite32(val & ~mask, nhi->iobase + REG_RING_INTERRUPT_BASE + ring);
+		val = ioread32(nhi->iobase + REG_RING_INTERRUPT_BASE + offset);
+		iowrite32(val & ~mask, nhi->iobase + REG_RING_INTERRUPT_BASE + offset);
 	} else {
-		iowrite32(mask, nhi->iobase + REG_RING_INTERRUPT_MASK_CLEAR_BASE + ring);
+		iowrite32(mask, nhi->iobase + REG_RING_INTERRUPT_MASK_CLEAR_BASE + offset);
 	}
 }
 
-static void nhi_clear_interrupt(struct tb_nhi *nhi, int ring)
+static void nhi_clear_interrupt(struct tb_nhi *nhi, int reg_index)
 {
+	int offset = reg_index * 4;
+
 	if (nhi->quirks & QUIRK_AUTO_CLEAR_INT)
-		ioread32(nhi->iobase + REG_RING_NOTIFY_BASE + ring);
+		ioread32(nhi->iobase + REG_RING_NOTIFY_BASE + offset);
 	else
-		iowrite32(~0, nhi->iobase + REG_RING_INT_CLEAR + ring);
+		iowrite32(~0, nhi->iobase + REG_RING_INT_CLEAR + offset);
 }
 
 /*
@@ -76,22 +81,17 @@ static void nhi_clear_interrupt(struct tb_nhi *nhi, int ring)
  */
 static void ring_interrupt_active(struct tb_ring *ring, bool active)
 {
-	int index = ring_interrupt_index(ring) / 32 * 4;
-	int reg = REG_RING_INTERRUPT_BASE + index;
-	int interrupt_bit = ring_interrupt_index(ring) & 31;
-	int mask = 1 << interrupt_bit;
+	int interrupt_index = ring_interrupt_index(ring);
+	int reg_index = interrupt_index / 32;
+	int reg = REG_RING_INTERRUPT_BASE + reg_index * 4;
+	int interrupt_bit = interrupt_index % 32;
+	u32 mask = BIT(interrupt_bit);
 	u32 old, new;
 
 	if (ring->irq > 0) {
 		u32 step, shift, ivr, misc, itr;
 		void __iomem *ivr_base;
 		int auto_clear_bit;
-		int index;
-
-		if (ring->is_tx)
-			index = ring->hop;
-		else
-			index = ring->hop + ring->nhi->hop_count;
 
 		/*
 		 * Intel routers support a bit that isn't part of
@@ -114,8 +114,8 @@ static void ring_interrupt_active(struct tb_ring *ring, bool active)
 				  ring->nhi->iobase + REG_DMA_MISC);
 
 		ivr_base = ring->nhi->iobase + REG_INT_VEC_ALLOC_BASE;
-		step = index / REG_INT_VEC_ALLOC_REGS * REG_INT_VEC_ALLOC_BITS;
-		shift = index % REG_INT_VEC_ALLOC_REGS * REG_INT_VEC_ALLOC_BITS;
+		step = interrupt_index / REG_INT_VEC_ALLOC_REGS * REG_INT_VEC_ALLOC_BITS;
+		shift = interrupt_index % REG_INT_VEC_ALLOC_REGS * REG_INT_VEC_ALLOC_BITS;
 		ivr = ioread32(ivr_base + step);
 		ivr &= ~(REG_INT_VEC_ALLOC_MASK << shift);
 		if (active)
@@ -156,7 +156,7 @@ static void ring_interrupt_active(struct tb_ring *ring, bool active)
 	if (active)
 		iowrite32(new, ring->nhi->iobase + reg);
 	else
-		nhi_mask_interrupt(ring->nhi, mask, index);
+		nhi_mask_interrupt(ring->nhi, mask, reg_index);
 }
 
 /*
@@ -169,11 +169,11 @@ void nhi_disable_interrupts(struct tb_nhi *nhi)
 	int i = 0;
 	/* disable interrupts */
 	for (i = 0; i < RING_INTERRUPT_REG_COUNT(nhi); i++)
-		nhi_mask_interrupt(nhi, ~0, 4 * i);
+		nhi_mask_interrupt(nhi, ~0, i);
 
 	/* clear interrupt status bits */
 	for (i = 0; i < RING_NOTIFY_REG_COUNT(nhi); i++)
-		nhi_clear_interrupt(nhi, 4 * i);
+		nhi_clear_interrupt(nhi, i);
 }
 
 /* ring helper methods */
-- 
2.50.1

