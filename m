Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E0131327A;
	Fri,  3 Jul 2026 18:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783102416; cv=none; b=u/c2TF4pR333q8tom/tZr1niYgScNAOxDMYB4obCVJB0/QngnwoGCxsQnICbztB1y3Nx8JkK5ALt9xm0a6T01B41vlKF/twBFmNrDKNXn7Q/Eo6w09RqV5Gb2cQNcXIHpVY6h+bl1qHWvIlKsFvgY/Fw/8gYY9DIPr5x969Ze3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783102416; c=relaxed/simple;
	bh=XvXrGJcEW1jcrIx0OQCk1jq6kZj7fXlWBKjmt8bxgrM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kuhdNZxtu6ZMVjiYol73nkGmIWKmTzTKzZuEFDfeeJJokXZKnW0Gv7AWEL5ID3V5O4ysH8/JbMdKQ3NEGQZWrOyLdOauzeeD0va7H+h3QMu7g4VAMiGJckWR+wQnkgRof+RwJiZyQGExojvn7rPNXcRpyF/0eoRzCDUibL9r/eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ZKvd9Q7f; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ZKvd9Q7f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783102412;
	bh=XvXrGJcEW1jcrIx0OQCk1jq6kZj7fXlWBKjmt8bxgrM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZKvd9Q7ftVKAi7wzX3B/zIzYYWugrmpK8/4StXZa/49cWnml/2HeFCLF/pZwqZqx9
	 oOOif10qnrv4krV1yHjbLPBdococ14NGLhEsO6b/maDP0gkSBPBOooOGKgrfqnBmIR
	 cSLmEA9yxVpKhob5yhtn1HfRnx5Za5OVLDV0lWaPPfOMzRMq4WjKFwtGgntez8LdCh
	 l/djOqiF/+iuIrlU6e/kIC3AeSgJS7213hWe0CorQXLdp3VUIi+QmIvG2IMqVczDNJ
	 a5f6PWBYSsqK9wAAQNtuCjnJ0evp4eyJD5CUiAKU1rqM8cprOH8wAJb7n0UGGjdkjq
	 Nv20WqAzwlx6w==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C43BE17E0FD0;
	Fri,  3 Jul 2026 20:13:32 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 7A4E0480027; Fri, 03 Jul 2026 20:13:32 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 03 Jul 2026 20:13:17 +0200
Subject: [PATCH v10 01/36] dt-bindings: phy: rockchip-usbdp: add improved
 ports scheme
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-rockchip-usbdp-cleanup-v10-1-a392711ca8a9@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2404;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=XvXrGJcEW1jcrIx0OQCk1jq6kZj7fXlWBKjmt8bxgrM=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpH+8siRwD0U2bZ9ZSm9fV6LotqMU/quVnF+
 PFEgB+OcwEb34kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqR/vLAAoJENju1/PI
 O/qaFjMP/2edLYw3akpB0xq95GESBNkhtEErZo92maEhRHjJ3Kv3QglWodbekbId/8UyUMpu9vm
 99i0hnu1T+K3BSN2clT/GTGp4R7p3h1w0T2OcBkcUX1nRWD1EzxXjftJjNp3P2qxvRwYmbfzrmI
 NNhNjTVyC2Rqqk8pxBofBLr1dVhJ78dimZ6jKIgpRLGD/pUoI7UXPZ5+bX4awat1t9ZHcRWnPt0
 qAG+QEBJfflwaA561hpjomMREbcoRinDKnC3/ueDwLsscyZZj54ok+veIHxivuF5tgaGCxKORNg
 uW66cmChO7peJrGQAXnb8MQqzTVd4lrlwKp0SGvjNE8Dp6DDFWOI7hSf6Qgz1SpBYb2guAvxTdP
 H03emq+x2qeV9O/vnpi3F+NoQ3cRTZ/lf7drZdP8vsb4/daEb1+fg67yd/9CnOQJRUp6B8KD/m9
 8VAWz1X3El2v1RMpZI6W77ncrguAay911DLPt7uXDEgWP1gZAEVkTYQ7m16xyCeok+CBsLyEzDp
 Nk6eM35BwYsI3OK2v/A8XpAFYZ/TJ2viOQsGzIMvWw6vFmWqSp6mMOjGc6rh26YE/bMdHUF2xjR
 79gwlomfpf9OX2Z+colEuBDUcXajI2/U1eIovALRSU88uyqyRYYE16Eh0bfTZJwluzIlxm+qP0a
 sgejK8mxexGfQPXz2+J887Q==
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
index 8b7059d5b182..35d6717b9cc9 100644
--- a/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml
+++ b/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml
@@ -110,10 +110,34 @@ properties:
 
   port:
     $ref: /schemas/graph.yaml#/properties/port
+    depreated: true
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

