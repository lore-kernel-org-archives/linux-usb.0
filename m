Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B8E325704;
	Fri,  3 Jul 2026 18:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783102421; cv=none; b=WzRRKc4Wt919idQvk4uSlbfG5IVgv2GbLUWzjO3F93NJ8d1r7ysBTDhH8HQPUritJSzcyVmm+Hu+j728XBGTrsEcZkQBcE394I4FcU8cM9UrS+2Eh9CQh9h/YnA1sDtG9D+bL98m1Uhq5oE2OtV43n14dtcvdF51NHpmGhbmpY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783102421; c=relaxed/simple;
	bh=p/Hx7Dq61GhbEna9UzxVrHfH1lhodjbwQzayZC0Idd8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FGcumkSaTadhEkCXsXN3svlc38A2gT5z/lwbLQYjipoKke982lfgTEzd0JutG8QW/c2Frqv2d/sDNLWmMKODzk5+cIVyi2E9wQgOlOhSzf2zGO0FLEOjvsV5rL86yvoNY44wtXBAdtfyt9Vo7HHUuVI+7bWLYwlRZ2R4bwlsGKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=lZ7+Icyy; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="lZ7+Icyy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783102413;
	bh=p/Hx7Dq61GhbEna9UzxVrHfH1lhodjbwQzayZC0Idd8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lZ7+Icyy27QEAeV2tXaL7OAt4nR/SVrKFuzGS8XSiFZMBjivU3dG0D4zc4jItvS5w
	 U5lqkiOOlKDZlE9OWtGgVgGsZ/jpr0IiS3cXAqaKRURp2hVTi/TmBWRfMJyfCwEa+4
	 cMH29kIS9R0CfXpxglwnGPYdFqY6mBfteuLrLcfC6+QIgXMrUyfSnKhcQe2ozNovP8
	 3u60cRTFllWq9pI0B1/I6M1oE8ARhaY3wZVGiuc1Ma/85ebaLUqaHbivd2//VEKixy
	 ar0crO0aVNvU6qgzGaHfEZmAJx2Ukc/7ELsvKmNs0Nc4QdGc0v1oPDVwHbqi5ZnlNA
	 fyWC6vIEoAFIA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5483A17E14FA;
	Fri,  3 Jul 2026 20:13:33 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 8B28C48004C; Fri, 03 Jul 2026 20:13:32 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 03 Jul 2026 20:13:28 +0200
Subject: [PATCH v10 12/36] phy: rockchip: usbdp: Limit DP lane count to
 muxed lanes
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-rockchip-usbdp-cleanup-v10-12-a392711ca8a9@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1284;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=p/Hx7Dq61GhbEna9UzxVrHfH1lhodjbwQzayZC0Idd8=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpH+8tang9OFoUOZTiYUvcaD8wtXcSWpdWVn
 cf8CKqVS3294IkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqR/vLAAoJENju1/PI
 O/qaduMQAIg/uOy1vc7hka2v4Ap85+j5xdtMYfY5kF5eeyn/CvaASbkyUSq+HS0wY5ydFCbQ4FB
 hen7ipAB699fQbNZo+9cP2ZuBvA6RTI98zZEkIZF7erWI4JCz7NDOqfe6scSKPB7v3tAqWmbb03
 hQy0m2uVSO+LBEReUsZtotURfYtGcyw7e4vdfWZZmkvo8xxUwW1Ro2xDRJ7nEp+F1aUZ25ekU5C
 IMo+xs2w5vTcWo9ww6xTmJSZzRKkRAZ44idjRkRF7IwJTYXJ4XgXlXb8PKkOlzequ69VE1qqYVH
 ekSaRFCDE8WoEX4FKKzRyKwA4L/Lh+f5hOO7pwakGHoxQqtKbZzNhuSCP2LxWa0K0g8yksdJfr0
 dUJydvciIy37kfIkSuIKZhfLpVyjEQn7Oim/75lKOa4IXVt4fgJVpYyRR+R6VgUBEDIWbkXyOwQ
 iFmY0bob3qG+iifLHA0HPkEip2yyFd13w4uKYqWArnK6D7/nuWmx0RikKRBIleVEMz4v+sc1ajI
 subZs1OcNwO9Z9cmrtDYK54uiehfh0sEEDI9GUOSzbDI19cODBjP2XWe6MkSc6+1g/CMYbU5e0A
 DmcVbwYPpWicwvgQjQmAvHGAoOpR9+68N5b8EeweoutrIY1cXxW04Yghx60l5SYgUhZeq1S6qjY
 cWAPkfuaJmS0l5HpCJkYw6Q==
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

