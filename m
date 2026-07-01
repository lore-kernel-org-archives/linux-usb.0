Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF95421A17;
	Wed,  1 Jul 2026 23:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782948956; cv=none; b=XX/22wJShZHPfm6cuaX/8MjTbKsdB1L1vzSeLlbBOLjPZkQAAquUJ0RT5C1Xm8P+hFnnrB5UDX/6WIkqWP+y3no1TGDuYSlYBZK/5n2tpmbZRsdFtk4hPxQzQTADyVK1V9WF7+pB0DR1+bjPwo8S7hkOXDtA3ih6LOzYE5zzIYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782948956; c=relaxed/simple;
	bh=2gOCjDK+KcgJAFjAaYkoGk3FRdytc/VSeDILYPLnbho=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vv2W1ks/kPkxaT+h0Hwy0/B7uy72sB4oRGqZDB/+YrkRwG4WtoZlscp5mXULpnPLMKuDn/VZ8qpo3m3VWaPN7ldwnuDO7ovOdtZhBcoOjmRb1ss2Jk537il15Bv9HahWZurMyekeQ6WAgeqQ23GTiObFs3netcaMlKxf1DNvnMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=GQULeS7T; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="GQULeS7T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782948949;
	bh=2gOCjDK+KcgJAFjAaYkoGk3FRdytc/VSeDILYPLnbho=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GQULeS7Tx3hj8MGye64jU9pe1ZXChXulR7hs6BFVWQFkJyABcVNC4H6GT2YxhgCZk
	 GGPd/r58xv3VmBswLn6E7frz1nhS2/tfToMzUJ39lbMPz8pJ9PFlzpGJolYFOErulo
	 Zjj0E6ircc2+j6uxrElvEL5PehxLl/BtbhSr+hgvQdltyLTHCMC6Um+wzN7DcZ9x0M
	 RDCN/kk/DhNwQysm4lwasrtHzdxbbPeUL1o7MptOu1D3iGlaAsTxtQrLmGedJKzxhu
	 uBk+Uf76CwjV9ocvGqZAj/5zq9/KtGOVg1QRBiMZkiqx3tmYWDK4944EOFSdGJJMqp
	 ER43WtkOKCOGg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7B3DF17E15DA;
	Thu,  2 Jul 2026 01:35:49 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id BE32748004C; Thu, 02 Jul 2026 01:35:48 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 02 Jul 2026 01:35:50 +0200
Subject: [PATCH v9 12/38] phy: rockchip: usbdp: Support single-lane DP
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-rockchip-usbdp-cleanup-v9-12-e31efbb62d2e@collabora.com>
References: <20260702-rockchip-usbdp-cleanup-v9-0-e31efbb62d2e@collabora.com>
In-Reply-To: <20260702-rockchip-usbdp-cleanup-v9-0-e31efbb62d2e@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5347;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=eqkQT9ichevTJAvYhhYICZIjsEJNd+go0SqLty1Qs48=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpFpFPFAi7DFiiMetgUhzjHPlJNY8on5/7Yn
 HweCGUCYw0TDIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqRaRTAAoJENju1/PI
 O/qatzwQAI71Fxl4E3DRpXrmUO++UHwb5m61SNIgGxHm8Qd4ffmd/zKw9jbLhFamXabFaYsppm8
 +MdEM6RpgBto3sJEXNjFvneRUOWRSxvbvY/g2NZG84762HDFb7wL6QcPjIRupkdTPlGt9F9GdtM
 vjd7Xh4O1kGS6f5e6SA+qg9aWyLxN0cL4TpsdIn3Q+wIOJOI8p5WBWggOZWK/EXiqBv3Z7Qh5vy
 BtpO6J+rNhf4JEBTD10WFZSdIzgQu576kxTskGlE3PU8ztA86zxRTCOPVXX9faUg04bBTBPG5Qq
 wqho6UWqPKjXOoKJ77QpLjgZBtBhGA2kQ02m2dtN53m/ykIHLiCULUNNeJGkDVfMSSFRRimSyc2
 Phk6cbpqU43M5O1Ta6FBOtN3tAEVXneTImP6TZMQEsA6JZYVhSU3Y6EA2DXuYeP2/L1AlDSeO9r
 dicVGLgxTtlVZWipHWeZYhuJ518WayQw2ibaJ3SGUSh8ewTRNV0wPMT47jgmYuQUWMIfWUWuc4v
 DzawbYQTyM9wVMvXbPJh+QPJs3V0+wgjoamnQ24epkS+YELGdeoFsPfLvUlyWdJJnM5nn64zRaT
 BMR1WLOfp/g+yx27v22fSnknzbZuwgmPcYHX41ca9wfV0bn0mquE1GY0MuNoej/zSD8qSmpeOeq
 O1zTWR4TG+eeLrpMM+0QpYQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

