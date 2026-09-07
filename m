Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25DEF369208
	for <linux-usb@vger.kernel.org>; Mon,  7 Sep 2026 21:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788817674; cv=none; b=NyZY2ARrtNro1+va5hkhgVD7VVIeFiq3T2ZirR0/t2hOHMKfWESe84zAhrrE6nsfNNM8ILG44fPwmIVoQX+8EWZ02Tp141RT6QlcQ1VhkN9PNURu4uIEe9lk+A+rR26thRazdK7ssV9eRF+J1zWsdme9fYnBF3QneDGmkpQFPsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788817674; c=relaxed/simple;
	bh=IDjn/kq5IVHDJPlyX+6SDU+x4L/nD8KL0YP/lw8iah4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i9gIZERbXtA/A1+xn4zd890PMxuMKRUmPHrCgX4uDxCLBTXLIksgjuFhG4uNN3ITow4j7CPrDGu3gR4klZ4xGrVW2KsPKeft0ipYGNUR9+jfcKfObGD7qIeji1mrAgyPcvwdIQr+sMPTh40qGiW3lIOlTbGfcMLiRP4X5i+ktA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qrj9VpYu; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qrj9VpYu"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48589798dbbso3300604f8f.3
        for <linux-usb@vger.kernel.org>; Mon, 07 Sep 2026 14:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788817671; x=1789422471; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5KUdZmBnDmF2hbOlG2VbjARf63PeIjYTeZjDuYjWBho=;
        b=Qrj9VpYus0ng4gQ6ieuhpo4gLLZndTv9HjPsY4C3qATyIXtKkTQbZgU7dlTdgC/SEH
         qpJzD0/DrHrx2JMcikVIc52UY4+hx0AYySkPANH6YXIlmxGCjH2K4r9agfgz6kHlgJVx
         IoWtsllNTjbkP+++NROTuh+Hdt4D0T7QQmXXnQcjBi1JChZh+kzXHaoles3YRK8y9sPp
         8YYySMg0SdB4fJvJLUNt/2RCcySgQblMT9iXkjd7ghJwiYp9aVFg0oREpNmZl0F6eJuP
         YAyB94Zzy6nL3slmken4tk/fQZhSrQW0YLoYpdMjI9qPS9hXaLSFD4d35B9bXTYGf3Jy
         OUyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788817671; x=1789422471;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5KUdZmBnDmF2hbOlG2VbjARf63PeIjYTeZjDuYjWBho=;
        b=bTzZf8f/5ggq9vlEnkuaaMus0MgNbSvnbxnzYuHuLPMiIT/l4iTLKxlqZG2Z2wyBL5
         o8j6p3DaLnIQBjdb85h21cUCWwWeGLttXj6POV7BuRYqBYPgXYgwMLjKPAB0elLsaG/P
         Sv3woiTdk1hENlaT6a7uyFoJWf4aBmhBDr4idvEIeHHMttmQW+E5RauSoFPbXi/xYQGW
         86dAVH4Dw1/CA62cATujhVkorpESFgLBl9OqCRm6Aosf4TTPon3ye6P+eahG5y11Qb79
         Fn6jnRDQ8ZXst9zkqkW723XiZQtx61fH80+MpDXdaN93+bEVUV2EoR1xsIGswZFLHE4I
         y23g==
X-Forwarded-Encrypted: i=1; AKwUvBxOh6Jv2UlineowM6qpk0SQKH4mV89xBPgIQE1Wka+Ab8kEASg3BioaYVjhdrHVHW/hw5BXP5F4Gww=@vger.kernel.org
X-Gm-Message-State: AFuF++n81PTXqAZXEizejlV4aoi+p70V3OsVw5DI5WHVHZujr0wECMxW
	QQxY5yU6z1yBy7weLnXllbLdH/evQZFEgSfajKGCO1EyXt6PRrOlb/Ox
X-Gm-Gg: AYBFou2njpzE7exo+nl6ODcnmHxClHw5WQGElxHk+BMI379i7+eNd5ai0zhKXcbMhHj
	+F+r0FjjP2VWvsEWgaGrONw5er69yM18pjfI7sEomNmycDDmPeUfSeBkXVYeKVQkAQBizGSOfVl
	dqq9+IOGcv59+xU045Y8EEP9St42iMp1TolAPh6LLddk787ECe2x1Qc2QkSciwAzgnFBmUzqzQe
	7yYpYpe4fnK60Q3xIKGQ0j7Po336ow/wT/IPyPi+fpSGxSdDkWQWMTrjkA2JqqAa4Oirir+xln5
	dQ5qUGMrOhipqZMdkihMhJ+YLnIGaO+J+loitQ9GJwqaj7s1Zn2JXT5NAL2AZSsp/FL4mcCh6Cu
	9GxuuhNdYtoDNh7hbA2hXNGVewyywKWuGHkrLq72ThADvhF8D44oA1ad9elzN61w39ciiplrfKo
	bxjPzCNf6wGE1W8cNDCiTrfkO0x3zlLjzBF1YpXAg4j0SJdpILC2ODOvngdn/6Qh1dLQp6
