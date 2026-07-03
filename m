Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47AA0314D1F;
	Fri,  3 Jul 2026 18:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783102420; cv=none; b=G837Z/I2Mb/17093YnF+R67spLQGxqEuycuf5en4e6hAHr3iTzjhZTCUHs45HH18CEIHT8gNgY+mZ0/H7nl/q1ASSZ5X8zfU0TZUofNG58v8M2SF6lGcg1aZFc4wsSZy6udND/7l5E/bS8QDnLjCF/hcMm1jeozCWyALKm4O+rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783102420; c=relaxed/simple;
	bh=Cq66EKeE2flHvN+UE+9Jd7VxqMbU2uK/j0/Drv52Xi4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BCre8GsgVwWtP6xOqICmGHVkfV0pEEeB2maID6XJik/HMP6QRHFe+/I12YuWUx5aSibNA0ZAuxokcjAMR8ma0PTH93HE5goaAg9q+mbHoG8q7RfVi7TrCXRhTCxNGpjmneLuwZXOejcN1OUkd0v1J8Ego0qud7mZucgVinb3epw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=XwW2KuUC; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="XwW2KuUC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783102413;
	bh=Cq66EKeE2flHvN+UE+9Jd7VxqMbU2uK/j0/Drv52Xi4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XwW2KuUCa5+l/G7cclM+LxkEmbFaUx8IdRxwPp3d5nuSCrcivCyzyyE/NRCjFvB4q
	 LMB5vDTDA/fk+JpqUAp94exjPlkdr92uCe6Dx/acsVR9wpkE4d9sWRBxlsWZfWtV6s
	 W1DbohVOVX85KX+ZllIN81Gie5CAAFR6bscFcDm4u27TZRogysd+F0fsuI/6WagkEC
	 K1ffxt59mEBp4Pb0+bd2MbpzvFaK5xUZR9v7F+Q4QB+JIY8/DWVJD7wfaj0SmmB+jx
	 ttA0j1nNbC65aJTvghyY8QEhRxQ8ZO04Bz37EeOhqd/iFmBqxRGOjXWy0rvxZrnPic
	 z12EJtOvxktcA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5BD6117E14FE;
	Fri,  3 Jul 2026 20:13:33 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 8CBCC48004E; Fri, 03 Jul 2026 20:13:32 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 03 Jul 2026 20:13:29 +0200
Subject: [PATCH v10 13/36] phy: rockchip: usbdp: Rename DP lane functions
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-rockchip-usbdp-cleanup-v10-13-a392711ca8a9@collabora.com>
References: <20260703-rockchip-usbdp-cleanup-v10-0-a392711ca8a9@collabora.com>
In-Reply-To: <20260703-rockchip-usbdp-cleanup-v10-0-a392711ca8a9@collabora.com>
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
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpH+8vdN8Xu0NtfGKNy6qus96MfiT6SiPlRX
 FI+aIpaG5QxsYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqR/vLAAoJENju1/PI
 O/qaLRcQAITJAYA9GClMbXy/XCZ4hPaknOo/ktdWcYmJIafaXwupXUwsYHHnWZU/nvH/cFbokrG
 0dnlzcbCLnpwmLIx20LIBiZextpFK+83rLz7Co2u7FvISdo2riq+ATI4LVAr29qZ6lqWG1bQX50
 szbGwBlU7oNNJq7sP69YITG3DX85ep0uTa8zVlZn15RvAf0Gg1w4b+sZ5YdYEg31Gx1w181VDxY
 064PWske4F2jbbQH+GXryv6dQhCxAyxRO5nfSvIi8bMQPSFw2MZ2w69n8k6oB782RxqhhGANmxR
 bW4ZUduCgzrRSDrgH2b+Q6kexoJg9puUeIKHGhbhhEiwLI58zeRIs1T5KSVoKzTEFzoBbUsmGn6
 6gPs/QYdU8rn1eddoh9S27kHWAecOfcBNFTZ+iKstJztfqemCwRl0/ChMsKmU/k8BqAY1ltEFbL
 t9+48+J+jYcyQpCy7RtqD5vSHcifjPR3h+WAmdfBHRS2ey3DnZisvYkH6R7qbKXR5OfSD8hWaM+
 tXchqJvhRsBG5rVFktt0qHOkO6Ni5cp/xv+BlVA295CjJYqQsDOGVLEe5Q32J3daNp4CXieIwge
 RF6q/HbCqikwMaBxjwPy4UqUSBw8eoqYBiXXzKwMcUqJt8h7DK/jEdsta/5XUGZWv4+0aspRtB/
 xnj6XQo45IYyFVqlGSLcxmw==
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

