Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FFCC41F37D;
	Tue, 14 Jul 2026 19:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784057180; cv=none; b=je5fe2ddnE+/zb8dV5NQ7Sas4LU8c4qRhZMIM7GiYtMt7340nRB+9+8UdXwnYjSfYeUZQT5/HXbl1xRpkBCpzi/FKcemn19uId22vaOQ4qOmJb2xh9C0iar1923BM6vhz7QLq2pVrEtLhkPrNU4QLD3ZCDwodM2YgDGgeyktesg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784057180; c=relaxed/simple;
	bh=p/Hx7Dq61GhbEna9UzxVrHfH1lhodjbwQzayZC0Idd8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SwKoLiPFXoFzwDHVhNLqNzF+2o+x+zRPohiNCWpoYDYky3CXJVuQCfyg+njUQYFXdmUKuHIi7H9T1kElJyWO0kDKDbLs0VSwIPqqKX+NzvKQcWNZ3U6lf+rv7JOCBmMrXVYTUVb225bhUZ/aVwjcQeEb0V+41OtVmeIuhgnIFb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=VTzqebID; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="VTzqebID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784057169;
	bh=p/Hx7Dq61GhbEna9UzxVrHfH1lhodjbwQzayZC0Idd8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VTzqebIDv1ZSojFoIqdnWt25OaJUQQ5tvYIr8goZFxoEZKLsYstzzH18kyGKS617/
	 AnHMJO00PLjh0W/MnvkVG3q6Cz6faVwdCNcaFpaAIcpJ41OrsxEqgfSsHyxAbnAge4
	 T/g/m5vrtlrqCRMTGsIn56b9J9Gy9SPgd+Ew6t+a6V0li55yMmsPAbKYCwtPESRknM
	 cyIXrA5EfpTt0Tsl+AHThMC4SbwOwd1UpbJW1A+ahr1vyr28N+iGfWkFObIW/p+gVL
	 vrtRqegpEXTRiQhwYclMD46x5oBj2ACe6vZGc7PCkgYRm0bLdlpoAYLNmr7jojxaRf
	 HRsfZWH0kT2Qw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 93C0B17E1006;
	Tue, 14 Jul 2026 21:26:09 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id DF60148004C; Tue, 14 Jul 2026 21:26:08 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 14 Jul 2026 21:26:13 +0200
Subject: [PATCH v13 12/35] phy: rockchip: usbdp: Limit DP lane count to
 muxed lanes
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-rockchip-usbdp-cleanup-v13-12-6cb3e769d4c5@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1284;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=p/Hx7Dq61GhbEna9UzxVrHfH1lhodjbwQzayZC0Idd8=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpWjU8sL+GNNtHpLXEM4MzDJ5cFXYELB/2m7
 Q0EcBtXP1Ghs4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqVo1PAAoJENju1/PI
 O/qaw7UP/iznD1gZyLHaL62P9kRPOgBf4ekeNuwGvU0+4NOqIYl9Kxt1AQJm4y0aV0TA9SoPywI
 m1yqN2dd8Unk2G0HMmCOAZ+7Im9zU0kWg2aUtFADBA9HwW5tpQ29ou6p7LYKnLOR5qkOQCoyVHt
 wcKv/0wzGy+VdUC5EqysyyfYNgXxboOzl8IkVkAVOkBoqMsKvLoTZXdf4/jCaU8w/d8JBb1NiXY
 hhpwLEwZAGWfdr78JKmq+g1xAFwugfs7mjr6PJEvS8mJ9EQqJCpSRujQHUaNtEc0RVNe4bfK8ES
 YBFx9wwKR23rjLUwxk9kqyEJGcOZOTWfG7e1HwHMdPymqwitd4ZYUqyj8ysMDeac/DZOPZ4Kt1m
 ZCC4/IKNer1RiXRpigWy8RWblsw7+M0d/6TpnRAmnotCiPlQK1gx8GqFSYGMOhZdDzlKsTyO0Zd
 BkdYdwa+mD7xKOX/FPSYhOL49YbgDuDmgXGJr2hK0DIX7ocZnPdJydqneLdEr7YIZAR3zExOSlu
 zekKZn25ZlAzyJxsByortwCf+/ghTsFuiNkdDOQpxI7UvS14gK1DgR3cusArPR8eIPHFqlgmh4d
 KtozIIHZa2TpioAC2919EF9vaTwSlOOwDzErKvlJsc4ydFXnL4sIELgYdhAzCDUbUj8LaXrXucD
 ebs9kJBFTRxKUT6q7wL8a+A==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

In theory the DP controller could request 4 lanes when the PHY is
restricted to 2 lanes as the other half is used by USB3.

With the current user (DW-DP) this cannot happen, but as the check is
cheap and users might change in the future protect things accordingly.
Not doing so would corrupt USB3 usage by the following code configuring
the voltages.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-phy/20260612165546.98E1F1F000E9@smtp.kernel.org/
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index c4d62b234ea8..b172ce6a722e 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1099,6 +1099,9 @@ static int rk_udphy_dp_phy_verify_link_rate(struct rk_udphy *udphy,
 static int rk_udphy_dp_phy_verify_lanes(struct rk_udphy *udphy,
 					struct phy_configure_opts_dp *dp)
 {
+	if (dp->lanes > udphy->dp_lanes)
+		return -EINVAL;
+
 	switch (dp->lanes) {
 	case 1:
 	case 2:

-- 
2.53.0

