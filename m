Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0633D9532
	for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 09:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788167119; cv=none; b=dY4Iz2Pmg5V6G4e9KrzS7Tlmg0RyHtRFHgUlIoPOxhW1P7AKTkORYOWs7qpp/iRRv5PSpCM9qOxeVAfltV+TmuYbDDuTkyuE625UzTl87ELMykkMVft15gcD79GdQIwtgu5YwRxyjAaOzqKRifRorZY/d6dQhhQenPKw9PQiK08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788167119; c=relaxed/simple;
	bh=YScG/w57QMN1U0nSCx035nXCPjONQGYZg6ecoRdlSNo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dTqO5xISaoo+uqwFXhZoCKAVFHncUTWrVumxr74vR2/zvPprWo4PVY1obBu5wnlF4dsEWK91eXeY+SFobyfN1cQqsWUwOX/qrwl1nHyuCuPbi12FznwJuhEK17zVmv0QEsByMmD+rBe4yjaCQIRgVGElfP+7V7ZxE2tyrAtNcL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=By+Z2eRh; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="By+Z2eRh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788167119; x=1819703119;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YScG/w57QMN1U0nSCx035nXCPjONQGYZg6ecoRdlSNo=;
  b=By+Z2eRhZ2gWI2MDTK+neunre+tYUisxFGfQHDyo5bKuOsQJNTLf8pZn
   xqXgfkSq4dT/5M7O+B/fGrsa5bravFjTxHZShYWy3LYm2o67zMvqmhzXo
   i6Yaaxpo+nWxXbrD0Q8oxTk0P2v7PMklDglsOyl3NGh3SNCF5FCboIst6
   v730pSX/vAFxnRioY25bbbXQ3pbKuNnCgaW5el1Lr/nVYwvKAVAvLfznc
   Tg0vkOPxz37PcNwFZA02GaDRVmuQSVxBgQLU+rpIJl8V0VFgQI0g4mfPV
   cCnQ8rclKr8tmHxt+5HnBn03lRMUKEvnv3XyTFY7J/1B+5V+OAoThnFCD
   w==;
X-CSE-ConnectionGUID: pLb6ZsTCRH2XqGdEkp30sw==
X-CSE-MsgGUID: FcZzEbKfRwyPoY9ipz02IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="105944718"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="105944718"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 02:05:18 -0700
X-CSE-ConnectionGUID: EtBS0YjRSVi47AEnVDFwHg==
X-CSE-MsgGUID: xxNgjCB1S12W+hheERLVOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="266941547"
Received: from slindbla-desk.ger.corp.intel.com (HELO mnyman-desk.home) ([10.245.244.13])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 02:05:16 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Michal Pecio <michal.pecio@gmail.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 2/3] usb: xhci: Fix isochronous scheduling regression
Date: Mon, 31 Aug 2026 12:04:47 +0300
Message-ID: <20260831090448.95644-3-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831090448.95644-1-mathias.nyman@linux.intel.com>
References: <20260831090448.95644-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Michal Pecio <michal.pecio@gmail.com>

An isoc URB without URB_ISO_ASAP should be scheduled immediately after
the previous one, unless it's the first submission or prior URBs have
completed without resubmitting and the endpoint became idle.

An HCD_BH driver must consider URBs pending completion in the BH queue
in addition to its own queue. Regrettably, core doesn't provide much
information, we can only know if we are being called by completion now.
This issue is as old as HCD_BH, affects ehci-hcd too and has no known
reproducible impact, as drivers generally resubmit from completion.

A recent patch tried to address it by looking at xHCI HW state instead.
Obviously, HW has no knowledge of the BH giveback queue either, and the
whole solution amounts to testing whether prior URBs have been unlinked
instead of completing normally - then a new stream is assumed.

This leads to false negatives when a driver simply allows the endpoint
to empty out and begins a new stream. New URBs are scheduled into the
past and promptly fail with -EXDEV status, causing data loss and worse,
because drivers get confused by premature completion, particularly when
multiple endpoints are started at once and required to stay in sync.

snd-usb-audio underruns the OUT endpoint when userspace fails to supply
playback data in time. If this is detected in duplex mode, IN URBs are
unlinked and both streams restarted. OUT underruns again before IN even
begins, another recovery is attempted and the cycle repeats.

Fix this by using the best criteria we can muster, taken from ehci-hcd.
This brings false negative rate back to zero and false positive rate to
less than ever before in xhci-hcd. Traditional logic was equivalent to:

	if (list_empty(&ep_ring->td_list) ||
	    GET_EP_CTX_STATE(ep_ctx) != EP_STATE_RUNNING)
		// consider this URB a new stream

While free of false negatives, it had easily avoidable false positives:
* no check for completion in progress when the list is empty
* the ep_ctx check doesn't make up for it at all, but it adds a race -
  EP state can remain "stopped" for a while after the first submission

[mn: add debug message in possible false positive case where driver might
incorrectly assume new stream starts mid stream just because td list is
empty (URB enqueue is late), and workqueue isn't processing URB
completions for this endpoint at the moment]

Link: https://lore.kernel.org/linux-usb/20260813005635.34750f8c.michal.pecio@gmail.com/
Fixes: add8469b3e00 ("xhci: fix frame id calculation and checks for isoc URBs")
Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 97a1b53c18ef..9847c5bfc41b 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -4312,11 +4312,16 @@ int xhci_queue_isoc_tx_prepare(struct xhci_hcd *xhci, gfp_t mem_flags,
 	check_interval(urb, ep_ctx);
 
 	/*
-	 * Check if this starts the isoc data flow. Relies on hw setting ep ctx
-	 * state after doorbell ring. Consider adding list_empty(td_list) check
+	 * Schedule the URB discontiguously if all previous URBs have completed.
+	 * XXX core can't tell if completions are pending but not running yet.
 	 */
-	if (GET_EP_CTX_STATE(ep_ctx) != EP_STATE_RUNNING)
+	if (list_empty(&ep_ring->td_list) &&
+	    !hcd_periodic_completion_in_progress(xhci_to_hcd(xhci), urb->ep)) {
+		if (GET_EP_CTX_STATE(ep_ctx) == EP_STATE_RUNNING)
+			xhci_dbg(xhci, "Unexpected running ring at isoc stream start, uframe: %d\n",
+				 xep->next_uframe);
 		xep->next_uframe = -1;
+	}
 
 	return xhci_queue_isoc_tx(xhci, mem_flags, urb, slot_id, ep_index);
 }
-- 
2.43.0

