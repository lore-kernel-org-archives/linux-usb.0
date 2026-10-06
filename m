Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE9838F935
	for <linux-usb@vger.kernel.org>; Tue,  6 Oct 2026 12:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791288523; cv=none; b=sMdaHTRMmpw0jpSmPzDqLCLAtw6FD+TLz+MT3UiQSojtTFTeSYMbYoh+bH3x86fIveQG/PuDRpBxogqVROGmftnLyHwwxRphSjG9IqAh+xrjoUBqeRZvDbvq1M9O+g/dZWeXOdUzJAaV8RAU3hPHKPX+sCENsXCe2j6CVQiry8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791288523; c=relaxed/simple;
	bh=3S1ODil890UZ3AlrML5DJqdlWzXaY3QURyOr/71QQd0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OFN7K+6rYAj4zIbFj5DL7K8vZWzJpMnNvQb1hzMpHfye9yPxkximturwYQBkfjWkDjYGDTTiITyHKUE8TCTy9KklvT8hD6P2DogRvPggZmSRt9tWANI0sJiQxKZiTyZRXpYUVgdaLQi5SDutqCq0ZS3erYE6xb0VHJlqjcII0as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GSfd4XNq; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GSfd4XNq"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a16c399641so6853755e9.2
        for <linux-usb@vger.kernel.org>; Tue, 06 Oct 2026 05:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791288520; x=1791893320; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=je8cwPxHIss8SyidCLgD3aHQ+Cf/hSNGW28mAiVpfKY=;
        b=GSfd4XNqNyjiONUlHTtXWbR1XqwM/jOVdBPat1RoYDkLSbj5l0AkgO1g0hO7Rn6Ol/
         +xqOi4efd+/lxHBY8ijfSbbw1vE+pMSduBAoJu0g8DYPbuFBCVUBrnDoDtcB9ToQIngX
         S5EpRyQO/XXU0kyJN9lfbycQM1KStiigT/XA2KyKX9J4lZsEBcmV9kB0e1s+Umst8i9q
         J6m4S2tNidQ3ko5qdOsJL16FYy16K4g1Fx7+GAvC5bJa60kEoclYCGE6uwrpUl2M8PCj
         AHNpR71azcHXfFw3kRZ91zdrddVtq7TOi/gyPawoMi14GT9H9G0LEC4cQT2cQvgJLlwM
         G7CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791288520; x=1791893320;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=je8cwPxHIss8SyidCLgD3aHQ+Cf/hSNGW28mAiVpfKY=;
        b=fqiyEey1zy2TY7/5pSYw/qpNIBss6ubOnDvX3fSyOeohdh8OeWC+YyM9gOAGjQvyiQ
         7su3yTGvHjj/xGTxskZUkxxYn4gsiCYXeBAV3rq+Ei+cCZRzcpQR3IfU6EATd4oDEYzA
         HdtH9XDC8tJHvcSCB3Wic1syvhC5kNXqBtEZlqKFpPAn8md8F/qAabpypb60+TumMYpS
         iCrIRjXoCUzdReWMd3m4RiW8au6Uwk7JqWYtNy2Q2iQ4TOSBfj1Cs/jH9hFYL/qmgcrs
         X7SACXTYRpPmP6ci9QK3swyTiFbeuZQP61MdZiCvwL2pFQGOAxJ7kmGAjoxzoRdgKrCW
         7RAg==
X-Forwarded-Encrypted: i=1; AKwUvBzYuZYh7gH0x4+z/e5DtOjwrH+KdhZJeJT9g9DQjBC06qUwAKUzazS4rhCpN44BIdG1MKp1kGklcQw=@vger.kernel.org
X-Gm-Message-State: AFuF++m8AKp/41PTb3ueoRnZpdlZ/RJj1S3UjDLz9Uxmb3z3rMFsVpo5
	unTvNhgyulfQrsPbzddW9JjeR/dMcUWaB0ECYGz25S9GzbhZ7nQsyB5n
