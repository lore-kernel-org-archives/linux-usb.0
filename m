Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6123B47E3;
	Fri, 10 Jul 2026 20:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783716979; cv=none; b=LWdTRPUowYQ3KnLksT0soecGyOx4+QUaK5tzqa0Aal/ARHYc0ORPzbfDWCZv1SodQx03Ob0N6z7N/aGnJAWDzrg9OQXNnCeq9ls2yclJ3SDYBhNaa/FrJWWza5XeU2CCWm4ya4bz1ofnrEdOPHs7DTsp/ve5jAT174qTAnrrU+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783716979; c=relaxed/simple;
	bh=qKK4xLVOYKJrCjuBRyBavS/8Om6sF2fxSD6TP3t56mk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U8u2dHs8WUDg15zfEhQhEYjT+/v2FZj/pa0C1TNXj69Cs6IJwgHuPRMViCbFqHf8VUC70Ybxv0lgfR4yDf5T+EsLvugU5XTwGaN5HMn7ZrNjPIOPdFPxtN9k9kNQzww1c2JwCMVCZP9AwC592NF1vR7wCvzOyHCWxcbkmQWJGy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=egOm9piZ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="egOm9piZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783716973;
	bh=qKK4xLVOYKJrCjuBRyBavS/8Om6sF2fxSD6TP3t56mk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=egOm9piZ3yzUNFEBP6UkJAlavEK8l5iFkZLeVXVcNWtvcxA4NUh4h0BvTp/RRv99Z
	 zveiXP1OqLYPIvP8qbs7KaVilCuDgeOsZeqyK1pVFdDrNDJx6ORUdM2ig0GyPdY3Er
	 goHiZBivZZn+xVq9fAj6lxWlTs9Q0ViCgPMILYp78p6+jRbz8mTrJ9+MGZO2IMdWuE
	 KeWMh2qPwJIiO+D3lrByiSjsrnygjk8s1Bs4RmFQY1EB5WP5snfsHuJ1P4JKSW9bgf
	 UJIgBvEJiPDbcP+nsjZevzFVzIFhQOYhS6YicLja2peK1rVSNhhCNoCf7qUtT4A8pG
	 wHuEqwF3eOERg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 665F517E0EF3;
	Fri, 10 Jul 2026 22:56:13 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 16951480075; Fri, 10 Jul 2026 18:46:18 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 10 Jul 2026 18:45:09 +0200
Subject: [PATCH v12 31/36] phy: rockchip: usbdp: Add phy reset notification
 support
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-rockchip-usbdp-cleanup-v12-31-8b41a9a9bef0@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1968;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=qKK4xLVOYKJrCjuBRyBavS/8Om6sF2fxSD6TP3t56mk=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpRIdn0G4p8F7npq2LrXsRBeJ6pyk1Tp+BoV
 KhTw/7Q3OtD8IkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqUSHZAAoJENju1/PI
 O/qabd4QAJYKlcRUkV6RscDzhVSSj1vbL3m1xCpzMuMs4pbpMDDj4nWvv76wzvsPfxU6Z7yYenG
 xh0Xw6nsPRlHyFKiY1HSRKDMwq5xpBMY5MRFC9fjLcrWTFO6/oOh9yqD0WlS1PxBvacXDrUzoki
 0h9B8Cl/DXRYQ9rCCjWdnbNYphx8tBneuMDrVG/cS8BcUP/n8QfGw9nPpWvDu0z8oxTsxvpJfdm
 gq/sXfxib63XnyqVPJQWS+b5ev8GujCt/kQvECo+sHVTsnhBnNhgCfwhRTThGJ8GcmJ0I2DsEYz
 bgVg2vNsQQx5aDVRVo6NAd0wq8N/SWJFJc3b+4QWZeIFFEjbq7zeBjqvq544PhQno5aFcbQa3In
 4rNb9a+kxUYyvxiDkWi6HOj/v1cVub3xDdBDBaQmVAGGaVKEZI8wdy2cCyhqFIPZrpsXz6oc7ay
 DGr5w58uXb+VjAIOWxHwgRkqBNIHDn0pmphzKAL+Okd4c+gsONkErQnOspwIJgZTutbjz6ZR8/S
 AgsrGUs0xyPKir4im6PwsD/c2x/WAZMWwWhDTW/Qtpf8FgIcraOnUZaxhZYqqFxHLrnsiF1xWKh
 NDB1kjg1XCMq0s1MfzODUjPAl+Dzah0K44nK3EuAQI3k2QMWsPOhaQ/8+5Lz6uc4e74RGZIQyOn
 oZ765YVgTujM1YIDQZeQ2RA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

To resolve issues with running into permanent "cmn ana lcpll lock
timeout" errors after a few device replugs, add support for reset
notifications, which will be handled by the DWC3 driver to gracefully
handle the PHY being disabled. This avoids corrupting the controller's
internal state and the PIPE interface between the USB3 controller and
the PHY, thus fixing the issue.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index af915cc37727..0333e846ce34 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1005,24 +1005,39 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 	}
 
 	if (udphy->status == UDPHY_MODE_NONE) {
+		phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_PRE_RESET);
+
+		rk_udphy_u3_port_disable(udphy, true);
+		udelay(10);
+
 		ret = rk_udphy_setup(udphy);
-		if (ret)
+		if (ret) {
+			phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_POST_RESET);
 			return ret;
+		}
 
 		if (!udphy->hs && udphy->mode & UDPHY_MODE_USB)
 			rk_udphy_u3_port_disable(udphy, false);
 		udphy->phy_needs_reinit = false;
+
+		phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_POST_RESET);
 	} else if (udphy->phy_needs_reinit) {
+		phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_PRE_RESET);
+
 		rk_udphy_u3_port_disable(udphy, true);
 		udelay(10);
 
 		ret = rk_udphy_init(udphy);
-		if (ret)
+		if (ret) {
+			phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_POST_RESET);
 			return ret;
+		}
 
 		if (udphy->mode & UDPHY_MODE_USB)
 			rk_udphy_u3_port_disable(udphy, false);
 		udphy->phy_needs_reinit = false;
+
+		phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_POST_RESET);
 	}
 
 	udphy->status |= mode;

-- 
2.53.0

