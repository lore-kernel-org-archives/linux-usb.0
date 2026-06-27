Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D705B37F8D3
	for <linux-usb@vger.kernel.org>; Sat, 27 Jun 2026 21:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782595739; cv=none; b=J54NU2LAXKYnEmAgiTv6duaQXnFk4Hrau4/gTR+uctr/MJaNl5QaFqZa2hQuPpM1G2t/eCzv9up8meGPKvJkYDnRTjXo9ppvkE0fyHoIVFm7jOrV1RqAvkoCURb6wnwk3HIcIB0YplnMAIl+awdqLpBkOcXicLqKAsvSaOio54s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782595739; c=relaxed/simple;
	bh=jhDUUimV3btwK24HPkRLo7McWA/Uq/+L3OCXNwFvQ7s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZFAYGYhcSqdPGt4SzB037HQs95/g5cisOewZ5DTQGT5Bv7BUYMastflZ/gyhjpdlVMSJkmIWNl3A4x88fwJ9rY+E3s0FFSKMS2QPR8+fQSMJVonOl3M23hGl6gKKaDVYdA6BN4HUA02VYrnpx9RiSqj+c+fHHC08aQFn/UTBhmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=kiajtxlZ; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="kiajtxlZ"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-37fa53bc22dso1081088a91.3
        for <linux-usb@vger.kernel.org>; Sat, 27 Jun 2026 14:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1782595737; x=1783200537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wfUYqZ5wmXGDRjKGvfXADrcgd/xNaAR34+hp3yqisLc=;
        b=kiajtxlZZqptArjAmGtYLP5HoPEZNFW6gDOhzIQzq08jxN4xmFKM3vv81ceh6NMoIh
         H0nt9koyWpuicteFSaa8FgynlapFpjoQjTGmV3nfm5PoDxPg0B7i6M460ZDhOlVO8ks/
         +loUaYGQNpionH3O30zv8pr6/lwT0iHHvFZzDa5qAWkokLLhBLFV8BjQblRiEriD6M22
         1LfivHJ5p62jSH7y+GC7yQYnvOjw6f4o9tYYFJmcY6iNxkzlI1NNm4T5PUPyp/ER3hj4
         +XbO8GAokluv7jhN6jVEkCjvIgSm2ClItfuKzZ7kVVLW6CNxzwzRpDzw7msW8Vl+GGLC
         7QZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782595737; x=1783200537;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wfUYqZ5wmXGDRjKGvfXADrcgd/xNaAR34+hp3yqisLc=;
        b=KMx6STXngvL8fd96YwyQUPQUylqOzxo6ty1/SAi7Hkf2SDsQM/XUV+esJzI3yGcNf5
         0uAYFaLBNs2Czlcd5v1mR3MweV9hCLJd5rQa5YoEmNq76rAnxTmWAsku/BGgajJE2srR
         iVV2pQQwOEK4PKLJFd6v9GtxQx8kWE0t7aKRUiLQ46v/xU8bQ6asQcx3Sf4HixG+RUs4
         IAYsOxQqXohnblS5Jq5LqU/8nhD/VfwHitQlLLDcaUCK6pctcx1bv/jW72M3X7TSzQYI
         kCific/RAGq/KN9mnJhMRAe3mazHMWmGMFX+t7iseicu6KXp2e5TT6y6MP3IpGd2s+zp
         dEiw==
X-Forwarded-Encrypted: i=1; AHgh+RqnpIE73tkMVPyno7+BAN/rr4XmsajylWy6NIHoCjylPYMrH6Dwdwlnmr0/pn1jggcBLJqQU6Xdxbk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwatuVVPOUK/y+mEaEVxnq6eKjNWxa4JYo9B6Z/NmAJA/xy+8Km
	6TSKL6viJzfa8SECRp7mbzOkQIVAbZMrx8FavRMTL5w9WGslWnvfBg5DsPHs1y7QhQ==
