Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792831580;
	b=1pAPMc4Q5My6Shr589JU1/05CmIh5KmAbxEE9MljwMlzgu068MUCLpAD0TPk17Ao5okX
	 +fleOQ5jfv54B0dPhcKHhzIgfUuF4rKDCG/5cEmWpcpEfVh5NIGkFMIK2EuBBZoCvO3Nv
	 R7XnM8hQgbP/F+U3rkvJyfzPv3h29G5G11Mjntm5SlUTXTQqGeL7GZn4PIPyJBm5kUvgr
	 23Rz8V1PiEnsVgv0NMCEZD8iFO/ICBNi9QxZnq5MQ6c1V3NmpzqvP0/64I1DVEeSZgneY
	 5mH3AdP7Dft0CO8zRyBzSJSbsBAL9wjjqQ5lsm8vbpQZzv0F2dzvnXAek58SHr7h7KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792831580;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=VcwFgC5lVsHSbW/ej+cAGy1X0tEOwMBM8cSBGLupnzo=;
	b=C8+Qn8UvG2wkAg93fyHwj8V4yB/n9WGv89B0VlQuW1SRRWlaLUtXyu+M8DOvKJ+buJZt
	 QN3JevvMS6agJF6wQssgOFAZx+VoC9Apht/U0oErA3euhkvSneyI7vBhN6pOwtHMi4v7M
	 rEy1ZBGRrWe+CmBm0o9Qy1JXW7g+pfuiisS+VhyHYS2eOJkpeAmRwqpio0L7GozNN2v7i
	 YkINeqUpQTHR+0no70h7o1FcX9qJ1PgKKZe6P8yEPNnHSQQF8vFZ6f9aYtjhjRHHLsS7g
	 6y/CA9LWZOGPVhBkf/EGJrBHCfuvg5qV/ItPMtsC2A/+MqIPl6uiG5r+Y04nu3OYCBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iv+cuac4;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9BB606A31A
	for <linux-usb@vger.kernel.org>; Sat, 24 Oct 2026 08:46:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB9BB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iv+cuac4
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48afbd2c386so874083f8f.3
        for <linux-usb@vger.kernel.org>; Sat, 24 Oct 2026 01:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792831578; x=1793436378; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VcwFgC5lVsHSbW/ej+cAGy1X0tEOwMBM8cSBGLupnzo=;
        b=iv+cuac4Mpwnskit760iQ7AyyUCigTOtw7zZS+Fudv+NRmIVyuZrpMyyKV0EwEaZxG
         p8/ibiwHkQxMuf/cRLJ5wME3cMEQBJoXNXyzQ+frGnuEdHad9y0Byv+nSqDCcYHXXwUv
         /qRI09AEirEvKH1aHUg4TbzbopxvNv9AB5rs2qwjR3ao3Urc7BUUGFRmyH0cH5PzJcQr
         LXM4GeDA3mgPrsMcvURsqjeGseJI42LDEa4p7IMrtyoz/2v78hh0j2Rw8TG5MoZdXp0o
         aJGEheWhTK5VQQz8UBQQAPAj2at+bgOXUZxlXiQysyWWIj+yYIudNB6HsHfhgiOqXrTG
         vowQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792831578; x=1793436378;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VcwFgC5lVsHSbW/ej+cAGy1X0tEOwMBM8cSBGLupnzo=;
        b=MhRq1Fkec704+LqLOBNeauL2DhMb4YdB7CC7q5tlQrzihpE/e1Whcmy8yDVSZmz6ql
         OZorIA4WJY+LE08COm3ke+452UVgImKNm3x0aqdmD+ZOV/rQom/FejuwNTyu0F0VzV34
         8josQNTtlwju7WC/KHudbLL7TKUWgoe572zixopWjr2CLRxFix5fgpbZ2irHImm9Wd4W
         NZYZxdwDGOZcl7CCsLLRdUNdV1Oq+9DiFwzEKvOffzHU/lgh38BnWD/SPdDRT1ZZwbXt
         2ws/J0fIQ0agUbZMoi6cVDhHbWhb6FrGE51B9hor8G/AeoOnpOI5Ktj7d7569wdRgPG1
         s2Jw==
