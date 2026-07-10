Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E0743FD18;
	Fri, 10 Jul 2026 16:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783701998; cv=none; b=NsYu9Lc629VpfyN+s/0o+l3yRwHKfr7WD76UJJZ2y6lK5BOKdVebTen20B2wYeY19NlMeI0SNk9IZJWnbfkFStJLlyl6rOoYZk3gFKceOIK9TrJ5DYsbOsfR86uiL2b85x5kX8POywQnMjwcCvKTSjHQMdJc8yWNCT3DiSXD0Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783701998; c=relaxed/simple;
	bh=EDKEcgVXYWE9dDyaK1P/KsuEf7Pra2TSIeLW19LHc3k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o8nTYWxYhm9a/J0yvMatsPx52E+nZYj2nXDOciPEXfj+W/g/F2iGlU9rqSkmFDVLe08UZM+zhFm1AHAPZA6f2g6ESQMwzG4k/XbltGYGLXImaPV4CUgnuWkZKiqmeWUOBwe615O61pK1NkEjRsqvh38PY0qOKsP15WFsy1hzk/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=VVJpMKUz; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="VVJpMKUz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783701979;
	bh=EDKEcgVXYWE9dDyaK1P/KsuEf7Pra2TSIeLW19LHc3k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VVJpMKUzNSYjw3mJk7AyyyBK8wKUfQdqxXaYoAli525zKl1ZxRSFXx8EDyqb1UARM
	 2zPTZI57PYhkKOJlmewUDfyGrpHopDkDxT0b53BwkXWNrn6NRCyflzVeNresGSAfxf
	 a6KHTwp3d73tqrSnDiK2FpX90ba8dLN/qEsatNiqTzErMm5Nw5Ev7ZMle7jrP0RFtK
	 RYTgR/epoJIKiO8jfk04dHIkgYcOFlY4cvMHSzz5iskiphSLIvnZcycqvIkRiLO3Jr
	 O6AtacQ5yXpqwc8OVvQRDLqxJQ6P90K89dHKrEZ0stxjZR1h4Nl4d2ow6Nuaz3M5fu
	 ZMq2c912lY7/w==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 553FB17E14DF;
	Fri, 10 Jul 2026 18:46:19 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 1B37D480079; Fri, 10 Jul 2026 18:46:18 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 10 Jul 2026 18:45:12 +0200
Subject: [PATCH v12 34/36] phy: rockchip: usbdp: Fix power state handling
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-rockchip-usbdp-cleanup-v12-34-8b41a9a9bef0@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7744;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=EDKEcgVXYWE9dDyaK1P/KsuEf7Pra2TSIeLW19LHc3k=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpRIdk2yebiK06UyrWPGpYhmYV5R9hSnsyrL
 UOn6tuVeKqOTYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqUSHZAAoJENju1/PI
 O/qad14P/j0CXb07ggbcSaQYbhAoG0X/wm1V8w6J0cO5P0efe/TVeV2kY43QKSUXAzaMFRGfVBB
 OxX9gCmw6lUH0ET/iY7jObgRiV/HyWjK5DU7Zfl0nqltTb2pTfSkq/dFCLLrJ7HhbrU09aDjetU
 LoEY+F5Yi8e59hvXTvhsXdyFu3Xuo2IeOttuTptZgacMc+OYvAnNuHSX2lEhGyJjcZbGneV8IcU
 0SVgeaf+UuWBQhKpZb+4AjDQYy9OUf/pxSfirGKy27ui66QIx/Ojs0VOjb7QgqltS/XTWMMVbdA
 /qHf2b+IE7m+wyICT+PA66bg/sziF8d9m8jG6ylaVgWYSL8wQ8xGXit5khBqU015mqCT6pi/qct
 pDFvty2SLxN2Rb7eK12wLYyZcmIjSO50Frpk6f8Yef5d9lC4Y85s0AvA0kKTOJ9gQqgSCXV8nr7
 5LK256rwwTUzpU54kZc9eq9z7JxQWcLU0xajk7FCDNVek07eKtCdvZQ9YgbB4alzWoKzoutA26P
 10ffamHY1i6Y7hqzXVgesc9pl79sGaKkhRU3HZ3JNKe3T5KZwll3MDWdV0Pgzp4IUG00RRigCum
 sn1QBGnWmNiU2k7ubMxfM9mVU7gJUxrQpMf/PWv4t+xiC0ThvVxnjQe51klYdaRjdT6pKSO77OJ
 F4yjGWCQEiAzOAhsKMMInbw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Restructure power state handling by introducing sw_mode in addition
