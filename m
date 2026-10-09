Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D534548BD5B
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 09:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791539951; cv=none; b=ETkcYsaG97jCfhOaIqc9IHKiFyt4oFKIbXl6q8e9SRU+s1h+iaf0bqZFD9xwUSpQwp/4i86JsaA0jFbfYWVWxhSnrTp9nyFMMFNUdXTuAzgRo5ORbbYbQH80YwQ0DcCS1vdkFpf/8nlCdz336MT6jmtnM69EfA80O82aRORmFIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791539951; c=relaxed/simple;
	bh=UdoSNzAZxRGbFpxMpAuib0ral8+g0rN2PwR39abIS1o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PGSsQjDMqjOe1AmYJLw+1Msn/CXJsMZkDyREwQNh7WZz8ora3g24eIfc/ZQuqXIgVIoo3PWbRgnSAHAFRA+8RjsOYZQCsKrU67EuGOv/2wsupPHPyGD6Wjr5fmUi2qYAKuRyC+fCV3zAz7f2GzYG6hf1Bd49nZa4veFGxiLAAfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RzRhyaU+; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RzRhyaU+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791539950; x=1823075950;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UdoSNzAZxRGbFpxMpAuib0ral8+g0rN2PwR39abIS1o=;
  b=RzRhyaU+pdcyBcbb8aGW93cJkc5i1u/0oTSm8yQlm7vgaCLHEzYG2mgB
   uFiGwXc1tO+VnjAgNZKln72W3hELTuAwzPP35L+SeU0PBiS/QevwSbmxj
   uAnM8oajTUUBvru9E3MaLvB/A8iPSZ4/y3tfCk0oQPs+5rUtAeZz/lRcd
   MpFMaaLyWO/bBvIDF6VKYMHfsXG3jjNlmvFaJ3pZMDQvXDcm6TdBSFbTo
   K4YtlwjBjnLhy1EtQUt5c+efmloC2+o663wGW9ECQLydbF/S9nD2XnLyl
   xm5hO7qDltTf5LXPpsHdyX3k7m5tXG6bl6uAenEh8JJP5Mw/hPRCB4dFI
   w==;
X-CSE-ConnectionGUID: Hb1mOg0cRsaWoKBM6Q14aQ==
X-CSE-MsgGUID: 6Z7KNtJYQmGrOxOwY3EzHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="224135"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="224135"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 02:59:09 -0700
X-CSE-ConnectionGUID: 1LJ/uIxQSviN2lx/xQSC1Q==
X-CSE-MsgGUID: IRnbXxjqT2ylUTE2AfvhAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="613446"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.244.17])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 02:59:08 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Michal Pecio <michal.pecio@gmail.com>,
	Mathias Nyman <mathias.nyman@intel.com>
Subject: [PATCH 11/14] usb: xhci: Shorten the TD skipping loop
Date: Fri,  9 Oct 2026 12:58:31 +0300
Message-ID: <20261009095834.561578-12-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009095834.561578-1-mathias.nyman@linux.intel.com>
References: <20261009095834.561578-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Michal Pecio <michal.pecio@gmail.com>

Half of this loop is code which only executes once to deal with cases
where no TD matches the event and then it returns. This code needs not
to be in any kind of loop, so get it out.

Optimize conditionals remaining in the loop body.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
Signed-off-by: Mathias Nyman <mathias.nyman@intel.com>
---
 drivers/usb/host/xhci-ring.c | 68 +++++++++++++++++-------------------
 1 file changed, 33 insertions(+), 35 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 2dd11732bb87..7597ef8105c6 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2862,10 +2862,9 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 		td = list_first_entry(&ep_ring->td_list, struct xhci_td,
 				      td_list);
 
-		/* Is this TRB not part of the currently executing TD? */
-		if (!trb_in_td(td, ep_trb_dma)) {
+		if (ep->skip) {
 
-			if (ep->skip) {
+			if (!trb_in_td(td, ep_trb_dma)) {
 				/* this event is unlikely to match any TD, don't skip them all */
 				if (trb_comp_code == COMP_STOPPED_LENGTH_INVALID)
 					return 0;
@@ -2903,38 +2902,6 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 				goto check_endpoint_halted;
 			}
 
-			/* TD was queued after xrun, maybe xrun was on a link, don't panic yet */
-			if (ring_xrun_event)
-				return 0;
-
-			/*
-			 * Skip the Force Stopped Event. The 'ep_trb' of FSE is not in the current
-			 * TD pointed by 'ep_ring->dequeue' because that the hardware dequeue
-			 * pointer still at the previous TRB of the current TD. The previous TRB
-			 * maybe a Link TD or the last TRB of the previous TD. The command
-			 * completion handle will take care the rest.
-			 */
-			if (trb_comp_code == COMP_STOPPED ||
-			    trb_comp_code == COMP_STOPPED_LENGTH_INVALID) {
-				return 0;
-			}
-
-			/*
-			 * Some hosts give a spurious success event after a short
-			 * transfer or error on last TRB. Ignore it.
-			 */
-			if (xhci_spurious_success_tx_event(xhci, ep_ring)) {
-				xhci_dbg(xhci, "Spurious event dma %pad, comp_code %u after %u\n",
-					 &ep_trb_dma, trb_comp_code, ep_ring->old_trb_comp_code);
-				ep_ring->old_trb_comp_code = 0;
-				return 0;
-			}
-
-			/* HC is busted, give up! */
-			goto debug_finding_td;
-		}
-
-		if (ep->skip) {
 			xhci_dbg(xhci,
 				 "Found td. Clear skip flag for slot %u ep %u.\n",
 				 slot_id, ep_index);
@@ -2949,6 +2916,37 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 	 */
 	} while (ep->skip);
 
+	/* Handle events not referencing the current TD */
+	if (!trb_in_td(td, ep_trb_dma)) {
+		/* TD was queued after xrun, maybe xrun was on a link, don't panic yet */
+		if (ring_xrun_event)
+			return 0;
+
+		/*
+		 * Skip the Force Stopped Event. The 'ep_trb' of FSE is not in the current
+		 * TD pointed by 'ep_ring->dequeue' because that the hardware dequeue
+		 * pointer still at the previous TRB of the current TD. The previous TRB
+		 * maybe a Link TD or the last TRB of the previous TD. The command
+		 * completion handle will take care the rest.
+		 */
+		if (trb_comp_code == COMP_STOPPED || trb_comp_code == COMP_STOPPED_LENGTH_INVALID)
+			return 0;
+
+		/*
+		 * Some hosts give a spurious success event after a short
+		 * transfer or error on last TRB. Ignore it.
+		 */
+		if (xhci_spurious_success_tx_event(xhci, ep_ring)) {
+			xhci_dbg(xhci, "Spurious event dma %pad, comp_code %u after %u\n",
+					&ep_trb_dma, trb_comp_code, ep_ring->old_trb_comp_code);
+			ep_ring->old_trb_comp_code = 0;
+			return 0;
+		}
+
+		/* HC is busted, give up! */
+		goto debug_finding_td;
+	}
+
 	ep_ring->old_trb_comp_code = trb_comp_code;
 
 	/* Get out if a TD was queued at enqueue after the xrun occurred */
-- 
2.43.0

