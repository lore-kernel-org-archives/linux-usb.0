Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CBC367B98
	for <linux-usb@vger.kernel.org>; Sat, 27 Jun 2026 20:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782593641; cv=none; b=tBcPbeztCtV5Ny9FZfuL80N9aJofYeii9WGGIfP7+RvEIA6O3Ef5O1KvJMX0mnStcsBGR+tRDITsvCzjRlQ89VHx7lnt2lkRJQxQmWJ1xUXUZyPlyYr5H5cEXHfkwL5/VL0n0vxFJV4IY76JdwLgGCCkcGeMxYM5rnxONdE4TlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782593641; c=relaxed/simple;
	bh=e7wQOCZ2RmUk/JLlzqi8q5dvkrkwEKZp/vsqcgT7OlY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZQfUjVUMCrpijfaaTrKLtbRYkB0Ex3VfEYGFSnyA1CtfPCdSnN0UY85uIY7BX77XnM9GTn+aMJmbo5Zmqc17pACT8Qj9qoroP1BZEugT5ZEQcihF52VdRBC7cUJLNK91LJkY6h20Zex1UeLM7LOh6DXArVEuZTzi92Bk1/gYGvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=DOKTrW8b; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="DOKTrW8b"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-845c38dee22so985224b3a.0
        for <linux-usb@vger.kernel.org>; Sat, 27 Jun 2026 13:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1782593638; x=1783198438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eHRjizZyH2fQDJvnCRDCcWYlVrs6WnvhUFm2dNj9VHQ=;
        b=DOKTrW8bzAoY0Yzfb1G1m3Wqgq7mfZ8C5ctzuUMu3uRxZ37zUjJmGmR3+3bVFcRSw8
         MdjKkP/+cH+ZJqM7mcp6dFnEzqwpn+HU56zoWEc0Wm53TCpSvxdrAYSpaxnUnS2xUNDT
         LthQpw6RFVv6fojSRBKsmVkOMoh/ZF9lSDCxGG9ppMrACmPE3TWsuYTXk1hYRHcypFkO
         8KgcQZh137rNvvZ7I0KOuxF4hDknZRwbsHy/SRnmjsODxwbO48JoKJodyPSiyouDN/ns
         sp5j6CXpqE6lkdBZkOhG3G2gaF+oKFQbWUP3EHwFLJSp2VRqbFTDE5PPNehgsmjFQY4n
         RFkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782593638; x=1783198438;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eHRjizZyH2fQDJvnCRDCcWYlVrs6WnvhUFm2dNj9VHQ=;
        b=Nq460uo5H2j1czYzV3F+z3khlju+ACoqAe9javF/o3WWvZ1gY4iYITm8/K4WUe118D
         6cW0co4nXtceRcMVRFEhj97p6PEW5kT/N5H37VbfPkyx5OO0X6c5nnB4GHN+UyX3nyYJ
         /Ad3DW+TYka1DbCd/T4bCsJYkdnnoIEN5BTIZdJrbjEQKip1Dicn0i41IaTTE+LwEZQ/
         hEj8vxs8ANfpxjEuh6XpucAKIsmQrSiwFI+k+4tqRXYkXAyE1AYkoy1vSvZAAJaQSTzZ
         +oYTJJzJOd5yfeKbRUaUkpkWud0ppQh0q1uviXHPDwcesgFRNZPKyHFEostmhlNlWRjq
         75+g==
X-Gm-Message-State: AOJu0Yy0uxBGKvj0AdZ79BmfkDB+HodW8tzyJAFMbqSdJkvnYlGsXH+X
	jiBuoVPHk28g2FaZ56ti/R5SU0UnDgp5JD8O8raRkNzN0zrUyjUYdpXEM2AZt6+Bmg==
X-Gm-Gg: AfdE7cmRmUVUsAHEYb2cOx0cJk//uCWzLsqxxLLuALK2MLgdXkkgBqNHeV3s/fqEW5i
	Pm3dGYbaDYsKktcezVNwnVi/gbBoLxUxQPqUVIXD/J0P0Hm6QTVO86J7ABkvOLVnhEvM5+GGlsD
	LGLlc6ekX/QOPa2KVhw/z/7RhovsC7baA87N2XLQCbwuoLCqLrjLd2CCBYl7S0zXlmdF6LtcsWn
	CFgKEJLyCEDy5TBYFSVZeGJuK36qoJa3p9HLbYZmR2HoqjKdysPISgIctOI75jYrAec+zbn/XnG
	36fK1JqbopYIX38nko72mmUgUIqcWUYJTjiakseYRBVPAhreC+T+xwwRW+UPAjeWGHU5wPvM9LM
	MEyyNrpb66rf6r6gZLOq34rQsFG4hq9BHeKr0uz8KmG4nvAtKxt5rMn9fEUFRhjHQxVC86a3Zqx
	WSqT6aRIQ=
