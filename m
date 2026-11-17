Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.88.97.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794940132;
	b=wVJyX47Ank4RG/Xj+y4/1LfnUB5V3uswvqg5z5xB8pJbuVHKVh+jbyHB74y6k58iHTJn
	 V20hhhpMcm/jJCQ4cCJQlLA2fHnaG6zAVoKz6YjkF7KIsV9iHA4UwEAICMmWO5k6o4u6E
	 ebhQyDFuCMGDlUa+cAxsH5+SkMh4MxGdbC4iRl/WY2rU+oSmiXJIey9GGzzK+ehzyJL9E
	 zTzu62Ka9EKi8C2XU0sLdOYIvcYwPmXMtEvwPISU6kqTTmqGuUPs3hfyX53+oRnFBBe9O
	 XSj3Gk4hpREAUzRFxEgTgNeQ9wLnym5XMoCEr+5SdytukHNN+pZC/r2bpKGXVQ2Ut3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794940132;
	h=DMARC-Filter:DKIM-Signature:Received:X-Spam-Checker-Version:
	 X-Spam-Level:X-Spam-Status:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=TYCrUZgXrFp7nju9+zel/L//WHtE13MRhrVcFy3OJJs=;
	b=iAPiDDLOH0Bu5jpA7l5ReLKeT4McyYUuF5zJ1JHpUmEFtNmbZLKIqbqm+ORWsePf6Elq
	 jRMAPI61Su5WVwYakIR++blfvZBDkTJZIiDBbmx6V6/dbBZpJOgmyqPuN00U7eZfimXJx
	 ucQKZ1aDODZUOl478EK37XE7ns1XNERKVwAoCZGYbNWjGMNDH7krdExJX0CgBivxiT7wg
	 zO+iQE9ay3qUQhRQUWluEYiLGs2tNIeTvgrrpPa9HPDLczaLKkeToZ/bGFy+axkoQJLRo
	 iH1nMEtOt2HWK5F7v8uieg2SAInaeNE0XzNcYGDCe5fJYQG1WxNvSHKoRgBV5HmvRCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=birger-koblitz.de;
	spf=pass smtp.mailfrom=birger-koblitz.de;
	dkim=pass header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=vKjlA+51;
	dkim=pass header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=ci2mQDF6;
	arc=none smtp.remote-ip=23.88.97.239
Received: from bkemail.birger-koblitz.de (bkemail.birger-koblitz.de [23.88.97.239])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6158B606A32C;
	Tue, 17 Nov 2026 18:28:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6158B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=vKjlA+51;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=ci2mQDF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1794940123;
	bh=PC9BEm+5BWDcKunvskJlZOjZYCOKJ7jpPS6hPUydkJU=;
	h=From:Date:Subject:To:Cc:From;
	b=vKjlA+51It75T4/y2wKNvbSOmhUUw8RydptVs+jzo6F77NKG48zISWv5LJH8GSgnD
	 wabrxm2cAjeZjPZlBOqVmu3O7sRvqs1tvOQXPkie4RxYfkUOrFiNUeNeO60iIkS8RU
	 MUU/v6qexMWFV/thzNcXNKIEPMqzyMMozBsPqcI3v5on0UU5OBekczRRE3osqdwRvZ
	 lUoMiO81PEdMSw736gtptvXgnO1edfusyv/vk7ViSAxmeWNjf/vh5bCZyMy3ThS39t
	 ZIQpX+rnC2oZ/X25T9abkFvQOOdPI8J1eUxNU9P+Vd2Pf/L0XJ4sPkT5II1CD4P7zF
	 CI1kmaEvnxXwA==
Received: by bkemail.birger-koblitz.de (Postfix, from userid 109)
	id 161DF48C78; Tue, 17 Nov 2026 18:28:43 +0000 (UTC)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1794940122;
	bh=PC9BEm+5BWDcKunvskJlZOjZYCOKJ7jpPS6hPUydkJU=;
	h=From:Date:Subject:To:Cc:From;
	b=ci2mQDF6HMx3Yc3YifPASqChiL+b3jR6C3Pt4/LygSIkxZDfI/Tx7feLsrqvlwJ0E
	 2u7Agqh3/0rb+YL9B11J3fufJigx3rajIRGuUSaIXtaFMr67Tyrr1CpFYWYkxv2+tb
	 1PnpN2jj8m3ZzB5JX39z0V9v19WJvnObsE+uek0ueE8zozDY6+knJsxOlUZVQj5rZU
	 ek5hgFuNbpWhgtCjD47v5UdOnmm0x1W7UMLUjeueAOUi/fBCzheGNYgZl7LsHNuEW+
	 4H0iXMlfxZNr8ky5ZON/9JpUWme88t6pqIxOWOxsaDXB56w+g+MWljZwkInNGCrisB
	 /D0DrgNhNCOTg==
