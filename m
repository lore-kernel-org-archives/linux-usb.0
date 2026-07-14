Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9841141E6AF;
	Tue, 14 Jul 2026 19:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784057188; cv=none; b=DL49edOCreDWDNCGJvYYRn2WvkMvq09J0q8vE3u7xVzIOtGygRlLlGOlH0ZSSqy2LPvL+7ObDFp9kzu5CRVOVzGd4RLc6ev4CKVrTpARKNxNLZwbyFDNQTRlneWFWqmpll56XtONW8CjsTR6nHoPhRACoqrqxzpvsxoRIfeI8h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784057188; c=relaxed/simple;
	bh=ENWmYdviD1B+zuVOBmIFaPuAB++ZYGS8e5ixwzCmGWM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=usEsSLGAxcBLJ5CcAVBW1sGQbzbL9VggS1m77N1CG59zjqaSzSbXGiG6LcsMuzQMHZ8n3hXV6ENQGoAvZMdqEVpAUypASXyayFT12IhF98w+SrxHtxfdBueiScbhUdYTrjpd+w/rzWavz7tqDTzbx0t/8JASzkcDiSE9tA6Ki88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=YmLrGeyN; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="YmLrGeyN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784057175;
	bh=ENWmYdviD1B+zuVOBmIFaPuAB++ZYGS8e5ixwzCmGWM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YmLrGeyNBZs0dZx71eKBJqMCq6vFQZyItsHCB8bINZxhGcnVrJIpYjTCOYTEprJ3J
	 Ahe4ufbukZtAxW/oss2ceYj1FfII0gDea3ibDf8+KgVZFi1iEnVWky/sOPBnWeYt2s
	 7kZzch/DbwlSjWDd4eTxf2KkC8EkPpz+8nbdEbnMCjOdQwHf2ra38piqGr69Az7hge
	 BQ8tRqB7KciucwGTwPM76wXQJJVAGwi+MFAqz4AszfBH4aGXMIOKM1ZCeMB+lOmI+a
	 Cr07XmwZfqjL81YQXaTjKwKOcSWRS5EUlTvfXg7b+Z/GfSE3bmKUs9wqxSkJRPhgpw
	 mO3n/Sg9jqOSA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 39FFD17E3862;
	Tue, 14 Jul 2026 21:26:15 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 0AEBA480076; Tue, 14 Jul 2026 21:26:09 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 14 Jul 2026 21:26:33 +0200
Subject: [PATCH v13 32/35] phy: rockchip: usbdp: Rename mode to hw_mode
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-rockchip-usbdp-cleanup-v13-32-6cb3e769d4c5@collabora.com>
References: <20260714-rockchip-usbdp-cleanup-v13-0-6cb3e769d4c5@collabora.com>
In-Reply-To: <20260714-rockchip-usbdp-cleanup-v13-0-6cb3e769d4c5@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@flipper.net>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6966;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=ENWmYdviD1B+zuVOBmIFaPuAB++ZYGS8e5ixwzCmGWM=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpWjVCxW5P4KvgsKt2XqOP8gw3g51aQ/o2lr
 f9pSMpYpvsy+okCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqVo1QAAoJENju1/PI
 O/qa5lMP/AjNX1nALBMA1XUNXfVK5UTmTeYFi52avPMLQKKnHKNg41nW0V/Ift7ejpcMSmMjEqK
 bwH7lxJXnF5I1Kt1hP33gq+rtamt+lLV3uCTWA8PvBjETejWNH9GvB/RCe38TyzvA2PaKM8C+jr
 v2P6uKLO/zDQNVY/2CoYgJCoaUyaYbMQ5ITXEw6mkkevK9eBh5d1vGNYiNsFjEp5cWcWq4J0PLm
 USFSVBpcXGJEcgLb38iioWOe86sEStmTc4N4qjCsHZyWNJG7BbFFEzhyT4NKf3LONgMBtIdNS0o
 9X38J3Vm4joneOFH3iUiuTyxkDusH+hjqhB4aFHsKZT5oYShQK7OUv08G9UJyo6LmiGlAq/Aw5Y
 4z+M+9fBhEL8knboCU3Ry/ziJVcPC5nZKxpuYqmwOyop3uBlKbOWjKi+fZo3xk6KaRR/lUIecgG
 YoaCEK5awzTCufms2Mvwd3ckZwfU3igSxP3N6O3EbRcggsgVLVRqzWTwdRe8yhiPVX55Br5qUaS
 +5lKAk2co4Hi17WbPc8U0esnb2lDzBq6GOkS8hNe+JanMBx1Zpqu+CUJjvN6OBrwWSeU9RnzXqp
 DozJ8ZFjEw2+KfrgPIruA7qvZfKOfG5XtQwLL0Oy4pw9fHWMtVB2I6fwTwtkvfOISWTQ6lDtKZw
 jU5RbpPyQRlNZAUZF8e4wKg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Rename mode field to hw_mode to make clear that this is the modes
