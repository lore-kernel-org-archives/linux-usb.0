Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3633843FD08;
	Fri, 10 Jul 2026 16:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783701998; cv=none; b=L8kGy1UJNNga/OrKseJPbir19nX+wcjlb3y4Fq856MnGGNi1IfJjGy7/OmTR8+fTvW67YddQiJ38UCbGgZYqRuo+ZAvGoXfmSGtQno4ueWK3fn/HeutvvtLp4usTrkQfJlmFpGfqLcS5Svj6aVOk9HzGS75aKo0EtI1fbFbTnjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783701998; c=relaxed/simple;
	bh=l23k7hURhwLe9t2tXRcPSTBeNz9hUVrmkn6StuJVZSU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dV3HAxH0oY0AcpDbdzaHLw5x+UNLT0HsY7KshEf76HXy0yEQASGREfORVKdDMrgIVpgwfRNYIvihaGIkhbZgF65+SS7mu6QDx/VaUbXl/qNt0pCXbC3EvwcN+uhK7nSEdHdbZJuL5kIjbPiZscsQWUY2yfKWN7pPZDH6ouzJ/Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=PltLgtGH; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="PltLgtGH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783701984;
	bh=l23k7hURhwLe9t2tXRcPSTBeNz9hUVrmkn6StuJVZSU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PltLgtGHUoyUC60S8kt248n+ZF92typs2Y0UFePpRIyFXreJNr0fxFoVdXrZptOBo
	 RVNwYquTZCZ+MZKiErc3S0w4xhY5xQoop/0KXU9KImxkh+S7yqVSAMlmfu+mDFFTeR
	 2Q+FdYjJz8nSrhSst3TZRx2hAy3LlrZTNWw5PD9vIuCi7dg2wgREXddaFUeb2sTnhe
	 5Yol4SIB1JFsX6HLg9ZAE2RoqtWN9XQXhuvYyddGihhZeKPtuEJO5vpQ9IiHTo1wdo
	 0Vom0mCwpiwHxjIzI1mjRw6e+LoAbRkySDl/hGtau3SfkItk9UfTk4KNoXT9hWysib
	 uHKROtDGsHdiQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 624FC17E0B0E;
	Fri, 10 Jul 2026 18:46:24 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 1E7E748007B; Fri, 10 Jul 2026 18:46:18 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 10 Jul 2026 18:45:14 +0200
Subject: [PATCH v12 36/36] phy: rockchip: usbdp: Add USB-C state without DP
 enabled
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-rockchip-usbdp-cleanup-v12-36-8b41a9a9bef0@collabora.com>
References: <20260710-rockchip-usbdp-cleanup-v12-0-8b41a9a9bef0@collabora.com>
In-Reply-To: <20260710-rockchip-usbdp-cleanup-v12-0-8b41a9a9bef0@collabora.com>
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
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpRIdmK1+FR9+kRpEl9RK0UUIWQJIQz/xPdA
 7IOLyGmHLPPA4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqUSHZAAoJENju1/PI
 O/qab6EP/jG+yoN0c2EMjDbjw4IcehEdMB3f8qCwZTj7G+yQYhnZdLvZMPK3zWZMkZHvo540YLi
 9dFYskwln9uXMxejohaMl4P/9vSFV854oZOBWx2sRKUMo7rWnLzEhci2Zqyk9UfyCX8UAGw1Ose
 7eDxaJtZQ8TG20meU/81XB7JPTqiRnuUZQTZRRffUP8X1AScZUWVwu8XaRe7VUPGJGXQ7v3Z18X
 Kfqhn9l2aad8ACK5HuX/uoxupnQLFvoQAuh8Dxf7jJyIolILVcztFbPGa37JhuYkqYHSUry9M8w
 o67bedptmp8A4KnSSVxyMzpczaVKgKDfOnup4em1gc+K3PT40SJcyiGyUW5WoIUTqHTCAj4AuK/
 R84OOcDQCYCyGZrwiAmqjxKRMDdqEExjFpMy4I8+mCdaYHD/E52Fwtyy4SPDAe6r0lPjreXoQ+a
 6V335MNCVGVJamS02HkVf9B22XJQdoigIk2gJ7E5Li9ZlFkt8HEoUQkg/UDaQQ7LamRIBDLdkFZ
 mSK0qO5JgwHOGKHHet4h+WZ9oxL4L/lKP5UNa2Lqop0h30Q7ToqbYZqtsKfwMM6Ng4huxHJtmFp
 01TApZ5Xkb9JBwAVBi8m6crZj33gVM8l4eQBzN9BtyMD1DrXRxddFsz/Sxg/DlpDuESR/ofwOQd
 caCTdiSpUawK6HMtwf24rdQ==
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

