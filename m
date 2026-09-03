Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4444A4416
	for <linux-usb@vger.kernel.org>; Thu,  3 Sep 2026 12:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788438902; cv=none; b=CJu9RHxA/TPO+iLUf7jJDLDNvW7K6FvcFYplDJ5vMYVNBwyDSGZ9jUW4Vm1ERLg6mMw30GdH15iwy5R76quILCYxjOO2w5t19tAVj57poOxgCd6mnBTyD4oxoU2E75GVAJSV7PDQi2H53Cgg9BbB822zfkDisQq348gwxlO1ITw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788438902; c=relaxed/simple;
	bh=vxNz7hXug6skvfWejUpD/ovFVzLBFjOOEpdkrsr3tg0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dIeqgdNqiav3kuqgami9BKUhIftmeC3bwQKWNlmJ9AQrrPL+myvlQx1iDU2Zp+4gi0OB09TeYEGdDPy4NWHkTFlOvX7UygWbHTqQ0BrL+TOaI424qYkKZR+BAck/ydKJ1eb8NuITjKCUHUsioPC82U3Bml+mVzr2GFF562PHsK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X65mL6pv; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X65mL6pv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788438901; x=1819974901;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vxNz7hXug6skvfWejUpD/ovFVzLBFjOOEpdkrsr3tg0=;
  b=X65mL6pv9cYDCIn9mY6UK9bbxXUyFttgpz+gO5xwUIzWrAxG4R9kTN3M
   88wTGDuIgpQhDfq80FXKpfWJq1kvT5DFP46+gLYj970AWQVM3ABPNodlT
   IkL/fS+xRuk4hjPeeazzknAW58vnwyxQPTEY411OcnQ1xVNkyUc6cNyD7
   QikEFHeVFUxXYfsmYMBsp+aq40Zuc6M8/9Tyr9P14WRW7NFeibB6iJSLc
   ow9W7kuKs48h/2LFU8HtB964J+niWtipkfiaUwEt7midL7uARE/d9Rttw
   JvQmkfGwtjNSOB9a8XgMQfzBJjsqoe6oHDE+pwXaAbDigWnP7xIalsLE4
   g==;
X-CSE-ConnectionGUID: BX7f9bDOR7KzF4aD+lCcXA==
X-CSE-MsgGUID: j9iuelFWRg6KUgl4psZpRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="99250165"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="99250165"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 05:34:58 -0700
X-CSE-ConnectionGUID: PjQYpDfdSW+BKY5x5QUIWg==
X-CSE-MsgGUID: TL8I86OjTVGNvSnQY1PcOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="267123215"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 03 Sep 2026 05:34:56 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 132539E; Thu, 03 Sep 2026 14:34:55 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 3/4] thunderbolt: Use shadow copy for ring interrupt mask
Date: Thu,  3 Sep 2026 14:34:53 +0200
Message-ID: <20260903123455.2048076-4-mika.westerberg@linux.intel.com>
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

Each time we mask or unmask ring interrupt we do a read-modify-write and
that is not without a cost when on a hot path. We can get rid of that
read by making a shadow copy of the interrupt mask register and using
that in place of a register read.

Assisted-by: LLM
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/nhi.c   | 55 +++++++++++++++++++++++--------------
 include/linux/thunderbolt.h |  2 ++
 2 files changed, 36 insertions(+), 21 deletions(-)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index aaaf9e7966c8..a7e6184cdfe1 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -53,15 +53,28 @@ static int ring_interrupt_index(const struct tb_ring *ring)
 static void nhi_mask_interrupt(struct tb_nhi *nhi, u32 mask, int reg_index)
 {
 	int offset = reg_index * 4;
+	u32 val;
 
-	if (nhi->quirks & QUIRK_AUTO_CLEAR_INT) {
-		u32 val;
+	/* Use shadow copy instead of reading the register */
+	val = nhi->interrupt_mask[reg_index] & ~mask;
+	nhi->interrupt_mask[reg_index] = val;
 
-		val = ioread32(nhi->iobase + REG_RING_INTERRUPT_BASE + offset);
-		iowrite32(val & ~mask, nhi->iobase + REG_RING_INTERRUPT_BASE + offset);
-	} else {
+	if (nhi->quirks & QUIRK_AUTO_CLEAR_INT)
+		iowrite32(val, nhi->iobase + REG_RING_INTERRUPT_BASE + offset);
+	else
 		iowrite32(mask, nhi->iobase + REG_RING_INTERRUPT_MASK_CLEAR_BASE + offset);
-	}
+}
+
+static void nhi_unmask_interrupt(struct tb_nhi *nhi, u32 mask, int reg_index)
+{
+	int offset = reg_index * 4;
+	u32 val;
+
+	/* Use shadow copy instead of reading the register */
+	val = nhi->interrupt_mask[reg_index] | mask;
+	nhi->interrupt_mask[reg_index] = val;
+
+	iowrite32(val, nhi->iobase + REG_RING_INTERRUPT_BASE + offset);
 }
 
 static void nhi_clear_interrupt(struct tb_nhi *nhi, int reg_index)
