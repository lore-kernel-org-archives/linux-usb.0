Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9223E343886;
	Fri,  3 Jul 2026 18:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783102425; cv=none; b=YNmG4YowIO7B3si/wKCK7jW491EgxJb7yS1VTfc2LUrLXctriKzcMLIyE7CM3FrgdY8ItrM0IaaMWZzVvx900iuFc2CiAq6IegbdnWHBizvm4YCBTCEo4e14UvaAfE0/2kRhFwhGAQ6ylasss2QCE5od8wRq2ARUMXV0KejhgM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783102425; c=relaxed/simple;
	bh=rqleTZ80fudrl7m1GIuKO8LHBU9C7wMJGHf2oqX0GSY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pFEx2rt7DKOQFxITa5yGXTYqVrJpz3kScAvLFKf3hoBgSqs3WNqUp7bR2wM6cnZB4fiw3l0271q0zYe+4/Kbqce5GNj3IJ5wRatp+4RHvbMl9QGLS0UF2/3HFQJJmwt4ES+nPB6TYs2b6cL1kI+7Msk3KMuJG1c4Vh2YIrR6V9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Pey7oZ5e; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Pey7oZ5e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783102414;
	bh=rqleTZ80fudrl7m1GIuKO8LHBU9C7wMJGHf2oqX0GSY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Pey7oZ5eyqTP8V3iuVtj4UGCLZR3pfMIqExzUDOhPBnQW9XpYi+R0uLDdky9NaN9P
	 O4nCA1uEfqwKavalnnH6kU7Cz6q0NBUKoGEwAhSYm9X3yZgqyAsAuVko6lbp19N/AS
	 JW12tk3JzxMsJcN+uHVhZzqOLCn8IXUMvff7SU2mNC4mLGR/zOz0/08HlXtR8xCnXW
	 Fdm/hzWHVuteh51YtUr0+3bZfbv+jqOLMqiE6BuBIVVnnSZSj2s1tymQMNBbcNBWI9
	 ZI8eV54zkYh/vDRp6eQfDlyeU2K9yhverGw0KpzF7egDApGEpTji88zNH+Onzy+NwR
	 iAbLEUAqkU9JA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0FCFF17E15CD;
	Fri,  3 Jul 2026 20:13:34 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id ACAD1480079; Fri, 03 Jul 2026 20:13:32 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 03 Jul 2026 20:13:50 +0200
Subject: [PATCH v10 34/36] phy: rockchip: usbdp: Simplify power state
 handling
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-rockchip-usbdp-cleanup-v10-34-a392711ca8a9@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7228;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=rqleTZ80fudrl7m1GIuKO8LHBU9C7wMJGHf2oqX0GSY=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpH+8w7gQRhdJklZfEroQuyJ9W3/9BUHYNcP
 pZedl4nY7JBTYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqR/vMAAoJENju1/PI
 O/qadPMP/jAXqcPKGH+C+Yv9Y/vB+XID0wRdIQ6WgPSE05R3fDCS2Q30J6+7pwyCC/yWzMIBlah
 p1sDJczscpUJeuv96NB4f4lID9/+/L/macoB7rMBs95ILNCJdwe/qX7xDl6f7ECMSB5OtX01wFo
 JkNOtXRenERmZdURW7sH3k691S2JgN5PXenHBNs5X7O5NDVWJS5Hm/N2F6wMYu9NvVKsK5/yTeF
 5ihatOpm9lh4+ecHpKR5+7aihuz6BzERezavxidXpUH1CnEg3UJkknldx5zzfHjno280npcA4ld
 A5RJVQBqkmT4IW95pmuE+7lmxH5Z+JxwSYjEdN4th4P/RWsN06rmC1Bo49u7U5CNuGbhLkg7qk3
 Ko4vL5LtklHrnH/R3FWmotB9cH80NbYGBIR/YaFj2eirVF/2DhQUkgRQj73jlQopDb/enuUXyOS
 9ZeBG8x5+n/vfPV9Y+PPW837L/e52hRnS+DGje/F9VFV05jtzRueqdYOz3Zhw/zZQD498IZcoWE
 K/bZaQXjENff/KWmrYe3NJDtP9Fi6Lb4UDCtAIQ+wzSDHZh3sELCbd5n/t8SGIDI/yb8mHO/5yF
 ekYzM539hcxdwJH7jLANhvaLyxnhravIwvsO8sMrlEsq30npx7HYYajkXPdFOKD7SXE1PjIPt3E
 6AkRFnIUMJd/RsHcPpuE92A==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Simplify power state handling by introducing sw_mode in addition
