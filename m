Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340B4435AAA;
	Thu, 13 Aug 2026 20:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786654319; cv=none; b=iTxPwCWpz8wCGHqu7zW6xX4IagizBj4VQT1yjYRgxGse3EM5fT+h1eJ7iwndHzNFzNbfeCwpXtk6/7xNatXbfi2Vz2kAiKrSTwTr7Q5J+qKTwxFhhMH7e+fcCewzemF1S+y6QegjRiZwcp0pJojqh8hHGVzHv5N4Kg0wtsI7p4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786654319; c=relaxed/simple;
	bh=hw0agan+IiLrDpOV8ggRNyXm+gjnSKp8t3sareWfBmE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=huRLFgCjDLUceinzLcq3X3Ci074le+PLgDbmyWzbcAQKsPsf9r0EOi38xmb8cw51+RRvZGlvGG1LNytHKgMlRmQElJtwWCshKhYZZjPlzofdbGGigv80dbbkHS6B/gDM9oik930Hs6WAG3+1sZcBslsYE+pjjxrNJh8AF0MKwPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=JuCnjHTG; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="JuCnjHTG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786654310;
	bh=hw0agan+IiLrDpOV8ggRNyXm+gjnSKp8t3sareWfBmE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JuCnjHTGN6A/PAMVKXwslf4ovX8FFmGFvPpg5wbZGeAc+GH6cuFxhQGu+Ktyvzssy
	 aRGUXWVB1HcC3YrzxXnuwLaP/MZaQGIt3FBIhsDSctLD5eRljCgnQxiuehf/CeC03e
	 Dk7LCDBlCjNh9VLqyijXwgGO39TYvyuFysN3iMl6+6Wr4eWq9uw7Um0kLwM8+O3u0w
	 ZOj/bY8vkP5ECQiTTc6Q+3VgRXftWTLKUi7F11LXSbgMfHm0/4civMPdBTezJSI76c
	 oYVp2jUV0VgfP+iXgcerT2pBU7BUYRCeoqA5q0NlVj7qfhi/3q5iLW2ug1fjmLaPgS
	 +1gl1ZIz/mjgA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3BB1217E10BC;
	Thu, 13 Aug 2026 22:51:50 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 9E619480038; Thu, 13 Aug 2026 22:51:49 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 13 Aug 2026 22:51:50 +0200
Subject: [PATCH v14 07/38] phy: rockchip: usbdp: Keep clocks running on PHY
 re-init
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-rockchip-usbdp-cleanup-v14-7-b5ad9c68fa11@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1230;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=hw0agan+IiLrDpOV8ggRNyXm+gjnSKp8t3sareWfBmE=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGp+LmTHcfv6fXnp0h3gay8iUSQ6Y3mf1LW4z
 WLmvu6eXxalfIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqfi5kAAoJENju1/PI
 O/qaorAP/2JffvyXa/6Zbqp6KDjzptf8OEUqYE4HCIU8qoze0iGQOUUMtj496Bp9Q3bS7dK76jb
 mulrumf3lorLZntmkWmiBywijvTPsqx1hiDQwvdC2g5RAbgAGTsaUGynLMKPK6S1NoIkf10nsZR
 X+NFHzeh3WnznRqlCdklkqbzgcWz6U4umefeHmfUyOocPmK8GWyJH0EMzkaQx5sTUkTc2wd7eOv
 xtzkrgjhfVpipi3VSg6Nqgkh09Qm9zh68ZWQNL8zSVJLDIeTmeUg0xsk1aPd7QBpttvZlDbhoNC
 hVee6ctha8JoUuftBgUiw8qta6Rxk6VbV8tNA2jINwPkUZffq6pj+qSTsxl3UR5n5mit4nAe29Z
 NBXwZSq8cDAZVsk2mSrwtDrPdnY+LgxFMFVsbVvu7KwX+aEY4QhLS+yWZ0//OyHTxflpWjLjoVI
 Hr/sCCYKKeMai0tp6tHuCJ7KRZyJ3/6qxH+9eT32sEgoY1LAkhPPpwnSCC+NwVcCNdur2IJ6hK6
 o2jZFdpCVlJX8gk+IstjNLFyVITEujaoC1qvUDUT6QZLYo1WRaTIyqMT30YnKYa2lqyE4TUkABd
 8s+bew6WA6ISVilkY/JKUYXS60mE6ryHlWqdrldUMZ1xz537preAJxNzVutx5xboD2zf7tg6gSJ
 iMyEAGriXGtO7nRIuapow/Q==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

When a mode change is required rk_udphy_power_on() disables
the clocks and then calls rk_udphy_setup(), which then enables
all the clocks again before continuing with rk_udphy_init().

Considering that rk_udphy_init() does assert the reset lines,
re-enabling the clocks is just delaying things. Avoid it by
directly calling rk_udphy_init().

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
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

