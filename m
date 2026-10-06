Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E37282F18
	for <linux-usb@vger.kernel.org>; Tue,  6 Oct 2026 15:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791300287; cv=none; b=bxtYzoSPvqQs2YpulSMkK1SqCjzCijlJqE/KwnMAPJLxbwdas1k79SH8mBqROi9CJ7jtk18lP5CNqSZdrdse+JVxcPR77hguciE8lzoJXUMzM7MuOcN8UM88jr9ufjqhSUIZ4xrP9hwFIKAc3bUs3ZFW3x7QPIXegwP2hZ0axNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791300287; c=relaxed/simple;
	bh=5Lczd94OhtXXIKiLmgHfawg7mI6h2R2IiliaRdEORTg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tnznoR8pVQV+4RBUnJ6I2DkOYuDy9FsWSmahk7kpsOushdGMxYCzGu6CIiPoBs6xRwbwG/ykYSsIORtmOht7v7gLyX2u4m1CPPg8O3OJMwhma3bHqWH9i4dAWeKe2kcdsxBdJ/csRmLvfX1PkQ/bM93X8IA+mAkovKWPkCo0I14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gfMGzatR; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gfMGzatR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791300286; x=1822836286;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5Lczd94OhtXXIKiLmgHfawg7mI6h2R2IiliaRdEORTg=;
  b=gfMGzatRhJIHnA3RMCIb13jod+zosgbNDSrf7srSxLSescfyE+rQKQDR
   IH+DsqLMk50/xL3UdRhGclz5g6D6CcdPF13Ls6zYYU0vr9aLvveSHK+wg
   3cRnHl+8y+YcE5tMiTW6YCgb//W0v0j/JDTv58LpW24qzoVk/zmCMe+t1
   gt4H1689prhJ8VmLsbrpqreboFG9PuK787mpYLTBvHz75Y/BoWqzGFt6p
   ylgnziGcRzwXYwPulreZvME0a96MH4OEiTVVqFNbzHXCtV7UMMum3Hv5H
   kSn0oPJrzR/YlN1MMVQ83TJHmjozzcNww6mTJYMI4fXJsFegxS6CkzMS7
   w==;
X-CSE-ConnectionGUID: qskwx3u6Qke0Y1zwbBzXhQ==
X-CSE-MsgGUID: 4VJAas0rSu2aiTdcHJhDiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="43703"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="43703"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 08:24:45 -0700
X-CSE-ConnectionGUID: Yz0P6CHySQSLZqxGRv+b8Q==
X-CSE-MsgGUID: rZ90RAivQf23RlZjJbjr1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="280420765"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa003.jf.intel.com with ESMTP; 06 Oct 2026 08:24:44 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id E184A9B; Tue, 06 Oct 2026 17:24:42 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 2/5] usb: xhci: correct num_active_eps accounting on allocation failure
Date: Tue,  6 Oct 2026 17:24:24 +0200
Message-ID: <20261006152427.3735383-3-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261006152427.3735383-1-niklas.neronin@linux.intel.com>
References: <20261006152427.3735383-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some host controllers have a global endpoint limit across all slots,
tracked by 'xhci->num_active_eps' when XHCI_EP_LIMIT_QUIRK is set.

During device allocation, EP0 resources are reserved before
xhci_alloc_virt_device() is called, and 'num_active_eps' is incremented
accordingly. If xhci_alloc_virt_device() subsequently fails, the slot is
disabled but the reserved endpoint resource is not released, leaving
'num_active_eps' permanently increased.

Decreasing 'num_active_eps' happens in xhci_handle_cmd_disable_slot(),
which is called upon a Disable Slot completion command.

This causes the driver to gradually lose available endpoint resources
after allocation failures and may eventually prevent new endpoints from
being allocated.

Fix this by decrementing 'num_active_eps' when virtual device allocation
fails.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 4708fabba84a..ca56e0b69415 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -4279,6 +4279,11 @@ int xhci_alloc_dev(struct usb_hcd *hcd, struct usb_device *udev)
 	 */
 	if (!xhci_alloc_virt_device(xhci, slot_id, udev, GFP_NOIO)) {
 		xhci_warn(xhci, "Could not allocate xHCI USB device data structures\n");
+		if (xhci->quirks & XHCI_EP_LIMIT_QUIRK) {
+			spin_lock_irqsave(&xhci->lock, flags);
+			xhci->num_active_eps -= 1;
+			spin_unlock_irqrestore(&xhci->lock, flags);
+		}
 		goto disable_slot;
 	}
 	vdev = xhci->devs[slot_id];
-- 
2.50.1

