Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1CC3C5856
	for <linux-usb@vger.kernel.org>; Tue,  4 Aug 2026 10:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785837945; cv=none; b=al3wEm3N0kBJZdc0g3RYC+FTCcxXMicpcFWQxPgaDvvtH5rxmP6+2kMiLPEClo5SpkoMFYCgGHqX5t0sAm3NOu0qzlJ2ANYazNKOUs9LZRYzdS6Ur25yL0nuf/UWZLh3PBLgHKASflTdqcTYrsv6WjI+Rzjd79KHqze/HMyyoKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785837945; c=relaxed/simple;
	bh=0LboO2Wzvm8VqKeGaVT01ngopn2Nr9Qeiwbqzf0FPT4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s5EfQkkuDWefBUEaDhdMn78D3/cNnPYvHQWxNdgKxopgI1rotTTg+sBcYShZw7pO+ZSEVDFuG7bQ318EsxRf7o+rV7YhpOZGxd2eIboSPnbC9edc4FbOXzeCCCMgsghKqM4pGVYc3KBTtmwMbRWWdrwx4dec3pv5jen6cWEj7gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ch9/LWPm; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ch9/LWPm"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47362928f65so4174353f8f.2
        for <linux-usb@vger.kernel.org>; Tue, 04 Aug 2026 03:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785837942; x=1786442742; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OPvlax79e2vC8TjmBy8SZ+anL5Hc0LnpGK9pcZKkYAQ=;
        b=ch9/LWPmvBe54R2i3uRRqGg+WsiQkhW2BaH6nlsV8aC5qqzPCX2l9XVN3GFY2y1pLv
         /ybsePvWRuTC2pRRM5Tj37R3QvYsiazoEm5zZaFx3XLvCK0sXu+6sLEU2aQJI8hqURLz
         v9FMTI4GqGcfnz4ezw3iApFWuqRtMyE8PYxNUwouaq+OTcBxDx530eidhLel5JEx1isH
         N2zpD7wKwIGWv3k+p+wFq27DaHyD+6GMt66YTF16Mz6291LevRGDCHP7Mw/3xwPFx7FS
         i2y1xhxgg5YTiQ3B4WcfPf3sKIyMtz7JXa64WmAXShXpMxHZDocBYs7kGGsxQqVFOCVe
         USMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785837942; x=1786442742;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OPvlax79e2vC8TjmBy8SZ+anL5Hc0LnpGK9pcZKkYAQ=;
        b=rpsrmYIXFOC4O4f1ju/rfIR3DYVANr1JKsLQrd2xL/5sCFLzetPtp/fptqmTyr6Dwb
         wA/DbXOz1Ja2AYmWJWIj3UATg0iMLyud3gJXVPWNC/pKNZGSY2SnciYcaVUQw+e1VNUG
         USRJF/5Cv6ea9TURA2d/aJZrRXIQTWsV3dWZNmwo3UMAK+jTn7FS0AI8V/8bmJP8JBgp
         Ef7A1pPic/tLFHsOjUKADygue+Y5wxEMJ/yGMMJ2Geb5shgNOeNsvqo0tDma9nSSokHu
         lRgGhGRQf/E0DpiRgZgQyr01ntYWRuEir7YMhEzX8GU7GpJFDVOfbTDDP1LODlGvrdQD
         su6Q==
X-Forwarded-Encrypted: i=1; AHgh+RpmSl5Zhq0il//FjqzogM1NQB7YGEe7oz4K8Kfkv4jBqK3oV3JVN/L+bFmtDkVfhmUfbLsrNu+7V9E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWqAzxd0tGn+Q8O1XgAWulE+3VOFWaDPra6xw7McB+jNwKGrgZ
	Kyfw3d9P7uOCYqddeTtnl8JCHO2sKhGIa9GXATutSHZ+VwQ7k10ERCTr
X-Gm-Gg: AR+sD132uKghcMOVe1KYaIvK0mXXGIiSuSr1JDDfrdvgJJ9i8mJtNFDtmbD1dhnf9MG
	MQjHPM7xiHSEaLf9fOyhP1hW7LCP7DMh3z2AufRFzDc0+Me5QMSShRUhxyvktCePl1SLKdtBjf2
	L3mFmypwRS8doEdVZrUJmSkUPQCEMUdMWC7Yw9l9Zsm/v6N2DYRX4zxxvMJpcSM+GEnFgyAJf78
	ruDVXI7AytpNpmpAB92xPHpZtuqR3zT1RAvLZMSYTcPPvRfIg7wHMLWKSw5Sr2XYnPtQPfY9uvb
	HQitY5I2HBGODsmnXWO7uKfpJrN2Bc2qQuOi5xaWhTUJePAADcxXfaCKIpqPlhRq4yhZ67Us0uY
	Oy/SHf8Im5mQ3O9OLp4zVcx4tB2JCf9hZ/GVsYf89lEqM2e8VhaWdeYCZGNfr99YWfqcl/8HHxN
	mjLXURSClAQmqNnaMnU7YMhr9vrneJSPSt+FJ0TinrTMdHLqqOrc0BZpFuyslz+uRYKfIzkpyOT
	g==
