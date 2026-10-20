Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510276;
	b=t0bqkrIbPOshkIAuzWLIoYIoRL87upP5niwIdRBsgy3f1oK3jvp2FFQPC6AKSqW1xRp9
	 fEgoW42DZn3k2Stc32poe8Zfdw+VK2TWKl3cdu1udHs3j2JZU6Ve7nxfj7AbuLXuSSOAR
	 eyEdaARJE9oNHC7Rj71SIjYi5i9T/BCmXRc0b2FnwVGYNvf3xZEHLMSVdorKc68qjihOA
	 0DdZ9Qeh8ajzHyVt4fjr54dKEehQCQ7gI6R2XhMhuc+g6p9jvsmk7vYaPsqEFLzM9l8mt
	 784mvwwkkV5NPerIaX6XPZ0/I705NkzOw4ycKp+IH/OEi952umVbX5pznuVbq+x6isg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510276;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=qsoSLYus+M1tCAzqI/ZNpAHRrLwoOIcxK2qsa3BkpZs=;
	b=Z29ZOGRnXrtFJMbDlziZhjYjUKfZf1JPsF87Pw60BFkM8XcN+FfMmEaM+JX/WvMIxmWF
	 +n9uEf+WAsUYC4whiiRrKAHFuv4jzbk01s4O81RvxaPEn+hZq5OECWag4WkWBEJx3rPAs
	 PZw7psPzxKiO/PvJHE1lvjj/5XXDJ8oUV4NQ+9l583nlGvK18jQSACwLMeJ9XSego3QKS
	 vOkBH1JiA3PwF6RNO3RLrg69OIfX+9pqTw0Lde5aLR2xvIcD6Iq17XQyirZ2iEOVIgmrK
	 26skbZQfgCZSK9P4rN35+Hu1iETibmmpa/NgwIeal8A1OZvsE+sEhu8jvKnOt1wrUUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=p9V+we3v;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23DE606A31A
	for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 15:31:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E23DE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=p9V+we3v
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1df4c0966so5746485e9.1
        for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 08:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792510274; x=1793115074; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qsoSLYus+M1tCAzqI/ZNpAHRrLwoOIcxK2qsa3BkpZs=;
        b=p9V+we3v1bSecIybHxsxM454TeWmuCMmdqKwv724cigxeNMU3C48odpzjFjJVRTeuL
         FdahkGhmGg8Vk3aMjbUQmF2HnnyNM2EqVvVCpp2HqJ/gO+vzYMtAOXAedCsninSfZ/18
         S2phVMfDFEDnoktgmtMqyo2/jQqZ3p1FRPKIUOP/iB6dn2ND8eSsQ8SXotGJUM/GKjah
         UnQoE2JoO+FdD7A9g7At9H5ZIKELCyCPHnJp1/NIN2/CMQn9INRy1FSs450in2BRz0Zj
         MG0qOD1Fx2YHBke7goite6W1MayeX+DniL0xoCuKveN4maA3IMZaFfaU/8U74tH7GTjv
         1Nkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792510274; x=1793115074;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qsoSLYus+M1tCAzqI/ZNpAHRrLwoOIcxK2qsa3BkpZs=;
        b=Dp0u2XAzmSHIp6Mw1zG9i+n6OYMAvLoBrZalxZtWWkADCfhvOGb647R5l/7qUEn23r
         9gDE6YujB1B81RfwaJfAb6V6bxyu6r4Q/PVUmoNRzMmhxfBECvdeiFVZk23CVLcoDV35
         rNO2teRsxzrJih7tqhM8p/SMZr9OGAIaDmA9XhG/s7RMX/xqDgIakY2oniyEXZH3INFe
         l5Z8CTCPA61sJdXou9wkdswDv4jaESnfFJd/tjOnWxbFpGCuXm6ho1Y3zDL80XkuqXnr
         VcIRYt/JMn/U7+pTvzi/j7a9yBWhrssY+q5hY8IQ4n7bGvn4oU5j6big+Ym0pqTYExCj
         B7LA==
X-Forwarded-Encrypted: i=1; AKwUvBx48A0mXKmi08Y/Tpf/JQKULnr2C6ZEkzYnEo0C+SeTBuHsWIZ3NgZF3oM2BHzIlt6Lsv1yp07Esb4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0XlOBssXIyg7RSCwEKxhRhBBwEDNTv8oNAp+YrBNLuommhcmT
	J8GWJA11nVE2A3FVO6n7x8oP/pcUG2Nd0Yj8qUgBq2y894aA+7m1gJhN
