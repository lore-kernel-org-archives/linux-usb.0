Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA994341660
	for <linux-usb@vger.kernel.org>; Wed,  2 Sep 2026 14:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788357704; cv=none; b=CU4AHepeMOhO6QSQ7rydp948oaR2WyFgRmC65DY+MIs1Z8I7DsbP5lJY44f9rOmyxd0PI16mhPfkiX0q301wX2Bg13C7GiRiL5Sztp2UczNjIwLyts6yAor5vu6DLVUdYollzjYSBmjG9vUBHtzFCldAE/oOd3gvyJCYVqabOxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788357704; c=relaxed/simple;
	bh=GrBpyGcVJzqkbcWWLIRSNdunCJywZEdwoy8QHo7jyB8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=dlKttLM3TJVO+nHDOepq4/YPPN/cJ0ZmRZ8Div1WJLdqx2C2XKdiy29kfT/qhCIuXTVcoISD3WoJwLx7Xw3tAk0oV4lDy+j/xi3duwzxdjTJf71/9bcMC6MJ7to9JrP46VFiBysGtEwyDEm2s6H3IQnq0WogrGu6HVQ72C1VNQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d6MFb+xn; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d6MFb+xn"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49b8f86c6deso6971825e9.0
        for <linux-usb@vger.kernel.org>; Wed, 02 Sep 2026 07:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788357701; x=1788962501; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1Ui+4lieBbCtA1qQ4dFfjrsN1UhRyAu34VpfZvML9Uc=;
        b=d6MFb+xny5vYVQ0NE+jsNLoqk8GULVml/AqwJuStQzOdrCog/qWJwGGaT5O4dagaeI
         80BQ/nBLI7d5BSsfiboew9qz9nMp2pf1jiXJXxzzCaK6CUz0x+hBUt98ap6lmrXlYULR
         TT08jsdExqq6bTHIqreoCYaWPkq+PPDYLtMdR7J+M6vgoUXhnnK3Z4pgmqJ+rTvK0tKH
         mkH6iTSBn0+ulNfcK1kB6lTI7AxGxcRSoaxGerrkTPQrsuLb9YTcaSZ1GGzRtnNzvkG6
         tIdsOf8HbBuFl+VQDnlP2rUg98mHwgUDNQAl/Fd8qVbtiKvWN4AeyKJ7vGlrx/gedMw2
         foTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788357701; x=1788962501;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1Ui+4lieBbCtA1qQ4dFfjrsN1UhRyAu34VpfZvML9Uc=;
        b=r4PhGenK0O80lafnZ+PmBu5wWf9XLW7gdIhWHJTVnXX2wFHqvdEFJaMbJVRdMyZfo0
         vQh6x7QkuvsGLj6k07A9EE/oZtBRMFcRDRPtoYdV6ZAZIU7GQ9ktWrOfxLGZqMt1iWQO
         I9bhgylJ/LJuurB1rTRtvV/GPvYIxCaCHFG7c2tGcpbiMrMeUOyjSCv3226ech8kFR2Y
         IhuyEW3wydblz+Vie8Q3erYQSKjjsZIoGfxkOSYOQTmaKlJwsKO+ZJGqNqNX0cdC0hj2
         bhsLNVlSWcJ91gP073OVAyzHqaMWM+o8lK4j4uyIKwdKmGOL2IbyA5HgNI8d8XRUZ2Uk
         SSlQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqgw9cXX7bMNVXn5D4rNK3vSVkIhgcP+H8kATMHVGZOC/1k3Hx6u8YYHcg8VmMxiLE8lnzr5/KMXnA=@vger.kernel.org
X-Gm-Message-State: AFuF++nWclrUcy1PgwJJhX9/gTaR88UX2JrF2Bb7Ca9NmPROhFyyauTQ
	BlWsKkTJRPBGKHXb/Y+6ai38omHLMdgozi7eRwO7vMEqRAwTYGBRAxjr
X-Gm-Gg: AR+sD13CcHg94yfW8RcXJ8oPLHQorMvFeTMxACfQixpRMTiKK7st+Wor133xxRcMGBH
	JUxk8wxk6Ve18/PVJX8Xqk0Gr3nayPoqikDroX6oQo/THSW+M8L5QR4FcivcrvZ+6XTWulS7kj6
	lNLnhf25O8aBpjLsn7dzzPpTxE9H4LGabRARLbUqRJAx6r83r6r/VhiwuIvBOUDESQ6qHQKSqto
	7837N6u4BAY7H7CGXH26zN9fNXKHOj2AbEy5ytOw84Hlvq6eQ7WOpccu7q2U243izrjdv5oeYU9
	qq1qqG4Xn6JocgWfimyFjnMAhX9GGYb7nWj3KOTc+aACNcEuY+9q/+/TJFQfewFrHIilbi2bRIP
	fhWiw0RdV3Lh7OzcXbrLATaIe9DH135pym06rShBCZlxWLzuPGjRZ5l/nEXCVxHRszWzLYJhRrs
	mkZCNcDUQ3ijCJx/LSfNPHbxa9TGeVFyb4GDyuPOdU5f8voYsNnvPloVr56ba7JFrjm49JqfN6n
	FQXpYB+vpyI+FLqJr8uAg0I+Fa+2YR24YwiAZGgt9zW8HRqtskXYQx6mMaIAQ==