X-Gm-Gg: AfdE7cmX5v/bkiR87Dad9vadPzyq3cMfLMCsXrck/R+A9LIM2ldxqu6vHG/MFAkvIiD
	GWdBG60SQUjm6Q0t9DdjqeYaeppk17K2wpvaMxOrGVPhAyaa/ZqhJMnO7JTucwbJ9VGCByJ2sTH
	SmTi+Im4mlVZMx43wdZ/eTt/3zxO7iU2ROi8TxdQXt1Rlkl32vwhWI0khNarF+JYQ/ESH8glk0E
	reUtI+cd4db66FHGU9fym1PgcqPdpdYRIQyg58+oBPZTk4nVQ3PL6Qa5j1S53RBreIMaqfZxg/F
	wfeOIFdQUVLSxI02gFb23D6NO3/TVqcT4OmUIGWBowTmFKL84hvIo2p5wzPnrWfTiaV1DJMqOqB
	+XH83lT4WTIzYyfmNPuhA7PeYtQr1egrCKxcPcnyew2p0fsxVmJ1Q0aNFdqFPtg1ELdZfyvPXA/
	8yG1+PQAcIHw==
X-Received: by 2002:a17:903:2cb:b0:2c2:33a4:aaa2 with SMTP id d9443c01a7336-2c7fc9b9eeamr112189945ad.35.1782595737088;
        Sat, 27 Jun 2026 14:28:57 -0700 (PDT)
Received: from p1.. ([172.56.105.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f5b0499dsm63456445ad.34.2026.06.27.14.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 14:28:56 -0700 (PDT)
From: Xiang Mei <xmei5@asu.edu>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Weiming Shi <bestswngs@gmail.com>,
	Xiang Mei <xmei5@asu.edu>
Subject: [PATCH net] net: usb: net1080: validate packet_len before pad-byte access in rx_fixup
Date: Sat, 27 Jun 2026 14:28:54 -0700
Message-ID: <20260627212854.4025016-1-xmei5@asu.edu>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

net1080_rx_fixup() only bounds the device-supplied packet_len against
NC_MAX_PACKET. When packet_len is even it reads skb->data[packet_len] to
check the pad byte, before the skb->len != packet_len check further down.

A malicious NetChip 1080 device can send a short frame advertising a
large even packet_len (e.g. 0x4000), so the pad-byte read lands past the
end of the skb:

  BUG: KASAN: slab-out-of-bounds in net1080_rx_fixup
  Read of size 1 at addr ffff8880106c83c6 by task ksoftirqd/0/14
   ...
   net1080_rx_fixup (drivers/net/usb/net1080.c:384)
   usbnet_bh (drivers/net/usb/usbnet.c:1589)
   process_one_work (kernel/workqueue.c:3322)
   bh_worker (kernel/workqueue.c:3708)
   tasklet_action (kernel/softirq.c:965)
   handle_softirqs (kernel/softirq.c:622)
   ...

Reject the frame if packet_len leaves no room for the pad byte. Valid
even-length frames carry one pad byte (skb->len == packet_len + 1), so
legitimate traffic is unaffected.

Fixes: 904813cd8a0b ("[PATCH] USB: usbnet (4/9) module for net1080 cables")
Reported-by: Weiming Shi <bestswngs@gmail.com>
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Xiang Mei <xmei5@asu.edu>
---
 drivers/net/usb/net1080.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/usb/net1080.c b/drivers/net/usb/net1080.c
index 5d4a1fd2b524..364c19bd822f 100644
--- a/drivers/net/usb/net1080.c
+++ b/drivers/net/usb/net1080.c
@@ -381,6 +381,13 @@ static int net1080_rx_fixup(struct usbnet *dev, struct sk_buff *skb)
 	skb_trim(skb, skb->len - sizeof *trailer);
 
 	if ((packet_len & 0x01) == 0) {
+		if (packet_len >= skb->len) {
+			dev->net->stats.rx_frame_errors++;
+			netdev_dbg(dev->net, "bad packet len %d (expected %d)\n",
+				   skb->len, packet_len);
+			nc_ensure_sync(dev);
+			return 0;
+		}
 		if (skb->data [packet_len] != PAD_BYTE) {
 			dev->net->stats.rx_frame_errors++;
 			netdev_dbg(dev->net, "bad pad\n");
-- 
2.43.0

