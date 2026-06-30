Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140AA399341
	for <linux-usb@vger.kernel.org>; Tue, 30 Jun 2026 04:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782795093; cv=none; b=cHiJHp+7QtvzVKWBqxmhuGz5iIvK/VMebrOc6NEY1qkfJfCPagGuz96bw89oV5iopbgBViXGGJ33gRbTMcCVYvU8nODy4iOB9nYdAwblwyJ+ePO1O+Em2IRlzZvs5Es6CnLRCsCpzDUaFSfpGt5fxWBWu2nkyJnxqcs0caSJlKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782795093; c=relaxed/simple;
	bh=PujPPfMdGmHyDlkNHdLKC9VmWX14ZBNcw0Eb/Lc1ai0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cSz6+He6KFmSE9fmLIagbGVp0c4n5hSAPb58IaqEgRPz43+GvQ/P0VMUsl34V5Q6MPkfn686hDt/SZL2vPkXl20h4XqipwrT8jYyOzRPYc1bXohxPBiG5S6iGc+Qrr9Ht9NlPJNvfP2yh88vLNZvxTGh4g7jyerP/0/e3f0/MH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=BYFT93R8; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="BYFT93R8"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ca265d6ca1so1343885ad.1
        for <linux-usb@vger.kernel.org>; Mon, 29 Jun 2026 21:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1782795091; x=1783399891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u8majgDhsjuju8MljyfR5KkPklBqvXm945cQmfmoHoI=;
        b=BYFT93R8cqXRrt4Tr2VnKuOTaKLAsNSar8WFvL0LeWzqIBWxJLfSRz2Vn2R5sps4al
         mJUTGwWQ4mnlGor9AAic9Vt4BYbH3/0j2xmaSA4H6hhJk+Ak5YTPND2FhKehk7yhb3kK
         3n7qzoAumf2/mn6w8y6RRM2dF/AgnotRgn18zs4NNnyWYh4AQqMLpp8cZWLfKAtZahKx
         DoDdC1iCTzNCAmj4xAlDyV/w5xpmmZT0zRhj8tCey0ieUi4xxSFyCV50vxZpNHZVWXle
         04lHlhx0ycNbnTkpE1z1LP9xpt6jyWdhrYb9JHxTq2Xy/m8fCv0pTK3fYKRPNudjb9mR
         wylw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782795091; x=1783399891;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u8majgDhsjuju8MljyfR5KkPklBqvXm945cQmfmoHoI=;
        b=Fc96wicwVjdKxxfkacbyQFLnN9i+eC0f4u2LaDzcRbdRNWnftetgeWssWfGeFuf0w/
         hfQFKBy7PHqQUa9sFtLHGJVW5Q1j7k3mPS8VANiWscpLm4K6wsGSAcxJ0f0J2OSScldF
         ZU7o7fEe5O+OHl5fAWkhqYG+qmCq3JyIjGje9xi2gmzlXLQJLKgH0C/Qc2LxPY9nVkI2
         sh9L1aZNnukfpzJAvPHI3ZcMQIOVCctrzBxIfyFnMjtmpx/RKlbKUKTIpU7tEfkwnDlh
         vUjirdUEfp/hsaFNN8Tremez0380Iph516EaC6a1RM51Zk2OXa4eCVsZHI2QbXROjC3L
         Ivgg==
X-Forwarded-Encrypted: i=1; AHgh+RqEyfeg0l1lPETEapDIbjIzVMZms3T3LuJRqn9XZQcYgTdz1hYTfcePhY5orleir1FxeFCSEyKBYfM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNIMKQ5sbmRi8cGzmzv6ekOyona0AoW3gE+z7eB8zzS4/aPast
	ubjHKimR0T+66X1PjNet/poWJdHKFSby48j44qo4kgGEStoFSaUn8AYmgEG3HaAaSQ==
X-Gm-Gg: AfdE7cmoNQGEiP6tN18qM6mH4sZ4gzNA3Iu7yCAxHkwaqiWHgC47kBYRnaluavk4ZI8
	bugLDEQb85ot6mCaewv3iwEbJuKIE5ixBGxHJ+f6YRC/xEVzKhDFkM7Tmdh4MyO7Hl3+3yepSnP
	38X15xFbf8fS0MaktcC2wUMfuve3JSF2xvngxQzpKVKK3ocWOeytvoahQqpS5dSgNBrrxJrwWSH
	3nQVz6ojdtilne2ofueRpohQqTEbtYNzFxgrNz6Dmbio3CyYDS7lqMctjiaYGiHDe16dBlxGw/v
	+1UrV+I4FIhUzhfJXpYSTSB9cynpSuZTzmKHU25w8GBCArAdVQU9b2a8RFeagWs5vsEy3RT5Fsb
	l/NAw5uIJPmV10Gn0JUp599PuinFS4uZV1Lpl1Cp2wP0qNGXHkRz1uiuKk5H/d25lprE+zMh+Lk
	zoYn+wxo4e
X-Received: by 2002:a17:902:dac6:b0:2ca:feb:2aae with SMTP id d9443c01a7336-2ca44a1c9abmr2328505ad.21.1782795091214;
        Mon, 29 Jun 2026 21:51:31 -0700 (PDT)
Received: from p1.. ([2601:600:a402:c8a0:2cee:3f13:b030:dfb4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382acd0csm4972415ad.62.2026.06.29.21.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 21:51:30 -0700 (PDT)
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
Subject: [PATCH net v2] net: usb: net1080: validate packet_len before pad-byte access in rx_fixup
Date: Mon, 29 Jun 2026 21:51:21 -0700
Message-ID: <20260630045121.1565324-1-xmei5@asu.edu>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For an even packet_len, net1080_rx_fixup() reads the pad byte at
skb->data[packet_len] before the skb->len != packet_len check further
down, and packet_len is only bounded against NC_MAX_PACKET. A malicious
NetChip 1080 device can send a short frame advertising a large even
packet_len (e.g. 0x4000), so the pad-byte read lands past the end of the
skb:

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

Reject the frame when packet_len >= skb->len before reading.

Fixes: 904813cd8a0b ("[PATCH] USB: usbnet (4/9) module for net1080 cables")
Reported-by: Weiming Shi <bestswngs@gmail.com>
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Xiang Mei <xmei5@asu.edu>
---
v2: merge two validations into one

 drivers/net/usb/net1080.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/usb/net1080.c b/drivers/net/usb/net1080.c
index 5d4a1fd2b524..19f6e1222d93 100644
--- a/drivers/net/usb/net1080.c
+++ b/drivers/net/usb/net1080.c
@@ -381,7 +381,7 @@ static int net1080_rx_fixup(struct usbnet *dev, struct sk_buff *skb)
 	skb_trim(skb, skb->len - sizeof *trailer);
 
 	if ((packet_len & 0x01) == 0) {
-		if (skb->data [packet_len] != PAD_BYTE) {
+		if (packet_len >= skb->len || skb->data[packet_len] != PAD_BYTE) {
 			dev->net->stats.rx_frame_errors++;
 			netdev_dbg(dev->net, "bad pad\n");
 			return 0;
-- 
2.43.0

