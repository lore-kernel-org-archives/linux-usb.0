Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4CA429014;
	Tue, 14 Jul 2026 19:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784057183; cv=none; b=TpRo1gQ/co7CfCvUOx+5cJ/OR4I1rbzTd3UKmQXgcAow/sAnf3Fmt6kkF2j5SYTJei2Zr/8mIJD04T3kOSsq875QQYAY+9wbbEudRK/8oG7mV2bgoi0nN/nmymommqk2lKV+YdpcfFLezkAjWmpD4orpHa47QbxP4PBYkw8jz9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784057183; c=relaxed/simple;
	bh=KsztTcLL1hh9As65BcDTh5Y7TjOnYb7YivozEbWiMmA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U6IA0BngayuIJCpx9EaEG3JtsNNEuYZEcFBC4AGVsCkfeaeH1vmvOK3ysj2Uw0Zdo2OJJCK+cEvRdzeyo63/vEQz52h7v7TK0DcbIev3EbOdDqztkZ/GYR2QdjdiMMbLDQeR5bTEWHlaY5YBTNhI2Lw24AYxH264ilLET2Gl4Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=AAjUyJ7d; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="AAjUyJ7d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784057170;
	bh=KsztTcLL1hh9As65BcDTh5Y7TjOnYb7YivozEbWiMmA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AAjUyJ7de2ngGZyvzDv86kKk7IBaDgqEtOsSXZ6CqT2mEIraKYCDHCP/Jo9qjU4C6
	 GlbybFTTZ38TsqUtTmKNV6gc2pTOcoUisX95f5cQTeXGqNNtH6RGJBbmKCREx3JOUm
	 +m6BcPPhi2Il0MgU5uvTk/22c73y4KUBDyCtEb7IAJZOFYoG4tHljnWcI8cj3AeRqh
	 9oqvnP+dykHT1g2uELpyAg+1SyvoVuRxEmKM9Aa6XclGEBAyA1vDmKMdVbpyJC4vok
	 C1e+NU2hMrjhY+IExrhlOFyJjE0q+v1KFk8HOOpPgSGP4nVmaT65Je/MDwPApsRPfr
	 V6Xt22BE2BpWA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CE7A417E1066;
	Tue, 14 Jul 2026 21:26:09 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id E8FBA480064; Tue, 14 Jul 2026 21:26:08 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 14 Jul 2026 21:26:19 +0200
Subject: [PATCH v13 18/35] phy: rockchip: usbdp: Rename mode_change to
 phy_needs_reinit
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-rockchip-usbdp-cleanup-v13-18-6cb3e769d4c5@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1831;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=KsztTcLL1hh9As65BcDTh5Y7TjOnYb7YivozEbWiMmA=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpWjVDMasSM5tZO04D8eI8/xlSbGyK/r2RXz
 LkdgeaQfIV6o4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqVo1QAAoJENju1/PI
 O/qa6LQP/3SP95HlK/XgRh8lWAXEWwzW0x3rp1NOjrRh9Rk15Xqx6RyaRPa02kjkzI4g+myqy6m
 cgWO1PeF8ujVY7E8RIpq/hZvVdleHRsIHA/DfBvFhBpOzRR9BMHFcTkLYDSneGw4ZZvNPsZhHyd
 QFFXSkDhJzwt25XHPWnnS0T5u5nJBpWl2rN/TSwLg67RvLko8iHvib7HqOFpHw1QLERJM3A8zAh
 QuHLvBvC2c0+RZS8tyAnh7U1FmHpT8tS8U1jZcuEoehkkuUvDzjqPF02uasEksf2ANY5LZvfpyN
 UhyRG6M4V7zR689Q7/UFN+aewtGEyrjo6dM5ln9SL0M8sSZF3SuGIVLZAfYojg2tKmJ/zFdy0qG
 6dZy9zkLYMI9kc3mapoS4PVpnKR2NdWcyhIeF1S2p80AmEEsKvJpYRzlIfI12fYFHjU/av+CKYB
 diQdUpJJB7O/VZ5jJlQm8xc8fbVhLYDW6jT+4IIBcG1UAKb23740zCV+oPzSiY8uoUKAj849oAh
 cy8Lup/NwoVThnSlsK4z2w6RykjvMk+L77zdqnuUzbHIzh9LdjhNtpPZmWIVXJ9nUwEs2OKSQLl
 URnkAPMxNTjbJ2NZ8r7kttvXorql9XaU51pYjb0CbLAAF8vGkBtemGE4txDgEt90OTmGaHcpUQX
 dXMYLajiDIBQppKozwooqOQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Right now the mode_change property is set whenever the mode changes
between USB-only, DP-only and USB-DP. It is needed, because on any
mode change the PHY needs to be re-initialized. Apparently at least
DP also requires a re-init when the cable orientation is changed,
which is currently not being done (except when the orientation switch
also involves a mode change). Prepare for this by renaming mode_change
to phy_needs_reinit.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 24108816e3b9..e44d19c9d119 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -171,7 +171,7 @@ struct rk_udphy {
 
 	/* PHY status management */
 	bool flip;
-	bool mode_change;
+	bool phy_needs_reinit;
 	u8 mode;
 	u8 status;
 
@@ -578,7 +578,7 @@ static void rk_udphy_mode_set(struct rk_udphy *udphy, u8 mode)
 	if (udphy->mode == mode)
 		return;
 
-	udphy->mode_change = true;
+	udphy->phy_needs_reinit = true;
 	udphy->mode = mode;
 }
 
@@ -951,15 +951,15 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 
 		if (udphy->mode & UDPHY_MODE_USB)
 			rk_udphy_u3_port_disable(udphy, false);
-		udphy->mode_change = false;
-	} else if (udphy->mode_change) {
+		udphy->phy_needs_reinit = false;
+	} else if (udphy->phy_needs_reinit) {
 		if (udphy->mode == UDPHY_MODE_DP)
 			rk_udphy_u3_port_disable(udphy, true);
 
 		ret = rk_udphy_init(udphy);
 		if (ret)
 			return ret;
-		udphy->mode_change = false;
+		udphy->phy_needs_reinit = false;
 	}
 
 	udphy->status |= mode;

-- 
2.53.0