X-Forwarded-Encrypted: i=1; AKwUvBw3m4RjFYCaIoues6El2ImkX5SqhxVETVdpwHHE6bgLXuBDNh6dcacoDFBg0dLPs2s0bSyOba5QJ+8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIBGguDhvosr3WQJkCKNvPsIj+ej8PgfkHIZbkcdJG4WECd3dLQ
	Bbk2yoKbeqYYRrgcXcc1sMEaGMn3L5H077XAetW8I1CGyVoxodUcyeXD
X-Gm-Gg: AYBFou06AVYNH5vrL2ZmpBua+4Og9LZDNRswrJsKxK+3vq9MzvlYOLuDaalpABCOFBG
	Yi7sdsat/Nb+8Ldfew912iS2+/Ap5DBvXF+LZ0a79hu3RxAjsaJ0X1EBNKfZLYojtBl4gQWVIyq
	LAE/+oLHLtyQ7ggmFWHUKt1uoOuysGGFcEsQ1qT9QKrF6Rzex5731vDBrMIwPK3QnFjSG/SRgWw
	xOR3fAsHbaPvQw+GFbeiJPV5SIP3ae9rb7XyeQ3gbeqP62wMGjLa51T7suxuCSF4FgMiF9zt5T2
	GpOxppxZ9QYq5pJ7s38H2De53WV93LIaETKNlt5DNXTxZrzaKTWtXhSPcqJ7YebHIhbbrbWhe7C
	NcqD5/DKnmJTyG16q5Yv6mTOBEMbE3kamMG5ixRA96gq1t67RTzIIUYmjshCEMzcbSSlCd4UMiy
	ssG4i/dZOpZLcwSwN8+TRtG1Th0sQY3RULrWWvVuLJwI6XGlLY8lExgdoHAQRRTW9euLDcUY0yp
	crDRiDDAhi0FC6kxgDQM845hOTbYTi90gJyllvirq/GZ47kEK2gyw==
X-Received: by 2002:a05:6000:2a85:b0:48e:476:99fb with SMTP id ffacd0b85a97d-48e3eb7f435mr1278544f8f.22.1792831578058;
        Sat, 24 Oct 2026 01:46:18 -0700 (PDT)
Received: from metepc ([46.197.185.71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd3662sm3481217f8f.40.2026.10.24.01.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 01:46:17 -0700 (PDT)
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
Subject: [PATCH net v5] usbnet: fix EVENT_RX_PAUSED race in usbnet_skb_return()
Date: Sat, 24 Oct 2026 11:42:08 +0300
Message-ID: <20261024084538.256596-1-omermetekaya0@gmail.com>
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
dequeue operations with rxq_pause.lock. In usbnet_resume_rx() splice
the paused queue into a local queue under the lock, then drain the
local queue lock-free. In usbnet_skb_return() use a double-check
pattern under rxq_pause.lock on the slow path, keeping the normal
RX fast path lock-free. Use spin_lock_irqsave() to match the lockdep
class shared with other sk_buff_head locks taken from hardirq context
in defer_bh().

Discovered by Sashiko, not triggered, not tested on real hardware.

Fixes: 43daa96b166c ("usbnet: Stop RX Q on MTU change")
Signed-off-by: Ömer Mete Kaya <omermetekaya0@gmail.com>

---
v5: Splice rxq_pause into a local queue under the lock and drain
    lock-free, avoiding lock drop/reacquire per iteration, as
    suggested by Jakub Kicinski; fix reverse xmas tree ordering.

 drivers/net/usb/usbnet.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/net/usb/usbnet.c b/drivers/net/usb/usbnet.c
index 84f97f448b2d..97a30dd22c54 100644
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
@@ -698,13 +703,20 @@ EXPORT_SYMBOL_GPL(usbnet_pause_rx);

 void usbnet_resume_rx(struct usbnet *dev)
 {
+	struct sk_buff_head q;
 	struct sk_buff *skb;
+	unsigned long flags;
 	int num = 0;

+	__skb_queue_head_init(&q);
+
 	local_bh_disable();
+	spin_lock_irqsave(&dev->rxq_pause.lock, flags);
 	clear_bit(EVENT_RX_PAUSED, &dev->flags);
+	skb_queue_splice_init(&dev->rxq_pause, &q);
+	spin_unlock_irqrestore(&dev->rxq_pause.lock, flags);

-	while ((skb = skb_dequeue(&dev->rxq_pause)) != NULL) {
+	while ((skb = __skb_dequeue(&q))) {
 		usbnet_skb_return(dev, skb);
 		num++;
 	}
--
2.56.0

