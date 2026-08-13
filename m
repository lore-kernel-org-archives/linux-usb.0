Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B3643550B;
	Thu, 13 Aug 2026 20:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786654320; cv=none; b=pOGvXN1VNRin6mzh7GmzsWeRkbAn3LIwD4U7CtQUDC3VN+ckV0NmxK/QHW19WB/fwmwGnw+656OakEQOvbHGM5qzgny/YIw/W1H7YBYo+dHzmBvXHS7N5gNSZzZprd04D6yh8mWFvoPKSgK05BVySKsxVylffwUJbd5sbKrn7NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786654320; c=relaxed/simple;
	bh=PXHKMSpYVZHMssue5abhVvAacRo3zKsN2PEAz7q2k88=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hpzcpx2EHsvNxRm1QDx4VWvxDwVn7SrzbA+AVIfrjp1Z+Flakm/ZhMZ82lYnaH5sYC18QXCLkcID/uEdl/sMQZ+QLeK4qJ7TJKnO1sEjFz5/++aH5yKb8tSExhVefIkS3AQmH7xfCYijQIgE9DBZlMjMKH4qtU1TheqzyhWZfbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=M1XWqRmE; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="M1XWqRmE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786654310;
	bh=PXHKMSpYVZHMssue5abhVvAacRo3zKsN2PEAz7q2k88=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=M1XWqRmEXL/1hgKUjegDo1tJM2/vXFQ/USvV/y6BwDPat9oxzZE0FUhZQHeKGOIr+
	 SJxXURM88dtTD/mnwUbOX2F90eYk5Uvqa62QPxdkyExrmNty7zzIMPSdmEBZlL5K/S
	 xkAlGWqLBCyhC5mwR/N740f0i8iytH1T/aSvSQovNdgCsA5ogGkARoE5OlCUtxo+VU
	 sK2VR/oFwQpTj3TDwpIfSMrGchxeAC7M2L5jVYa4yCWw3uFXtwq6VGb8EXngd5Pupu
	 IFN5JoFSssmFnkAIz+5UVwG3zrtlAIJBtLnKpWCBOqtVgB/KMkbmf5Ak+d3g97BcUz
	 PFBCIjS+B80DA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3B9D917E10B0;
	Thu, 13 Aug 2026 22:51:50 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id A00CD48003A; Thu, 13 Aug 2026 22:51:49 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 13 Aug 2026 22:51:51 +0200
Subject: [PATCH v14 08/38] phy: rockchip: usbdp: Amend SSC modulation
 deviation
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-rockchip-usbdp-cleanup-v14-8-b5ad9c68fa11@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1834;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=HXiyKQzOLebOOViqA6Mhv+EF+Z5glMQZ2bbr98+itxg=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGp+LmSYtRoSoEg0ZTDO5fabpfj/P1r607QVu
 75k8FLfTb2FFokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqfi5kAAoJENju1/PI
 O/qa9PEP/1Z/BRuSVyn3Y+rLLEC1WgReYHsY/dRJu2M4i60h18lam7lLWVJtBudDncRD+ArWgUT
 5mjY5/PeF83oZ6knEuwPU2baffc2098St7QS55N2F807aqB4alIaXJjxIHWEZb+n02U3GRVmnhv
 LjkJYZEIpu6LtAE96oPFEtaBIwRkvWJOCUvIpNq6yU+GWr+8cJEfVq22eTOMAN1ESPkchhdnZey
 ZJYGBbSwTueWbih56nX/765xf9k0RqRyTYCZiRsoQIR+dqoYfqdsLLJFuZK7eg+2OqjY4d8ZuwP
 YB/RBzQWE0uwfI7NclIybxTq0RFGaJLPy+rV2k38GLnFQX3hoHuCEmuzvkz0sAKA490JTDn5+68
 YFv3kS2l6jqMqDd6WWG1A8jWIsqYoz/wDfLziPyHLGXC1gFrguNW2tNHfMnkz5QIijrAcyKA5BH
 kPYiNUyJIkEMO+yj9sjc/uz/KhwQAQ63gEBJAKQgp3lAW6bgimCNie4klQWfjS4luw+4mXBODZM
 LVkIgdBAE0BkGltv5LdbiLMRSl3YP1soRurdHK31oCdRoyydWG480XP5q8+WwA/MIHDvRGkzO5Y
 HH8MVXaxfoDFqkiE4gGmXyF8gRuHghtZBzrcWMFXPRoLiphD0hxoZM8PF+AXAAWYvbw3oF1BkNo
 6yf9zGaFsQhs9dl+xc+ww6Q==
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
Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
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

