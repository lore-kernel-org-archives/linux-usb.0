Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7EDC40F72C;
	Thu, 13 Aug 2026 20:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786654333; cv=none; b=S5cEjr4Mj4pCe2j+ROXLYPGVi+kHGdftrgEu1OqOD6YvlwAgWn2INANAcessXOK/qalnRP8lko+CgKJG+ZMBL6q5cEQuD3EJKMUIHfmhsmWhBw5eQlLhKXqHOGepHupnBHNDWdgjXZ+jcwiIEIZtpcxTV4azg4LBSHOUBnyKxOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786654333; c=relaxed/simple;
	bh=36y6uXXbsKSKQawBTmpi4qUE2y4MHZLmP4cbWKqP/kQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JP4OpaOtFQ2Iz7H5W+MJj+tgpgGCOpzkVsFr10O2ou0o/dkLH4oizb8J8B8grjuGhwO9BUH3OHhe08JFRzAnIzYcATh91LjK0aYvDdQEqgf767Mc/tGlmN+TUvWLYIzDsf51pFa2r6IRFwZ4zhF4edPU9VDVbFa8u0DfXhD5vjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=VnAhBM7Y; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="VnAhBM7Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786654311;
	bh=36y6uXXbsKSKQawBTmpi4qUE2y4MHZLmP4cbWKqP/kQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VnAhBM7YIeapIkASkm6dHtLSz1k1MQU/QtTDiIq1R1A6VgF64+emwBK4ehJ6++qsr
	 yx6gC56N1Z5fZar7ZfQnzJKANqjrKRIrTf7bf87rLrL3GNFe6MtWujm8JbzptoENCv
	 a//MSpBl9l866G1kZrYVAaZS2By0fyzUTS7GIAiIUG3ZdOcGDqC8zFPG05SrjoP19Z
	 QEy3ifKrZ5COMKgFC2IwTRPlJpP3Idtw8gD3i2/d83s9CwDXY+ohnF6PtgejEMIyGq
	 cufF/A++4QTRn0V9iLPBl/R0x5MylFko4YQngThZEuxtpj8bjPUzVW6dJ/0aYmiEfl
	 17PttwZyhPw0g==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2778917E35C9;
	Thu, 13 Aug 2026 22:51:51 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id CFD3548007E; Thu, 13 Aug 2026 22:51:49 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 13 Aug 2026 22:52:21 +0200
Subject: [PATCH v14 38/38] phy: rockchip: usbdp: Add USB-C state without DP
 enabled
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-rockchip-usbdp-cleanup-v14-38-b5ad9c68fa11@collabora.com>
References: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com>
In-Reply-To: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@flipper.net>, Igor Paunovic <royalnet026@gmail.com>, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3456;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=36y6uXXbsKSKQawBTmpi4qUE2y4MHZLmP4cbWKqP/kQ=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGp+LmXzsOo6bS5xAlYpqFC1CVUbVJ/ZiwJxe
 dXZOHCAUJ5iEokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqfi5lAAoJENju1/PI
 O/qasvoP/jtYCG/d00N4j89HxYZpaXEK0PAdqbGrybFx7VObxyqGxir8Ea8+W/byBvU6c0XZpCv
 dUViaDZAbvLBIef+lKhYCePwmmTMCvD4lUbyGGF/MLNkGIqhozWP9zBQmll6JroPnYUs26YbbV/
 B7xGwJROuwFXmeit8ivSDrPxhHhdQpU1qESCLi7XOgG2egtqa8w3tgSDkT8AciL5n/SrMMOcaPa
 Y4AxSOyngwr77h7TPqR5HfZUfOMD6jw5eoNPCbvTU7VL4b5lsnyxegqUyRGl1OP9k+7FD3/ndIS
 0U7RyotWuzBAcYiPIJjQxsLNBP3Zd6iO7muxPx58q5aHXUmMhffm4BvqmjIVJ0RAXhBpDB9gHlO
 vThoEux+2gdYxUELBXg/bW5QlPhwbqaoIza0oFqn/ZrA+yvevcfO/CAEFI/4soMXWXZ5AuXXIYo
 sNVkO5kUn8BLjrDhKJzFf5ry2ROiTKEks+p8jekx5Zl+7MY8YwZD74DrFI8iMW8exw7A8kFeXNH
 Eueu/UMwyfet174Z4Di8npy+rbWWALgeKA6+xrssodVCH3c5Zc5uUFPHFIS7/A+DweHxakCx3Nk
 faAKpNAHzrcbq2IfKQ70tt5QzIthUH0e0wKyEbcgac8o/MLjqEj0d1FJb2QWj6sS95scYNa44RO
 v3DQOq1W0uG1WoIyPfVEqTg==
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

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
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

