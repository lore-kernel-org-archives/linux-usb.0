Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3340C424D65;
	Tue, 14 Jul 2026 19:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784057190; cv=none; b=mWLjYjZeT32LcYNY8YM7gE3OzZ9WEU0enM4Z/kcSdI2Ug6Jm3eNZZMz8OzyN6Sz9NQGJPI3c8lnxLc8HJfoUFH3o7+d8DiuBrcEAD3H8nm6E8uedGFxkmJThu4tDEPLrgdPCmhPjZpxvErJ7sTrOxFegLjplRCU9k5miAeRqUHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784057190; c=relaxed/simple;
	bh=b6e/NN0NwoVBfTz7YMNqEiTFnSbtgh0wx9Yx0+vhNFM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WtEJjCuwdKc5qgc3uKd33qPWkYMaMY3z/cVspWkm8EATvG8h0CkJ/c+HiCvPaCIVEVOZ+aZkvHcQ2fmTjK7PrRH2dCXg+jehq0222ExvyZ3F5hzYBjmc1Ybe7SjzeMZHqhu7SpzEwauduOQCN9j8SunoPVX9WCPQ2kAQq0lQ0bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Y49xeKFo; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Y49xeKFo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784057170;
	bh=b6e/NN0NwoVBfTz7YMNqEiTFnSbtgh0wx9Yx0+vhNFM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Y49xeKFocmKLCRs8N8QXQ/8MKdg+UG99o2cKan3khp6cEozaamBzn25qyCzsVvR3o
	 /4j0Zab8EnZ5R+YsvnmX5dLjFvSvL8TY/rUq3XHhjI5yLVTUn325k7r00GGgSpP2ZF
	 aI/U7zN7O+9mCwZSyQnA/9VKYxP9p9/zEXu2earnuiSjbAGT0hztL7ZQYcBUbk7Yzb
	 xU8SSjdxbz3MoVU3alsHC7/xl7VCK/fRin+bWNWrxDxf4KPZX6v2PbsCSzqAREGvN6
	 cPs5rEgd+IpCqvs70Z9c6XOgB6kHt8ft9t8IwSlLsKsD4ITC4G2XnaHoROy+2xLMb7
	 n0GVhrkavMH0Q==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 43D1017E1317;
	Tue, 14 Jul 2026 21:26:10 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 0F8E648007A; Tue, 14 Jul 2026 21:26:09 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 14 Jul 2026 21:26:36 +0200
Subject: [PATCH v13 35/35] phy: rockchip: usbdp: Add USB-C state without DP
 enabled
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-rockchip-usbdp-cleanup-v13-35-6cb3e769d4c5@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3387;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=b6e/NN0NwoVBfTz7YMNqEiTFnSbtgh0wx9Yx0+vhNFM=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpWjVAU9rrTmWfa2AjuXyyf60CZbS90XKDeu
 agwV6WAtG1rqYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqVo1QAAoJENju1/PI
 O/qaDYgP/0PYaeImzl3bU+kMa7B+Ygvo9KJcLemJgYOaLJLuT4MF7AeowqVSa0cpkcoPUg67+Rf
 vbOyWbWsfzHMfsyymK8H6N5SZUsJwYX2/U9RpmzmzkyHSJa3KbSY5YMwVPH4wXmtv+2AAgbabjo
 EuRyNIiZLJcfcOCaFkZrPCPFwVrgjajYrAA9FH3aK5Il79oSOXFvrkOHg6AMIcd/7/eaoi4iWaY
 BJ4DCwA2jdMM8cS9kHcFJ8iclJK592/XCvAQB5CWbew4G6NtrfOUWVmhW7Jsa0stVNwAKSOGvfB
 xORfKO2WQkmgUVpFnlsc6hev1ttd1dfAxR9WzEe7+10j4w9mTFGL9zSW9TflXwJlCKKER/ZFEg6
 gqdMjTBANmpVVvk58HpnLGX0MDJ1y3zZhGVD6dPS5S2vgcNacUnTaQ9qUQzGwISSDnAPHeS+OR7
 z/BpzHeek1ZuJkuoJuCZKG6utvmH+PhuFiU2uAdYMcumBYB3eIEie9/bUdIJacvkjAnHNPgIdw0
 466uc3vZQEVnQYh6351SSpe/Ke1dV2adkBapAhJsbeYZq+aIWHG+4lOc/csWfBvRvYjQMhljcIy
 DOurlsAjYgIAXPTRPQOKAM7spiU3xtjAjMLv6ukn7lTMBVBEa17fHn7+azjD58qCa70PxvpT35v
 6zmpTN76/TEHychEmtVYrww==
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
index 87d6df682176..ef6fdf3d02bd 100644
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

