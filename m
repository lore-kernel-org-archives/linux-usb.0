Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.88.97.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795761420;
	b=cf5Z0batoYKfH9HOs+Zc75EuEPuQZTipZtKUuuAScQO0gUsXHIDA89ynF1CUGJEFrDkr
	 pfPd16uOp97sjOcHtCOf7QV0ixDpeglT/nDkUZkDwUkeim9Nu2qjr7bdAiP+NuXCam5Cd
	 AmqGv7dzf2ZETVUkeUN2PvdqCSmGXFykizHUyJUW0n54y6rwdMhTTY6WJF3I6nTFQjqtb
	 +cx9ap+ZVuNMXZsEZojzAlnSyoYiWwSVLcOe55U8PjiQKFGHHKhfxxhw8VrzLsqHEVr85
	 jVGfWBw+z1DnUkPfBdhMOnB5z/omRCuDU5mg9TB4d/J4bDg/3bhBKV2La734kYrnQXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795761420;
	h=DMARC-Filter:DKIM-Signature:Received:X-Spam-Checker-Version:
	 X-Spam-Level:X-Spam-Status:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=DeWUVVsAxeZnMZlcwP+GXSB2Q0St73P5vd7iOTLEiio=;
	b=G+N0f789OIfnszPGi1+C7RQs0vk0RDJVT1nJr4YWoJrZ5OpRwFW9TaphKOx8+ZPxuj0t
	 KHMiHiU2DycQK06Kq7q/bCHJuWGN/bj1ga5SL9ZmnGHww8OHFrvL5Sb1no/ZjJ69V6L2I
	 OT2ornj9GM9+TVnfxpIfD+YNYynYx6SRY6imZ9PztGHZv+dmCDw7ohv9Dg/+M10yL7YNf
	 3WcQ/kUDF9Rl43Cs2BWecfAuRqEXSvb/EIFdlGvD7/Sv+nXKBiJ30dsJO+BfthYcQ6LuA
	 s28xxnwRl30WBGnqmwyVvF1kCh5rTBcEgUaTuOMjh59OiQ5wGyFNqa5tAAVHSYQGpxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=birger-koblitz.de;
	spf=pass smtp.mailfrom=birger-koblitz.de;
	dkim=pass header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=WGJO1d5c;
	dkim=pass header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b="P/zyBrH7";
	arc=none smtp.remote-ip=23.88.97.239
Received: from bkemail.birger-koblitz.de (bkemail.birger-koblitz.de [23.88.97.239])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E999606A331;
	Fri, 27 Nov 2026 06:36:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E999606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=WGJO1d5c;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=P/zyBrH7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1795761411;
	bh=RSSU/clPbdqj/Esl3faGSGF8CBOJ9QAWz1V1BYle5TU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WGJO1d5crgCF8r+RGMYEaeMcySDbXRuqzXs/w+mPRyWTsk84hz7ckpb2HM9UAG7V7
	 On++9KcBi7GBugAh4LO0zLtJgYAO+iKBIJLBRepatEJTd7mqslb4Jcng5+a3u0YInn
	 OkewLBN1uxo1P3S4ULwEmpGvs7NrPiTwa0+yMc0C2Y3NPGnNrjLAWFrxYHKA2pzJpm
	 XdkIdtuSSzKf+l1p3gBfKEvTE1nekG05eWS6nrSdMFLycfq6JIxX38ZDgc3orDcpW+
	 EdmZSI3lo0qbLdVEXiWkWpIgRn8Seh6rOPXB3pPkAWjkqZX8V8OSWpBhf97PN48iau
	 AZ5axmtyApCVw==
Received: by bkemail.birger-koblitz.de (Postfix, from userid 109)
	id C47084963E; Fri, 27 Nov 2026 06:36:51 +0000 (UTC)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1795761409;
	bh=RSSU/clPbdqj/Esl3faGSGF8CBOJ9QAWz1V1BYle5TU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=P/zyBrH73Xln0xVp1YB0+zeDFdShDkdjS1hkNdsmt+qLLvY/TKxyVnezTFeGJbNc8
	 ArIjBhJjptDJ7pcPvrbqiorniBV3OxcRfMC/jAZbzzM1N0Sgi+SGoxlUB6GlLZN3bt
	 Q7plwu7pWDSGk3Rrqt7YxIDMeGODlIT6rW0xcNsnA6pTTie8zXL/bqEp4bU91rBAq4
	 QwHbItXM7bV2B5aD33ihWCvWSBM7ajZedao9lW2EtKx+Y5H0jM+sZUdfxXsVaFdage
	 x8hzHYbFk+jA1aCjxY+UmsC5jZKU21Qd8zEO3aO5Pgzu5C3Am1N17QqXKtXubq29cD
	 OzMev7eyHdofg==
