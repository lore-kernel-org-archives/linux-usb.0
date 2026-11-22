Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.88.97.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795345803;
	b=wFqX1xuN1fFuM+uJy7/1DaQqHD6339v5XG0zVLC7oa7Awedc1hB4TGoSk9Rnolnn++wJ
	 g0U7IVx2JF+zrj7H3+yPzX+RUc7LWlOoAimwxxBS7r8DMyEg/TdDtXQBTTk+/RxX2ZQGx
	 VwwUDtOovm5lOrSMW9TwtMpRt0iw+g6s5pBEHVRRVKzfWB3ktP/BuQ5cEQLFFoeYu0B6q
	 ibHHLr521dy+sMujutSUPz9w5+tMrSpANzYdhkmZeAZFYDt8WiuYFFWLpjFiD40QIy/ko
	 7dNEjzrxEPv5Zf1P08hKt3CYHDVfRIrHl4SFS55bPrNVoxyLWK54Pt0dwzXbSey5IWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795345803;
	h=DMARC-Filter:DKIM-Signature:Received:X-Spam-Checker-Version:
	 X-Spam-Level:X-Spam-Status:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=14rHkK05+hQDO7nL3bl21/HruTK6z+DkDIpc+CW53/Q=;
	b=V699leb2ir4C3HR1jACGLPo8nVVq3xa4gnWYT6Tf5rpkN9FXuRk0Nx3NUNtkaE07+A3L
	 FloVlSDyEcH939q3zfz8OBTGXC0vVrxgiAk+AAK94qSMwBy4iM7ASDodg/6wS4nnyo6FR
	 IAJSoz1t93tsMPc1hFU55UCT49WJL3O8FYCGPxc3N/xum2s68meEy6sfw028gOf4XZcnr
	 dl+bQsMpKaFjbeIylnEtuVCkrlTZCa3cEXAUQ2iJG25zQUNWE5d1pqh9/tJlaITJElp5d
	 2HsxfXHo04eDzM2JfL6T3sdLNZmTCPPDunIegs92bZFUpEwG8ulM05upDnoVmGTYctg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=birger-koblitz.de;
	spf=pass smtp.mailfrom=birger-koblitz.de;
	dkim=pass header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=YuHaxkWB;
	dkim=pass header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=pOXY9m1A;
	arc=none smtp.remote-ip=23.88.97.239
Received: from bkemail.birger-koblitz.de (bkemail.birger-koblitz.de [23.88.97.239])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25231606A320;
	Sun, 22 Nov 2026 11:10:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25231606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=YuHaxkWB;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=pOXY9m1A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1795345801;
	bh=ymj7MAkBcV45hFwZSpLKDoqfKGoaOxQ+nILlbmgV56E=;
	h=From:Date:Subject:To:Cc:From;
	b=YuHaxkWBt1/shJCYDIdIlnLCbO31chRs8iw+njvo2ymqxUC0yAMGUQ3aRW5vHLqfn
	 TtkgwMHebjtSuzepjvBVgwdkMnOM0C5LE9uof8max/ns6RbGPKA99RG/pv/tBkl7xm
	 lkfkvSRw+C/ECDTK2sESBQibMLVRRaKwpJiQhEomwEXUO5FbGFWtD7//bFNUGWi0R8
	 CZb6D2zyiQxULCuKZ8030yFbiX3NG+0+tPUF+km359COmhDvvARi6gQKzRCX4wfT/H
	 bcStl/QLauOvKLhzNqxtviVcnb6OlsyF7CODeyyI8CVyM8u2fg12uZ31pAWBt7GVMA
	 w627DTVJU6+vA==
Received: by bkemail.birger-koblitz.de (Postfix, from userid 109)
	id 4786C495AB; Sun, 22 Nov 2026 11:10:01 +0000 (UTC)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1795345800;
	bh=ymj7MAkBcV45hFwZSpLKDoqfKGoaOxQ+nILlbmgV56E=;
	h=From:Date:Subject:To:Cc:From;
	b=pOXY9m1AnykDY9zddTniqYZHmZf/ul4v+FZ4y8pfoB5LcqZRgDYVP5IGyY/LNl1b4
	 1PpkF60HwL3Ck+ngk1ZprhrYxnyYYVQnZHEGZhyre9ejk0mrSBaWGwCUd+DeUN+lm5
	 fM0bBTeEJxvi53Vwco2SiEIp18MztJliFiIDD78m55KEi+rVFvmZSj5shivBo5jCxD
	 pkjcxszFo8v+nL3blAD+XFrLsgAptSddG648WgXVLM+dgZYHoS6FM9yyoM/zWP7Qb0
	 37e76SYIEi4k8nj7QUJJzkYzx9B/xr4+g9EB88j+7930HbjrMcf45cugKNgg5xrMfy
	 3XkNi7V9mkl3Q==
