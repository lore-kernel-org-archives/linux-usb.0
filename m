Received: from mail-pz2-f0.google.com (mail-pz2-f0.google.com [74.125.228.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5413043BE
	for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 03:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.0
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786419322; cv=none; b=nfX1eEtL/asE+yf4zXLQ+cVNgIGzaUgregkPL2fTfEefjBJw9N3YWPB8b51Hf8KWCfKXESFLOpMwVzrqdGZF9Be5nx9/6j8SVaMAcXEsH7Ufyc0POELjGk3CgpPLldaQ1AXv0YPeZRgRuRgiDTU9fAqjbkF36h/WDGDB9RXNq4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786419322; c=relaxed/simple;
	bh=ATG2zZJZO7nehKSOkGY/6Ezddu0Y2JYaW4sBgTe7PnI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A8yjL6WTKl/WwagrY5mxPgDGrpNYsf+lm2zc7RBJW3gwu/QNYhJnLOsijSLWwjD4/c/xkXLukXBs1XPiUazdUuwfywYLI/1tfErSNHzkMzGPPVAVrOsQwTw3FaV57Ywhk4unLLm3QoWvr+7iuBNz5PeeI8HIF1jwrFhKAWN+ZQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=superbaloo.net; spf=pass smtp.mailfrom=superbaloo.net; dkim=pass (2048-bit key) header.d=superbaloo.net header.i=@superbaloo.net header.b=XeMvtnxN; arc=none smtp.client-ip=74.125.228.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=superbaloo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=superbaloo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=superbaloo.net header.i=@superbaloo.net header.b="XeMvtnxN"
Received: by mail-pz2-f0.google.com with SMTP id 41be03b00d2f7-c888c001628so1675786a12.0
        for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 20:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=superbaloo.net; s=google; t=1786419318; x=1787024118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dp1RK/TSL03/GFQ+qVFH+d7TjYANMQxszFGz4iG/D5c=;
        b=XeMvtnxNLJ0efnzQQp2GFZE8KE3xDhIYD8pqLor3pOqpyI4oeW5uNVPwPcs8VKBI//
         QbFLXI7ev/wLWjgjMODYDg+OxieITsDyKu/CrmY6z0cA7b99Gn+R7Km6elOsk9mLSS5q
         Jnggv83GDzkgfy1BUdysIJ92jgij3YTbyyxRyEcELjwqyrSuE/XJbJ+6cF9Ph3wBT6Wv
         rTFjg56hs66Hm2mdOQkftTJJHauSlvkEAWBu4IQYjhCnMDhQlXcuz4NjawLJ0vqkKW5G
         ZXx2TAeLWxlDyVDLlnl95op4TSkzTCBW4U3KIyjN6l4DgSqDVfxsxc375qhNbokyFxiO
         r0Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786419318; x=1787024118;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dp1RK/TSL03/GFQ+qVFH+d7TjYANMQxszFGz4iG/D5c=;
        b=DBPVn51TnGMpdiki3UgzaO4F1vKNb9oCVhlGrWksayMZPTlvYxFf9eABeT6WKqv3+9
         uBuPsucXBfS4Psl3nRCqfuYV4xzOwUgTNPEhTZX5qGpWW6aeInLK/ZM+aYOyVrc8GW2u
         yvCvglErcV3He4vF8pzJf1BSK5Uiuvpzb+J6hkh1Qp4Sdqg5jDV5ttNPNzmZGOUYmW4h
         H1IDLbSJP/yvr7DfqaqAoXwlvCk7rJroLcXatHanp3zDA5zQezOiZ/XGsfeLDCmduD8O
         vMtFdCjskPk098RrCDbGs7/uwF9KyaByJxI0i7wxXcUDlZiJHNMYsjM18s1z++untEqB
         wjYg==
X-Gm-Message-State: AOJu0YwHSkwLMMS1mu0hEyv7HAk497khrPMbeCDInf6jdRnEAFZG923i
	NEf3XMnR7VdK2nh3jg1nODDDfqnllYTUSxTCWmFWunBOz2MMaQwqp5GooUh9T7cOXE9Rt1x5yQW
	xBI/XmT3JS2JC4Jw=
X-Gm-Gg: AR+sD103l3gjwYjJsUlArHLPN//LWKdR8qzWuW0fTMbxv7RJLwDxu48BVT6UtBxdI1g
	/s4FuxNWVi2N5jHcTHbYBpUotnqNetcVPmmwQfaQ9hnDuwoOgLt/3EqIauA9flsPJNXsP5Zoc9z
	0jxCHVZihVo9Wtm8vUcpppTJ2g+36U2cGClf9rNVQcfFcS1Wtk7GaWL+zl1JNAGrC6REZ2fIPCM
	zWnXCOp33NFJHNAOenhI8g//h8NIN4vRl+do9tSTX9xSU7R+v2QLaJuFKEyX/R5CdcgH4B1Soig
	VBJC0gmJLeNosb/zjZaYBxmT1ShlCNUR8ZOyMMi/DdKWfX01l0OxXPX8wznYqMNk5DrxBQIPQ6c
	CTjxN3MMnGjsK4/Pa8BaObVjZsF1sOatvKtmCfLT8BpCMyyWcBDdfQHTbotXJ7gL6o+qmH3pm95
	mUpgqp4bhmpt53jmiyGTFdT+yLfmvaZuZqwvfh6vc6XmSph4ZOkhnFASx2GLkQ/y9tvPkPDfhX9
	FaO7s536TiBKVDPdl9lbm9IE1LIWp30d+m4G89FrXdKNSVRGQAm6XiR3mbr73sr
X-Received: by 2002:a05:6a21:490:b0:3cb:b6af:e3a6 with SMTP id adf61e73a8af0-3cc2babb898mr679354637.27.1786419318448;
        Mon, 10 Aug 2026 20:35:18 -0700 (PDT)
Received: from localhost ([2603:800c:21f0:c0:a1af:2e25:d07b:83f9])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-315beb877b4sm56462306eec.19.2026.08.10.20.35.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 20:35:17 -0700 (PDT)
From: Arthur Gautier <baloo@superbaloo.net>
To: linux-usb@vger.kernel.org
Cc: Arthur Gautier <baloo@superbaloo.net>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	stable@vger.kernel.org
Subject: [PATCH] xhci: fix lost bounce buffers on TDs spanning several ring segments
Date: Tue, 11 Aug 2026 03:35:08 +0000
Message-ID: <20260811033508.1050148-1-baloo@superbaloo.net>
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

This is reachable with a USB mass storage device behind xHCI backing a
dm-verity target with 512 byte hash blocks. The device enumerates as
SuperSpeed, so wMaxPacketSize is 1024, while dm-bufio issues one 512 byte
bio per hash block. verity_prefetch_io() makes the block layer merge
hundreds of them into a single request of up to 512 scatterlist entries
of 512 bytes each. At 256 TRBs per ring segment such a TD spans three
segments, and every segment boundary falls on an odd multiple of 512,
i.e. unaligned to wMaxPacketSize. dm-bufio then caches a hash block
holding stale data and dm-verity declares the metadata block corrupted:

  device-mapper: verity: 8:2: metadata block 10850 is corrupted

A reproducer running this under qemu is available at
https://github.com/baloo/xhci-verity

The bounce state (bounce_buf, bounce_dma, bounce_len, bounce_offs)
already lives on the ring segment, so there is nothing extra to track.
Keep the first bounced segment in td->bounce_seg and, on completion,
walk the segments the TD covers from there up to td->end_seg, handling
every segment that still has a pending bounce.

Fixes: f9c589e142d0 ("xhci: TD-fragment, align the unsplittable case with a bounce buffer")
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: stable@vger.kernel.org
Signed-off-by: Arthur Gautier <baloo@superbaloo.net>
---
 drivers/usb/host/xhci-ring.c | 49 +++++++++++++++++++++++++++++-------
 1 file changed, 40 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 4f98d8269625..4154e84420ac 100644
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
@@ -872,10 +869,37 @@ static void xhci_unmap_td_bounce_buffer(struct xhci_hcd *xhci,
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
+	unsigned int i;
+
+	if (!ring || !td->bounce_seg || !td->urb)
+		return;
+
+	/*
+	 * A TD that spans more than two ring segments crosses several link
+	 * TRBs, and may have been aligned with a bounce buffer at each of
+	 * them. Every bounce buffer lives on the segment whose link TRB it
+	 * was needed for, so walk all segments the TD covers, starting at
+	 * the first one that was bounced.
+	 */
+	seg = td->bounce_seg;
+	for (i = 0; i < ring->num_segs; i++) {
+		if (seg->bounce_len)
+			xhci_unmap_one_bounce_buffer(xhci, ring, td, seg);
+		if (seg == td->end_seg)
+			break;
+		seg = seg->next;
+	}
+}
+
 static void xhci_td_cleanup(struct xhci_hcd *xhci, struct xhci_td *td,
 			    struct xhci_ring *ep_ring, int status)
 {
@@ -3674,8 +3698,15 @@ int xhci_queue_bulk_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 						  &trb_buff_len,
 						  ring->enq_seg)) {
 					send_addr = ring->enq_seg->bounce_dma;
-					/* assuming TD won't span 2 segs */
-					td->bounce_seg = ring->enq_seg;
+					/*
+					 * A TD spanning several segments can be
+					 * bounced once per segment boundary it
+					 * crosses. Remember the first bounced
+					 * segment, the rest are found by walking
+					 * the TD's segments on completion.
+					 */
+					if (!td->bounce_seg)
+						td->bounce_seg = ring->enq_seg;
 				}
 			}
 		}
-- 
2.55.0

