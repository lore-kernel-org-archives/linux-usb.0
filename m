Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795663983;
	b=VJrUcUkizNRujqGthCNgPTKmOQQVwuwzvHCXmSKr/mnhr9GfEC+Lb7ggm+T9gY7KuJxA
	 WUA9MB3nT92Qt7sjM5ZFtgC3LI46ECK5xf7i4/UsunV04DgEXn7DBg2XAEMklW1OpKia1
	 hyws7h6IlHmbW6TU5qh8FFs2uqmmActmZLkv1Fdx8weeJ4FESoFYi9OnI30+wT4CdJ+mo
	 NTZ2uyWPnx1tB5FufmJ9nQXQNrnafiA7mmFaGphzzIHp7BCL2TnmxNGYR9hWfV+F+Lf2K
	 J3bzow+gM9PAjNNomgUIPKbrMmVn+C1SpnqBLX6IseW9XAW9bM0ERzm/n5fuqk4p7jQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795663983;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=VZ216M9X5zZchB4YX/Ob1E/0Purgil3LfpxNOeubcOc=;
	b=xoKT5Z1puGKnx/sieC+e7NG1egdCCkyPVB7tEtiYz5hYr7eOccPBHF1eodYdvVd9qsUY
	 Hom0j6y7D8aQnqzaRv6lvSKDrpUMbiW8Se2kWxv4fSee7pPw2YIibmm6wqwQTfJ6BF45n
	 BApSu8IMcVYUWGh1ldwDv13Wenw3BeWHsbEoKCLWN9OfELxtg7wOyfGkg1bJIac6e/7QF
	 YBwt+bfN2SdeVt8LAWSv66QOObMi1o4NMre9dehD0K0z1Q9okNfKQ5HfdX2FSvfNywSte
	 gwoI98FveOQBrT4du6RXpMmzV0N0VSrp4LwgA4Jub34qUlmJIJ+CTW8BOj3+7VEEhxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=HcXq8mPd;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23584606A6A2;
	Thu, 26 Nov 2026 03:33:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23584606A6A2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=HcXq8mPd
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AQ3WGXf83951801, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795663937; bh=VZ216M9X5zZchB4YX/Ob1E/0Purgil3LfpxNOeubcOc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=HcXq8mPdfSBu/3IJ9U+cwfu/GwHx16WXbZsOyKhUC0tK0B4zn9fVV95OT9KcDVHZx
	 S8epTv094ZpufJyg1ZrJxNxgP15K02KmBKnqsIrXyurGl2cDbtVBNew74vRkF2GVJA
	 jrq4s4kmpEnJjfVrmxIossV12w3lXUV6oKqKD9x+vNqxdwcGjMeV6KNdwutiNdwT7i
	 1AzkENPxqqKDsgFfkqsdYwLLXHDOB7ASWKhwGCDfeodEjzL0GxPL6nTetTQ7RsbEO8
	 8ZBqiNRgLq1985lOYRkaXlaipi7I7BZqVMXPVNB+aAp727NfblR0BIv2f/xUa3itdP
	 +oZWItQg20RsA==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AQ3WGXf83951801
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
Subject: [PATCH net-next v9 08/12] r8152: split RTL_VER_17 into QFN68 and QFN100 package variants
Date: Thu, 26 Nov 2026 11:32:07 +0800
Message-ID: <20261126033211.51850-9-nic_swsd@realtek.com>
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

RTL8159 is sold in QFN68 and QFN100 packages, and only QFN68 needs
the u2phy backup-restore patch and enables UPS (in a later patch).
There was previously no way to tell the two apart at runtime, since
both used the same RTL_VER_17.

Split RTL_VER_17 into RTL_VER_17_QFN68 and RTL_VER_17_QFN100 and
update every switch/case on RTL_VER_17 in the driver to handle both.
Detect the package by reading the new PLA_PKG_DET register
(0xdc48, masked with PKG_MASK = 0x1e) via a new __rtl_get_pkg_det()
helper, called from __rtl_get_hw_ver() when the chip ID is 0x2020:
pkg_det value 0x1e/0x1c selects QFN68, 0x18/0x1a selects QFN100, and
any other value logs "Unknown package" and falls back to
RTL_VER_UNKNOWN. A failed read of the register is logged separately
and also yields RTL_VER_UNKNOWN, since guessing a package could load
the wrong firmware.

