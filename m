Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792548225;
	b=frFfTiyiAl1Wl9TGJWBTrgJ2hqcs2cKOcQfexYAB/LqmgVA2S5NCpuqFk5FaYTGRsPWb
	 tmbrSDIZ88wc4pHgKSEt4KgTUCVJY1laBdSDqcCVVoZDFje1TYOZP4EyXCWRm2RJGHjws
	 PCvl0nDtJorCEN7Jl+cKH5b8yvdP1Af+/A70OVw469DVWildwn6M3vCUuX+hMAaFijTze
	 hwqfos43MnbtlI8YcWPUT5Iyk5pxHTt023V4LYiFdMA0fn+SEQjQKxHtzoRmPhrubrYSE
	 UTfvEKqemmdzCfGLAoTYgyCQ1cD2KwI5XPc39C91NfMJHSDVYREnAqKsRSTCpQGrMjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792548225;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=leSND+5gisN5Md9k6LWpzUNyWGXK/I4NhOs2RkfudTI=;
	b=QFAT7PGWXH/P0/XBSby85e/hl49oGNkwGp7DtTtYjT+SOgH3TwG/1t8UD5guvBosy5n8
	 lwMtBn/qt3ccaAbR5os2T0yMv+K2A1+OR5LWfUIDTpd/v4DsPNnrQT8qQo6ns3dgnO8Wx
	 pXhlXpIqbhP1LEggtheQfq4IZFYfHZ85peek8UDdBwCfSwfNm2WpL/EWZ7L0046WyIcvQ
	 DrAKVHXX+08Bw1PyAXI+LUq+lMHvFoRD/gT1O10/LVFjqhlZCpLqi5e7/xuvPfvxgovXI
	 W5ufGcXvMMNpLVrBNt1vBwoa17JAwp0Tgpm62edEK5JWd9uMxFIOCOLc51V8rxsKPQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gt.tech.gov.sg;
	spf=pass smtp.mailfrom=gt.tech.gov.sg;
	dkim=pass header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.a=rsa-sha256 header.s=google header.b=KyhcQuTT;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211F6606A319
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 02:03:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 211F6606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.a=rsa-sha256 header.s=google header.b=KyhcQuTT
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3acb512a7a0so154747a91.1
        for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 19:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gt.tech.gov.sg; s=google; t=1792548224; x=1793153024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=leSND+5gisN5Md9k6LWpzUNyWGXK/I4NhOs2RkfudTI=;
        b=KyhcQuTTzpKqbvaknksf7utJsW06DxxLx4QaDlffYH4qt+I/ETuSR2uThYMvmk1veb
         5oxIgT6jmJiE5b6tNj+sNcOQmBF9p0UT55GNErw3tlvsQVtD+txBcJA93+T/YT+HIhEP
         jkbyvCZGDqcw29GFSQD1rx3XkNXqwrdi4MJSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792548224; x=1793153024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=leSND+5gisN5Md9k6LWpzUNyWGXK/I4NhOs2RkfudTI=;
        b=HagMFKBTWd3heF2QjE94MtvFJLQO9eWAcUS6IWo48u/b8xSlMHRQLWzBhj7NGoC4/8
         dvy9q7NH+4Mii4i+z0zm3uNrcdF26/UUR3hhR1W4Y/B4gaIPsMkkPhOvpzLsv0Ropozf
         pywRqAEW4wZCsy38Siv171pa0QVPaVqFO4sETegAeXXX7UjKJ2XxBDc3Cqw4ykAc6GDa
         npMPReAp0xJc3WCFyN63H9F57Cw9+OvwZi3A5BzLbxHn4IoZo3z7p9ua8pdh97zEX50h
         5eYQHyGRYw3DT+PwGxGIAHfcKBHtN0wMrWsd3J460y9P5MWafSWjug7i37Uy+rlCLC1x
         09hw==
X-Forwarded-Encrypted: i=1; AKwUvByb5HZ0x8Wq+tfmze8ZS2yBBwpSKninVVOaagD5edGqnOwTTTGJgcaYA59bc85qw11r1ZkZION+aTI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKLV28Ls1rqDerFSM47pUSTND3g/rKTyzQfzrYnBYfwue0BMlv
	kB7a2jnif+9rENTG5Dt0OtrZUzRxca6/X4GqnqxfojaW7BNemYIKrBzBuS9cWKIJLZA=
X-Gm-Gg: AYBFou3LpBW9Y+J3p8kaoTVr/WGnXzM3g3ulIuXAeJO3QpL7UeJwiqm882yNO92c84y
	oo8mALNVYos0A4GER8htbqBLLMtX/z3YkD0h36MavDXvKzoe0tZ6v41ZeSA6jZBaTWfcbMxwmYd
	o3oNwvhT6I4OkfEGzrq/kY3XcR/5JxPbvl3oa5t95pmOdd0FLxMB8hlcMdCvxtT3K6mqMhcXmMM
	0a+pAH3MyAm/K9ozPqYm5KykCkvdjeGPU/LhVd2jyX1dQb8GdA8d7dgcxb5fCYi5kOjJ1FOLrwK
	kkYocc3Qn2/Cy+C45U+XU619A5W8Rq71Vbvf2E4UxNoG7DWGIShd8ZOVYsf68BvW/6fOWbjTD1Q
	yGSLLj3jVK6/ORJEB9WBFtkvBwZ6bOVACsllKhsF1HXUA/Ii0lUklaeRIxQaSzcVvhgVLtDyXai
	I3H+IGHqhl37gS3HqQGsbmD5RQ6oJoU6osmGfRdbP5csK+sHYa/j0q/elkoUNY+tYwMRtrO4C8/
	yHgjIPIb7Bng1WXL5MOXV77HcL5Xt59TxiQouM+TxFQqYzwntlw4+LQ18RMcwofP+AIV4VjPbEg
	rM625Skxzw==
