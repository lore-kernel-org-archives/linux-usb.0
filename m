Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE6533D6C7
	for <linux-usb@vger.kernel.org>; Wed, 12 Aug 2026 00:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786494369; cv=none; b=GgpY4TkXXapSwm40jY0rERulsXH2EzU6O+4rUzD7Jo3QTgVe1ZgOhBHcA0tEN1YL+tL5NwHW6G/3zQ4sHODEuCaDubFRxToMlkPsCoNvadT1dt61DNcLPXvW8W0+iQ2TguXVH19Jndav7HC4WFLsozflKgY8Zc/Th1T6wetyeWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786494369; c=relaxed/simple;
	bh=7+d4WSGZKUOBFKoSoJuxyqQXx2nDPlLY88+V/SB3J3c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E9jVuIoaw9bX+lC3iKcICBJJPQwpgCNiI0NgzoRrK41cSWoRD8M5N/54xOqnxlNmecgOiDSxEzwOlPK3oK41UkNEbzD7KMt/Rv7I+t1pNJ/ZjRZpUlui1mSYeH4w3BA4ZvnxtQquQvkJCAYTj8+yRYYyurYiDSTn0/z7J16qoYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=superbaloo.net; spf=pass smtp.mailfrom=superbaloo.net; dkim=pass (2048-bit key) header.d=superbaloo.net header.i=@superbaloo.net header.b=aSZjRkYA; arc=none smtp.client-ip=74.125.227.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=superbaloo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=superbaloo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=superbaloo.net header.i=@superbaloo.net header.b="aSZjRkYA"
Received: by mail-pj2-f8.google.com with SMTP id 98e67ed59e1d1-392a608284dso151577a91.1
        for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 17:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=superbaloo.net; s=google; t=1786494365; x=1787099165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gtu3W/dCZIs09AlTGTgBV8ua0aKsolGd15tF6OXQVqw=;
        b=aSZjRkYAIHvrJr5nZ4qTn+oFudHaFQo/E8B+Hf4S4pKtBaSs6+MiVxzZfpMUej/W2M
         9U2fa4kCdSvkwjdcrd6riyOd5Zyqq5vb20y/L4zKRelQP3NAOkuyfZCCqnPNnaMdcy+j
         7iG2OMLyU3MfzPbviQfBop/ZDYmaqu/GJjU6JWlhITV1ZtNsKXETt5I0jg3CTB4iBrKr
         4oC0DMma50ayqA/t7u+9Zt+kosdUZ/m1N8xGOLD2qOx7Ewompa5nHAgllhK+1vQ3n7yW
         9R4KWvWFnyHB1GZjzK7wziRfrx/r3d+NblbLyPS+NV62+A/FL8BXlTyo2XNaJRieRsoL
         uoXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786494365; x=1787099165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gtu3W/dCZIs09AlTGTgBV8ua0aKsolGd15tF6OXQVqw=;
        b=PjjrZGo/5vcOwlCPxw1Qj6VYKXSY0gA2iOIFH4R98c53RHQGhJQ0fe6ooxn7qK7nYk
         ahe+AiWUphiXtIw7sVJFZUKb9KQkfAkpSryX0TrSMOy9IRw3Cy7LXITMTf7Jn/kfC1q+
         TFpN9OuALfFD8T2QDd/CEHbUAlDX8aGdrYeE4CuEsJE7uvAlV2KzgQ0oYMH11W4B7rBv
         0jUIUwNxpdxob0iJZd5v1wERA+pTX/yzdKf1DSehr1T4KY4DWoIPD3XzvA3eJq1Z5xZr
         hHj/ojcGeHqSojtFoDn7V7tO/zuH5cXcLyKPZQcOPvpQOZa9AcMRePXqVcYF3PSDzLQw
         tS3w==
X-Gm-Message-State: AOJu0Yw2bag9ki9hBDmqRCCuUjsEzsvpafwiLkrbu8SIQGAYYl4+yEPD
	EI5Le1CPTiH8B0a4jumuNlrdQ9xfXX+6pXqR1V5Il6xarG/dCxSgbEqEqo89fyFBXSUpsPAz0V8
	fz1Pc4eMAJZNlE/c=