Received: from AMDDesktop.lan (unknown [IPv6:2a00:6020:47a3:e800:271c:c6c5:9fde:77cb])
	by bkemail.birger-koblitz.de (Postfix) with ESMTPSA id EF4EC4962F;
	Fri, 27 Nov 2026 06:36:48 +0000 (UTC)
From: Birger Koblitz <mail@birger-koblitz.de>
Date: Fri, 27 Nov 2026 07:36:27 +0100
Subject: [PATCH net-next 2/2] net: usb: ax88179: Support NETIF_F_RXFCS and
 NETIF_F_RXALL on AX88179A
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
Message-Id: <20261127-fcs-v1-2-0c4ede015bf5@birger-koblitz.de>
References: <20261127-fcs-v1-0-0c4ede015bf5@birger-koblitz.de>
In-Reply-To: <20261127-fcs-v1-0-0c4ede015bf5@birger-koblitz.de>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-usb@vger.kernel.org, 
 Benjamin Larsson <benjamin.larsson@genexis.eu>, 
 Birger Koblitz <mail@birger-koblitz.de>
X-Mailer: b4 0.14.2

Add NETIF_F_RXFCS and NETIF_F_RXALL features for
the AX88179A and take a trailing FCS into account for MTU
verification when checking packet length in rx_fixup().

Count dropped packets and those with incorrect checksum.

Suggested-by: Benjamin Larsson <benjamin.larsson@genexis.eu>
Signed-off-by: Birger Koblitz <mail@birger-koblitz.de>
---
 drivers/net/usb/ax88179a_devices.c | 46 +++++++++++++++++++++++++++++++++-----
 1 file changed, 40 insertions(+), 6 deletions(-)

diff --git a/drivers/net/usb/ax88179a_devices.c b/drivers/net/usb/ax88179a_devices.c
index 69095110e70435806a99274c50d79e86016ec9a0..a6b35ad7d5404068a71507bf5f981d32c455d63d 100644
--- a/drivers/net/usb/ax88179a_devices.c
+++ b/drivers/net/usb/ax88179a_devices.c
@@ -717,10 +717,12 @@ static int ax88179a_mii_ioctl(struct net_device *net, struct ifreq *rq, int cmd)
 static int ax88179a_set_features(struct net_device *net, netdev_features_t features)
 {
 	struct usbnet *dev = netdev_priv(net);
+	struct ax88179_data *ax179_data;
 	netdev_features_t changed;
 	int ret;
 	u8 tmp;
 
+	ax179_data = dev->driver_priv;
 	changed = net->features ^ features;
 
 	ret = ax88179_set_features(net, features);
@@ -780,6 +782,18 @@ static int ax88179a_set_features(struct net_device *net, netdev_features_t featu
 		if (ret < 0)
 			return ret;
 	}
+
+	if (changed & (NETIF_F_RXFCS | NETIF_F_RXALL)) {
+		u16 rxctl = READ_ONCE(ax179_data->rxctl);
+
+		if (features & (NETIF_F_RXFCS | NETIF_F_RXALL))
+			rxctl |= AX_RX_CTL_DROPCRCERR;
+		else
+			rxctl &= ~AX_RX_CTL_DROPCRCERR;
+		WRITE_ONCE(ax179_data->rxctl, rxctl);
+		ax88179_write_u16(dev, AX_ACCESS_MAC, AX_RX_CTL, 2, rxctl);
+	}
+
 	return 0;
 }
 
