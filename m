Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795663982;
	b=XQw3GDuXs6ADAl9Vejwdzm0B34crDyQQYX2Gnf++g9K9m88R81ENfqB1VNcq/3+eaCGf
	 APh/LU1I5B4smOoxa6RcBQY8/g4i3mh1qP4JZf40CxVoy3qYAvYQjMc1PbEXqz+GgBj6S
	 xXZhKtq4qfjm8sRdFCw5UxWP5gCuUdfbk4wGbFEo+UV2M6HztXgzrRo90TEzMfJsDQlYc
	 hN40VWS+AIMhU3cmth3xLcgRwGTeSa4cQqX7ILL4a6TLQQWz658qj2lmP/SuZDQ5i7J5p
	 AFd72ihCzVtcvXB4gPbg6p/JBFOwDCp4O8+3HiapmeivRKUkNEQSGPD7IDQhW1tkL9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795663982;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=EiAevoSnQHm1pzxX2H4GqsV+5nS+rneMpGphjStVlRg=;
	b=J6dj3WjkaMs1B/3J4eOKcv/uiA4B2TleqgN1CLp9JnevpGjT2UMwS7mzHhrfKvFb+ssJ
	 U+XgAb06nBADe0LoB2rYOQiGf4j5yBBF8MpZk489P1bKnLx3dcvlh6PDy+dLdsqHlEEtT
	 vC5ZDrg158xcHsTvXSdROVdH35ZJTslXaBdF8MOBUniDvBTSJS7CTintS9KmGW00D52np
	 g1Wh16Tqr2i0e/SYT4+eEs/0l/5Nho7izGRqgw3koSWi32rJn/r87aUQMBeUSBnEscmW3
	 5UFDvaYZuB69ZeksCiraCxBfbLul8xXbbgL7JOU8IeV/qNzA2UL8LTmZ3lJvycLVmiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=RsXWQuh6;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2EE606A334;
	Thu, 26 Nov 2026 03:33:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A2EE606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=RsXWQuh6
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AQ3WGXe83951801, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795663936; bh=EiAevoSnQHm1pzxX2H4GqsV+5nS+rneMpGphjStVlRg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=RsXWQuh6GKDwLgYWTxEJpgyL+MJTwzSQ6redVSBhiV8/P6v33FNIOkp3fvC1o9yAM
	 LTXEiTa+zkmYgLCHbRltzTQ/ym81Ez9/Woll6VZJvfT+n19jlkgc+MYbvXILc+dfog
	 UgDVIYEkx0wzOKTGBcV3JoNGNGkc4YZF9/y1X3ICWb2JslISiPwqbWl16Keky6dZi2
	 VSIvNcxNdxFnhxPt2+PEEJaWALu8pud33Rk31GxU3JknAzkWT6U2lQPB+QLTe1pQAM
	 cd5FCa5aulIVsSPsQm8ZNezBEScmhjNXqRBtI0pZuyfVFu1N9DN1oMb5niq1UGETIf
	 Pm532RlpX6LPg==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AQ3WGXe83951801
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 26 Nov 2026 11:32:16 +0800
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
Subject: [PATCH net-next v9 06/12] r8152: add new init writes for RTL8156/8156B/8157/8159
Date: Thu, 26 Nov 2026 11:32:05 +0800
Message-ID: <20261126033211.51850-7-nic_swsd@realtek.com>
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

Bring the per-generation init functions in line with the vendor init
sequence by adding writes the shared r8156_init() never performed.

- Clear PREBOOT_OPTION and RMT_WAKE_EN in r8156_init() and
  r8157_init() to drop stale values.  RMT_WAKE_EN is the device's USB
  remote wakeup enable.  The firmware sets it on the host's
  SET_FEATURE(FUNCTION_SUSPEND) or SET_FEATURE(DEVICE_REMOTE_WAKEUP)
  and clears it itself, so the driver never sets it.

- Add r8156b_u2phy_backup() for RTL8156B (VER_13/15).

- Clear AUTO_SPEEDUP in r8157_init().

- Disable interrupt mitigation (0xcf04) in r8157_init().

- Clear the Warm RST / Bus RST event flag (0xcd06 BIT(11)) in
  r8157_init().

