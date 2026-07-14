Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481B142BE8C;
	Tue, 14 Jul 2026 19:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784057185; cv=none; b=cWkOek7rPZdVhwDLO0MYyg9cpKMsI6Xn2lOPenOm4Qmd8qkwwM7b0x05RmmnyKHkw27VOfBlPRHw+/zMnv3BX4PqzXughDFrC1o7dpENpTan3ZUNpp1XfY0UMhF098ClD0jqAkRJX/oEQSFedT04VGUM2O9dbq9He2UXpOf3gxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784057185; c=relaxed/simple;
	bh=OV39M7TEPR96L4FOITnMJWAcR7FZNRT5q3Hq1TGPYxA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BiRzot9WvkegdCjeUdSPLd6lpXgWqpOM5rujDc2naH68vhpxWsjcURm3MKSuN5BDCJmxGNqHRPTnFjtSG38CPF2vfAM4AwLZzktzVfLlg5AUJBsR4nkqWQT2QOX19qkv+92dRLBl5I9aAsroSfvXNo2gP58AoAnIcL3X8Vo40B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=B624c6Sx; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="B624c6Sx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784057170;
	bh=OV39M7TEPR96L4FOITnMJWAcR7FZNRT5q3Hq1TGPYxA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=B624c6SxV0iAkVKAzIcLfW72BK+saAIVoQxX4oct0/XSS6Yu1RzOFqVhcQwTk+0Ao
	 ZkuXP4eSsSnZ48j9AogvgmwogFv9Z1sDikfCNcjJfY+BhI4P3Rgh/s8ZmRgRImhr6d
	 TnRvbd+kBBlMYdShimW0gbc0HTAGTgXMoNtDh0EKwyVXr/ThGcXNvEjOF6gv0S+FyP
	 9kG8ZQWyQi+uxOG8DLwtcngZk098Rc0G8pvm1zPullLVO0pfS0PQ8kRTxpKzBoQQ0z
	 HfnpAhz1Rkqk+dUagMNsr34UFgnYhCuODcyj+tXPw7pxLCZmYF/4YJCkke8fhkyqyG
	 nVcfzemlziAbA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0242317E1122;
	Tue, 14 Jul 2026 21:26:10 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id F271448006A; Tue, 14 Jul 2026 21:26:08 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 14 Jul 2026 21:26:25 +0200
Subject: [PATCH v13 24/35] phy: rockchip: usbdp: Add some extra debug
 messages
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-rockchip-usbdp-cleanup-v13-24-6cb3e769d4c5@collabora.com>
References: <20260714-rockchip-usbdp-cleanup-v13-0-6cb3e769d4c5@collabora.com>
In-Reply-To: <20260714-rockchip-usbdp-cleanup-v13-0-6cb3e769d4c5@collabora.com>
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
 bh=OV39M7TEPR96L4FOITnMJWAcR7FZNRT5q3Hq1TGPYxA=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpWjVA+Qc9yQ33lRM7hFxzQY5JLwi3pxPKWS
 9PQmAKtnsH5EIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqVo1QAAoJENju1/PI
 O/qaq2sP/3zzWEHqOnx2mKvavQf4LMsgkLf286uh76jmbzBEc4Hp/pLplrJbQSTcC9rMamHHFXL
 8p+ToVbSTzprGOIrd/OmmES0VBqDiYYndGFYtu6tYFoAwj5/sghinDgCgmYkSAi10MQKde9kSm0
 qiTG2aH3bn+nV6vLudMwbAzYjfvSDQk1ZlFZflFJszZ5aqGMap9koU5nmt1IjpGQBbPEqbRTLUc
 0TKhoYvF2TCcVuktnow/Ck6NJPUqtcExf9VeBrVERlk8KD8W0z9SuMZhMYeb4oCnbtKudCwSbEl
 Mkh3qLlQc/GBFZe1UfP3ywHWdlNv8GiRZvNru/FaU7yvgFZpXgcj/HpFqFXhTy5dnLlwRm8wJ8s
 FQuEFtjlb+GqjfsxtEiwFQZ/TIXB82PneTP37Wtx5JvRnmD41/3rFst19507G8dUPx3388RlYeT
 GJs7LXV3rdNidEWSg2osVNvtFBZmbxoh/x20HhjB4D42Cyu8FpIj/d3M4kPObIoBMGn5UEot+dl
 ZcKLn12pam+MwxQvAwJABUzm1b9eJv+zq1y6YyEIIl6DxeW5vCjg3xerMDW9MNhqHs04Crr4QLL
 sWVRNGAwvIjllccvksI3hvRsJPbWskRkFNVT8vtEqJ5FBzbzcDEyOxoQtx/xo5SA6mEgp8zcSJa
 fvMcmLs0ZDOdIzUiPXqc2TQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

It's useful to log PHY reinit to ease debugging issues around
USB-C hotplugging.

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