currently supported by the hardware, but not necessarily requested
by software. I.e. it is only set by either the USB-C state machine
or device-tree if the PHY is used in a fixed routing setup.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 48 +++++++++++++++----------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index a6fe634574bb..405b3d943602 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -174,7 +174,7 @@ struct rk_udphy {
 	/* PHY status management */
 	bool flip;
 	bool phy_needs_reinit;
-	u8 mode;
+	u8 hw_mode; /* modes currently supported by hardware */
 	u8 status;
 
 	/* utilized for USB */
@@ -579,18 +579,18 @@ static void rk_udphy_dp_lane_enable(struct rk_udphy *udphy, int dp_lanes)
 				   CMN_DP_CMN_RSTN, FIELD_PREP(CMN_DP_CMN_RSTN, 0x0));
 }
 
-static void rk_udphy_mode_set(struct rk_udphy *udphy, u8 mode)
+static void rk_udphy_mode_set(struct rk_udphy *udphy, u8 hw_mode)
 {
-	if (udphy->mode == mode)
+	if (udphy->hw_mode == hw_mode)
 		return;
 
 	udphy->phy_needs_reinit = true;
-	udphy->mode = mode;
+	udphy->hw_mode = hw_mode;
 }
 
 static void rk_udphy_set_typec_state(struct rk_udphy *udphy, unsigned long state)
 {
-	u8 mode;
+	u8 hw_mode;
 
 	switch (state) {
 	case TYPEC_DP_STATE_C:
@@ -599,7 +599,7 @@ static void rk_udphy_set_typec_state(struct rk_udphy *udphy, unsigned long state
 		udphy->lane_mux_sel[1] = PHY_LANE_MUX_DP;
 		udphy->lane_mux_sel[2] = PHY_LANE_MUX_DP;
 		udphy->lane_mux_sel[3] = PHY_LANE_MUX_DP;
-		mode = UDPHY_MODE_DP;
+		hw_mode = UDPHY_MODE_DP;
 		udphy->dp_lanes = 4;
 		break;
 
@@ -616,12 +616,12 @@ static void rk_udphy_set_typec_state(struct rk_udphy *udphy, unsigned long state
 			udphy->lane_mux_sel[2] = PHY_LANE_MUX_DP;
 			udphy->lane_mux_sel[3] = PHY_LANE_MUX_DP;
 		}
-		mode = UDPHY_MODE_DP_USB;
+		hw_mode = UDPHY_MODE_DP_USB;
 		udphy->dp_lanes = 2;
 		break;
 	}
 
-	rk_udphy_mode_set(udphy, mode);
+	rk_udphy_mode_set(udphy, hw_mode);
 }
 
 static void rk_udphy_set_typec_default_mapping(struct rk_udphy *udphy)
@@ -744,7 +744,7 @@ static int rk_udphy_status_check(struct rk_udphy *udphy)
 	int ret;
 
 	/* LCPLL check */
-	if (udphy->mode & UDPHY_MODE_USB) {
+	if (udphy->hw_mode & UDPHY_MODE_USB) {
 		ret = regmap_read_poll_timeout(udphy->pma_regmap, CMN_ANA_LCPLL_DONE_OFFSET,
 					       val, (val & CMN_ANA_LCPLL_AFC_DONE) &&
 					       (val & CMN_ANA_LCPLL_LOCK_DONE), 200, 100000);
@@ -779,15 +779,15 @@ static int rk_udphy_init(struct rk_udphy *udphy)
 	int ret;
 
 	dev_dbg(udphy->dev, "reinit PHY with USB3=%s and DP=%s (%u lanes) flipped=%s\n",
-		str_on_off(udphy->mode & UDPHY_MODE_USB),
-		str_on_off(udphy->mode & UDPHY_MODE_DP),
+		str_on_off(udphy->hw_mode & UDPHY_MODE_USB),
+		str_on_off(udphy->hw_mode & UDPHY_MODE_DP),
 		udphy->dp_lanes, str_yes_no(udphy->flip));
 
 	rk_udphy_reset_assert_all(udphy);
 	usleep_range(10000, 11000);
 
 	/* enable rx lfps for usb */
-	if (udphy->mode & UDPHY_MODE_USB)
+	if (udphy->hw_mode & UDPHY_MODE_USB)
 		rk_udphy_grfreg_write(udphy->udphygrf, &cfg->grfcfg.rx_lfps, true);
 
 	/* Step 1: power on pma and deassert apb rstn */
@@ -824,13 +824,13 @@ static int rk_udphy_init(struct rk_udphy *udphy)
 			   FIELD_PREP(CMN_DP_LANE_EN_ALL, 0));
 
 	/* Step 4: deassert init rstn and wait for 200ns from datasheet */
-	if (udphy->mode & UDPHY_MODE_USB) {
+	if (udphy->hw_mode & UDPHY_MODE_USB) {
 		ret = rk_udphy_reset_deassert(udphy, "init");
 		if (ret)
 			goto assert_resets;
 	}
 
-	if (udphy->mode & UDPHY_MODE_DP) {
+	if (udphy->hw_mode & UDPHY_MODE_DP) {
 		regmap_update_bits(udphy->pma_regmap, CMN_DP_RSTN_OFFSET,
 				   CMN_DP_INIT_RSTN,
 				   FIELD_PREP(CMN_DP_INIT_RSTN, 0x1));
@@ -839,7 +839,7 @@ static int rk_udphy_init(struct rk_udphy *udphy)
 	udelay(1);
 
 	/*  Step 5: deassert cmn/lane rstn */
-	if (udphy->mode & UDPHY_MODE_USB) {
+	if (udphy->hw_mode & UDPHY_MODE_USB) {
 		ret = rk_udphy_reset_deassert(udphy, "cmn");
 		if (ret)
 			goto assert_resets;
@@ -898,7 +898,7 @@ static int rk_udphy_parse_lane_mux_data(struct rk_udphy *udphy)
 	num_lanes = device_property_count_u32(udphy->dev, "rockchip,dp-lane-mux");
 	if (num_lanes < 0) {
 		dev_dbg(udphy->dev, "no dp-lane-mux, following dp alt mode\n");
-		udphy->mode = UDPHY_MODE_USB;
+		udphy->hw_mode = UDPHY_MODE_USB;
 		return 0;
 	}
 
@@ -927,10 +927,10 @@ static int rk_udphy_parse_lane_mux_data(struct rk_udphy *udphy)
 		}
 	}
 
-	udphy->mode = UDPHY_MODE_DP;
+	udphy->hw_mode = UDPHY_MODE_DP;
 	udphy->dp_lanes = num_lanes;
 	if (num_lanes == 1 || num_lanes == 2) {
-		udphy->mode |= UDPHY_MODE_USB;
+		udphy->hw_mode |= UDPHY_MODE_USB;
 		udphy->flip = (udphy->lane_mux_sel[0] == PHY_LANE_MUX_DP) ||
 			      (udphy->lane_mux_sel[1] == PHY_LANE_MUX_DP);
 	}
@@ -989,7 +989,7 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 {
 	int ret;
 
-	if (!(udphy->mode & mode)) {
+	if (!(udphy->hw_mode & mode)) {
 		dev_info(udphy->dev, "mode 0x%02x is not support\n", mode);
 		return 0;
 	}
@@ -1006,7 +1006,7 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 			return ret;
 		}
 
-		if (!udphy->hs && udphy->mode & UDPHY_MODE_USB)
+		if (!udphy->hs && udphy->hw_mode & UDPHY_MODE_USB)
 			rk_udphy_u3_port_disable(udphy, false);
 		udphy->phy_needs_reinit = false;
 
@@ -1023,7 +1023,7 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 			return ret;
 		}
 
-		if (!udphy->hs && udphy->mode & UDPHY_MODE_USB)
+		if (!udphy->hs && udphy->hw_mode & UDPHY_MODE_USB)
 			rk_udphy_u3_port_disable(udphy, false);
 		udphy->phy_needs_reinit = false;
 
@@ -1037,7 +1037,7 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 
 static void rk_udphy_power_off(struct rk_udphy *udphy, u8 mode)
 {
-	if (!(udphy->mode & mode)) {
+	if (!(udphy->hw_mode & mode)) {
 		dev_info(udphy->dev, "mode 0x%02x is not support\n", mode);
 		return;
 	}
@@ -1296,7 +1296,7 @@ static int rk_udphy_usb3_phy_init(struct phy *phy)
 	guard(mutex)(&udphy->mutex);
 
 	/* DP only or high-speed, disable U3 port */
-	if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs) {
+	if (!(udphy->hw_mode & UDPHY_MODE_USB) || udphy->hs) {
 		rk_udphy_u3_port_disable(udphy, true);
 		return 0;
 	}
@@ -1311,7 +1311,7 @@ static int rk_udphy_usb3_phy_exit(struct phy *phy)
 	guard(mutex)(&udphy->mutex);
 
 	/* DP only or high-speed */
-	if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs)
+	if (!(udphy->hw_mode & UDPHY_MODE_USB) || udphy->hs)
 		return 0;
 
 	rk_udphy_power_off(udphy, UDPHY_MODE_USB);

-- 
2.53.0

