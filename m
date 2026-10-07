Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8487439327
	for <linux-usb@vger.kernel.org>; Wed,  7 Oct 2026 07:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791359506; cv=none; b=hcjGbNRz+ienDoC8qATzDL0CJ8uW+IHJlcBtZOWzInjTrICuK0gdJgPQPKtPpNoSFUgm2j0NeVF2f2iYQ/Gf4/OFs8/60Oy2pJZswXP6BN+/juNySzyGBY4mO704KfqGSdxragcU9wyuL2LOd8T9yCQyeo21NeIw/pzITpEmqxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791359506; c=relaxed/simple;
	bh=sdSAqbCgahmcAPoWTA9qYdtqHRKXWDjVhTUk2ZmbxgI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UBvm4U5mkIAkcgo4yDINbp3V0ZAYaaogrKgi1mU+nrsmkgR0lyXR9z6hJ1VuBctRwIlj95hfNjEPPvGUjKynOpbf5Kqwt7g05q+mgCGzgvGTF8b3nfKQXTuAQXf1jgydjWuUKnCda2gs8NhtoKOy1Y2hrtpyKqwgwCc0zfhBwjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P90TIyIk; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P90TIyIk"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a018792ab3so14339685e9.0
        for <linux-usb@vger.kernel.org>; Wed, 07 Oct 2026 00:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791359496; x=1791964296; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bCD0Ma/aUmdecmxgeD5ziiIU2dGW3Peqg0Z9bY5RVLo=;
        b=P90TIyIkFcHcsaxviPW09KCEJV/ejfDpN+VT9RUi2uMU0beex8beQ0NH7GTJXvxZPJ
         DeADjQV0IBDxIhe+feD6NSrosBl7sVhd+D2idcc50vcGnEwf34AwVFWiwWajvc4U5KwW
         5Yc7GEaMTLGYDiAWeN2qe5kUINpL7X6vBxADeS7QxrawM51hT172iaJWFK6IPQN8KAfe
         zx4ct3BHwBG941IaiASJjJ+oIia+maEbYLuvnW6boGfSr0rEXd+I47uV7BvBIPLHeJzW
         ZUZO2Ue8ZTatvuw63aV/v/e8jxMMkczpNPnlTrx+6lewh9/VhSbr3C4C+5LwZmzvFD6P
         Ldgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791359496; x=1791964296;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bCD0Ma/aUmdecmxgeD5ziiIU2dGW3Peqg0Z9bY5RVLo=;
        b=2Y2Xq/gJs5of3RpFyEJGozDMn5gMWleuiTJd/28hRqDC9Ha5IkSDPBN1B5S6GeLp9p
         aO4XQHp/BErl2b6rykwS+VM6IZiPNa1o0KGayP5zTLg3rR/lb2zO9t5wl/DeoIVgJzXB
         y2sTm73cuQ72Buxnwe/2lvhNH6SPqBQBouUXBmQYrrGp+nM3avgJchHbAcMmwgH1q+nR
         y2NaDRgc633F33bItikeQoh487Rnj4qAe1ej0Wq5GbHwb0IsYp1FPi8D5YXwUkWPrKXF
         mzx8SkTyzGUT/WtCFKBzN77MQXhthsiq/yh7NK/Pn7Fa13noLw8Twf7GG26JK4cAFTed
         Frwg==
X-Gm-Message-State: AFuF++lB33S9wge2au7ybPhc0Sjc/iu35ejrODayIF3TKO1/U4xFvFlk
	KioTukgco8JyaE2CbvPDBM7F8hvtvczSh96nrbPDQfJnhhi3n9G6rQNmq2giSwDy
X-Gm-Gg: AYBFou2DWsvAcjpJzUWOFRuehZJ0lICA6VYjDsDAG/3K5DfcV/S8lsCYRCgRS22mak9
	6+kpzV3/C0JlG2QWKyVd7+T9xY3kPNStLFKSUnqCtPRLT4hYwYpWqZwv/8Wu05BQbWsbWgi7V2P
	88cR6diRc5IomgM6Om7HU1DOYWSDc83bVB8fOU3ES7t4uPode1lAXV00RR4SeHUb4cLWtHn6YMo
	S8C9qeF19RVtVSVwtgX7mmEtSoiG/caA8qJl7P7c26VHO8yIQbvyJZZbZzcbyTVfYa7kmTna+A7
	ixv96ZSYcHWkMcPsuflUonO3ds11RJ2f6J1rE+JQGgOeFOmsJqbp92X/VcUyKrZreeQ/Z43QwSj
	TbYuk5aYSxiXePxwmsWjdX5YDhUM83OwL5C+XOtVlRJQZDjeFtYI1sHCn+BneG4k6sfWSz6mMCb
	hy/F6fC6A+qYRg8InEYJx9WnlmtkTlEsMX46upf4bkcjkUAtX1iF0/eaiphp9ex8ItLVAJu3U9b
	Rrfw9jEKQ==
X-Received: by 2002:a05:600c:1546:b0:4a0:2867:d8a9 with SMTP id 5b1f17b1804b1-4a180648e92mr19902375e9.30.1791359495582;
        Wed, 07 Oct 2026 00:51:35 -0700 (PDT)
Received: from foxbook (bez186.neoplus.adsl.tpnet.pl. [83.28.37.186])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c5d8dfsm139137905e9.14.2026.10.07.00.51.34
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 07 Oct 2026 00:51:35 -0700 (PDT)
Date: Wed, 7 Oct 2026 09:51:32 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] usb: xhci: Shorten the TD skipping loop
Message-ID: <20261007095132.04638d45.michal.pecio@gmail.com>
In-Reply-To: <20261007094952.28bfa51e.michal.pecio@gmail.com>
References: <20261007094952.28bfa51e.michal.pecio@gmail.com>
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
 drivers/usb/host/xhci-ring.c | 68 +++++++++++++++++-------------------
 1 file changed, 33 insertions(+), 35 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 3ae823830fcf..875a0770a3b7 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2844,10 +2844,9 @@ static int handle_tx_event(struct xhci_hcd *xhci,
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
@@ -2885,38 +2884,6 @@ static int handle_tx_event(struct xhci_hcd *xhci,
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
@@ -2931,6 +2898,37 @@ static int handle_tx_event(struct xhci_hcd *xhci,
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
2.48.1
