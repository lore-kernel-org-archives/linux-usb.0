Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A9041F36F;
	Tue, 14 Jul 2026 19:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784057181; cv=none; b=IndTmHac4E97L1zW9rjhMbiKVkojNkHTuW91imCWoCQC79O5pUv+mURpm/SXnI5XFy8wgBd2D+yfK/BK25k/UsDW+MY/7Jjvpt9M/XW5gUa7kCK6NMHa6FiROlwkZWr8Wbrh54hjv/7OpsPnlv0DDwaBxatMIA6oJuFDMZlYVVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784057181; c=relaxed/simple;
	bh=MGpikBa/aaqvkv65oP/N23ryrQe5o83Pvtc6osrktIs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S5A5LMIflRXCW+RJsGD2k5OmDxyTfuqcJH4mt1KycYhEWbkuA/W6C+WUXFTJyXUF4Tc6IYcprLaa6jz8qsknfOFjeo+1HBN07WSltFxcSyAWphIU6VWqHIX6E+DwhTKgmfMJ41JXzJa10MlM8RrOqbXp1XX4UjjXl+vOpeNLcX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Xuju2Wyw; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Xuju2Wyw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784057169;
	bh=MGpikBa/aaqvkv65oP/N23ryrQe5o83Pvtc6osrktIs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Xuju2WywpFtui/Z2oN2alMAQa34o5piASKxOQflLVuMm4btZz5hgo5LsXLN7hQPic
	 rGDebKq/3XHdlOMDj67RXV7o7QchCiWQ+o33xG0btMhtWt0oEhRHHdkpPjPlHOy2IE
	 GAD5ZcGby6L8byqJ9j8yQtS5sKm/HFCF9akapjS57YzG3pp1QPjy2yBBKyEckcU+WS
	 NeuryE90UpVEIoDMrFbw58fRrOQYqnGqJpZxKX3Xi4OmrVAwPpngG6sOPBR+Dx15RZ
	 F+Hqyh+enA7uOvVlnUEch3DRaH4mJ9yChIBCBOpMErrkQamlPYkBCbhn2X2FciHHzh
	 /Ad0wstgecMNw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8609617E0FC9;
	Tue, 14 Jul 2026 21:26:09 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id DA28348003D; Tue, 14 Jul 2026 21:26:08 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 14 Jul 2026 21:26:10 +0200
Subject: [PATCH v13 09/35] phy: rockchip: usbdp: Fix LFPS detect threshold
 control
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-rockchip-usbdp-cleanup-v13-9-6cb3e769d4c5@collabora.com>
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
 William Wu <william.wu@rock-chips.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1521;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=6XR1qE8oQQO8DmAkgt9+gIoazIh1eRLq97pcAr0j0tg=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpWjU9kvXXCFcWCsGLP/icPkll7F0LFFXimL
 aWpjzH3VER5wIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqVo1PAAoJENju1/PI
 O/qaSpAP/RB3hJESZ+hiCzmQA5DrQM0y68edl734dfmkOatL/AFakFFDU0pxs2sG8YyHte17fBC
 oWw75hbXztb+db7z53HsZQ4F87sfqviKmc0DhSG5ubVZRVI8CHQSr+BMWDAfRd+kgLfktxHxgo1
 ZkYrNDiZoX5Or6L1ehiuE5nBBDRsqz1T8cc7fgppH8TqLgrZgr/s5ZkOYNh3VH2Mi4lpqm+Qimo
 +JOONf4Dq23CYskYAQkLSbaT6EJvnzyzZHhzV7oe9tkW19bYQQuxwTcxnXi+2XZma4KW+9X+4oD
 8Cg9VZ+9zaffQfghI/86qMm3PzY1Kspmq/c4AvCsAEgcAkU8hWlNRNCsiIZptq53pY/4ZMZLXRE
 X7vjsw2j5GW1oYYZafdwySKowuAMiyn5IP5YK2cNu0k3Dhcx5LWENC6kOTUIh9dqpl0yml59SJg
 8kjO0bct7MIkVf9u4skfyz1mUlRDF0Iqg+KSAiPrkGuvHz6hxIhAGF/1Rtqzcb2mM/IxGrXMLue
 bcPVyBezyfNrgd+51MStCp4jGkPQmKaLVPAeCp5pXIkrO3oWuKi49LTvpgxfwQpP4eXbQ67dtLH
 oEx66AKQTcpP0atmzwEuKnXJt7XRpKENg06cnddnNLqx3DS7DqJhjqOXY6iXnKmfMoRDapum6YC
 FgjX0wEXCVtkSo0SF9oAtNw==
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