X-Gm-Gg: AR+sD116ipTB19mD1YLl2faj08HkdMfgTCUqv1oOgAzHUd6rJCkiWYD+tHuE693pSV8
	/dfk1Tsds29vilqKu7n4FQNHa7c9ChxNKuOSDAOTQXXdStA8Xxrk6cLonnilkLeSlWuqzmxdetd
	hCakBKvzw2vhnM1QS5SR3xZ+NNYK8QG4GiReG2Ypzvayw329sfAz86HjZSOLxuzdPVF2hiSRzGY
	UuTFq+yP9zlKrTUuho4EEuP7eJHKBsEzxBGzzD/H8kBIrzCSYX0RAr/6gCEAlgqJ18RSzvfobjd
	f/ZF9FwnF+6yDzkpZpUqMimCPRExcWFXMVOpXw1mO/KJpS9nd+ju9m5eZC4W4rS3rHSmXsto3DI
	oxxG9125Bv6Gc2z1viZ2z5Vrp/0I5Vae4yYtd0J1hIkZS5QQfZbzovodPN2znJ0fiqmlH2iFMFa
	q5t8x61uWEZF3eODw6HUDXHnI2aTQ+jK8Q+bfzqSS2/zLL7kwk/qtryl8450NSzGqdS56v6+Zgb
	AjEgKPqGODncfqAdwtacQ6IsoKITJUXTWYZfWiYYWyf1d6gLyexzgKek0dmwEgjA5RktLYbeLg=
X-Received: by 2002:a17:90b:3943:b0:38f:aab1:5148 with SMTP id 98e67ed59e1d1-3930164ee60mr984749a91.13.1786494364964;
        Tue, 11 Aug 2026 17:26:04 -0700 (PDT)
Received: from localhost ([2603:800c:21f0:c0:b7de:ad81:9402:1250])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-31cf6d7b2a4sm3742814eec.30.2026.08.11.17.26.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 17:26:04 -0700 (PDT)
From: Arthur Gautier <baloo@superbaloo.net>
To: linux-usb@vger.kernel.org
Cc: Arthur Gautier <baloo@superbaloo.net>,
	Michal Pecio <michal.pecio@gmail.com>
Subject: [PATCH v2] xhci: fix lost bounce buffers on TDs spanning several ring segments
Date: Wed, 12 Aug 2026 00:25:54 +0000
Message-ID: <20260812002554.1166712-1-baloo@superbaloo.net>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a TD reaches a link TRB with data that is not aligned to the
endpoint's wMaxPacketSize, xhci_align_td() stages the unalignable tail
through the bounce buffer of the ring segment holding that link TRB.
xhci_unmap_td_bounce_buffer() later unmaps it and, for IN transfers,
copies the data back into the URB's buffer.

The enqueue path records the segment that was bounced in td->bounce_seg,
under the assumption that a TD never spans more than two ring segments.
That assumption does not hold: a TD large enough to span three or more
segments crosses several link TRBs and can be bounced at each of them.
Only the last one survives in td->bounce_seg, so every earlier bounce
buffer is neither copied back nor DMA unmapped.

The URB still completes with actual_length equal to the requested length
and no error, so the transfer looks successful while a wMaxPacketSize
sized hole in the destination buffer silently keeps its previous
contents. It also leaks a DMA mapping per dropped bounce.

Any sufficiently large and fragmented bulk transfer can hit this. It was
found with a USB mass storage device behind xHCI backing a dm-verity
target with 512 byte hash blocks, where the stale data is detected rather
than silently consumed. The device enumerates as SuperSpeed, so
wMaxPacketSize is 1024, while dm-bufio issues one 512 byte bio per hash
block. verity_prefetch_io() makes the block layer merge hundreds of them
into a single request of up to 512 scatterlist entries of 512 bytes each.
At 256 TRBs per ring segment such a TD spans three segments, and every
segment boundary falls on an odd multiple of 512, i.e. unaligned to
wMaxPacketSize. dm-bufio then caches a hash block holding stale data and
dm-verity declares the metadata block corrupted:

  device-mapper: verity: 8:2: metadata block 10850 is corrupted

A reproducer running this under qemu is available at
https://github.com/baloo/xhci-verity

