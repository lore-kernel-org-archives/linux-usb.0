Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900DB34165B;
	Fri,  3 Jul 2026 18:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783102425; cv=none; b=LiBnSqgmCm/HXNcZ4cicC3R2GIwousWExUZ8utV00zJWg4x0ENsC1Q6G7VYikztktYmOkBtsSNJqw6yc/dqAYrDqaWk/DSJ0jP4O0z1Uo+KV2lY+gHBhMkgHOZMPQkEoHGRZXchTzpC9th5RAPIA2h6RCMlPSFiVyL36y+lk4GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783102425; c=relaxed/simple;
	bh=1EpS3VBx4qH9faH0FA9d8/B9FiHgliXdwRmJBhi8wWg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YBq3gueiB8uBcXsKu5ZFIIKL2U7TVRWHrFT+XogPZ2fjUpoVYWrDaBnbDIJoaW5jpZFm/oZREd8ZfsbpXkcvzahH+dyN3Z6ZWBrFELR4hPobjFYBRZaqexQfmvrt1uTrrz7b2hF/7MuV1zGLlYz/KzgHn+qAPIES9vPdSfw/SoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=eGDHRS31; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="eGDHRS31"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783102414;
	bh=1EpS3VBx4qH9faH0FA9d8/B9FiHgliXdwRmJBhi8wWg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eGDHRS31iAsD/jqfMwS5QmTwcfXZyMptL+16YgMbwmZK1qIj2+iizfvaxlfWJ3OW3
	 3rCL3WAM2Fd8mg6+r+G3/JCdekcp2xZIO7CXQ5bY5zUA1LzJH/8VpcVL4pKQjEl5ot
	 mAIjmPYKMgQXY+TcYD3/4BgP466w5YfWaph3UDpGdBsqpO1a9V2NDjukNtLHOrHtUt
	 sVzrZRDsbF0s/d/xa6mUUdhEbUn/gev7b3ouuGAnlywI7Irbf1yBhkkSlQo0R4CiMZ
	 6deuZ+EqdnGRos4rBinER0ie7RIBBszMB3mvS+1GifUqHScMr/DmNtmn40Z/urRnmN
	 Aw7WMx40mA7Nw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BDE3E17E1534;
	Fri,  3 Jul 2026 20:13:33 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 9F30448006B; Fri, 03 Jul 2026 20:13:32 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 03 Jul 2026 20:13:41 +0200
Subject: [PATCH v10 25/36] phy: rockchip: usbdp: Add some extra debug
 messages
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-rockchip-usbdp-cleanup-v10-25-a392711ca8a9@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3232;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=1EpS3VBx4qH9faH0FA9d8/B9FiHgliXdwRmJBhi8wWg=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpH+8zN4K70HPKMcZq3UnRt+C18k7d8Aeokp
 W6oxr9jj3E/vYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqR/vMAAoJENju1/PI
 O/qajP8P/RFt4GmdM26gZnZR2rYQF37Znv5WYaI5YMzs0Ru/BQRNhdBXVraZEJl1qXrkLC5A//M
 7BJA51CZtSLoG1lQNdu36J+Y9W0swgoa6dw4mPInamXacsUUAymQ0dvZcuw2ySEy/Yvr8+bU/41
 rPHmyTX2vF9DTAVGjGUbJGwPoSXBpImwReS0pAWkeoo2xBHB6SygU+41HGvX2av0b1e/rNWSywZ
 5Abbddhts746WiwQoJSIlBr4/DQaJtG9hyp/vWVZTtXAJTlJcTzANEVjdRX54vm42P4N5BOFv6K
 8PINYykCxes1Dup/q0dd+yjcI6G7rts7fKxKVJ6aPvmkRL1w8wN+rnS9o+bq8nA1O+iODXrlzGI
 P02Fr27nPzTKGscp0yRL15jieo9jSNDLhHjxCWxzVaOCS9RkrFZDjBY3cIpKUv2O4/JoabDl9Q0
 0jZOJWY1n9FMmP07BucVgUwiehJnhjvzhEt6Yr3Lsiz4haD3/i746y5mVIMJLNr80gcWTEp0shx
 +Pv1ufdDd6pvf8Vvtx1lZOH8UFfgqtS8rvNk4TLb9n4bt/S0ScrBfMYBHBU60ZY3VkzK7ThzckO
 fowqFs7phj0L06y7fg3b1KWDg/EV48el9Rb8dr0HXiqy0mYZ81/7Z0EpqOZf8NCucCIjGCTQzcs
 icITB4Pnt5q1umLCkySs/hg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

