Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A864A3815F3
	for <linux-usb@vger.kernel.org>; Wed,  7 Oct 2026 22:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791410611; cv=none; b=YOO0WIzEKLM7qHrvJfVOzzl/9CkwQTmU6+y9oSu/otPze6tmPWcYbxgHiA90mSiqNYsfsYFdCdaLoHt2JAxKKgArZkda/PoenpgyspkpGqiU6gBaoyQ7aAWCPXh1FvSuTqQV7AoEaf6Kl96oXi9UPpSmAnMY7wz4d906TXOjRl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791410611; c=relaxed/simple;
	bh=tke7slPNWOX+7ELjRSDZ8oPCXNvkKtFXU3e3mtWBRDc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=X7o4gOwbwzCL8T3HuMCoKFAqsT0TWkHmcP5tFH5IUyJGmwtmQD1Zu0SAH8CAAPRgRxYnD5HvfDi46HEDIB1mgV858PzfGBfzMLt5lBmYARjPkiD/JPSOh5xnMNluXpvCuaZ7q8j8/9pGmFmNIBSVPtMhf+Oi56NIQqPIWuGazOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n2TjBLq+; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n2TjBLq+"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a16c399641so23345145e9.2
        for <linux-usb@vger.kernel.org>; Wed, 07 Oct 2026 15:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791410608; x=1792015408; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u3vc2Iva4KZFpZlvP0+4NbjFh7c9GdaXKEPiQjjCtn0=;
        b=n2TjBLq+HnVXJfrTRgNaGdBF7+GWtHebwUzYdETmnVxyzf8jrbmMkwpTUZ4tE16o5w
         QRjdiPS1Sp4qUEzxBXnQKt8VNornqq97QKbI91dn3R5ApSYEWVBVIiul+XuuMNyOc0Fk
         Xn7hBSnp7zuWvQg5TIhKBXSNIMYByjUJCl9c0TZocO3f1fKMzxNVucRg/0qM4JFmVg4n
         iZRsP0SyC8ShZG3IDc0TE7VO0MbaVpQJXnIhJ4w3U5wXVfa992FAE3PzFUZsDWQ0C5Rv
         xKS0xE4b7Iy+jkjSi9fwDn510TKCBCj1Ezdi0ObzJR9sd6T1jJof/g/XkqdVyaLlxfnR
         R+yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791410608; x=1792015408;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u3vc2Iva4KZFpZlvP0+4NbjFh7c9GdaXKEPiQjjCtn0=;
        b=JWH1mkDucCDRRplvfnRjOWYwhZSOjMw19o2LCtbPoToT4D/35AzyCCBplzpx9jmViC
         oUN9myddLRg7hfbU9rtRo8yjUD3sZZ+XMjO83aY+4QKeGfOtPl2VV5sQ+6XepNcGlGhK
         ChrMFcOHQHQ+uRPOZfnYbzAl83EflA8si41+7nbAujKRzflW8n4Omo56Lk2gqe2H+iFK
         aWBGUVuBivFmBbT940WS/CgWigzszuuzJ2JPaMOfcHhJiYYNXBYu9QMdRKDRLUcSiNpc
         Yqn3rBr/DsuAQxOe0oAMbl509DgnCx1w8EM9ZpddIZKkzLwU+5PbV6CJ+gLjfcKR0tW/
         OALA==
X-Forwarded-Encrypted: i=1; AKwUvBzbB0wx0c2ggTGeaHq9D+KIIsW2qQFA/nHdDCqxTRaEI5IDZjbvEGAkEZK+VUPUjxQR0OzSPOk/onc=@vger.kernel.org
X-Gm-Message-State: AFuF++lZS37PX8hh9K4ivK0wSk3YyE12/8AaPVZXMERBeFlIpwYLANez
	PfXc5LbBxCwOtUzidlkU7L784FakV4yPeuFv0CsxxFodG+LwtRPYRAOt
