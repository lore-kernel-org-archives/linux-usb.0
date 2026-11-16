Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794812685;
	b=b3LTbXZqNbPi/ftmX5uGQsXGDmef2icEg1yAXIFs1zCtMtZ1QIfg/cXOOFdzfiIRrn5n
	 /3fFVvG62gA9VI9b6epWrCfJDmHWzM71A9b3DZd/Z36jKKRC+FI4LvzV9isACtet0eDq2
	 qdXmmi32NhCYNjRRwunRlUz/04+xJASF6ihJnGNcL7PUeyygoUEbCRW0AkXnANka+Q2WD
	 B2xan0Su0DME7H+XwIKL7SNrXFCukbrRdxN0sNGpUbH9w4NaZhpWRY4GA96CpMTJsG9Tx
	 kN3Cy/qMOjZIcbYPwLheVauCqF9Grb4kk1SkGwrLMl1o+HJcLmMXx3xflZzyupmfXpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794812685;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MxuJwQ0/KvDBKc+B+AtKXdERtKQNUvelB2l0BkW6/Hs=;
	b=XaWmTbv5QviI+Cz+mCfRBSeyFsGDWJ60fMzp2qPYVKDZWfBUXkIsafXOQUtESRKG4O0c
	 PSaypa2WrZeZo72HBWXW3hi7AnjbKLl9YWHZw13/xRM6yeqjO/WKMIZZOB/DQ1gKKAeXT
	 eqFqeHnhYT8JvcvnL95WtC5z2Zy3uNhJ4d32GKaBp9CgWBqOv1TmdNyskIHjjUl9ZS7J9
	 BJsPtnATlpfBEUByacEcgoHV7G//0cZLUWDhdvr/Z9dXYh/BXWGJyFo9O5/BhAx3iik5m
	 fnT6OXVh7YT7ckyYlZnC3yud4CI++0UPXrRofIm5059R8gtlQHPuVUg5ElGw3fbxttw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yuzi.co;
	spf=pass smtp.mailfrom=yuzifovich.name;
	dkim=pass header.d=yuzi.co header.i=@yuzi.co header.a=rsa-sha256 header.s=google header.b=iGBGXmnO;
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A11F606A338
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 07:04:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A11F606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yuzi.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yuzifovich.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yuzi.co header.i=@yuzi.co header.a=rsa-sha256 header.s=google header.b=iGBGXmnO
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b408f2d936so4564167a12.1
        for <linux-usb@vger.kernel.org>; Sun, 15 Nov 2026 23:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=yuzi.co; s=google; t=1794812683; x=1795417483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MxuJwQ0/KvDBKc+B+AtKXdERtKQNUvelB2l0BkW6/Hs=;
        b=iGBGXmnO2jMQpLHccbdwirADo8lRMZdkm+2e93JIMyByfzQenDmNHQKU2/cLVCEafP
         l5VTg24mo2QUe/hrssRKNsTOmelbEYQK2BfzodUbJeFnqIhweJIcrIX8MKITtv0Efe7E
         eUanF9MalxGfUqpphe3jv8TOv4/DoCvFItE/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794812683; x=1795417483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MxuJwQ0/KvDBKc+B+AtKXdERtKQNUvelB2l0BkW6/Hs=;
        b=yWFpYipZV93u1h/vH0nqctriKmqI+/obhvokbqUGV57DnNTplLy5Ce0HUXwkNn3mYe
         NLxsQaEGKCD9474DsjhSdoBDpgjaFFnloa3GUX7rvgZ5I01wr8HylGPIOzSCOHSXbhN+
         rUjyYVp74kI3GSfRJeM9/toyNjSWKBeheh0okesPi8xDExH5Yy4BFX+dIR3wjKOXwmUC
         tr1B/ChEVzxuJ1tNvpUgueQdYOVzR+xYeybanVgtJndyCbbLId/wm0cy2Vhh3irHC+67
         SIcEwnWIT4pCbiamrUUqrGSoE7Sy0nzSvuvjlMfJjuf5dIHJPKy6O+XWiS2RU79W8nbP
         IQ7g==