@@ -852,8 +866,8 @@ static int ax88179a_bind(struct usbnet *dev, struct usb_interface *intf)
 		    ax179_data->fw_version[2], ax179_data->fw_version[3]);
 
 	/* The AX88279 requires both the AX_RX_CTL_IPE and AX_RX_CTL_DROPCRCERR
-	 * bits set in AX_RX_CTL for creating correct RX-URBs. AX_RX_CTL_DROPCRCERR
-	 * is anyway set for all chips, make sure AX_RX_CTL_IPE is set via ip_align.
+	 * bits set in AX_RX_CTL for creating correct RX-URBs. Make sure
+	 * AX_RX_CTL_IPE is set via ip_align.
 	 * Also configure eeprom access parameters.
 	 */
 	if (ax179_data->chip_version == AX_VERSION_AX88279) {
@@ -894,6 +908,11 @@ static int ax88179a_bind(struct usbnet *dev, struct usb_interface *intf)
 	dev->net->vlan_features = NETIF_F_SG | NETIF_F_IP_CSUM |
 				  NETIF_F_IPV6_CSUM | NETIF_F_RXCSUM | NETIF_F_TSO;
 
+	if (ax179_data->chip_version == AX_VERSION_AX88179A) {
+		dev->net->hw_features |= NETIF_F_RXFCS | NETIF_F_RXALL;
+		dev->net->vlan_features |= NETIF_F_RXFCS | NETIF_F_RXALL;
+	}
+
 	netif_set_tso_max_size(dev->net, 16384);
 
 	/* Enable Transmission of Link Speed byte in interrupt URB */
@@ -1039,9 +1058,14 @@ static int ax88179a_rx_fixup(struct usbnet *dev, struct sk_buff *skb)
 	pkt_end = 0;
 	while (pkt_cnt--) {
 		u64 pkt_desc = get_unaligned_le64(pkt_desc_ptr);
+		long features = dev->net->features;
 		u32 pkt_len_plus_padd;
+		u32 fcs_trailer = 0;
 		u32 pkt_len;
 
+		if (features & (NETIF_F_RXFCS | NETIF_F_RXALL))
+			fcs_trailer = ETH_FCS_LEN;
+
 		pkt_len = FIELD_GET(AX179A_RX_PD_LEN, pkt_desc);
 		pkt_len -= (ax179_data->ip_align ? 2 : 0);
 		pkt_len_plus_padd = ((pkt_len + 7 + (ax179_data->ip_align ? 2 : 0)) & 0x7FFF8);
@@ -1050,10 +1074,18 @@ static int ax88179a_rx_fixup(struct usbnet *dev, struct sk_buff *skb)
 		if (pkt_end > hdr_off || (pkt_cnt == 0 && pkt_end != hdr_off))
 			goto err;
 
-		if (pkt_desc & AX179A_RX_PD_DROP || !(pkt_desc & AX179A_RX_PD_RX_OK) ||
-		    pkt_len > (dev->hard_mtu + AX179A_RX_HW_PAD) || pkt_len < 2 + ETH_HLEN) {
+		if (((pkt_desc & AX179A_RX_PD_DROP || !(pkt_desc & AX179A_RX_PD_RX_OK)) &&
+		     !(features & NETIF_F_RXALL)) ||
+		    pkt_len > dev->hard_mtu + AX179A_RX_HW_PAD + fcs_trailer ||
+		    pkt_len < 2 + ETH_HLEN) {
 			skb_pull(skb, pkt_len_plus_padd);
 
+			if (pkt_desc & AX179A_RX_PD_DROP)
+				dev->net->stats.rx_dropped++;
+
+			if (!(pkt_desc & AX179A_RX_PD_RX_OK))
+				dev->net->stats.rx_crc_errors++;
+
 			/* Next RX Packet Descriptor */
 			pkt_desc_ptr++;
 			continue;
@@ -1216,12 +1248,14 @@ static int ax88179a_reset(struct usbnet *dev)
 	ax88179_write_u8(dev, AX_ACCESS_MAC, AX_TXCOE_CTL, 1, *tmp);
 
 	/* Configure RX control register => start operation */
-	rxctl = AX_RX_CTL_DROPCRCERR | AX_RX_CTL_START | AX_RX_CTL_AP |
-		AX_RX_CTL_AMALL | AX_RX_CTL_AB;
+	rxctl = AX_RX_CTL_START | AX_RX_CTL_AP | AX_RX_CTL_AMALL | AX_RX_CTL_AB;
 	if (ax179_data->ip_align)
 		rxctl |= AX_RX_CTL_IPE;
 	if (dev->net->flags & IFF_PROMISC)
 		rxctl |= AX_RX_CTL_PRO;
+	if (dev->net->features & (NETIF_F_RXFCS | NETIF_F_RXALL) ||
+	    ax179_data->chip_version == AX_VERSION_AX88279)
+		rxctl |= AX_RX_CTL_DROPCRCERR;
 	WRITE_ONCE(ax179_data->rxctl, rxctl);
 	ax88179_write_u16(dev, AX_ACCESS_MAC, AX_RX_CTL, 2, rxctl);
 

-- 
2.47.3

