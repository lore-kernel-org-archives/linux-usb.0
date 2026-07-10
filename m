Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A2043F4D6;
	Fri, 10 Jul 2026 16:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783701995; cv=none; b=L8TLTGFcT2LxYn+ML+cFC7ghgBc7E7BqQqcM+8wHGmM6dLKnvDLdw89yQkQnmhLXIbE07fwL0w6s9FFynkVB7f9dX0czBXQwEfzYlWmOOWAyWGS05Zwpk8tUeNC+CANT+C2GiKpSGPe/WUTGQIWnkpxVOC9cLEDx6QlibrtnA1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783701995; c=relaxed/simple;
	bh=M0nFL5Ec9a+nAx7KM5MPvRfwUmrPlBv56rRN9JqMFu4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dx0S/uWLcuHCaPugtsIQL7ITHgJneZqfYImMKbzCN9yd1n/etvVVKv6Bc+FHXiTrOS2L+K5v51LbDBFmFWcJqLCbLkjdfaJtq9aGxW43mZcTXwMVSpwkg7REENxPAqDqC14qjmBotmarqW1zSH/XM4x49KsrFiDrLod+atAF6JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=LCuZiY13; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="LCuZiY13"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783701979;
	bh=M0nFL5Ec9a+nAx7KM5MPvRfwUmrPlBv56rRN9JqMFu4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LCuZiY13oen7vGcIJN8GAYwikrUhNu4laH8qiyDGnVHIuzjiS7lQ6+EHEb+iJ3NnK
	 g/BFN8kI88QuezwImjxPBDucDXlOPnKOReRq9CwybuE6G8IhcwpucOZoSWAXuDOQNR
	 m9xOxYUbLYE3FSxad+teheuB6zbIXt3z0hPmxbVzkwk2YdypOJjOO0yTLF5d1RKkPe
	 7eN+chuOY3G47O+uxqLhOuuD/h466l7+CHvEXHzdWpWiwZXQu7wGWyfLeGEw9NxxwK
	 Z4s3XF4EitFdegM1Jt6+kwx4oNNFPpRS36RZxUdkNi0sJjt5RJAIQH1al6DEjBzSrb
	 n0eptkXtwvl0w==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C590117E101E;
	Fri, 10 Jul 2026 18:46:18 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id F23A5480055; Fri, 10 Jul 2026 18:46:17 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 10 Jul 2026 18:44:53 +0200
Subject: [PATCH v12 15/36] phy: rockchip: usbdp: Cleanup DP lane selection
 function
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-rockchip-usbdp-cleanup-v12-15-8b41a9a9bef0@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1889;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=M0nFL5Ec9a+nAx7KM5MPvRfwUmrPlBv56rRN9JqMFu4=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpRIdnqu9WnvXtVfALP/heXYjhF1739NIHt9
 vbsnBCRW3FR64kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqUSHZAAoJENju1/PI
 O/qa3QMP/3U18siTpCKZtv1qpp9eOec/quVU9Owehf5/dOR5tttpOLMJ5W3Ah2dnrxvepCAFH2S
 w9q4FkuTjQrTYU821ahUkdKfcHSo3VDzEfjrAhVAd8PJwJsUk4wxzxtPRVw9b9xhie/2zAe/i4D
 hOG/FfoXCcWBUxapSqHqQCtRR2nDlsYxR0HzZZNDTmTP7L0VnSeuXPcZhmTqOsmnkT+xV/MHnvJ
 pOtd9Ab6gbrEmsFeXd+wJNuQsoB9rwEex/f02XAMbhDBgplmylex2H3OhKvz8gq+F1XVCYJhXJS
 dJdAPLAcUMtfS149qydCG/IUx19rAjYuxs0rEhJu+/y9MsXZehoQrIolsPs9Ed0ieda1tOATyYc
 Z9Cx7TBXx7tOfIgdZKonVqD6Vif1JPlO5jFUf6+cZkPAS/2SkMOLlriZAYceT/gN8gKS8ZhwiwP
 QlfFemUWYsp9vyKEM8ZrM3y4qt2lBKaxgNsiivXQLLUDAmOCpR1SrRJyBuqhqvAYTKbd2ed3SOZ
 uhqG987dgSWffvUWTeqTiisPbvUsNYtnKUkCMd5Qio4Kaa3Gy2H6p+bNv8DSTb1yU5hinscIz09
 Bkq6HawEppCCZS0MXt6cGOlgS4wtWnhUw6IHS8xFqoXOqofkWviseO9+hHztEgQOtiMzsRAsr+E
 pQ92EdpF3oo64o0REnzYltw==
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
index 05593e98c16d..eda3f7a1e267 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -548,30 +548,16 @@ static void rk_udphy_usb_bvalid_enable(struct rk_udphy *udphy, u8 enable)
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