X-Forwarded-Encrypted: i=1; AL+hErEaO8BOgy7cetxnTBVPI2gN99wKu/Pehf829UxooM3qKQibKkFZiamUlFAN7if6dBmmwFKG0iVcm2A=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TTn4N5MAvTRqHp8U8gd5+PDu1M3MqvwSNZzYLNdO7A9oSRDlw
	e7qK6T5qQPzUoGmu0ZzwxUFxgKjQN+osUY9JmSz6zdbw+j1lZdbb6lc0L8nmPS6v0i1Vo49+5h0
	NZCcYEz96Tw==
X-Gm-Gg: AYBFou2djd8PNyQ65TLlg4O1aHIz+6iU5zhU4IyYYYQOgtc9jgwgSIqz3WdAcNEhaPG
	9RI6Hr6mFmZcxqH6dKGRIMJPIp+5hjl1ubrJ8rosAgBPj8R8u0yZWxMC7jZ5FIVUSXL0sXbFAS2
	hj9CcGeSbfpDtYHyyyvxkPhG90ktbfy97MGr1iBvVuoAAxgiSb/+srjlktuRGwWORDGkn2VkshI
	E0b9AFvtV1ae4L2q1Gtj8CflfEo7X9FHGwmudewDe9V/SgzxuCKIRIbg11Ygpni/arSqDGfklkA
	AEg4n2PsOut3i1s0GskjqiCDFqD7l1iw8dA+mLQt/wostg+hBGkSGEYIfsDzR2KYEuZyQnBHjIQ
	meJGBJTZzvwLiiIw52ERxN+Y8SHm0wk+UCodUH0ULst8HnqlgiptnZBaewYYlb0gGwMpV4rOXVg
	bGQEmOIzkSydmijIWzPQa1hy7RU4SCSrAZ7LuoWiTFryOXnBipxw5bNj+YQPV3mSe35JOIwfD+t
	l4/mMp4F5EWN1B+88todDQkuct2VaCuvmKWnSVji1RAcQmmCsAqtRTGLQ7y3kRqFm3607wC3AL9
	Y/Nlb8XfSPpnRaRWQAL1bdTHRp3q2bILZeQ0RPk1kIKQVmrpWhmYvTt8CQmDwoEGnNUepTJBOfJ
	aLeTA5RqM6lnkzWUytpQwpzL/54L09sOiG8n7QUv7EYjbtSh1WW5agYTX4LjVugx+ToiMU8dSXb
	Z907aF1Tw7nIWpSw==
X-Received: by 2002:a17:907:c14:b0:c4c:999e:e6f1 with SMTP id a640c23a62f3a-c5096418d9emr738864866b.46.1794812683241;
        Sun, 15 Nov 2026 23:04:43 -0800 (PST)
Received: from terra.lan ([78.83.170.221])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c6451sm21866706f8f.45.2026.11.15.23.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:04:42 -0800 (PST)
From: Vadim Yuzifovich <vadim@yuzi.co>
To: gregkh@linuxfoundation.org,
	Thinh.Nguyen@synopsys.com
Cc: chenyou910331@gmail.com,
	inochiama@gmail.com,
	linux-usb@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vadim Yuzifovich <vadim@yuzi.co>
Subject: [PATCH v2 1/3] usb: dwc2: gadget: restart descriptor DMA isochronous OUT endpoints after BNA
Date: Mon, 16 Nov 2026 09:04:31 +0200
Message-ID: <20261116070433.2813951-2-vadim@yuzi.co>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261116070433.2813951-1-vadim@yuzi.co>
References: <20261116070433.2813951-1-vadim@yuzi.co>
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

In descriptor DMA mode the core stops an isochronous endpoint when it
reaches a descriptor that is not ready (BNA), for example after an
interrupt latency longer than the queued requests cover.
dwc2_gadget_handle_isoc_bna() resets the endpoint and leaves the restart
to the next OUTTKNEPDIS. On a Sophgo SG2002 (DWC_otg 4.20a) that
interrupt does not come. The core keeps the OUT packet that met the BNA,
shows the endpoint as disabled, and tries the descriptor at the start of
the chain again and again, raising BNA each time, as fast as the handler
clears it.

With a UAC1 capture endpoint and eight requests queued, one 8 ms
interrupt latency (a line printed on the 115200 baud serial console)
caused one BNA. The endpoint stayed disabled and the BNA interrupt kept
the CPU busy until the host gave up and reset the port, which took the
other functions of the composite gadget down as well.

