Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D3830F92E;
	Fri,  3 Jul 2026 18:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783102416; cv=none; b=Eyn0aOLhD53NTzGVlF6L2vTpbGRpO3ex0vA59RD+nyDxVg9GYNGIW8ZkrjXWzSV5qjEWeAGVxT/hspKbm0tqFQqDseDDcSPJaaEmFEXQ8AL7owc6rXv3w/gQHmRWV8VQpYtNOL7CqDEXzV9QFmb8G7uswzdJMh3fVTbNYlO3lfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783102416; c=relaxed/simple;
	bh=ou2OeHe9NiTPGYgMcRzTUBwKmURTgL5/azZ1wBtlGvM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WexmY6yybRA0WHpXiDb97FXsI4j7sU79+XvpzHUbnFgrCVggh9dYB72r3aHKp0vSyAr271viyKPsPlQMPT70378Jg5mun2xVp5aUeWeUsFGXvu4FaEdm8gejihSBN5dpMo73BAmNUSs/Sx5jHSIo6ji3db4r0l8g6gpTG8U0NX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=MH07THUh; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="MH07THUh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783102413;
	bh=ou2OeHe9NiTPGYgMcRzTUBwKmURTgL5/azZ1wBtlGvM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MH07THUhUs7SvDVQHOL3pFfgOkOEbcqChlo6RygIxx8ot0zOmK3q2VRYJHXPwAMNb
	 XGHY/kMscTUwCN2KzwcbJrekgghosDEDBoZ1/i7wzgdlKt2beIAq3adIFzXTnD2tVt
	 zOfXsQ1PcjJLpb9xigGHNiZciK+WCE7J5z91iqzMHFhlo8oeEN3L+W8GS1/rdCNV75
	 yyTgfnHd/AAJ+6MVuHTHhOg4gbA8uuTxTLx3p+KqSq8iv/PyGbscTgXT07Zsj3aoKF
	 /8SlgutXOn3Gt9nHk9yTUf95RE/pQaIJSgwCMwoykU4DobUxVnIJZbz5nimLkVD2rk
	 SsGZXShJwobFw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C579517E1006;
	Fri,  3 Jul 2026 20:13:32 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 7D50648002F; Fri, 03 Jul 2026 20:13:32 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 03 Jul 2026 20:13:19 +0200
Subject: [PATCH v10 03/36] phy: rockchip: usbdp: Do not lose USB3 PHY
 status
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-rockchip-usbdp-cleanup-v10-3-a392711ca8a9@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1409;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=ou2OeHe9NiTPGYgMcRzTUBwKmURTgL5/azZ1wBtlGvM=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpH+8t/DdYlmTMIp6xxMySosmRXJYiswxuj2
 Zj8ckaWM3uTsIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqR/vLAAoJENju1/PI
 O/qaL+oP/jmlJP3yOdSPrKrMnR2aBkqYZa0FdQEU8gxCJLy7T8BQT11561d8QJejZymgSmtCBHV
 hRJMbJUdTUN0L7Bg88uRK+vhgX6JXljF/qCElguVc9wgksg5lTpFL4ys/PFrIi7RNZTpuS4/SUA
 PEZqcyI5W3g2yq/hPeJngTeqgZbb5pn7JtWFFyBTN1d5EaXwjT0V1uxlBA2Y00WjdA9pJ+57uM+
 gdPZXZx4FUrqgiS1fCGeUpG/MyjzIeZyh3mUSmFmwbaIkuPXyfXKh0Ydl1nPvhHdvTsBe4S4m7h
 XCdMXhac+juNcRQ9us7a/C+SHQIPpvcPnY8JjyniXXYRhOdCi7IDKsqRrwt9vJ/zG3c0R/l3pp5
 b+sWCvHtTlU64jA11U2YHmiduGVx6xlvNYf+UTnGJKP/GW2KO9y0zH/EKuLDP7pc6OKSCyjuZct
 Tn8q4Kdg2/G9GDHDf/YyxhpC2+BOrk3tx3J6UvEJC1bGKjmtaxicdC5X7U2Op3RgfgzeT+Na20Z
 q9cjDPxLLAIAmFTQ9bNUd8h0AD4F0JPkJCwkdygl8Y8iulSuG0H4CdB+swJ/vuegYPeyDMcjP0m
 nwuyE5WB/4PS5j1j6NPL/OXucM66npC0CkniuWHIdMGyNb9uWtBJCs1NJdxxbzLC9LVDRaeYh60
 xmlx+D+fromNlF68pDVos8Q==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

By default (i.e. without manually enabling runtime PM) DWC3 requests the
USB3 PHY once and keeps it enabled all the time. When DisplayPort is
being requested later on, a mode change is needed. This re-initializes
the PHY. During re-initialization the status variable has incorrectly
been cleared, which means the tracking information for USB3 is lost.

This is not an immediate problem, since the DP side keeps the PHY
enabled. But once DP is toggled off, the whole PHY will be disabled.
This is a problem, because the USB side still needs it powered.

Fix things by not clearing the status flags.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index a5ffdf7a6e76..12dfdd470a78 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1008,7 +1008,6 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 			rk_udphy_u3_port_disable(udphy, false);
 		udphy->mode_change = false;
 	} else if (udphy->mode_change) {
-		udphy->status = UDPHY_MODE_NONE;
 		if (udphy->mode == UDPHY_MODE_DP)
 			rk_udphy_u3_port_disable(udphy, true);
 

-- 
2.53.0

