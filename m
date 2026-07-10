Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4307543C078;
	Fri, 10 Jul 2026 16:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783701988; cv=none; b=r9uikG5WvwOWk2F3b0mjQ6RERYV5TZGR1A5MBIHoHOvswRi1yRBdLgZm7MNf/S+XY0mwrmiao9835f//Jg2XrOfvvnkvIPJ1WrcWjYwe9x/gsG/JKVzNyLhICHo9RuPsJRQIZFp4lC3SkLQSTkM+CBTyLStfb/Y7S//Lmnd5jBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783701988; c=relaxed/simple;
	bh=ZO8NKtlAO4WsL56HMiuwG9DvpJtk+41a1hMlNOx8muc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D36bLlxc213BQGkFeMd5P+XKkB9pJLJPYnxKk6UR7U8aAcoW99jZooOpgdYiH7em4gi0yLxgP5v3TshsUVc926HXsGcMOnxIKAa75n8f784UWKDOxzMRf4eManrboAqNLyoJxapSrk+DyEOXQ5zJk9Nj07j+zn2DExnA9nVgVD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=n+zf9ts3; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="n+zf9ts3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783701978;
	bh=ZO8NKtlAO4WsL56HMiuwG9DvpJtk+41a1hMlNOx8muc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=n+zf9ts3xmkxS19VSkZwdCH7Mg1uXUmZUvKDpQ9+XwGnr1xKtANgDDFEfuzogKuGx
	 pZ9bcu1TjkQUoE+J37DVgeoZgfee53lSmwGoYg8aNohAbzS4ig4qF4BovCza0mLPvS
	 AkQsPv1ic32/Og9yXUrxXSp1QEDIrMlHXVJeqcw9+O/WhC/MEbABHOOzVMFHjpCxFe
	 9RPjZg+kF6xBwZXiTIN1ntsLxaC3zB6modqO9ilrCaRsPSSM2JhFkFipVbdf978tJ5
	 xK5YI5g/udTzBKKcz+22tYsfzKq0lsGK6b6MD45u95kujcTOEMeonAQephd2gdHrrV
	 KDZbgcR+SlDEQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7B66C17E0EFE;
	Fri, 10 Jul 2026 18:46:18 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id E4134480035; Fri, 10 Jul 2026 18:46:17 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 10 Jul 2026 18:44:44 +0200
Subject: [PATCH v12 06/36] phy: rockchip: usbdp: Drop seamless DP takeover
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-rockchip-usbdp-cleanup-v12-6-8b41a9a9bef0@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2883;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=ZO8NKtlAO4WsL56HMiuwG9DvpJtk+41a1hMlNOx8muc=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpRIdi6Z3cxDpnbnvAPqWEpG4UhgVaUCOrZg
 2mLK6E3sVFFl4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqUSHYAAoJENju1/PI
 O/qaChMP/jbNA7sQE6ZWvL/WALH85hw7hBt9rLcHcuxGkYSvs/+/Udcfofxi4jEddt0prNSGU6D
 NGMugr7TB9T5YXQJJ5SR6tWh+uchAjbMoiz0ZHQepcq+fMaeS6di6p67MI6mg03gJ3MKAzUAjKA
 yAAenURLqAhYjPmKtPRwOG4qCLYd3ug5737wkvzylH964hTCA07JsUHOtavIPq4WrPbsMS2F2xn
 8+q4vo5ObvhPabIxBR3nXLk/JNULDdCoNGOGafLCGzElwNbkXMI90zDwapFBhl/5IC5tllc6uW7
 0YOHK/t63R6k0SckJOPePcIcJNfiDAcll8WCl1Bsu8rr1mC6UHpX0IZijgZAMbquTQ43LzdB7lz
 MsUUSGIFDVgSv9aMHGVS87zWsCwtE0RAw/9dsxU16TpQ17KGWEh4YZO5V2jXp35tQKdxeMTmQXo
 H+4OLfGegF1qTPTSIzKpDV2leIsEth4Ta9htEIRngI7okkXMOnNJF7vgQ1DHUNZ8VOLzoy3KXin
 jKZT/mJ4V9xOKfHR7jCF3h0JIIKNdO0k5Sf2irFKqLUIFrgK8AQirwjzERWuuMsVyo4T0/jyb/Z
 41VdqTUi80IrRhZ9uoSNTh/1Ju9ORH3BHWQi+4he4BdJ32Mn7kX0fM2dp9sUadOpeGd8JuQfBnq
 lsVZWx7hLytM2Y2W5jD8sfg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Right now the DRM drivers do not support seamless DP takeover and I'm
I'm not aware of any bootloader implementing this feature either.

In any case this feature would be limited to boards using the USBDP PHY
for a DP or eDP connection instead of the more commonly USB-C connector.
With USB-C's DP AltMode a seamless DP takeover requires handing over the
state of the TCPM state machine from the bootloader to the kernel. This
in turn requires a huge amount of work to keep the state machine
implementations synchronized. It's very unlikely we will see somebody
implementing that in the foreseeable future.

As the current code is obviously buggy and untested, let's simply drop
support for seamless DP takeover. It can be re-implemented cleanly once
somebody adds all missing bits.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-phy/20260612164107.C7DB21F000E9@smtp.kernel.org/
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 31 -------------------------------
 1 file changed, 31 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 3fc8222fcaec..6cb9f6b4dbf6 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -452,11 +452,6 @@ static int rk_udphy_reset_assert_all(struct rk_udphy *udphy)
 	return reset_control_bulk_assert(udphy->num_rsts, udphy->rsts);
 }
 
-static int rk_udphy_reset_deassert_all(struct rk_udphy *udphy)
-{
-	return reset_control_bulk_deassert(udphy->num_rsts, udphy->rsts);
-}
-
 static int rk_udphy_reset_deassert(struct rk_udphy *udphy, char *name)
 {
 	struct reset_control_bulk_data *list = udphy->rsts;
@@ -924,28 +919,6 @@ static int rk_udphy_parse_lane_mux_data(struct rk_udphy *udphy)
 	return 0;
 }
 
-static int rk_udphy_get_initial_status(struct rk_udphy *udphy)
-{
-	int ret;
-	u32 value;
-
-	ret = clk_bulk_prepare_enable(udphy->num_clks, udphy->clks);
-	if (ret) {
-		dev_err(udphy->dev, "failed to enable clk\n");
-		return ret;
-	}
-
-	rk_udphy_reset_deassert_all(udphy);
-
-	regmap_read(udphy->pma_regmap, CMN_LANE_MUX_AND_EN_OFFSET, &value);
-	if (FIELD_GET(CMN_DP_LANE_MUX_ALL, value) && FIELD_GET(CMN_DP_LANE_EN_ALL, value))
-		udphy->status = UDPHY_MODE_DP;
-	else
-		rk_udphy_disable(udphy);
-
-	return 0;
-}
-
 static int rk_udphy_parse_dt(struct rk_udphy *udphy)
 {
 	struct device *dev = udphy->dev;
@@ -1495,10 +1468,6 @@ static int rk_udphy_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = rk_udphy_get_initial_status(udphy);
-	if (ret)
-		return ret;
-
 	mutex_init(&udphy->mutex);
 	platform_set_drvdata(pdev, udphy);
 

-- 
2.53.0

