Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2344741DE02;
	Tue, 14 Jul 2026 19:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784057187; cv=none; b=BeCRrLQ1FW1dCRlCfqMnHcr1o01Q2JHYFaU1nU/1b6Sx+AimuIUZu+79ylyqv1GQVFkCJGJUM+d+Hfs6AyNB+dkCEgHBgla+h8GhA6PoEN5whm+2dO3nKV8j3H6xGjURpud2K3IbxoJJYrCIG4knurtQVinDetdCBsdA4aWZPQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784057187; c=relaxed/simple;
	bh=Cq66EKeE2flHvN+UE+9Jd7VxqMbU2uK/j0/Drv52Xi4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SulI3fwPlRsQlRVVBGkIHV/9QaIbdv6lo+BHV+jS5PxlJgGOE1TpV5PABY1q5FOUI28KutuTMiJoduDHkeTQt+L1a8m8mpc5knaPLq0ujtfuX//wYacr5Ia+huRJX5hpqC/NHid50qunb0jtXanOrogXeoQgmZxdZmMSylQtnz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Rk9Z/R42; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Rk9Z/R42"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784057174;
	bh=Cq66EKeE2flHvN+UE+9Jd7VxqMbU2uK/j0/Drv52Xi4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Rk9Z/R42FF90Hf6BQKBh6UG09k8y4+0WjEMOKoxcv3Qmy3g7Q/oItkjBM/MVc3Y/U
	 LtgvS1qp2fSKETmGky59xN2Taz1TP1qSwrM41Kaw6A7BoaKBdACKMThJ5uB/Gl3lL1
	 nregYd8BcQeaur+WNAkhqWtABPKfChL+Q7V+vrh2wtoaeh3bOGHi6zYWhXlsZyC+9K
	 zteFaO5pdwL6hSV+eguxgRI0z96VOes4pEyVI58oE8Az7qgocs2q+bEDluuMMiPUej
	 LA4LwigCaO3KB5nYHK1kQ09TEDJMfroLUwuCvcBzi8wVa6sarYK/RnsVd+UOzWMmxU
	 Qp/UBsxpu1o4g==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9D0F517E36BC;
	Tue, 14 Jul 2026 21:26:14 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id E0FEC48004E; Tue, 14 Jul 2026 21:26:08 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 14 Jul 2026 21:26:14 +0200
Subject: [PATCH v13 13/35] phy: rockchip: usbdp: Rename DP lane functions
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-rockchip-usbdp-cleanup-v13-13-6cb3e769d4c5@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2007;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=Cq66EKeE2flHvN+UE+9Jd7VxqMbU2uK/j0/Drv52Xi4=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpWjU8PsBrTeDHuwd30ncJpcP7OaB7DFoutj
 QE6UqAabWAzW4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqVo1PAAoJENju1/PI
 O/qaJd8P/3sIBsWLap93/EdAi2yXwxyjzrE6xD3YK8WGN3OfdL7k7V6mHLJzMQV4mWkQspATGvC
 h9uie7H2bQfZAagedPCIQpUmn5DN7gDBqFltuVsz4k+U2uL8+YZDlvRDfQv550Zb3NPcLut8pO5
 tCKmMZ15+2b4cZwukSzN95C46aTaeWyedLVhUezkQRFSITMly03h8+EWt/fSIzfSfXJ0tS5+bZA
 KKqAUAzDoGj4uJVJNUoxCgF6ktVgUAnFPQ1BwmsZ81kRKn8JocE51vlYN6OaUVdygwQxNLOGNv+
 12TfpytmGAJWkQqzukfxszqahd47vBhafpxWMMp8TG3KyD6Utalh70XEfaSsWwjeAsTgj4byfzP
 /FaNBQqLJC1amyKbLXYVY2MYpyh10QDghOHhETCjzULTrmCQlt6U6o+wwgZzfuesbf36Pvk3VOP
 Wqe580QiauEbzTXg1u3w4afCDTOJF+aTPuq0AmyOwGukWVXQJSbPIyj3SfKDKZJe1sT+VGpRJoz
 OHHeG9Y8/xfJiC5EMxse6t+e/FJsMe0kWvjKJOUJNWaOxjniXdTX92a+EVJlDIit1FZnsXAMtax
 ghcbBdaMFSal+Q57BqW4h3Vx3rrCADUXafPf1Rf9l51YQF7GHQaxWr4yDru+ensmIkpe5NcSJK+
 C05TLAa2ejAcGK48tWOolEQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

The common prefix for DisplayPort related functions is rk_udphy_dp_
(with a final _), so update the two DP lane functions to follow that
scheme.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
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

