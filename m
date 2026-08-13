Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8EA359A6B;
	Thu, 13 Aug 2026 20:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786654321; cv=none; b=N3yl/oVDZLYZmdntpsa/yGWNMbXuDuR1UDcWYHmCSw1ZowwnAhgvOFogWhg/ov3KpyPi/KOPtf5ObjS/i/ms0+RfbvUIjq89CvxJoonzt556uKy7Xbx3l6ClLK6n92KqGfBTWUJ3p6LuqOln96nRStX6WA9wvQxgftcn7vnCBRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786654321; c=relaxed/simple;
	bh=tWX9go0u3+GnvkeHXNXvA5SOHjDyN8/Tg+MqJJtnATA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LGjkzaqGYouv+K/1Voa6YeIpKEjUux11LL1xMl35KGne9l491/btjW1LVle/kVG1IhkrPPAH5XdAWWxAR+xx8PSB4j0ZiZ03PnRcZQbvuD7j2qMEzRyiCCtCL7alrcUf6vGkrFcyhwtaMYWQZBwTSAfUaEbol805Nrfm48pfr1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=fGiNnDVm; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="fGiNnDVm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786654310;
	bh=tWX9go0u3+GnvkeHXNXvA5SOHjDyN8/Tg+MqJJtnATA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fGiNnDVmUKtSGN6c0TcdD5Mtneof4JSvbk377N2/q+FPySzEo6ZlsC/ZUt3AUdmOb
	 zY95j2atNRZfdkSVY4p1is1mbK6gLHH9o3cDkJc2vo6OXYcV7cf5jX6vCTKAj/1OfJ
	 iQtD9HTPI50cEOy9xQyVd0xnvpUHMyDz1Kqqze8q2ahOC6ZpKLt+x3aLBmLjKh16JU
	 q9sn3V6O8aFOlnsg7m9j0kijeC7qQmPNhN0sNy9WQqQQJP3EmAoFT4qa85Pwre+eMO
	 HkBYh91wL4C+17R/OqhxKm0HXeAIePgHhTTBvIgzfMI+AyFIT6uwYB/XxBc53ndvqt
	 b5RaGFey5z1yw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 46A7D17E10C0;
	Thu, 13 Aug 2026 22:51:50 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id A320C480047; Thu, 13 Aug 2026 22:51:49 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 13 Aug 2026 22:51:53 +0200
Subject: [PATCH v14 10/38] phy: rockchip: usbdp: Add missing mode_change
 update
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-rockchip-usbdp-cleanup-v14-10-b5ad9c68fa11@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2075;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=tWX9go0u3+GnvkeHXNXvA5SOHjDyN8/Tg+MqJJtnATA=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGp+LmRWBIPA0c3ljBQ2qrAmf1qc/+6EIANKY
 JYNSilf00MZBYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqfi5kAAoJENju1/PI
 O/qaGewQAJvYmFWdO+OoMGxytPk0HAwB0O06YhCw+RD0Ou1B+2q2iOnt0oB28iCdXQIisIwtn8p
 mc3r3SJImxaba/04ziV6R8Ma00ObZTIhXgwWYXbgnt66ob+UbWxQXvovjc53O9gHYq6zdP1yGU9
 DQyNUr8dObblB2x4OAHEXXJVvfDw6QMTJX5F3yUAhhk1DgsyZe+Yi3BOk+xCMeEwtkTPBeEpZDE
 Sp5WVhpr7ExBGG9EuTASQxcb63jLQ8WI1qE9XxfnK2kB+hnkb0X4hiERZFrRGP1fjcI7WxStP4K
 1UQNPomzaLJFn8jAVkGmsRdVbF3fcVdeQao+9soFOmadJ4OstVYFv0/Ev5+dRtPjtVHCG03my+2
 XCPo4SPNiO8PrqSE5W7hQSVFe/y52iCe8Qwm1PMFCDaTba9b4uZyXiq0ZIXTkzs0HV2u6ii402U
 TXMmmyyY4/bnRGpoJH2tabMRqPuA+ie6sqW5xQ0Tq83fmYr5q0XjjAraAOOcyEPGbhgDQa4UPit
 ssQRVr132FElToqCwSMXZ7YzxeeaiRdgg7CPrXz3v67TyXa7Dg2q2Mkzssy897C0rW5RN/f01E1
 nc3nhRldQpkCoAlPVrAF3F2zW/CZXtXiHb6/lOpqoAYYkqALvX5WnnwkRzgcpPht8QEnt9n5l8U
 vfoF14xxGWBPikBuofgIrTQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

rk_udphy_set_typec_default_mapping() updates the available modes,
but does not set the mode_change as required. This results in
missing re-initialization and thus non-working DisplayPort.

Fix this issue by introducing a new helper to update the available
modes.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 982315535caf..7540c897dde1 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -617,6 +617,15 @@ static void rk_udphy_dp_hpd_event_trigger(struct rk_udphy *udphy, bool hpd)
 	rk_udphy_grfreg_write(udphy->vogrf, &cfg->vogrfcfg[udphy->id].hpd_trigger, hpd);
 }
 
+static void rk_udphy_mode_set(struct rk_udphy *udphy, u8 mode)
+{
+	if (udphy->mode == mode)
+		return;
+
+	udphy->mode_change = true;
+	udphy->mode = mode;
+}
+
 static void rk_udphy_set_typec_default_mapping(struct rk_udphy *udphy)
 {
 	if (udphy->flip) {
@@ -647,7 +656,7 @@ static void rk_udphy_set_typec_default_mapping(struct rk_udphy *udphy)
 		gpiod_set_value_cansleep(udphy->sbu2_dc_gpio, 1);
 	}
 
-	udphy->mode = UDPHY_MODE_DP_USB;
+	rk_udphy_mode_set(udphy, UDPHY_MODE_DP_USB);
 }
 
 static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
@@ -1361,10 +1370,7 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 			usleep_range(750, 800);
 			rk_udphy_dp_hpd_event_trigger(udphy, true);
 		} else if (data->status & DP_STATUS_HPD_STATE) {
-			if (udphy->mode != mode) {
-				udphy->mode = mode;
-				udphy->mode_change = true;
-			}
+			rk_udphy_mode_set(udphy, mode);
 			rk_udphy_dp_hpd_event_trigger(udphy, true);
 		} else {
 			rk_udphy_dp_hpd_event_trigger(udphy, false);

-- 
2.53.0

