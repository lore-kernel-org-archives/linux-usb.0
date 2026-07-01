Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95412426401;
	Wed,  1 Jul 2026 23:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782948960; cv=none; b=GdCncr5C322UMdJHXPSV6UXiGJ+Kev+EwyDGJFv+HfWrWREuKIIkpmK+Gig9+62qDMUE0BWmaNSfaYYlDjmoQ5g6GHbE8crLIKjrBnSwB808wcaIyI6iJYHnyZcnENV8KkTOFVa/LCLekK7DJaenTsBieZOHGwaOMIYz6SIm168=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782948960; c=relaxed/simple;
	bh=pTOPEXaMpt1n4tYAVZIoeAJ2ZB+6WNJrO3nK27Dxf8E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PumXDhC8K0x+N1oG88CrS01espqq5igqUbfbwdPRLyh3uLel6xVmdIjNjfUckbIpgas6MUcz5xnyXWo/hrK9aKaGutyWdGefaufkhDwyDUMAcNDaJ+ldW/GED2uL/PDUXilkGdzq71IZZsvRg7lf+fwqCay+RHyKAiVhbFQeymM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=P6GwtnNn; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="P6GwtnNn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782948949;
	bh=pTOPEXaMpt1n4tYAVZIoeAJ2ZB+6WNJrO3nK27Dxf8E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=P6GwtnNn/H2WmIp0s0daN8F/3Muw3C5T1bSl/utNQG9goXKG1+xmOCnorOjkgZzVN
	 djZs+F09UQJ4MySv0Lbu/LfIHGIgiKlst8JygDWe23lbgE20d9vopjkzYRXNbNXVfW
	 RpMlhhnF/AHkggeehfRVw+6iafDzeIcHY3OlTRcD7+XGGr+ENDBDfJyvI084APlpuT
	 +F3yYK8nFjey5sdyKkTqh/A8WxqvZgsSjOoeLx8g/oDs6SAhj7H4ZzARW+zEnoz8bA
	 kHtMrZYHw6oglQiPovL6Jeyr8MNgWZB65v+RX8GM3k2d/kWC+xJh9BNFlPyTPV3Mtz
	 IhtqIi4CCHt7g==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 80D6417E35C8;
	Thu,  2 Jul 2026 01:35:49 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id BFA9348004E; Thu, 02 Jul 2026 01:35:48 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 02 Jul 2026 01:35:51 +0200
Subject: [PATCH v9 13/38] phy: rockchip: usbdp: Limit DP lane count to
 muxed lanes
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-rockchip-usbdp-cleanup-v9-13-e31efbb62d2e@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1284;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=pTOPEXaMpt1n4tYAVZIoeAJ2ZB+6WNJrO3nK27Dxf8E=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpFpFMuvNJF5FcgEbmr2QBWxRNLuDAT7JKvc
 tcflmA3fUo7eIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqRaRTAAoJENju1/PI
 O/qaQg4P/jJGezU/j04M299CwtpoNNYJn1kSEdk6wSCLOV3PF1cLK2p0Xopj5yVvlgCyIkrxDh3
 GlhQOA6qw+0nh2ulnjj/ik824RwDRzMG+Wt+1Sx2mgLvZYPxwx8nmyio0nIwRoEilVR3N3UpqUo
 mi1N8l2ZKnkpeWVtfgDWzWXDx0oC+2tZoectfhuNgW08ExJpY9IwR3l5xmOEoJZGW6BjtKsm1In
 S4QSvYidfQ31hEltQVtqQTXR6pBvO1CUdg7+I1tiM74k59FROvFlf8PIOueL7WCBrWMaA9PW51A
 XMnfVfC/SFFD3jhVXdKDxvV1l59xmzAhoK250ZYfGllm2EQUEuUzumV/npWI1MA0hhOF2Lyv26X
 MylMYuOIkS+07+WKWp3GSHUDFFBwb1cmW/ba9svA1Gp/1C2SRzC4I9ZGD01PtXHBK/ouM/M4JNy
 ixImaViVVvz2hK47EWPAZw4z+HRwiKN3WfTpCi+2CH+I9yWu1e38ZRyVcNmsWQm6aJcXifKGfaN
 42zn00HXY/0kQGsQLUXic6hbFt7N/kXaeBeZshqJea+YZ7Zehm32AV1z9ZnK7kiy2dbfkUCCg+t
 6go5+CYUS6qCSG4onsfdXOHiZhxL1r1e9Pvr61rxsoOnAybGcgmtTkv7WOxNRQb+WFqOUm0vSUk
 nFUpB7VHao35JJeygG7Qpkw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

In theory the DP controller could request 4 lanes when the PHY is
restricted to 2 lanes as the other half is used by USB3.

With the current user (DW-DP) this cannot happen, but as the check is
cheap and users might change in the future protect things accordingly.
Not doing so would corrupt USB3 usage by the following code configuring
the voltages.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-phy/20260612165546.98E1F1F000E9@smtp.kernel.org/
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index da15178d7f16..0cfd23a405cb 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1134,6 +1134,9 @@ static int rk_udphy_dp_phy_verify_link_rate(struct rk_udphy *udphy,
 static int rk_udphy_dp_phy_verify_lanes(struct rk_udphy *udphy,
 					struct phy_configure_opts_dp *dp)
 {
+	if (dp->lanes > udphy->dp_lanes)
+		return -EINVAL;
+
 	switch (dp->lanes) {
 	case 1:
 	case 2:

-- 
2.53.0

