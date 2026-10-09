Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FEE14D6C4E
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 15:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791559007; cv=none; b=VMQLYmWLYkdf+rd/dnebHDFO4A6L2iv0gZ1ilSDN3JU3cEiCLHADRR8z9MHzMrZGWa2dvetMDwmO75DAchOmCsOfwLiEQMiydimD7h5mOvG+rblN6SEKUbskBeZkqhPRFZlbUZNlwDpLAlLOY8r+2A8iKFFhw3bgq25vR1cqbkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791559007; c=relaxed/simple;
	bh=xi2Nvwnzw0ZYpOYhjz9HuYr0H06KKhmkEs+pqtGn2Lw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eoGbdrrrIESRWOvBz8hGI0iJeYDr43inH8OH08j2bSE/2+2UcDo7/jJRzCeIyVBAOpmbltD4WAJRbVkvnZveYi47HkKNd8J1r5t/6QotPvUO+avnqj8mZ6qjzuXd+jdQgyeeYctSNayi/tArkczPcKWFXkuGZJ/6sKM7IlECddM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=joWTIlCw; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="joWTIlCw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791559006; x=1823095006;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xi2Nvwnzw0ZYpOYhjz9HuYr0H06KKhmkEs+pqtGn2Lw=;
  b=joWTIlCwHK4u+/Mv8S8beiUFP1RZuQdygY84h+fue3j+5K9hoZB/Oq0Y
   P8BsNHPXs8b++SZaXAe7ypcFCszltoneyXD1KUq5iUQ+TMnNvjRkDoJhC
   5pzNd7hQy6npC2l/hrOOTwYDFEeF4peDZsEzEqchMOne0PUBai/dlSymP
   pAS5+KKQZBuXLR6jIbDlpHQKOfLbcVr98e12IaGs/qqFvu17ajsuSU5ID
   0+iDuq1Hol1+Br+S01X9Qw3bNLFKA1wm7+LOv6/UrIuhuzcAbxM0OosA4
   5YnTTxUvQlp5EA73Wja9UIf7nycGoZzbXhH5Jxhoq4gUaSSXLAN2PK/os
   Q==;
X-CSE-ConnectionGUID: QCSaDHqmQQm467JIeLjDSQ==
X-CSE-MsgGUID: biVVmy9xQTG8VwbqN4GFng==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="351695"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="351695"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 08:16:46 -0700
X-CSE-ConnectionGUID: EnB49RecSU+Nni6T9Kx6Ow==
X-CSE-MsgGUID: TgeTSspLR9yq/w+FGmfvxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="650069"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.244.17])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 08:16:45 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Michal Pecio <michal.pecio@gmail.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH v2 08/11] usb: xhci: Shorten the TD skipping loop
Date: Fri,  9 Oct 2026 18:16:21 +0300
Message-ID: <20261009151624.618967-9-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009151624.618967-1-mathias.nyman@linux.intel.com>
References: <20261009151624.618967-1-mathias.nyman@linux.intel.com>
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
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
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

