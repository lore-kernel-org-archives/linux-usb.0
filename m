Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D4D2BB1D;
	Thu,  9 Jul 2026 19:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783623753; cv=none; b=jKnxIsnHOotmIXeZo1jv4MP4ejgavDjC69bisJp44RRhfaQcjNWHwqyD+bpq2+2KUbgkvMvr2u1CUf2672Hb4tqZYxqO+eC3Ib4RRCKb63x/E7jqY8QxLMHtJvFilbF3/3jpimIxLs06oidjVVJRDgCFlUUsgpU/sBKeXPpv4hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783623753; c=relaxed/simple;
	bh=fSE9BoJywHuBiftWhreULBZfq0aOAYM8Do4X/ZMeGM0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lv+Y5fsR9FWUeqWi/FyI6Fj5WoeQuv/3Qodtk1Ho+SJMMKub9M6HIYTgruDFPW4oanbx1UUpaSH7kkVFrfVyAelzHQCIuDFDZdg2+D4U6VUhBZ7Ha8+uAN7tStedMnu9D6Zi6Y+bdDgmGK8YBzjaZSHH4aSHy4kkbCTd3qC0bas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=crdOnBil; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="crdOnBil"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783623750;
	bh=fSE9BoJywHuBiftWhreULBZfq0aOAYM8Do4X/ZMeGM0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=crdOnBillnVowXLGAx7dwm/UdnwZdO0aIu8ahwIxb5rREUAhBw1OW+r2p5CNAne0W
	 +TB2rT6u9SHRG8cPQUX+dnDZC2G/Gure8d9js6CWFfbwaK7XQPKW9kpFEYOMVQmP7S
	 VIOBQE4fNWb8KJFRKXtYSnpm8T4081wpgcyaZz+u3gxMhD6uJeaaLO24wSpJ1deYtR
	 cbvyM8xss3t1SZ9khp2P7icWVPXoXymZTN2DWQmFQFtsDRu16dUXC9uTZKLInAcvR3
	 FaD/AhkZEz9bjkrrAhiYb1wjasHjoCMGB1xpU7SDOEWLTFDlqbCZiEDxQSnx5VS1mO
	 kH6jaFp6/ferA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EC87617E0886;
	Thu, 09 Jul 2026 21:02:29 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id A297F480027; Thu, 09 Jul 2026 21:02:29 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 09 Jul 2026 21:02:24 +0200
Subject: [PATCH v11 01/36] dt-bindings: phy: rockchip-usbdp: add improved
 ports scheme
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-rockchip-usbdp-cleanup-v11-1-a149ac60f76c@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2405;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=fSE9BoJywHuBiftWhreULBZfq0aOAYM8Do4X/ZMeGM0=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpP8ET0hzf+xKuyvcSJyb4yUDLkzfhjYwkEa
 zIaTiLIbOEg7okCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqT/BEAAoJENju1/PI
 O/qaD/AP/ifMuYGOd5BmIy6Hm/pBhkg9Vrq4KQzn8bYiXGhnxuX/Sjagk1vvz/ZATwISlTid+Az
 OzcFMFaX6MFeeYuRQAtNlspFLpS0PhiZuatxSB3jC8blXjid2lZomRWv8yDGrdjn+83TSfuzH7U
 Oeniq6+TT2BLLgfLDNehwYotRdQDf6K4KG/xLVF6W3b6+4VUyC9OVC6KotgBmd4aLDXBWmm2E3x
 0Y++6q++jUWd+avtnGkvg6m2zJcR+nFubwvqHOy3XPBgZM9hmkfIq68NcRfI0Q1lU6fRDxIRrxy
 BwYKmQTfWEDQvHYNPWSaRerDXrLWpf2JUh/Vo1gX1dX8ktuo7JjfyQgRJElP2PrCXxpXO0INxxs
 vCmx3VOEGN9NotJMzdWwU6AxjrgG61a4VIj0eiIQPLdfk7mYpdGHcWTmsTIJjQQC3D/GoOlB8KR
 4ovcMSODgYpps3Y3U6PDvrupL4Zu/RcxMJ6VgWvgomyS+jdUcfk/PgLtD21lqESsjw/qtxgwHjn
 1qQGWINqgC8zwlGweFRkbZHeotn16umfNyFDaoIuAOcyZHXYAHMPySuh8oudiI3PQ2rkaPlHDAW
 134NNcKFXjMiYMUU1Z9qyGjEZxTFQA/ZgPT/OGqfER/SY+Rl4+GxUz+WDv4NThYn6F9axiPZAyQ
 FNIxdjngHMIJFfmBmcbQnOw==
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

