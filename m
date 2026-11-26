Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795663991;
	b=g1tEiSC3bd75XvYck0YH6Qx15BM6eHQpoNZgHCAr8Nvw/kXSbeHwwGO8WegdR/X3VxeS
	 vpeXwau1WvHZ+k1+E0UbZOdlnU0XDP8/hEioD9EBZ5TNvDuyIYqmnWMVDsUf69yWxIM8b
	 fkKjtqPdVBOGp/7MdwKmaRrfrhxGIAM4F4XUxkVixcUBynHsS8iK6M7Y+cTda3wZREjiI
	 Tm+7o7+2+jjPPY25euOeQ5x9PlIgK1UIy+Jlk4ZuHUgdteeFUhnH58Pbeo4GRYgvQYfzg
	 KCzMxmy0tmV9tre8qKZPsY6Uxdxf0+kzgSasGqj4kNsH7BRwn5557ofD7kegN0YmZOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795663991;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=L4VBflvn3TivwHAVtc50dQzfutQ9xBmlhDeWD6Gn3oc=;
	b=datmVnhh5BrBYZjwMfmlgdh7M3Mb2997icbj5PlYCkBotBHcp3enynmI0JsDmsHjMON7
	 P6+Da5DaBVSdk2s4ypnLLfOkkJKaOzSnfwnGVv3XGIhE3rGUii5gTzfiKCXxSQ3XSNltT
	 V6txRaw3/Cxfks303IaQYJ/CvUO/LHNQZx722y4h7tbZ0gf4M2V+kEXD1qgDWchP/GLKi
	 CAFR3X2CF+205PyNfbfVf++7Rf00M/LSBwnMUfVQT4p/5a7MR9yUhSQ92mFJVlsQoe2Uv
	 jVA2iMZ/vDwDLE/b30PfJOWSxhZRIJ6qeFwiRoCOuM+WKn7o/WhkJ6+7Lm5Of9enjvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=Re76GpXC;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E6E60A381E;
	Thu, 26 Nov 2026 03:33:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1E6E60A381E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=Re76GpXC
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AQ3WHXY03951801, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795663937; bh=L4VBflvn3TivwHAVtc50dQzfutQ9xBmlhDeWD6Gn3oc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=Re76GpXCQW3YHN8aRk4qSJCck1T0gQCcxpmKtgw0Uqr/fJUgxgPoa91xjzpBCpTxZ
	 bJd7CF6qubzxV5QahW2sGFH7svGorARd6thL8E4cIKwg9VrFkhgJGK7IMeKfr6uDq4
	 QyBOoPew3CQF0LbAmx1YkNytpk8xjlxoMiNEmR1Ao9uCv+oxi2qy6lS/grXRkbfpd/
	 H95hdt1OjLQtJx8A1VZ/N1P5hDHfXuRdRaMdYAA6FSRVi388/GtRDirHLV8nHW82qW
	 S/kVmDELSHXFermWC7Y/cQX3ScFZBVVEXFYnzrkU7JY2YEYmwphMhDyRnDBEB/NYI1
	 If1/OG82/LqhA==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AQ3WHXY03951801
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 26 Nov 2026 11:32:17 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 26 Nov 2026 11:32:16 +0800
Received: from fc44.realtek.com.tw (172.22.241.7) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Thu, 26 Nov 2026 11:32:16 +0800
From: Chih Kai Hsu <hsu.chih.kai@realtek.com>
To: <davem@davemloft.net>, <kuba@kernel.org>
CC: <netdev@vger.kernel.org>, <nic_swsd@realtek.com>,
	<linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
	<edumazet@google.com>, <bjorn@mork.no>, <pabeni@redhat.com>,
	<hsu.chih.kai@realtek.com>, <andrew+netdev@lunn.ch>, <mail@birger-koblitz.de>
Subject: [PATCH net-next v9 09/12] r8152: split rtl8156_enable/up/down into per-generation functions
Date: Thu, 26 Nov 2026 11:32:08 +0800
Message-ID: <20261126033211.51850-10-nic_swsd@realtek.com>
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