X-Received: by 2002:a05:6a00:c87:b0:845:a302:2281 with SMTP id d2e1a72fcca58-845d25fb441mr4561069b3a.35.1782593637421;
        Sat, 27 Jun 2026 13:53:57 -0700 (PDT)
Received: from p1.. ([2607:fb90:ec0d:cc1e:95f8:260b:6b05:f94])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a4127bd0sm8822715b3a.53.2026.06.27.13.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 13:53:57 -0700 (PDT)
From: Xiang Mei <xmei5@asu.edu>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Weiming Shi <bestswngs@gmail.com>,
	Xiang Mei <xmei5@asu.edu>
Subject: [PATCH net] usbnet: gl620a: fix out-of-bounds read in genelink_rx_fixup()
Date: Sat, 27 Jun 2026 13:53:53 -0700
Message-ID: <20260627205353.4000788-1-xmei5@asu.edu>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

genelink_rx_fixup() splits an aggregated RX frame into its individual
packets, using a per-packet length taken from device-supplied data. That
length is only bounded by GL_MAX_PACKET_LEN (1514); it is never compared
against how many bytes were actually received.

A malicious GeneLink (GL620A) device can therefore send a short URB whose
header claims packet_count > 1 and a first packet of up to 1514 bytes.

	skb_put_data(gl_skb, packet->packet_data, size);

then copies past the end of the receive buffer and hands the adjacent slab
contents up the network stack, an out-of-bounds read that leaks kernel heap.
No privilege is required: the path runs in the usbnet RX softirq as soon as
the interface is up.

  BUG: KASAN: slab-out-of-bounds in genelink_rx_fixup (drivers/net/usb/gl620a.c:112)
  Read of size 1514 at addr ffff888011309708 by task ksoftirqd/0/14
  Call Trace:
    ...
    __asan_memcpy (mm/kasan/shadow.c:105)
    genelink_rx_fixup (include/linux/skbuff.h:2814 drivers/net/usb/gl620a.c:112)
    usbnet_bh (drivers/net/usb/usbnet.c:572 drivers/net/usb/usbnet.c:1589)
    process_one_work (kernel/workqueue.c:3322)
    bh_worker (kernel/workqueue.c:3405)
    tasklet_action (kernel/softirq.c:965)
    handle_softirqs (kernel/softirq.c:622)
    run_ksoftirqd (kernel/softirq.c:1076)
    ...

skb_pull() already verifies that the requested length fits the buffer and
returns NULL otherwise. Move it ahead of the copy and check its result, so
a packet that overruns the received data is rejected before it is read.
Well-formed frames, whose packets are fully present, are unaffected.

Fixes: 47ee3051c856 ("[PATCH] USB: usbnet (5/9) module for genesys gl620a cables")
Reported-by: Weiming Shi <bestswngs@gmail.com>
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Xiang Mei <xmei5@asu.edu>
---
 drivers/net/usb/gl620a.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/usb/gl620a.c b/drivers/net/usb/gl620a.c
index 0bfa37c14059..09afd137b64e 100644
--- a/drivers/net/usb/gl620a.c
+++ b/drivers/net/usb/gl620a.c
@@ -104,6 +104,9 @@ static int genelink_rx_fixup(struct usbnet *dev, struct sk_buff *skb)
 			return 0;
 		}
 
+		if (!skb_pull(skb, size + 4))
+			return 0;
+
 		// allocate the skb for the individual packet
 		gl_skb = alloc_skb(size, GFP_ATOMIC);
 		if (gl_skb) {
@@ -116,9 +119,6 @@ static int genelink_rx_fixup(struct usbnet *dev, struct sk_buff *skb)
 		// advance to the next packet
 		packet = (struct gl_packet *)&packet->packet_data[size];
 		count--;
-
-		// shift the data pointer to the next gl_packet
-		skb_pull(skb, size + 4);
 	}
 
 	// skip the packet length field 4 bytes
-- 
2.43.0