It's useful to log PHY reinit to ease debugging issues around
USB-C hotplugging.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index cd79c5da566a..edee27933d89 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -24,6 +24,7 @@
 #include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
+#include <linux/string_choices.h>
 #include <linux/usb/ch9.h>
 #include <linux/usb/typec_dp.h>
 #include <linux/usb/typec_mux.h>
@@ -462,6 +463,8 @@ static int rk_udphy_reset_deassert(struct rk_udphy *udphy, char *name)
 			return reset_control_deassert(list[idx].rstc);
 	}
 
+	dev_err(udphy->dev, "failed to de-assert missing reset line: %s\n", name);
+
 	return -EINVAL;
 }
 
@@ -488,6 +491,8 @@ static void rk_udphy_u3_port_disable(struct rk_udphy *udphy, u8 disable)
 	const struct rk_udphy_cfg *cfg = udphy->cfgs;
 	const struct rk_udphy_grf_reg *preg;
 
+	dev_dbg(udphy->dev, "USB3 port %s\n", str_on_off(!disable));
+
 	preg = udphy->id ? &cfg->grfcfg.usb3otg1_cfg : &cfg->grfcfg.usb3otg0_cfg;
 	rk_udphy_grfreg_write(udphy->usbgrf, preg, disable);
 }
@@ -662,8 +667,10 @@ static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
 		return 0;
 	}
 
-	if (udphy->flip != flipped)
+	if (udphy->flip != flipped) {
+		dev_dbg(udphy->dev, "cable orientation changed, PHY re-init required.\n");
 		udphy->phy_needs_reinit = true;
+	}
 
 	udphy->flip = flipped;
 	rk_udphy_set_typec_default_mapping(udphy);
@@ -781,6 +788,11 @@ static int rk_udphy_init(struct rk_udphy *udphy)
 	const struct rk_udphy_cfg *cfg = udphy->cfgs;
 	int ret;
 
+	dev_dbg(udphy->dev, "reinit PHY with USB3=%s and DP=%s (%u lanes) flipped=%s\n",
+		str_on_off(udphy->mode & UDPHY_MODE_USB),
+		str_on_off(udphy->mode & UDPHY_MODE_DP),
+		udphy->dp_lanes, str_yes_no(udphy->flip));
+
 	rk_udphy_reset_assert_all(udphy);
 	usleep_range(10000, 11000);
 
@@ -851,6 +863,8 @@ static int rk_udphy_setup(struct rk_udphy *udphy)
 {
 	int ret;
 
+	dev_dbg(udphy->dev, "enable PHY\n");
+
 	ret = clk_bulk_prepare_enable(udphy->num_clks, udphy->clks);
 	if (ret) {
 		dev_err(udphy->dev, "failed to enable clk\n");
@@ -869,6 +883,7 @@ static int rk_udphy_setup(struct rk_udphy *udphy)
 
 static void rk_udphy_disable(struct rk_udphy *udphy)
 {
+	dev_dbg(udphy->dev, "disable PHY\n");
 	clk_bulk_disable_unprepare(udphy->num_clks, udphy->clks);
 	rk_udphy_reset_assert_all(udphy);
 }
@@ -1310,8 +1325,12 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 	struct rk_udphy *udphy = typec_mux_get_drvdata(mux);
 
 	/* Ignore mux events not involving USB or DP */
-	if (!rk_udphy_is_supported_mode(state))
+	if (!rk_udphy_is_supported_mode(state)) {
+		dev_dbg(udphy->dev, "ignore mux event with mode=%lu\n", state->mode);
 		return 0;
+	}
+
+	dev_dbg(udphy->dev, "new mode: %lu\n", state->mode);
 
 	guard(mutex)(&udphy->mutex);
 

-- 
2.53.0

