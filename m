Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433D142A797;
	Wed,  1 Jul 2026 23:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782948962; cv=none; b=KueIvZahG6vSmS1pCKNQGX95sYe9t693NxZ4IAGg15K9OY8Duv6emR6AzqJptZ9RgzHrHZX5UkolnMx16o7usx+3nVojzQBrWOGJM6fnBkDWGaNaoOsECJdoakSlRW/OWSbVCviCmeATr6ABABfye9luCZxegAuUegB1fZp2klA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782948962; c=relaxed/simple;
	bh=bKDdZZCtkVklLvuOJ/CwoTUY1zBlabG6/ZcEjIw1OmU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kNgIamRHBSHLSMps11btfQVhHWtD8KCIikN+xtxt5pqehtLVkMwL0E/Zb8Eil8IWsjoLxkv5dTRIm+iYPSsWl6Pluh3V7Q+MJMW5pHl4bqWgwwa1aDJHg4K0g8YFyyWS6bCyoog5q9CJZ8WXPLG5JxMAThpHqbacI81iFZPp2QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=f49UkJ0G; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="f49UkJ0G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782948950;
	bh=bKDdZZCtkVklLvuOJ/CwoTUY1zBlabG6/ZcEjIw1OmU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=f49UkJ0GDxOqcGilDod4203usQoXervXpoBLylAUl5z4NcNhqXWtkNBPRBSYDxNrA
	 m0sbgwmD9mNvUrla+AzOmnjD3oIDL2/vINCMKhxoADfhgoSsjjXVXcGrXXN26GXgwl
	 Iw8rq3EohFcPm5nvV5VeYcmttWsEpsL3n4Hv7XWnvOUv2sXdLDR3b3zyteEOIRMLwA
	 YKyIdIJdbhVxRxcCUh9D6GS/HYpYodGFpbTEc9B4V1pvbLQ4mNz0g/qlXCP6JeFVCU
	 3JRCL8W2ZSgOqBC06mRfiomdF+XLC2zdVymn9LltHpntzBKCCTZLrx5a5lf3Z374lX
	 bwIgnSrQkR8gQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5B03E17E3622;
	Thu,  2 Jul 2026 01:35:50 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id E4D1948007E; Thu, 02 Jul 2026 01:35:48 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 02 Jul 2026 01:36:16 +0200
Subject: [PATCH v9 38/38] phy: rockchip: usbdp: Power optimizations
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-rockchip-usbdp-cleanup-v9-38-e31efbb62d2e@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3835;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=bKDdZZCtkVklLvuOJ/CwoTUY1zBlabG6/ZcEjIw1OmU=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpFpFS3Jvf08sVJqltNC2CPns0KIRdL+kCAb
 PKg83xbtXFiG4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqRaRUAAoJENju1/PI
 O/qazE4P/0Dhdsb1v+yhHFhIBMH8QIq1MQH+ZaVQrbXesc/qxdyrTP5H8jXCD97VTdDekUzg4e+
 PWlwKrZ31IniXwopFxBKu52GRxSkbU8ohI7v5rBOMkQ2TzwWbvIlqgIu4rzbuATAfUemvY7D9Rr
 ui/tX8hFXrTboCFmkW/435eQ6k0p/+CMi5lxff/zYOJk9+pHm4fXUVvev0Vh0btAWVMKGv1wvGE
 LEtoZBUoOySMmWUO7PFErGsaTLU6QpkuL5h40CIwC13ftqCMY4dcqWZjw0u2ZyD1KY7w3pOUUwF
 JFdWuf85dXzWl4ZyBgdWY8YyXKcKm5fsLft3uIETK3T8mKuSV+i8rDz0Sw/WhZ2dImG24M9aQ5y
 BGfSqAa0lH/TgSEf+8QOm/rn+Uv6P0wcGvAEeA98Y5GVFnE8oj/Aa6NSNTE0WdTGaInZC+/YZQB
 Ne1tZXbqPMGMFVY0qbpBD7dTsACtY7x7d7dvr13VkCEzMYo9AJMD68pj8w0LzzjmOb5Dn5o+U17
 +DbxBfX4hTz6bOTtYmQfbrC/JQj+NAoxBoU4lhSZeQ0AJw2yzyz0+5/zt9Mz1PIfiW9xu89mJ/V
 pwNl0CbJ3dbYmAk56TBNmEXtO0RMNnZwA6aDXZSZNLpS2TCnj0waTHYdJvO1gizE7WDL+NsFYaz
 nJO8n6/JyzJ7/9aExrrk6vA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Right now the initialization routine enables power for all modes
