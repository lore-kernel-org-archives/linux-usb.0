Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01316430CFD;
	Thu, 13 Aug 2026 20:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786654314; cv=none; b=e6UKtC0FgdnwbapqmpAmsfxxdVxk7yLvAEYUYyY1P3FSaCHWSbga4BQiCLDWOdEPvzojUjXt5ckL8Au0VfDzDG4lMPp+AyAFwd8qxKZwYNJdI2UFmYOLlTdZOVFO7DFcxbzh0qqANKfir4TRB7e5KBrZIeGpHQ+F4G1vs96L91g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786654314; c=relaxed/simple;
	bh=fSE9BoJywHuBiftWhreULBZfq0aOAYM8Do4X/ZMeGM0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rgw8hvdRWsAHyIbBONbpeAchkCy9WsoONrux4KZjnXkcoLuIENgfF1TtR6XVv39SqoQPHvNpv10P9oNVUcU2qM3XgTgBWb1W456mk0dz5kemZdq2IQ9NQG4ky+7ImaHJAzmq9C1greJjd1EI/YYjsMdgUbE75jYCYGhAsO7XqJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=VEll5Sno; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="VEll5Sno"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786654309;
	bh=fSE9BoJywHuBiftWhreULBZfq0aOAYM8Do4X/ZMeGM0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VEll5SnoaXZi6rDsjoHozG1EmvT5PsYpAt7yYokZ8rjQ35aGc3HO/0TqRk4juVVFG
	 byHII7ES28Lr4wwQeNnNHHWekmd8NoRYXPYb6W+AcSJ5EVEMJWXTSxLeXeUcOFcb4g
	 VhgJ+eVdNYao1M98jDpyKW7mO27aV2A1dBv+n4XJcfR+Ix4lYP4YBdsk2MxC5co2fV
	 DxkERTWjf/x3xKFLatNyIdMr1B0+pyf30dsHahqryw4oZ2+a/P0AuOaE1kj6/aBPA7
	 /j0dyIk6eTrbIiw7x3xlll/7l/LPYrzq9SyKrshpUu269Z/eHdquM7EaNZSnf0LF5b
	 Y3YGqmmtW+mhQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D45BD17E0D7E;
	Thu, 13 Aug 2026 22:51:49 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 954E5480028; Thu, 13 Aug 2026 22:51:49 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 13 Aug 2026 22:51:44 +0200
Subject: [PATCH v14 01/38] dt-bindings: phy: rockchip-usbdp: add improved
 ports scheme
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-rockchip-usbdp-cleanup-v14-1-b5ad9c68fa11@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2405;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=fSE9BoJywHuBiftWhreULBZfq0aOAYM8Do4X/ZMeGM0=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGp+LmTnZssBuUk6MsSrqc/oF1RtmFsXuAOCZ
 YgS6zvc+D72MYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqfi5kAAoJENju1/PI
 O/qahGEP/29BOazNKvW962hQeBoit2PK1UK6fkL9U7oSS58ElJjl6WXJ2EPkE5qBrTI9XCg6zSH
 mujsTP9aX3xSQktcdVHAQUEiLYMNlAI3bg4ns2NEKz9E3VsxkTZ6MUFyvFfOjV++2QRbxobNOzu
 u2Nyc7+zxBkeRwmjrDGVoMCOWXtVDVZUpgJYQ9XX2RsG2WUVPIh+hUIh0Z/JJaWgHY9G6VOeSGq
 PJsRdGtvUQC3Pf3F2gO+qQgmsEF/fIs7VITkweJeu3LU+0O0vNTZGAq499LfdLY47yb7dMaiXZW
 PCxFLGcaDr6prVRAlNxf67WAaLllhpCnFaCvWecfN4KCDhU708NZNKEe0buMnKRSglwz+l6oWM7
 toD/Ttg8KBcDXy863AClcyCj5kAhSdehakz0zFWeYfFjVQe6Se/5qON+WbVk5jphnkqJ6QnOC4F
 Qc0o0BOovMfoYuRLfr+d96gHnqR8/rjL87iUO7cApvQv1qTvPY8yMgIS31sYQLPPdUeYanMd923
 pg3HzYBc7hB9dW5n6opwhwxpba+kLpeQObVX6u7ZRjcp6+pRgAYqkH+n2VgIuhzLdIuIMPV3SpC
 6336sJ7RxcHKCy6YwEoGbKqPliwIDBjYsXcSkuFcxC2JRqWqEPiHoW2oJhulNgH8YofLg/+y0bq
 GEQSG68kuQ/K3ZWsyDKUwnA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Currently the Rockchip USBDP PHY is missing a documented port scheme.
Meanwhile upstream RK3588 DTS files are a bit messy and use different
port schemes. The upstream USBDP PHY Linux kernel driver does not yet
parse the ports at all and thus does not create any implicit ABI either.

But with the current mess it is not possible to properly support USB-C
DP AltMode. Thus this introduces a proper port scheme following roughly
the ports design of the Qualcomm QMP USB4-USB3-DP PHY controller binding
with a slight difference that there is an additional port for the
USB-C SBU port as the Rockchip USB-DP PHY also contains the SBU mux.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../bindings/phy/phy-rockchip-usbdp.yaml           | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml b/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml
index 8b7059d5b182..89efaf005a7b 100644
--- a/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml
+++ b/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml
@@ -110,10 +110,34 @@ properties:
 
   port:
     $ref: /schemas/graph.yaml#/properties/port
+    deprecated: true
     description:
       A port node to link the PHY to a TypeC controller for the purpose of
       handling orientation switching.
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Output endpoint of the PHY for USB (or DP when configured into 4 lane
+          mode), which should point to the superspeed port of a USB connector.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Incoming endpoint from the USB controller
+
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Incoming endpoint from the DisplayPort controller
+
+      port@3:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Output endpoint of the PHY for DP Auxiliary, which should either point to
+          the SBU port of a USB-C connector or a DisplayPort connector input port.
+
 required:
   - compatible
   - reg

-- 
2.53.0