rtl8156_enable(), rtl8156_up() and rtl8156_down() had accumulated
tp->version range checks to cover RTL8156, RTL8156B, and
RTL8157/RTL8159, including an early bail-out in rtl8156_enable()
that skipped most of the function body for RTL8157/RTL8159. The
result hides which settings belong to which chip, so chip-specific
register differences cannot be reviewed, and cannot be added without
touching the other families.

Give each generation its own enable callback: rtl8156_enable() for
RTL8156 (VER_10/11), rtl8156b_enable() for RTL8156B (VER_12/13/15),
and rtl8157_enable() for RTL8157/RTL8159 (VER_16/17). RTL8157/RTL8159
also get their own rtl8157_up()/rtl8157_down(); RTL8156 and RTL8156B
still share rtl8156_up()/rtl8156_down().

The four chips share most of the up/down sequence, so move it into
r8156_exit_oob() and r8156_enter_oob(), as RTL8152B/8153 do.
Likewise, rtl8156_enable() and rtl8156b_enable() share the idle
spin-down and L1 NYET steps, so move those into small helpers. The
FC patch restart is also done by rtl8153_enable(), so its helper,
rtl_fc_patch_restart(), is shared with it.

Each extracted function reproduces what its chips already did, with
the guards that were true for them inlined and the ones that were
false dropped as unreachable.

No functional change intended.

Signed-off-by: Chih Kai Hsu <hsu.chih.kai@realtek.com>
---
 drivers/net/usb/r8152.c | 290 +++++++++++++++++++++++++---------------
 1 file changed, 185 insertions(+), 105 deletions(-)

diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
index 151acb0f58da6..dbbaf06dca20b 100644
--- a/drivers/net/usb/r8152.c
+++ b/drivers/net/usb/r8152.c
@@ -3714,6 +3714,13 @@ static void r8153_set_rx_early_size(struct r8152 *tp)
 	}
 }
 
