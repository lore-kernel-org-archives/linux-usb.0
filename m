Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49423438485;
	Thu, 13 Aug 2026 20:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786654323; cv=none; b=ND4k5sfLEzgUv5OfUEC/l0QorLQT0DBfl6wvemsHQVojAGW7d0m1Wa07JH3z74XhWCHl/3dwIIu++USa3S8vyJyDn4tCW3XXoNWnXM+CmXxQqXMUShpNvDrEyO0F6iHy3BaUnTsBHJsd6SNgNyXYZkp+CeKISNVGUl7AP7PcaEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786654323; c=relaxed/simple;
	bh=GY+QbZmJX2NfMAY3wjP7LE/ELGR7/mzG0xUCwgaIlb4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rHsrQ/ZhbL3ZfxH2H/D6MjMBFlfeMD+h4b8i+WNZYQ6o/dlyAilnkHt8HLp5RMJSOUgutugQMZZ/0BrizMy9B/lRFc7+F9i8AgAiqs6/coury9Z+AZs4YPHRCkgL1JdBIfgWBuhtZqZ7DAyAALwhskF7RB8D3PWGXDbu9cShCGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=qygJo9XO; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="qygJo9XO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786654310;
	bh=GY+QbZmJX2NfMAY3wjP7LE/ELGR7/mzG0xUCwgaIlb4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qygJo9XORqx8D5bahZMHqruv32THk9BU6E4Y50iQ7tDK2oepIbYjmgDyG2eggKOl0
	 M7GPInkU/4aq5707FV/WwCgrDp9MdxI1PN6xUpy4KS3+z4Pbydjt+qQ8TQ5a3WkEKv
	 x0Rmh60BYyoY15bZDU0saSX2VWziHPcOfCbW8VTgbL+mirUhXSlBZoXCDJvueTyrg1
	 AmlBmqvfOF1tcz2IGZqUOL59waLbjc8g9/huGiL84bw/rEQ6x1XbgNxWrBPZUQiCgz
	 dQZevHzeeIqf+WPhC582dk5DF9Ait4BCPzGHsoKgTHMJ5w/F4J+vsSEJ1MluU4Nuwt
	 CSm2EmYe6eRbw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5852917E12AC;
	Thu, 13 Aug 2026 22:51:50 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id A853B48004E; Thu, 13 Aug 2026 22:51:49 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 13 Aug 2026 22:51:56 +0200
Subject: [PATCH v14 13/38] phy: rockchip: usbdp: Rename DP lane functions
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-rockchip-usbdp-cleanup-v14-13-b5ad9c68fa11@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2076;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=GY+QbZmJX2NfMAY3wjP7LE/ELGR7/mzG0xUCwgaIlb4=;
 b=kA0DAAoB2O7X88g7+poByyZiAGp+LmSh3knGYmv7fT9kSi3ySS76jLov+Mu/rLubFDJcTXIqm
 IkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqfi5kAAoJENju1/PIO/qaTi8P/1BX
 ODj6LBj5dzjzZqYIv88Fr75f9+2QecOG6ikhOc/9PMqdh16xjauvrc1i7lNOe3ObieyHMdXuc6f
 ZPeoDgrgrgS5Oh0HWWO8V3DwCYuyVNQkEcjJlsFIgK0r7DddZggQQCDP8Yo69wzxkTjyFwLwaFI
 F8gNi1KGKMQ7oiNN/Mn7mHmbkSTF+1oYmadixoNdk6+QmmKS8MHuwSQxX/ajF0ULNeEKG0daF/I
 z5Rxd7dW5wZI6j9gIAG6qUTaFn3p2ek59ZvKLF89e/e2q0dkwnWWKhXIwtR7sF9TzL0du5CaY6G
 HcU8kbExwRy2XsnYtj6kdsEkGYQcRTy5cfoEcwj8e51sD31Lcs6MeQuCIHegyWETYVzZm4frFvF
 kWTcaV1nE3ZaJCnY5lXtK3OOFPYR4p8ag1zbQObLsSh6XLcNfciWGC8WdlS1gJl21X9v6C6SMfL
 jNWYWQpUcEDWJL7tdwdHPmhgz0aI4kxJXb1GQCjwyHEpZar99WDPQFjrmyj35UuozUymmT8YQXg
 FmC4eDYjZB9fKE05pZIfXgb0xwbKGG/6+6iUXdScZC2A1qpo0pg6kwofSdELTeK2Z8WNiAGJFko
 avdrL7q5lLK1mdylD3ISkVV0e+PPbm+oXwLRwCKTPGrN3vZ71OEP1jZcYQu1VheLW/PIEgCmViU
 ZpuAV
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

The common prefix for DisplayPort related functions is rk_udphy_dp_
(with a final _), so update the two DP lane functions to follow that
scheme.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index b172ce6a722e..7fb864a1486c 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -545,7 +545,7 @@ static void rk_udphy_usb_bvalid_enable(struct rk_udphy *udphy, u8 enable)
  * ---------------------------------------------------------------------------
  */
 
-static void rk_udphy_dplane_select(struct rk_udphy *udphy)
+static void rk_udphy_dp_lane_select(struct rk_udphy *udphy)
 {
 	const struct rk_udphy_cfg *cfg = udphy->cfgs;
 	u32 value = 0;
@@ -574,7 +574,7 @@ static void rk_udphy_dplane_select(struct rk_udphy *udphy)
 		     FIELD_PREP(DP_AUX_DOUT_SEL, udphy->dp_aux_dout_sel) | value);
 }
 
-static void rk_udphy_dplane_enable(struct rk_udphy *udphy, int dp_lanes)
+static void rk_udphy_dp_lane_enable(struct rk_udphy *udphy, int dp_lanes)
 {
 	u32 val = 0;
 	int i;
@@ -1049,9 +1049,9 @@ static int rk_udphy_dp_phy_power_on(struct phy *phy)
 	if (ret)
 		goto unlock;
 
-	rk_udphy_dplane_enable(udphy, udphy->dp_lanes);
+	rk_udphy_dp_lane_enable(udphy, udphy->dp_lanes);
 
-	rk_udphy_dplane_select(udphy);
+	rk_udphy_dp_lane_select(udphy);
 
 unlock:
 	mutex_unlock(&udphy->mutex);
@@ -1069,7 +1069,7 @@ static int rk_udphy_dp_phy_power_off(struct phy *phy)
 	struct rk_udphy *udphy = phy_get_drvdata(phy);
 
 	mutex_lock(&udphy->mutex);
-	rk_udphy_dplane_enable(udphy, 0);
+	rk_udphy_dp_lane_enable(udphy, 0);
 	rk_udphy_power_off(udphy, UDPHY_MODE_DP);
 	mutex_unlock(&udphy->mutex);
 

-- 
2.53.0

