Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF5A33CEA8;
	Fri,  3 Jul 2026 18:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783102424; cv=none; b=opjkXoTnIj1lRU3Z1yqzLCMZGQnnB+v3r5AdpUIJphTtwPqGk9rZllMqm80nqeiw4SNdVm1XBq4J4yg6og3kn89Wcd+/cIbt7gIJj8ZhVl+hx3Lg77NC9ksIUn4ps5E8Kwdy2OHc+pC5Qev+nxl3ieQy2rYm/7P2P4Fl3afzcI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783102424; c=relaxed/simple;
	bh=FzxdooW9D7IYkJPvtynhOqwEPTbYTO3x1SBymELs+Bc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TlvLj6a5itcUIlNyH7jK7jUWzNAy0PPyb29jlKXvxFB9Bjk0RzeJHPIxVOqgrSNBst6rYYbqITbyRdyOh2MYP6kXRu3MU4fIm55eYVlmGMl8xPXXARwxpsyo+euDUJ7bHkRfEXeO5L0cozWSGgN3Oloc2UVXowm2ZfRFZwX9gq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=nROg/1JB; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="nROg/1JB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783102413;
	bh=FzxdooW9D7IYkJPvtynhOqwEPTbYTO3x1SBymELs+Bc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nROg/1JBzj6ig9vyGa49wJrY4Aolt19AgRsUzfuDvBjZxKSl53PETt55xhCbbYPOb
	 kSVqnG3yahRlBTRJhOQ+CbPyMNUfhGc2PG53omC3V9+g5bjDVyEyZdtDSigGZyO2FZ
	 i0coQn1jDWsVPt7ynnFVrKOtbuuch89yeNmx6VW2pQqEXQ63pGRGexC2IE6hs/hNVP
	 E9d/l7zMkQpTRLvaUEjtvZL0DOMGW5KN2NDD5sSlRKtpSTsTXEVjPl4LDov+MBJVSM
	 FByM7u71HPP1yp+dwpLbhcgQs7B0bdk8/CwmNbsanRUPaXQwFs2U6i5S7nuPcKEwvw
	 XewnH3PJRKBVw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 77BFA17E1510;
	Fri,  3 Jul 2026 20:13:33 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 9152E480061; Fri, 03 Jul 2026 20:13:32 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 03 Jul 2026 20:13:32 +0200
Subject: [PATCH v10 16/36] phy: rockchip: usbdp: Register DP aux bridge
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-rockchip-usbdp-cleanup-v10-16-a392711ca8a9@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3189;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=FzxdooW9D7IYkJPvtynhOqwEPTbYTO3x1SBymELs+Bc=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpH+8tjaSyQyQjkeUtLRIMvFmu/1lPPET/Iy
 WvMeKWefQiEHokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqR/vLAAoJENju1/PI
 O/qa5BoP/inilHilDwPlAK1h623qgP0dhGVkV2z/4S5kD6UUoInj8rV4tHGb24d3BuVavoRmuCK
 sxAz3yQbTY9rkkvamHQnALh7ZmNS8SPabxbCSkBJRVlt1VZPKtG6OOkkos/YJ3rTDovdUibqzdH
 UEzgQ3neAUmfBB2UAXYRoZtTc2A7JwGS2R2u/5v6MPI/U5H+TQhaMvMKKV4qOmwfkC00+pUi2Wd
 OupDIN/M5leW/KVu0YZm/lNFrReRxke0zcFv58NAXQhkQahsxj/0ajOhgTaL6djSdKSLJvb/6Wd
 0lOgQvaXdU+g0pIOJdytTIoI1WyrQilJUqliH7AhHx/7fSSvjt37scjmF9nJCINmDjEczYMSm+E
 J25KZu8g1/+T1kHQRBSjSEEcovrTqb8CLp4liRt3CmSrAn/c8gllyBJVqLB0FpDz2y3lFfVWLKo
 MrlwcMMva3hWCUKqafGvAk+6U+norYbv9db+Hl1WBiJ8atG2BkeoN4ISIzBoIj8OCkdd1R7b6Pr
 +gqLRjT/Q+ZMl6aiC8/mEJnlKdYPIIqtIqF4f6xG2MvACBb0ddpAYXD2jzw5QfBUzVgFtElvxGy
 pmvQYkSjmIr22yROhExahZ4tIcBLqNmQW/rAE6YAkHRL2TzQjXRSqbgrw+rsnl8/W9Bj501h8xK
 ftkNdKrY9fMGXPyJuW68txA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Add support to use USB-C connectors with the DP altmode helper code on
