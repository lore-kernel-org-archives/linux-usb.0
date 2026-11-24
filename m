Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.88.97.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540454;
	b=VxkY3Zstq1j57OyUfF7gw9Lt9dxMttPIgdLhMgC/f54ZaiyR+1OnIvTsyg4cHoxRx8ZX
	 5zkmP69Z+VTKDgMCZn9I9GOxs5AMtIW80xpFb5sCynCWP/OpDZCWXk0XVNyTm/iadMPHa
	 SIzI03V4zoPM7BhWRMjU3Satotwhz4sAV3j7hBXoBWtHqu/bHFeRFn8eo5BQI59YWV7Uv
	 Kn4wKS0chjVbEbfKc2ARFz5VRjb9buLheCq1SniiNxKD/rL2JRbXg9eWC9Pb+5cmPN9Xl
	 KmYBLRXmkpc1vfdhT2rZfxXJqLaaYDJEPwQO3PVI3WUvgkAEehFfqRu2tUOs+DposJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540454;
	h=DMARC-Filter:DKIM-Signature:Received:X-Spam-Checker-Version:
	 X-Spam-Level:X-Spam-Status:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=l+8r1bGabc3oHw1CGGMsn650L5hrNdPH9kcVJO23sWM=;
	b=uEV3ntEIRkLjKj8gtc6JO/pjymwK09VfCMdieSDgm0qhAT9f7yd9r6DrBr9cN/O6rlAz
	 RqIws9IJZtZ9TjIJQ0FICoedCJ1O2pYZTGO3kNXGPbRDFmbOeFlvbVGgkM96F0z9lnHyO
	 /bJldZKs5IQxnWlL6+DaFkvPzqQ3OI/3gtoJX1YLz/0RRjXoP6Sb4pDgtiUn28elFt8nT
	 j9jVHkfrE8OEh+anKCromljiXBm62pJeNdlSx53D0Bxp5W89tVAG8aBm7jQ5j5612tI4K
	 pYbHcNNKDWEXHU9Y4CNUErVkrJdfvphKeakbJciolOhQQr6XKTkDI7jzDXENU4hUxsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=birger-koblitz.de;
	spf=pass smtp.mailfrom=birger-koblitz.de;
	dkim=pass header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=2ZOKGDew;
	dkim=pass header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=hNA6ZoUb;
	arc=none smtp.remote-ip=23.88.97.239
Received: from bkemail.birger-koblitz.de (bkemail.birger-koblitz.de [23.88.97.239])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E749F606A31E;
	Tue, 24 Nov 2026 17:14:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E749F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=2ZOKGDew;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=hNA6ZoUb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1795540452;
	bh=fqYDUrorm3k05HYMeY3xb/Mvgw2jMfaogj6XTMp9LJ8=;
	h=From:Date:Subject:To:Cc:From;
	b=2ZOKGDew1xfvR8XPEsB1DYGmbiW9rWS+uYgwfYJFMpXLzd/K9KjciNgCMAqUPyVUX
	 41RBORxe9oa+R7wsORDlv0OlGadBp4aArcLjw1txoWuVQck569mBsQP33Elq1hs8rp
	 gFm1FWTo2BCiO6NgtkxC07ykTR0z/MLxL/Fw+EUQCSo8mTKVdrOFHeMqB2VdBFh6C/
	 3iP/AD2bUDwaxzgcQkeQ6Z2D1fdE8pJX31J1tjqR9N633TYO4WPL7Z4PX2YGEyg2Lp
	 LloIR2QLSdLF3rhEiaojspEpzUQuacLrdFKxUGf223YKI0qzE7F47zwKqp9onXkBcY
	 OfD9ZpHe1Hg+w==
Received: by bkemail.birger-koblitz.de (Postfix, from userid 109)
	id 5680E495EC; Tue, 24 Nov 2026 17:14:12 +0000 (UTC)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1795540449;
	bh=fqYDUrorm3k05HYMeY3xb/Mvgw2jMfaogj6XTMp9LJ8=;
	h=From:Date:Subject:To:Cc:From;
	b=hNA6ZoUboYJJBnWnQQmjgx7uiEmp9HDLmOMeE2OQoTbcGbaAI/xjgNnhSwDNGSVpj
	 ZRnQpD41rSnuIMeUst30CpiSB+jjd29elYgT5W8fKRNRNHv1bYOCAs7Z9qfyoNRbOu
	 ME/o9urmrggBoV/T/rhwCtOqWOni6XpKS1ZWcljmFi9eMOSUQGd0kRW5bGDZZfBpOd
	 gotU41LcYTEJSM6jKmjyPl8iWhAr2lO+C7uuJv8CoiAIdFMSCx7MSagc9KRCCcSbE0
	 hCBIgaaBZhpJz4waZkgO4h/04DrhqRk2jQ47rYDGNNxTIuWcPHfEKOQ0vPV3szygUz
	 9p52bpduar1xA==
Received: from AMDDesktop.lan (unknown [IPv6:2a00:6020:47a3:e800:271c:c6c5:9fde:77cb])
	by bkemail.birger-koblitz.de (Postfix) with ESMTPSA id A2018495E2;
	Tue, 24 Nov 2026 17:14:09 +0000 (UTC)
From: Birger Koblitz <mail@birger-koblitz.de>
Date: Tue, 24 Nov 2026 18:14:07 +0100
Subject: [PATCH net-next v3] net: usb: aqc111: Fix rx/tx_fixup issues
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
Message-Id: <20261124-aqc111-v3-1-10f2c124d808@birger-koblitz.de>
X-B4-Tracking: v=1; b=H4sIAN7FBWsC/22NywrCMBBFf6VkbaSZPiKu/A9xkce0HZRUkxCqp
 f9uyEJE3MxwuXPOrCygJwzsWK3MY6JAs8uh2VXMTMqNyMnmzKCGXgghuXqYvLmuzdDWBytlr1k
 +vnscaCmiM3MYucMlsktuJgpx9s/yIYnS/8qS4IKDVF1rWp2HOmnyI3p+nfWN4mtvsagSfOEAH
 xwy3oHtrNVCqkb+w7dtewNjNcoG7QAAAA==
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
Changes in v3:
- Use finer-grained decision to expand skb as found in asix_tx_fixup()
- Add prefix "net: usb:"
- Link to v2: https://lore.kernel.org/r/20261122-aqc111-v2-1-52d5ddb17a37@birger-koblitz.de

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
index 12a99df77f0d332053852e44991188c690c4c0bc..59ac08775db3ebb9b6fe2296e4f8fb431197aeff 100644
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
+	if (skb_header_cloned(skb) || (padding_size && skb_cloned(skb)) ||
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

