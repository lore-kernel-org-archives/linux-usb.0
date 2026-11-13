Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794543609;
	b=lP8i9Qc+cQMqEJN8/d3vuLZaw+V4Fp/w58scPHM9++1HZIBZeqv1ih4GXVNeRyxvN9bx
	 LneHTaK5eKwFO+A0yU9YwvP5n0DwSO4wIKc9RvSPfkEE+BpL/hJ0Pm+j/ekAZxmiB7Cx8
	 09eJ5aTlZzhTAhaL4aI60ckUcUWhi+TPY+115R8PLGPxkS5nCOICjEfUeIVDZJiVeYc9R
	 YsghOTzNo5fqoGhlP2F6+iiV3r+2Up5Kb3pZYALgY65/bmgEiyqP5iKkL2mdiO7llZLYK
	 vS7YfBNZN96LG9Cezx+i9zcnJ4qTD3VGsx0dfTIdNEN30X7VFI0lN7gxpHMSq1j0GuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794543609;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=rprhafvahsqmCsPrqwOYTIKCO6hratIu4WQYYE7hQC0=;
	b=oNk/ArMOR0gH/Ex3CjCtNEsPGQCMPJ2Jo9xiaAyocpa3suVAvw1FPV3K11jty3QvjvxK
	 psDMvy8E3htYr4xrzAtd+JBdSkSa8pFGgSxIuxmaGiBT70nX7WpzrBOXQw8wAyG/pPA0+
	 XyvZfu3sN16gnbmTRicWLl+KBKgb43jPz9p+cdQJoFplBGKvjakF+nsvj3zSR4C42ZWRx
	 vZE200CRTBk2Cut2ai2D514tqI20n+sjUSh/A9MSwgYKdGuk7bZU4azORf7N/Nun7PF0n
	 DVHeqFpfKxxIrGp/HK+ogldsUeRbhJRSkszrTsWugm6b94pHev490xfgRTJkXYOHXJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--rickyniu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="D/Iv+7IQ";
	arc=none smtp.remote-ip=209.85.215.199
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B94606A323
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 04:20:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30B94606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rickyniu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=D/Iv+7IQ
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc7361c62b9so315739a12.3
        for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 20:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794543608; x=1795148408; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rprhafvahsqmCsPrqwOYTIKCO6hratIu4WQYYE7hQC0=;
        b=D/Iv+7IQHUZ5TDal7O0lXbjqi/4jhA1DDq9BJEhC7kzcKOW6ru9J6r+OQK2rzML/Oi
         Boxz6OG7S1n+WsLYIP87N6kIjHSBJyxdH3CZP6+WjA8YuAhvp117DHJoBIjDCXqa474/
         eYr0Dq+9pbqQK760V7uOMA1FQXIopGqdkZ56KBZDGHA8CaoiS3DeFsU4ybvLK7XqiBq4
         1Vs3Vq2spHqWWGetE+/AoS4ZUY2r4Lg2U8ucnvF6yvaO97/Vzgy3VaacV50TcAGJNYYp
         nQRoMM+jfC2gfkeqqoxITRDFY2sq951+OQA3yg1MDwtua3050WArzLutZWfJzn0inT+I
         fL+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794543608; x=1795148408;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rprhafvahsqmCsPrqwOYTIKCO6hratIu4WQYYE7hQC0=;
        b=VumV1svOO+JwoPwhjWpMGuC6N09o4KrFtc32rCaMe18eUpKvKuer/+arTTnTSeDnha
         Gj2NyP8o5sW0bHoWvUNw+Tw16sN/j59UjvZRcDykIHlYgv5nDkkmJK+go9wslU6q6skS
         6iFuwyXVOwfXMdrypOAgjM2JJu3DPLuddbu6AFRtlXyCAJK4N5i+0P3QqPI+RodwAQqi
         m77nEZ+4TPzRY31990LSzy4Ho39NCsqA0IaGNdfvwE7iwIPt/xOmH43ocpKwTvcjEKxF
         rOlWkfsGyTQlN07GwpEJnzNfgcU2E+7+Y0VVMbJoFM3OPuXD0r9mvhjh4IRWrClw2w0l
         RtVA==