X-Received: by 2002:a05:6000:4410:b0:47f:7129:6e2d with SMTP id ffacd0b85a97d-47fd72c753dmr26264167f8f.17.1785837941391;
        Tue, 04 Aug 2026 03:05:41 -0700 (PDT)
Received: from foxbook (bgt135.neoplus.adsl.tpnet.pl. [83.28.83.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd458b73asm39207883f8f.29.2026.08.04.03.05.40
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 04 Aug 2026 03:05:41 -0700 (PDT)
Date: Tue, 4 Aug 2026 12:05:37 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Cc: Bart Nagel <bart@tremby.net>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] usb: xhci: Rework and improve the TD matching and
 skipping logic
Message-ID: <20260804120537.5c30554e.michal.pecio@gmail.com>
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

Matching events with TDs and giving back missed TDs is carried out
by a complicated loop. Replace it with a simpler linear logic:

0. Having verified that 'td_list' isn't empty,
1. Scan it to find the matching TD and count missed TDs,
2. Perform necessary adjustments for corner cases,
3. Give back missed TDs, if applicable, using a short and tidy loop,
4. Check if the event refers to the expected TD and proceed as usual.

Besides cleaning up the code, this provides a few improvements:
- when the skip flag is set, no TD is given back unless we found a match
  or otherwise know how many TDs should be given back
- when the skip flag is clear, we know if the event refers to a "future"
  TD so we can log this in the Scary Error Message to aid debugging.

While altering the error message, drop a pointless goto.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/host/xhci-ring.c | 137 ++++++++++++++++-------------------
 1 file changed, 61 insertions(+), 76 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 1f0cb6a701c5..d94146ceb178 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -125,11 +125,16 @@ static bool link_trb_toggles_cycle(union xhci_trb *trb)
 	return le32_to_cpu(trb->link.control) & LINK_TOGGLE;
 }
 
-static bool last_td_in_urb(struct xhci_td *td)
+static int num_tds_not_done(struct urb *urb)
 {
-	struct urb_priv *urb_priv = td->urb->hcpriv;
+	struct urb_priv *urb_priv = urb->hcpriv;
 
-	return urb_priv->num_tds_done == urb_priv->num_tds;
+	return urb_priv->num_tds - urb_priv->num_tds_done;
+}
+
+static bool last_td_in_urb(struct xhci_td *td)
+{
+	return !num_tds_not_done(td->urb);
 }
 
 static bool unhandled_event_trb(struct xhci_ring *ring)
@@ -2605,14 +2610,19 @@ static bool xhci_spurious_success_tx_event(struct xhci_hcd *xhci,
 	}
 }
 
-static struct xhci_td *find_td_by_dma(struct xhci_ring *ep_ring, dma_addr_t dma)
+static struct xhci_td *find_td_by_dma(struct xhci_ring *ep_ring, int *missed_tds, dma_addr_t dma)
 {
 	struct xhci_td *td;
 
-	if (dma)
+	if (dma) {
 		list_for_each_entry(td, &ep_ring->td_list, td_list)
 			if (trb_in_td(td, dma))
 				return td;
+			else
+				(*missed_tds)++;
+	}
+
+	*missed_tds = 0;
 	return NULL;
 }
 
@@ -2629,8 +2639,8 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 	struct xhci_ring *ep_ring;
 	unsigned int slot_id;
 	int ep_index;
-	struct xhci_td *td = NULL;
-	struct urb *missed_urb = NULL;
+	struct xhci_td *td;
+	int missed_tds = 0;
 	dma_addr_t ep_trb_dma;
 	union xhci_trb *ep_trb;
 	int status = -EINPROGRESS;
@@ -2813,13 +2823,6 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 		xhci_dequeue_td(xhci, td, ep_ring, td->status);
 	}
 
