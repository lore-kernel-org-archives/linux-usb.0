Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CAD636A379;
	Fri, 10 Jul 2026 16:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783701982; cv=none; b=GpBXuQWrBkX245kX1hxUHaBSURcDuKah5sucajgXBRS8aNHY/OgmF8XXGbhhoDbd1tB8uE63IJdO0yLvxMz7oOZV+7IrwwiVV87zYkO5qNA/kGGP5K7WKfQPr9joPonX9+BXAI+sxjbheViu6LOsnyn8kKj3ZKyoKnF/aPQqlVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783701982; c=relaxed/simple;
	bh=ou2OeHe9NiTPGYgMcRzTUBwKmURTgL5/azZ1wBtlGvM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SddofXoHDNECcsdjIosIC5spTlK9Rl2Hk+797HRToCPLZr2kOXBqtgWgLnhxSDnbCJfVhlD0PXG/+FiAhb0DMSkz9Y849Lj9eBTapB4LePghVedKhLiSeEdVtsBVTFHr8F7FVyXuRYyxrA8AT5gdqtW+WgWoIqs6oS51GUSLdjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Z9/lgldW; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Z9/lgldW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783701978;
	bh=ou2OeHe9NiTPGYgMcRzTUBwKmURTgL5/azZ1wBtlGvM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Z9/lgldW1p/torIfO3+0J7K5SE7Px5YDPwEuMuUqbjYAZzc9N7qCZmS8LqapBK2QV
	 WlPAwUMWx6EEZuJmTnnNJdo+eB3Mb29MQtZ1QTZPEAsjFZWm7w90aaCjt6BjNGwAiW
	 BGaNzkDa4AlB6U9LmgjkvBhRNm7PJePBV7A7rKLLmnavF0H9I0rUgOYK6rTU/wMa7E
	 Z4BPFaHRELtG4haE9EuLaQv1Ff9aIRJsy4YZXuR8zgl0SLjBVZzgrs/oI6ZjBLxNE3
	 S5CwAwEc0mlONyWXiamHsZ3PcoL5rTWDd26pELCCNbL+UgKR33Ee04Zb0qPWWkb7sR
	 PVOk3F/knagtg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2AA3C17E0EA6;
	Fri, 10 Jul 2026 18:46:18 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id DF44248002F; Fri, 10 Jul 2026 18:46:17 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 10 Jul 2026 18:44:41 +0200
Subject: [PATCH v12 03/36] phy: rockchip: usbdp: Do not lose USB3 PHY
 status
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-rockchip-usbdp-cleanup-v12-3-8b41a9a9bef0@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1409;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=ou2OeHe9NiTPGYgMcRzTUBwKmURTgL5/azZ1wBtlGvM=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpRIdgT4M5ecjWoo9i4FR9rI2qvhAlHpQ8ej
 pRJGRn/KQ+JrIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqUSHYAAoJENju1/PI
 O/qaL6IP/3NBH0E5hs6z3K/Y0L4JnphZO8K1ayvhrcKZi9bmum93d+iJwJHKF1+Tp5WTQxHn1ON
 nzZ+WbWi2ZItdAms5R6mE1k1+fkaK6N1VwaLl50KeefC9oHSxxbombhkVOBNmSgYSM00jXJL1N2
 YTDL5421gLW6E5jLXt6/rDLtDbecmGayYRsVKAqz5POE5MKeTKf3asC9lZfND2b7D4VtH/ut/07
 wJgIBBspErHRGub6coWLLz61eurp5Gb5/HzpEM3GIm2+VPrDUVpQzZuCUrxJTNDsN9+HVO/+Agw
 6SBmcQh0ItYcMd4iM8a6NAK+0BkOucayNENTAY3fS7naKMzPt2jGNN6P4dHJlDhiZBvKyuf66ib
 BgySUYlltC92bpz6Qh41a0sWg8D6lA2ckCJOdiM49HFyXWHvUjsfx2J5Gbcnqj7VjAMngQ0jWK9
 XL6XzlS8le4hb2LluTzLtIbYlWCvmPgIv3+UWRYJ+7sxMcRXgiH9DXDVWM6FbxHU0PSMLn+PHLO
 rWtho30nM7FWmzDTYaVQD39leq9N/c2rFPIIRT0CVOvcUmjQ8+2U2A0U0+eGF1VgmpNAu5f5Fdc
 9jYwhTjAmEXmP88+kqxOu3+MP7MzImDKTRTOwr1Iu7I7wbC4ERrVj7tBIUy0e9t79NjrUmPDYZK
 vIDAyuiff8QfNgHtG5Sc0CQ==
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

