Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1CB323417;
	Fri,  3 Jul 2026 18:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783102419; cv=none; b=CjStSUrBlLcJcB/2ygr2XQB9HjYJT9uCxtiZByFNb++HCGQpDCYL0rLPo8MgFv+PU5cm5kR/bmxxvPEO3rfobvcCCbipWSjarAQwaV/+eJwe2emfLPQ3HAFinIHO/7IIU8oTw1sJfF/EdNgb+w2spSdZrTB3lpLEhWuW/Q4s7OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783102419; c=relaxed/simple;
	bh=t8uTKCJDQbXM1zD6YGkoRMmsGqKnvfqXTlOk0PQD5EM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ccFNMPWC/B7PKyRgHpdrKqJPaQQGqbzYazjaN87mDo0xcol43nENPIfNpmn1uxXkna56a8224D3XRBKSE+zJEdgHP149yrVAFsD2CVcmQqvE4URyj4u7FRklnfRclfrJSOC3UUOxUsGqQneLD4Vi5D9PjajcZZqRjeCRQw9LRds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=TrwIjp6e; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="TrwIjp6e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783102413;
	bh=t8uTKCJDQbXM1zD6YGkoRMmsGqKnvfqXTlOk0PQD5EM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TrwIjp6e8ewTNnWYAeW74BMHtw/fiMm0mHr/UlW9PG1puYmmRyBv7PybG7uElqhW+
	 EjpWg5qrcMpJk3vpqjmG1WfTV9SY9f6DBFB47dn1L6DY11s23uU+qiXgGBhIhDB6up
	 XFhWlAOYuODDjncSZbGSs/tyr8yyTxTWHhFw8I0GYMl9t43rKqPTpwhWIYk0h1ngUs
	 etZl0vtm3BNhMC9UA/qhVCgPl+xkPuhLeq076KaDgv9VB9YmNqxZYRHznD7qK7FY3n
	 WpAPBGD3VvmBaO5g5d2UJA2xiwzYVURpfIK3XxK4iY3w5mpcoQb4LRY1Skut1rvJ+u
	 KYQFn1kN/ZVkQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2BF8F17E124A;
	Fri,  3 Jul 2026 20:13:33 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 83565480038; Fri, 03 Jul 2026 20:13:32 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 03 Jul 2026 20:13:23 +0200
Subject: [PATCH v10 07/36] phy: rockchip: usbdp: Keep clocks running on PHY
 re-init
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-rockchip-usbdp-cleanup-v10-7-a392711ca8a9@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1161;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=t8uTKCJDQbXM1zD6YGkoRMmsGqKnvfqXTlOk0PQD5EM=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpH+8umF9Ty1h+4p3MPTMXjtXp3G+iRftryS
 2d3WQoPWCbk94kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqR/vLAAoJENju1/PI
 O/qaOz8P/03vMWvvLFI9YSgDBIYI00F3z8lA+NP1zyhxQR3KyE5tfIp664CjzkC6MYkQ7Fu8y+4
 NM14B3mtQxMWmPQfU71JZn56mB1/HFMLQF85N9FDsLCS3jQThKrkH8oBSo9t0MxHkel+tZImKam
 TCiII3eZFGvMTCYIMHiilTeoL+bibIBmmderD9R9+9EuYUR1YSvlLDADfyLmdbgM6S3p32lwoxP
 JO3bo27q9drons08c8OdLwyP8TW8/X7VCOKI6bj5mN0ksev9WPTHNQ4QzO8fqXzJ783zQkJai4I
 Nmr3LfGqaEZMEIJfAZ4IS6dQjWUfAsHZjSCc0xdlxDNg094OxCsoIvlLsS/TGetmB2nC4BvX+Vp
 2kKaZ3WZK9Mv09irdBVFo6w00bydDzdQXMQoG6C96nvJao6fhmv+g6z7r12kig11/WgjiJsPB8d
 4qKnm5z+brJqaP7XWKofFqk6BsZObVrvrOxCDPPiqIT/HMAVeV92+hMt5ZMvy30XP5nlnNBA6+6
 QHS6PaXCSz9MkfgcO011QKmD3YgAxUDDDh+BQ7/GbRDAS/LFdA5CMaWIQA2CowcDPbcc8ILe+ON
 0DVZQhTu9VaDBNGH4BTPDxugrB09F/Y4UZnXOi5KBfoOySG/MQhl112ZH10Q5pqA1JYI2/3FCix
 +XPYQP1xbq43hLAgVaxMqyA==
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

