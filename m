Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336E94570DB
	for <linux-usb@vger.kernel.org>; Tue,  4 Aug 2026 10:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785837882; cv=none; b=tK2CCqrOVB5IP8fOQJhaR7zUCJ1PjfGL18Pq7PebfVDz1W7WYaN843N5gnvP1FB1yeKf6S534YoJM9io0DBgsOHeCxXmTmuEmtZkDFaJ9yMfyrqQ3WNGOe87g1LbTzcAK1ECaTOHIGBohNC9jp2NUHtynqdIrd/E45cl9Ny7CqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785837882; c=relaxed/simple;
	bh=IqAhJCxRkb6lfpuaonAkPepeYUWJNOqAdbIiKh1yC5s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OpGteY6C6IGtZI003m2Db1Fo9iAiQgVpgX7LIiUy9VkKz0UvBiOTFRDEyovvyss2mqIl4ZFsPoIonRS9U7+JetHce9+XnkFmlqIIB5n+aZPNu2e/plJTRFUXqTkm1XgZJ7DQDd6oPCQfgoXC4Xjt2d9Vu3doEvPkCPYBo2/tf4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YW5zlJbD; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YW5zlJbD"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493b966dd74so17043255e9.3
        for <linux-usb@vger.kernel.org>; Tue, 04 Aug 2026 03:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785837879; x=1786442679; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HpDn3hiVuA1sei69QrJvJ/J82fmpj8mowHCqmySopVY=;
        b=YW5zlJbDc2eYIYQ/8ROPIs28g9poWX4kbYFvtJUeLix7Zh9QNRlaX79EOYxbTvVUVY
         /zpPGuCI5Sn3htqr/ED0/8mxl6/bSwStaCXLZdiJ9Cqx3YJdKlLszXwyCZHT7OUa7yui
         3n2zUaQAJZDpWtN0jQxxuAZBBnRZiQ2W1uQWkT5rbx4c3ULPBM7yZf5Pgv8Wm4UCMc7I
         gKNwGPaF6DLCzKw+o+1hIs7VSSD+ljuzHTbJ4QuXB/FRUcXkf6LSQuJllwsLzWN3g6gb
         rpJJzcZK1zpqlruOkhfcSJrnZSMoJYzXQbLVbnvm3J17n/Gw+L/T/mPZVH+/ckqOr1yJ
         vbcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785837879; x=1786442679;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HpDn3hiVuA1sei69QrJvJ/J82fmpj8mowHCqmySopVY=;
        b=EL9WmT13p85UvRKQhvQg62IbmE/W8/6h1D9v9tLy9qM9fKP/dnGeepqO4orqH9asmv
         0/k5UGcn0xFzLQ6AN3Ewh8WaJtfRPk6vEpGReCBRoHlPzfqjT9owDK11oNhrL70vVXca
         B9GdwSZBjn1pIXy8FbttKFrCuTGxuy3q4hguPIaZQfhrGIe54DFj/M2fLC+s46a46E3Q
         AsN21Z8whdRVnY/kMKSevJvLuQ5Ywb+3zvFMV7GKofKWzC+KFBUgx0DC6xulruvHWqL3
         jcVVgaCmewCln1J75uX4dfiep/LILFOwomtUVOTauAR2itQaRd+I04bRF2JBsxoAIx7V
         w8jg==
X-Forwarded-Encrypted: i=1; AHgh+RqPnHV+82UEC2YA99VtzPwpwOYRzRcDvPsfO4x5bQ04YPgyjkG84dqk8GY93ENfE6qw70RyYQ1MCAE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw56iLMdiXsxoewW84VWoOlJ3bqSFL1VEcadTdrG3NRhI+O5nxF
	G8A7jratEsXaIG4f12/G2xArRMZKXi7rNapRBxikU1C9CeTQ76Mrz4Co
X-Gm-Gg: AR+sD130hzH0TPnZGhVzwJMYhOsQ7AyGgE7vp7Y4EygAWtn8y1VrmUw4z12EpJKqBI8
	ayG8mE1rddpacOrIiev+EptuMV4IgUiwx2DZGQbf582/pNvhNhL/56tKcHnLzvIYiOlITxapxJr
	EDZxqz7wcmQSIm2DCB7bzg8JJtV6Gd5KuWXs4nzOHTrIaGnSCP3LHg8FnH5RrNwOMLHes+ODqlf
	unMTpTYaxsCc3poEUPsRcduPqBCIIPWex1HckcVWrDuWSDt3R8pR4S9CqRNLP1qR+FaeGHy8Zv8
	+eoHj9MODge1x9z2d8r55a7LxUHvoGm7F06qUYCAN2em2VnMIYapnj2lHjUoE9JiXLUDa4BL9TQ
	1fXoZGOJO13+E/DlezSdlvJLf1+2ke/WhujEUK40l9P/yF4oNzI1qHo1ZWh38OgDpdWXnzvWHTk
	/hky0g/uDOgt1CFLCB7Q0p+eWp5dpFyOhfcPXnSfmn/maWpvzsnjNcUbOkRtSsGiPwfZir3Ihs
X-Received: by 2002:a05:600c:4444:b0:493:f6f0:d66b with SMTP id 5b1f17b1804b1-4980c6458aamr294474585e9.1.1785837879422;
        Tue, 04 Aug 2026 03:04:39 -0700 (PDT)
Received: from foxbook (bgt135.neoplus.adsl.tpnet.pl. [83.28.83.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fcb46esm86659055e9.5.2026.08.04.03.04.38
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 04 Aug 2026 03:04:39 -0700 (PDT)
Date: Tue, 4 Aug 2026 12:04:36 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Cc: Bart Nagel <bart@tremby.net>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] usb: xhci: Shorten the TD skipping loop
Message-ID: <20260804120436.0832eea2.michal.pecio@gmail.com>
In-Reply-To: <20260804120110.01bda0e2.michal.pecio@gmail.com>
References: <20260804120110.01bda0e2.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Half of this loop is code which only executes once to deal with cases
where no TD matches the event and then it returns. This code needs not
to be in any kind of loop, so get it out.

Optimize conditionals remaining in the loop body.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/host/xhci-ring.c | 69 +++++++++++++++++-------------------
 1 file changed, 33 insertions(+), 36 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 8270c63ec3bf..1f0cb6a701c5 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2843,10 +2843,9 @@ static int handle_tx_event(struct xhci_hcd *xhci,
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
@@ -2884,38 +2883,6 @@ static int handle_tx_event(struct xhci_hcd *xhci,
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
@@ -2932,10 +2899,40 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 
 	ep_ring->old_trb_comp_code = trb_comp_code;
 
-	/* Get out if a TD was queued at enqueue after the xrun occurred */
+	/*
+	 * Underrun handling ends here. Any TD pointed by the event was enqueued after the event
+	 * occurred, so wait for its completion now. And it's not a bug if no such TD exists.
+	 */
 	if (ring_xrun_event)
 		return 0;
 
+	/* Handle events not referencing the current TD */
+	if (!trb_in_td(td, ep_trb_dma)) {
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
 	trace_xhci_handle_transfer(ep_ring, (struct xhci_generic_trb *) ep_trb, ep_trb_dma);
 
 	/*
-- 
2.48.1
