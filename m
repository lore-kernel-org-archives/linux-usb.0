Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795137800;
	b=U6qvFUSGD1Eib8VqLT2WpO/AK/AHWovNahhtdQMNgh2GfWbkKRiR97U5NYAoeKntx9BD
	 EIGBP3v38p9zIcLsvZmLzdjzL8Tvfe16bqt2LI2b7e/mvKLwHIPuTn+eA+p6Bud+oJjPZ
	 s1K9raClAEJJ9gU0zo7wNm22n25P5GFqd9mPLVcBu1MRe5Dl071scFZNwUtTeU882SNEg
	 YcRU86xMzDVQkJUu2FVu2Zi+uNFc2PDOc4FG5flQQuLrfrFqoFWFWdGkzeazRkAHwVe0P
	 Rgea6cvTlnTtb6kF498ohBzi8S2dYDWW2Fma62gR8lXNFJR2MX5X3sdvBpFRdtta0cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795137800;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aPwQ4j4gpAhDa+nABR08gUCjnD81/Bc7CRwqvIRsJR4=;
	b=AfME2KXaf6p7XGOrR4lmJBT2gE2IVs8nufPoylj0F3RFdyqNfFx63QiMLz+BDJRkMeT7
	 Y24fn1rkE7jVSRyprnN6jYN3/49yKpcP5/zyFBsfArBPZ20jXftzOEO4Q0ygikezi9+7x
	 wEdEBMRCPvdUAUkhj0KSqjaoE/8EaZisgTiCQDo1TrJk/pny/rOKZtuS6F4UeAdiuqfSg
	 y3ClGE6lq/BVQw/NP5GZgIh/Buis5dQr/IRA53TKn9ipwAaThTGHzKrD0lh0B5zQoQQPH
	 DL5M3BLi4RaLKKHCYSsjaUkkw5qlzuOC0ZjLNJfTKeGVT5skn/YfO5HMOjE0QozLOaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=vWIfijUG;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C87B7606A320;
	Fri, 20 Nov 2026 01:23:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C87B7606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=vWIfijUG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=vWIfijUGnJ6H96Cr5pSJlX6Nv7q9Pbr2VuFZB0a6YxQGC+8qsuQ2L8V3uQbSm1I/8MDJgXDPUIA97
	 mI9BQ4guIG5sZcUcX/WUb1zOCFov20bF6/smwAPO3BXRtTSLrh0fs89yNaUQKjVam+96olq/WLtU0r
	 w4vB6Oe//BpRBl+Q=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee96affa0ffb08-274cb;
	Fri, 20 Nov 2026 09:23:12 +0800 (CST)
X-RM-TRANSID:2ee96affa0ffb08-274cb
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from FHD-W7400297 (unknown[10.55.1.70])
	by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee66affa0fe9ee-0f733;
	Fri, 20 Nov 2026 09:23:12 +0800 (CST)
X-RM-TRANSID:2ee66affa0fe9ee-0f733
From: Aibing Chen <chenaibing@cmss.chinamobile.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] net: hso: cap the MTU and drop oversized frames
Date: Fri, 20 Nov 2026 09:23:09 +0800
Message-ID: <20261120012309.19-1-chenaibing@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <20261116014904.556-1-chenaibing@cmss.chinamobile.com>
References: <20261116014904.556-1-chenaibing@cmss.chinamobile.com>
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

hso_net_start_xmit() copies skb->len bytes into odev->mux_bulk_tx_buf,
which is a fixed MUX_BULK_TX_BUF_SIZE (2048) allocation made by
hso_create_net_device(), and passes the same length to
usb_fill_bulk_urb().  Nothing bounds skb->len today: the net device does
not set max_mtu, and even with max_mtu set the core does not clamp the
length of the frames handed to ndo_start_xmit(), so AF_PACKET with
PACKET_VNET_HDR, tpacket_snd() with a vnet header and an IPv4 route MTU
metric above the device MTU can all deliver larger skbs.

Cap the MTU at the buffer size and drop oversized frames in
hso_net_start_xmit() instead of copying them past the end of the buffer.

Fixes: 72dc1c096c70 ("HSO: add option hso driver")
Cc: stable@vger.kernel.org
Signed-off-by: Aibing Chen <chenaibing@cmss.chinamobile.com>
---
v2:
- also drop frames larger than MUX_BULK_TX_BUF_SIZE in hso_net_start_xmit()
  with tx_dropped accounting: the max_mtu cap alone does not bound
  skb->len, as pointed out in the netdev review.

 drivers/net/usb/hso.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/net/usb/hso.c b/drivers/net/usb/hso.c
index 71caa3764..0df1d19cc 100644
--- a/drivers/net/usb/hso.c
+++ b/drivers/net/usb/hso.c
@@ -769,6 +769,18 @@ static netdev_tx_t hso_net_start_xmit(struct sk_buff *skb,
 	struct hso_net *odev = netdev_priv(net);
 	int result;
 
+	/*
+	 * max_mtu only limits the MTU userspace can configure; the core does
+	 * not clamp skb->len to it (AF_PACKET with PACKET_VNET_HDR, tpacket_snd()
+	 * with a vnet header and a route MTU metric above the device MTU can all
+	 * deliver larger frames), so drop anything that does not fit here.
+	 */
+	if (unlikely(skb->len > MUX_BULK_TX_BUF_SIZE)) {
+		net->stats.tx_dropped++;
+		kfree_skb_reason(skb, SKB_DROP_REASON_PKT_TOO_BIG);
+		return NETDEV_TX_OK;
+	}
+
 	/* Tell the kernel, "No more frames 'til we are done with this one." */
 	netif_stop_queue(net);
 	if (hso_get_activity(odev->parent) == -EAGAIN) {
@@ -2393,6 +2405,7 @@ static void hso_net_init(struct net_device *net)
 	net->flags = IFF_POINTOPOINT | IFF_NOARP | IFF_MULTICAST;
 	net->type = ARPHRD_NONE;
 	net->mtu = DEFAULT_MTU - 14;
+	net->max_mtu = MUX_BULK_TX_BUF_SIZE - 14;
 	net->tx_queue_len = 10;
 	net->ethtool_ops = &ops;
 


