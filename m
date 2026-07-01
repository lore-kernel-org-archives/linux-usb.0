Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4894218AE;
	Wed,  1 Jul 2026 23:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782949502; cv=none; b=kpVPyCSYL7W+5FzBz2vHhu/4YXXGwa923U0wnXwqxq1mhir4v3wHhgVb6ywBJwuE6S63yW3zlTdlr4NLrleKeFhzXsP3GFdgiogT1/9RuVzfpqR3iE7Fz30FG/FKspCJN9/o/L7g+mR1QMeBop6ZNGNXXz0NZ73PhBa/W+ERu30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782949502; c=relaxed/simple;
	bh=fa5hQGWascY3by9Rsu+HK4YjS/YiIIg735TSzfGs2cM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LvCpBTQr55JzSbmonAkpQ0uzWM6uRo+q9gRl3JS4qXHlvcxlwz0JLnhdnJw8oVGwy2hIrNKT0fu5EuXsRj3b4kcbasQi6AsjEDHaFMCMAVjBIhbyVyYfaMPvwDpuWMbus0/G6CmsmuirZ1etSDDOFb2WlkSt45YZpcatai6XHQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Oa3w88qM; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Oa3w88qM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782949486;
	bh=fa5hQGWascY3by9Rsu+HK4YjS/YiIIg735TSzfGs2cM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Oa3w88qMaBLjSJ1TUFo63jOkN7B0egRTjsZnzi2+Et6Eb5b/Y4cdMSteVqBC/pga9
	 4DRd1KeqG23Twxno0AQw4TYxrWzqQiVKXsZieQkh+FMG+wvrjMb18nXUpbckF2SsCA
	 WYT+BEVi8MaxqwVM5ttncGzXNmSSWbApxMxaMzE8s5rRlIfAsldTaWrv+vXmBQKqm5
	 KbrR8v1dCcnOV3KlRiewgcOS0eMRx2bDQAAOsjm9d7o7H5T88VWc0nSClTVicicbfz
	 N3sD9EqvuR+bmbfvq+ZmoUC+k9pBkOSjV45YbK/LBanhXh11kzu+cRq7Fl2iv1mrmZ
	 zrLnuSL1qDbgA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1C42317E116D;
	Thu,  2 Jul 2026 01:44:46 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id C751D480064; Thu, 02 Jul 2026 01:35:48 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 02 Jul 2026 01:35:56 +0200
Subject: [PATCH v9 18/38] phy: rockchip: usbdp: Drop DP HPD handling
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-rockchip-usbdp-cleanup-v9-18-e31efbb62d2e@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5161;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=fa5hQGWascY3by9Rsu+HK4YjS/YiIIg735TSzfGs2cM=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpFpFMn8shl7V2ZhbNee1v13ItT3nKASvpbX
 o2bg1M61QWTcYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqRaRTAAoJENju1/PI
 O/qa+hIQAIQAvtk4ReQuzZdLdfOtNPyLaGnlmT/qI5Fyay3q7WeocatIw4j8cyGqgSu8OrQv65Y
 4HU3aAquM6oPGzNHp9G/sSpxNuZOteOI5yf68/MCL3KGJNm6ct+Zrv+mcB3tz3QnoJkwR/N32Y2
 /aptAsEye7FYY5tYSZXgORVVGyxCbpbC/uBlfnUfJ9JnJ++wheWYqTJ8E3Y8keuCU/GaaO5OSOp
 1OjCA6CQGrrroeEnKeJDm5v3LANS2bnOVdZYPVaPgf4C24JmMm92HupzTIKmgBt+DpT6F9eUBVM
 BqSira/HmD0ExCHVuclUfRhK8tM6xpZUln+xnnmFdJL2pMWmmPi/ZJ4c79JuINhuQQ8eXXknEaM
 t4a4NyyFJFcyV+iOAlgxS9nKJ3eSEpLsSQioVTVybYY3xm+CvFzzlsLIrkF7BGrFgGWd3gk5Z/t
 z283qD7aLT/TgRsnv1hT9ksTtFP+fMMK5Nh32G4M6w5VBHTyWEY4SCk1mc9E13SkEehFIX7wDZT
 SEzyNlusElu7w7yREmbifk41PaTnnfxsYsJcDEnwRRwbIj91yL95FkNK8s5PpaFqubdNFE8RNkk
 AkFWHKPMPxdFESXpKw4kJv9xfHBuJGgn4vap88r7RG5+arGz689vTI9A2pDMdGTJdGqYrKQVg4e
 c1gVie2MldpG6bGWSjOUykQ==
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
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 81 ++++---------------------------
 1 file changed, 9 insertions(+), 72 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index b3de16557c32..928466659486 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -186,14 +186,11 @@ struct rk_udphy {
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
@@ -582,19 +579,6 @@ static void rk_udphy_dp_lane_enable(struct rk_udphy *udphy, int dp_lanes)
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
@@ -1035,29 +1019,6 @@ static void rk_udphy_power_off(struct rk_udphy *udphy, u8 mode)
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
@@ -1289,8 +1250,6 @@ static int rk_udphy_dp_phy_configure(struct phy *phy,
 }
 
 static const struct phy_ops rk_udphy_dp_phy_ops = {
-	.init		= rk_udphy_dp_phy_init,
-	.exit		= rk_udphy_dp_phy_exit,
 	.power_on	= rk_udphy_dp_phy_power_on,
 	.power_off	= rk_udphy_dp_phy_power_off,
 	.configure	= rk_udphy_dp_phy_configure,
@@ -1344,6 +1303,14 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
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
@@ -1375,22 +1342,7 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
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
@@ -1549,20 +1501,6 @@ static int rk_udphy_probe(struct platform_device *pdev)
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
@@ -1667,7 +1605,6 @@ static struct platform_driver rk_udphy_driver = {
 	.driver		= {
 		.name	= "rockchip-usbdp-phy",
 		.of_match_table = rk_udphy_dt_match,
-		.pm = &rk_udphy_pm_ops,
 	},
 };
 module_platform_driver(rk_udphy_driver);

-- 
2.53.0

