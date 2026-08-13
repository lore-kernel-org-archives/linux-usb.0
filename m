Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C899A4334B5;
	Thu, 13 Aug 2026 20:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786654323; cv=none; b=gMW2Z6C+Z5P1MPKJosGoznjRQvgf1lFe9iAZ8NJVke9AVcSgfE5VseP2UUAhzNGwg3zsmBhKzYcwOOx3XGTB03m+xjq/HkL1iSDkffCKR/YyJB7wj7rB9MqdByGMtnuzZ2NKDAytbyiMN1T8Jcl5Oapex4wsZZrXdZEZPjWtYag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786654323; c=relaxed/simple;
	bh=d+vGxQVXhNCJ8rbP5aExKtS99bfRBlYn/0PUloa4QH0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NN8CNJ032C9tTwbx196Ztu/BR5GugLffaXUzvtdodGEV6ml64iRbAiHIAgWiIOvFirOfvGnjsDnlLUAAN0nqxe6x3wDRnmlA6/bHdWAyT45InajQog1R9n08/EJzkSYAwnqvneqJgMSmJcNcaHdmuFxpobQwaSLhro49a8nvO2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=X/hrHVl4; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="X/hrHVl4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786654310;
	bh=d+vGxQVXhNCJ8rbP5aExKtS99bfRBlYn/0PUloa4QH0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=X/hrHVl4thqdT8ZRio5q/XXTmLhT1WFe6OCYYUG9fO18eYay86bw26VsX/dbeanhj
	 4PENLUONKFqTUOhW55ry7ARMyk+eGVIo9mEaqQIVvElHlCbJqRTwwwCEivXqBpbqv5
	 UN3+jEnvmhq3BfX3ET0wv/m7BD4oBPtJuVwiS7ucWZ+BLrLM5I3HsI+5FvqZxuLwAY
	 8B6YSA8nkAFLI7V1X44wiv6UZWGBH/CylRxg+o5uk3CQASCX6hVKnNkR3/HMYh2ek5
	 ShPWs8lHnt7Cu49EtZGp2byWFQkGZGJ4PYUaMg2F2OPqQt1HX0s4KeQ7yvnxhMFpwg
	 GOz1iSdEmAElg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4183417E10BE;
	Thu, 13 Aug 2026 22:51:50 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id A195348003D; Thu, 13 Aug 2026 22:51:49 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 13 Aug 2026 22:51:52 +0200
Subject: [PATCH v14 09/38] phy: rockchip: usbdp: Fix LFPS detect threshold
 control
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-rockchip-usbdp-cleanup-v14-9-b5ad9c68fa11@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 William Wu <william.wu@rock-chips.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1590;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=jqk8lmE8/yQnrP3NdFs0iqp55s5naGRZj6PxeCD9eM8=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGp+LmQm4F1raePEo8QwGFNO9cG97bYItivXS
 LaeWnivAEpSV4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqfi5kAAoJENju1/PI
 O/qaPpIP/1TBR81PN/x8AeIVjBEeAGS5G7jOc8nJRRYXHckW5ceHyp8zeE+hZjNz4N/tJ9lDqeM
 3FM3aVwylQTcDJXiN0fB5+Y7671cif0gvX9PZ3QcmoJpiwlN7/sdTiiiDSZ27AWHeUL8O09VDHe
 xCpyO6x3gagadiDyI6CymtijX5wAWAqihHTIZt2k/6PmumesKe4dtGyMJj5kH2pYl71vRUrvz++
 HM6cSKFJ0nD6avWcYXVxaYwuhhvKvebMA6U11rWpBqmR0kPyFaeZ20o56Ao4UAFSYd3tHcGunSE
 5QvrFAmHa0rYzZqt4CRNHiH4C4nzxV7VTaaTP9Wn07r8TICaZFLFUeVHi9d55OBUtHIoYeXNEQs
 fEXnix/wRaZBMzD0toKfutYzgcPGsYEacgqzevP7VoG+yx19nfo1qtynWjdzk092GE6HTvf7rHt
 I6QX/UmJgKfY8HtLz8UJRRwYqenU3H2C8vJNgi1Xkcq3tyCL4VHeoKkgfI4NHGiZGjV3i+PtPB5
 hNJ5EPn9qzDlgvYjEsS2XcME1P5A3dLHYcsYILB+zONveC23Vn+qUnHDrQ7hoqoD0ff0WzJPpR3
 vTD+BPfbOjw0MS9y8r/r5uZVRaGnmWhv0Qyaa9XlqWZohh/gdihrwI03LP3TCJNVYE0u9fyYzwo
 r65sMwSOfbSWB8Q7ialM3hQ==
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
Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
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

