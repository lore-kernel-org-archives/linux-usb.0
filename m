Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF5B4399CD
	for <linux-usb@vger.kernel.org>; Tue,  4 Aug 2026 10:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785837753; cv=none; b=WTWwko7IiawxYA0kb4U1/gWwiPe0ytcR8hQMSCf+gvkS/E+e6AgZRkWT1IKf+QLTPA5UAs8u/sDi6asBcOTu65OD/aibw++Q26ywVK9uZ9BHIab0MjlzdnzWYMwNBpVi1C9lKy42PRL+hOYg42SVbV7KgdlCtM73t9fin/IkdPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785837753; c=relaxed/simple;
	bh=JxbxhSi0ikTARZZqD063b3g0IiJDbZr8KLUrF9HY2A8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d9UlvpP/NeL49oIJAN0ZVMX3MFgNH5ANPIsQmEkx19v9u20H9J06YeinA+lVbnWrvhHP6AN75jmdZKsToEvGDkyOLxW97LMPPToopKaHRnNuAt7jOuhacNVpnaS6qhVxuwQt7EGaIYtwQb/grY3NHffHpEBLUR7xLzp1G6Uw9AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MzRmkEK9; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MzRmkEK9"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-495757ccbc1so29359395e9.2
        for <linux-usb@vger.kernel.org>; Tue, 04 Aug 2026 03:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785837750; x=1786442550; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y/lteXKHrsjzDmStTxqHbNUy74XpdlBSY16dLUMkL84=;
        b=MzRmkEK96Ci8t9QFCHO6glDWY3DL9GihoFV8iieb2zFefNBdx0i6KMe7ufEUMebnab
         jgu+BcT39vYvwgrWI0hdX0y4ryNnUBHUa1VfC9e1SsdEkw4j96yDr/+sbVO9+yCrwvM0
         XVpErEA09tjlu1la4DKfQud7+ykt71UMXtVzWnq+hqoN0wmuewbjY1KYv6TW8sBHC0e1
         lu3zr8LkZmhXTWWKkvLa9cK+P3lobwDmr3iaQnw832+ACxLxP8Xcx6lAKfglg3kDVGXT
         pBx3EMmmZhpbC6ke9/7seizfKlOAaa9Xsf+fXLGzJwn9rnjeU1RtZLo8EWRoHEFQnddb
         ESNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785837750; x=1786442550;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y/lteXKHrsjzDmStTxqHbNUy74XpdlBSY16dLUMkL84=;
        b=aw85eq9a+GBp35dRaFXhBu2pFPeD6p/9N4a6nvyBed+aVw7HWmzhEeETC4DeM9lS6Y
         n5SfOQeFtPH1jSWDkq0D3miemd1IVkJHLMYDJ833huXEhG5968lRQEz6bUlPCN0/chQs
         rLTTsmyTPQEtqFmB3W8s6aOqPfbNHcF4mWU/LYiEakb7P/pLVbnK+wMAqEaPAAzhGnAi
         V2eQdPwVfljKWWuPrdiGH/O6EuXYIBzzdHy4VHxQMePanWgXMbH101iFgD9bpkxlFxJI
         y57rYp48+6MD+zQB6qjO+azFovbkmnwI1J2T2l8ZuIfj774j0h8Ybn0ZlLezhH5PNYlU
         foEw==
X-Forwarded-Encrypted: i=1; AHgh+RoX0K4VmCUxhJBg6hCoscmF8zu8wP2DeUB/04hQ+1SiRkE/R6e4V5OqX4wlpVmecCIWKgX+Iykz/1o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoJW4jT3KTqIUA1ekT/KqZNrxje6vEHqV4O7PpEZ5MtGKCN7iP
	3MK2jmcw4fJR1T66TuGRJ03gCe8B5e+v0FKjRBIEcEL6Z1rszJK3MwGZ