X-Received: by 2002:a05:600c:5653:b0:49c:eb17:cf3b with SMTP id 5b1f17b1804b1-49ceb17cff4mr33383645e9.8.1788357700453;
        Wed, 02 Sep 2026 07:01:40 -0700 (PDT)
Received: from valmpani.valmpani (athedsl-11462.home.otenet.gr. [87.202.45.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448ed37c4sm5737176f8f.21.2026.09.02.07.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:01:39 -0700 (PDT)
From: Vasileios Almpanis <vasilisalmpanis@gmail.com>
Date: Wed, 02 Sep 2026 16:01:17 +0200
Subject: [PATCH v2] ihex: Fix 16 bit truncation in ihex_binrec_size()
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-ihex-v2-1-30bb117cfc77@gmail.com>
X-B4-Tracking: v=1; b=H4sIACwsmGoC/12NwQ6DIBAFf8XsuTTCAbSn/kfjQWCRbao0oMbG+
 O8Fe+txknnzdkgYCRPcqh0irpQoTBnEpQLj+2lARjYziFrIuq0FI48bk0LLRisUukfI6juio+3
 MPLofp0U/0cxlWwxPaQ7xc/6svHh/yZUzzqRyVrvGtsq5+zD29LqaMEJ3HMcXjMXeTqoAAAA=
X-Change-ID: 20260902-ihex-62b68b7e2bae
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, 
 David Woodhouse <dwmw2@infradead.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Cc: Vasileios Almpanis <vasilisalmpanis@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788357698; l=2048;
 i=vasilisalmpanis@gmail.com; s=20260731; h=from:subject:message-id;
 bh=GrBpyGcVJzqkbcWWLIRSNdunCJywZEdwoy8QHo7jyB8=;
 b=l8sqiieZ9Ddp5ed281SWARCVGJt9uTvPylHrUjIJ260ewyvnRcfkRuN4zpyiHsjRIUnQzk/Ld
 HZgIlUytZOnDy6iYwq+cAJy/vjnghn+TDcY5iw31K2v9ud9clumCd+p
X-Developer-Key: i=vasilisalmpanis@gmail.com; a=ed25519;
 pk=gn5Uo6yL8Tlpq5uATxA3nqoq+U8eWLRbjD+bOk0qSpU=

ihex_binrec_size() returns uint16_t while computing be16_to_cpu(p->len) +
sizeof(struct ihex_binrec), so record lengths of 65530 and above wrap.
__ihex_next_binrec() uses the result as the offset to the next record. A
length of 65530 gives an advance of zero, so ihex_validate_fw() spins on
the same record forever. Lengths of 65531 to 65535 advance by 4 or 8
instead of 65544, so a 14 byte image passes validation while its first
record claims 65535 bytes of payload. emi26_load_firmware() passes it to
emi26_writememory(), which kmemdup()s 65535 bytes out of a 14 byte buffer
producing the following splat:

  BUG: KASAN: vmalloc-out-of-bounds in kmemdup_noprof+0x3b/0x50
  Read of size 65535 at addr ffffc90000075006 by task kworker/11:1/174
  Workqueue: usb_hub_wq hub_event
  Call Trace:
   <TASK>
   kasan_check_range+0x10f/0x1e0
   __asan_memcpy+0x23/0x60
   kmemdup_noprof+0x3b/0x50
   emi26_writememory+0x29/0xd0
   emi26_probe+0x2d1/0xb64

Return uint32_t so neither the addition nor the following ALIGN() can wrap.

Fixes: 9fb4ab4d3dd6 ("ihex: Simplify next record offset calculation")
Signed-off-by: Vasileios Almpanis <vasilisalmpanis@gmail.com>
---
Changes in v2:
- return uint32_t rather than size_t (Greg)
- drop Cc: stable
- Link to v1: https://patch.msgid.link/20260902-ihex-v1-1-67fdbf8d97ff@gmail.com
---
 include/linux/ihex.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/ihex.h b/include/linux/ihex.h
index b824877e6d1b..04be83fb0d62 100644
--- a/include/linux/ihex.h
+++ b/include/linux/ihex.h
@@ -21,7 +21,7 @@ struct ihex_binrec {
 	uint8_t data[];
 } __attribute__((packed));
 
-static inline uint16_t ihex_binrec_size(const struct ihex_binrec *p)
+static inline uint32_t ihex_binrec_size(const struct ihex_binrec *p)
 {
 	return be16_to_cpu(p->len) + sizeof(*p);
 }

---
base-commit: 89a312991dc6e638a36adc43ccb91dbc25504c04
change-id: 20260902-ihex-62b68b7e2bae

Best regards,
--  
Vasileios Almpanis <vasilisalmpanis@gmail.com>

