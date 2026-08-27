Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72214A33E3
	for <linux-usb@vger.kernel.org>; Thu, 27 Aug 2026 17:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787853451; cv=none; b=OKeuUxdeAmKhEBAmUCGoF/oCFTEe5ud5ddVS8I+Op8qWK9aQKvfimFuWTG46GoiBcaIXs5VThhxQjdL+NnvKUVLZMTXEko3xtSshdpBF4KiriafIOjVpzuRpTpjBjuaRpjGytHxfNM3VOO90jsErwQFrTGqTwNYsmNlpU9KFPr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787853451; c=relaxed/simple;
	bh=cFow8mmsLDB07/zPkXTBq2WrPcE7xOsvUQjMsrTrXWs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zli+M9HyW+Gi8n5bBk/6rdfImNcQlAdO2dV12eplJFM3uQpaXAwp3FZlz6198tf6KyYoYntGmghaoCzp3qq5rlOG7EGvdcJpNx0oWXU51xelOD/WEiTC9hF/SlqpkVIF/7S0efqGP/btr3o1I2VR4dN/adE9CoMZMZkqlCaDlnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PUSjaNvh; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PUSjaNvh"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49557167508so409815e9.1
        for <linux-usb@vger.kernel.org>; Thu, 27 Aug 2026 10:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787853437; x=1788458237; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=msHPXb4xVBASBxcWVm54PW2v9v50vhp0zhhZwzN3qSA=;
        b=PUSjaNvhEkxvyklQhOhDRqGu23QEbTAfqH7yftfT3dpnRSbKZDmqc70cRC0ZLlVa+m
         DqnvVfQ5mcrGDIugJujWkftY7f5gGN/nD23nGXf8e/hIKzUNblksrVUoviNNUTxA+vPr
         kFxdXyI3A1+DivHwlb05OTFtGm/n72NAQCkcYmhXFWno+y4TLapeFdf8jnr0T2SMjHYw
         v+61zO5Tuw3RrXOegPxg2wqNf7EofnsVVFH5hB1cXfRQSI1Pyk/RJFsHPD/qjrprpz4q
         onVN7NhYepJvkDX+XhV62EYos3Tck0bWicSR1v35kxakvQhq4tylAULHs9/S9dJZ0AaC
         fJVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787853437; x=1788458237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=msHPXb4xVBASBxcWVm54PW2v9v50vhp0zhhZwzN3qSA=;
        b=G94hXREpuOPXUCOmAhaHvUSM8I4GZnvAJrFGOWRaXBDrLivGod4dmPzs5I0PK6YDKB
         v9WrnyMdNzYlFwEcVfLVCVPfZcR2nBWq/Qegddh6Hcc6d24kUl9vtTJviRfFpjFctid7
         VhQBlT7aZM6wfnzKmRAm+mUs0RhfX3726UwQNnPwvNX8Q4fknL7aKk0r1T/3YbdK9RSy
         nN/w7Z432jQ7/Bk2ECoteFUE9KdXVr7c40EIaD69Wk0LndwK8UOSqPJeQZf1+jUm58qy
         KVxv4uu9BqjmZuqDDovfNsr5EgMQQWpHNkocdsuVIKldVYhmUCiYzCTbVNSWCOahlzti
         wJMw==
X-Gm-Message-State: AFuF++kqPE310ZK981O8pzRvJwZGH2ZJDkiOE9OC4TRVdk55sIuJeOfv
	zjI5QiQ6NXIXrwMghXbCJo9MPCBkIqfavEZ1L2/KW7yMarldybReEuSr
X-Gm-Gg: AR+sD12fWWd8apoeFf6denFrzjCbof0R3DMKjgHHN9EGNRihsz1NGoZrCl889Mzj6rx
	6g4UMMH1gitue4By9D5s226ENAZv/LPif0fwEb4z35ttWOk8yv9NAF5I+VSQU7ugM5Z2SeaMy99
	npym8rRhOQmLGGo7InyPZHtqSlqmhekaecgTPp4LoRBpg1yMG3uk6UUMy0masVzRRQR0UCJdSwo
	g+VjxPQC3G7C3zkH8KcKI+Q6/TldxijYUW1Frvfeczl8B4pHE25Tvw4DrnVxtCbAOnOpdmjV8KJ
	7TCDQnz+WpnsN8jm/yua/tF3b2Iw1qoZXNjmFG1Vv6+a3GyYulGWdKgCSqN7qrdu7hh0WQ2ynzE
	4KnZgusSYFZZcJ2K9EOHbNG1E6s2W+jeJT/xbO2wtdBYmrn1tSnuYYg3CeptXY0rO7HL+yoNeVh
	O3waaRfbiWdsJ3k3oCkhUrEQfDflTIY4E8c9CSj/PQMBJ+uNqrkMHpy4mKKgY/xCCedPHcF5uXr
	hyyKcd8ZmQhVJFrY7Dd4NFRw5gLSVv1krtczNx8Hd9l
X-Received: by 2002:a05:600c:4452:b0:493:f140:c3fb with SMTP id 5b1f17b1804b1-49b91c2e42bmr10483065e9.7.1787853436758;
        Thu, 27 Aug 2026 10:57:16 -0700 (PDT)
