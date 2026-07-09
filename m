Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18043B42DC;
	Thu,  9 Jul 2026 19:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783623757; cv=none; b=fFdPAbCeO0JXfiiTvEBl1SyMXMldO5t6/20Ly1uIt6ZM+nbT/3d7WUHwRfv6KrqW5VltlzKIa4znvhBuyBJx0sMLdFiBRK+H7XGg5wnxSJg6oxU2NyvvGSGsPW1oGIC3ObJwtdvKv0hhmWI1O4D35azTxI/XrEks85JRy9Im+0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783623757; c=relaxed/simple;
	bh=t8uTKCJDQbXM1zD6YGkoRMmsGqKnvfqXTlOk0PQD5EM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RBynVgYvDxaUIYVEd8yS3kgwhiSUs/Px0nYzWKF6OwzBkQc30JfvR8uhNc2Figm5aSUQ5LgI8sl2cGet4pIc/sJ2H2AwtdmZCe/0OLp3OHe8JXbPpXy6KbkaIezG6e18NSCvEeBkXmWeL1QYKwFV9lakA4oqqrSO0mCTnMnGjz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=TAmBUw7n; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="TAmBUw7n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783623750;
	bh=t8uTKCJDQbXM1zD6YGkoRMmsGqKnvfqXTlOk0PQD5EM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TAmBUw7n9uUAEA4O5H1Inpcb35tmf/EHn/06JUY2Qwk9sGGlfpGDexTaXlSI/lFGY
	 nDo0VxdTsfEUq3lfK0je/crj6IlWKCI2Kgamp7CFq4EARgUBU5QqA585C6tUU76XR8
	 zp5fJneNmYpp0GSkiPx4ZdGuObM2o11CXnMiDP5axfPL+jGFkyMTkDTt+/Pr2LO1xI
	 nM+ggcjza3B13qHT+RKZVZLYOVCEqfBtrBJXS03NZkaHgJQNB7UnO66yZUvcqsZd0c
	 hp/FRTKgOQaFQGNUmXHZo8gv2sZ9Za8U34O57gdMAX0OwYmDsGhShQ9gojiKwN3f+H
	 ZWIXN4tzdkoug==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 526B717E0EF3;
	Thu, 09 Jul 2026 21:02:30 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id ABBA3480038; Thu, 09 Jul 2026 21:02:29 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 09 Jul 2026 21:02:30 +0200
Subject: [PATCH v11 07/36] phy: rockchip: usbdp: Keep clocks running on PHY
 re-init
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-rockchip-usbdp-cleanup-v11-7-a149ac60f76c@collabora.com>
References: <20260709-rockchip-usbdp-cleanup-v11-0-a149ac60f76c@collabora.com>
In-Reply-To: <20260709-rockchip-usbdp-cleanup-v11-0-a149ac60f76c@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1161;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=t8uTKCJDQbXM1zD6YGkoRMmsGqKnvfqXTlOk0PQD5EM=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpP8ESAPzuYOnZwp+4yqsd0Ziayk+CJYnYQp
 7mKkd4cOS/PGokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqT/BEAAoJENju1/PI
 O/qaidYQAI/oIPjfuO1Zci50lhT4+dQmW2c9KfXTrWTzULXtX73g9os/Ydr0DYWqL76h8YNznl4
 bEoXjD6NFMiG+TQ6V+soGZ2PMQS/W507xNW37/VAfFWGRLok5vArmyDqx95HZNU9UwFbGJzJXJE
 j7a8p93pV7bi3/cly9GAWKOyyl1g1uBVE4qXmjKDtXEvCalYaSUYI3R5/umMUXr04+IToXx/B7o
 0VeGnM7KYh4Sf5OMYIJLWxseGYjhzB8oBx5FXVFqTRT9JqO4aFOYX/9tmdlLpfQF3czccfRcX15
 vo9sU8muPlthF3Hq5g62Ah7kaFT8hbTkMDz1wz87KOI3CsMMEaEJ2WyAlrgai2gUrFtQWcuYUU1
 pJJayry1c+4A16+uLAJTD15qfWUp/f1OyCyoL+CbdvKW90EPDkhtHIuHXKgSkr3ThOqRaoM1o4h
 gWW6pl0R0s7UxunrFqvyhrEJZjOKJcxoSiVbz+U9DlFhGSRSh+NFvHS58G4NWgbKylzJdBdDph4
 lv1kEceVaA1Xrhb7uIDebFcKKhoBOQV48q3XgaZneYixU3Zm9sbVMYOAIwyiuui34v6kqkMByuD
 nEq4X+Md+bw/air1c4CFNt2R8w0SYRt5XlGsGgh7w44kg6/bN/YnDscdjLabznXgUnfUWwwfjpp
 O/UA12EstrxZoYsggOxckzg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

When a mode change is required rk_udphy_power_on() disables
the clocks and then calls rk_udphy_setup(), which then enables
all the clocks again before continuing with rk_udphy_init().

Considering that rk_udphy_init() does assert the reset lines,
re-enabling the clocks is just delaying things. Avoid it by
directly calling rk_udphy_init().

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 6cb9f6b4dbf6..e3f5a26c876a 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -987,8 +987,7 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 		if (udphy->mode == UDPHY_MODE_DP)
 			rk_udphy_u3_port_disable(udphy, true);
 
-		rk_udphy_disable(udphy);
-		ret = rk_udphy_setup(udphy);
+		ret = rk_udphy_init(udphy);
 		if (ret)
 			return ret;
 		udphy->mode_change = false;

-- 
2.53.0

