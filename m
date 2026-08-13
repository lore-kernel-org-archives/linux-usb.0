Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A5A4322E0;
	Thu, 13 Aug 2026 20:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786654321; cv=none; b=OxnBeoLng7svBtJPzdj+psf+rqMuBhDsi6pUdbhLK5BAJuaCBpz6zQdyqzkc/VzesEltWZxC5k7ZBZfeyk8hrt6xPjd45hStgBBx15OHqimE5TjaDfrB/eH28ZPmvPwcm+zf0GAnKiZX6NzgFt0qDHkxB1zcSFgrNLtPJ2PfgW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786654321; c=relaxed/simple;
	bh=R/eGVFwim8xnw/aTBVH3ZJXJWvwyinq/JxapwRExRic=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kyQ2Q6YPA8nRCP76+zSCUQ3h/dwyYPeFnX+v1tng1MJL9mdBMVPgkzP3+0lhF19nu2msLupRnmH9lEUTfCuWrmKKN5NcWJ47S97caXqWK/siG/hwJNL06G0oCayqZVv/sFwgjwL24LRidTgqeHHxduj/dnqUb5iKyE+y54ADjBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=FqdH2+V5; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="FqdH2+V5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786654310;
	bh=R/eGVFwim8xnw/aTBVH3ZJXJWvwyinq/JxapwRExRic=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FqdH2+V5O4AeLscIMeR89giy/Mzsc3oltlECjzwo1JCkHUpEzZDccB/rR2z5lwihP
	 XRH+r7A+3Wz+8ImOit7J3x4D8GxfzXlQsHqvpuQMyqqt6tKGgz2b5bi9+mj5R1okiy
	 loScnzlwvd+Eid+5JuinMRA12bm7/H7UoSjHOXkHz3dRN4tPHJtqTQYcFOIYp8e9AZ
	 JLf5jN0vjqGscfFpZcJfeMTR+Xvj5SfLABoZJW19bzxbSh71AoTRSQSZPQtmJKjMuY
	 hLPNnkDdUH8JBcpaXc7vnsk8+Hqnbhu3MByWaiLJrBWhY8ySWJadxfJejUAKnaDCre
	 HVg4/JYw87bUQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 338F517E107E;
	Thu, 13 Aug 2026 22:51:50 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 9CA68480035; Thu, 13 Aug 2026 22:51:49 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 13 Aug 2026 22:51:49 +0200
Subject: [PATCH v14 06/38] phy: rockchip: usbdp: Drop seamless DP takeover
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-rockchip-usbdp-cleanup-v14-6-b5ad9c68fa11@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2952;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=R/eGVFwim8xnw/aTBVH3ZJXJWvwyinq/JxapwRExRic=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGp+LmQVvffL7aOHLDroU0LoRqH7pdVRFgMjT
 yDi0b3JvyUgfokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqfi5kAAoJENju1/PI
 O/qad/8P/3wl0tuoLk/pVnvE4LKJwdfqRivg+BstdnwathcfdbOVMQroJvhMw+/hnMK7wo9gZLn
 BJ6B4qNUi1GnIjy7Dk3ELiMXGBO/MGqX72gDVWk/GZrMb7D6Fn3kUkx+JSuPgzK/Jdfv9f3pX8m
 WmHpODnEOpNfixEMIrfrE7lGKdMk4AZYWhViOI0VhkQrFngnN6kibNXAYVQQc//ZKR+YK3/9BMB
 luq+bxDkVbC4gbuc9gULGaa7ofPtH+6gYfRn4l8WBkEK72RNBiLi3ka/SqkEKDc+na3g4O74WGm
 cFocmv37Z22WDPagBHB9OzsO3H1r81p2jy7f7yLkx3fA6CtdqL45kFjEx7gYuncYnqUzLGgcn/z
 XQ9zqEteTBRp3cAWmBmXui0GBAgmVKwgmzeQkAUqZIqhdddUFGVG6Mu8ck3AFUTtpWwmp48beYB
 KZnH9KjjxkGSURsVzp6n02Qd3OtQOtjFzpZrPwwldmuCs/Uxi6hnp5s1K1OyDRDEAxxXlvphKRY
 CFISqHGBc36wIze/8oA38NN/VSZum+kb633woZe87dr5Tf4wsYdHXiC957zwkksaNBn8rBiHPOg
 oymkxtCgG4Q7sRLGCuam7IZ7HJ+RtS3ipm75Rr0oIPNHpKNjMY5H/JQmNWiMMTyry+cNX/wNzbE
 EwMeMYorqwa7pfvg//xY1Pg==
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
Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
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

