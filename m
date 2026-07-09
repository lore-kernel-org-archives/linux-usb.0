Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188743C1086;
	Thu,  9 Jul 2026 19:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783623884; cv=none; b=h0wVP7JoR7tW9p8qsuxFmsFuMCQLYVvOdAerqobutQJ/jvO6ZkZV0aZUlctDNMwjeJ1k39mJ6kb2izE5IY2vJm0DYv8sVaEXylE/zwLWrfTZfa8XhG3f/3CR8mdxHS9lfiHMjyxVWVzilcUP2Aq+1RTeoeCE/7dYUxW624L0Z6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783623884; c=relaxed/simple;
	bh=L86pedZA772Rnc2vX5oR3CIG9SixBxsK2CPI3FEKRLo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fxw1UvvBYF6ggpVmMGqczOZtOFhBHOXgvw0k7+L17UD/D8e1Jluwvas8AVDVVdBseTWFvtpMZkrsYt0nF+GzdPMTFcTX9f5fwIgyeP8ekaB5hHkHnKegV82NE2O0nWKjdNeSf6B806hOLcoNXTgq8ye/vKz6+TsFYfP3egd/QlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Q0saCd2p; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Q0saCd2p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783623874;
	bh=L86pedZA772Rnc2vX5oR3CIG9SixBxsK2CPI3FEKRLo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Q0saCd2p/Ig6rqKQIybEfYhgftC6p/qimXz02JzKQZhuvRNRDgNFw7YDeaLESrAlU
	 IM/vTAHyFycxGSGpm6BsVEj2J73WreKMpr4KrtOj7+iv25yzi17Gpb+oZJh+KzD0hI
	 mgrgTJ1iytmowBMw5pevoV1RMYT/p5rsvRjQpvbxLMhrUx2QSecp1l9O5/5LQEZjE0
	 hdys3qTlqYW3fxnOV03sDq8BxZX3hoh/7rrTg3/n+ne5MRL9R4D7hk7Bffoax7vf71
	 pUQ+uxw2oFrPK/6ATSDk2JV9OZJmbl9vL6p12Bsfig2nZqZOhf14h0ek7D/X31Rntu
	 ABmvQsomH9SqQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B42F617E0F8B;
	Thu, 09 Jul 2026 21:04:34 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id BB991480062; Thu, 09 Jul 2026 21:02:29 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 09 Jul 2026 21:02:40 +0200
Subject: [PATCH v11 17/36] phy: rockchip: usbdp: Drop DP HPD handling
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-rockchip-usbdp-cleanup-v11-17-a149ac60f76c@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5857;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=L86pedZA772Rnc2vX5oR3CIG9SixBxsK2CPI3FEKRLo=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpP8ESlVhiz8N5BY/YLXhvAIS9HVM6JXvw7Q
 kZb8WPfDUCttYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqT/BEAAoJENju1/PI
 O/qaM2MP/0m/csqtkEI0rGdMGwdb/f/n2dsHOLjRO7AcZITSOSaevWjjjHuic8nuBNt1eopEQAM
 nVUhDzw1xN1Hrgnezcaqud39g4KmmIdP/+MXLFXEh4g3u23QYb5HY6n6D0JezpgxuiyTkTCmp4N
 cQpiQcrlEBeoVpjX6eUqEvRsm5enG0qugnX2Odzgnas8/HDwExb4TycNiRyaxi/Z0Vv1ItXs+3v
 B7NcLFwS/iqHFMx+mhSCdHsR+PIYpEpwrHgbryHAExQcih9F/gEIE2XuR4apo0zAPTQD08ql4xe
 reLTUaadJRxVD91eSjIPpia8JB0+POEk67kC1FvnClzm9pHVYI79hIfGYJBsm1owSNpeaEPpJjm
 pCupLo5lfGE93/NUYGu/jRs39kQDc+Z5liTGxNwsgEKCys6u9O9ZpWzeq3JMzFlsl+vCyEZJJ2A
 mGlYHU8mQu9KhwCCE5YCTBKexLQr0s87Elvg+uWqYdonJRek5vkiLPFAFXVROxURkKm8ETjT6+I
 GNs1MaAWeveE1fZrlF9UnFlDKsqBrnJZiwOzqjqS7wTV6Ze9WHexAbvzBNgym2Btg++ZXASeQf4
 zgEotbZb19YtWr6VKLjDt7Kqcx9ThHGXpIL57qdIT9P/xyBtMuiMp/Qo6lvc4pZxM9ZLlsUt63w
 8piJVhrQnDSvZd3PThosq0g==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Drop the HPD handling logic from the USBDP PHY. The registers involved
