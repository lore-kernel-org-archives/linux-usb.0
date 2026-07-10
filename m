Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7E743F8B4;
	Fri, 10 Jul 2026 16:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783701999; cv=none; b=FlN6yKQ74955wQvFem00jnowo9ujN4xAyxpSo2sih9NC19mk7/YE/pNdUePUarjfYVLZwmByOHFyS158MCx8tyaQ1JeCx0GzDZp7kdjBwvpXSQrw2EGmCGLrjfbdF1gqGZFks0irMi7bfc5EZ+p2RZPC3uM+tCn6Losy1Z59wE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783701999; c=relaxed/simple;
	bh=1EpS3VBx4qH9faH0FA9d8/B9FiHgliXdwRmJBhi8wWg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W3bBfxH/mIMeF7BPvbsvad6gVvHi0mquYppdfcFCY1QXXxv7Izim7acrlqUgy+fq+jI6FeiPa1WOYgx/sJe6cnS7SSrLY0r6fDWAFHDgrgYSsI/oHefGIYXs2VkDjWMLBbnWwoGYyqFEFDg4xvUGK5XjgH8QS8Vh/lQ7eLmwwBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=VWFTQ/xs; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="VWFTQ/xs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783701979;
	bh=1EpS3VBx4qH9faH0FA9d8/B9FiHgliXdwRmJBhi8wWg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VWFTQ/xsZbKE64ED1G6SR58NwgmX1LF/ZreKTBeQeJOmNgK6sdtsBJP6Psub4o9/A
	 KQir3UbTgjjXhPZ+WLgLM5NAgjQ1hMc7LW5QbaJLBZo2acKYnt7ynAS0bPNwEBXZu3
	 SZGpnFsm4JarFBQkZeil7xotr+FfWvC1z4jJZiirg/LtK6rbzPTi89Zj/xqI2Fe0VW
	 bcHj4hsDrTbVuupyKYWxsZWrzmwTHqZ9tLwPUaSTslcG4kHR1mQbAL+E8cKHAdbVNc
	 R0lAQlZSAvyaiiNIPDWwwuRHyilW7Wt/gaGl+IUvvBiP/HQ4ymSbr1so7idcLHAGi+
	 t5OlpJlhWGXNQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 14AD317E1078;
	Fri, 10 Jul 2026 18:46:19 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 0D31148006B; Fri, 10 Jul 2026 18:46:18 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 10 Jul 2026 18:45:03 +0200
Subject: [PATCH v12 25/36] phy: rockchip: usbdp: Add some extra debug
 messages
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-rockchip-usbdp-cleanup-v12-25-8b41a9a9bef0@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3232;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=1EpS3VBx4qH9faH0FA9d8/B9FiHgliXdwRmJBhi8wWg=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpRIdlqnRV+IsDAf6xvarg8hGQOK2KftzJ7W
 GUkvUO7YlluTYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqUSHZAAoJENju1/PI
 O/qaI/UP/iLziTTNurHIqWA9Wb1mlq3j42vH0Iy83ORfb88bJLHWv32798MpCWFzYbk2lxypzib
 1b/NUxHvabkGOyB+09yyOV+l4ojuQ7UlR3rHrYo6GKeu/YiylurOt4uKBZFoW2xb3y/z//qvC8m
 EWWmPItimNwvoUVUFspcIgy8MecPwGwJovEShyxYm8+eTrU6uL92XaAkSyHwV6MZMPCbp9PjVkT
 kLJmyZlS1TXs+FjUn7akTTV8vnpLxhVc0E/q442+BKUsfuWvRRekxCePl2jRduF3pBxJ+xHWpqj
 cX0ULA3OYh83QY875YAIKnHxL5XEH9hTy3T2fO035A7cG0DRWqCpuTLxb+X5Gc7WUa3iAN61/NK
 L4XEeQNzI+XQ7fBo0G3PQePoKl2ZzzbyaVpp+1BOyLrp86478PrHfuMInY9Xt5Qm6Hj9FYfNJKH
 ijcdxFB0kCU6pQQCT7lma91J83iG/88SBRv6o+W79TskOUsR9TpIJ4/9739Yjm5jz87i0oBXnEL
 PtR0kQMFpsWM6aG1yzt9F9hyzxMQPAf7iXss8cMHO5QjED8CsgykvQb+ctDEf8xn7b6p38zSMwd
 Xo20c1nf9BhYEReMquFUDUHjvSesbmHTTGq3a6CaU2OFc3S9uFZ3rxyM8rE5n/SZ32L0OECVRV9
 HQuDlGYnFBq6gz9K+Ha86YA==
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