Received: from AMDDesktop.lan (unknown [IPv6:2a00:6020:47a3:e800:271c:c6c5:9fde:77cb])
	by bkemail.birger-koblitz.de (Postfix) with ESMTPSA id D8B5B48A23;
	Tue, 17 Nov 2026 18:28:41 +0000 (UTC)
From: Birger Koblitz <mail@birger-koblitz.de>
Date: Tue, 17 Nov 2026 19:28:25 +0100
Subject: [PATCH net-next] aqc111: Correct endianness handling in
 rx/tx_fixup
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
Message-Id: <20261117-aqc111-v1-1-27a54c4b54ca@birger-koblitz.de>
X-B4-Tracking: v=1; b=H4sIAMic/GoC/x2MywqAIBAAfyX2nOBKZPQr0cHHVnuxUgkh/Pek0
 zAwzAuJIlOCuXsh0sOJz9AE+w7cYcJOgn1zUFKNiKiFuV2jsNJtg5y81qOFFl+RNi7/aIFAWQQ
 qGdZaP19lu9JiAAAA
X-Change-ID: 20261117-aqc111-b0cf408d776b
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-usb@vger.kernel.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Birger Koblitz <mail@birger-koblitz.de>
X-Mailer: b4 0.14.2

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
drivers/net/usb/aqc111.c:1235:22:    got restricted __le64 [usertype]

Fix these problems and additionally also make sure that cloned
skbs are always copied for expansion.

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
skbs are always copied for expansion.
---
 drivers/net/usb/aqc111.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/net/usb/aqc111.c b/drivers/net/usb/aqc111.c
index dd53f413c38f6035c18f9922fd4e90d66a73ae53..39d8755ca8e7bff484100f82863cc2ac8582fcc9 100644
--- a/drivers/net/usb/aqc111.c
+++ b/drivers/net/usb/aqc111.c
@@ -1074,7 +1074,7 @@ static int aqc111_rx_fixup(struct usbnet *dev, struct sk_buff *skb)
 	struct aqc111_data *aqc111_data = dev->driver_priv;
 	struct sk_buff *new_skb = NULL;
 	u32 pkt_total_offset = 0;
-	u64 *pkt_desc_ptr = NULL;
+	__le64 *pkt_desc_ptr = NULL;
 	u32 start_of_descs = 0;
 	u32 desc_offset = 0; /*RX Header Offset*/
 	u16 pkt_count = 0;
@@ -1091,7 +1091,7 @@ static int aqc111_rx_fixup(struct usbnet *dev, struct sk_buff *skb)
 
 	/* RX Descriptor Header */
 	skb_trim(skb, skb_len - sizeof(desc_hdr));
-	desc_hdr = le64_to_cpup((u64 *)skb_tail_pointer(skb));
+	desc_hdr = get_unaligned_le64((__le64 *)skb_tail_pointer(skb));
 
 	/* Check these packets */
 	desc_offset = (desc_hdr & AQ_RX_DH_DESC_OFFSET_MASK) >>
@@ -1116,10 +1116,10 @@ static int aqc111_rx_fixup(struct usbnet *dev, struct sk_buff *skb)
 		goto err;
 
 	/* Get the first RX packet descriptor */
-	pkt_desc_ptr = (u64 *)(skb->data + desc_offset);
+	pkt_desc_ptr = (__le64 *)(skb->data + desc_offset);
 
 	while (pkt_count--) {
-		u64 pkt_desc = le64_to_cpup(pkt_desc_ptr);
+		u64 pkt_desc = get_unaligned_le64(pkt_desc_ptr);
 		u32 pkt_len_with_padd = 0;
 		u32 pkt_len = 0;
 
@@ -1220,7 +1220,8 @@ static struct sk_buff *aqc111_tx_fixup(struct usbnet *dev, struct sk_buff *skb,
 	headroom = skb_headroom(skb);
 	tailroom = skb_tailroom(skb);
 
-	if (!(headroom >= sizeof(tx_desc) && tailroom >= padding_size)) {
+	if (skb_cloned(skb) ||
+	    !(headroom >= sizeof(tx_desc) && tailroom >= padding_size)) {
 		new_skb = skb_copy_expand(skb, sizeof(tx_desc),
 					  padding_size, flags);
 		dev_kfree_skb_any(skb);
@@ -1232,7 +1233,7 @@ static struct sk_buff *aqc111_tx_fixup(struct usbnet *dev, struct sk_buff *skb,
 		skb_put_zero(skb, padding_size);
 	/* Copy TX header */
 	tx_desc_ptr = skb_push(skb, sizeof(tx_desc));
-	*tx_desc_ptr = cpu_to_le64(tx_desc);
+	put_unaligned_le64(tx_desc, tx_desc_ptr);
 
 	usbnet_set_skb_tx_stats(skb, 1, 0);
 

---
base-commit: 805185b7c7a1069e407b6f7b3bc98e44d415f484
change-id: 20261117-aqc111-b0cf408d776b

Best regards,
-- 
Birger Koblitz <mail@birger-koblitz.de>

