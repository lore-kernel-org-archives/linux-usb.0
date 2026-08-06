Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6DA34CFD0;
	Thu,  6 Aug 2026 05:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785992676; cv=none; b=BkUdu6aeB1r3BhKwww7BXDMEdpGhjCA795WQc84lkqcSjXu/csx5lhGj+fu6dkRqwj+X627S/ymryu8rO6101FZ9MmbJks8/+Dg6834icxhfwFrAn3dUmZrsI7eS256QZtQd+A4eSPpJ7f9i5cwX3d48ip+8252lPEAbnEdlNUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785992676; c=relaxed/simple;
	bh=ITHr1A1VyXN20TKxIn72XJno3Am+0YVZNqQC/YtHaRc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W1wNbLT5qps2fcVkFOqyre1iQtFRwFoMkGMC4gmJjlwrpS7hlbcwHGMmFY3/v2ULxRPFBCPWriiym93lE2HMc+E9Rygop4piFgRpuYj+/YJ84dUCAbvi7C9PTXqtO1yADNbbtBibMiDN5G67rVwD4PYn/wIz6OLUoQreyZiY25Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=SbG5aSST; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=WpzXyQxh; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="SbG5aSST";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="WpzXyQxh"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4hFwDv2BRSzKw1q;
	Thu, 06 Aug 2026 07:04:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1785992671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1/hbkDGZK/YUswzfrP3LoF/lML5fzdOUNzto7yATg3w=;
	b=SbG5aSST67q3PyQnZXFPDycIzy/WpaIoCL0cbJThZMPs/lJarlDQCI80VjyWRH5cKFtIEv
	3ocghc2OjPAYxbrA7/GQ8osmq8RkJz59Zt99mwKWlkg1LSTVHTFsIG2Q+DT8l/bUfYm6WT
	MwD3e8T/p6TSSH/Qr3hApRRjjAeRcJ9oGxuRVALynA/6u9h6yz0kYwC30o5F4Z9rm7VxfT
	QuFllSzZ2ArKCYi5kJT+Z7LoeALLvW3J39q60M2Qcff3j8s2PudnrZK2gVv2ZsWXdQlwqS
	b+t25RU/5UxxvgQOBWuDksF6jeRIM3CpE4FekUKOcR9tNwns0zKqOSo/yDsZMA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1785992669;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1/hbkDGZK/YUswzfrP3LoF/lML5fzdOUNzto7yATg3w=;
	b=WpzXyQxh0AEO1b9FGWCmHFPR1I2yiIl1meCfFwVWTyeiLpbMBryvuYwMopBYZDrJe5CN+v
	s6XYMfFkYEOh48i2GSWcBBFSkj9KLHv2+ue145JhxdrM4e6AFb+ZomFA4EJVIHMIu91d/A
	TjsOlO5ROBApAQqLBf7yonSjqqhk+BeekSGNNge5zEE8bbaSA27fjwScB9m2kV1fcjXdPx
	lsdElIPJiuwFHK5cLRdzQtEi4K1wC5Q+AmKz8KU5bWr1fwr4bwDfNgaxHljOyTe2ALG25O
	ViTpiezvaypYIN1j7vYAf0oSNsCq1blPDoqdI9nZPzu0MNWENxH+gQnJrv9WpQ==
To: linux-usb@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: usb: dwc3: Document Renesas R-Car Gen5 DWC3 xHCI USB controller
Date: Thu,  6 Aug 2026 07:03:24 +0200
Message-ID: <20260806050422.324435-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: nmq36bigc4y8q4kxp5uwzt4ywkguis9k
X-MBO-RS-ID: 001f00b2b0958940de7

The Renesas R-Car Gen5 SoC contains multiple instances of DWC3 USB
controller with glue logic wrapper around them. Document the glue
logic and DWC3 controller.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Cc: linux-usb@vger.kernel.org
---
V2: Rework to use flat bindings for generic plat driver
---
 .../bindings/usb/renesas,rcar-gen5-dwc3.yaml  | 79 +++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/renesas,rcar-gen5-dwc3.yaml

diff --git a/Documentation/devicetree/bindings/usb/renesas,rcar-gen5-dwc3.yaml b/Documentation/devicetree/bindings/usb/renesas,rcar-gen5-dwc3.yaml
new file mode 100644
index 0000000000000..9f48f90d6df85
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/renesas,rcar-gen5-dwc3.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/renesas,rcar-gen5-dwc3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas R-Car Gen5 DWC3 xHCI USB controller
+
+maintainers:
+  - Marek Vasut <marek.vasut+renesas@mailbox.org>
+
+properties:
+  compatible:
+    items:
+      - const: renesas,r8a78000-dwc3
+      - const: renesas,rcar-gen5-dwc3
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: dwc3
+      - const: glue
+
+  clocks:
+    maxItems: 1
+
+  dr_mode:
+    enum: [ host, otg, peripheral ]
+
+  interrupts:
+    maxItems: 1
+
+  maximum-speed:
+    enum: [ super-speed-plus, super-speed, high-speed ]
+
+  phys:
+    maxItems: 1
+
+  phy-names:
+    enum: [ usb2-phy, usb3-phy ]
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - interrupts
+  - maximum-speed
+  - phys
+  - phy-names
+  - power-domains
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    usb@c8800000 {
+        compatible = "renesas,r8a78000-dwc3", "renesas,rcar-gen5-dwc3";
+        reg = <0xc8800000 0x100000>, <0xc9c54000 0x2000>;
+        reg-names = "dwc3", "glue";
+        clocks = <&scmi_clk 336>;
+        interrupts = <GIC_SPI 795 IRQ_TYPE_LEVEL_HIGH>;
+        maximum-speed = "super-speed-plus";
+        phys = <&mp_phy 2>;
+        phy-names = "usb3-phy";
+        power-domains = <&scmi_devpd 16>;
+        resets = <&scmi_reset 336>;
+    };
-- 
2.53.0

