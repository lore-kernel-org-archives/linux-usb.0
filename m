Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D71367285;
	Fri,  3 Jul 2026 23:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783121866; cv=none; b=Hqkoobcdg3OFhk+cywCzlySyJ8oCEAvlT7GSzLY2lrLcHwDCa9dyCtzKi/AYOUeca/DuoKZzZUtGsFrFSam1Xu01J2WQF/TpK3MpLf1Z9vMVakbvj2gp3TitGhuKI9xQOTiN+d1immDkdYweIx3q/0xe4WEEEWJZgtZBXBXSFO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783121866; c=relaxed/simple;
	bh=G7gzcG3rzvZ1DYbgPbCbgoSM7OjypvE9b+sVoXF/5IE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KsgY3rrUBgMrStcOv61e4JeEJwvLNmyqVWeuLZrSPPGknewXhvHTe/QQutNSvJokedIyuhFglHmMwBCEDDMHrv12Ww1jUs+PrK9+vrPt8+BRy16/yGO3CbXpDBO61trIEncV2I8dgWymmtp/vX0BtI0voEhN6JGBtElPWRv5V5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ZP4lN1bj; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ZP4lN1bj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783121858;
	bh=G7gzcG3rzvZ1DYbgPbCbgoSM7OjypvE9b+sVoXF/5IE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZP4lN1bj+8hYWEAWvPIqTpmzkSohPOET4GIpsy3Nnsbdc0jcsnlo9uKJuzafgdCib
	 D1OnMsU+n/wdQ0CufbLTFZ7zC/guYma9026jdNeGfkmAFXIcu5v8Jwz8cNr04x5pz4
	 Ng1BMjHtYTPej4L/3upCq6LaJ2uSoiND8zOrGtaPaTk7H+fwIE2UrL74p0LQrR+62q
	 Ib4R3QW+X+LWzYn64NSoPDjEqHw8u7f1d7RkCTm+q5NIGZvcVR7FsJcu4/bDvmX5wN
	 LKZu6Ublb2aq5+ESXESx6j1L0osSWgEeCuTV9kqjxXPT2i7QTJMTTPola/GH8ayFdT
	 Vg1LLQ3L2T0aQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9F3D117E110D;
	Sat,  4 Jul 2026 01:37:38 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id AFE0848007B; Fri, 03 Jul 2026 20:13:32 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 03 Jul 2026 20:13:52 +0200
Subject: [PATCH v10 36/36] phy: rockchip: usbdp: Add USB-C state without DP
 enabled
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-rockchip-usbdp-cleanup-v10-36-a392711ca8a9@collabora.com>
References: <20260703-rockchip-usbdp-cleanup-v10-0-a392711ca8a9@collabora.com>
In-Reply-To: <20260703-rockchip-usbdp-cleanup-v10-0-a392711ca8a9@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3174;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=G7gzcG3rzvZ1DYbgPbCbgoSM7OjypvE9b+sVoXF/5IE=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpH+8zbxfmKN1paMYtxH3d56yQLucHxOrbiK
 Y5zMHCyKaGsVokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqR/vMAAoJENju1/PI
 O/qaPgoP/3Sui93m6nwMcEs9T1XcVeTBBej0nS8mA6Ti4/276gXGiT5iOLKn1p8cBAv6dTmFgmB
 FMfXYDT4+KSzWSdwcqAoKUjMCaU9veaUytf3GQOoRssSH+F/1kFBswQbW/0r2vi0Bw1/2IQuvgh
 5A294DPEJb+/fcI0l1z9agAIiY01MPAaXyqKShsz+8xC127zSM9HTlbWM9HQ5dc2iGUWDnBMoMf
 k5YmXd2kaGOSOyxkkw+abNvpmDzu/poP9/qedubBd1/r5Yu9Hesa9bghdfmXkwaSnXD+ws94wfQ
 AxJutIqWnRgNoVIrNJzRMgqBgDNe6Y/gwPawwnfQLX7pMFn4ms+PCvwDZBOmtjPiLNaYFzK2oi5
 uRZqg6ZUpBPGVAFMjnksF8yZfaQfw5fd7UHPjnFH5Go+SXhxq5fmGJfnFqGNdkxaIFL9EIxPqHa
 fXeihD+GOId4cghRq/S2aJoPJmBfBm9VXArgVotsGII1235R/5H0xEYNksyMBdy8XrlfI58GU0y
 ipMD2UkRWX2lGaoNnrMIhggzde0QhW/ap3VwywDO88Z/GEtkGxk5N+9YMBuTJkWFaW1A76AAz5L
 jou/0YE18O1MVAtX8o97sGsP2628CgJsOigDKTRjS5YglJknOCnsTffyJzjp6dJAzAhTSMkABDO
 kpXSQqWNepJEkhw/ByskqYQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