An endpoint-disabled interrupt after the BNA makes it worse:
dwc2_gadget_handle_ep_disabled() has an isochronous part written for
buffer DMA, which completes requests frame by frame and advances
target_frame up to the current frame. That moves target_frame off
TARGET_FRAME_INITIAL, and the OUT token handler then takes the chain for
running and never restarts it.

So restart an OUT endpoint from the BNA handler, and from the
endpoint-disabled handler when it finds the endpoint disabled with
requests queued, and do not run the buffer DMA completion in descriptor
DMA mode. IN endpoints keep restarting on the next NAK.

The restart has to deal with the packet the core holds. The core takes
the descriptor at the start of the chain the moment it is host ready,
before the endpoint is enabled, writes the packet to it and then stops:
a chain that is enabled after that takes one packet at most and raises
BNA on the next. Traced on the SG2002, a restart that just rebuilt the
chain and enabled the endpoint gave one BNA and one restart for every
packet from then on, about 2000 interrupts a second, with the audio
mostly intact; and since the chain is filled front to back, the core
took descriptor 0 while it still carried the L bit.

Therefore keep descriptor 0 host busy while the chain is filled, write
the chain address, and only then mark descriptor 0 host ready. If the
core takes it before the endpoint is enabled, wait for the packet to
land, give its request back, and build the chain once more: no packet
is waiting for that one, and it starts like the first chain of a
stream.

The BNA handler must not flush the Rx FIFO for this. The FIFO is shared
by all OUT endpoints and nothing stops the host: when an OUT token
arrived while the handler ran, the flush left the core with a FIFO it
never drained again. GINTSTS.RXFLVL stayed set, every isochronous OUT
packet was dropped with OUTTKNEPDIS and no XferCompl, and bulk OUT on
the mass storage function was NAKed until its host driver timed out
and reset the port, after which EP0 did not answer. That happened about
once in 100 BNAs here. The flush does not drop the packet that met the
BNA either; the core delivers it to the new chain all the same. So
drop the flush.

A BNA can also arrive in the same interrupt as the endpoint-disabled,
OUT token or NAK interrupt that starts a chain, and since the core
keeps raising it, one is latched just before the restart and seen
after it. Handle BNA before those interrupts, and ignore a BNA for an
OUT endpoint that is enabled, so that the BNA handler never gives back
a request of a running chain or resets the endpoint state under it.

Fixes: 729cac693eec ("usb: dwc2: Change ISOC DDMA flow")
Signed-off-by: Vadim Yuzifovich <vadim@yuzi.co>
---
v2:
- Handle BNA before the endpoint-disabled, OUT token and NAK interrupts
  in dwc2_hsotg_epint().
- Ignore a BNA for an OUT endpoint that is enabled.
- Keep descriptor 0 host busy until the chain is written and the chain
  address is set; wait for a packet the core holds from before the BNA,
  give it back and build the chain again.
