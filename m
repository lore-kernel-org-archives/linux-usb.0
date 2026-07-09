Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E133B2D10;
	Thu,  9 Jul 2026 19:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783623879; cv=none; b=QLXLsmPQo86Imfyb2ap9Pbb8gSAIml5HQnywaJxsU5qNGLcFoOQk9fiAo6MYcx0XPFxvhOcbXqMPcl+PAGTGMHtZUnvSRCHEkxkE2+I5C9r8qJg2F3sUjaaLwXJcQtC9cR8m3qdqTMQHQQet32z9YNU2gBDD6KVjJwd38tEKkgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783623879; c=relaxed/simple;
	bh=C3l/+cYxKrK2oNBwiHFJTFHU+beGjr1UtPkRN+2iWoU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q36apjNBjn+fO5J8ml2IEzhimKadcmKllQqMIBzeDFRWBG6wcOeyGXGR1PGn1I0hlaVRO18+36uh4es1+ane3+k+KNB9EQW/irvlZHtoaOgIdw5+26Y2MfRB6SKhNizn0Tm8JJG3tAARYV1aWefYoTSKTseasNiIU7TPTr/0pe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=OEOHCvXA; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="OEOHCvXA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783623874;
	bh=C3l/+cYxKrK2oNBwiHFJTFHU+beGjr1UtPkRN+2iWoU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OEOHCvXAfGf+6QJ3ZzUhgszpaAUNqWuux+78PwQ84u3cI5kZ5epgAF8oLInmhSooz
	 rcSrE2vB5rBPYjm1v9cDzJECKwMrbR0AjHvuImPWF+Cf2cqABdRQRbMDPTUu26wQFX
	 rKvwVhq3twVDlukOoTfZ+mIKWn/XMPm8pdsWILmTlMiRXAeWQG6Uqth0K+nK8u2HA8
	 OCNAOa2PaK8p1hR3REnfICrNKu6gt34FWOU/raa3y4l7QtC7vbpQfv2jg8HhjpS/ma
	 UjIStwB4tnbyG7f8Wg6zE2ctBWB3sPRIagCoQTRiiZOjPbx/2/Rx+Zv5W6JB8vP8Ef
	 ZVFKFqa5EbNEw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 619E817E0D53;
	Thu, 09 Jul 2026 21:04:34 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id D5BF8480079; Thu, 09 Jul 2026 21:02:29 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 09 Jul 2026 21:02:57 +0200
Subject: [PATCH v11 34/36] phy: rockchip: usbdp: Fix power state handling
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-rockchip-usbdp-cleanup-v11-34-a149ac60f76c@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7674;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=C3l/+cYxKrK2oNBwiHFJTFHU+beGjr1UtPkRN+2iWoU=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpP8EUZukDMPa91gyHAfbyeUFG0mr2rbgR5b
 vP5x1/wTdIeNYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqT/BFAAoJENju1/PI
 O/qaRWQP/jv7NQml5qw0f7ju6ZeSAv2Ip+1oKSJwttnD8hXlbe29WAnhLBO5tfAppLDTlBby13L
 3vgqm8806+hzDoN9/H6k2sCOBuAK+C0jesidCFkFGN16MX08XrxGZI4TOS1KZEoAkA99oKm25/D
 tgdrPhbguZs0C2kCUbBrWBuun/xoYwpM8i0ENxnrKzazjLHMyn2yxm6HTkTx2OXiEyHeHgsRr09
 NJ3C993g8Ft4rQSRTvtdgjrn8fibZtdnGBr86jc/KBhWywivqMCEzseMojH9Iz7PtdRkE0Su2YM
 N2yzMd2qosaqWZD07iWMoKDAhAvRJtKvPSRxFsSbiysDL8Ds8QQ8mN0nCUxmZN3MolWUVKip8xJ
 x41BBfZovd32yNpWJ4hCl49A90S2THpbBwMfJMyZtQ8GbNwi4OkCH1yM5Seowkr5hB5FLkEmRZk
 TF+I/cqRQZLPOZlaqIqmlLrnElhXQ/kaeOK5K/URAwexJFH72VtcoXr5JkjI/WpMq2LxX2zDzHN
 kp2isDjNkzgd5EALrlZ5QsdBImZyoj3nVtKKpRsf7ZX/CuI/0CP5gGrFGY9q7/nM7uGOl2HYT2i
 rrNO+jiAhJabfobZAz4y7OVRkxcqlvQT/M6aj4TgAXLAHHUfJLlcJuQArQc1eEp0azcsHx9TjHv
 NONcCnvmeS4gpt563DOAs4w==
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
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 144 ++++++++++++++++++------------
 1 file changed, 87 insertions(+), 57 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index e2cd72643a7d..c5ad300620a6 100644
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
@@ -985,66 +986,86 @@ static int rk_udphy_parse_dt(struct rk_udphy *udphy)
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
@@ -1053,11 +1074,15 @@ static int rk_udphy_dp_phy_power_on(struct phy *phy)
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
 
@@ -1080,10 +1105,10 @@ static int rk_udphy_dp_phy_power_off(struct phy *phy)
 
 	guard(mutex)(&udphy->mutex);
 
-	rk_udphy_dp_lane_enable(udphy, 0);
-	rk_udphy_power_off(udphy, UDPHY_MODE_DP);
+	udphy->sw_mode &= ~UDPHY_MODE_DP;
 
-	return 0;
+	rk_udphy_dp_lane_enable(udphy, 0);
+	return rk_udphy_update_power_state(udphy);
 }
 
 /*
@@ -1288,16 +1313,24 @@ static const struct phy_ops rk_udphy_dp_phy_ops = {
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
@@ -1306,15 +1339,12 @@ static int rk_udphy_usb3_phy_exit(struct phy *phy)
 
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