X-Gm-Gg: AYBFou1XAXn9mgXcc8lrLydLq+OtL852+GCS1zYbGTUAhzSRaxPSbjgR9fVSB1ndmC4
	octYLGS58xDLHdeQgTw+HqKYCYY2YlE0e53sQvKi/26dI068zYP7jonhQpcdOLdR7XaHzsUfyMk
	C3PuNh1BjWasidYIef/etAS689qh8EvxnFEUk5x2Mi2iwQW6VFtyvBost1sRX77kZfGrDPBKQqs
	bT+TJ0AfB8Wju8qQQgR71whoNQYsRkKExmqTrvZaQpYuuAnaC6RpYIYexiDnLYnTNMMlXUIqDGI
	r1U0gdgS4n2zCQQIZtwrnIkh8oV3a0bAxV52jA4HJ+p1GPN1k82FJoVDnOYj+5+jnRMDRjpL3vR
	c5R0PnASht20ErHciVXpQJYIC0bQNeLRIug3jrFN1KZQXPpN4DHc7oigOR4jafdZmTcLWak5nFx
	S0OM8xHU4L1N/takbDmQRP0oFkbpJyCp7kYMEPtpcRtfrY9Mmi4hBPOwN4/97f2u1ifBfH
X-Received: by 2002:a05:600c:4fcb:b0:49f:bd3c:bc1b with SMTP id 5b1f17b1804b1-4a1804557f1mr54545795e9.22.1791410605701;
        Wed, 07 Oct 2026 15:03:25 -0700 (PDT)
Received: from metepc ([46.197.185.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f493761sm144404405e9.2.2026.10.07.15.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 15:03:25 -0700 (PDT)
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
Subject: [PATCH net v3] usbnet: fix EVENT_RX_PAUSED race in usbnet_skb_return()
Date: Thu,  8 Oct 2026 01:01:00 +0300
Message-ID: <20261007220311.113827-1-omermetekaya0@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On SMP, usbnet_skb_return() can pass the test_bit(EVENT_RX_PAUSED) check
on CPU0 while usbnet_resume_rx() clears the flag and drains rxq_pause on
CPU1, leaving the skb stranded until the next MTU change or device stop.

Protect the flag check and enqueue with a double-check pattern under
rxq_pause.lock on the slow path, keeping the normal RX fast path
lock-free. Wrap clear_bit() in usbnet_resume_rx() under the same lock.

Fixes: 43daa96b166c ("usbnet: Stop RX Q on MTU change")
Signed-off-by: Ömer Mete Kaya <omermetekaya0@gmail.com>

---
v3: Use spin_lock() inside existing local_bh_disable() section in
    usbnet_resume_rx() instead of spin_lock_bh(); move local_bh_enable()
    before queue_work() to restore BH context correctly.

 drivers/net/usb/usbnet.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/net/usb/usbnet.c b/drivers/net/usb/usbnet.c
index 84f97f448b2d..d138d353fd98 100644
--- a/drivers/net/usb/usbnet.c
+++ b/drivers/net/usb/usbnet.c
@@ -329,9 +329,14 @@ void usbnet_skb_return(struct usbnet *dev, struct sk_buff *skb)
 	unsigned long flags;
 	int	status;

-	if (test_bit(EVENT_RX_PAUSED, &dev->flags)) {
-		skb_queue_tail(&dev->rxq_pause, skb);
-		return;
+	if (unlikely(test_bit(EVENT_RX_PAUSED, &dev->flags))) {
+		spin_lock_bh(&dev->rxq_pause.lock);
+		if (test_bit(EVENT_RX_PAUSED, &dev->flags)) {
+			__skb_queue_tail(&dev->rxq_pause, skb);
+			spin_unlock_bh(&dev->rxq_pause.lock);
+			return;
+		}
+		spin_unlock_bh(&dev->rxq_pause.lock);
 	}

 	/* only update if unset to allow minidriver rx_fixup override */
@@ -702,15 +707,16 @@ void usbnet_resume_rx(struct usbnet *dev)
 	int num = 0;

 	local_bh_disable();
+	spin_lock(&dev->rxq_pause.lock);
 	clear_bit(EVENT_RX_PAUSED, &dev->flags);
-
+	spin_unlock(&dev->rxq_pause.lock);
 	while ((skb = skb_dequeue(&dev->rxq_pause)) != NULL) {
 		usbnet_skb_return(dev, skb);
 		num++;
 	}

-	queue_work(system_bh_wq, &dev->bh_work);
 	local_bh_enable();
+	queue_work(system_bh_wq, &dev->bh_work);

 	netif_dbg(dev, rx_status, dev->net,
 		  "paused rx queue disabled, %d skbs requeued\n", num);
--
2.56.0

