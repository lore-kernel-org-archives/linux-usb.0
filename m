Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E6342BE8D;
	Tue, 14 Jul 2026 19:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784057185; cv=none; b=h0R8Wpvc6ZpspbtfLXz5Fhj8r0YflWlA7DuCZ2qIU4Djajgwz6U0el66gvdjASKc5+K0HZuFqVwofC7IHlV6Pimb752Td0INwRMg9Z+KBBTcqrL7XLBLQ3baVnbUGOHAzZ/pLT3j3EApiSD0vTW3JaDcz6ott0V4SxWClQBmO/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784057185; c=relaxed/simple;
	bh=TK4faDxwkcnBA71dMWWF4PBW4tkcH+k9ZDC6o7zxR7U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pRt/8DNRE3SHm0VdcpUJwjL+kHGK1wq10Mhh/PNptY7MlJslj0Wn449A/O0ppa0mBZawDAJUG56RqZwD0nz5iX8h6RTH6nJV43u2rpQTIgRg3wnNsUvG/o+pBIa8jGYsGvJe7gyWvqCqPYAUXMcA2tzJDz4t6IciT7Moo49Ca74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=c/EWKfwa; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="c/EWKfwa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784057170;
	bh=TK4faDxwkcnBA71dMWWF4PBW4tkcH+k9ZDC6o7zxR7U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=c/EWKfwaVQPeTejuzFZAoC6JJXdBbotavJ2SIwpEoaxPSmnr0FZLzKPl3TBFk1Qys
	 PqqcCNDj9QTcEfiFoGiT1Pr4YQ42vXzi8yf+Cz0ZktVOK5G5n78YZ0FK6sxtEpocrs
	 4IKDvfRZKCpqdPTnaZNJ/pvbHs1seol+idddlx28MuGGuKTZoj/GqRuL3yt7pK0c3R
	 c1ATp9cOJTZqQEshFjJkrvNzyvTUaDL+P9a1FiscFvjvITVzifGmbt1SlsH5S+e/oS
	 vF+Qmgvie6MwKW61/LyrOFb/l/CYxHy9QzMbJdZgnUOHbDpxV6Bqwsd7fpAhRkXZod
	 QRrT/SCH950gw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0DF8117E1164;
	Tue, 14 Jul 2026 21:26:10 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 0197648006D; Tue, 14 Jul 2026 21:26:09 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 14 Jul 2026 21:26:27 +0200
Subject: [PATCH v13 26/35] phy: rockchip: usbdp: Handle
 rk_udphy_reset_deassert errors
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-rockchip-usbdp-cleanup-v13-26-6cb3e769d4c5@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2365;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=TK4faDxwkcnBA71dMWWF4PBW4tkcH+k9ZDC6o7zxR7U=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpWjVBRgD7S9jDMOAa2xwuOAnODOp8FDT59i
 J0EaE1aJ7ViMIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqVo1QAAoJENju1/PI
 O/qaNC8P/2dpxchbZrGDF2pbvOpDcw9yglidzt0zaJyB9WkfjCpZwb6bf/Jly+TJL7kh1JnIrEi
 OnnDoa1OpLWPgqPMvLOi34VbV6Zv82jKPTnCCvkZc+UbN8X6K9OO1v5o61s+F/Hr63i7ipoUQ4e
 8kbbGXoFX5daltHQhk0PLsrAmeLxU6DK6KMRt/4lWuZqIpi9eLFVJ4uEKZfpOm97ZCsdKwrfXjU
 uv6t3hoCN7Y+gGUQY/YNA2yIPvnhsq8SURfFdIe1N5S2UxZJX0EIgeM9zcpjl/mxTFQ04snnnu6
 zEK0taXgwuhi0W5DfhoBE0goIT4vIhXuVAYwnhAD9HTNfnpnplpTlUW1NBBgf+XiGlByk43hBfp
 SDlVaSgjVY67uwNVQV8ZJwUTHakEFYwkwv+b4CrCFfhpb9MKfckfPWMQYsu05tjk/Lm0wuV5sSu
 ke4qRPLUXhW13RJ4tJoqzALokJq/372f2g5EpMrYmoEZJSy2M6V1hPyjknuc3BtJF3Qnvtz1pBQ
 cQo4MOgMO0JCzi8jrRs0qvfqsbsF+382oGolMiasSjaKFyCZLQr3bdHwfuyTx/9dpNQktoYWwzs
 HfkE46HS2FUAyWnSoXU6OorKV1oDq9G7vresLN5yblc2Sg8WX3rj9DkRNpZ7U4WlrQHzl9TkKJU
 gwUtxvotdHVmDoLRUYKQzNQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Handle rk_udphy_reset_deassert returning errors to avoid theoretical
(Rockchip reset controller driver does not return errors) SError.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/message/20260626211151.2332F1F000E9%40smtp.kernel.org
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index c7f09040185b..701c92ed6e2d 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -803,8 +803,12 @@ static int rk_udphy_init(struct rk_udphy *udphy)
 	/* Step 1: power on pma and deassert apb rstn */
 	rk_udphy_grfreg_write(udphy->udphygrf, &cfg->grfcfg.low_pwrn, true);
 
-	rk_udphy_reset_deassert(udphy, "pma_apb");
-	rk_udphy_reset_deassert(udphy, "pcs_apb");
+	ret = rk_udphy_reset_deassert(udphy, "pma_apb");
+	if (ret)
+		goto assert_resets;
+	ret = rk_udphy_reset_deassert(udphy, "pcs_apb");
+	if (ret)
+		goto assert_resets;
 
 	/* Step 2: set init sequence and phy refclk */
 	ret = regmap_multi_reg_write(udphy->pma_regmap, rk_udphy_init_sequence,
@@ -830,8 +834,11 @@ static int rk_udphy_init(struct rk_udphy *udphy)
 			   FIELD_PREP(CMN_DP_LANE_EN_ALL, 0));
 
 	/* Step 4: deassert init rstn and wait for 200ns from datasheet */
-	if (udphy->mode & UDPHY_MODE_USB)
-		rk_udphy_reset_deassert(udphy, "init");
+	if (udphy->mode & UDPHY_MODE_USB) {
+		ret = rk_udphy_reset_deassert(udphy, "init");
+		if (ret)
+			goto assert_resets;
+	}
 
 	if (udphy->mode & UDPHY_MODE_DP) {
 		regmap_update_bits(udphy->pma_regmap, CMN_DP_RSTN_OFFSET,
@@ -843,8 +850,14 @@ static int rk_udphy_init(struct rk_udphy *udphy)
 
 	/*  Step 5: deassert cmn/lane rstn */
 	if (udphy->mode & UDPHY_MODE_USB) {
-		rk_udphy_reset_deassert(udphy, "cmn");
-		rk_udphy_reset_deassert(udphy, "lane");
+		ret = rk_udphy_reset_deassert(udphy, "cmn");
+		if (ret)
+			goto assert_resets;
+
+		ret = rk_udphy_reset_deassert(udphy, "lane");
+		if (ret)
+			goto assert_resets;
+
 	}
 
 	/*  Step 6: wait for lock done of pll */

-- 
2.53.0

