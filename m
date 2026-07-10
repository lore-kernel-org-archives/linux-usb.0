Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3306236B07B;
	Fri, 10 Jul 2026 16:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783701982; cv=none; b=QaTCllxrFAU584llcHNarbgOst1BQZH8HQBvle5HInXeAMZRJXLlGNALougiMRV8mT7zuayO2o4fibvzOLlAdorzbc/KUGBs9LSAZ80924jLd/FmMkxsQCgaS1whscl/65sNkLCPQ2yR05JSTaJhCvx+nX2iUq8V6wUs/N2Pleo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783701982; c=relaxed/simple;
	bh=fSE9BoJywHuBiftWhreULBZfq0aOAYM8Do4X/ZMeGM0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qAV2wrdyIHHZrVM8vOogq8VdAI9llM7OMtkgD9cX5X/itv5JHcgfVxA1XnTJqCgnGHQ77MWEmDHoIt3WQ9EwwySfziCOr7m0FgefKXOIh7I9Z7aeHh+ojLvD3MslHE0nDMCJcBT67ljvbpnShkpjY+7XuC2yL0+qDlrIlodtvrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=O7W83j95; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="O7W83j95"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783701978;
	bh=fSE9BoJywHuBiftWhreULBZfq0aOAYM8Do4X/ZMeGM0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=O7W83j95pEoXGjl0ADzyOWbCxC5BXF3zE7KSBIwsGv4jNZk/S9MHo/jwCfUG/ts5V
	 xdb5uSqR0zIv5IOMfsEwiu59FzZNQ5LhWP4vuF0y3EPx3svba+rQzsf2H+Cz5+Sz4T
	 KiMPzy2ERCjmVV8L5YkE85rO3rz9FyoEA46CH5sH49sh22nL/hn1xrKsPH6tLFNyL9
	 Hp6yHzWsem9RqAknu3FRA6V2kux+kSl6xdaJWqd9skpDHf3dfyXqzOn+B4Kxiyql2v
	 N01+AVngvyJcO8LO4lppcS/2RlJ4zDceKWAeQcFmEZyVQ8wdVntJQLi2UF63hP8kqy
	 1Mqa3prFTOAyA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 26F0717E0B0E;
	Fri, 10 Jul 2026 18:46:18 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id DCD9D480027; Fri, 10 Jul 2026 18:46:17 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 10 Jul 2026 18:44:39 +0200
Subject: [PATCH v12 01/36] dt-bindings: phy: rockchip-usbdp: add improved
 ports scheme
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-rockchip-usbdp-cleanup-v12-1-8b41a9a9bef0@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2405;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=fSE9BoJywHuBiftWhreULBZfq0aOAYM8Do4X/ZMeGM0=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpRIdhYu1Ha57Fn8t9eTjE5dNK7wW0aSuZFL
 9eetiCdTSMPQ4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqUSHYAAoJENju1/PI
 O/qaQ6EQAJBEQxdLEGCKGuIhxEpfHNsVvkMSefaqou2gPSymClj3GuQ2IJCADTSZLX4OL53uioO
 JODGXY5n3mUXJBVxq/sKLqZ5vVc/ciNqIxqDp2bXfVLiFIs8g+jIA2lzMlVTk1oH5p+jEUK81VN
 GamUwbvz6oq6L5R6p/p5HjnNRJ98fPLkR6rFkJtCoFkHStwpf/oKduPqp1AoEhPB1cqOT36SCWE
 jk6acTqiBX+d34CSYF15NPg7cM2irBq5z9DdCkKzNiqvMN/2KXZzGEeJwWXBOstuq2JBwmayDKH
 DH/DAT/9yZDFLa9FJ+bNX/ndWNmg2QAFLRU3Yb0YWX+BHlGjV5MuUNYxJsAnz2Sw6nQiYaDvBw4
 7gRo3XALt2/8D5RBekthvNmFs81XPrBdHX/SrVp8aEbny/ZFkes0mxLAd9IYNYk64/TBlsiI0bG
 Rc2xssZLJ82wyD1hNehubIPLlUKRNy1LGKZrqWxn+GgAo0lNbbV8ULFqzqliQmIm4TYX77pwqR7
 X5iUzwDfyVdZmPDSZK//gQH35w7nkcq16HJGgnqJj7IOnYRLyZMGDQJvz7t8e9sa8Pd3++CqM0O
 xdRvJEjWIy7Zzp2P94UObelIPYR+XrHcemiFPg1KU4rJ+sPffuIY4pCc9+tnfb0+c2LRPjKO9/6
 Gkr+6CmhYX0u1fjE4TAErSw==
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

