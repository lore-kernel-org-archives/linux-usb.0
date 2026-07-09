Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E3F3CCFC0;
	Thu,  9 Jul 2026 19:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783623762; cv=none; b=oBIluWVfj7z3pasPLP/8OIzUx+UlE6e3oD8fsGqlxdTNdXZLEAwjJCJDGu64L2AZk3ifF1j+2DCqIAI7QiuASe5IsdyslkZOr3DjvwOY+AAbgArGHDQ23wj1HIE6upOz6d3/OdngUgkqGWPwo71fHMQDdL9Gs2MXQfRXV0vNQ5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783623762; c=relaxed/simple;
	bh=l23k7hURhwLe9t2tXRcPSTBeNz9hUVrmkn6StuJVZSU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SKMoCZ1vfZTYsmssfwSi+s6+pNQCgYBMYrV80TW1Nf8d54pjn/9GKONq6lYcI5OakXJDQoBWint9UUZX5ukEBildftyPEhrkeuH+6YIuW1rP1yMHi5GZ2gQkPRJo4QuTruQ2K6sXkHdTotxcLDPN0K3MHY63hS+8GG587qbteTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=dsBhmz8t; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="dsBhmz8t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783623751;
	bh=l23k7hURhwLe9t2tXRcPSTBeNz9hUVrmkn6StuJVZSU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dsBhmz8tT5elN/B/GA5g2gpeduplBVra0qcpDxslUlWDm/RPDDzBkcRIuJYHTg6+8
	 VWW59qQ+7m9BU6W/K8aXzqB0JVZCpNUEs0VsEvA4aSl/bTFFRQ3+H9Z7fBIIqkDMzl
	 r9BwG4bks6Tu6DsROdY3PvcVZ9z4FZBU1QicSi23RwGQHroiy2JN3GsVjWBeAWJJlU
	 5iqTucgPSvkUrNQotWCW0HMbCh+vMatEXP6SO0MrF18iOLAy3gpdE+DXFudF/Od0lZ
	 0Eu4dIziXZ/PEMtIlyvy+t0pA7tLbzbjb4Rhn6Z4nINvV/dM5rfJ03zug5Aev0skrH
	 dbaicluTKfODw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3354517E3686;
	Thu, 09 Jul 2026 21:02:31 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id D8CF948007B; Thu, 09 Jul 2026 21:02:29 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 09 Jul 2026 21:02:59 +0200
Subject: [PATCH v11 36/36] phy: rockchip: usbdp: Add USB-C state without DP
 enabled
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-rockchip-usbdp-cleanup-v11-36-a149ac60f76c@collabora.com>
References: <20260709-rockchip-usbdp-cleanup-v11-0-a149ac60f76c@collabora.com>
In-Reply-To: <20260709-rockchip-usbdp-cleanup-v11-0-a149ac60f76c@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3387;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=l23k7hURhwLe9t2tXRcPSTBeNz9hUVrmkn6StuJVZSU=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpP8EWWMcEYrytjjgfjyOOrr3GQ7MbJFED4N
 DNIldfCmTl1tokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqT/BFAAoJENju1/PI
 O/qao20P/AiGeqP9qpQAyE3KpmkBXYpnGbEosonRMLy9oLSjyKi5fQ3mhJKZ5p+JIXxs0g/Fqxe
 cdi2nRo8keRC05NR9HtUlss0EsK9V27FyoMrGPXi2mijhc4LSp9FUS62v6K4IS1PUwBBJlMV4Up
 bkd1I0Kq+TcB+AspRCLFuduDqN0jSODT1mP46qLUGJ6xEOBc48+leK0PS0A39YIVBBilcYqnNSA
 RvOvh4nlpVQiMoV5fOWxImgO8ZHC8DDa0toMoYAw+KdPbm+MG8e2czeaS5qA9LrsL38nrcyIGui
 8ZrnKUU1XpWjwDfOzXF7DcwehO68CsukwnkNRWtL6HO+DBTcoSfWSJxLCUlaS2ICofv/PbHHdhi
 U07Y6WHLIapMon0RS0j+psrTCAPY9VNTVXec5dTjrroPd+TddahrJblwfGtkKI6l4RXB5N+/szJ
 TgwFr7WnIDsvh6jX7A3Nk4icvnj6XmG4jrQOgaLjGJJ1mvdWVY0vnVTLA7G9MRk1IQa3AEYPZYT
 sZ2MqERRh6jYxloUk7QBBJ8PpcYTQcxiAlyO0V9p5B7NCQY09SPqJ++ucr/nZ9ebxXybX4FnrOj
 m9GiEwr7pGVgYQCUA0fpwMdINC7bkJ0Peoe50c+9rtnRm5qAJ2/keQ9L2R/aaO5pKzshVn2EF26
 2X6f7a6CexFrbvt4bmiMtuQ==
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

This potentially triggers some more USB reconnections during the PD
AltMode negotiation when switching from USB-only to combined USB+DP
mode. This should be fine, as the cable is freshly plugged at this
point.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 57 ++++++++++++++++++-------------
 1 file changed, 33 insertions(+), 24 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index ecf0ed0139f6..bca096abb076 100644
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
@@ -617,12 +599,39 @@ static void rk_udphy_set_typec_state(struct rk_udphy *udphy, unsigned long state
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
+	rk_udphy_set_lane_mux(udphy);
 }
 
 static void rk_udphy_set_typec_default_mapping(struct rk_udphy *udphy)

-- 
2.53.0