devicetree based platforms. To get this working there must be a DRM
bridge chain from the DisplayPort controller to the USB-C connector.
E.g. on Rockchip RK3576:

root@rk3576 # cat /sys/kernel/debug/dri/0/encoder-0/bridges
bridge[0]: dw_dp_bridge_funcs
        refcount: 7
        type: [10] DP
        OF: /soc/dp@27e40000:rockchip,rk3576-dp
        ops: [0x47] detect edid hpd
bridge[1]: drm_aux_bridge_funcs
        refcount: 4
        type: [0] Unknown
        OF: /soc/phy@2b010000:rockchip,rk3576-usbdp-phy
        ops: [0x0]
bridge[2]: drm_aux_hpd_bridge_funcs
        refcount: 5
        type: [10] DP
        OF: /soc/i2c@2ac50000/typec-portc@22/connector:usb-c-connector
        ops: [0x4] hpd

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/Kconfig              |  2 ++
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 17 +++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/phy/rockchip/Kconfig b/drivers/phy/rockchip/Kconfig
index 14698571b607..39759bb2fa1d 100644
--- a/drivers/phy/rockchip/Kconfig
+++ b/drivers/phy/rockchip/Kconfig
@@ -136,8 +136,10 @@ config PHY_ROCKCHIP_USBDP
 	tristate "Rockchip USBDP COMBO PHY Driver"
 	depends on ARCH_ROCKCHIP && OF
 	depends on TYPEC
+	depends on DRM || DRM=n
 	select GENERIC_PHY
 	select USB_COMMON
+	select DRM_AUX_BRIDGE if DRM_BRIDGE
 	help
 	  Enable this to support the Rockchip USB3.0/DP combo PHY with
 	  Samsung IP block. This is required for USB3 support on RK3588.
diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index eda3f7a1e267..8ac6a83b0b2a 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -6,6 +6,7 @@
  * Copyright (C) 2024 Collabora Ltd
  */
 
+#include <drm/bridge/aux-bridge.h>
 #include <dt-bindings/phy/phy.h>
 #include <linux/bitfield.h>
 #include <linux/bits.h>
@@ -1414,6 +1415,7 @@ static int rk_udphy_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct phy_provider *phy_provider;
+	struct fwnode_handle *dp_aux_ep;
 	struct resource *res;
 	struct rk_udphy *udphy;
 	void __iomem *base;
@@ -1468,6 +1470,21 @@ static int rk_udphy_probe(struct platform_device *pdev)
 			return ret;
 	}
 
+	/*
+	 * Only register the DRM bridge, if the DP aux channel is connected.
+	 * Some boards use the USBDP PHY only for its USB3 capabilities. The
+	 * aux bridge itself will be registered using port 0, endpoint 0, which
+	 * is fine as that is the actual superspeed data connection shared by
+	 * USB3 and DP based on the mux config.
+	 */
+	dp_aux_ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 3, 0, 0);
+	if (dp_aux_ep) {
+		ret = drm_aux_bridge_register(dev);
+		fwnode_handle_put(dp_aux_ep);
+		if (ret)
+			return ret;
+	}
+
 	udphy->phy_u3 = devm_phy_create(dev, dev->of_node, &rk_udphy_usb3_phy_ops);
 	if (IS_ERR(udphy->phy_u3)) {
 		ret = PTR_ERR(udphy->phy_u3);

-- 
2.53.0

