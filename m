Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D36A3242BD;
	Fri,  3 Jul 2026 18:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783102420; cv=none; b=rhi62UX9VcuElzEqM4bmUVjWGNMBSOt5oMfEuha30sztxFVJMZWQ4TXHk1Ek/p6IWdcVnjm4MQ5UmTp+Ha/CQtT2GI/kmCJ/+jeXrx4lifzUzceOqz59NREgcxziirJ76fetPcHqFL6FxFNs1CWBNk0xUFjVmR6xyGac2VYlg6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783102420; c=relaxed/simple;
	bh=Cc0K4Dr4eJL0SNbtq8hAs+EI1LLSLgYhEuv3ZarCDYw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RNCEfMKL37aQvufQocop1lhzfg4RxSI/6HpU2vIur3F4I+9oYKIN8nt2tu1DpTLdzejSZc5C8I775I3FUq4VCKORrswZiE8s1ymKv8LkGvgdld2quxGy9tls8cJzdxj3uQomXurlzsgDh8rDhW/kRGWx1HATsDI3FCmYBGzQqT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=E2i19wjl; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="E2i19wjl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783102413;
	bh=Cc0K4Dr4eJL0SNbtq8hAs+EI1LLSLgYhEuv3ZarCDYw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=E2i19wjlq2rsoIHEcnaueaJ/K4dtyshIlXrw+t3C6oboXazurasIunErt+g92oqa2
	 a1tw5z5qncspPhAc2Q1U01vVj0J2JDXNoz0rOBc+0uC3qyIah2+1o2dfLoWDb2HHsP
	 EJy+Sd14zNRBysk12vV2z1/oEV6ncB3KRKJzsL7O3JE+3Pot9Qk5uv6VzcCguQwK8N
	 j+qiwsQuT8oVgFSFtECtYyEwDz7jHgZiDc9354a0EaKOMnFMQpM1W72OnG570b5azF
	 KOm5l6leJ+mioe61/GG1M5UQ4CKA1x8WqR1Hu9bV28fg6QzcbC8coVBzCOsD+HNpZQ
	 Yq6OM9sHU09tA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2EAFE17E128F;
	Fri,  3 Jul 2026 20:13:33 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 84D8C48003A; Fri, 03 Jul 2026 20:13:32 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 03 Jul 2026 20:13:24 +0200
Subject: [PATCH v10 08/36] phy: rockchip: usbdp: Amend SSC modulation
 deviation
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-rockchip-usbdp-cleanup-v10-8-a392711ca8a9@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1765;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=lqHOLnlRChaCaNvIuz6SialOxFJNoEYQ3ZMsuUuJrVw=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpH+8s80/lf8jG4Uams+DOnBXJ9ATr3wING5
 plqkQ9ECJGJ4YkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqR/vLAAoJENju1/PI
 O/qay+0P/3/QN6PVkC3GO+3GojamuYzFiLSjHu4KnD2KF7tC47ZVUFetM5TyvS7lD0a3t5KlbP4
 lIKNDLrU3T9bdRUtc9a9ajhj2XeSMfTjr0AK0LzQDvnNzxyNVXxd/OqkwrVBvnixkVmBHlSljzt
 0Nu0zp7buY9P5GqeurdjWgeEpW9B/KsUIySPLA8EEAf1kPckgaLDAKqjFwEjIfZo3Rbx5gmDk8s
 PwRkycTuDVFn9hg988E3enhYs88hw2vrlvGu3Q9HTVCsmUoOQwswLu9gr+RmXjWCe153ZMpKoOc
 S97LxFIi/eKyK4Em7OSxu/y4Esh5p6NPBojwQZhVvqnZePUW8wVoDC+z6b3Oll+08aY13thWDF0
 +wOQrlZrjJPudq3DeGAkflVVvyHgBeJK96s2506yx6hQ5JiXgv5xtInhObRl8No6bp7oWwkDr+m
 9kfUiydlvYOx5SA0wGOpy0a6YAqz3lG+9mwF4FWDpVM65vyHtgHukz87C7aTryxtQz9VEIlR5ea
 NW+TFzDLP8gQV790MuyxVeDvlfD5c6Q9ALVkdJf7i409BvH+YKQlY73Vy3/LvKvUXHcPZMmoSer
 Y/9vBC3/otNwUy8lbKr/UvaS/6YII3zYmvRrS5eqc1sxq4MM1L+PAg6/L4+Im5aezKi6ZvWZaQs
 j7bEfnqY+zTnYCHq4b4g0xw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

From: Frank Wang <frank.wang@rock-chips.com>

Move SSC modulation deviation into private config of clock

 - 24M: 0x00d4[5:0] = 0x30
 - 26M: 0x00d4[5:0] = 0x33

Signed-off-by: Frank Wang <frank.wang@rock-chips.com>
[Taken over from rockchip's kernel tree; register 0x00d4 is not
described in the TRM]
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index e3f5a26c876a..cb6acadfbccf 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -350,7 +350,8 @@ static const struct reg_sequence rk_udphy_24m_refclk_cfg[] = {
 	{0x0a64, 0xa8}, {0x1a3c, 0xd0},
 	{0x1a44, 0xd0}, {0x1a48, 0x01},
 	{0x1a4c, 0x0d}, {0x1a54, 0xe0},
-	{0x1a5c, 0xe0}, {0x1a64, 0xa8}
+	{0x1a5c, 0xe0}, {0x1a64, 0xa8},
+	{0x00d4, 0x30}
 };
 
 static const struct reg_sequence rk_udphy_26m_refclk_cfg[] = {
@@ -377,7 +378,7 @@ static const struct reg_sequence rk_udphy_26m_refclk_cfg[] = {
 	{0x0c30, 0x0e}, {0x0c48, 0x06},
 	{0x1c30, 0x0e}, {0x1c48, 0x06},
 	{0x028c, 0x18}, {0x0af0, 0x00},
-	{0x1af0, 0x00}
+	{0x1af0, 0x00}, {0x00d4, 0x33}
 };
 
 static const struct reg_sequence rk_udphy_init_sequence[] = {
@@ -412,8 +413,7 @@ static const struct reg_sequence rk_udphy_init_sequence[] = {
 	{0x0070, 0x7d}, {0x0074, 0x68},
 	{0x0af4, 0x1a}, {0x1af4, 0x1a},
 	{0x0440, 0x3f}, {0x10d4, 0x08},
-	{0x20d4, 0x08}, {0x00d4, 0x30},
-	{0x0024, 0x6e},
+	{0x20d4, 0x08}, {0x0024, 0x6e}
 };
 
 static inline int rk_udphy_grfreg_write(struct regmap *base,

-- 
2.53.0