Received: from AMDDesktop.lan (unknown [IPv6:2a00:6020:47a3:e800:271c:c6c5:9fde:77cb])
	by bkemail.birger-koblitz.de (Postfix) with ESMTPSA id 2D90048BCF;
	Sun, 22 Nov 2026 11:10:00 +0000 (UTC)
From: Birger Koblitz <mail@birger-koblitz.de>
Date: Sun, 22 Nov 2026 12:09:49 +0100
Subject: [PATCH net-next v2] aqc111: Fix rx/tx_fixup issues
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261122-aqc111-v2-1-52d5ddb17a37@birger-koblitz.de>
X-B4-Tracking: v=1; b=H4sIAH3NAmsC/12NwQrCMBBEf6Xs2ZUm1EY8+R/SQ5Ju20VJbBJCt
 fTfDTl6mWF4w8wOkQJThFuzQ6DMkb0rQZ4asIt2MyGPJYNsZS+EUKhXWxxNa6euvY5K9QZK+R1
 o4q0OPcBRQkdbgqGQhWPy4VMfsqj8fywLFCiVvnS2M0X03XCYKeDTmxen73kkGI7j+AE/+A5cr
 gAAAA==
X-Change-ID: 20261117-aqc111-b0cf408d776b
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@kernel.org>
Cc: linux-usb@vger.kernel.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Birger Koblitz <mail@birger-koblitz.de>
X-Mailer: b4 0.14.2

The MAC supported by the aqc111 driver is very similar
to the AX88179A. During the development of the driver for
the AX88179A, the following issues in endianness, respectively
alignment-handling were found, which are also present in the aqc111 driver:
 CHECK   drivers/net/usb/aqc111.c
drivers/net/usb/aqc111.c:1094:34: warning: incorrect type in argument 1 (different base types)
drivers/net/usb/aqc111.c:1094:34:    expected restricted __le64 const [usertype] *p
drivers/net/usb/aqc111.c:1094:34:    got unsigned long long [usertype] *
drivers/net/usb/aqc111.c:1122:45: warning: incorrect type in argument 1 (different base types)
drivers/net/usb/aqc111.c:1122:45:    expected restricted __le64 const [usertype] *p
drivers/net/usb/aqc111.c:1122:45:    got unsigned long long [usertype] *[assigned] pkt_desc_ptr
drivers/net/usb/aqc111.c:1235:22: warning: incorrect type in assignment (different base types)
drivers/net/usb/aqc111.c:1235:22:    expected unsigned long long [usertype]
drivers/net/usb/aqc111.c:1235:22:    got restricted __le64 [usertype]

While sparse complains about lack of the use of __le64, these spots also
incorrectly handle alignment. Fix these problems by introducing __le64
where necessary and additionally make use of get_unaligned_le64/
put_unalignged_le64().

The current code also incorrectly modifies the skb buffer without checking
it was cloned, possibly corrupting a shared buffer. This issue is also
fixed.

Finally, also introduce a minimum lengthe check for packets as the packet
length is received via a USB transfer and may be incorrect.

Fixes: 361459cd9642 ("net: usb: aqc111: Implement RX data path")
Fixes: 4a3576d2bcc7 ("net: usb: aqc111: Implement TX data path")
Signed-off-by: Birger Koblitz <mail@birger-koblitz.de>
---
The MAC supported by the aqc111 driver is very similar
to the AX88179A. During the development of the driver for
the AX88179A, the following issues in endianness-handling
were found, which are also present in the aqc111 driver:
CHECK   drivers/net/usb/aqc111.c
drivers/net/usb/aqc111.c:1094:34: warning: incorrect type in argument 1 (different base types)
drivers/net/usb/aqc111.c:1094:34:    expected restricted __le64 const [usertype] *p
drivers/net/usb/aqc111.c:1094:34:    got unsigned long long [usertype] *
drivers/net/usb/aqc111.c:1122:45: warning: incorrect type in argument 1 (different base types)
drivers/net/usb/aqc111.c:1122:45:    expected restricted __le64 const [usertype] *p
drivers/net/usb/aqc111.c:1122:45:    got unsigned long long [usertype] *[assigned] pkt_desc_ptr
drivers/net/usb/aqc111.c:1235:22: warning: incorrect type in assignment (different base types)
drivers/net/usb/aqc111.c:1235:22:    expected unsigned long long [usertype]
ddrivers/net/usb/aqc111.c:1235:22:    got restricted __le64 [usertype]
    
