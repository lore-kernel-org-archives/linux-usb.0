Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B9136F8F1;
	Fri, 10 Jul 2026 16:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783701994; cv=none; b=JjEFlYvef219TmUOhTVuQzJwzbEWClf441iQWWBsrFVsxyA6nc6vXVJU5qHewlIpZzM3thP5gVwnMuRaa74LZxQz/njafLRPH5PGZem35H1h4YYEiUC3b4Vf56kfJYmCC94DX8jjHSgPcll31W3lIZtdpGce584m1nxPRL8L250=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783701994; c=relaxed/simple;
	bh=Adf3D9AnAkHrC/YlGvt/hjXUbv43xmuTB0FhRy7nf74=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nj7VwMP9Ic8EcuZ8gvxv7bzmWOBvHmCrq0BZWRI2qpghH7ypLfKuk8pSrdDyA6PuB0yv6eDjNVWIlDSN8wjtFQtrQiumMxlrYrQdex3+mcxVQuNdC6XAB8yN4cW3KU07foFMTX8h8u+kf7voXt0NO+JMja1l4hjXrmxT8dBgYtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=kbfsxRrk; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="kbfsxRrk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783701979;
	bh=Adf3D9AnAkHrC/YlGvt/hjXUbv43xmuTB0FhRy7nf74=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kbfsxRrkDJ/By4IFU2kaeEAVXDq5KERD/hj0zKyTpUp3oil6LIv7YuAiWtT0h1QhW
	 AS3vqCs+Qqu2h3GQoTjSHOdbOoJkdaiSHW5NFR3wOJuAQ4h9Rp9ONbl1+jMMM9sf7m
	 cHkP3Q0oTRoBuS6Ia8lhmEun7lVovXuXAD1/isQaVJyB1vlGRYR4pXvnWMC9Zng93N
	 GzRZ7VAmQq5RENY+PQdcexahYb+hpqB3TgiQBihs49WmsfVSfb6K7oXQeO03yBhMwH
	 E8sFHRTo8jTNcUCZC1e99MFUQ4True4DfBZTsTNibqPaS1GJOZxxBO620wkFtnXO+4
	 WI0Z6LCYpe4wg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2947917E127F;
	Fri, 10 Jul 2026 18:46:19 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 105E748006E; Fri, 10 Jul 2026 18:46:18 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 10 Jul 2026 18:45:05 +0200
Subject: [PATCH v12 27/36] phy: rockchip: usbdp: Handle
 rk_udphy_reset_deassert errors
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-rockchip-usbdp-cleanup-v12-27-8b41a9a9bef0@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2365;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=Adf3D9AnAkHrC/YlGvt/hjXUbv43xmuTB0FhRy7nf74=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpRIdkklZx5EIMfvsZqKr8/+swrXpeTuekXU
 vTJ+GjYVOqoyYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqUSHZAAoJENju1/PI
 O/qaB7sP/ArLanC+QhP0ztEzeBU3ZeSO2fQS90p8TYlt7bzQmS3xb+PEB5EQ9wl27SIj0oScndP
 PeD7r/E5B7NpkkubID1E5HKnLn4fUbTzYX0r4i1oLAOMyZoGQXjfT1RZOucBW2GU98LpVyCS5jD
 N6uvmNrpgDOJ9uQg2/dotQfDrLCOsGIyj9iagRn/WR5cil8cHs9QEKOZhyWUbrbavn0j7MyWkjP
 WWFkhBQsgcgBnBi0ceZhxqh350fXGWQIGFufGm+Zl+2vp7W1o7H88JCQJt5KEeF6AgqJTcJ+RHP
 Kyy/W3wvwNU3G7Quki/khqGN5MISpPqf6SOHwt3GiZ4F66PBbUiy2one+8DZk98qC9QnzeBWNlq
 36nWvoEvayvcaM5LBmshwNlI6TFRI+GrJTNJyt8q7veYAFGCJV4bJwYvXo6ghJPdCJuC8vmKUhu
 D4XK1+3FR9csXG5aXnqaT4X4jOqojpbIMf24sHUTwEulutEbH0Ok/VW/aEnlQyIFhonszNNekp2
 9aujUIA9LfjT/1Lld6wVdkHnFdizb4S6WVba+zqxIdmMC0RDFT9OGxihYPGSAVrfStqYy7VkmVd
 SFDna/X4M6ny7wY3zJz0g/vLYKrEHSIZeimVY0tMQKmOUoODrfqpdOaOjWTM8JynP0+gATKsFu5
 zB8v0+CIxtQ+XZMZTy0U8SQ==
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
index ff768e5b43ca..2099ae2e51d1 100644
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

