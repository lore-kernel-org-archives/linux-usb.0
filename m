Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0283F23D1;
	Wed,  1 Jul 2026 23:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782949488; cv=none; b=gNC51eW0FmjfQEL5uJECa97YlqZROT8rxIaQgaGFJ9WYnsNfqJozL8d3WdWmjrAnlAY5vnewrs5IyJnoe9syj+/VOf/2u3tP9Tm3qp9zCIhA2sXQaFDxgOM02Bbi4J8u7s61Eqm1N27I5mf9nskcVWDtd0pUGZ1byLcBuFdHDMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782949488; c=relaxed/simple;
	bh=/REGbdDmWtcDdBho2f8xt5QLr18HO0mgfsHKYCUYVNY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f4P/Gk508wDOmEhWNa4/OWC/+tE9q01xlfclkIlIE+9Vkbxn4Ozsmy3BI9+lyystBX1tMUK8bQDisqCOSazhfbFGXlYzegDDWDakFg8pX23JW33Du5+OYxlX0KkcCpmnJUvW9iSdrp18ItSaoXDS2iGnydLKzIDG5GjkSMVbM7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=cu2fTAYC; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="cu2fTAYC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782949485;
	bh=/REGbdDmWtcDdBho2f8xt5QLr18HO0mgfsHKYCUYVNY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cu2fTAYCZZuJbZ3aiwcaW2NSeWOOsrH2kkZwOnNaKk90KBq3SXW097jw5W9gAdM+f
	 a2Hly+U/+SsG/h2AvwUmTJz1Ql8kuzOhvrTsWkOejg7+FFTSCEkN+4cjmifiQo1MUX
	 yfbM6oSr9agDtgOXfgf7uAWZbYvVfJKQHlbhLHP4nzWWZbImF2XfqMjXMGZ5lAhVF/
	 k5m2xMctbP2PuvLoE1QS0MUFVRh5+6RBy6fj26eZCbFsk6B88qEi/R8Bp09IyJ9pbt
	 eT0gd8mEynZQh6ZxNJYV7WBfsV8zM2HF1tKtePoqPwrJ9VtFzEDckd1PEFnzZR7zjY
	 9SDjjWt3meqRw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B9E2317E03CE;
	Thu,  2 Jul 2026 01:44:45 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id D312548006D; Thu, 02 Jul 2026 01:35:48 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 02 Jul 2026 01:36:04 +0200
Subject: [PATCH v9 26/38] phy: rockchip: usbdp: Add some extra debug
 messages
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-rockchip-usbdp-cleanup-v9-26-e31efbb62d2e@collabora.com>
References: <20260702-rockchip-usbdp-cleanup-v9-0-e31efbb62d2e@collabora.com>
In-Reply-To: <20260702-rockchip-usbdp-cleanup-v9-0-e31efbb62d2e@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3251;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=/REGbdDmWtcDdBho2f8xt5QLr18HO0mgfsHKYCUYVNY=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpFpFSwcRjRJZ2vu9RJp2rEuL2/fte+R1EEk
 A5XLgt5AGEwI4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqRaRUAAoJENju1/PI
 O/qaomMQAKD1Fa61jKraXRnGNBfs9WwuUzv6kFIjtQEH8qBbz7jwN+UaZLaYJD4KwPGlamOH+lS
 kQqnHptzCPmjZwLVHWqMHS7ty6dk9wikDTeXPmzBbqS3jOgZFv3Oz23FdfKE0Z8g7WXOfvPKWxD
 +P9UeIeCaMMtlQTLoaFm3FvXviJzo2hE5kumhubjpuQlYJx00NjJXGcYMYrDlI2+CIr0IjSMAH5
 r/FtVfRsUpgBOnbkb2ICsRpI5Kp/jBel7L7Kg0QsgcAENEJD9imTeuDDmc2H273hCa5jCz51g6a
 yIgSzvrTEfOqabYJ3O6zwHcXJF7HULkah8mHnE6d6L8thsX7sHsPSd/kwMPGK+MtW1gM4Ve1FnM
 mugfwHsQv13UWozVFO3QHl3A7Jb+M/csNslDCwXNpOfleCeL35Pm6WJDpPy+vATdub5OV4y7Hn+
 rwkF++Z+p6NahFrnYfy42ExsQVH5xVTVmk9YF3SabuXykiGcROqXQ0VH2m/+w9P6wQtEvRQ8/6t
 HaiM7o6tgjHnPcakNEmjDG7qHOMV0qHiGUgla+3MoGqJANm5eEF+oCyd9GpInmKtFs4c5xqGROZ
 voTfwFJwWCERyQhrukEPKlhjnisbv5xL9m0OrXn0pag6Xf4GA4DJZcvlMy91qlJS4MZFIA29ZiB
 C/bqM7rIUpsKlW2O3JLcqwA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