- Fixes tag. Changelog rewritten for what the trace showed.
- Do not flush the Rx FIFO in the BNA handler: with an OUT token
  arriving meanwhile, the core stopped draining the FIFO.

 drivers/usb/dwc2/gadget.c | 168 ++++++++++++++++++++++++++++++++++----
 1 file changed, 152 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index 6c8a9f05f..8adc90047 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -900,6 +900,7 @@ static void dwc2_gadget_config_nonisoc_xfer_ddma(struct dwc2_hsotg_ep *hs_ep,
  * @hs_ep: The isochronous endpoint.
  * @dma_buff: usb requests dma buffer.
  * @len: usb request transfer length.
+ * @hold: leave the descriptor host busy; the caller marks it host ready.
  *
  * Fills next free descriptor with the data of the arrived usb request,
  * frame info, sets Last and IOC bits increments next_desc. If filled
@@ -907,7 +908,8 @@ static void dwc2_gadget_config_nonisoc_xfer_ddma(struct dwc2_hsotg_ep *hs_ep,
  * status.
  */
 static int dwc2_gadget_fill_isoc_desc(struct dwc2_hsotg_ep *hs_ep,
-				      dma_addr_t dma_buff, unsigned int len)
+				      dma_addr_t dma_buff, unsigned int len,
+				      bool hold)
 {
 	struct dwc2_dma_desc *desc;
 	struct dwc2_hsotg *hsotg = hs_ep->parent;
@@ -956,7 +958,8 @@ static int dwc2_gadget_fill_isoc_desc(struct dwc2_hsotg_ep *hs_ep,
 	}
 
 	desc->status &= ~DEV_DMA_BUFF_STS_MASK;
-	desc->status |= (DEV_DMA_BUFF_STS_HREADY << DEV_DMA_BUFF_STS_SHIFT);
+	desc->status |= (hold ? DEV_DMA_BUFF_STS_HBUSY :
+				DEV_DMA_BUFF_STS_HREADY) << DEV_DMA_BUFF_STS_SHIFT;
 
 	/* Increment frame number by interval for IN */
 	if (hs_ep->dir_in)
@@ -970,6 +973,52 @@ static int dwc2_gadget_fill_isoc_desc(struct dwc2_hsotg_ep *hs_ep,
 	return 0;
 }
 
+static void dwc2_gadget_complete_isoc_request_ddma(struct dwc2_hsotg_ep *hs_ep);
+
+/*
+ * dwc2_gadget_isoc_out_held_packet - let the core finish an OUT packet it
+ * holds from before a BNA.
+ * @hs_ep: The isochronous OUT endpoint, its new chain written and descriptor 0
+ * just marked host ready, the endpoint not enabled yet.
+ *
+ * A packet that met a descriptor that was not ready stays with the core. The
+ * core raises BNA, shows the endpoint as disabled, and keeps trying the
+ * descriptor at the start of the chain. As soon as that one is host ready the
+ * core writes the packet to it, without the endpoint being enabled, and then
+ * stops: a chain enabled after that takes no further packet. So wait for the
+ * packet to land and give its request back. The caller then starts a new
+ * chain, which no packet is waiting for.
+ *
+ * Return: true if the core took descriptor 0.
+ */
+static bool dwc2_gadget_isoc_out_held_packet(struct dwc2_hsotg_ep *hs_ep)
+{
+	struct dwc2_dma_desc *desc = &hs_ep->desc_list[0];
+	int i;
+
+	/* The core takes the descriptor within a few bus cycles, if at all. */
+	for (i = 0; i < 10; i++) {
+		if (READ_ONCE(desc->status) >> DEV_DMA_BUFF_STS_SHIFT !=
+		    DEV_DMA_BUFF_STS_HREADY)
+			break;
+		udelay(1);
+	}
+	if (i == 10)
+		return false;
+
+	/* One packet of at most 1024 bytes: the DMA takes microseconds. */
+	for (i = 0; i < 100; i++) {
+		if (READ_ONCE(desc->status) >> DEV_DMA_BUFF_STS_SHIFT ==
+		    DEV_DMA_BUFF_STS_DMADONE)
+			break;
+		udelay(1);
+	}
+
+	dwc2_gadget_complete_isoc_request_ddma(hs_ep);
+
+	return true;
+}
+
 /*
  * dwc2_gadget_start_isoc_ddma - start isochronous transfer in DDMA
  * @hs_ep: The isochronous endpoint.
@@ -982,6 +1031,7 @@ static void dwc2_gadget_start_isoc_ddma(struct dwc2_hsotg_ep *hs_ep)
 	struct dwc2_hsotg *hsotg = hs_ep->parent;
 	struct dwc2_hsotg_req *hs_req, *treq;
 	int index = hs_ep->index;
+	bool again = false;
 	int ret;
 	int i;
 	u32 dma_reg;
@@ -989,6 +1039,7 @@ static void dwc2_gadget_start_isoc_ddma(struct dwc2_hsotg_ep *hs_ep)
 	u32 ctrl;
 	struct dwc2_dma_desc *desc;
 
+restart:
 	if (list_empty(&hs_ep->queue)) {
 		hs_ep->target_frame = TARGET_FRAME_INITIAL;
 		dev_dbg(hsotg->dev, "%s: No requests in queue\n", __func__);
@@ -1003,6 +1054,12 @@ static void dwc2_gadget_start_isoc_ddma(struct dwc2_hsotg_ep *hs_ep)
 				    << DEV_DMA_BUFF_STS_SHIFT);
 	}
 
+	/*
+	 * Descriptor 0 stays host busy until the rest of the chain is written
+	 * and the chain address is set. After a BNA the core may take it the
+	 * moment it is host ready, see dwc2_gadget_isoc_out_held_packet(), and
+	 * must not find it as the last of a chain that is still being built.
+	 */
 	hs_ep->next_desc = 0;
 	list_for_each_entry_safe(hs_req, treq, &hs_ep->queue, queue) {
 		dma_addr_t dma_addr = hs_req->req.dma;
@@ -1012,7 +1069,8 @@ static void dwc2_gadget_start_isoc_ddma(struct dwc2_hsotg_ep *hs_ep)
 			dma_addr = sg_dma_address(hs_req->req.sg);
 		}
 		ret = dwc2_gadget_fill_isoc_desc(hs_ep, dma_addr,
-						 hs_req->req.length);
+						 hs_req->req.length,
+						 !hs_ep->next_desc);
 		if (ret)
 			break;
 	}