X-Received: by 2002:a05:6000:1785:b0:485:91ac:434f with SMTP id ffacd0b85a97d-48591ac44a5mr16089651f8f.16.1788817671341;
        Mon, 07 Sep 2026 14:47:51 -0700 (PDT)
Received: from metepc ([46.197.185.71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bbb51sm32792941f8f.30.2026.09.07.14.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 14:47:50 -0700 (PDT)
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
	david.laight.linux@gmail.com,
	=?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>,
	syzbot+04cd90bb99c6ef81a65d@syzkaller.appspotmail.com
Subject: [PATCH net v4] usbnet: fix smp_processor_id() use in preemptible context
Date: Tue,  8 Sep 2026 00:45:12 +0300
Message-ID: <20260907214727.692307-1-omermetekaya0@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907212308.420701cf@pumpkin>
References: <20260907212308.420701cf@pumpkin>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

usbnet_skb_return() and tx_complete() call this_cpu_ptr() before
disabling preemption, which triggers a BUG when running with PREEMPT_FULL:

  BUG: using smp_processor_id() in preemptible code in tx_complete

Fix by using get_cpu_ptr()/put_cpu_ptr() which disable preemption
and return the per-CPU pointer atomically.

Fixes: 43daa96b166c ("usbnet: Stop RX Q on MTU change")
Reported-by: syzbot+04cd90bb99c6ef81a65d@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=04cd90bb99c6ef81a65d
Signed-off-by: Ömer Mete Kaya <omermetekaya0@gmail.com>
---
v4: Use get_cpu_ptr()/put_cpu_ptr() as suggested by David Laight.
 drivers/net/usb/usbnet.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/net/usb/usbnet.c b/drivers/net/usb/usbnet.c
index a19ecf718f36..3df72b0c6bcf 100644
--- a/drivers/net/usb/usbnet.c
+++ b/drivers/net/usb/usbnet.c
@@ -325,8 +325,7 @@ static void __usbnet_status_stop_force(struct usbnet *dev)
  */
 void usbnet_skb_return(struct usbnet *dev, struct sk_buff *skb)
 {
-	struct pcpu_sw_netstats *stats64 = this_cpu_ptr(dev->net->tstats);
-	unsigned long flags;
+	struct pcpu_sw_netstats *stats64;
 	int	status;
 
 	if (test_bit(EVENT_RX_PAUSED, &dev->flags)) {
@@ -338,10 +337,12 @@ void usbnet_skb_return(struct usbnet *dev, struct sk_buff *skb)
 	if (skb->protocol == 0)
 		skb->protocol = eth_type_trans(skb, dev->net);
 
-	flags = u64_stats_update_begin_irqsave(&stats64->syncp);
+	stats64 = get_cpu_ptr(dev->net->tstats);
+	u64_stats_update_begin(&stats64->syncp);
 	u64_stats_inc(&stats64->rx_packets);
 	u64_stats_add(&stats64->rx_bytes, skb->len);
-	u64_stats_update_end_irqrestore(&stats64->syncp, flags);
+	u64_stats_update_end(&stats64->syncp);
+	put_cpu_ptr(dev->net->tstats);
 
 	netif_dbg(dev, rx_status, dev->net, "< rx, len %zu, type 0x%x\n",
 		  skb->len + sizeof(struct ethhdr), skb->protocol);
@@ -1298,13 +1299,14 @@ static void tx_complete(struct urb *urb)
 	struct usbnet		*dev = entry->dev;
 
 	if (urb->status == 0) {
-		struct pcpu_sw_netstats *stats64 = this_cpu_ptr(dev->net->tstats);
-		unsigned long flags;
+		struct pcpu_sw_netstats *stats64;
 
-		flags = u64_stats_update_begin_irqsave(&stats64->syncp);
+		stats64 = get_cpu_ptr(dev->net->tstats);
+		u64_stats_update_begin(&stats64->syncp);
 		u64_stats_add(&stats64->tx_packets, entry->packets);
 		u64_stats_add(&stats64->tx_bytes, entry->length);
-		u64_stats_update_end_irqrestore(&stats64->syncp, flags);
+		u64_stats_update_end(&stats64->syncp);
+		put_cpu_ptr(dev->net->tstats);
 	} else {
 		dev->net->stats.tx_errors++;
 
-- 
2.55.0