require the display controller power domain being enabled and thus the
HPD signal should be handled by the displayport controller itself.
Apart from that the HPD handling as it is done here is incorrect and
misses hotplug events happening after the USB-C connector (e.g. when
a USB-C to HDMI adapter is involved and the HDMI cable is replugged).

Proper USB-C DP HPD support requires some restructuring of the DP
controller driver, which will happen independent of this patch. The
mainline kernel does not yet support USB-C DP AltMode on RK3588 and
RK3576, so it is fine to drop this code without adding the counterpart
in the DRM in an atomic change.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 85 ++++---------------------------
 1 file changed, 9 insertions(+), 76 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 8ac6a83b0b2a..24108816e3b9 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -128,7 +128,6 @@ struct rk_udphy_grf_cfg {
 
 struct rk_udphy_vogrf_cfg {
 	/* vo-grf */
-	struct rk_udphy_grf_reg hpd_trigger;
 	u32 dp_lane_reg;
 };
 
@@ -186,14 +185,11 @@ struct rk_udphy {
 	u32 dp_lane_sel[4];
 	u32 dp_aux_dout_sel;
 	u32 dp_aux_din_sel;
-	bool dp_sink_hpd_sel;
-	bool dp_sink_hpd_cfg;
 	unsigned int link_rate;
 	unsigned int lanes;
 	u8 bw;
 	int id;
 
-	bool dp_in_use;
 	int dp_lanes;
 
 	/* PHY const config */
@@ -577,19 +573,6 @@ static void rk_udphy_dp_lane_enable(struct rk_udphy *udphy, int dp_lanes)
 				   CMN_DP_CMN_RSTN, FIELD_PREP(CMN_DP_CMN_RSTN, 0x0));
 }
 
-static void rk_udphy_dp_hpd_event_trigger(struct rk_udphy *udphy, bool hpd)
-{
-	const struct rk_udphy_cfg *cfg = udphy->cfgs;
-
-	udphy->dp_sink_hpd_sel = true;
-	udphy->dp_sink_hpd_cfg = hpd;
-
-	if (!udphy->dp_in_use)
-		return;
-
-	rk_udphy_grfreg_write(udphy->vogrf, &cfg->vogrfcfg[udphy->id].hpd_trigger, hpd);
-}
-
 static void rk_udphy_mode_set(struct rk_udphy *udphy, u8 mode)
 {
 	if (udphy->mode == mode)
@@ -1000,29 +983,6 @@ static void rk_udphy_power_off(struct rk_udphy *udphy, u8 mode)
 		rk_udphy_disable(udphy);
 }
 
