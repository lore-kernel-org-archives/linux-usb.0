Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D8343CEF6;
	Thu, 13 Aug 2026 20:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786654675; cv=none; b=LljjAUFklUw8KMyNCojlNzfNv7FI9wq/8UuyJULak7b0CXgkwPkYZEXQQxPdtEvunZoDAhJRSloCwKQWAYirTStltL56dVHds7+KCHFmdy+4jh+xPsNheuB21XnGAPT2V4PeO7CGM263WlOOwGlEjnu6xhUsZnNJ9dsyxrSBQG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786654675; c=relaxed/simple;
	bh=xcKpKD5O/kkk/DdwRv8U2NfIFv9iJTg5yazZrxLkzIk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gew0ZJ38N9Uik/xzWXtlXA3UHvb+QvOMNJg1y6Fcfh/Uus2u8sPF1DsvkTZ86oB+6Tq1+qzzKCfBmY3CY3cbGySUJYFHvscxTDhxVpIQ9HIhdXAiYBnu/JtbZDY3Yvk/7iTVTxEBVj14loIkAgVcaT7TMwCdLrH/Qkvb5LRfXzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=NKl+WI4R; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="NKl+WI4R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786654669;
	bh=xcKpKD5O/kkk/DdwRv8U2NfIFv9iJTg5yazZrxLkzIk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NKl+WI4RxGulk+AqiNq7YSai2phhHL3CaMARcI9pXX8ORp80Zzd8v+YqwiRAndi0u
	 zJM6VH4Bh2DnJXjJZ/nT/SaZKe36M14gd+EvKpAVrR2btpsTcLNQxCi4y107GYKC5q
	 v8pkvgm0JhAnevzHSzoXPwemnUzjUqmbWT5I/kgy6cZf3rXV+QHSX6GsWtuEAFmYdJ
	 DtEx0/1GIWRhKf6pAzVWnYLRSdmGGvxxl70WigEVAtsSsH5LrF9TGtXtbIxAPEGWQO
	 UBWvj1Y5uLBMzi4swFUbqU2xjQgUdboB63hhoNuz7o8PhP1ddHq9Y7scHDbD6R9R3a
	 rNyy+7TVLPJ4g==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E9BF517E12AE;
	Thu, 13 Aug 2026 22:57:48 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id B962E48006A; Thu, 13 Aug 2026 22:51:49 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 13 Aug 2026 22:52:07 +0200
Subject: [PATCH v14 24/38] phy: rockchip: usbdp: Add some extra debug
 messages
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-rockchip-usbdp-cleanup-v14-24-b5ad9c68fa11@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3301;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=xcKpKD5O/kkk/DdwRv8U2NfIFv9iJTg5yazZrxLkzIk=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGp+LmU2IO6IVhvmwkL2c+dEjkD2Mb6ivJOn2
 iT6iiNCPnqadokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqfi5lAAoJENju1/PI
 O/qadrkP/3goplmXpxq2uEL1kizMtzwPArCpJzxXfdyGd+0d+PwrJYenuGdWduZknsNlGnnAP5m
 ozVcIzVj1KaH+Hc5lU/WZRzw9xsAOgbAEWkEoh8IYlZBTx6H5KQEmBeOq7MrklleUNdn1fIj6KX
 yTRY1nh2PkOtGiKAwx1d7nIKt0sPqTkPiDLHT4xWNQXenbtfeutUB925AM2CZnPxql9OXyAT6/Q
 f7FEp7H784aJmP9Bn55pfmP0EC4PJSqGNrlmXlDlomX+61s1C3mcQRBLrATtol2hF+7drHUjg1W
 VSQ87eClrqez5jy/1SLEtCMPTVbFWinI3qtV+74Q771m6QA6cDI+2cjvokj4zF0mu8Ylcj9stWk
 +PtpcuAyKAGv2xgaGvqnqkTyZnevLeaaXt1Z78igg3OWjf5EBXL9I5pE2hY5MeqR/So611MKLSB
 rIk7/a9UIRB4aKkz4hGJ2zahNY+ejU5I0WxTx7xmm+e0gTrTOK2u23niLRFvKVIawD6WNWWNPK1
 HBIp6FTHtFLua5y6FIUR3ihzLI47xPrSmPzLZhulKm/OEbBYjz5I8Z2z5171nJxHX5YSr4Uq4Hi
 4dOlzCyIvopYM4jLN+RN213HBOonOYTteIWBsSmyh0gMZOZf4KtLGF+tWcBf5ijqm0jIdkjf3mI
 PGMgS3jRAXn+i+VS9HY86eA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

It's useful to log PHY reinit to ease debugging issues around
USB-C hotplugging.

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index b40b5d9ce587..e67c1df792ed 100644
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
@@ -1308,8 +1323,12 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
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