Fix these problems and additionally also make sure that cloned
skbs are always copied for expansion. Finally also a length-cleck
on the minimum length of received packets is added.
---
Changes in v2:
- Do not use cast in desc_hdr = get_unaligned_le64((__le64 *)skb_tail_pointer(skb));
- Added packet-length check
- Improved commit subject and description covering alignment and skb-cloned
  fixes
- Link to v1: https://lore.kernel.org/r/20261117-aqc111-v1-1-27a54c4b54ca@birger-koblitz.de
---
 drivers/net/usb/aqc111.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/net/usb/aqc111.c b/drivers/net/usb/aqc111.c
index 12a99df77f0d332053852e44991188c690c4c0bc..ee7c8bb858458418048dc05defe4a642b6d05b05 100644
--- a/drivers/net/usb/aqc111.c
+++ b/drivers/net/usb/aqc111.c
@@ -1078,7 +1078,7 @@ static int aqc111_rx_fixup(struct usbnet *dev, struct sk_buff *skb)
 	struct aqc111_data *aqc111_data = dev->driver_priv;
 	struct sk_buff *new_skb = NULL;
 	u32 pkt_total_offset = 0;
-	u64 *pkt_desc_ptr = NULL;
+	__le64 *pkt_desc_ptr = NULL;
 	u32 start_of_descs = 0;
 	u32 desc_offset = 0; /*RX Header Offset*/
 	u16 pkt_count = 0;
@@ -1095,7 +1095,7 @@ static int aqc111_rx_fixup(struct usbnet *dev, struct sk_buff *skb)
 
 	/* RX Descriptor Header */
 	skb_trim(skb, skb_len - sizeof(desc_hdr));
-	desc_hdr = le64_to_cpup((u64 *)skb_tail_pointer(skb));
+	desc_hdr = get_unaligned_le64(skb_tail_pointer(skb));
 
 	/* Check these packets */
 	desc_offset = (desc_hdr & AQ_RX_DH_DESC_OFFSET_MASK) >>
@@ -1120,10 +1120,10 @@ static int aqc111_rx_fixup(struct usbnet *dev, struct sk_buff *skb)
 		goto err;
 
 	/* Get the first RX packet descriptor */
-	pkt_desc_ptr = (u64 *)(skb->data + desc_offset);
+	pkt_desc_ptr = (__le64 *)(skb->data + desc_offset);
 
 	while (pkt_count--) {
-		u64 pkt_desc = le64_to_cpup(pkt_desc_ptr);
+		u64 pkt_desc = get_unaligned_le64(pkt_desc_ptr);
 		u32 pkt_len_with_padd = 0;
 		u32 pkt_len = 0;
 
@@ -1139,6 +1139,7 @@ static int aqc111_rx_fixup(struct usbnet *dev, struct sk_buff *skb)
 
 		if (pkt_desc & AQ_RX_PD_DROP ||
 		    !(pkt_desc & AQ_RX_PD_RX_OK) ||
+		    pkt_len < (ETH_HLEN + AQ_RX_HW_PAD) ||
 		    pkt_len > (dev->hard_mtu + AQ_RX_HW_PAD)) {
 			skb_pull(skb, pkt_len_with_padd);
 			/* Next RX Packet Descriptor */
@@ -1224,7 +1225,8 @@ static struct sk_buff *aqc111_tx_fixup(struct usbnet *dev, struct sk_buff *skb,
 	headroom = skb_headroom(skb);
 	tailroom = skb_tailroom(skb);
 
-	if (!(headroom >= sizeof(tx_desc) && tailroom >= padding_size)) {
+	if (skb_cloned(skb) ||
+	    !(headroom >= sizeof(tx_desc) && tailroom >= padding_size)) {
 		new_skb = skb_copy_expand(skb, sizeof(tx_desc),
 					  padding_size, flags);
 		dev_kfree_skb_any(skb);
@@ -1236,7 +1238,7 @@ static struct sk_buff *aqc111_tx_fixup(struct usbnet *dev, struct sk_buff *skb,
 		skb_put_zero(skb, padding_size);
 	/* Copy TX header */
 	tx_desc_ptr = skb_push(skb, sizeof(tx_desc));
-	*tx_desc_ptr = cpu_to_le64(tx_desc);
+	put_unaligned_le64(tx_desc, tx_desc_ptr);
 
 	usbnet_set_skb_tx_stats(skb, 1, 0);
 

---
base-commit: eb6d6c80d35449c27471b1874f13066c09a8964d
change-id: 20261117-aqc111-b0cf408d776b

Best regards,
-- 
Birger Koblitz <mail@birger-koblitz.de>