QFN100 uses a different firmware image from QFN68, so rtl_fw_init()
selects rtl8159-2.fw for it and keeps rtl8159-1.fw for QFN68.

r8157_init() gains a QFN68-only write ("Enable u2phy backup restore
patch", 0xb99c BIT(0)) that does not apply to QFN100.

Signed-off-by: Chih Kai Hsu <hsu.chih.kai@realtek.com>
---
 drivers/net/usb/r8152.c | 122 ++++++++++++++++++++++++++++++++--------
 1 file changed, 100 insertions(+), 22 deletions(-)

diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
index 3e16d0f832bc3..151acb0f58da6 100644
--- a/drivers/net/usb/r8152.c
+++ b/drivers/net/usb/r8152.c
@@ -64,6 +64,7 @@
 #define PLA_MACDBG_POST		0xd38e	/* RTL_VER_04 only */
 #define PLA_EXTRA_STATUS	0xd398
 #define PLA_GPHY_CTRL		0xd3ae
+#define PLA_PKG_DET		0xdc48
 #define PLA_POL_GPIO_CTRL	0xdc6a
 #define PLA_EFUSE_DATA		0xdd00
 #define PLA_EFUSE_CMD		0xdd02
@@ -291,6 +292,9 @@
 #define IFG_144NS		BIT(9)
 #define IFG_96NS		(BIT(9) | BIT(8))
 
+/* PLA_PKG_DET */
+#define PKG_MASK		0x1e
+
 /* PLA_MTPS */
 #define MTPS_JUMBO		(12 * 1024 / 64)
 #define MTPS_DEFAULT		(6 * 1024 / 64)
@@ -1258,7 +1262,8 @@ enum rtl_version {
 	RTL_VER_14,
 	RTL_VER_15,
 	RTL_VER_16,
-	RTL_VER_17,
+	RTL_VER_17_QFN68,
+	RTL_VER_17_QFN100,
 
 	RTL_VER_MAX
 };
@@ -3423,7 +3428,8 @@ static void rtl8152_nic_reset(struct r8152 *tp)
 		break;
 
 	case RTL_VER_16:
-	case RTL_VER_17:
+	case RTL_VER_17_QFN68:
+	case RTL_VER_17_QFN100:
 		ocp_byte_clr_bits(tp, MCU_TYPE_PLA, PLA_CR, CR_RE | CR_TE);
 		break;
 
@@ -3463,7 +3469,7 @@ static void rtl_eee_plus_en(struct r8152 *tp, bool enable)
 
 static void rtl_set_eee_plus(struct r8152 *tp)
 {
-	if (tp->version == RTL_VER_17)
+	if (tp->version == RTL_VER_17_QFN68 || tp->version == RTL_VER_17_QFN100)
 		return rtl_eee_plus_en(tp, false);
 
 	if (rtl8152_get_speed(tp) & _10bps)
@@ -3651,7 +3657,8 @@ static void r8153_set_rx_early_timeout(struct r8152 *tp)
 	case RTL_VER_13:
 	case RTL_VER_15:
 	case RTL_VER_16:
-	case RTL_VER_17:
+	case RTL_VER_17_QFN68:
+	case RTL_VER_17_QFN100:
 		ocp_write_word(tp, MCU_TYPE_USB, USB_RX_EARLY_TIMEOUT,
 			       640 / 8);
 		ocp_write_word(tp, MCU_TYPE_USB, USB_RX_EXTRA_AGGR_TMR,
@@ -3696,7 +3703,8 @@ static void r8153_set_rx_early_size(struct r8152 *tp)
 			       ocp_data / 8);
 		break;
 	case RTL_VER_16:
-	case RTL_VER_17:
+	case RTL_VER_17_QFN68:
+	case RTL_VER_17_QFN100:
 		ocp_write_word(tp, MCU_TYPE_USB, USB_RX_EARLY_SIZE,
 			       ocp_data / 16);
 		break;
@@ -3812,6 +3820,8 @@ static void rtl_rx_vlan_en(struct r8152 *tp, bool enable)
 	case RTL_VER_13:
 	case RTL_VER_15:
 	case RTL_VER_16:
+	case RTL_VER_17_QFN68:
+	case RTL_VER_17_QFN100:
 	default:
 		if (enable)
 			ocp_word_set_bits(tp, MCU_TYPE_PLA, PLA_RCR1,
@@ -4492,6 +4502,8 @@ static void r8153_teredo_off(struct r8152 *tp)
 	case RTL_VER_14:
 	case RTL_VER_15:
 	case RTL_VER_16:
+	case RTL_VER_17_QFN68:
+	case RTL_VER_17_QFN100:
 	default:
 		/* The bit 0 ~ 7 are relative with teredo settings. They are
 		 * W1C (write 1 to clear), so set all 1 to disable it.
@@ -4546,7 +4558,8 @@ static void rtl_clear_bp(struct r8152 *tp, u16 type)
 		break;
 	case RTL_VER_14:
 	case RTL_VER_16:
-	case RTL_VER_17:
+	case RTL_VER_17_QFN68:
+	case RTL_VER_17_QFN100:
 	default:
 		ocp_write_word(tp, type, USB_BP2_EN, 0);
 		bp_num = 16;
@@ -4658,7 +4671,8 @@ static bool rtl8152_is_fw_phy_speed_up_ok(struct r8152 *tp, struct fw_phy_speed_
 	case RTL_VER_13:
 	case RTL_VER_15:
 	case RTL_VER_16:
-	case RTL_VER_17:
+	case RTL_VER_17_QFN68:
+	case RTL_VER_17_QFN100:
 	default:
 		break;
 	}
@@ -4905,7 +4919,8 @@ static bool rtl8152_is_fw_mac_ok(struct r8152 *tp, struct fw_mac *mac)
 			break;
 		case RTL_VER_14:
 		case RTL_VER_16:
-		case RTL_VER_17:
+		case RTL_VER_17_QFN68:
+		case RTL_VER_17_QFN100:
 			fw_reg = 0xf800;
 			bp_ba_addr = PLA_BP_BA;
 			bp_en_addr = USB_BP2_EN;
@@ -4935,7 +4950,8 @@ static bool rtl8152_is_fw_mac_ok(struct r8152 *tp, struct fw_mac *mac)
 		case RTL_VER_14:
 		case RTL_VER_15:
 		case RTL_VER_16:
-		case RTL_VER_17:
+		case RTL_VER_17_QFN68:
+		case RTL_VER_17_QFN100:
 			fw_reg = 0xe600;
 			bp_ba_addr = USB_BP_BA;
 			bp_en_addr = USB_BP2_EN;
@@ -5822,7 +5838,8 @@ static void rtl_eee_enable(struct r8152 *tp, bool enable)
 	case RTL_VER_13:
 	case RTL_VER_15:
 	case RTL_VER_16:
-	case RTL_VER_17:
+	case RTL_VER_17_QFN68:
+	case RTL_VER_17_QFN100:
 		if (enable) {
 			r8156_eee_en(tp, true);
 			ocp_reg_write(tp, OCP_EEE_ADV, tp->eee_adv);
@@ -6013,7 +6030,8 @@ static void rtl_fc_pause_pkt_en(struct r8152 *tp, u16 speed)
 		ocp_word_set_bits(tp, MCU_TYPE_USB, USB_FW_TASK, FC_PATCH_TASK);
 		break;
 	case RTL_VER_16:
-	case RTL_VER_17:
+	case RTL_VER_17_QFN68:
+	case RTL_VER_17_QFN100:
 		ocp_word_clr_bits(tp, MCU_TYPE_PLA, PLA_RCR, SLOT_EN);
 
 		num_pause_pkts = 0xa;
@@ -6512,7 +6530,7 @@ static int rtl8156_enable(struct r8152 *tp)
 	set_tx_qlen(tp);
 	rtl_set_eee_plus(tp);
 
-	if (tp->version >= RTL_VER_12 && tp->version <= RTL_VER_17)
+	if (tp->version >= RTL_VER_12 && tp->version <= RTL_VER_17_QFN100)
 		ocp_word_clr_bits(tp, MCU_TYPE_USB, USB_RX_AGGR_NUM, RX_AGGR_NUM_MASK);
 
 	r8153_set_rx_early_timeout(tp);
@@ -7008,7 +7026,8 @@ static void rtl8156_up(struct r8152 *tp)
 		ocp_word_set_bits(tp, MCU_TYPE_USB, 0xd3ca, BIT(15));
 		break;
 	case RTL_VER_16:
-	case RTL_VER_17:
+	case RTL_VER_17_QFN68:
+	case RTL_VER_17_QFN100:
 		/* Enable Clear_SDR */
 		ocp_byte_set_bits(tp, MCU_TYPE_USB, 0xd378, BIT(7));
 		/* Clear SDR bit */
@@ -7052,7 +7071,8 @@ static void rtl8156_down(struct r8152 *tp)
 
 	switch (tp->version) {
 	case RTL_VER_16:
-	case RTL_VER_17:
+	case RTL_VER_17_QFN68:
+	case RTL_VER_17_QFN100:
 		ocp_write_word(tp, MCU_TYPE_PLA, PLA_RMS, 1526);
 		ocp_write_byte(tp, MCU_TYPE_PLA, PLA_MTPS, 10 * 1024 / 64);
 		break;
@@ -8258,7 +8278,8 @@ static void r8157_hw_phy_cfg(struct r8152 *tp)
 		sram2_write_w0w1(tp, 0x809d, 0xff00, 0x5000);
 		break;
 
-	case RTL_VER_17:
+	case RTL_VER_17_QFN68:
+	case RTL_VER_17_QFN100:
 		/* Disable bypass turn off clk in ALDPS */
 		ocp_byte_clr_bits(tp, MCU_TYPE_PLA, 0xd3c8, BIT(0));
 
@@ -8652,7 +8673,8 @@ static void r8157_init(struct r8152 *tp)
 		return;
 
 	switch (tp->version) {
-	case RTL_VER_17:
+	case RTL_VER_17_QFN68:
+	case RTL_VER_17_QFN100:
 		if (r8159_wait_backup_restore(tp)) {
 			rtl_set_inaccessible(tp);
 			dev_err(&tp->intf->dev,
@@ -8699,7 +8721,8 @@ static void r8157_init(struct r8152 *tp)
 	ocp_word_clr_bits(tp, MCU_TYPE_USB, 0xcd06, BIT(11));
 
 	switch (tp->version) {
-	case RTL_VER_17:
+	case RTL_VER_17_QFN68:
+	case RTL_VER_17_QFN100:
 		/* Disable FW u1u2 patch option */
 		ocp_byte_clr_bits(tp, MCU_TYPE_USB, 0xb9a6, BIT(0));
 		break;
@@ -8737,7 +8760,11 @@ static void r8157_init(struct r8152 *tp)
 	ocp_byte_clr_bits(tp, MCU_TYPE_USB, 0xd4ae, BIT(1));
 
 	switch (tp->version) {
-	case RTL_VER_17:
+	case RTL_VER_17_QFN68:
+		/* Enable u2phy backup restore patch */
+		ocp_byte_set_bits(tp, MCU_TYPE_USB, 0xb99c, BIT(0));
+		fallthrough;
+	case RTL_VER_17_QFN100:
 		/* Enable u3phy patch backup */
 		ocp_write_word(tp, MCU_TYPE_USB, 0xb9a2, 0x0448);
 		break;
@@ -10131,7 +10158,8 @@ static int rtl_ops_init(struct r8152 *tp)
 		r8157_desc_init(tp);
 		break;
 
-	case RTL_VER_17:
+	case RTL_VER_17_QFN68:
+	case RTL_VER_17_QFN100:
 		tp->eee_en		= true;
 		tp->eee_adv		= MDIO_EEE_100TX | MDIO_EEE_1000T | MDIO_EEE_10GT;
 		tp->eee_adv2		= MDIO_EEE_2_5GT | MDIO_EEE_5GT;
@@ -10172,6 +10200,7 @@ static int rtl_ops_init(struct r8152 *tp)
 #define FIRMWARE_8156B_2	"rtl_nic/rtl8156b-2.fw"
 #define FIRMWARE_8157_1		"rtl_nic/rtl8157-1.fw"
 #define FIRMWARE_8159_1		"rtl_nic/rtl8159-1.fw"
+#define FIRMWARE_8159_2		"rtl_nic/rtl8159-2.fw"
 
 MODULE_FIRMWARE(FIRMWARE_8153A_2);
 MODULE_FIRMWARE(FIRMWARE_8153A_3);
@@ -10182,6 +10211,7 @@ MODULE_FIRMWARE(FIRMWARE_8156A_2);
 MODULE_FIRMWARE(FIRMWARE_8156B_2);
 MODULE_FIRMWARE(FIRMWARE_8157_1);
 MODULE_FIRMWARE(FIRMWARE_8159_1);
+MODULE_FIRMWARE(FIRMWARE_8159_2);
 
 static int rtl_fw_init(struct r8152 *tp)
 {
@@ -10223,9 +10253,12 @@ static int rtl_fw_init(struct r8152 *tp)
 	case RTL_VER_16:
 		rtl_fw->fw_name		= FIRMWARE_8157_1;
 		break;
-	case RTL_VER_17:
+	case RTL_VER_17_QFN68:
 		rtl_fw->fw_name		= FIRMWARE_8159_1;
 		break;
+	case RTL_VER_17_QFN100:
+		rtl_fw->fw_name		= FIRMWARE_8159_2;
+		break;
 	default:
 		break;
 	}
@@ -10233,9 +10266,40 @@ static int rtl_fw_init(struct r8152 *tp)
 	return 0;
 }
 
+static int __rtl_get_pkg_det(struct usb_device *udev, u32 *pkg_det)
+{
+	__le32 *tmp;
+	int ret, i;
+
+	tmp = kmalloc_obj(*tmp);
+	if (!tmp)
+		return -ENOMEM;
+
+	for (i = 0, ret = 0; i < 3 && ret != 4; i++)
+		ret = usb_control_msg(udev, usb_rcvctrlpipe(udev, 0),
+				      RTL8152_REQ_GET_REGS, RTL8152_REQT_READ,
+				      PLA_PKG_DET, MCU_TYPE_PLA, tmp,
+				      sizeof(*tmp), USB_CTRL_GET_TIMEOUT);
+
+	if (ret == sizeof(*tmp)) {
+		if (i != 1)
+			dev_warn(&udev->dev,
+				 "Needed %d retries to read package\n", i - 1);
+
+		*pkg_det = __le32_to_cpu(*tmp) & PKG_MASK;
+		ret = 0;
+	} else if (ret >= 0) {
+		ret = -EIO;
+	}
+
+	kfree(tmp);
+	return ret;
+}
+
 static u8 __rtl_get_hw_ver(struct usb_device *udev)
 {
 	u32 ocp_data = 0;
+	u32 pkg_det = 0;
 	__le32 *tmp;
 	u8 version;
 	int ret;
@@ -10318,7 +10382,20 @@ static u8 __rtl_get_hw_ver(struct usb_device *udev)
 		version = RTL_VER_16;
 		break;
 	case 0x2020:
-		version = RTL_VER_17;
+		ret = __rtl_get_pkg_det(udev, &pkg_det);
+		if (ret < 0) {
+			version = RTL_VER_UNKNOWN;
+			dev_err(&udev->dev, "Failed to read package: %d\n",
+				ret);
+		} else if (pkg_det == 0x1e || pkg_det == 0x1c) {
+			version = RTL_VER_17_QFN68;
+		} else if (pkg_det == 0x18 || pkg_det == 0x1a) {
+			version = RTL_VER_17_QFN100;
+		} else {
+			version = RTL_VER_UNKNOWN;
+			dev_info(&udev->dev, "Unknown package 0x%04x\n",
+				 pkg_det);
+		}
 		break;
 	default:
 		version = RTL_VER_UNKNOWN;
@@ -10477,7 +10554,8 @@ static int rtl8152_probe_once(struct usb_interface *intf,
 	case RTL_VER_13:
 	case RTL_VER_15:
 	case RTL_VER_16:
-	case RTL_VER_17:
+	case RTL_VER_17_QFN68:
+	case RTL_VER_17_QFN100:
 		netdev->max_mtu = size_to_mtu(16 * 1024);
 		break;
 	case RTL_VER_01:
-- 
2.34.1