to the hw_mode field, so that the PHY knows about the currently
supported modes from the hardware perspective, the current modes
requested by software and the actual hardware status.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 142 ++++++++++++++++++------------
 1 file changed, 84 insertions(+), 58 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index e2cd72643a7d..ca9418fab8f3 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -173,9 +173,10 @@ struct rk_udphy {
 
 	/* PHY status management */
 	bool flip;
-	bool phy_needs_reinit;
+	bool phy_needs_reinit; /* lane mux changed */
 	u8 hw_mode; /* modes currently supported by hardware */
-	u8 status;
+	u8 sw_mode; /* modes currently requested */
+	u8 status; /* current PHY power state */
 
 	/* utilized for USB */
 	bool hs; /* flag for high-speed */
@@ -985,66 +986,84 @@ static int rk_udphy_parse_dt(struct rk_udphy *udphy)
 	return rk_udphy_reset_init(udphy, dev);
 }
 
-static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
+static int rk_udphy_update_power_state(struct rk_udphy *udphy)
 {
+	u8 target_mode;
 	int ret;
 
-	if (!(udphy->hw_mode & mode)) {
-		dev_info(udphy->dev, "mode 0x%02x is not support\n", mode);
+	/*
+	 * Initialize PHY mode according to the hardware setup (either described
+	 * in DT or negotiated via the Type-C controller) instead of requesting
+	 * only the needed PHY side, because that would break the USB/DP data
+	 * streams when the other PHY is being requested. This is not an issue
+	 * during the Type-C negotiation as that happens during the hotplug phase
+	 * and not during normal operation. Also disable everything if the
+	 * software has not requested anything, as there shouldn't be any active
+	 * data streams in that case.
+	 */
+	target_mode = udphy->hw_mode;
+	if (udphy->sw_mode == UDPHY_MODE_NONE)
+		target_mode = UDPHY_MODE_NONE;
+
+	if (!udphy->phy_needs_reinit && udphy->status == target_mode)
 		return 0;
-	}
 
-	if (udphy->status == UDPHY_MODE_NONE) {
-		phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_PRE_RESET);
+	/* Avoid to re-init disabled PHY */
+	if (udphy->status == target_mode && target_mode == UDPHY_MODE_NONE)
+		return 0;
 
-		rk_udphy_u3_port_disable(udphy, true);
-		udelay(10);
+	/*
+	 * Inform DWC3 driver, that we are about to reset the PHY, so that it can
+	 * assert its PIPE reset lines and avoid DWC3 getting into a buggy state.
+	 * This is intentionally done for a PHY disable, since that also changes
+	 * the clocks routed to the PHY.
+	 */
+	phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_PRE_RESET);
+
+	/*
+	 * Disable USB3 port, which among other things re-routes a DWC3 clock to
+	 * avoid SErrors when the DWC3 registers are accessed while the PHY is
+	 * disabled.
+	 */
+	rk_udphy_u3_port_disable(udphy, true);
+	udelay(10);
 
+	if (udphy->status == UDPHY_MODE_NONE) {
+		/* Power up (incl. clocks) */
 		ret = rk_udphy_setup(udphy);
-		if (ret)
+		if (ret) {
+			phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_POST_RESET);
 			return ret;
-
-		if (!udphy->hs && udphy->hw_mode & UDPHY_MODE_USB)
-			rk_udphy_u3_port_disable(udphy, false);
-		udphy->phy_needs_reinit = false;
-
-		phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_POST_RESET);
-	} else if (udphy->phy_needs_reinit) {
-		phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_PRE_RESET);
-
-		rk_udphy_u3_port_disable(udphy, true);
-		udelay(10);
-
+		}
+	} else if (target_mode == UDPHY_MODE_NONE) {
+		/* Power down (incl. clocks) */
+		rk_udphy_disable(udphy);
+	} else {
+		/* Mode change => re-init */
 		ret = rk_udphy_init(udphy);
 		if (ret) {
 			phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_POST_RESET);
 			return ret;
 		}
-
-		phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_POST_RESET);
-
-		udphy->phy_needs_reinit = false;
 	}
 
