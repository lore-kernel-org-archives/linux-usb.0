Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB4043B3C2;
	Thu, 13 Aug 2026 20:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786654329; cv=none; b=unkwSVjB6A+UFhnkwEhWTe6TrHtg9gV4jMQHphq70DYlCCFu886YsE3CneeTo4hGLIRHSszmM3KlW35Dm6QmkeSi2hyftCEG68m8iAB44EdTA2LqDjK8tznQXURxK0U4eGVW5OdkVPfDV8ArkS5DzKcRl4T3Siaxe5Rf4/IMUHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786654329; c=relaxed/simple;
	bh=AZGVA3NPS2lTb9M3c9j8Cmej9Lii/vc7ZG2OEXfumBU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=om+0atO1y029l8YoJ2f2mPr7bdfN46Znhg10zRv+x0l2wa72jxK4ULCz7xzRM6rLC2xHnflZTmQIUUahsm3alxice15BZnY/9naUZu2MBirQbVAay7x2mh+Qy7yxYlStPkiNbexApdFqffhBuDM2lmIgh+obE0PfuUf27j4aplA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=jWqGkrCI; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="jWqGkrCI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786654310;
	bh=AZGVA3NPS2lTb9M3c9j8Cmej9Lii/vc7ZG2OEXfumBU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jWqGkrCIr+tQRxb5rv/JwXCA/RFk46jWjvb5uoNQ0AA9M5Ngeq/Ut/n/C8u+usECX
	 8hPkygbY+TxkFaQgShQXYaIIZJJuw8b0jOZ+NDZi7/OszGK6HyCIPyHCRRoqn9j+VH
	 1b4PY0rRqqJCVBbmMDI0ulLd6Rk1qk41N1C+aPv5huTMJH1qFkMHA2kadcYxSfgJma
	 sJw3oNkGf7cd+zoMc3f6rW4bzwDLZ3J52bxcaH2os6POL+8HuSjgxGHMRC+wzSSgTA
	 pis1J2VAlGyp3aREY5mMyUPy408Yz08q4oX8vTh264S0LrCIKFt0+9xy/X1+KU88sQ
	 zdnucy5aiHtjw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 82EF117E1313;
	Thu, 13 Aug 2026 22:51:50 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id ACE3F480061; Thu, 13 Aug 2026 22:51:49 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 13 Aug 2026 22:51:59 +0200
Subject: [PATCH v14 16/38] phy: rockchip: usbdp: Register DP aux bridge
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-rockchip-usbdp-cleanup-v14-16-b5ad9c68fa11@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3258;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=AZGVA3NPS2lTb9M3c9j8Cmej9Lii/vc7ZG2OEXfumBU=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGp+LmT+7ue7VrIQlulmmdjUeoU1EEOM1g7Mo
 pahmIY3ASMU2okCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqfi5kAAoJENju1/PI
 O/qaQoAP+QH1QDpSNNR+4k9Hl/syFUjFXBqXw3FE983NHa5cms5ZEymnnnuGmZxGXiiZaM7g1QH
 xuifwRTnMhW61ZZoQm76PC0VhaH+aP+wBOmaFuhyrbbRRu03bZwcCmqIGxB3+SrFNAfaH0L2tqH
 R5v1x4GI76S4dEL8MRUAgveXMTKkyBjTua+f77WhPkAlzgoIVJoRFqUTkN7YzLMVzzHJGx63+b2
 /49bhU0/kR+utR8S8Oxr4iqKIfut8mVTl4XIgBnou8AicVHVSH+HWEOITSxuymWnkHsrdQ0FXXi
 eP+VXfwDozfBSsYOiOpR5Lz8EUPvjnsz/E3fyrtYJwrRE5mk34QhF2Ou7za7CaxVLfMiyF+DRWN
 9rmQV67jN4OzGWWfhGJseipbj785RHiD4VFcHBfadkgnPBEX9IBnpPqBsRkM3nSTIETOTGaaXZ/
 BmDGcn8zdPL+P/saU6nNQVDUwEIFRDFT4PteiO891t83QdK39018qZ9YViVD55NJOYSCwjgKWzA
 +oFsq8l0gBCO4osb3bhwSeq5o1YlDBQsIyTbJXIOKqSVKnxE1Je/B60j1Yca2n1+xL9mO88UopJ
 12P/Ch2hQ873XYDwU2WNUWPwBITVQB+1zKLRyyWVeg4wfSsuyHgCiKu5jAJMJtSkkLTH638xIPA
 yqu/I+uUYGkJTtwxMLTInaw==
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
Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
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