It's useful to log PHY reinit to ease debugging issues around
USB-C hotplugging.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index c874dfeeece9..6b0add354880 100644
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
@@ -468,6 +469,8 @@ static int rk_udphy_reset_deassert(struct rk_udphy *udphy, char *name)
 			return reset_control_deassert(list[idx].rstc);
 	}
 
+	dev_err(udphy->dev, "failed to de-assert missing reset line: %s\n", name);
+
 	return -EINVAL;
 }
 
@@ -494,6 +497,8 @@ static void rk_udphy_u3_port_disable(struct rk_udphy *udphy, u8 disable)
 	const struct rk_udphy_cfg *cfg = udphy->cfgs;
 	const struct rk_udphy_grf_reg *preg;
 
+	dev_dbg(udphy->dev, "USB3 port %s\n", str_on_off(!disable));
+
 	preg = udphy->id ? &cfg->grfcfg.usb3otg1_cfg : &cfg->grfcfg.usb3otg0_cfg;
 	rk_udphy_grfreg_write(udphy->usbgrf, preg, disable);
 }
@@ -668,8 +673,10 @@ static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
 		return 0;
 	}
 
-	if (udphy->flip != flipped)
+	if (udphy->flip != flipped) {
+		dev_dbg(udphy->dev, "cable orientation changed, PHY re-init required.\n");
 		udphy->phy_needs_reinit = true;
+	}
 
 	udphy->flip = flipped;
 	rk_udphy_set_typec_default_mapping(udphy);
@@ -787,6 +794,11 @@ static int rk_udphy_init(struct rk_udphy *udphy)
 	const struct rk_udphy_cfg *cfg = udphy->cfgs;
 	int ret;
 
+	dev_dbg(udphy->dev, "reinit PHY with USB=%s and DP=%s (%u lanes) flipped=%s\n",
+		str_enabled_disabled(udphy->mode & UDPHY_MODE_USB),
+		str_enabled_disabled(udphy->mode & UDPHY_MODE_DP),
+		udphy->dp_lanes, str_yes_no(udphy->flip));
+
 	rk_udphy_reset_assert_all(udphy);
 	usleep_range(10000, 11000);
 
@@ -857,6 +869,8 @@ static int rk_udphy_setup(struct rk_udphy *udphy)
 {
 	int ret;
 
+	dev_dbg(udphy->dev, "enable PHY\n");
+
 	ret = clk_bulk_prepare_enable(udphy->num_clks, udphy->clks);
 	if (ret) {
 		dev_err(udphy->dev, "failed to enable clk\n");
@@ -875,6 +889,7 @@ static int rk_udphy_setup(struct rk_udphy *udphy)
 
 static void rk_udphy_disable(struct rk_udphy *udphy)
 {
+	dev_dbg(udphy->dev, "disable PHY\n");
 	clk_bulk_disable_unprepare(udphy->num_clks, udphy->clks);
 	rk_udphy_reset_assert_all(udphy);
 }
@@ -1346,8 +1361,12 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
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

