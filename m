Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85CE3CC300;
	Wed,  1 Jul 2026 23:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782948952; cv=none; b=NtLoDH7TmU289aNQTWRjeJY7YqPN2fYqTQaN+l/gmELHgtlJ0p+f2NPR2R4tCxkqGEFHxbbCdQRBi2e0Ko3Jiv6pV4y8JFX2Dip7mg1uEcW54D2m11YDr++zabH+0xV7ZwCkOWc0BUxvMJIDf3BRd7t7i50nmCwcEULCE577IGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782948952; c=relaxed/simple;
	bh=ziN2QVhea36/gR4vvoGYCahWoZmessVdl45WD1SRRUU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IhZpqvLGSGMdTQT9fPocVMTa89JgwrkavTJ3NM19WhUehzdDPHc+oZqSEb7yqCwWHp66TwKRXZLTXRHGcgDrfytFt0OU7cZL/ldmjRegMjn931KJcofFgot6DA/RZcFP0JEyefb81P94Bbjs4pagwQAP4mCLoeLZ1ryazXEloEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=aMHgnRh1; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="aMHgnRh1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782948949;
	bh=ziN2QVhea36/gR4vvoGYCahWoZmessVdl45WD1SRRUU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aMHgnRh1OthtZsFfu/XwjBQmzqQA/4Ge1SOSMbK1P/iRsTKzzcxJTtcNohJgzYVr6
	 DqFu4mdaNjQcG+2g9jSkjxSYpx0gJxUupkYUHUnJwIUcMlmnjoNbhvY3xpfp5jmkmJ
	 CR/jNl/JtICdqBvBYpGnr/iZ5tNI7pomLDJtyaeXVxMT2Ko/9A9Exw3/3Bci10jeYj
	 SNsp6iQzlmCm1VRjPOovwIWOQP+4ZwgBj8z5PDXiShqYCm3dhncN8KcKQAQNwRvxNI
	 0sB3p8ZdrOMVls1QyOYketkt3jCZIorJbnyfxQiDqFR5PepQCxwpymSgtUFXPMy7OB
	 tV+PFEm4krZHQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EFDB617E0CA0;
	Thu,  2 Jul 2026 01:35:48 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id AEA40480027; Thu, 02 Jul 2026 01:35:48 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 02 Jul 2026 01:35:39 +0200
Subject: [PATCH v9 01/38] dt-bindings: phy: rockchip-usbdp: add improved
 ports scheme
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-rockchip-usbdp-cleanup-v9-1-e31efbb62d2e@collabora.com>
References: <20260702-rockchip-usbdp-cleanup-v9-0-e31efbb62d2e@collabora.com>
In-Reply-To: <20260702-rockchip-usbdp-cleanup-v9-0-e31efbb62d2e@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2300;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=ziN2QVhea36/gR4vvoGYCahWoZmessVdl45WD1SRRUU=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpFpFPsFXWuZx5VNm3EBmDsu5YxfN9An8AjX
 Tkqf32m2oQC+YkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqRaRTAAoJENju1/PI
 O/qa8BcP/11EOsIWLiak9BFWpqdbW1HvAXvYtpgCu5mKbAHQ7K74evSYCg6BZPjfIsP0CqLURW1
 ngEYMP/lr2S2RnKONFqqloAlyYsKUXocwnJB+t1ztYhWdTwJPs+2VMKKJ+QFCYAr3o5KIV0mpZ0
 y2CQ3e9EjOxChK+4KFKRpKIO5nF5D6NyD3Xhphr321pcgPF+7hvMeTSzAPm8XejW0Dd7bocTA24
 6h+MKDiyg95nDL1lyQdkzo3b+po8iMPuHKURGQW0z5IHQeZcmt7DhLre0Ml/ol2fNZCRZ3ri3lL
 mMTy0OiunVzKBHh4EgZ/U6WfUX81+sxsIt2Dhu+FFwgTK0+imkQ5UFRpjvoyy06spXsoaxZLke8
 Us7o4u3V5FESiaazZtK8tBbN85mof7czZ4ahUIqgGWkdWmiHYiHlbKm6oyqzq8SOvVOlffwfWd0
 /QK5yyk3ALW2d3vEKgrFUgLbyPv5pF7s56y933h48hBpURWf4jdp8XYeqP2MAOLuMIDs6xT279d
 1SrIksGkdjtwY+bb8/lbN9LafUyICvkvv4JUsC3Ds3BkxAmj2ZbEgcgvMGUTFkX8Wey5jSNenPG
 caqWrKg62aEoAHGaHXS45qjRx3tQB0OEhc300uWNwv83wqvbAMifsob0w9j8Qm/swjzTEpAS0qY
 BRU2y0fVLsesjcgLKvmAs+g==
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
 .../bindings/phy/phy-rockchip-usbdp.yaml           | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml b/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml
index 8b7059d5b182..c1a1384118da 100644
--- a/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml
+++ b/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml
@@ -114,6 +114,29 @@ properties:
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

