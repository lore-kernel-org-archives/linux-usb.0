Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31FE83C342D;
	Thu,  9 Jul 2026 19:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783623760; cv=none; b=BGt2A++JrlJufAbb2Anj0rVaHYwAwKaOkr0+AZVTWImi3fPfrRUgIwiH/fRHtybbN4Urh7Kq1reO+XcpZ8aQkilkBg213HFCn0ElCIkgz3g1gWA+Ge4c6SDONmUFrVsAI/3E1REYdNXVJ9QQNdAvZytWQgyCT7q587vdoKvLKJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783623760; c=relaxed/simple;
	bh=M0nFL5Ec9a+nAx7KM5MPvRfwUmrPlBv56rRN9JqMFu4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m4WLC8ElP093ehauuTNTIgkPefofcCZAKqOcbbiOM/S+hYgj7A+Ms5bc3EZit9YQja/m11b7jWPCYpZ6yc2HhVXTiN2nLcf3fY9g5rbyrzd8NpG+rAOHVPubs7FrCFAOrwAmWJOXaS666vqqPnMjBgnOrfvG95LrcHJ8aIT2EKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=XixhM+XH; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="XixhM+XH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783623750;
	bh=M0nFL5Ec9a+nAx7KM5MPvRfwUmrPlBv56rRN9JqMFu4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XixhM+XHRDc0e4w2zsAzf875ynEfN8QbvbsJN7ckZYW8UczIBpafvDF9d4Zkf/EfD
	 OhlwdC1DrSqlzhgu3V5H5Amwvqn75Ovo29jFOHbgOq2Z92UTJecISVTEvdtJB5BV9M
	 eHUV1I3NoGHMF+npXHNrCYNmvmXmbqKYuD5MFl2lsiM2T/nDdBhnYw1wI1vM24Mp/c
	 baE9LiyRTLXAOTg8MkkuHTonAMnCW+ed3HxV2tun9fQeSik5SLXUlbZORC4sqRsVWx
	 6T/7QB/tNxC0gGWG68MumqMqQYWScAXXuQDne+B8yjVhMHaWKiDAKgYHfJmGjc0Srz
	 NXLp/ERcysc1Q==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 98F7717E0FD2;
	Thu, 09 Jul 2026 21:02:30 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id B87B9480055; Thu, 09 Jul 2026 21:02:29 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 09 Jul 2026 21:02:38 +0200
Subject: [PATCH v11 15/36] phy: rockchip: usbdp: Cleanup DP lane selection
 function
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-rockchip-usbdp-cleanup-v11-15-a149ac60f76c@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1889;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=M0nFL5Ec9a+nAx7KM5MPvRfwUmrPlBv56rRN9JqMFu4=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpP8ESHRCQsSX3f6zD3X2vAjNZudnT95Vi42
 RHhD011IULwK4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqT/BEAAoJENju1/PI
 O/qaOVMP/jEhZwEaWFtqsUnLeusRb2/Kk/6e34tX50KaoE0VX2oIHYOdsZ+SmkWxmrXkOcVYaCz
 Icqt7wtranNGEj8n8Pvh1hAFYyJbF2mh9SqZGD6FJRrlcFuB05HZYCgd7fGqXkkr009vM7BwKP/
 vDLcSqt/FAQ/lrSNkI/zv39p5aHvpBKr5oub8St6nF8cAenmUUkci1iVQOQW9Kmn4bJqS8zPY4r
 vS8tekmI/cmkFoFhtNoGziy+hpXJb6wk7p/LegqZUjGtNdUuYHEvyjtFxPwiHUNBrSB9qAvSGus
 OCCqraoYP54+k+T0kb4k7b+ENsr7Sxic/xhorHLapaTOQcFuQpTDN27Z+BluD5eb9TPFPZ0ebcI
 yTpldu6j6Q91J1FyyLo74jNoseOXfcT8KOdNjtkIOQB3kPfv+WkOv8Iiab85tao1Gqyz/q6nrFQ
 yjYYc8jEBR618NG8JDlwFZLnlH4VvdvXYtNqgCm6Ky3sz0QJu03+VrB62PCCybx3MPxKoXBhv0S
 QwXgg4ma6EeoHJOjrRHrMaXVVVvL1jOkSjKeAghGpENyCFoWT0IA9ZXlu595+xWmVLTMyRvAT2L
 fPBtVby+IIaWdSPHjmwcx5Do2OtGoD9gXngfLyryzlZ8Pne+ABHVLCfRq83sYIuuQDH84ZE/tlj
 7GBYhhMvHHVG4oWuniwsuOw==
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