@@ -129,7 +142,7 @@ static void ring_interrupt_active(struct tb_ring *ring, bool active)
 			  ring->vector * 4);
 	}
 
-	old = ioread32(ring->nhi->iobase + reg);
+	old = ring->nhi->interrupt_mask[reg_index];
 	if (active)
 		new = old | mask;
 	else
@@ -141,10 +154,10 @@ static void ring_interrupt_active(struct tb_ring *ring, bool active)
 
 	if (new == old) {
 		/*
-		 * Rings that are polled mask the interrupt using while
-		 * the completions are being advanced (see
-		 * __ring_interrupt()) so for those it can already be
-		 * disabled by the time the ring is stopped.
+		 * Rings that are polled mask the interrupt while the
+		 * completions are being advanced (see __ring_interrupt())
+		 * so for those it can already be disabled by the time
+		 * the ring is stopped.
 		 */
 		if (active || !ring->start_poll)
 			dev_WARN(ring->nhi->dev,
@@ -154,7 +167,7 @@ static void ring_interrupt_active(struct tb_ring *ring, bool active)
 	}
 
 	if (active)
-		iowrite32(new, ring->nhi->iobase + reg);
+		nhi_unmask_interrupt(ring->nhi, mask, reg_index);
 	else
 		nhi_mask_interrupt(ring->nhi, mask, reg_index);
 }
@@ -437,17 +450,14 @@ EXPORT_SYMBOL_GPL(tb_ring_poll);
 
 static void __ring_interrupt_mask(struct tb_ring *ring, bool mask)
 {
-	int idx = ring_interrupt_index(ring);
-	int reg = REG_RING_INTERRUPT_BASE + idx / 32 * 4;
-	int bit = idx % 32;
-	u32 val;
+	int interrupt_index = ring_interrupt_index(ring);
+	int reg_index = interrupt_index / 32;
+	int interrupt_bit = interrupt_index % 32;
 
-	val = ioread32(ring->nhi->iobase + reg);
 	if (mask)
-		val &= ~BIT(bit);
+		nhi_mask_interrupt(ring->nhi, BIT(interrupt_bit), reg_index);
 	else
-		val |= BIT(bit);
-	iowrite32(val, ring->nhi->iobase + reg);
+		nhi_unmask_interrupt(ring->nhi, BIT(interrupt_bit), reg_index);
 }
 
 /* Both @nhi->lock and @ring->lock should be held */
@@ -1315,7 +1325,10 @@ int nhi_probe(struct tb_nhi *nhi)
 				     sizeof(*nhi->tx_rings), GFP_KERNEL);
 	nhi->rx_rings = devm_kcalloc(dev, nhi->hop_count,
 				     sizeof(*nhi->rx_rings), GFP_KERNEL);
-	if (!nhi->tx_rings || !nhi->rx_rings)
+	nhi->interrupt_mask = devm_kcalloc(dev, RING_INTERRUPT_REG_COUNT(nhi),
+					   sizeof(*nhi->interrupt_mask),
+					   GFP_KERNEL);
+	if (!nhi->tx_rings || !nhi->rx_rings || !nhi->interrupt_mask)
 		return -ENOMEM;
 
 	nhi_reset(nhi);
diff --git a/include/linux/thunderbolt.h b/include/linux/thunderbolt.h
index 7fb9e7e1aae4..8ca941e8b5d0 100644
--- a/include/linux/thunderbolt.h
+++ b/include/linux/thunderbolt.h
@@ -507,6 +507,7 @@ void tb_service_properties_changed(struct tb_service *svc);
  * @iobase: MMIO space of the NHI
  * @tx_rings: All Tx rings available on this host controller
  * @rx_rings: All Rx rings available on this host controller
+ * @interrupt_mask: Shadow copy of the ring interrupt mask register
  * @going_away: The host controller device is about to disappear so when
  *		this flag is set, avoid touching the hardware anymore.
  * @iommu_dma_protection: An IOMMU will isolate external-facing ports.
@@ -528,6 +529,7 @@ struct tb_nhi {
 	void __iomem *iobase;
 	struct tb_ring **tx_rings;
 	struct tb_ring **rx_rings;
+	u32 *interrupt_mask;
 	bool going_away;
 	bool iommu_dma_protection;
 	struct work_struct interrupt_work;
-- 
2.50.1