+static void rtl_fc_patch_restart(struct r8152 *tp)
+{
+	ocp_word_clr_bits(tp, MCU_TYPE_USB, USB_FW_TASK, FC_PATCH_TASK);
+	usleep_range(1000, 2000);
+	ocp_word_set_bits(tp, MCU_TYPE_USB, USB_FW_TASK, FC_PATCH_TASK);
+}
+
 static int rtl8153_enable(struct r8152 *tp)
 {
 	if (test_bit(RTL8152_INACCESSIBLE, &tp->flags))
@@ -3729,9 +3736,7 @@ static int rtl8153_enable(struct r8152 *tp)
 	switch (tp->version) {
 	case RTL_VER_09:
 	case RTL_VER_14:
-		ocp_word_clr_bits(tp, MCU_TYPE_USB, USB_FW_TASK, FC_PATCH_TASK);
-		usleep_range(1000, 2000);
-		ocp_word_set_bits(tp, MCU_TYPE_USB, USB_FW_TASK, FC_PATCH_TASK);
+		rtl_fc_patch_restart(tp);
 		break;
 	default:
 		break;
@@ -6517,6 +6522,28 @@ static void r8156_fc_parameter(struct r8152 *tp)
 	ocp_write_word(tp, MCU_TYPE_PLA, PLA_RX_FIFO_EMPTY, pause_off / 16);
 }
 
+static void r8156_idle_spdwn_en(struct r8152 *tp, u16 speed)
+{
+	if (speed & _2500bps)
+		ocp_word_clr_bits(tp, MCU_TYPE_PLA, PLA_MAC_PWR_CTRL4,
+				  IDLE_SPDWN_EN);
+	else
+		ocp_word_set_bits(tp, MCU_TYPE_PLA, PLA_MAC_PWR_CTRL4,
+				  IDLE_SPDWN_EN);
+}
+
+static void r8156_l1_nyet_hird(struct r8152 *tp, u16 speed)
+{
+	if (tp->udev->speed != USB_SPEED_HIGH)
+		return;
+
+	/* USB 0xb45e[3:0] l1_nyet_hird */
+	if (is_flow_control(speed))
+		ocp_word_w0w1(tp, MCU_TYPE_USB, USB_L1_CTRL, 0xf, 0xf);
+	else
+		ocp_word_w0w1(tp, MCU_TYPE_USB, USB_L1_CTRL, 0xf, 0x1);
+}
+
 static int rtl8156_enable(struct r8152 *tp)
 {
 	u16 speed;
@@ -6524,53 +6551,50 @@ static int rtl8156_enable(struct r8152 *tp)
 	if (test_bit(RTL8152_INACCESSIBLE, &tp->flags))
 		return -ENODEV;
 
-	if (tp->version < RTL_VER_12)
-		r8156_fc_parameter(tp);
+	r8156_fc_parameter(tp);
 
 	set_tx_qlen(tp);
 	rtl_set_eee_plus(tp);
-
-	if (tp->version >= RTL_VER_12 && tp->version <= RTL_VER_17_QFN100)
-		ocp_word_clr_bits(tp, MCU_TYPE_USB, USB_RX_AGGR_NUM, RX_AGGR_NUM_MASK);
-
 	r8153_set_rx_early_timeout(tp);
 	r8153_set_rx_early_size(tp);
 
 	speed = rtl8152_get_speed(tp);
+	rtl_set_ifg(tp, speed);
 
-	if (tp->version >= RTL_VER_16)
-		rtl_fc_pause_pkt_en(tp, speed);
+	r8156_idle_spdwn_en(tp, speed);
 
-	rtl_set_ifg(tp, speed);
+	if (speed & _1000bps)
+		ocp_write_word(tp, MCU_TYPE_PLA, PLA_EEE_TXTWSYS, 0x11);
+	else if (speed & _500bps)
+		ocp_write_word(tp, MCU_TYPE_PLA, PLA_EEE_TXTWSYS, 0x3d);
 
-	if (tp->version >= RTL_VER_16)
-		return rtl_enable(tp);
+	r8156_l1_nyet_hird(tp, speed);
+	rtl_fc_patch_restart(tp);
 
-	if (speed & _2500bps)
-		ocp_word_clr_bits(tp, MCU_TYPE_PLA, PLA_MAC_PWR_CTRL4,
-				  IDLE_SPDWN_EN);
-	else
-		ocp_word_set_bits(tp, MCU_TYPE_PLA, PLA_MAC_PWR_CTRL4,
-				  IDLE_SPDWN_EN);
+	return rtl_enable(tp);
+}
 
-	if (tp->version < RTL_VER_12) {
-		if (speed & _1000bps)
-			ocp_write_word(tp, MCU_TYPE_PLA, PLA_EEE_TXTWSYS, 0x11);
-		else if (speed & _500bps)
-			ocp_write_word(tp, MCU_TYPE_PLA, PLA_EEE_TXTWSYS, 0x3d);
-	}
+static int rtl8156b_enable(struct r8152 *tp)
+{
+	u16 speed;
 
-	if (tp->udev->speed == USB_SPEED_HIGH) {
-		/* USB 0xb45e[3:0] l1_nyet_hird */
-		if (is_flow_control(speed))
-			ocp_word_w0w1(tp, MCU_TYPE_USB, USB_L1_CTRL, 0xf, 0xf);
-		else
-			ocp_word_w0w1(tp, MCU_TYPE_USB, USB_L1_CTRL, 0xf, 0x1);
-	}
+	if (test_bit(RTL8152_INACCESSIBLE, &tp->flags))
+		return -ENODEV;
 
-	ocp_word_clr_bits(tp, MCU_TYPE_USB, USB_FW_TASK, FC_PATCH_TASK);
-	usleep_range(1000, 2000);
-	ocp_word_set_bits(tp, MCU_TYPE_USB, USB_FW_TASK, FC_PATCH_TASK);
+	set_tx_qlen(tp);
+	rtl_set_eee_plus(tp);
+
+	ocp_word_clr_bits(tp, MCU_TYPE_USB, USB_RX_AGGR_NUM, RX_AGGR_NUM_MASK);
+
+	r8153_set_rx_early_timeout(tp);
+	r8153_set_rx_early_size(tp);
+
+	speed = rtl8152_get_speed(tp);
+	rtl_set_ifg(tp, speed);
+
+	r8156_idle_spdwn_en(tp, speed);
+	r8156_l1_nyet_hird(tp, speed);
+	rtl_fc_patch_restart(tp);
 
 	return rtl_enable(tp);
 }
@@ -6583,6 +6607,29 @@ static void rtl8156_disable(struct r8152 *tp)
 	rtl8153_disable(tp);
 }
 
