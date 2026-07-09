Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D503B71C9;
	Thu,  9 Jul 2026 19:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783623757; cv=none; b=b4Xp41jSQFBJ9fo+otF8i+PnmJuJEiFvN7wb7vpARUZ08ue8PPF1nV5qqo9qtWww60MxSJNd4ixbS3K0ACmUc3zPZr/vuduwwfajQPop8hF3/Cg6yz8lu34LZLpJ/dheXA2UksQ9NbRAGcaj/7VHxOaDl+xncjTU98Uqwm/Vrco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783623757; c=relaxed/simple;
	bh=8x+V9jjStkv7ipsHaKsRN2SwbLF1FQFj7nt1kWMYqkE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F2H0o7v/+JLXT0Ny/9Cim87AYEHEr2g8vl+dQXMk/rkkbcSgrh7fP0Jx92UkRPRkWb1IC0hdJ24QQwL8a+4u+9RTbz8wsVpBFKQ2VBnZj3xBU3j8YBU1ryYnm48X4QVrEzsC8n+bK6WrzKQpbwFzGKduAw0ffeQ+/KLvUR9HJbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=SaqvPUUW; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="SaqvPUUW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783623750;
	bh=8x+V9jjStkv7ipsHaKsRN2SwbLF1FQFj7nt1kWMYqkE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SaqvPUUW2ypGBajZRNCCaD3m5uB08A48K6i+gJjgNmDO75OoVyWah/zP3oQg+43+E
	 H14JPxDn4cALqczfGmYE6TKQGgCb1wvg5z7BqDXqoyXRXpJI1pbQN/Cg2iSxDXCspx
	 XlahTTEgPXHPjPNLNndwfjtTl0vW1ccflqNMAXh8ZSUc/SneeFbba7oFLY3ROVzjUF
	 kobWuJF+NMc6edFu42dpEh30n3W9xdCIrC5hXzCPu/bVoVulrUp1au573t2+C4vlu4
	 8NFEeAtcv0IgbWGo9Q5dvlSG9ghQY45cguApIIg4p5zqlwVJGoleHwf1F3QHWqJJ4i
	 AZY5qKOJgcesg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5E68817E0F8B;
	Thu, 09 Jul 2026 21:02:30 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id B084E480047; Thu, 09 Jul 2026 21:02:29 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 09 Jul 2026 21:02:33 +0200
Subject: [PATCH v11 10/36] phy: rockchip: usbdp: Add missing mode_change
 update
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-rockchip-usbdp-cleanup-v11-10-a149ac60f76c@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2006;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=8x+V9jjStkv7ipsHaKsRN2SwbLF1FQFj7nt1kWMYqkE=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpP8EQJDxeYNQSkK1uCbWMWrxuyanNXJm0mG
 WJLUlO3kixv3IkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqT/BEAAoJENju1/PI
 O/qaUfcP/jNaUIZAyiHfA4EBnBmUcVVqHLZfHYiJruELrJlXf4ui0VLsDZrWtSjMpGs6JJmWhsU
 JXQJxvRGMkJdpYtwsm1m4UNG6A+SSpS6LOwpaBVtBisvjVAfjucBMF0QgkT82aYjDqTbx+D38dR
 e44bQucuWlcmBJzryGwzOxMKp6P2cV8E/Gbll7hMpI2QaoOGqAUTNGaM4NhMgpao7oB1Xxdaj9t
 GLqVGkNFRUOA6DSBApCI7DRPoE2W57pUfMtxgCVFQptvTvpOmuOHRx5R05Av1tcPD1ElGMta8ze
 bIg7o4onwXD6lRMt0tFaITzsC+ZzTkzCA16+d0hkc4/clLJC0FjNc2xRwmM1ifE6yGWnvQts4cM
 XDc3M+H8jj6phdef335S/QYbpcxFa5FOiFC7NI7wi+mIgEas/tjk4X0ujrUnWu2lwAuC0FMAehY
 nYZ+qZV1BFjavsTDkCnqNKLX64iwAKZfoEJfONEbvsYvUrrSjUFJSb6G10Sg/WuzbCM43w6H5JX
 IXVnZlbNPYpALlb/PLHIInfPLjLmAG2ubS0TYf5HR5aAXd6P1iyXTchrvp4C+l6bmcvvpzstHfr
 08+FnVEPadq50irJmO6mAGgPPry1bIZTrv3hFznQSzYpv3TvP7Aw+4APTTwwzMqy5yeAxWC9VaL
 h7b0iLE2rnIoG+e2XOeUjAA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

rk_udphy_set_typec_default_mapping() updates the available modes,
but does not set the mode_change as required. This results in
missing re-initialization and thus non-working DisplayPort.

Fix this issue by introducing a new helper to update the available
modes.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 982315535caf..7540c897dde1 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -617,6 +617,15 @@ static void rk_udphy_dp_hpd_event_trigger(struct rk_udphy *udphy, bool hpd)
 	rk_udphy_grfreg_write(udphy->vogrf, &cfg->vogrfcfg[udphy->id].hpd_trigger, hpd);
 }
 
+static void rk_udphy_mode_set(struct rk_udphy *udphy, u8 mode)
+{
+	if (udphy->mode == mode)
+		return;
+
+	udphy->mode_change = true;
+	udphy->mode = mode;
+}
+
 static void rk_udphy_set_typec_default_mapping(struct rk_udphy *udphy)
 {
 	if (udphy->flip) {
@@ -647,7 +656,7 @@ static void rk_udphy_set_typec_default_mapping(struct rk_udphy *udphy)
 		gpiod_set_value_cansleep(udphy->sbu2_dc_gpio, 1);
 	}
 
-	udphy->mode = UDPHY_MODE_DP_USB;
+	rk_udphy_mode_set(udphy, UDPHY_MODE_DP_USB);
 }
 
 static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
@@ -1361,10 +1370,7 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 			usleep_range(750, 800);
 			rk_udphy_dp_hpd_event_trigger(udphy, true);
 		} else if (data->status & DP_STATUS_HPD_STATE) {
-			if (udphy->mode != mode) {
-				udphy->mode = mode;
-				udphy->mode_change = true;
-			}
+			rk_udphy_mode_set(udphy, mode);
 			rk_udphy_dp_hpd_event_trigger(udphy, true);
 		} else {
 			rk_udphy_dp_hpd_event_trigger(udphy, false);

-- 
2.53.0