From: Zhang Yubing <yubing.zhang@rock-chips.com>

Implement support for using just a single DisplayPort line.

Signed-off-by: Zhang Yubing <yubing.zhang@rock-chips.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 64 +++++++++++++------------------
 1 file changed, 27 insertions(+), 37 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 6333b5cc7151..da15178d7f16 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -193,6 +193,7 @@ struct rk_udphy {
 	int id;
 
 	bool dp_in_use;
+	int dp_lanes;
 
 	/* PHY const config */
 	const struct rk_udphy_cfg *cfgs;
@@ -540,6 +541,13 @@ static void rk_udphy_usb_bvalid_enable(struct rk_udphy *udphy, u8 enable)
  * <0 1>                  dpln0         dpln1       usbrx         usbtx
  * <2 3>                  usbrx         usbtx       dpln0         dpln1
  * ---------------------------------------------------------------------------
+ * if 1 lane for dp function, 2 lane for usb function, define rockchip,dp-lane-mux = <x>;
+ * sample as follow:
+ * ---------------------------------------------------------------------------
+ *                        B11-B10       A2-A3       A11-A10       B2-B3
+ * rockchip,dp-lane-mux   ln0(tx/rx)    ln1(tx)     ln2(tx/rx)    ln3(tx)
+ * <0>                    dpln0         \           usbrx         usbtx
+ * ---------------------------------------------------------------------------
  */
 
 static void rk_udphy_dplane_select(struct rk_udphy *udphy)
@@ -547,18 +555,18 @@ static void rk_udphy_dplane_select(struct rk_udphy *udphy)
 	const struct rk_udphy_cfg *cfg = udphy->cfgs;
 	u32 value = 0;
 
-	switch (udphy->mode) {
-	case UDPHY_MODE_DP:
-		value |= 2 << udphy->dp_lane_sel[2] * 2;
+	switch (udphy->dp_lanes) {
+	case 4:
 		value |= 3 << udphy->dp_lane_sel[3] * 2;
+		value |= 2 << udphy->dp_lane_sel[2] * 2;
 		fallthrough;
 
-	case UDPHY_MODE_DP_USB:
-		value |= 0 << udphy->dp_lane_sel[0] * 2;
+	case 2:
 		value |= 1 << udphy->dp_lane_sel[1] * 2;
-		break;
+		fallthrough;
 
-	case UDPHY_MODE_USB:
+	case 1:
+		value |= 0 << udphy->dp_lane_sel[0] * 2;
 		break;
 
 	default:
@@ -571,28 +579,6 @@ static void rk_udphy_dplane_select(struct rk_udphy *udphy)
 		     FIELD_PREP(DP_AUX_DOUT_SEL, udphy->dp_aux_dout_sel) | value);
 }
 
-static int rk_udphy_dplane_get(struct rk_udphy *udphy)
-{
-	int dp_lanes;
-
-	switch (udphy->mode) {
-	case UDPHY_MODE_DP:
-		dp_lanes = 4;
-		break;
-
-	case UDPHY_MODE_DP_USB:
-		dp_lanes = 2;
-		break;
-
-	case UDPHY_MODE_USB:
-	default:
-		dp_lanes = 0;
-		break;
-	}
-
-	return dp_lanes;
-}
-
 static void rk_udphy_dplane_enable(struct rk_udphy *udphy, int dp_lanes)
 {
 	u32 val = 0;
@@ -662,6 +648,7 @@ static void rk_udphy_set_typec_default_mapping(struct rk_udphy *udphy)
 	}
 
 	rk_udphy_mode_set(udphy, UDPHY_MODE_DP_USB);
+	udphy->dp_lanes = 2;
 }
 
 static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