+static int rtl8157_enable(struct r8152 *tp)
+{
+	u16 speed;
+
+	if (test_bit(RTL8152_INACCESSIBLE, &tp->flags))
+		return -ENODEV;
+
+	set_tx_qlen(tp);
+	rtl_set_eee_plus(tp);
+
+	ocp_word_clr_bits(tp, MCU_TYPE_USB, USB_RX_AGGR_NUM, RX_AGGR_NUM_MASK);
+
+	r8153_set_rx_early_timeout(tp);
+	r8153_set_rx_early_size(tp);
+
+	speed = rtl8152_get_speed(tp);
+	rtl_fc_pause_pkt_en(tp, speed);
+
+	rtl_set_ifg(tp, speed);
+
+	return rtl_enable(tp);
+}
+
 static int rtl8152_set_speed(struct r8152 *tp, u8 autoneg, u32 speed, u8 duplex,
 			     u32 advertising)
 {
@@ -6937,38 +6984,8 @@ static void rtl8156_change_mtu(struct r8152 *tp)
 		       ALIGN(rx_max_size + tp->tx_desc.size, 1024) / 16);
 }
 
-static void rtl8157_change_mtu(struct r8152 *tp)
+static void r8156_exit_oob(struct r8152 *tp)
 {
-	u32 max_pkt_size = mtu_to_size(tp->netdev->mtu);
-	u32 ocp_data;
-
-	ocp_write_word(tp, MCU_TYPE_PLA, PLA_RMS, max_pkt_size);
-
-	/* Use at least 10K for MTPS */
-	ocp_data = max_t(u32, max_pkt_size, 10 * 1024) / 64;
-
-	/* 16 * 1024 / 64 = 0x100, so the max is 0xff for 8 bits data */
-	ocp_data = min_t(u32, ocp_data, 0xff);
-
-	ocp_write_byte(tp, MCU_TYPE_PLA, PLA_MTPS, ocp_data);
-	r8156_fc_parameter(tp);
-
-	/* TX share fifo free credit full threshold */
-	ocp_write_word(tp, MCU_TYPE_PLA, PLA_TXFIFO_CTRL, 512 / 64);
-	ocp_write_word(tp, MCU_TYPE_PLA, PLA_TXFIFO_FULL,
-		       ALIGN(max_pkt_size + tp->tx_desc.size, 1024) / 16);
-}
-
-static void rtl8156_up(struct r8152 *tp)
-{
-	if (test_bit(RTL8152_INACCESSIBLE, &tp->flags))
-		return;
-
-	r8153b_u1u2en(tp, false);
-	if (tp->version < RTL_VER_16)
-		r8153_u2p3en(tp, false);
-	r8153_aldps_en(tp, false);
-
 	rxdy_gated_en(tp, true);
 	r8153_teredo_off(tp);
 
@@ -7000,10 +7017,20 @@ static void rtl8156_up(struct r8152 *tp)
 	/* share FIFO settings */
 	ocp_word_w0w1(tp, MCU_TYPE_PLA, PLA_RXFIFO_FULL, RXFIFO_FULL_MASK,
 		      0x08);
+}
 
