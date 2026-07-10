Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4323C43C7A9;
	Fri, 10 Jul 2026 16:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783701990; cv=none; b=X5RJsn5IAfgENzd5Uo6g8/4mCrtwB0eFjB07wghiJ+4f1VWABWnVXsfNVHioQp6tnkGvXvsMZgLc/5hy/VMUpp8WC1GxVEoF5394rUir6IGGmms5XzGWdEfFJUzIIBwnFBUMoMnrTlpNbUy2e0HAZL3aw4lhzrNd8D6MY9y5J7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783701990; c=relaxed/simple;
	bh=MGpikBa/aaqvkv65oP/N23ryrQe5o83Pvtc6osrktIs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hvrhIt7YrJ+t7TqX+bQ1m+qUG98x3Nr1ZPkgFXsbs6nB7jRFzZCgW7oYK7FH0qfnxtH0aiXrDKNAZTHuAkcOmyLsqzk6H639H8P2lrYTOBEqmpIXAP+UbeCmANuNil+ASE2iW1yLIHzY/3QuAMyhRYHKQjEk+iTt9lGYH8Tvn3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=SIhMqYXZ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="SIhMqYXZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783701978;
	bh=MGpikBa/aaqvkv65oP/N23ryrQe5o83Pvtc6osrktIs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SIhMqYXZ8YsbXNvoWhppTMN8LetxDBdfEUHKxq4Ff3ZcvH92nWj60bryBPVZjM4ed
	 nmbLHR6tCnFiZMYTvogVVnHxP0N0i8Yxn6MxNquiXjQ0yMPHGjdqYG8UN2RRkcHvIf
	 QKHUDQQ1JSVAJs9MLqyXOJAoHrYsO0laElOsp+3abnEf9FhG8dQX2JGVQmvHNn7OlU
	 mTdQP1sW4LFmd/wvlH9xBiNTduRUh1RI4qEFblgbmgBjNgXRPOTKegGZ5303gpzREC
	 AzJHvXKNNhvZkcdexbyWMfJh1KraYvsm4Wk30dwwOx+JzEbVbfET+P4IYPVYYDaboR
	 R+zZEGjYmwI/w==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8C3D617E0FAB;
	Fri, 10 Jul 2026 18:46:18 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id E8FEB48003D; Fri, 10 Jul 2026 18:46:17 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 10 Jul 2026 18:44:47 +0200
Subject: [PATCH v12 09/36] phy: rockchip: usbdp: Fix LFPS detect threshold
 control
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-rockchip-usbdp-cleanup-v12-9-8b41a9a9bef0@collabora.com>
References: <20260710-rockchip-usbdp-cleanup-v12-0-8b41a9a9bef0@collabora.com>
In-Reply-To: <20260710-rockchip-usbdp-cleanup-v12-0-8b41a9a9bef0@collabora.com>
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
 William Wu <william.wu@rock-chips.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1521;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=6XR1qE8oQQO8DmAkgt9+gIoazIh1eRLq97pcAr0j0tg=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpRIdhWwk5OJcA4RK90Qpw6OH8LM9Pamhn5k
 Xgw9rZzdHn4yokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqUSHYAAoJENju1/PI
 O/qaaDQP/jCE30hKyl24CTozz6YQn/I7OJIROc3lxxM63PjydjYowzgToobXlEBLn8ShbDXvT7D
 aCAzmBz/e/UfoFYQUXKhEIUhZWTYViaITPvt3E0+7xgWwRtSpUywNbrmgT6GB9ivdxl80vjdFZY
 UoVXwRKTqPJjvMPJhFCiBWm+XPNyGw6coShJK2R9LTNy9NCZXJiJP5FqhSvQLulcP++rjHXCXrH
 CAOTW6k7DuAA6LB1dUo3cBH9sqILgT8z/qBryWHrV2vV9BvZo8MLR6jDGaTysxFEGYAJU5HwoYF
 QJDsJfhKkg4DMDmx6YgjlWDBKzi5SK4bncSNVL+8StF9TzDYVV5ioEqfhyqctgdf4VE64Ar+Hk6
 tO2Sm1+ZjzmPM++iTo2WFTgQI45NgpigArKdWlSEQ/WuKh8Q9XgW0BmJlS9kZgVx4S7slgyKWWE
 jM9gwiEH9sZuRk/DatHhWIV2Pqkb6I/QvmXzXhR10uEnyA0zPiy07GOuVVm70bRcdtAMhovave2
 IcoxoHOm/35LUWRdDR6EhRS0Dmej0BfSaAH6s6vub/+ayx1GSzfzUTGOA/Uit9RI8zHAdBVgnLR
 3+NqdaUlX46ldkNKP0kyKPPlg5lSq2yX1wjvsmjjaOL9ziy2lquPmcxXxYT+boFSP9qKKNjpsS4
 hevpqWeQlU1jz5aTRKConxw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

From: William Wu <william.wu@rock-chips.com>

According to the LFPS Tx Low Power/LFPS Rx Detect Threshold [1],
the device under test(DUT) must not respond if LFPS below the
minimum LFPS Rx Detect Threshold 100mV. Test fail on Rockchip
platforms, because the default LFPS detect threshold is set to
65mV.

The USBDP PHY LFPS detect threshold voltage could be set to
30mV ~ 140mV, and since there could be 10-20% PVT variation,
we set LFPS detect threshold voltage to 110mV.

[1] https://compliance.usb.org/resources/LFPS_Rx_Tx_Low_Power_Compliance_Update_Rev5.pdf

Signed-off-by: William Wu <william.wu@rock-chips.com>
[Taken over from rockchip's kernel tree; the registers are not described
in the TRM]
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index cb6acadfbccf..982315535caf 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -413,7 +413,8 @@ static const struct reg_sequence rk_udphy_init_sequence[] = {
 	{0x0070, 0x7d}, {0x0074, 0x68},
 	{0x0af4, 0x1a}, {0x1af4, 0x1a},
 	{0x0440, 0x3f}, {0x10d4, 0x08},
-	{0x20d4, 0x08}, {0x0024, 0x6e}
+	{0x20d4, 0x08}, {0x0024, 0x6e},
+	{0x09c0, 0x0a}, {0x19c0, 0x0a}
 };
 
 static inline int rk_udphy_grfreg_write(struct regmap *base,

-- 
2.53.0

