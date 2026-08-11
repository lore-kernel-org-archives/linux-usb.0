Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE407263B;
	Tue, 11 Aug 2026 05:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786425036; cv=none; b=T3VftvpCm0f5akeyiH/E9M9tDSeR7t12IN59dDzEJx/AaXV7aSAU4bEWApEBBrAbJnIpabSVyplheBX52sJ8vPkjAn7QscmaDPuYCtfH//cY5uC/WQuK2kk59HP/E0c3NiOqPPySCPcIpadxk1GBui5RLwQrn/5tEBQC2waWs5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786425036; c=relaxed/simple;
	bh=mdSvjb+KMYSQ+Kzb3SLfvJP7xAD8XjaI8/cEG9HRDus=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A6MlA9cYdlQzsJE97zcuQeknf1gdO+ZRioM/JgqOKzqDFB1frxeTgeWDTKDdXhOhyIkLNeryDZGFTFqfic3ARqSXbcsr77TBVGN3ybUEqPhQlCnN3x1lPp4jLa5nrQLsmtGbw3nOCi6a8TeEOj3TWJsCq1KxCqMNScVLe6nPZ98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=MVIL3bDh; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Y5H7SLuX; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="MVIL3bDh";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Y5H7SLuX"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4hK07P4fJyz8tb0;
	Tue, 11 Aug 2026 07:10:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1786425025;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qYRz5VEOuNgrNAlMth1tkj2U2NYhPDWXlfwd+WeQDaI=;
	b=MVIL3bDhY/TuO3p7Qw8/QNpSNaLdT/4eN90j/OwhHkRGVLfeHIp4NhkNHaEoxGAKd5iSHS
	SHs7gewchzIwcMsBg1YuGO4thHPPTC4+H30asZ+DpJEYwS9u7KFYOs9YNoQlpaerCKdjIl
	+OGWI1PkjDeJKd359iA2sIj+vyVAb7b2lSXJy2Cn2C4UMzoDeRrw6lzew62SGi4J1uFTWX
	wVj7Wl9AVw+WtBMr9lizxY5AuwM6PxDBWhKsGVPvUc9Tl46uA4IlwzE7uwd+8bci1qWTay
	W2TDAGk11/8raOBUglh5BgSIphuf5B56Df1tT/rKUmvkH2uIQhuk4XkL3CnHEw==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=Y5H7SLuX;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1786425023;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qYRz5VEOuNgrNAlMth1tkj2U2NYhPDWXlfwd+WeQDaI=;
	b=Y5H7SLuXVR5N8xlG2bX/l6Cqrq65I5IAzyMcpf1LYa7dw4W7YOg9jYsl+AOO+nmYbimxV5
	Yf3u/8HgIatV4BQJG+Tz7arTom9qlze2By947O9W9/iOAbUUmYoyFsbCP99jclT4IlooS8
	Juyd0JDZETRQCShuMXv0jg/P8c5C1Fn9sPKRoQF9XBqhLymE9f6/iww5cHqegn0amXX1sv
	2Jk+JCVrNM7KWlLalF/+HYJfb3thUgNZIMnDrsdJZaJFAY30xkrohfYfz8EEi2OUcSZPtD
	8MfwzwaWhYiDsS/gIEu5BzKnjOBiZbMl7GRyC2aesm8EMmYjesaBodC0wBXx9Q==
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
Subject: [PATCH v3 1/2] dt-bindings: usb: dwc3: Document Renesas R-Car Gen5 DWC3 xHCI USB controller
Date: Tue, 11 Aug 2026 07:09:33 +0200
Message-ID: <20260811051016.1655887-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: bd24f4bee3d3f428e59
X-MBO-RS-META: e4m5ctip1zpxh5qbc36ed66i5qt7c6f1
X-Rspamd-Queue-Id: 4hK07P4fJyz8tb0

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
V3: - Support one or two PHYs to correctly describe the hardware
    - Make maximum-speed optional
---
 .../bindings/usb/renesas,rcar-gen5-dwc3.yaml  | 81 +++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/renesas,rcar-gen5-dwc3.yaml

diff --git a/Documentation/devicetree/bindings/usb/renesas,rcar-gen5-dwc3.yaml b/Documentation/devicetree/bindings/usb/renesas,rcar-gen5-dwc3.yaml
new file mode 100644
index 0000000000000..37944a7d5be04
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/renesas,rcar-gen5-dwc3.yaml
@@ -0,0 +1,81 @@
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
+    minItems: 1
+    maxItems: 2
+
+  phy-names:
+    minItems: 1
+    items:
+      - const: usb2-phy
+      - const: usb3-phy
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
+        phys = <&usb30_phy>, <&mp_phy 2>;
+        phy-names = "usb2-phy", "usb3-phy";
+        power-domains = <&scmi_devpd 16>;
+        resets = <&scmi_reset 336>;
+    };
-- 
2.53.0

