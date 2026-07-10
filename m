Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E8C43D4E0;
	Fri, 10 Jul 2026 16:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783701989; cv=none; b=I38DuaEWG9KoafHpi4wiwzTb2exsXWDHPvzwyaiLhl2Zxb19nbL4GHip61amXUc2lcbQf/MLE/uFBqrEQ+5ww1YZSXZlw3WWiD79Kwn9gDKNZW9wkGIze8BaBI199E9yRMheFUWHJa1EZUM/Opjk4xz11YXO4IsCnsBs9ILRLHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783701989; c=relaxed/simple;
	bh=DGHAo+/yHQUfg6E5xfAgVJta4NhbAYv3HkIdYgaZpOw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cvXR9vBeoPjKU2uwoK1jzLgQrHCcEf8h/ajWsSMaLdilMUIQB0z2YLOui69ZKyJIX+et63CAXSrVBhcckWiI+Q3Og8jLeqbKu9wzAEVeNtltp1DEE77DBtOK/HuxXPvq7tpF5wq08Rxy/qETPxSJDjRUQtTybN+DfonJtLCJ8Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=KzDmIZX3; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="KzDmIZX3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783701978;
	bh=DGHAo+/yHQUfg6E5xfAgVJta4NhbAYv3HkIdYgaZpOw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KzDmIZX3putH81KgjXWlXnyxTi2mhribSwkvpPrfTXZyay5hP0ogBQjfQKKHzcr1F
	 SztVQwIgIV7Bgza4Uo5tNfMNmkLcLi6Bfc/hswibZ0CTvQow0wDSEbb3oyecxTdy9X
	 eYLCM6/aZhesSVYYP8jt2jgl87Qs09LEcbEQiNaowDVNGiGqcL9Zb3lVitsWQH9cJw
	 /s2G/P4aj9tY4J7xrhXLR085W8L7AC9hISkIvhmVpilbxc+TXYPU6nfnQ7YOmlk8HZ
	 aq98HM8m7jpuQlPnceMG59a8S6djSAnPZ2h80HLoOj93ADg3cDZ+gdFi+EAOoczY2d
	 fZsEKCdKz9/mQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A95A217E1011;
	Fri, 10 Jul 2026 18:46:18 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id F0C85480052; Fri, 10 Jul 2026 18:46:17 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 10 Jul 2026 18:44:52 +0200
Subject: [PATCH v12 14/36] phy: rockchip: usbdp: Use FIELD_PREP_WM16_CONST
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-rockchip-usbdp-cleanup-v12-14-8b41a9a9bef0@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1546;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=DGHAo+/yHQUfg6E5xfAgVJta4NhbAYv3HkIdYgaZpOw=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpRIdgOKSeEbxIsi3470NWElA7FdUKIvEWY5
 ZrBwD633kiOqIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqUSHYAAoJENju1/PI
 O/qa5sUP/2j7hUIvErQWNgQwsgK0pHWY5ohB8sDZF/j6UKixIPAfdteYHBgHpmu6DyHM4azAbVv
 3961pX6v+q6qDrUy53mwShdk9mXOIyUcVQUYstBFYOLLjspzSOwhXQwLJa7pRC0DwXc4iPYdJMU
 TJB4Hlga8gdcVbH47aU4P0Dp2/lUtG/igaDj9WPlk0K5fQnPUlmR14/MmaScX3KTg2clPnXgC/O
 XcFh/Eiz3B18NTDbmsvGI/sl6nAThl9Ic90roqbG7lmNCMhuNeH1PhJCOEnqzMsGGKhCYnXL9xo
 NE3OB2EZPajs5GTGkepPrvfQuV/DE49kO2x5z2mRlcXWws+NEqS3x6Fc5e8EihAd34RhUbit0we
 81X/3nz1p/PFQ9PCwtLwvdLzllTWOCNlYQNHhdJooJbqrZKBmI9+G0pICOcuOAUuB8EhroeA6cc
 fCWlm9XpTGfnNaWmW0dtZNwzzOhVBLHmjLjsETR5crq8LZho5d3vO4y0oIpXz0fMkVPIKEKKmtx
 pikSp3yfUsCM7qHpu/t3/SQdwIuSUb0esDme/Ubd4Qc43KurqJbX1sZs5dRp1a4CoH6Rs0SygqF
 xO6I0TYUUwt550SumgG9GpAytyqDSLznQIIlFFsB1nblus7U09mSHbgEMB2cEmt6S54J65irExF
 Yn+gFZqgM9LlS61b9C9cwUg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Cleanup code by replacing open-coded version of FIELD_PREP_WM16_CONST
with the existing helper macro.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 7fb864a1486c..05593e98c16d 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -12,6 +12,7 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/gpio.h>
+#include <linux/hw_bitfield.h>
 #include <linux/mfd/syscon.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
@@ -75,7 +76,6 @@
 #define TRSV_LN2_MON_RX_CDR_DONE_OFFSET		0x1b84	/* trsv_reg06E1 */
 #define TRSV_LN2_MON_RX_CDR_LOCK_DONE		BIT(0)
 
-#define BIT_WRITEABLE_SHIFT			16
 #define PHY_AUX_DP_DATA_POL_NORMAL		0
 #define PHY_AUX_DP_DATA_POL_INVERT		1
 #define PHY_LANE_MUX_USB			0
@@ -104,8 +104,8 @@ struct rk_udphy_grf_reg {
 #define _RK_UDPHY_GEN_GRF_REG(offset, mask, disable, enable) \
 {\
 	offset, \
-	FIELD_PREP_CONST(mask, disable) | (mask << BIT_WRITEABLE_SHIFT), \
-	FIELD_PREP_CONST(mask, enable) | (mask << BIT_WRITEABLE_SHIFT), \
+	FIELD_PREP_WM16_CONST(mask, disable), \
+	FIELD_PREP_WM16_CONST(mask, enable), \
 }
 
 #define RK_UDPHY_GEN_GRF_REG(offset, bitend, bitstart, disable, enable) \

-- 
2.53.0

