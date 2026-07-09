Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3A33BED19;
	Thu,  9 Jul 2026 19:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783623886; cv=none; b=Tpj9LbkqGRHlpsMK3BObQNyOn/CobGDLh174OPk6DLSnJNt6NRhcb90Zc5nIxJ7vGcwh0fKpmdOkZY4Xcy8a44dpJPc//vHwGQNr2zQUz4ZQ4dsr4ah2fL1Aw7EHH5ZmIFBSynVdYru450rzV/E3Q4+cvWQXSAbOPoN9dYdR6tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783623886; c=relaxed/simple;
	bh=KsztTcLL1hh9As65BcDTh5Y7TjOnYb7YivozEbWiMmA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R0LaoZNDKDOjr53xPc7SsUp4qGxneySvwDcfAJ/+bwd90SzXr+t+bayKV7NLhweJXiq0ys3cWddY0HzFGKLrExAnkheEGuo/CAHNDzpY6x1lz1UExG7yBQ+rqwQOtTjqgF9c5mEyBnxuMOmg6QKi0jW04YyOpYO9f43izYA3NEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Dxx27Iol; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Dxx27Iol"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783623874;
	bh=KsztTcLL1hh9As65BcDTh5Y7TjOnYb7YivozEbWiMmA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Dxx27Iolq3cMsTgCvVA+sU8YHFz+IW8Jar13MKrOIHvxG7CalyS7eM4q8CdvwPa+8
	 2C/p2Zqmh3ZYzLfhReOUZz/x2i/VOatnFL+hpzQWLTtDvnIe676vs1TH7GLuJhjc7c
	 xpHmUUfRsoBjAGYKt7PBerKOuCGLH+0KGqlZbbbv/FsZpvgFQo1C238GYwhTMdeb6N
	 oZ1bHj4q4lh5c3tfjyZzSp1EAfWBPpsBrjOMGcO88KkOBtBwF5jaYqKukn5ncdqhq2
	 bZJ812GjSIOIyoAIzR05MPXXegLJM0jPfObHk4jeelHdq0cYOoS5jdSRSqmOagG8Uj
	 i59gwvC2o4qsg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BCFE917E0FAB;
	Thu, 09 Jul 2026 21:04:34 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id BD190480064; Thu, 09 Jul 2026 21:02:29 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 09 Jul 2026 21:02:41 +0200
Subject: [PATCH v11 18/36] phy: rockchip: usbdp: Rename mode_change to
 phy_needs_reinit
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-rockchip-usbdp-cleanup-v11-18-a149ac60f76c@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1831;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=KsztTcLL1hh9As65BcDTh5Y7TjOnYb7YivozEbWiMmA=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpP8EScRnyg21rvU0ThOg15HDFKRktnoBPH1
 ERZxXTcc5j8ZYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqT/BEAAoJENju1/PI
 O/qa90kQAJPG/RiVvxvDv6FpCXQnbuMEOMQzA/IhDZeKMt3lxvMSTDJmcG7KswbaC5pJkV0jLkw
 Il0JzebJK6wuvfLZBmYUpdJEdcRl+lg5G1BdapIoPteJ/G7sHtTBt64sODn4Co4IIs+QK0XxlIV
 80SvHw+0kc4x8QEUWmaiCDYSrwIKjzasu2VFXIRhvNJTITFqRwE+gN7PkeaIJ9FJ9fPcNWbqePi
 S/j60jmkYdVLhmgJEXvPhkvMnc2wPsGV1T4TwgZQMpxe5KEru9Ph+nG77c89mGHQCtaXfrktxgx
 3hQ1sGsG1pqrw3vYfLPy7Y/XthzWMkuhSK3Dl5+R6hyY5Stv/+oP2CbQYemVmXdNpnLe67U29RI
 t19yeX5X8UV0oo8NTvQZVBisfxBAvT28ugi35m9UMCmhsvF5r21E4gtpqqlRT6EKpcpUGPJKml0
 IwxuraeLHOUFVtz/f7nucYlwrpzQdPlyTs1hqCOqPbKK7QEsFI996V4h53UXJ0FUpJgGf556sN5
 /kqR1kvxBcvrO/DpTyPOjTp10usBBJy2xPJF3dZeW063rygMzQqH1VzZkbJVIt/1aF+XdFyKoPP
 kylSQxYG08vzYCZak8ISItUHXHOCo5te9njOdAvG+zz/iJfXHKE1yGDpKAo0dtDigfBBMG0lOPX
 hpw2QkSdkvAEL6iuKaeQjqQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Right now the mode_change property is set whenever the mode changes
between USB-only, DP-only and USB-DP. It is needed, because on any
mode change the PHY needs to be re-initialized. Apparently at least
DP also requires a re-init when the cable orientation is changed,
which is currently not being done (except when the orientation switch
also involves a mode change). Prepare for this by renaming mode_change
to phy_needs_reinit.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 24108816e3b9..e44d19c9d119 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -171,7 +171,7 @@ struct rk_udphy {
 
 	/* PHY status management */
 	bool flip;
-	bool mode_change;
+	bool phy_needs_reinit;
 	u8 mode;
 	u8 status;
 
@@ -578,7 +578,7 @@ static void rk_udphy_mode_set(struct rk_udphy *udphy, u8 mode)
 	if (udphy->mode == mode)
 		return;
 
-	udphy->mode_change = true;
+	udphy->phy_needs_reinit = true;
 	udphy->mode = mode;
 }
 
@@ -951,15 +951,15 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 
 		if (udphy->mode & UDPHY_MODE_USB)
 			rk_udphy_u3_port_disable(udphy, false);
-		udphy->mode_change = false;
-	} else if (udphy->mode_change) {
+		udphy->phy_needs_reinit = false;
+	} else if (udphy->phy_needs_reinit) {
 		if (udphy->mode == UDPHY_MODE_DP)
 			rk_udphy_u3_port_disable(udphy, true);
 
 		ret = rk_udphy_init(udphy);
 		if (ret)
 			return ret;
-		udphy->mode_change = false;
+		udphy->phy_needs_reinit = false;
 	}
 
 	udphy->status |= mode;

-- 
2.53.0