@@ -900,7 +887,7 @@ static int rk_udphy_parse_lane_mux_data(struct rk_udphy *udphy)
 		return 0;
 	}
 
-	if (num_lanes != 2 && num_lanes != 4)
+	if (num_lanes != 1 && num_lanes != 2 && num_lanes != 4)
 		return dev_err_probe(udphy->dev, -EINVAL,
 				     "invalid number of lane mux\n");
 
@@ -926,9 +913,11 @@ static int rk_udphy_parse_lane_mux_data(struct rk_udphy *udphy)
 	}
 
 	udphy->mode = UDPHY_MODE_DP;
-	if (num_lanes == 2) {
+	udphy->dp_lanes = num_lanes;
+	if (num_lanes == 1 || num_lanes == 2) {
 		udphy->mode |= UDPHY_MODE_USB;
-		udphy->flip = (udphy->lane_mux_sel[0] == PHY_LANE_MUX_DP);
+		udphy->flip = (udphy->lane_mux_sel[0] == PHY_LANE_MUX_DP) ||
+			      (udphy->lane_mux_sel[1] == PHY_LANE_MUX_DP);
 	}
 
 	return 0;
@@ -1085,18 +1074,17 @@ static int rk_udphy_dp_phy_exit(struct phy *phy)
 static int rk_udphy_dp_phy_power_on(struct phy *phy)
 {
 	struct rk_udphy *udphy = phy_get_drvdata(phy);
-	int ret, dp_lanes;
+	int ret;
 
 	mutex_lock(&udphy->mutex);
 
-	dp_lanes = rk_udphy_dplane_get(udphy);
-	phy_set_bus_width(phy, dp_lanes);
+	phy_set_bus_width(phy, udphy->dp_lanes);
 
 	ret = rk_udphy_power_on(udphy, UDPHY_MODE_DP);
 	if (ret)
 		goto unlock;
 
-	rk_udphy_dplane_enable(udphy, dp_lanes);
+	rk_udphy_dplane_enable(udphy, udphy->dp_lanes);
 
 	rk_udphy_dplane_select(udphy);
 
@@ -1376,6 +1364,7 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 		udphy->lane_mux_sel[2] = PHY_LANE_MUX_DP;
 		udphy->lane_mux_sel[3] = PHY_LANE_MUX_DP;
 		mode = UDPHY_MODE_DP;
+		udphy->dp_lanes = 4;
 		break;
 
 	case TYPEC_DP_STATE_D:
@@ -1392,6 +1381,7 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 			udphy->lane_mux_sel[3] = PHY_LANE_MUX_DP;
 		}
 		mode = UDPHY_MODE_DP_USB;
+		udphy->dp_lanes = 2;
 		break;
 	}
 
@@ -1540,7 +1530,7 @@ static int rk_udphy_probe(struct platform_device *pdev)
 		ret = PTR_ERR(udphy->phy_dp);
 		return dev_err_probe(dev, ret, "failed to create DP phy\n");
 	}
-	phy_set_bus_width(udphy->phy_dp, rk_udphy_dplane_get(udphy));
+	phy_set_bus_width(udphy->phy_dp, udphy->dp_lanes);
 	udphy->phy_dp->attrs.max_link_rate = 8100;
 	phy_set_drvdata(udphy->phy_dp, udphy);
 

-- 
2.53.0