-	if (tp->version < RTL_VER_16)
-		ocp_word_clr_bits(tp, MCU_TYPE_PLA, PLA_MAC_PWR_CTRL3,
-				  PLA_MCU_SPDWN_EN);
+static void rtl8156_up(struct r8152 *tp)
+{
+	if (test_bit(RTL8152_INACCESSIBLE, &tp->flags))
+		return;
+
+	r8153b_u1u2en(tp, false);
+	r8153_u2p3en(tp, false);
+	r8153_aldps_en(tp, false);
+
+	r8156_exit_oob(tp);
+
+	ocp_word_clr_bits(tp, MCU_TYPE_PLA, PLA_MAC_PWR_CTRL3, PLA_MCU_SPDWN_EN);
 
 	ocp_word_clr_bits(tp, MCU_TYPE_USB, USB_SPEED_OPTION,
 			  RG_PWRDN_EN | ALL_SPEED_OFF);
@@ -7016,8 +7043,7 @@ static void rtl8156_up(struct r8152 *tp)
 	}
 
 	r8153_aldps_en(tp, true);
-	if (tp->version < RTL_VER_16)
-		r8153_u2p3en(tp, true);
+	r8153_u2p3en(tp, true);
 
 	switch (tp->version) {
 	case RTL_VER_13:
@@ -7025,40 +7051,16 @@ static void rtl8156_up(struct r8152 *tp)
 		/* Enable Clear_SDR */
 		ocp_word_set_bits(tp, MCU_TYPE_USB, 0xd3ca, BIT(15));
 		break;
-	case RTL_VER_16:
-	case RTL_VER_17_QFN68:
-	case RTL_VER_17_QFN100:
-		/* Enable Clear_SDR */
-		ocp_byte_set_bits(tp, MCU_TYPE_USB, 0xd378, BIT(7));
-		/* Clear SDR bit */
-		ocp_word_clr_bits(tp, MCU_TYPE_USB, 0xcd06, BIT(15));
-		break;
 	default:
 		break;
 	}
 
-	if (tp->version < RTL_VER_16 && tp->udev->speed >= USB_SPEED_SUPER)
+	if (tp->udev->speed >= USB_SPEED_SUPER)
 		r8153b_u1u2en(tp, true);
 }
 
-static void rtl8156_down(struct r8152 *tp)
+static void r8156_enter_oob(struct r8152 *tp)
 {
-	if (test_bit(RTL8152_INACCESSIBLE, &tp->flags)) {
-		rtl_drop_queued_tx(tp);
-		return;
-	}
-
-	if (tp->version < RTL_VER_16)
-		ocp_word_set_bits(tp, MCU_TYPE_PLA, PLA_MAC_PWR_CTRL3,
-				  PLA_MCU_SPDWN_EN);
-
-	r8153b_u1u2en(tp, false);
-	if (tp->version < RTL_VER_16) {
-		r8153_u2p3en(tp, false);
-		r8153b_power_cut_en(tp, false);
-	}
-	r8153_aldps_en(tp, false);
-
 	ocp_byte_clr_bits(tp, MCU_TYPE_PLA, PLA_OOB_CTRL, NOW_IS_OOB);
 
 	/* RX FIFO settings for OOB */
@@ -7100,7 +7102,85 @@ static void rtl8156_down(struct r8152 *tp)
 
 	ocp_dword_set_bits(tp, MCU_TYPE_PLA, PLA_RCR,
 			   RCR_APM | RCR_AM | RCR_AB);
+}
+
+static void rtl8156_down(struct r8152 *tp)
+{
+	if (test_bit(RTL8152_INACCESSIBLE, &tp->flags)) {
+		rtl_drop_queued_tx(tp);
+		return;
+	}
 
+	ocp_word_set_bits(tp, MCU_TYPE_PLA, PLA_MAC_PWR_CTRL3,
+			  PLA_MCU_SPDWN_EN);
+
+	r8153b_u1u2en(tp, false);
+	r8153_u2p3en(tp, false);
+	r8153b_power_cut_en(tp, false);
+	r8153_aldps_en(tp, false);
+	r8156_enter_oob(tp);
+	r8153_aldps_en(tp, true);
+}
+
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
+static void rtl8157_up(struct r8152 *tp)
+{
+	if (test_bit(RTL8152_INACCESSIBLE, &tp->flags))
+		return;
+
+	r8153b_u1u2en(tp, false);
+	r8153_aldps_en(tp, false);
+	r8156_exit_oob(tp);
+
+	ocp_word_clr_bits(tp, MCU_TYPE_USB, USB_SPEED_OPTION,
+			  RG_PWRDN_EN | ALL_SPEED_OFF);
+
+	ocp_write_dword(tp, MCU_TYPE_USB, USB_RX_BUF_TH, 0x00600400);
+
+	if (tp->saved_wolopts != __rtl_get_wol(tp)) {
+		netif_warn(tp, ifup, tp->netdev, "wol setting is changed\n");
+		__rtl_set_wol(tp, tp->saved_wolopts);
+	}
+
+	r8153_aldps_en(tp, true);
+
+	/* Enable Clear_SDR */
+	ocp_byte_set_bits(tp, MCU_TYPE_USB, 0xd378, BIT(7));
+	/* Clear SDR bit */
+	ocp_word_clr_bits(tp, MCU_TYPE_USB, 0xcd06, BIT(15));
+}
+
+static void rtl8157_down(struct r8152 *tp)
+{
+	if (test_bit(RTL8152_INACCESSIBLE, &tp->flags)) {
+		rtl_drop_queued_tx(tp);
+		return;
+	}
+
+	r8153b_u1u2en(tp, false);
+	r8153_aldps_en(tp, false);
+	r8156_enter_oob(tp);
 	r8153_aldps_en(tp, true);
 }
 