The driver currently only differs between 4 lanes DP mode or combined DP
+ USB3 mode. This makes sense from a lane routing point of view, as the
hardware only has 2 lanes of USB3.

But adding a separate state for USB-only helps with power management,
since we always power up all PHY parts according to the current hardware
setup to avoid data stream interruptions. Even if some lanes are muxed
to the DP controller there is no need to keep the DP side enabled if
something without DP AltMode is plugged into USB-C.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 58 ++++++++++++++++++-------------
 1 file changed, 34 insertions(+), 24 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 6eacbea6839a..fcf9b3de7ba8 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -580,32 +580,14 @@ static void rk_udphy_dp_lane_enable(struct rk_udphy *udphy, int dp_lanes)
 				   CMN_DP_CMN_RSTN, FIELD_PREP(CMN_DP_CMN_RSTN, 0x0));
 }
 
-static void rk_udphy_mode_set(struct rk_udphy *udphy, u8 hw_mode)
+static void rk_udphy_set_lane_mux(struct rk_udphy *udphy)
 {
-	if (udphy->hw_mode == hw_mode)
-		return;
-
-	udphy->phy_needs_reinit = true;
-	udphy->hw_mode = hw_mode;
-}
-
-static void rk_udphy_set_typec_state(struct rk_udphy *udphy, unsigned long state)
-{
-	u8 hw_mode;
-
-	switch (state) {
-	case TYPEC_DP_STATE_C:
-	case TYPEC_DP_STATE_E:
+	if (udphy->dp_lanes == 4) {
 		udphy->lane_mux_sel[0] = PHY_LANE_MUX_DP;
 		udphy->lane_mux_sel[1] = PHY_LANE_MUX_DP;
 		udphy->lane_mux_sel[2] = PHY_LANE_MUX_DP;
 		udphy->lane_mux_sel[3] = PHY_LANE_MUX_DP;
-		hw_mode = UDPHY_MODE_DP;
-		udphy->dp_lanes = 4;
-		break;
-
-	case TYPEC_DP_STATE_D:
-	default:
+	} else {
 		if (udphy->flip) {
 			udphy->lane_mux_sel[0] = PHY_LANE_MUX_DP;
 			udphy->lane_mux_sel[1] = PHY_LANE_MUX_DP;
@@ -617,12 +599,40 @@ static void rk_udphy_set_typec_state(struct rk_udphy *udphy, unsigned long state
 			udphy->lane_mux_sel[2] = PHY_LANE_MUX_DP;
 			udphy->lane_mux_sel[3] = PHY_LANE_MUX_DP;
 		}
-		hw_mode = UDPHY_MODE_DP_USB;
-		udphy->dp_lanes = 2;
+	}
+}
+
+static void rk_udphy_mode_set(struct rk_udphy *udphy, u8 hw_mode, u8 dp_lanes)
+{
+	if (udphy->hw_mode == hw_mode && udphy->dp_lanes == dp_lanes)
+		return;
+
+	udphy->phy_needs_reinit = true;
+	udphy->hw_mode = hw_mode;
+	udphy->dp_lanes = dp_lanes;
+
+	rk_udphy_set_lane_mux(udphy);
+}
+
+static void rk_udphy_set_typec_state(struct rk_udphy *udphy, unsigned long state)
+{
+	switch (state) {
+	case TYPEC_DP_STATE_C:
+	case TYPEC_DP_STATE_E:
+		rk_udphy_mode_set(udphy, UDPHY_MODE_DP, 4);
+		break;
+
+	case TYPEC_DP_STATE_D:
+		rk_udphy_mode_set(udphy, UDPHY_MODE_DP_USB, 2);
+		break;
+
+	case TYPEC_STATE_SAFE:
+	case TYPEC_STATE_USB:
+	default:
+		rk_udphy_mode_set(udphy, UDPHY_MODE_USB, 0);
 		break;
 	}
 
-	rk_udphy_mode_set(udphy, hw_mode);
 }
 
 static void rk_udphy_set_typec_default_mapping(struct rk_udphy *udphy)

-- 
2.53.0