X-Forwarded-Encrypted: i=1; AL+hErETvnC07UwTjfnqv85f+7E57nB8AtnthZH76U2QSZn4O9YyMgWwW2HYgkPpxQt6yR/HeaaJgNcm0FU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8U0Md8ZpSJ3PqtwQ/BaUDFgDLzNYiRV2VOjQ2fiZdSpSZiUDbN
	y47pq7QpmEtklTwV6dyrtvKjKwAMuqKAP4clyMoiz5tM/97hI+gThq8q10mUWadMT7yqC811M3+
	3SdgM/k6pdCVvfg==
X-Received: from pfbcn11.prod.google.com ([2002:a05:6a00:340b:b0:8a0:4085:d831])
 (user=rickyniu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:7785:b0:3eb:2f53:bdc6 with SMTP id adf61e73a8af0-3f7a70ac1f6mr991797637.23.1794543608058;
 Thu, 12 Nov 2026 20:20:08 -0800 (PST)
Date: Fri, 13 Nov 2026 04:02:36 +0000
In-Reply-To: <20261113041948.1280304-1-rickyniu@google.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261113041948.1280304-1-rickyniu@google.com>
Message-ID: <20261113041948.1280304-2-rickyniu@google.com>
Subject: [PATCH 1/2] usb: core: hcd: Disable IRQs when taking bh->lock
From: Chien Kun Niu <rickyniu@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Chien Kun Niu <rickyniu@google.com>
Content-Type: text/plain; charset="UTF-8"

usb_hcd_giveback_urb() can be called with local interrupts enabled,
but it acquires bh->lock with plain spin_lock(). bh->lock is also
taken in hardirq context by HCD interrupt handlers and in BH context
by usb_giveback_urb_bh().

If an interrupt arrives on the same CPU while usb_hcd_giveback_urb()
holds bh->lock with IRQs enabled, it can deadlock on bh->lock in
usb_hcd_irq(), or in usb_giveback_urb_bh() on IRQ exit if the BH work
was already queued. We hit the latter during reboot when usbnet
unlinked RX URBs on a halted xHCI controller:

  Call trace:
   queued_spin_lock_slowpath
   _raw_spin_lock_irq
   usb_giveback_urb_bh
   process_scheduled_works
   bh_worker
   workqueue_softirq_action
   __do_softirq
   irq_exit_rcu
   el1_interrupt
   _raw_spin_lock
   usb_hcd_giveback_urb
   xhci_urb_dequeue
   unlink1
   usb_hcd_unlink_urb
   usb_unlink_urb
   unlink_urbs [usbnet]

Use spin_lock_irqsave() and spin_unlock_irqrestore() when taking
bh->lock in usb_hcd_giveback_urb() to prevent same-CPU hardirq and
softirq re-entrancy.

Fixes: 94dfd7edfd5c ("USB: HCD: support giveback of URB in tasklet context")
Cc: stable@vger.kernel.org
Signed-off-by: Chien Kun Niu <rickyniu@google.com>
---
 drivers/usb/core/hcd.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index 8e8a5f59b..7bb25e7c4 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -1731,6 +1731,7 @@ static void usb_giveback_urb_bh(struct work_struct *work)
 void usb_hcd_giveback_urb(struct usb_hcd *hcd, struct urb *urb, int status)
 {
 	struct giveback_urb_bh *bh;
+	unsigned long flags;
 	bool running;
 
 	/* pass status to BH via unlinked */
@@ -1747,10 +1748,10 @@ void usb_hcd_giveback_urb(struct usb_hcd *hcd, struct urb *urb, int status)
 	else
 		bh = &hcd->low_prio_bh;
 
-	spin_lock(&bh->lock);
+	spin_lock_irqsave(&bh->lock, flags);
 	list_add_tail(&urb->urb_list, &bh->head);
 	running = bh->running;
-	spin_unlock(&bh->lock);
+	spin_unlock_irqrestore(&bh->lock, flags);
 
 	if (running)
 		;
-- 
2.56.0.611.g1030f0b940-goog

