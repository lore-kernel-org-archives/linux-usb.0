Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795663988;
	b=tQFmYX+6xV/RyhZiS25G2FBrjvZBh0XadM1/RIGUAU7Y7MK7M1dJybV8fk9BLGdwhKWe
	 Fxla03Fmkxqu/bk1lir5z6xOoto/DCYfOyID5R2X9ksUfGiS+5Rx2Nroqx7ilfGJv6+tL
	 jEUuUMCYD2ADlLKDPIQhQtR16/Ho94shhIrIyfR8dEHP6V9CujVbuEIVsPLpXLcNw33qm
	 wsrswFLrStVLy3Akito6wJ0XLKFblPKjupAfDRsYbP1yDSci7lgIInax5OFz86+d2aQxG
	 2o53Y24WGZ3m1pCBU7Qizu75CE7UavJEJmaq6zixeKgZTqcxFcbBDGM28th6Fk8Ki2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795663988;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=LHfrTOMBua6GXQUw0lFn7woJp3q39K7l7mtv+0KaE8A=;
	b=rQ2nFow+cu+LMgT3F9XFsIyxvqupmCRqWujiJTWKNypELL0/W885kqF1LTeAb80NzZrp
	 8nnUuFqZdBuT18aBs/xOdbVWNOOKBG3V73dbrLo7huS5K8OlKfUpVutgX/Un8VhN7Wipu
	 i1K+u/GiZ9s0gRHGIq0BxnFVqjCF5EFdVO3AmCj4gjgJhVBM31pRaVYSZZGGMsLZSYVqe
	 iSqBOv1ysKdVkWXSK4vkJFyxkeXKqV8OKdQE1jCA5ILhaPefQhQgNriE7DONPNzPJp493
	 T4hpFwY78eZX6+Vjp/oJGGBMwTHf2bubfLiYL2yH1ifVJCSd/5i3nJA+3MKPPh7mTeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=cHin5ePw;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99DB606A33A;
	Thu, 26 Nov 2026 03:33:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A99DB606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=cHin5ePw
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AQ3WFXY03951801, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795663936; bh=LHfrTOMBua6GXQUw0lFn7woJp3q39K7l7mtv+0KaE8A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=cHin5ePw7nhk9VQBZ6yufxNjT7l+tB4CbnPslKoxv1iDcZwPD9kgz+EQqLhu5A6S8
	 cd+lcGxEACUe1iSEyeJWffWiC/NHK3Y8eVkbzWRgTZQhTQGVtJlOwZNaPW8hBhJKIq
	 dn+vVJXfPxkD7RwD9PsXYlAPwH074Jb2MxvpDV00a4Reuw5Zm8c8z6odhdUmJjzTVF
	 MFaAPwO1+ZSbwUvYU024PrDeKSsdJPwCAzxp92atZCfbv+fm+JByDxkLAY5YBW5N70
	 K+shvQj65MXPA1VhQYYUciLYos+Ga4ACF+WSvaZTK4bD2pG+M5B1qZGOOl5icg0sTw
	 Jy2+GVrW5x0LQ==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AQ3WFXY03951801
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 26 Nov 2026 11:32:16 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 26 Nov 2026 11:32:15 +0800
Received: from fc44.realtek.com.tw (172.22.241.7) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Thu, 26 Nov 2026 11:32:15 +0800
From: Chih Kai Hsu <hsu.chih.kai@realtek.com>
To: <davem@davemloft.net>, <kuba@kernel.org>
CC: <netdev@vger.kernel.org>, <nic_swsd@realtek.com>,
	<linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
	<edumazet@google.com>, <bjorn@mork.no>, <pabeni@redhat.com>,
	<hsu.chih.kai@realtek.com>, <andrew+netdev@lunn.ch>, <mail@birger-koblitz.de>
Subject: [PATCH net-next v9 03/12] r8152: add rtl8157_change_mtu() for RTL8157 and RTL8159
Date: Thu, 26 Nov 2026 11:32:02 +0800
Message-ID: <20261126033211.51850-4-nic_swsd@realtek.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261126033211.51850-1-nic_swsd@realtek.com>
References: <20261126033211.51850-1-nic_swsd@realtek.com>
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
Content-Type: text/plain