-	/*
-	 * We don't know how many TDs were missed when ep_trb_dma is zero (as permitted by
-	 * xHCI 1.0) or bogus. Bail out leaving ep->skip set, next event will sort it out.
-	 */
-	if (trb_comp_code == COMP_MISSED_SERVICE_ERROR && !find_td_by_dma(ep_ring, ep_trb_dma))
-		return 0;
-
 	if (list_empty(&ep_ring->td_list)) {
 		/*
 		 * Don't print wanings if ring is empty due to a stopped endpoint generating an
@@ -2839,63 +2842,47 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 		goto check_endpoint_halted;
 	}
 
-	do {
-		td = list_first_entry(&ep_ring->td_list, struct xhci_td,
-				      td_list);
-
-		if (ep->skip) {
-
-			if (!trb_in_td(td, ep_trb_dma)) {
-				/* this event is unlikely to match any TD, don't skip them all */
-				if (trb_comp_code == COMP_STOPPED_LENGTH_INVALID)
-					return 0;
-
-				/*
-				 * If skip flag is still set at xrun, we are on xHCI 1.0 and our TRB
-				 * pointer is zero again. All missed TDs can be given back, but we
-				 * don't know which were missed and which were queued after the xrun
-				 * occurred. We can safely give back the first pending URB.
-				 */
-				if (ring_xrun_event) {
-					if (!missed_urb)
-						missed_urb = td->urb;
-
-					if (td->urb != missed_urb) {
-						xhci_dbg(xhci, "Skipped one URB for slot %u ep %u",
-								slot_id, ep_index);
-						return 0;
-					}
-				}
-
-				/*
-				 * TD was missed, skip it. Core already initialized frame->status
-				 * to -EXDEV and frame->actual_length to 0, nothing more to do.
-				 */
-				xhci_dequeue_td(xhci, td, ep_ring, 0);
+	td = find_td_by_dma(ep_ring, &missed_tds, ep_trb_dma);
 
-				if (!list_empty(&ep_ring->td_list))
-					continue;
+	if (ep->skip) {
+		if (!td) {
+			/*
+			 * xHCI 1.0 allowed MSE events to have zero TRB pointers. Some old chips
+			 * also generate bogus non-zero pointers. We know, don't bother warning.
+			 * Missed TDs will be given back by the next event with a valid pointer.
+			 */
+			if (trb_comp_code == COMP_MISSED_SERVICE_ERROR &&
+			    xhci->hci_version <= 0x100)
+				return 0;
+			/*
+			 * If skip flag is still set at xrun, we are on xHCI 1.0 and our TRB pointer
+			 * is zero again. All missed TDs can be given back, but we don't know which
+			 * were missed and which were queued after the xrun occurred. We can safely
+			 * give back the first pending URB to let the class driver know.
+			 */
+			if (ring_xrun_event)
+				missed_tds = num_tds_not_done(list_first_entry(&ep_ring->td_list,
+								struct xhci_td, td_list)->urb);
+			/* In other cases missed_tds is zero */
+		}
 
-				xhci_dbg(xhci, "All TDs skipped for slot %u ep %u. Clear skip flag.\n",
-					 slot_id, ep_index);
-				ep->skip = false;
-				td = NULL;
-				goto check_endpoint_halted;
-			}
+		/*
+		 * Give back missed TDs. Core already initialized their frame->status to -EXDEV
+		 * and frame->actual_length to 0, nothing more to do.
+		 */
+		for (int i = 0; i < missed_tds; i++)
+			xhci_dequeue_td(xhci,
+				list_first_entry(&ep_ring->td_list, struct xhci_td, td_list),
+				ep_ring, 0);
 
-			xhci_dbg(xhci,
-				 "Found td. Clear skip flag for slot %u ep %u.\n",
-				 slot_id, ep_index);
+		/* the list may become empty on ring_xrun_event */
+		if (td || list_empty(&ep_ring->td_list))
 			ep->skip = false;
-		}
 
-	/*
-	 * If ep->skip is set, it means there are missed tds on the
-	 * endpoint ring need to take care of.
-	 * Process them as short transfer until reach the td pointed by
-	 * the event.
-	 */
-	} while (ep->skip);
+		xhci_dbg(xhci, "Skipped %d TDs on slot %u ep %u comp_code %u, TD found %d, skip flag %d\n",
+				missed_tds, slot_id, ep_index, trb_comp_code, !!td, ep->skip);
+		missed_tds = 0;
+	}
 
 	ep_ring->old_trb_comp_code = trb_comp_code;
 
@@ -2907,7 +2894,7 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 		return 0;
 
 	/* Handle events not referencing the current TD */
-	if (!trb_in_td(td, ep_trb_dma)) {
+	if (!td || missed_tds) {
 		/*
 		 * Skip the Force Stopped Event. The 'ep_trb' of FSE is not in the current
 		 * TD pointed by 'ep_ring->dequeue' because that the hardware dequeue
@@ -2930,7 +2917,13 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 		}
 
 		/* HC is busted, give up! */
-		goto debug_finding_td;
+		td = list_first_entry(&ep_ring->td_list, struct xhci_td, td_list);
+		xhci_err(xhci, "Event dma %pad for ep %d comp_code %u not part of TD at %016llx - %016llx, missed %d\n",
+				&ep_trb_dma, ep_index, trb_comp_code,
+				(u64)xhci_trb_virt_to_dma(td->start_seg, td->start_trb),
+				(u64)xhci_trb_virt_to_dma(td->end_seg, td->end_trb),
+				missed_tds);
+		return -ESHUTDOWN;
 	}
 
 	trace_xhci_handle_transfer(ep_ring, (struct xhci_generic_trb *) ep_trb, ep_trb_dma);
@@ -2962,14 +2955,6 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 
 	return 0;
 
-debug_finding_td:
-	xhci_err(xhci, "Event dma %pad for ep %d status %d not part of TD at %016llx - %016llx\n",
-		 &ep_trb_dma, ep_index, trb_comp_code,
-		 (unsigned long long)xhci_trb_virt_to_dma(td->start_seg, td->start_trb),
-		 (unsigned long long)xhci_trb_virt_to_dma(td->end_seg, td->end_trb));
-
-	return -ESHUTDOWN;
-
 err_out:
 	xhci_err(xhci, "@%016llx %08x %08x %08x %08x\n",
 		 (unsigned long long) xhci_trb_virt_to_dma(
-- 
2.48.1