- Clear the FW u1u2 patch option (0xb9a6 BIT(0)) and enable the u3phy
  patch backup (0xb9a2) for RTL8159 (VER_17) only.

- Clear RX_END_TRANSFER_EN (0xd406 BIT(11)) for RTL8157 (VER_16), too.
  While it is set, incoming packets are buffered in the RX FIFO and
  Bulk-in transfers are suspended. The bit is zero by default and
  isn't used now. Clear it unconditionally for safety.

Signed-off-by: Chih Kai Hsu <hsu.chih.kai@realtek.com>
---
 drivers/net/usb/r8152.c | 76 ++++++++++++++++++++++++++++++++++-------
 1 file changed, 63 insertions(+), 13 deletions(-)

diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
index a1e7a33b2f50e..7e553652f97ec 100644
--- a/drivers/net/usb/r8152.c
+++ b/drivers/net/usb/r8152.c
@@ -78,6 +78,7 @@
 #define PLA_EEE_TXTWSYS_2P5G	0xe058
 #define PLA_EEEP_CR		0xe080
 #define PLA_MAC_PWR_CTRL	0xe0c0
+#define PLA_RMT_WAKE		0xe0c8
 #define PLA_MAC_PWR_CTRL2	0xe0ca
 #define PLA_MAC_PWR_CTRL3	0xe0cc
 #define PLA_MAC_PWR_CTRL4	0xe0ce
@@ -376,6 +377,9 @@
 #define MCU_CLK_RATIO_MASK	0x0f0f0f0f
 #define ALDPS_SPDWN_RATIO	0x0f87
 
+/* PLA_RMT_WAKE */
+#define RMT_WAKE_EN		BIT(0)
+
 /* PLA_MAC_PWR_CTRL2 */
 #define EEE_SPDWN_RATIO		0x8007
 #define MAC_CLK_SPDWN_EN	BIT(15)
@@ -422,6 +426,7 @@
 
 /* PLA_INDICATE_FALG */
 #define UPCOMING_RUNTIME_D3	BIT(0)
+#define PREBOOT_OPTION		BIT(1)
 
 /* PLA_MACDBG_PRE and PLA_MACDBG_POST */
 #define DEBUG_OE		BIT(0)
@@ -547,6 +552,7 @@
 #define RX_AGG_DISABLE		0x0010
 #define RX_ZERO_EN		0x0080
 #define RX_DESC_16B		0x0400
+#define RX_END_TRANSFER_EN	BIT(11)
 
 /* USB_U2P3_CTRL */
 #define U2P3_ENABLE		0x0001
@@ -8466,6 +8472,15 @@ static void r8157_hw_phy_cfg(struct r8152 *tp)
 	set_bit(PHY_RESET, &tp->flags);
 }
 