@@ -1024,6 +1082,16 @@ static void dwc2_gadget_start_isoc_ddma(struct dwc2_hsotg_ep *hs_ep)
 	/* write descriptor chain address to control register */
 	dwc2_writel(hsotg, hs_ep->desc_list_dma, dma_reg);
 
+	desc = &hs_ep->desc_list[0];
+	desc->status &= ~DEV_DMA_BUFF_STS_MASK;
+	desc->status |= DEV_DMA_BUFF_STS_HREADY << DEV_DMA_BUFF_STS_SHIFT;
+
+	if (!hs_ep->dir_in && !again &&
+	    dwc2_gadget_isoc_out_held_packet(hs_ep)) {
+		again = true;
+		goto restart;
+	}
+
 	ctrl = dwc2_readl(hsotg, depctl);
 	ctrl |= DXEPCTL_EPENA | DXEPCTL_CNAK;
 	dwc2_writel(hsotg, ctrl, depctl);
@@ -1491,7 +1559,7 @@ static int dwc2_hsotg_ep_queue(struct usb_ep *ep, struct usb_request *req,
 				dma_addr = sg_dma_address(hs_req->req.sg);
 			}
 			dwc2_gadget_fill_isoc_desc(hs_ep, dma_addr,
-						   hs_req->req.length);
+						   hs_req->req.length, false);
 		}
 		return 0;
 	}
@@ -2259,26 +2327,66 @@ static void dwc2_gadget_complete_isoc_request_ddma(struct dwc2_hsotg_ep *hs_ep)
 	}
 }
 
