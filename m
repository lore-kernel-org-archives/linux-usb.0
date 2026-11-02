Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626965;
	b=opePJ6v9kN/FIpSJEjvYx+0L9YA4yFc9k5qTwYuQn5MNAxHY4eiE1wpHdnLkf+B5qEjS
	 8mISQ+dj1LRH4qMxtC/7VVMUD+7v60rY/f31tVfd1fAhNptIgt9c6PKvG9jnEX6oKjl0t
	 45W8pP4YOAfvtEDO98sUqFnCnb4W5UayG5Gm0nTybb+HDP69Y/Nclg9BZIweSQaPS3CGl
	 LqgiWyhgw0epAqCoRj+QtGqdzK26ugxYaF4e0bggoAULhjftouwvgGsUCu50ib9CiL+mg
	 rqEVJmoMNYxa/KOO96FGv89XA+7nfp8toOOTxDVuYkOdBJiCocBFM2zdYPbcBz2YMXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626965;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7x2bz1wteY34xEOVAIwgFePoiZSU/L/wbYP+cHAOSI0=;
	b=sbt95y+s7zesHIhwMxGERW21U5rCKKNfH8V//iImH7Vw21N4TnR9px8idXsLylf561Hu
	 3kxwdNLK0bqyDkBBhfTdiaH/gpf3abU3j6SWw0DTRVg9rbGabQMg810/6SsEcYTDOlkLX
	 1H9L5D4vF+TpAeO5J9/q/v8qYdM0lNYLRKEINBU5oGz5heXHpbVBzPJlp4DRAQ+o0C2oD
	 1ZvIr9WmqNVfjRZUEpAuXLRA/+lxp0QKgqSOoULKz8BBnsvjC/luhnT6cPH6x8uL9OPGa
	 KAHD5qyXu0dgcgeWKM8mynZ/iv7wmPq2TD8jB1pYQLNADfmMSwHG8ObdNJ248RYAOmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FEYeBY1q;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0EB7606A910
	for <linux-usb@vger.kernel.org>; Mon,  2 Nov 2026 13:42:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0EB7606A910
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FEYeBY1q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793626965; x=1825162965;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FBcYeMHjvtFv3ndg4WFHcw6RmVlloac7f+hz/gffjbk=;
  b=FEYeBY1qtTKds+TIgV83ZQOe2Nt6lQHdRN6+p/PAElgxy0x9NBsuXv02
   V+PrJ8qfB0aoukEd0usLgLC9FQvRFIkz9qxdaPbkzf1v2CyTQkRW7rg4N
   MSTWxCSLyJqMPPty/6sloYrloHAtjCTTUkX8/wej7xzK3w6CeObZXWoqp
   f21lcBEK7jJMvIErjyi9/ErJ9OGOCq8dKbN4Dd1E7JfDjw6JT2uh6XSy0
   xbAmPPQSsEBRoYmhst/Ig0rn6+4dwwn5ZL2qUCcNhyTej18h7/cm/xIXB
   Xf18cTWP+bD3RKY10LUYY5R3Ur/F+FZgr5ETLrXoh1OGB4CAhOiDda1Qt
   A==;
X-CSE-ConnectionGUID: o1EHagPNRba30NXfDYYr9Q==
X-CSE-MsgGUID: k/crP4gxSFywScMs2u4k9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2311668"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2311668"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 05:42:44 -0800
X-CSE-ConnectionGUID: D2M/p69mRY6oSrkgEDXhzA==
X-CSE-MsgGUID: eY+IxNJGTcCnBteprY9KXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6671568"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 02 Nov 2026 05:42:43 -0800
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 6F0369D; Mon, 02 Nov 2026 14:42:42 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	michal.pecio@gmail.com,
	regressions@leemhuis.info,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH v2 2/2] usb: xhci: fix 'num_active_eps' accounting on allocation failure
Date: Mon,  2 Nov 2026 14:42:28 +0100
Message-ID: <20261102134228.584032-3-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261102134228.584032-1-niklas.neronin@linux.intel.com>
References: <20261102134228.584032-1-niklas.neronin@linux.intel.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For controllers affected by XHCI_EP_LIMIT_QUIRK, endpoint resources for
the default control endpoint are accounted before the virtual device is
allocated.

If xhci_alloc_virt_device() fails, the slot is disabled and cleanup is
handled through the Disable Slot completion path. However, because no
virtual device is installed in 'xhci->devs', the endpoint accounting
is never released and 'num_active_eps' remains incremented.

As a result, each allocation failure leaks one endpoint from the
driver's accounting.

Fix this by undoing the endpoint reservation when virtual device
allocation fails.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
v2:
 * Rework commit message

 drivers/usb/host/xhci.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 0361dfaecdd7..394f69b3cfbf 100644
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

