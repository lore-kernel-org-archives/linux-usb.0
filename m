Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B9331353C;
	Fri,  3 Jul 2026 18:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783102416; cv=none; b=ihxG+EEqcfztTwG1lIqKxTpewIwm6pL0jLw8DhcRjV1+hVCBaxyWd/d24SAZT0BAYMQVHd5T2zzsREeRNKpE4pQyRB4Ngxw/jH44XgjHNVfiXEGayN/ZOhYF+COs/gteU5za+y23jsfMYIKWjUsbBpRaSREMw4lxvsY7m7i9FZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783102416; c=relaxed/simple;
	bh=USg1ohYmbXwetA6mCilQyNqt0XA2ZTz/AW7yPMSqQVI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QlynU+t2HB7+9efrlhFxBRxgDMhdZtAMHlL2JxNNnXQVyaUUmNrbK9Ep9T2wGGMECKeEDMOFTZqtx/MO3QWDBm1wTZemBIsWgmdt8YRUD97tnxiqirymKaokhCgFFCS54I3ZmoAEG39tfXQau3OzT9ZQK9izGeydbI7VsgElR1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=a+Tjj1JO; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="a+Tjj1JO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783102413;
	bh=USg1ohYmbXwetA6mCilQyNqt0XA2ZTz/AW7yPMSqQVI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=a+Tjj1JOhkS1SP06o67qUqW+/N9xo+YsngWvpxc4ANUOI4Y0aCjwH+CL5+mnrQQPD
	 mm2KGD0AKizAc4GO6roGlJJLQp7y5XLB7w99fcZzLjYapAEyrg6b7HvfcWhBBRfLmm
	 y8vbWefjK0EENm0an0RO0Nx2y3wBgUECQhiEfrHBw7xsmr8YsCq352rZ54uwtasV1z
	 Ptrodkgw92g3Bh8Bbb1E5oB3iLqjRSns4VWWqpF7WXbxhbGPPNMb5Mm8+CVBP9+KmE
	 E1k7uQWpXPSVEo2siyo/1jcKpfccRK6R2S7ElUKIp30Ji3wl9QMW+9amtHTcuXggpj
	 nif5877C95OfQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C6B2317E1064;
	Fri,  3 Jul 2026 20:13:32 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 7B92748002C; Fri, 03 Jul 2026 20:13:32 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 03 Jul 2026 20:13:18 +0200
Subject: [PATCH v10 02/36] phy: rockchip: usbdp: Update mode_change after
 error handling
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-rockchip-usbdp-cleanup-v10-2-a392711ca8a9@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1789;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=USg1ohYmbXwetA6mCilQyNqt0XA2ZTz/AW7yPMSqQVI=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpH+8vw8gna8E3Ybk8eZzBWzsUkWoKcXF63v
 2qEjJxK9utrTYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqR/vLAAoJENju1/PI
 O/qaLVIP/17CJZO4XFNTu0cm1TlU8yGR0hfWhC+FnKzJ0eSsOCpMF8k3qEpiB8F3wDlpyUMpi78
 xqv3z/SnUvSAZU57zGP2wVBWdC/XsVZo4Oyr6u/GSFo6FPS/udx+pbKCFwn9NKX0+fyij4rPqRQ
 S2hAIIeWG8TkKXlYNumJn8OtZzXOCIGFUD2cws0XMnPjkb3hUk32M/pqG8OaAMQidWDv3X5ymvU
 5l+XX5zFcLgdOi+dxsjS0bDdJtqJobf7Mw5x1hbeZLuxtYVy8+WV3cu6OS89iUBwhbqEi433/Qb
 kStS4CCJw/WkoQ7BWFOa1mJ2hcbr3jttBHu6nGOwT5IDF30Mc6NS+WD83mtuO521ef/16O7TQq8
 W6EYsM/wTVx90uf/ucbRRJda38d1V+jiz2itavWdXndDhqA75pGetvDk2u1AWU8EZJ+NEdhJlvx
 qFHrngXFFBha0oseEtkGFuOjwAA+hxmVN2bnLz/jFnCrgLhM+CPONiSxPkvXMzsYR8Seiizmx0N
 2TxtJfRukWE5CzRAm6hiBMIhjXxidxg6MuA/H/uPoVlQdQLzcNInnXtzf/oebpYSS03wn9fGwmU
 JnhznApnPRChJtoQ5YTV8V1houkaMmdBVoQEdWUQFRE/Y/I9rR9yFcZI9YhhVJjNg5uvkvv9q7O
 M6yIsYAMLiUwinhtzdtUuVA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

If rk_udphy_init() or rk_udphy_setup() fails, the reinit will not be
tried again. Fix this by only updating the variable after all potential
errors have been handled.

Note, that no errors have been seen on real hardware and failures would
most likely be fatal and require at least a full reboot as the function
already asserts the PHY reset lines. So this is more of a theoretical
issue.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-phy/20260612163835.8D5471F000E9@smtp.kernel.org/
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index fba35510d88c..a5ffdf7a6e76 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1000,15 +1000,14 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 	}
 
 	if (udphy->status == UDPHY_MODE_NONE) {
-		udphy->mode_change = false;
 		ret = rk_udphy_setup(udphy);
 		if (ret)
 			return ret;
 
 		if (udphy->mode & UDPHY_MODE_USB)
 			rk_udphy_u3_port_disable(udphy, false);
-	} else if (udphy->mode_change) {
 		udphy->mode_change = false;
+	} else if (udphy->mode_change) {
 		udphy->status = UDPHY_MODE_NONE;
 		if (udphy->mode == UDPHY_MODE_DP)
 			rk_udphy_u3_port_disable(udphy, true);
@@ -1017,6 +1016,7 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 		ret = rk_udphy_setup(udphy);
 		if (ret)
 			return ret;
+		udphy->mode_change = false;
 	}
 
 	udphy->status |= mode;

-- 
2.53.0

