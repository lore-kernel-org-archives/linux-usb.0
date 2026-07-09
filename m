Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6163B8D6C;
	Thu,  9 Jul 2026 19:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783623757; cv=none; b=odgxCqmOgVtP6sxxLjXI4hgAEla9KPBN80mN3mqtBMY0qgSX2gZLaJJu29/WtUPN7VREcKOS+FxStwOV4QGVlyDTO/RrXq0oNfQG+eQ0gLqcEMJTVYDuTqSlcLNyrvkLLiqa1dULH2Hx+3YWjwvzZwulY4DBNXpFqpli8DCiKhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783623757; c=relaxed/simple;
	bh=p/Hx7Dq61GhbEna9UzxVrHfH1lhodjbwQzayZC0Idd8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rdBdM/VX7gso5GFQRpJbXNzRxvyCQ0qpN3MkOiOYe9mObgC4BmyUAMi0JWWRpgmDTbnzDxaIw5zwUC4WJiC95pf406q5jtZxMHOj9oIm5h/I9GGGj4aWLKYJr2h9urZa/1Lmx2GcAV9uNcdhrbLRtUX0BTMjyAuPMdcNwLwQ4jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=YC/NcoEb; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="YC/NcoEb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783623750;
	bh=p/Hx7Dq61GhbEna9UzxVrHfH1lhodjbwQzayZC0Idd8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YC/NcoEbct78V+3LPyznbl3lh1wftkMy6TqkoFVlzjMTlW9vnX/rmCmO9RYISIibB
	 joVD4vQ9tlPHUQ1i1cliTmod/jD9+Af76VePpN4U4PU0tPXIi7OKfG4PzDIMW3sUn1
	 thPY84rz5fBIhZd+00cVYgSAHtUwZ63O8SfujjDZICttICTWJs2z0Kb1XAk9Xe7OGF
	 fJhZ+H8Ju/tLXbLu1CyW04QaRPSf7BSzhyicj96GemiF+vNh4RoKhVL663H8Tv10Ve
	 JgmVJmUsRCMFujw8K3V494u4xUFaoFhdVJSbsT4KA9o1mpb+c1csW1Q48dqbnDVapx
	 cRPJrlX20QGQQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 696D517E0FAC;
	Thu, 09 Jul 2026 21:02:30 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id B391E48004C; Thu, 09 Jul 2026 21:02:29 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 09 Jul 2026 21:02:35 +0200
Subject: [PATCH v11 12/36] phy: rockchip: usbdp: Limit DP lane count to
 muxed lanes
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-rockchip-usbdp-cleanup-v11-12-a149ac60f76c@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1284;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=p/Hx7Dq61GhbEna9UzxVrHfH1lhodjbwQzayZC0Idd8=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpP8ESKPj/XV+2Z88+Bn6UM6iI/oRd89mqfw
 RtlEO8DTX1HLokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqT/BEAAoJENju1/PI
 O/qalmYP/RmL9IV30dIBbir8J5h8gte9N3vzdgLGUlAMRqmOLHoaHN/xzlRQdWJqdrxtLp1vwLz
 Q3hUvlB7AFbYM1S0Sx0a+Q+evmKepipjqIZb/9Wv8puiHIFpooFIpV9MFtcCqV4qrXwPcrnB+mB
 RRJuLlBkKktY+Y1LMncf1Vj7O+zhbKG+Z5WclRcThOH6t9qeuyvAOY7Kk6tsdmHy4GukwW+pvI2
 LdlKdkpK/8U0nxwwqZfA4Pz486Y/Q5G0jfVx+xblZDGKC8kGntw/eu/ZJO7L+8bgebnaucqR/ES
 23f01sx1z4cfRx52s8adtMXZy/Ma149hGr+mFUxqfr7U+pvbHhR41bOgYWmRSgeKdK9QqliR/mr
 M6dHOPQojJs36rsRlOueBwOkxPsW8gTWnUlGS0ycKWbqj3Y7pwAi9hUlXVhBsiLaE0+ruQSl8ql
 eWO0bAXEHYphazfOFEEwn1zpDs3bzAkXnI+L3AJFSaKKtXtg2UGdE4UupNi+fNohwnjVl1Ma9ra
 g6psV+ViyTGhbnthTFtWHAKPcP1va+nW+4tqO7jRokHkm/LPL2sqfsVyzDoqr1jRL7hFc7otkH6
 ZVyForCwbMFxISg/lcLU0xnN2GEPy9Wjy3mUDpBDTsKoWrC0Jq/gG4VrrJf9iVKT0zzIyydnaHK
 mGKFHAvfsnW2C5NCtUfo9+A==
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