The bounce state (bounce_buf, bounce_dma, bounce_len, bounce_offs)
already lives on the ring segment, so there is nothing extra to track.
Keep recording the last bounced segment in td->bounce_seg and, on
completion, walk the segments from td->start_seg up to it, unmapping
every segment that still has a pending bounce.

Stopping at td->bounce_seg rather than td->end_seg matters: a bounce
implies the TD continues past that segment's link TRB, so bounce_seg is
always strictly before end_seg, and a later TD may already have started
in end_seg and been bounced there. Walking that far would copy a foreign
bounce buffer into this URB and unmap it twice. It also keeps the walk
correct if a TD ever wraps the whole ring so that end_seg == start_seg.

Changes since v1:
- Walk td->start_seg -> td->bounce_seg instead of td->bounce_seg ->
  td->end_seg. end_seg can hold the start of a later TD which may
  already have been bounced there, so the v1 walk could copy a
  foreign bounce buffer into this URB and unmap it twice.
  (caught by Mathias and Michal)
- Keep recording the last bounced segment. Also handles a TD
  wrapping the whole ring.  (suggested by Michal)
- Test !td->bounce_seg first, it is the common case. (Michal)

v1: https://patchwork.kernel.org/project/linux-usb/patch/20260811033508.1050148-1-baloo@superbaloo.net/

Fixes: f9c589e142d0 ("xhci: TD-fragment, align the unsplittable case with a bounce buffer")
Suggested-by: Michal Pecio <michal.pecio@gmail.com>
Signed-off-by: Arthur Gautier <baloo@superbaloo.net>
---
 drivers/usb/host/xhci-ring.c | 31 +++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 4f98d8269625..1772cdf9ffc5 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -842,21 +842,18 @@ static void xhci_giveback_urb_in_irq(struct xhci_hcd *xhci,
 	usb_hcd_giveback_urb(hcd, urb, status);
 }
 
-static void xhci_unmap_td_bounce_buffer(struct xhci_hcd *xhci,
-		struct xhci_ring *ring, struct xhci_td *td)
+static void xhci_unmap_one_bounce_buffer(struct xhci_hcd *xhci,
+		struct xhci_ring *ring, struct xhci_td *td,
+		struct xhci_segment *seg)
 {
 	struct device *dev = xhci_to_hcd(xhci)->self.sysdev;
-	struct xhci_segment *seg = td->bounce_seg;
 	struct urb *urb = td->urb;
 	size_t len;
 
-	if (!ring || !seg || !urb)
-		return;
-
 	if (usb_urb_dir_out(urb)) {
 		dma_unmap_single(dev, seg->bounce_dma, ring->bounce_buf_len,
 				 DMA_TO_DEVICE);
-		return;
+		goto done;
 	}
 
 	dma_unmap_single(dev, seg->bounce_dma, ring->bounce_buf_len,
@@ -872,10 +869,28 @@ static void xhci_unmap_td_bounce_buffer(struct xhci_hcd *xhci,
 		memcpy(urb->transfer_buffer + seg->bounce_offs, seg->bounce_buf,
 		       seg->bounce_len);
 	}
+done:
 	seg->bounce_len = 0;
 	seg->bounce_offs = 0;
 }
 
+static void xhci_unmap_td_bounce_buffer(struct xhci_hcd *xhci,
+		struct xhci_ring *ring, struct xhci_td *td)
+{
+	struct xhci_segment *seg;
+
+	if (!td->bounce_seg || !ring || !td->urb)
+		return;
+
+	/* td->bounce_seg is the last one bounced, unmap them all */
+	for (seg = td->start_seg; ; seg = seg->next) {
+		if (seg->bounce_len)
+			xhci_unmap_one_bounce_buffer(xhci, ring, td, seg);
+		if (seg == td->bounce_seg)
+			break;
+	}
+}
+
 static void xhci_td_cleanup(struct xhci_hcd *xhci, struct xhci_td *td,
 			    struct xhci_ring *ep_ring, int status)
 {
@@ -3674,7 +3689,7 @@ int xhci_queue_bulk_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 						  &trb_buff_len,
 						  ring->enq_seg)) {
 					send_addr = ring->enq_seg->bounce_dma;
-					/* assuming TD won't span 2 segs */
+					/* a TD may be bounced in every seg it spans */
 					td->bounce_seg = ring->enq_seg;
 				}
 			}
-- 
2.55.0