@@ -10102,7 +10182,7 @@ static int rtl_ops_init(struct r8152 *tp)
 		tp->eee_adv		= MDIO_EEE_1000T | MDIO_EEE_100TX;
 		tp->eee_adv2		= MDIO_EEE_2_5GT;
 		ops->init		= r8156_init;
-		ops->enable		= rtl8156_enable;
+		ops->enable		= rtl8156b_enable;
 		ops->disable		= rtl8153_disable;
 		ops->up			= rtl8156_up;
 		ops->down		= rtl8156_down;
@@ -10141,10 +10221,10 @@ static int rtl_ops_init(struct r8152 *tp)
 		tp->eee_adv		= MDIO_EEE_1000T | MDIO_EEE_100TX;
 		tp->eee_adv2		= MDIO_EEE_2_5GT | MDIO_EEE_5GT;
 		ops->init		= r8157_init;
-		ops->enable		= rtl8156_enable;
+		ops->enable		= rtl8157_enable;
 		ops->disable		= rtl8153_disable;
-		ops->up			= rtl8156_up;
-		ops->down		= rtl8156_down;
+		ops->up			= rtl8157_up;
+		ops->down		= rtl8157_down;
 		ops->unload		= rtl8157_unload;
 		ops->eee_get		= r8153_get_eee;
 		ops->eee_set		= r8152_set_eee;
@@ -10164,10 +10244,10 @@ static int rtl_ops_init(struct r8152 *tp)
 		tp->eee_adv		= MDIO_EEE_100TX | MDIO_EEE_1000T | MDIO_EEE_10GT;
 		tp->eee_adv2		= MDIO_EEE_2_5GT | MDIO_EEE_5GT;
 		ops->init		= r8157_init;
-		ops->enable		= rtl8156_enable;
+		ops->enable		= rtl8157_enable;
 		ops->disable		= rtl8153_disable;
-		ops->up			= rtl8156_up;
-		ops->down		= rtl8156_down;
+		ops->up			= rtl8157_up;
+		ops->down		= rtl8157_down;
 		ops->unload		= rtl8157_unload;
 		ops->eee_get		= r8153_get_eee;
 		ops->eee_set		= r8152_set_eee;
-- 
2.34.1

