Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187623B71C4;
	Thu,  9 Jul 2026 19:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783623757; cv=none; b=eqmG4bA+OhFIkM4or89+rgaYy1KeIqt3oNApDa0SxDTLdcmF+OBCqvBFM1o40s2Ph0wmrqVfqdLMGzYahKA/R7o6+sE2JmJA2/nRjc1BTkSfGGJ9rQEJZWR2lhRzEbxIli/vXKtZ4qVDwYyPhtBYPRjW55ftXB2gvJ9SL48O+LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783623757; c=relaxed/simple;
	bh=MGpikBa/aaqvkv65oP/N23ryrQe5o83Pvtc6osrktIs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ccXQAxeBTDRvzgbvrXIRasdoxFeKNB5VHBE9Ewgc429/clPQEFCEEB8dHkgPj4rzDSQArIBFXot/H4C52MrXWPPmVBcmCBCUK2y7OugH3paQkL69q2a25ITEzfBClLjHu3yTE4FyYJd+zqa2XiTW2xoK2tW7DUX9is71S7wHKwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=bfdXE/qM; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="bfdXE/qM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783623750;
	bh=MGpikBa/aaqvkv65oP/N23ryrQe5o83Pvtc6osrktIs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bfdXE/qMu06MEV3keqrnbIHc45LkcEkO+v0QUJSPixX3kl7LJ61GSyRJvfE6NGv2p
	 DQoClxt/DT9Nw+rJ3JaxbTZf5aSufZNQiKx7IUOoEV48xO6We/d7Q5UvR9IazjJH2e
	 aU1ObR/qmNXrSvSW4Pj59JvfbVyg8s07NY64IbM78JxJEAcC9RDD8Yfw9o/MiiyRgE
	 IWJuMGSSIVawYWyOtRMjqMULRJN4XZSEzV4WBOC1DPzrTbjeGD2/cq0XPsphfttTUw
	 +03w/NhhHOqgMTze4WhPt2pN9MiLV/TSZzH6Sp9zzrh8CeCB9T+yT0nyeEewHunRZQ
	 bRSvk2Hp4Q7KA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5C50F17E0F07;
	Thu, 09 Jul 2026 21:02:30 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id AEF4248003D; Thu, 09 Jul 2026 21:02:29 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 09 Jul 2026 21:02:32 +0200
Subject: [PATCH v11 09/36] phy: rockchip: usbdp: Fix LFPS detect threshold
 control
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-rockchip-usbdp-cleanup-v11-9-a149ac60f76c@collabora.com>
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
 William Wu <william.wu@rock-chips.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1521;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=6XR1qE8oQQO8DmAkgt9+gIoazIh1eRLq97pcAr0j0tg=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpP8EQ6+m3m2zcJYFXdZZs8fSZUTdzI9BVel
 AbhX5+lHFtRyYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqT/BEAAoJENju1/PI
 O/qafhQQAJPGYHdwUANq63CnePHUSH5D9LKcIEPmB4RgyVoqltMwGyI0sNRXW1M7bt5ZLqbwuna
 GMI8Mi1HtYICVg/9Qa+WoN3TUdKpXRyGa5G6J5yWlCUkXGcpaIGpAbD/ZTGX3awQaRv/qbhLd53
 ao5+28cMCoJAdFqwWYoyiLsHGQ1BA1sBc5AnkO6dcZYwHrft350GFUrG1TzIizZoc77vmZr1oHD
 CyUAMudJRsjA2vpJBzOFV9l/NRUyQEFKYcy1IGJ4hS4r0Xpw6N+6LaOdWmhhU+xjEL0G3y+9hdc
 xr5EzufrfYOgTSXnBLvRUx+lG67K1xklsJRZ/B09Hqj15Y4TNGRnz7tbksj3Zszm9ohiROOsDaP
 ZVq42jmNZeFYNrw7mi58ecPlkVVXIlxf6lJDNcvXjq70mZA8URHS/McvGxOMloat3V7i9Dscqu7
 wdkbPp/EY5XlmsRrlP47m6arzs8rWXn7p29G5G18tSC6+aDvsRnCQPHM3E1cTFdkB//rHHRaCgX
 drdz0zNenWZC3PqMWCNNpqwF76Kf6yzlAHsrQrXPGnxQZGsGn7bBimRSCEA+NqbheRB8nLZuwMD
 JyVyGqkkMKSvNjFgziHUQtot/LfkVJkjwM5zYb3x/NH+Lc50yn+DKGZ+8fAnAjiqpvEd0T0NoF4
 40+qt223BzOWQJ6t2YU4zMQ==
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