X-Gm-Gg: AYBFou3KtNKmVewYy7P2JY5q9ZLAszqxgqgfIvOyNtGTGJ4jdTQlONqYXLY4bSma0TG
	yL0lkqqSS2604mm4uv8Uknygt7RGg0OpIFmJ+ePqnH2Pu1bZvhfauCAL0Kg51TGQxTvdeu0/hko
	huNruLbBht9OQdHHdM59+fosWMJpJNjXiXiucg77vsOrKG+kaZ7jP37rTzsyoyIvEdG1JT0Zv2H
	4ryfRoT/iaVw7lIseyBV9YNZhPUhWTUFzJFapdQS+ryo7T+F3URDCun4gzlufbqNp9fpVgpuSaH
	M4ZDJSGysvG2lJa8gkI+9agrsAF0lQbvE2n9Fnkf0XfYVVzB8Poj1EBi/yz8eNQ65IHB5tqqrzl
	ORahjBv6nM3N0Xpdt0OPxX6SwhNTfcwzYSgeGNrne6cIu72n8jcUYFpBmDKQ2mtX791SC0zEWdg
	4T9VNz4iRr5cVsYRbangxN6GZJr4ujHeJ1iN4Fceh4zGGHuFZL06EOQlKA5dbc65bTTx1y
X-Received: by 2002:a05:600c:c16f:b0:4a1:65d2:7912 with SMTP id 5b1f17b1804b1-4a17b527aebmr19859395e9.8.1791288519978;
        Tue, 06 Oct 2026 05:08:39 -0700 (PDT)
Received: from metepc ([46.197.185.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0394c937csm246918505e9.1.2026.10.06.05.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 05:08:39 -0700 (PDT)
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
Subject: [PATCH net v2] usbnet: fix EVENT_RX_PAUSED race in usbnet_skb_return()
Date: Tue,  6 Oct 2026 15:07:04 +0300
Message-ID: <20261006120825.342164-1-omermetekaya0@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

usbnet_resume_rx() disables local BHs before clearing EVENT_RX_PAUSED,
but this does not synchronize with usbnet_skb_return() running on
another CPU. On SMP, usbnet_skb_return() on CPU0 can pass the test_bit()
check while CPU1 runs usbnet_resume_rx(), clears the flag and drains the
queue, leaving the skb stranded in rxq_pause until the next MTU change
or device stop.

Fix with a double-check pattern: move clear_bit() in usbnet_resume_rx()
under rxq_pause.lock; in usbnet_skb_return() take the lock and recheck
the flag only on the slow path (unlikely paused), keeping the normal RX
fast path lock-free.

Fixes: 43daa96b166c ("usbnet: Stop RX Q on MTU change")
Signed-off-by: Ömer Mete Kaya <omermetekaya0@gmail.com>

---
v2: Squash usbnet_resume_rx() fix into same patch; previous version
    only changed usbnet_skb_return() and was missing the clear_bit()
    change.

 drivers/net/usb/usbnet.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/net/usb/usbnet.c b/drivers/net/usb/usbnet.c
index 84f97f448b2d..5eba2cef8bac 100644
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
@@ -701,8 +706,9 @@ void usbnet_resume_rx(struct usbnet *dev)
 	struct sk_buff *skb;
 	int num = 0;

-	local_bh_disable();
+	spin_lock_bh(&dev->rxq_pause.lock);
 	clear_bit(EVENT_RX_PAUSED, &dev->flags);
+	spin_unlock_bh(&dev->rxq_pause.lock);

 	while ((skb = skb_dequeue(&dev->rxq_pause)) != NULL) {
 		usbnet_skb_return(dev, skb);
@@ -710,7 +716,6 @@ void usbnet_resume_rx(struct usbnet *dev)
 	}

 	queue_work(system_bh_wq, &dev->bh_work);
-	local_bh_enable();

 	netif_dbg(dev, rx_status, dev->net,
 		  "paused rx queue disabled, %d skbs requeued\n", num);
--
2.55.0

