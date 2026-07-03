Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5868324716;
	Fri,  3 Jul 2026 18:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783102420; cv=none; b=pDuRnl0VGffkW61ZlzQ/Z/iQeH2fhmgFPPrDGoQjTSCMkHxoPH+yGxFCZLVPJhTSlpaBB7XtjsuHJa2h4Up/LidlW/QSvZqfUluMuCYn9LRJDUFDd4+gFFfverFNOudIHC1EQOROqCLYb3w0kudIRz4q9J4DCqR/TX7kk10cCT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783102420; c=relaxed/simple;
	bh=8x+V9jjStkv7ipsHaKsRN2SwbLF1FQFj7nt1kWMYqkE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OowGOT8vc/JneiqgXkmb6Lte8BGMLQp5pWbH8qLos6IMkDXlYJncmVnopQPvMAne3Kt4NZorhMtV7oiU3FYKz7tFEy5dEcSTLVM1UWFNSlX8rX6u9eib5iG7DRqi8jv6Mv2IXpJiIXM5+XikFHjOLRNEWIdV4K0WdW2LIosIk+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=k+X6E+z7; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="k+X6E+z7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783102413;
	bh=8x+V9jjStkv7ipsHaKsRN2SwbLF1FQFj7nt1kWMYqkE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=k+X6E+z78YTS9wovrldPdmtyDr9hSbV8ctHhEux31b7ibjPeFMBA492OvhEDGMNjy
	 31EDicUkZkZVsIfnYBQg0XzSI3TNO/i+ou+fc++LvfR6d1MmJjhS1RWTv+3RB+wN20
	 YpzxHE6TMCOGMJE1nhAnRKZnhAnBiDEKE9+RWWW/sHS4p9iDgKU2RJeywuAYx7mE8Y
	 UBMCLdGh6BoBKZ0drUwneuHyAR0nIiZ2zhdPa50LOJXCWMUyN4cbXEQGGhPZCEN7nY
	 GhdaL+mnOeLcnQWmqQnUvBNtV5SpTzRq1mFuU/aBbMA34jRFoiuv6F4rnsBfailyYn
	 FdWSZebxqr/Ig==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4303317E140E;
	Fri,  3 Jul 2026 20:13:33 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 87F5C480047; Fri, 03 Jul 2026 20:13:32 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 03 Jul 2026 20:13:26 +0200
Subject: [PATCH v10 10/36] phy: rockchip: usbdp: Add missing mode_change
 update
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-rockchip-usbdp-cleanup-v10-10-a392711ca8a9@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2006;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=8x+V9jjStkv7ipsHaKsRN2SwbLF1FQFj7nt1kWMYqkE=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpH+8seaZ+CasmQuW9bW7u5vDsTamEMCBlq1
 UCCn2n3vw9MlYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqR/vLAAoJENju1/PI
 O/qaxdQP/06eMic7F5Msbq2+uzaMo8cPQGafgdgoK/mqmwjB4t7ITwDTrQPqueKx8TZOFUc/3ba
 pEISpEXVPIyuBY9fI9kjugbvj9b/lkOtwXG0mWYGqrCxlN3SlP9gLs7khOkKS/4isJBELTdcBPx
 1zIolzxR5icceg2dmAr54ZawEmyV7gGHG2cU5yJw+Z7ymNleJWAjgEXyIjjv+5fjUKTd/vJ5FsJ
 Eewx0ajSUka0akai36X/WiDqCh6ThLXNXfYCrQVQ3yyDgOMy5+TTzhK6uJePln3UcgiC7mov2yL
 KRGIaccvhYSNY2KjCphU5S4JTU6qqHhiiw9JGfQi8hUV5B+N0iPk0rZl+nxwpULEGSSYea4XcjZ
 M3EII9Siajwhd1xK4bSfWY3VfJgBveor5LsCNTJaSUN4cMlC5YJGIX9+wKd1t71XN+t9/n0Ic9p
 YpyNTBGFna6QyrT326kiTl0WcZ168QJLOKmLyadyPiVmO+8rCWwwAZErPUudVHdaIjpJqPu2CLt
 73eSQTXomhzIm4oyNWWOVBkaN1f92dUM29+1KS0+31wDEbpZ3GPsSZoMaqmjoZxVK+UAkeny4eu
 gKX7BpJ/WXfS6xFgu7Uu7eN0vlvtwRrMjSR2tvcIafyy6xEetQZ2Wd7vGxp6UPlEMUbr85VfQVA
 zw9l+YxZHBIQVuoI6Kmgnew==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

rk_udphy_set_typec_default_mapping() updates the available modes,
but does not set the mode_change as required. This results in
missing re-initialization and thus non-working DisplayPort.

Fix this issue by introducing a new helper to update the available
modes.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
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