-	udphy->status |= mode;
+	/* Ensure USB3 support is enabled when supported */
+	if (!udphy->hs && target_mode & UDPHY_MODE_USB)
+		rk_udphy_u3_port_disable(udphy, false);
 
-	return 0;
-}
-
-static void rk_udphy_power_off(struct rk_udphy *udphy, u8 mode)
-{
-	if (!(udphy->hw_mode & mode)) {
-		dev_info(udphy->dev, "mode 0x%02x is not support\n", mode);
-		return;
-	}
-
-	if (!udphy->status)
-		return;
+	/*
+	 * Inform DWC3, that we are done with the reset, so that it can deassert
+	 * its PIPE reset line. This is sent in pair with a PRE_RESET allowing
+	 * consumer driver to do paired resource requests (e.g. clocks) in their
+	 * notification handlers. As we reroute the clocks, its also fine to
+	 * send this after completely disabling the PHY.
+	 */
+	phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_POST_RESET);
 
-	udphy->status &= ~mode;
+	udphy->status = target_mode;
+	udphy->phy_needs_reinit = false;
 
-	if (udphy->status == UDPHY_MODE_NONE)
-		rk_udphy_disable(udphy);
+	return 0;
 }
 
 static int rk_udphy_dp_phy_power_on(struct phy *phy)
@@ -1053,11 +1072,15 @@ static int rk_udphy_dp_phy_power_on(struct phy *phy)
 	int ret;
 
 	scoped_guard(mutex, &udphy->mutex) {
+		udphy->sw_mode |= UDPHY_MODE_DP;
+
 		phy_set_bus_width(phy, udphy->dp_lanes);
 
-		ret = rk_udphy_power_on(udphy, UDPHY_MODE_DP);
-		if (ret)
+		ret = rk_udphy_update_power_state(udphy);
+		if (ret) {
+			udphy->sw_mode &= ~UDPHY_MODE_DP;
 			return ret;
+		}
 
 		rk_udphy_dp_lane_enable(udphy, udphy->dp_lanes);
 
@@ -1080,10 +1103,10 @@ static int rk_udphy_dp_phy_power_off(struct phy *phy)
 
 	guard(mutex)(&udphy->mutex);
 
-	rk_udphy_dp_lane_enable(udphy, 0);
-	rk_udphy_power_off(udphy, UDPHY_MODE_DP);
+	udphy->sw_mode &= ~UDPHY_MODE_DP;
 
-	return 0;
+	rk_udphy_dp_lane_enable(udphy, 0);
+	return rk_udphy_update_power_state(udphy);
 }
 
 /*
@@ -1288,16 +1311,22 @@ static const struct phy_ops rk_udphy_dp_phy_ops = {
 static int rk_udphy_usb3_phy_init(struct phy *phy)
 {
 	struct rk_udphy *udphy = phy_get_drvdata(phy);
+	int ret;
 
 	guard(mutex)(&udphy->mutex);
 
-	/* DP only or high-speed, disable U3 port */
-	if (!(udphy->hw_mode & UDPHY_MODE_USB) || udphy->hs) {
-		rk_udphy_u3_port_disable(udphy, true);
+	if (udphy->hs)
 		return 0;
+
+	udphy->sw_mode |= UDPHY_MODE_USB;
+
+	ret = rk_udphy_update_power_state(udphy);
+	if (ret) {
+		udphy->sw_mode &= ~UDPHY_MODE_USB;
+		return ret;
 	}
 
-	return rk_udphy_power_on(udphy, UDPHY_MODE_USB);
+	return 0;
 }
 
 static int rk_udphy_usb3_phy_exit(struct phy *phy)
@@ -1306,15 +1335,12 @@ static int rk_udphy_usb3_phy_exit(struct phy *phy)
 
 	guard(mutex)(&udphy->mutex);
 
-	/* DP only or high-speed */
-	if (!(udphy->hw_mode & UDPHY_MODE_USB) || udphy->hs) {
-		udphy->status &= ~UDPHY_MODE_USB;
+	if (udphy->hs)
 		return 0;
-	}
 
-	rk_udphy_power_off(udphy, UDPHY_MODE_USB);
+	udphy->sw_mode &= ~UDPHY_MODE_USB;
 
-	return 0;
+	return rk_udphy_update_power_state(udphy);
 }
 
 static const struct phy_ops rk_udphy_usb3_phy_ops = {

-- 
2.53.0