X-Received: by 2002:a17:90b:4b11:b0:3ac:83c1:2c0 with SMTP id 98e67ed59e1d1-3ad86cdda5cmr529688a91.64.1792548224392;
        Tue, 20 Oct 2026 19:03:44 -0700 (PDT)
Received: from LAPTOP-UUUVNN1I.localdomain ([203.125.131.137])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad8035a117sm1934124a91.16.2026.10.20.19.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 19:03:44 -0700 (PDT)
From: Wei Jie Law <law.wei.jie@gt.tech.gov.sg>
To: Petko Manolov <petkan@nucleusys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wei Jie Law <98lawweijie@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net v2 1/2] net: usb: pegasus: do not advance rx_skb->data on dropped frames
Date: Wed, 21 Oct 2026 10:03:09 +0800
Message-ID: <20261021020310.34045-2-law.wei.jie@gt.tech.gov.sg>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021020310.34045-1-law.wei.jie@gt.tech.gov.sg>
References: <20261021020310.34045-1-law.wei.jie@gt.tech.gov.sg>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For the 0x8513 chip, read_bulk_callback() skips the 2-byte receive
header by advancing pegasus->rx_skb->data in place. This is done before
the pkt_len > PEGASUS_MTU check, and when that check drops the frame
the goon path resubmits the same skb with the advanced rx_skb->data as
the transfer buffer, still PEGASUS_MTU bytes long.

Every frame with an oversized length field therefore moves the receive
buffer two more bytes towards the end of the skb data area. A device
that keeps sending such frames makes the host controller write received
data over skb_shared_info and past the end of the allocation, and the
corrupted skb_shared_info is used when the skb is eventually freed.
With an emulated device sending frames filled with 0x5a on a KASAN
kernel:

  BUG: KASAN: slab-out-of-bounds in dummy_timer+0xade/0x3f00 [dummy_hcd]
  Write of size 1536 at addr ffff888105821202 by task swapper/1/0
  ...
  Oops: general protection fault, probably for non-canonical address 0xeb4b474b4b4b4b4c: 0000 [#1] PREEMPT SMP KASAN NOPTI
  KASAN: maybe wild-memory-access in range [0x5a5a5a5a5a5a5a60-0x5a5a5a5a5a5a5a67]
  RIP: 0010:skb_release_data+0x36f/0x800

Only skip the header with skb_reserve() once the frame is going to be
passed up, so the receive buffer always starts at the beginning of the
skb data area. Unlike the old pointer adjustment, skb_reserve() also
moves skb->tail, so the two header bytes now count against the buffer
size: lower the length limit for the 0x8513 accordingly, otherwise a
pkt_len of PEGASUS_MTU - 1 or PEGASUS_MTU would trip skb_over_panic().

Found by code review with LLM assistance and reproduced with an
emulated USB device (raw-gadget + dummy_hcd).

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Wei Jie Law <law.wei.jie@gt.tech.gov.sg>
---
 drivers/net/usb/pegasus.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/usb/pegasus.c b/drivers/net/usb/pegasus.c
index aba1a640fc26..7c7d6b69998f 100644
--- a/drivers/net/usb/pegasus.c
+++ b/drivers/net/usb/pegasus.c
@@ -461,6 +461,7 @@ static void read_bulk_callback(struct urb *urb)
 	u8 *buf = urb->transfer_buffer;
 	int rx_status, count = urb->actual_length;
 	int status = urb->status;
+	int rx_offset = 0;
 	__u16 pkt_len;
 
 	if (!pegasus)
@@ -510,7 +511,7 @@ static void read_bulk_callback(struct urb *urb)
 	if (pegasus->chip == 0x8513) {
 		pkt_len = le32_to_cpu(*(__le32 *)urb->transfer_buffer);
 		pkt_len &= 0x0fff;
-		pegasus->rx_skb->data += 2;
+		rx_offset = 2;
 	} else {
 		pkt_len = buf[count - 3] << 8;
 		pkt_len += buf[count - 4];
@@ -522,13 +523,14 @@ static void read_bulk_callback(struct urb *urb)
 	 * If the packet is unreasonably long, quietly drop it rather than
 	 * kernel panicing by calling skb_put.
 	 */
-	if (pkt_len > PEGASUS_MTU)
+	if (pkt_len > PEGASUS_MTU - rx_offset)
 		goto goon;
 
 	/*
 	 * at this point we are sure pegasus->rx_skb != NULL
 	 * so we go ahead and pass up the packet.
 	 */
+	skb_reserve(pegasus->rx_skb, rx_offset);
 	skb_put(pegasus->rx_skb, pkt_len);
 	pegasus->rx_skb->protocol = eth_type_trans(pegasus->rx_skb, net);
 	netif_rx(pegasus->rx_skb);
-- 
2.43.0

