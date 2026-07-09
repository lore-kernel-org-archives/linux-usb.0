Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1DF33CB8F1;
	Thu,  9 Jul 2026 19:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783623763; cv=none; b=dJ+2dFnIML1BPyUrSqNVwggGKCyUduZDD/+k8SbXxlg8lz7T3TSkpWTa/6fP0fcyu9H4Bjv4YiNFLkT2pSNIH/1ubBqHsSBghBNRzuPfdV9gwy6CyiBCHjDO5qDJrHIiE7wAOm9gDZqW/rNTnKXQgtMi3GcBJ3/jmdpJfCunfH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783623763; c=relaxed/simple;
	bh=1EpS3VBx4qH9faH0FA9d8/B9FiHgliXdwRmJBhi8wWg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xg2Drr7ePg+QWbSGOGl7Ht9K5f+FZ8EaHSUm+c3FRNaBPHVEFMasEgunmCK30XrPnMSKjtxYWPKZbTlfN2D53X0RHFDBXR53GspV9g1HJBAsdC9Fpl8zyrF4PKv1Cr+cK/Yzf7YfoddRBgzD8H4OzARiP/M08gdJBbJU7H8GkNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=gdcMdst/; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="gdcMdst/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783623751;
	bh=1EpS3VBx4qH9faH0FA9d8/B9FiHgliXdwRmJBhi8wWg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gdcMdst/NetO4ozGaLx3MvVKKImuLMPRqsz7/azvaUyy4IdOf8Amp3AfcbYSfUJKn
	 Yoes4Lh2rYwNOaZhs2IVAI8ohksGCv7LIYbwjKay8MxVLqZdOZq4eAz9NTxlLk400h
	 abVrUnzqq1jwIT2PS7Zm0PUR7115Ynl2d6/Ea+pF5n3yIcY0LAN0EfvPQPGmB7Ikn9
	 2zj/a78eXjH5KMXFE2GkUK8jJ2pUhUTMtQTJcvG/ceWj1QV0g9uTLl77tjR7+L8i72
	 XGqkOMIkeTTl24WSj2K970yh64VjRsyUx1mV/CGUq1bxzGOZPaD2qOk8lJDPp6mUgo
	 OISZq/tMcWKBQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D910817E1066;
	Thu, 09 Jul 2026 21:02:30 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id C82FA48006B; Thu, 09 Jul 2026 21:02:29 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 09 Jul 2026 21:02:48 +0200
Subject: [PATCH v11 25/36] phy: rockchip: usbdp: Add some extra debug
 messages
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-rockchip-usbdp-cleanup-v11-25-a149ac60f76c@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3232;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=1EpS3VBx4qH9faH0FA9d8/B9FiHgliXdwRmJBhi8wWg=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpP8EVRwrV3fjTcrM5oVODWijKNFIxYahLiz
 L0qqvSCQDDsAYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqT/BFAAoJENju1/PI
 O/qaUYUP/34KLp8J/qXhGtQ0dZnHaZjlAZkI/zAsIMVa6zdQPUyN664lZcxqcX2oHAmBMMukcG8
 HtMba1y2+dEMW7151VBKoPGvvNqZsRNhNQMie2zNJPVIM6w2jHHhOEXBzdbTDJ8EchTj5gTr0QD
 3JyZ54Fv9GyYQXI6xTqKBYrZAM4DD4OlqWKClWZknq9HH2JJ2Xdrfg9w2lIqk80l3J7cR4OdCPF
 sX9SxtNl6EXVOAiUUFyUzVrwqr0JXbk4IwcmOGKdKFgw1YVtD3K+4ox057ZFBmFNL0inf+BPOKu
 wIa7gsQiV4WoozktmsWzMpVuoIDtdqsSXO35nnyFE/MdqEho4QanLnPJwGTYoJI3QtTRV3TqwzC
 80kDsoLnSnybwYKWj3oRUsaH4lrMA3AGGh1sSKRlkXLBmd1cZH4vrkWvWW7EEQJo6loIFhy5h6q
 jeeLEdmlje6TfbeyZ0aIgvmyTp8DCAedos8fIUeW3iMtFu11471ENzdXxAsEmVURPOfbGTwlWkz
 ejDf0M8+xN3vGmiSw7FXCkB7Tvgid1gqgc00OLgrDAcFHVFmgydQY7ipX9l3BsVojwG8YtHvx/K
 tFh5pZRYu3hB9zhfQoz6b+GzJljTqLzNarRyDRKmea46U9AJkidyhZN1ce4VcB+5uUNAF/oNGk/
 JaJjyYCTlXxTYWVhQph8tGg==
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