Received: from il-orgads-lp.corp.audiocodes.com ([134.231.187.64])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4961004bsm82921295e9.4.2026.08.27.10.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 10:57:15 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Orgad Shaneh <orgads@gmail.com>
Subject: [PATCH 3/3] usb: octeon-hcd: sleep on an hrtimer for far-off periodic transfers
Date: Thu, 27 Aug 2026 20:57:02 +0300
Message-ID: <20260827175703.1549-3-orgads@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827175703.1549-1-orgads@gmail.com>
References: <20260827175703.1549-1-orgads@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cvmx_usb_schedule() enables the SOF interrupt whenever any pipe has
next_tx_frame in the future, and leaves it enabled until the transfer
is due. An interrupt endpoint keeps such a deadline pending
permanently, so a single attached hub (status pipe polled every 256ms)
costs an interrupt on every SOF - 8000/s in high-speed mode, forever.
On a 500MHz CN5020 that is measurably ~20% of one core spent counting
frames.

The frame counter is resynchronized from HFNUM at the top of every
poll, so the driver does not actually need to see every SOF to know
when a deadline arrives. Sleep on an hrtimer when the nearest deadline
is more than a few frames away (one high-speed frame is 125us) and
keep SOF interrupts only for deadlines that are imminent - or far
enough away to risk the 16383-frame HFNUM wrap, where the interrupt
path still tracks the counter extension.

Measured on a CN5020 board with one 4-port hub attached and idle:
8200 -> 4 USB interrupts/s, with no change in enumeration or transfer
behavior.

Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---

diff --git a/drivers/usb/host/octeon-hcd.c b/drivers/usb/host/octeon-hcd.c
--- a/drivers/usb/host/octeon-hcd.c
+++ b/drivers/usb/host/octeon-hcd.c
@@ -378,8 +378,22 @@
 	struct cvmx_usb_transaction *active_split;
 	struct cvmx_usb_tx_fifo periodic;
 	struct cvmx_usb_tx_fifo nonperiodic;
+	struct hrtimer sof_timer;
 };
 
+static int cvmx_usb_poll(struct octeon_hcd *usb);
+
+static enum hrtimer_restart octeon_usb_sof_timer(struct hrtimer *t)
+{
+	struct octeon_hcd *usb = container_of(t, struct octeon_hcd, sof_timer);
+	unsigned long flags;
+
+	spin_lock_irqsave(&usb->lock, flags);
+	cvmx_usb_poll(usb);
+	spin_unlock_irqrestore(&usb->lock, flags);
+	return HRTIMER_NORESTART;
+}
+
 /*
  * This macro logically sets a single field in a CSR. It does the sequence
  * read, modify, and write
@@ -1908,6 +1922,7 @@
 	int channel;
 	struct cvmx_usb_pipe *pipe;
 	int need_sof;
+	u64 min_due;
 	enum cvmx_usb_transfer ttype;
 
 	if (usb->init_flags & CVMX_USB_INITIALIZE_FLAGS_NO_DMA) {
@@ -1948,15 +1963,33 @@
 	 * future that might need to be scheduled
 	 */
 	need_sof = 0;
+	min_due = ~0ull;
 	for (ttype = CVMX_USB_TRANSFER_CONTROL;
 	     ttype <= CVMX_USB_TRANSFER_INTERRUPT; ttype++) {
 		list_for_each_entry(pipe, &usb->active_pipes[ttype], node) {
-			if (pipe->next_tx_frame > usb->frame_number) {
-				need_sof = 1;
-				break;
-			}
+			if (pipe->next_tx_frame > usb->frame_number &&
+			    pipe->next_tx_frame < min_due)
+				min_due = pipe->next_tx_frame;
 		}
 	}
+	if (min_due != ~0ull) {
+		u64 delta = min_due - usb->frame_number;
+
+		/*
+		 * frame_number is resynced from HFNUM on every poll, so a
+		 * deadline that is many frames away does not need an
+		 * interrupt on every SOF to count them down - sleep on the
+		 * timer instead and keep SOF interrupts for deadlines within
+		 * a few frames. Stay well below the 16383-frame wrap of
+		 * HFNUM. One (micro)frame is 125us in high-speed mode.
+		 */
+		if (delta <= 4 || delta > 8000)
+			need_sof = 1;
+		else
+			hrtimer_start(&usb->sof_timer,
+				      ns_to_ktime((delta - 2) * 125000),
+				      HRTIMER_MODE_REL);
+	}
 	USB_SET_FIELD32(CVMX_USBCX_GINTMSK(usb->index),
 			cvmx_usbcx_gintmsk, sofmsk, need_sof);
 }
@@ -3646,6 +3679,8 @@
 	usb = (struct octeon_hcd *)hcd->hcd_priv;
 
 	spin_lock_init(&usb->lock);
+	hrtimer_setup(&usb->sof_timer, octeon_usb_sof_timer, CLOCK_MONOTONIC,
+		      HRTIMER_MODE_REL);
 
 	usb->init_flags = initialize_flags;
 
@@ -3696,6 +3731,7 @@
 	unsigned long flags;
 
 	usb_remove_hcd(hcd);
+	hrtimer_cancel(&usb->sof_timer);
 	spin_lock_irqsave(&usb->lock, flags);
 	status = cvmx_usb_shutdown(usb);
 	spin_unlock_irqrestore(&usb->lock, flags);
-- 
2.47.0