+static void r8156b_u2phy_backup(struct r8152 *tp)
+{
+	ocp_write_word(tp, MCU_TYPE_USB, 0xd3ce, 0x181b);
+	ocp_write_dword(tp, MCU_TYPE_USB, 0xd3d0, 0x616ccd99);
+	ocp_write_dword(tp, MCU_TYPE_USB, 0xd3d4, 0x08fc8101);
+	ocp_write_dword(tp, MCU_TYPE_USB, 0xd3d8, 0x159b1100);
+	ocp_write_word(tp, MCU_TYPE_USB, 0xd3dc, 0x0a00);
+}
+
 static void r8156_init(struct r8152 *tp)
 {
 	u16 data;
@@ -8530,11 +8545,24 @@ static void r8156_init(struct r8152 *tp)
 	/* U1/U2/L1 idle timer. 500 us */
 	ocp_write_word(tp, MCU_TYPE_USB, USB_U1U2_TIMER, 500);
 
+	switch (tp->version) {
+	case RTL_VER_13:
+	case RTL_VER_15:
+		r8156b_u2phy_backup(tp);
+		break;
+	default:
+		break;
+	}
+
 	r8153b_power_cut_en(tp, false);
 	r8156_ups_en(tp, false);
 	r8153_queue_wake(tp, false);
 	rtl_runtime_suspend_enable(tp, false);
 
+	ocp_byte_clr_bits(tp, MCU_TYPE_PLA, PLA_INDICATE_FALG, PREBOOT_OPTION);
+
+	ocp_byte_clr_bits(tp, MCU_TYPE_PLA, PLA_RMT_WAKE, RMT_WAKE_EN);
+
 	if (tp->udev->speed >= USB_SPEED_SUPER)
 		r8153b_u1u2en(tp, true);
 
@@ -8644,6 +8672,10 @@ static void r8157_init(struct r8152 *tp)
 
 	r8157_u2p3en(tp, false);
 
+	/* Disable Interrupt Mitigation */
+	ocp_byte_clr_bits(tp, MCU_TYPE_USB, 0xcf04,
+			  BIT(0) | BIT(1) | BIT(2) | BIT(7));
+
 	/* MSC timer = 0xfff * 8ms = 32760 ms */
 	ocp_write_word(tp, MCU_TYPE_USB, USB_MSC_TIMER, 0x0fff);
 
@@ -8655,11 +8687,30 @@ static void r8157_init(struct r8152 *tp)
 	r8153_queue_wake(tp, false);
 	rtl_runtime_suspend_enable(tp, false);
 
+	ocp_byte_clr_bits(tp, MCU_TYPE_PLA, PLA_INDICATE_FALG, PREBOOT_OPTION);
+
+	ocp_byte_clr_bits(tp, MCU_TYPE_PLA, PLA_RMT_WAKE, RMT_WAKE_EN);
+
+	/* Clear Warm RST / Bus RST event flag */
+	ocp_word_clr_bits(tp, MCU_TYPE_USB, 0xcd06, BIT(11));
+
+	switch (tp->version) {
+	case RTL_VER_17:
+		/* Disable FW u1u2 patch option */
+		ocp_byte_clr_bits(tp, MCU_TYPE_USB, 0xb9a6, BIT(0));
+		break;
+	default:
+		break;
+	}
+
 	if (tp->udev->speed >= USB_SPEED_SUPER)
 		r8153b_u1u2en(tp, true);
 
 	usb_enable_lpm(tp->udev);
 
+	/* Disable Auto Speed up */
+	ocp_word_clr_bits(tp, MCU_TYPE_USB, USB_FW_CTRL, AUTO_SPEEDUP);
+
 	r8156_mac_clk_spd(tp, true);
 
 	if (rtl8152_get_speed(tp) & LINK_STATUS)
@@ -8671,19 +8722,9 @@ static void r8157_init(struct r8152 *tp)
 
 	set_bit(GREEN_ETHERNET, &tp->flags);
 
-	/* RX aggregation / 16 bytes RX descriptor
-	 * BIT(11) is specific to RTL8159, with unknown meaning
-	 */
-	switch (tp->version) {
-	case RTL_VER_17:
-		ocp_word_clr_bits(tp, MCU_TYPE_USB, USB_USB_CTRL,
-				  RX_AGG_DISABLE | RX_DESC_16B | BIT(11));
-		break;
-	default:
-		ocp_word_clr_bits(tp, MCU_TYPE_USB, USB_USB_CTRL,
-				  RX_AGG_DISABLE | RX_DESC_16B);
-		break;
-	}
+	/* RX aggregation / 16 bytes RX descriptor / Bulk In End transfer */
+	ocp_word_clr_bits(tp, MCU_TYPE_USB, USB_USB_CTRL,
+			  RX_AGG_DISABLE | RX_DESC_16B | RX_END_TRANSFER_EN);
 
 	/* Disable Rx Zero Len */
 	rtl_bmu_clr_bits(tp, 0x2300, BIT(3));
@@ -8691,6 +8732,15 @@ static void r8157_init(struct r8152 *tp)
 	/* TX descriptor Signature */
 	ocp_byte_clr_bits(tp, MCU_TYPE_USB, 0xd4ae, BIT(1));
 
+	switch (tp->version) {
+	case RTL_VER_17:
+		/* Enable u3phy patch backup */
+		ocp_write_word(tp, MCU_TYPE_USB, 0xb9a2, 0x0448);
+		break;
+	default:
+		break;
+	}
+
 	r8156_mdio_force_mode(tp);
 	rtl_tally_reset(tp);
 
-- 
2.34.1