-static int rk_udphy_dp_phy_init(struct phy *phy)
-{
-	struct rk_udphy *udphy = phy_get_drvdata(phy);
-
-	mutex_lock(&udphy->mutex);
-
-	udphy->dp_in_use = true;
-
-	mutex_unlock(&udphy->mutex);
-
-	return 0;
-}
-
-static int rk_udphy_dp_phy_exit(struct phy *phy)
-{
-	struct rk_udphy *udphy = phy_get_drvdata(phy);
-
-	mutex_lock(&udphy->mutex);
-	udphy->dp_in_use = false;
-	mutex_unlock(&udphy->mutex);
-	return 0;
-}
-
 static int rk_udphy_dp_phy_power_on(struct phy *phy)
 {
 	struct rk_udphy *udphy = phy_get_drvdata(phy);
@@ -1254,8 +1214,6 @@ static int rk_udphy_dp_phy_configure(struct phy *phy,
 }
 
 static const struct phy_ops rk_udphy_dp_phy_ops = {
-	.init		= rk_udphy_dp_phy_init,
-	.exit		= rk_udphy_dp_phy_exit,
 	.power_on	= rk_udphy_dp_phy_power_on,
 	.power_off	= rk_udphy_dp_phy_power_off,
 	.configure	= rk_udphy_dp_phy_configure,
@@ -1309,6 +1267,14 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 	struct rk_udphy *udphy = typec_mux_get_drvdata(mux);
 	u8 mode;
 
+	/*
+	 * Ignore mux events not involving DP AltMode, because
+	 * the mode field is being reused, e.g. state->mode == 4
+	 * could be either TYPEC_MODE_USB4 or TYPEC_DP_STATE_C.
+	 */
+	if (!state->alt || state->alt->svid != USB_TYPEC_DP_SID)
+		return 0;
+
 	mutex_lock(&udphy->mutex);
 
 	switch (state->mode) {
@@ -1340,22 +1306,7 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 		break;
 	}
 
-	if (state->alt && state->alt->svid == USB_TYPEC_DP_SID) {
-		struct typec_displayport_data *data = state->data;
-
-		if (!data) {
-			rk_udphy_dp_hpd_event_trigger(udphy, false);
-		} else if (data->status & DP_STATUS_IRQ_HPD) {
-			rk_udphy_dp_hpd_event_trigger(udphy, false);
-			usleep_range(750, 800);
-			rk_udphy_dp_hpd_event_trigger(udphy, true);
-		} else if (data->status & DP_STATUS_HPD_STATE) {
-			rk_udphy_mode_set(udphy, mode);
-			rk_udphy_dp_hpd_event_trigger(udphy, true);
-		} else {
-			rk_udphy_dp_hpd_event_trigger(udphy, false);
-		}
-	}
+	rk_udphy_mode_set(udphy, mode);
 
 	mutex_unlock(&udphy->mutex);
 	return 0;
@@ -1510,20 +1461,6 @@ static int rk_udphy_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int __maybe_unused rk_udphy_resume(struct device *dev)
-{
-	struct rk_udphy *udphy = dev_get_drvdata(dev);
-
-	if (udphy->dp_sink_hpd_sel)
-		rk_udphy_dp_hpd_event_trigger(udphy, udphy->dp_sink_hpd_cfg);
-
-	return 0;
-}
-
-static const struct dev_pm_ops rk_udphy_pm_ops = {
-	SET_LATE_SYSTEM_SLEEP_PM_OPS(NULL, rk_udphy_resume)
-};
-
 static const char * const rk_udphy_rst_list[] = {
 	"init", "cmn", "lane", "pcs_apb", "pma_apb"
 };
@@ -1547,7 +1484,6 @@ static const struct rk_udphy_cfg rk3576_udphy_cfgs = {
 	},
 	.vogrfcfg = {
 		{
-			.hpd_trigger	= RK_UDPHY_GEN_GRF_REG(0x0000, 11, 10, 1, 3),
 			.dp_lane_reg    = 0x0000,
 		},
 	},
@@ -1588,11 +1524,9 @@ static const struct rk_udphy_cfg rk3588_udphy_cfgs = {
 	},
 	.vogrfcfg = {
 		{
-			.hpd_trigger	= RK_UDPHY_GEN_GRF_REG(0x0000, 11, 10, 1, 3),
 			.dp_lane_reg	= 0x0000,
 		},
 		{
-			.hpd_trigger	= RK_UDPHY_GEN_GRF_REG(0x0008, 11, 10, 1, 3),
 			.dp_lane_reg	= 0x0008,
 		},
 	},
@@ -1628,7 +1562,6 @@ static struct platform_driver rk_udphy_driver = {
 	.driver		= {
 		.name	= "rockchip-usbdp-phy",
 		.of_match_table = rk_udphy_dt_match,
-		.pm = &rk_udphy_pm_ops,
 	},
 };
 module_platform_driver(rk_udphy_driver);

-- 
2.53.0