currently supported by the hardware instead of the combination of
hardware supported mode + software requestes modes. This wastes
some power for some use cases like having a USB-C hub plugged in
without the DP (or HDMI) port being used. Fix this by requesting
power for software requested modes, which are currently supported
by the hardware.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index d056da53cb1c..7f90f666076c 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -771,21 +771,21 @@ static int rk_udphy_status_check(struct rk_udphy *udphy)
 	return 0;
 }
 
-static int rk_udphy_init(struct rk_udphy *udphy)
+static int rk_udphy_init(struct rk_udphy *udphy, u8 mode)
 {
 	const struct rk_udphy_cfg *cfg = udphy->cfgs;
 	int ret;
 
 	dev_dbg(udphy->dev, "reinit PHY with USB=%s and DP=%s (%u lanes) flipped=%s\n",
-		str_enabled_disabled(udphy->hw_mode & UDPHY_MODE_USB),
-		str_enabled_disabled(udphy->hw_mode & UDPHY_MODE_DP),
+		str_enabled_disabled(mode & UDPHY_MODE_USB),
+		str_enabled_disabled(mode & UDPHY_MODE_DP),
 		udphy->dp_lanes, str_yes_no(udphy->flip));
 
 	rk_udphy_reset_assert_all(udphy);
 	usleep_range(10000, 11000);
 
 	/* enable rx lfps for usb */
-	if (udphy->hw_mode & UDPHY_MODE_USB)
+	if (mode & UDPHY_MODE_USB)
 		rk_udphy_grfreg_write(udphy->udphygrf, &cfg->grfcfg.rx_lfps, true);
 
 	/* Step 1: power on pma and deassert apb rstn */
@@ -822,13 +822,13 @@ static int rk_udphy_init(struct rk_udphy *udphy)
 			   FIELD_PREP(CMN_DP_LANE_EN_ALL, 0));
 
 	/* Step 4: deassert init rstn and wait for 200ns from datasheet */
-	if (udphy->hw_mode & UDPHY_MODE_USB) {
+	if (mode & UDPHY_MODE_USB) {
 		ret = rk_udphy_reset_deassert(udphy, "init");
 		if (ret)
 			goto assert_resets;
 	}
 
-	if (udphy->hw_mode & UDPHY_MODE_DP) {
+	if (mode & UDPHY_MODE_DP) {
 		regmap_update_bits(udphy->pma_regmap, CMN_DP_RSTN_OFFSET,
 				   CMN_DP_INIT_RSTN,
 				   FIELD_PREP(CMN_DP_INIT_RSTN, 0x1));
@@ -837,7 +837,7 @@ static int rk_udphy_init(struct rk_udphy *udphy)
 	udelay(1);
 
 	/*  Step 5: deassert cmn/lane rstn */
-	if (udphy->hw_mode & UDPHY_MODE_USB) {
+	if (mode & UDPHY_MODE_USB) {
 		ret = rk_udphy_reset_deassert(udphy, "cmn");
 		if (ret)
 			goto assert_resets;
@@ -860,7 +860,7 @@ static int rk_udphy_init(struct rk_udphy *udphy)
 	return ret;
 }
 
-static int rk_udphy_setup(struct rk_udphy *udphy)
+static int rk_udphy_setup(struct rk_udphy *udphy, u8 mode)
 {
 	int ret;
 
@@ -872,7 +872,7 @@ static int rk_udphy_setup(struct rk_udphy *udphy)
 		return ret;
 	}
 
-	ret = rk_udphy_init(udphy);
+	ret = rk_udphy_init(udphy, mode);
 	if (ret) {
 		dev_err(udphy->dev, "failed to init combophy\n");
 		clk_bulk_disable_unprepare(udphy->num_clks, udphy->clks);
@@ -1039,7 +1039,7 @@ static int rk_udphy_update_power_state(struct rk_udphy *udphy)
 
 	if (udphy->status == UDPHY_MODE_NONE) {
 		/* Power up (incl. clocks) */
-		ret = rk_udphy_setup(udphy);
+		ret = rk_udphy_setup(udphy, target_mode);
 		if (ret) {
 			phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_POST_RESET);
 			return ret;
@@ -1049,7 +1049,7 @@ static int rk_udphy_update_power_state(struct rk_udphy *udphy)
 		rk_udphy_disable(udphy);
 	} else {
 		/* Mode change => re-init */
-		ret = rk_udphy_init(udphy);
+		ret = rk_udphy_init(udphy, target_mode);
 		if (ret) {
 			phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_POST_RESET);
 			return ret;

-- 
2.53.0