to the hw_mode field, so that the PHY knows about the currently
supported modes from the hardware perspective, the current modes
requested by software and the actual hardware status.

Now anything updating either the hardware or software state can simply
update the status field and call rk_udphy_update_power_state().

This makes it a lot more obvious what is going on and also fixes a few
potential resource leaks identified by Sashiko as a side-effect. For
example if USB3 is requested by software while the USB-C is in DP-only
mode, things are decently handled after this.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 142 ++++++++++++++++++------------
 1 file changed, 84 insertions(+), 58 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 7bce642f1e96..c5ad300620a6 100644
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
@@ -985,70 +986,86 @@ static int rk_udphy_parse_dt(struct rk_udphy *udphy)
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
+	ret = phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_PRE_RESET);
+	if (ret)
+		return ret;
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
 		if (ret) {
 			phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_POST_RESET);
 			return ret;
 		}
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
-		if (udphy->mode & UDPHY_MODE_USB)
-			rk_udphy_u3_port_disable(udphy, false);
-		udphy->phy_needs_reinit = false;
-
-		phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_POST_RESET);
 	}
 
-	udphy->status |= mode;
-
-	return 0;
-}
-
-static void rk_udphy_power_off(struct rk_udphy *udphy, u8 mode)
-{
-	if (!(udphy->hw_mode & mode)) {
-		dev_info(udphy->dev, "mode 0x%02x is not support\n", mode);
-		return;
-	}
+	/* Ensure USB3 support is enabled when supported */
+	if (!udphy->hs && target_mode & UDPHY_MODE_USB)
+		rk_udphy_u3_port_disable(udphy, false);
 
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
@@ -1057,11 +1074,15 @@ static int rk_udphy_dp_phy_power_on(struct phy *phy)
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
 
@@ -1084,10 +1105,10 @@ static int rk_udphy_dp_phy_power_off(struct phy *phy)
 
 	guard(mutex)(&udphy->mutex);
 
-	rk_udphy_dp_lane_enable(udphy, 0);
-	rk_udphy_power_off(udphy, UDPHY_MODE_DP);
+	udphy->sw_mode &= ~UDPHY_MODE_DP;
 
-	return 0;
+	rk_udphy_dp_lane_enable(udphy, 0);
+	return rk_udphy_update_power_state(udphy);
 }
 
 /*
@@ -1292,16 +1313,24 @@ static const struct phy_ops rk_udphy_dp_phy_ops = {
 static int rk_udphy_usb3_phy_init(struct phy *phy)
 {
 	struct rk_udphy *udphy = phy_get_drvdata(phy);
+	int ret;
 
 	guard(mutex)(&udphy->mutex);
 
-	/* DP only or high-speed, disable U3 port */
-	if (!(udphy->hw_mode & UDPHY_MODE_USB) || udphy->hs) {
+	if (udphy->hs) {
 		rk_udphy_u3_port_disable(udphy, true);
 		return 0;
 	}
 
-	return rk_udphy_power_on(udphy, UDPHY_MODE_USB);
+	udphy->sw_mode |= UDPHY_MODE_USB;
+
+	ret = rk_udphy_update_power_state(udphy);
+	if (ret) {
+		udphy->sw_mode &= ~UDPHY_MODE_USB;
+		return ret;
+	}
+
+	return 0;
 }
 
 static int rk_udphy_usb3_phy_exit(struct phy *phy)
@@ -1310,15 +1339,12 @@ static int rk_udphy_usb3_phy_exit(struct phy *phy)
 
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