RTL8157 and RTL8159 used rtl8156_change_mtu(), which programs a fixed
MTPS_JUMBO. Per the datasheet they need an MTPS scaled from the
configured MTU instead: max_pkt_size / 64, at least 10K and capped
at 0xff.

Add rtl8157_change_mtu() for them. Since rtl8156_up() is shared with
these chips, have it call tp->rtl_ops.change_mtu() instead of
rtl8156_change_mtu() directly so each chip gets its own helper.

Fixes: fd3c7d080df5 ("r8152: Add support for the RTL8157 hardware")
Fixes: ad2a55b63b41 ("r8152: Add support for the RTL8159 chip")
Signed-off-by: Chih Kai Hsu <hsu.chih.kai@realtek.com>
---
 drivers/net/usb/r8152.c | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
index bb4106f238a3a..1517753f843ef 100644
--- a/drivers/net/usb/r8152.c
+++ b/drivers/net/usb/r8152.c
@@ -6800,6 +6800,28 @@ static void rtl8156_change_mtu(struct r8152 *tp)
 		       ALIGN(rx_max_size + tp->tx_desc.size, 1024) / 16);
 }
 
+static void rtl8157_change_mtu(struct r8152 *tp)
+{
+	u32 max_pkt_size = mtu_to_size(tp->netdev->mtu);
+	u32 ocp_data;
+
+	ocp_write_word(tp, MCU_TYPE_PLA, PLA_RMS, max_pkt_size);
+
+	/* Use at least 10K for MTPS */
+	ocp_data = max_t(u32, max_pkt_size, 10 * 1024) / 64;
+
+	/* 16 * 1024 / 64 = 0x100, so the max is 0xff for 8 bits data */
+	ocp_data = min_t(u32, ocp_data, 0xff);
+
+	ocp_write_byte(tp, MCU_TYPE_PLA, PLA_MTPS, ocp_data);
+	r8156_fc_parameter(tp);
+
+	/* TX share fifo free credit full threshold */
+	ocp_write_word(tp, MCU_TYPE_PLA, PLA_TXFIFO_CTRL, 512 / 64);
+	ocp_write_word(tp, MCU_TYPE_PLA, PLA_TXFIFO_FULL,
+		       ALIGN(max_pkt_size + tp->tx_desc.size, 1024) / 16);
+}
+
 static void rtl8156_up(struct r8152 *tp)
 {
 	if (test_bit(RTL8152_INACCESSIBLE, &tp->flags))
@@ -6826,7 +6848,7 @@ static void rtl8156_up(struct r8152 *tp)
 
 	rtl_rx_vlan_en(tp, tp->netdev->features & NETIF_F_HW_VLAN_CTAG_RX);
 
-	rtl8156_change_mtu(tp);
+	tp->rtl_ops.change_mtu(tp);
 
 	switch (tp->version) {
 	case RTL_TEST_01:
@@ -9900,7 +9922,7 @@ static int rtl_ops_init(struct r8152 *tp)
 		ops->in_nway		= rtl8153_in_nway;
 		ops->hw_phy_cfg		= r8157_hw_phy_cfg;
 		ops->autosuspend_en	= rtl8157_runtime_enable;
-		ops->change_mtu		= rtl8156_change_mtu;
+		ops->change_mtu		= rtl8157_change_mtu;
 		tp->rx_buf_sz		= 32 * 1024;
 		tp->support_2500full	= 1;
 		tp->support_5000full	= 1;
@@ -9922,7 +9944,7 @@ static int rtl_ops_init(struct r8152 *tp)
 		ops->in_nway		= rtl8153_in_nway;
 		ops->hw_phy_cfg		= r8157_hw_phy_cfg;
 		ops->autosuspend_en	= rtl8157_runtime_enable;
-		ops->change_mtu		= rtl8156_change_mtu;
+		ops->change_mtu		= rtl8157_change_mtu;
 		tp->rx_buf_sz		= 48 * 1024;
 		tp->support_2500full	= 1;
 		tp->support_5000full	= 1;
-- 
2.34.1

