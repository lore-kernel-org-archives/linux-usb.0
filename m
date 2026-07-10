Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EAAA36A365;
	Fri, 10 Jul 2026 16:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783701988; cv=none; b=a/xaRV45UU4+HOhf54b9UTKVgWeCDNbVOJWD23M4IPf9VkxZHdOb9ayMSmY16ou7SEg+AeJMnO3IFUwh0O3aJPg7zEng/7tXRz8f0ZxtRH7CHcNuJoXJMVrvNxD13hjqAmqpGNyDo3oHxEBg1RjZFmjrK09zgHvSsPUYknY6hGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783701988; c=relaxed/simple;
	bh=gjt94yB7OMQ1kbenpTWsg4rbaygeNwSXNZrsMwALuYQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l3qsbXQopY4PI+Th0HIQ8W00fskyybEazPW9xS4ARhtMabICe1cEm02OrcTUBkWaieH1sYiT7x9583jZ15TuXy035x+YL9IxhJQuyOtQQotTLNKRimRpOVoFDgXzOhwbjtKj8IElPaqNd+k/d2O9EKtUxnl7IC63i0is3VLcfXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=JqyTaoFd; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="JqyTaoFd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783701978;
	bh=gjt94yB7OMQ1kbenpTWsg4rbaygeNwSXNZrsMwALuYQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JqyTaoFd+mlc/cn9VMI9Wttow2ObHIHPukiUrsNhkj+BFjFAN5tHj+LjuPhk5m4Va
	 h9JJ+btty6yT8rS2rDkTOcSd4gdVPoty4tAUeWPYSMkUKiZ4Gp5XZa9ozBVsaQfW9r
	 h1vQmEScJdh0m9l0D/qsx0cXRMlHRz9CcCw3kq06I6QPhSheOknZVD5q0M+TGFUV5S
	 1/fg6hvrjRnCYX57vjgQDh3FUeYCKDgVyxdTfgPcjQaU9aZ6xHHseaM2Vv/H/4mQkk
	 YTRlayEBeE82XldkwOsNVzBM8i+ralbYxd2fH3CgU4Q3G0RJS3JSF2tmrQh8Eode5h
	 N0kU+5TBbX47A==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 798C517E0EF3;
	Fri, 10 Jul 2026 18:46:18 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id E2748480031; Fri, 10 Jul 2026 18:46:17 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 10 Jul 2026 18:44:43 +0200
Subject: [PATCH v12 05/36] phy: rockchip: usbdp: Handle missing clock-names
 DT property gracefully
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-rockchip-usbdp-cleanup-v12-5-8b41a9a9bef0@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1302;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=gjt94yB7OMQ1kbenpTWsg4rbaygeNwSXNZrsMwALuYQ=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpRIdjsPCaJlc+z5dSBjtjq7bN6bho0S+VeM
 DXYsyxGqpNcB4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqUSHYAAoJENju1/PI
 O/qaEL4P/3dJv/u35phqgsrJeDDE84FYklkPbBWSOAcYSYLvpfO1AMCs1vLnM3l88r8o2dVsbif
 3008tKUuq3uSr25g2d4Des2XD7n5wuS6LO6rgvE4AtxxK2WoaT/GExr32F1lUtvwMQqXSzUlnvZ
 hJGm7szS5+T7qr9LKBD8a00hLKZRJLapomIqCuGJON95u8b9lkgQQP35ONXT2dxYYALDOsA8Lht
 0rip85XoYCu8E/0cQO/8wwVVoEZxMl71uVC8z+/v2eUNaAOSmjljdoAKUcolYfO3ku0H+cAbnml
 8Bvy/TiS+jAGa/VMLGUD1ftrWynmRGhDLqcJH8lTOtWga71rRtgYqsv3sjoJviZlHKrY3wNTqhq
 ZtmBPzjqUtKnB2n3xWBEqk5TH7QVBW7PduYhvuYA4qB0TfPNBfavkqrtHPTocClvVTAMxcLAPb2
 HZKiHja8CWeS9kAki68hWJU5jZFI2kvCoEhIl9dGD6gBhl0xi/OTTD2UljZcme0ejamC2E3VNqr
 dYY5C+be5HbV2CeZj4Z45jiMgvFIy2WSIVWeQgjWW01rjuS5rRdelWhUMswFwOeOMyHj0YilScC
 UIfzt8XnHTU6PLfOD3figYo8ZVgoXv5j4PW+jSdxhlLAuP250LENsWFrYubPSM9jWCWr7xVOV25
 J2DD4iGTNEXpQ5F5tNMkvbg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

The rk_udphy_clk_init() function would currently try to do a strncmp for
a NULL pointer, if DT specifies 'clocks' property, but no 'clock-names'
property. Fix this by making sure the clock has an id string set.

Note that DT binding requires setting clock-names, so this is only a
problem when booting a non-compliant device tree.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/message/20260619154349.071321F000E9%40smtp.kernel.org
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 2845a012eafc..3fc8222fcaec 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -432,6 +432,9 @@ static int rk_udphy_clk_init(struct rk_udphy *udphy, struct device *dev)
 
 	/* used for configure phy reference clock frequency */
 	for (i = 0; i < udphy->num_clks; i++) {
+		if (!udphy->clks[i].id)
+			continue;
+
 		if (!strncmp(udphy->clks[i].id, "refclk", 6)) {
 			udphy->refclk = udphy->clks[i].clk;
 			break;

-- 
2.53.0