X-Gm-Gg: AYBFou3x49vcSQerasSeHX2SJUId6RqjavC80YGvv9UeApRZQ//CiTJrNszDKjUpo0g
	OAft5ROqI4YSR0XSRylISWLrY1itRR3XJI8v3HPZTWCNIwZyZ26B7WK8/egClBaM9w8V2px6jsr
	mUJgOJcQSNm7YYNzc6vFU1hqOnkb8I3GQnuLRsnRPoxt9SdLbBNz/SE1Ktqf7za2nX0Mz1Q1isp
	MjNYC6j1O7p8lgBZdTkwJja4O87OqhqtW5N+3EhbyjqCvff14j9CG6UbuSxLLgbR6WgnvHfVzPV
	jiEQVF2SrhfSfqhV0JoUcE1ArGgZP+uzFIg1WnmlDXW+qSGnQBQxcvHKLGlPvNVfL8PEwLY1ED3
	yvUEnFXbHE++2tSmmBhr0KUyjBahEBHt2JFicfXfZvWtmUotzw/vRksEmQYhtftxDtZAYcVwq5M
	7+m0tqmXj7oTKoS7x3zXDWSe/fUYdVskyN2D8Vzqh8BXcsvu/7/fZOVnb3bVbghU0gqADq
X-Received: by 2002:a05:600c:8b2b:b0:49e:63cc:6324 with SMTP id 5b1f17b1804b1-4a1f4c80374mr69433495e9.6.1792510273908;
        Tue, 20 Oct 2026 08:31:13 -0700 (PDT)
Received: from metepc ([46.197.185.71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d818c59sm7271629f8f.30.2026.10.20.08.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 08:31:13 -0700 (PDT)
From: =?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
To: netdev@vger.kernel.org
Cc: oneukum@suse.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
Subject: [PATCH net v4] usbnet: fix EVENT_RX_PAUSED race in usbnet_skb_return()
Date: Tue, 20 Oct 2026 18:29:09 +0300
Message-ID: <20261020153044.18828-1-omermetekaya0@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On SMP, usbnet_skb_return() can observe EVENT_RX_PAUSED as set on CPU0
while usbnet_resume_rx() clears the flag and drains rxq_pause on CPU1.
The skb can then be queued after the drain has completed and remain
stranded until the next MTU change or device stop.

Synchronize the EVENT_RX_PAUSED state transition and paused-queue
dequeue operations with rxq_pause.lock, dropping the lock around each
usbnet_skb_return() call to avoid lock inversion. In usbnet_skb_return()
use a double-check pattern under rxq_pause.lock on the slow path,
keeping the normal RX fast path lock-free. Use spin_lock_irqsave() to
match the lockdep class shared with other sk_buff_head locks taken from
hardirq context in defer_bh().

Discovered by Sashiko, not triggered, not runtime-tested.

Fixes: 43daa96b166c ("usbnet: Stop RX Q on MTU change")
Signed-off-by: Ömer Mete Kaya <omermetekaya0@gmail.com>

---
v4: Use spin_lock_irqsave()/spin_unlock_irqrestore() to match lockdep
    class shared with other sk_buff_head locks taken from hardirq
    context in defer_bh(); restore local_bh_disable()/local_bh_enable()
    around drain loop to preserve BH context.

 drivers/net/usb/usbnet.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/net/usb/usbnet.c b/drivers/net/usb/usbnet.c
index 84f97f448b2d..9c4a23d8cb86 100644
--- a/drivers/net/usb/usbnet.c
+++ b/drivers/net/usb/usbnet.c
@@ -329,9 +329,14 @@ void usbnet_skb_return(struct usbnet *dev, struct sk_buff *skb)
 	unsigned long flags;
 	int	status;

-	if (test_bit(EVENT_RX_PAUSED, &dev->flags)) {
-		skb_queue_tail(&dev->rxq_pause, skb);
-		return;
+	if (unlikely(test_bit(EVENT_RX_PAUSED, &dev->flags))) {
+		spin_lock_irqsave(&dev->rxq_pause.lock, flags);
+		if (test_bit(EVENT_RX_PAUSED, &dev->flags)) {
+			__skb_queue_tail(&dev->rxq_pause, skb);
+			spin_unlock_irqrestore(&dev->rxq_pause.lock, flags);
+			return;
+		}
+		spin_unlock_irqrestore(&dev->rxq_pause.lock, flags);
 	}

 	/* only update if unset to allow minidriver rx_fixup override */
@@ -700,15 +705,18 @@ void usbnet_resume_rx(struct usbnet *dev)
 {
 	struct sk_buff *skb;
 	int num = 0;
+	unsigned long flags;

 	local_bh_disable();
+	spin_lock_irqsave(&dev->rxq_pause.lock, flags);
 	clear_bit(EVENT_RX_PAUSED, &dev->flags);
-
-	while ((skb = skb_dequeue(&dev->rxq_pause)) != NULL) {
+	while ((skb = __skb_dequeue(&dev->rxq_pause)) != NULL) {
+		spin_unlock_irqrestore(&dev->rxq_pause.lock, flags);
 		usbnet_skb_return(dev, skb);
+		spin_lock_irqsave(&dev->rxq_pause.lock, flags);
 		num++;
 	}
-
+	spin_unlock_irqrestore(&dev->rxq_pause.lock, flags);
 	queue_work(system_bh_wq, &dev->bh_work);
 	local_bh_enable();

--
2.56.0