+/*
+ * dwc2_gadget_restart_isoc_out_ddma - build the chain of a disabled ISOC OUT
+ * endpoint again from its queue and enable it.
+ * @hs_ep: The isochronous OUT endpoint, in its initial state.
+ *
+ * After a BNA the core keeps raising BNA for the endpoint, as fast as the
+ * handler clears it, and no OUTTKNEPDIS comes to restart the chain. So the
+ * chain is restarted here at once.
+ */
+static void dwc2_gadget_restart_isoc_out_ddma(struct dwc2_hsotg_ep *hs_ep)
+{
+	struct dwc2_hsotg *hsotg = hs_ep->parent;
+
+	if (hs_ep->dir_in || list_empty(&hs_ep->queue) ||
+	    hs_ep->target_frame != TARGET_FRAME_INITIAL ||
+	    dwc2_readl(hsotg, DOEPCTL(hs_ep->index)) & DXEPCTL_EPENA)
+		return;
+
+	hs_ep->target_frame = dwc2_hsotg_read_frameno(hsotg);
+	dwc2_gadget_start_isoc_ddma(hs_ep);
+}
+
 /*
  * dwc2_gadget_handle_isoc_bna - handle BNA interrupt for ISOC.
  * @hs_ep: The isochronous endpoint.
  *
- * If EP ISOC OUT then need to flush RX FIFO to remove source of BNA
- * interrupt. Reset target frame and next_desc to allow to start
- * ISOC's on NAK interrupt for IN direction or on OUTTKNEPDIS
- * interrupt for OUT direction.
+ * Give back the request that met the BNA and reset target frame and
+ * next_desc. An IN endpoint starts again on the next NAK interrupt. An OUT
+ * endpoint is restarted here, see dwc2_gadget_restart_isoc_out_ddma().
+ *
+ * The Rx FIFO is not flushed for an OUT endpoint. It is shared by all OUT
+ * endpoints and the host goes on sending, so a flush here can hit a packet
+ * that is being received, after which the core no longer drains the FIFO.
+ * The packet that met the BNA is not dropped by a flush either: the core
+ * holds it and writes it to the first descriptor of the new chain.
  */
 static void dwc2_gadget_handle_isoc_bna(struct dwc2_hsotg_ep *hs_ep)
 {
 	struct dwc2_hsotg *hsotg = hs_ep->parent;
 
-	if (!hs_ep->dir_in)
-		dwc2_flush_rx_fifo(hsotg);
+	/*
+	 * The core disables an OUT endpoint that raises BNA and goes on
+	 * raising BNA for it until it is enabled again. So a BNA can be
+	 * latched between the moment the interrupt handler clears DOEPINT and
+	 * the restart below, and is then seen with the new chain running.
+	 * Leave that chain alone. If the endpoint is still about to be
+	 * disabled, the endpoint-disabled interrupt or the next BNA restarts
+	 * it.
+	 */
+	if (!hs_ep->dir_in &&
+	    dwc2_readl(hsotg, DOEPCTL(hs_ep->index)) & DXEPCTL_EPENA)
+		return;
+
 	dwc2_hsotg_complete_request(hsotg, hs_ep, get_ep_head(hs_ep), 0);
 
 	hs_ep->target_frame = TARGET_FRAME_INITIAL;
 	hs_ep->next_desc = 0;
 	hs_ep->compl_desc = 0;
+
+	dwc2_gadget_restart_isoc_out_ddma(hs_ep);
 }
 
 /**
@@ -2902,6 +3010,27 @@ static void dwc2_gadget_handle_ep_disabled(struct dwc2_hsotg_ep *hs_ep)
 	if (!hs_ep->isochronous)
 		return;
 
+	/*
+	 * In descriptor DMA the requests sit in the descriptor chain rather
+	 * than one per frame, so the frame by frame completion below does not
+	 * apply. The core disables an isochronous endpoint by itself when it
+	 * meets a descriptor that was not filled in time (BNA). Put such an
+	 * endpoint back in its initial state and build the chain again from
+	 * the queue: at once for OUT, on the next NAK for IN. The loop below
+	 * would move target_frame off TARGET_FRAME_INITIAL, which tells the
+	 * token handlers that a chain runs: the endpoint then stays disabled
+	 * for good, and every request queued again goes into a dead chain.
+	 */
+	if (using_desc_dma(hsotg)) {
+		if (!(dwc2_readl(hsotg, epctl_reg) & DXEPCTL_EPENA)) {
+			hs_ep->target_frame = TARGET_FRAME_INITIAL;
+			hs_ep->next_desc = 0;
+			hs_ep->compl_desc = 0;
+			dwc2_gadget_restart_isoc_out_ddma(hs_ep);
+		}
+		return;
+	}
+
 	if (list_empty(&hs_ep->queue)) {
 		dev_dbg(hsotg->dev, "%s: complete_ep 0x%p, ep->queue empty!\n",
 			__func__, hs_ep);
@@ -3151,6 +3280,19 @@ static void dwc2_hsotg_epint(struct dwc2_hsotg *hsotg, unsigned int idx,
 		}
 	}
 
+	/*
+	 * Handle BNA before the endpoint-disabled, OUT token and NAK
+	 * interrupts that can come with it. Those handlers start a new chain
+	 * for an isochronous endpoint in descriptor DMA mode, and the BNA
+	 * handler must not then give back a request of the running chain and
+	 * reset the endpoint state under it.
+	 */
+	if (ints & DXEPINT_BNAINTR) {
+		dev_dbg(hsotg->dev, "%s: BNA interrupt\n", __func__);
+		if (hs_ep->isochronous)
+			dwc2_gadget_handle_isoc_bna(hs_ep);
+	}
+
 	if (ints & DXEPINT_EPDISBLD)
 		dwc2_gadget_handle_ep_disabled(hs_ep);
 
@@ -3208,12 +3350,6 @@ static void dwc2_hsotg_epint(struct dwc2_hsotg *hsotg, unsigned int idx,
 	if (ints & DXEPINT_BACK2BACKSETUP)
 		dev_dbg(hsotg->dev, "%s: B2BSetup/INEPNakEff\n", __func__);
 
-	if (ints & DXEPINT_BNAINTR) {
-		dev_dbg(hsotg->dev, "%s: BNA interrupt\n", __func__);
-		if (hs_ep->isochronous)
-			dwc2_gadget_handle_isoc_bna(hs_ep);
-	}
-
 	if (dir_in && !hs_ep->isochronous) {
 		/* not sure if this is important, but we'll clear it anyway */
 		if (ints & DXEPINT_INTKNTXFEMP) {

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0

