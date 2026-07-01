Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E84425CD8;
	Wed,  1 Jul 2026 23:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782948958; cv=none; b=Oi7Z2nnKWPTcvrGvC5qlGC/A1KZudetnbjU4Xgsc6TPQ08tNxobbokkc7kJd5lnjvDQj9gI0BBoaJ3f2XBBnpY3hYc/LP+OWXHycFrplJX3RhY5EqnW9LVhpRT8JaRDz0CAgQPibPzUkeukwUW75THukF5BRRoh4S1Weq+hgcyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782948958; c=relaxed/simple;
	bh=HgvCiSF6+HBl1ARUC+1/hn82j4mjb1gI150BiAa3wPc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SqGdNhexAVW9FejFCZ60PWFc4+ep+zmcDcBW4W3PIUlsQl2GLA0a6V0uJpIsr341ajRzneozertVJNjrcmRy5gFpFMwUd1rAp2NkVsen6M3osObhuL9PhrT+Pt/NgDU2bm//2WYbj31wL4p+R2OBa1M87xF5A3JgtdESMXLy+i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=jQXZhI2F; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="jQXZhI2F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782948949;
	bh=HgvCiSF6+HBl1ARUC+1/hn82j4mjb1gI150BiAa3wPc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jQXZhI2F19+oNO5OTfyvbIgRjOTRRyepGicrMXucZ3j6qN/FhWGXk5GvcWKM5CrWD
	 VY6cq5oBcvEhEICHyZu2fiFKU9sOiRCYI16Zh6BSmc8HI42uyoRNVd8t3ScCkwEjfW
	 kOQOyeFcY2bRZEhXe9o8B+DpJ6UsDj9ds7NZfGihukNpp073TMFJLbxA/qpYyGxImo
	 l2IUhxoIM8PRBxesLdAXGa5Ckm8BncJzf0CffrYZb2tg9upX/3LNv3SFqChqaMOsuV
	 99icaamdBgdPAxW/YaZvSDShU9Aa7dr7q79R4YmanGXy8hjBI5bJLuC4lT6KfWLMl0
	 5QsEJENeuUOjQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A1EF417E35CD;
	Thu,  2 Jul 2026 01:35:49 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id C4527480061; Thu, 02 Jul 2026 01:35:48 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 02 Jul 2026 01:35:54 +0200
Subject: [PATCH v9 16/38] phy: rockchip: usbdp: Cleanup DP lane selection
 function
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-rockchip-usbdp-cleanup-v9-16-e31efbb62d2e@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1889;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=HgvCiSF6+HBl1ARUC+1/hn82j4mjb1gI150BiAa3wPc=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpFpFPhr6P5DH9X4SAWGs08kT5cI59v70Kop
 L8K86P2KPMuBokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqRaRTAAoJENju1/PI
 O/qaMuQQAIAD3pNVdDoe1r8m+0WUzJkMml1+HvXbVbFkWN7uFQmILJHOcpGC9IYz9Mxu8ZgPVxQ
 XyR2QfX6wwgcw67GExh4rIUkrr403KP4sRKxaNUWhIrfBy+Eyh74LtVNTph8zTxBqIsvsIWY8lJ
 wYBuYyhwf5a78Xr/ggYKgXqsN1iV8WubWy01g4rL+sjmu/uBpSioL2fNtftw5PXRW8dRmqiW4x6
 wq702EKBzMIpS6mPjls0wH/HnCjMJ2260Ju9LziZh2V2HBkajEjb+hyLd7v5ahnZ6zMqgAUv9tg
 k3Rln3sITR90SBMPr6D3XLZZtyX7AmXVdMPvAO9pUW0LgUxASw0cYBzi2m6uzcTBxLzf+OCpRir
 RikfBzpdVTdHfhuUZXwJUQe7ttswNFdx2RAwFfjEShPbxgr6J9h18wm9TbZKBCNFwR0FfV7zAMA
 87RZsP48k+BumWrsqNY2n1i849I7ujuFlXUTv0tE3WaH0Exnf4DirMEcwAwS3uHom+GI5EeK9o6
 zXBjsDhZqH731Z3AaGyFILflrFDRpSiHAjp2ifYcz1VpUi8R7DgzY9jsEwSRfgKo4/sOkj2y3kK
 YehWAOh/ppGZXSrXMiWZAdf/xRPOAUDYg9ERg5uRqW7BJF3bd0UzakAeC1eVp5Tdpk8EpAqKuYs
 swfj06E1RppmwyT4dWu8ntw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Use FIELD_PREP_WM16() helpers to simplify the DP lane selection
logic.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 28 +++++++---------------------
 1 file changed, 7 insertions(+), 21 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 3124bcfed031..5d3db696d51f 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -553,30 +553,16 @@ static void rk_udphy_usb_bvalid_enable(struct rk_udphy *udphy, u8 enable)
 static void rk_udphy_dp_lane_select(struct rk_udphy *udphy)
 {
 	const struct rk_udphy_cfg *cfg = udphy->cfgs;
-	u32 value = 0;
-
-	switch (udphy->dp_lanes) {
-	case 4:
-		value |= 3 << udphy->dp_lane_sel[3] * 2;
-		value |= 2 << udphy->dp_lane_sel[2] * 2;
-		fallthrough;
-
-	case 2:
-		value |= 1 << udphy->dp_lane_sel[1] * 2;
-		fallthrough;
+	u32 value = FIELD_PREP_WM16(DP_LANE_SEL_ALL, 0);
+	int i;
 
-	case 1:
-		value |= 0 << udphy->dp_lane_sel[0] * 2;
-		break;
+	for (i = 0; i < udphy->dp_lanes; i++)
+		value |= field_prep(DP_LANE_SEL_N(udphy->dp_lane_sel[i]), i);
 
-	default:
-		break;
-	}
+	value |= FIELD_PREP_WM16(DP_AUX_DIN_SEL, udphy->dp_aux_din_sel);
+	value |= FIELD_PREP_WM16(DP_AUX_DOUT_SEL, udphy->dp_aux_dout_sel);
 
-	regmap_write(udphy->vogrf, cfg->vogrfcfg[udphy->id].dp_lane_reg,
-		     ((DP_AUX_DIN_SEL | DP_AUX_DOUT_SEL | DP_LANE_SEL_ALL) << 16) |
-		     FIELD_PREP(DP_AUX_DIN_SEL, udphy->dp_aux_din_sel) |
-		     FIELD_PREP(DP_AUX_DOUT_SEL, udphy->dp_aux_dout_sel) | value);
+	regmap_write(udphy->vogrf, cfg->vogrfcfg[udphy->id].dp_lane_reg, value);
 }
 
 static void rk_udphy_dp_lane_enable(struct rk_udphy *udphy, int dp_lanes)

-- 
2.53.0