X-Gm-Gg: AR+sD13M1kB4/dWdYgowUu0SlMnCPYbfknVexJtf7gnRrzG1sD2fQLcgK+BIieuVQFi
	T/qaVFFc9EausN75T4jQqOuBRqlTIRKoxYc5l+oPGNRmF45z+eU0sHn6DXOCQpSGq+LnH2oesaM
	6c9EUuo6vDpU6dYw105KJa4D1uNwWFZtDbn7ONy5I1SHqz/03B7eSPImEbDIWY2kQ4Ra1qqkGem
	CFuaQfA7wdu1Aq7hpoKVlkmI1Nn4DH1e6CiaAEwQLtB58TMZOgyD1R07lQmi+pxRX4NqeHNxCkm
	IaOu4yKohB+V3rCFuOrEwYs2ghAqcQGtprjkfx3UYGq8lsSFQ1ND/NhFZW2ErjsIDDInSFhlRff
	ggWlVJrZsq5MJZnV5eZrLcIIPMsO81uBLnO+BQCIxGcVvR93GaB4dEUUAvsL3aiiQ54IrWlURqd
	SMADdiYlvC730THWLDzrL9FfPYct+Qx7fNqQoZ+S4gU0t9D5U/jWWuoUQpBimCgAlz/DdHOir7
X-Received: by 2002:a05:600c:1910:b0:493:cc25:85cb with SMTP id 5b1f17b1804b1-4980ee9bd7fmr270480725e9.8.1785837749626;
        Tue, 04 Aug 2026 03:02:29 -0700 (PDT)
Received: from foxbook (bgt135.neoplus.adsl.tpnet.pl. [83.28.83.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b85be7sm392930275e9.2.2026.08.04.03.02.28
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 04 Aug 2026 03:02:29 -0700 (PDT)
Date: Tue, 4 Aug 2026 12:02:26 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Cc: Bart Nagel <bart@tremby.net>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] usb: xhci: Handle bogus TRB pointers in Missed Service
 Error events
Message-ID: <20260804120226.1e72ff24.michal.pecio@gmail.com>
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

xHCI 1.0 allowed these pointers to be zero. Some Intel chipsets from the
era usually set it to zero, but sometimes (apparently) to the next TRB
after the one referenced by the previous transfer event on the endpoint.

Usually that's indeed the missed TD, but it may also be the last TRB of
a two-TRB TD already completed with Short Packet on its first TRB. Then
the driver skips all pending TDs, failing to find a match.

When handling Missed Service Error, scan TD list twice and only really
skip TDs in the second pass if the first pass found a match. This won't
catch bogus pointers to wrong TDs, but such a bug would be practically
impossible to detect automatically and isn't known to exist.

Reported-by: Bart Nagel <bart@tremby.net>
Closes: https://lore.kernel.org/linux-usb/al_hchyOdPoPWKEo@spiral/
Suggested-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Fixes: d0b619599e52 ("usb: xhci: Expedite skipping missed isoch TDs on modern HCs")
Cc: stable@vger.kernel.org
Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/host/xhci-ring.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index dfe42822dde5..38a0f895553a 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2605,6 +2605,17 @@ static bool xhci_spurious_success_tx_event(struct xhci_hcd *xhci,
 	}
 }
 
+static struct xhci_td *find_td_by_dma(struct xhci_ring *ep_ring, dma_addr_t dma)
+{
+	struct xhci_td *td;
+
+	if (dma)
+		list_for_each_entry(td, &ep_ring->td_list, td_list)
+			if (trb_in_td(td, dma))
+				return td;
+	return NULL;
+}
+
 /*
  * If this function returns an error condition, it means it got a Transfer
  * event with a corrupted Slot ID, Endpoint ID, or TRB DMA address.
@@ -2799,8 +2810,11 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 		xhci_dequeue_td(xhci, td, ep_ring, td->status);
 	}
 
-	/* If the TRB pointer is NULL, missed TDs will be skipped on the next event */
-	if (trb_comp_code == COMP_MISSED_SERVICE_ERROR && !ep_trb_dma)
+	/*
+	 * We don't know how many TDs were missed when ep_trb_dma is zero (as permitted by
+	 * xHCI 1.0) or bogus. Bail out leaving ep->skip set, next event will sort it out.
+	 */
+	if (trb_comp_code == COMP_MISSED_SERVICE_ERROR && !find_td_by_dma(ep_ring, ep_trb_dma))
 		return 0;
 
 	if (list_empty(&ep_ring->td_list)) {
-- 
2.48.1
