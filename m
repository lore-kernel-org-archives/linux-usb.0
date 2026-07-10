Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E991A268;
	Fri, 10 Jul 2026 02:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783652208; cv=none; b=Fk44NkWE6L6Vm7zcMZA0Z9SGBh5uk+R3pCP7SRrqbyx+QUTZhEmC4LmrK+1Xke+RbK6ISnSw6G41dPVVkStCTFwlzKfw2xmzCirfboIJfo3mTn8utL46+mNcCkQcMzc4yQ1kA882DEbaOZH0Fvg2dVQF8n1OZXPQSG74SofGOEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783652208; c=relaxed/simple;
	bh=do+Sg8cAREeCQ4d4ZCPhx6v05K6G0pm+XApZl1MMIaA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=BDdRz3fRLfv/jlv/SpCSeRV7K/NAaZsirHUnlvBAbKAO0iRTqDYIS0LdT2j24yGg46yi9h19EyiY5vldCCj8zirJsKuUpbpujh1tHs7/LeXwELB3pOpG/d59WK73tt9ZyeE9QNXZRKcx/W8/j1dv2eIthoW949tFxhqxlHPBCq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 10 Jul
 2026 10:51:36 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 10 Jul 2026 10:51:36 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
Date: Fri, 10 Jul 2026 10:51:35 +0800
Subject: [PATCH v2] dt-bindings: usb: Add Aspeed AST2700 DWC3 controller
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260710-xhci-v2-1-f292c4f7339a@aspeedtech.com>
X-B4-Tracking: v=1; b=H4sIADZeUGoC/yXMQQ6DIBCF4auYWZcGqBXtqvdoXAgMZRYVA4bYG
 O5eqsv/5eXbIWEkTPBodoiYKVGYa8hLA8ZP8xsZ2doguex4J1u2eUNM9Hfn7ICu1xbqdYnoaDu
 Y11jbU1pD/B5qFv/1BBRXJ5AFE0zXTQ/6JlWLzyktiHZF468mfGAspfwAHLZtUp0AAAA=
X-Change-ID: 20260624-xhci-185ffd9ef8bd
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	<andrew@codeconstruct.com.au>
CC: <linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>,
	<linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Ryan
 Chen" <ryan_chen@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783651895; l=3993;
 i=ryan_chen@aspeedtech.com; s=20251126; h=from:subject:message-id;
 bh=do+Sg8cAREeCQ4d4ZCPhx6v05K6G0pm+XApZl1MMIaA=;
 b=89QHRlgQ9hjs0p/czsnJcovOWdx2SKke/7VpY9lqq+YCYnsx3QvZ7QEOtIggXYVMGXqpElOvG
 mjKsZ3PWLrhDmFu/xLUlpOBU/siyU9AbzXc0mTQ1ITOndf6LmIHDykV
X-Developer-Key: i=ryan_chen@aspeedtech.com; a=ed25519;
 pk=Xe73xY6tcnkuRjjbVAB/oU30KdB3FvG4nuJuILj7ZVc=

The Aspeed AST2700 SoC integrates the Synopsys DesignWare USB3 core with
no vendor glue logic: it is functionally compatible with snps,dwc3, uses
the standard DWC3 clocks, and the only SoC-specific part is a USB3 PHY
that is handled by a separate driver.

Add a dedicated binding document rather than adding the compatible and a
conditional to snps,dwc3.yaml. This follows the established per-vendor DWC3
convention (apple,dwc3.yaml, socionext,uniphier-dwc3.yaml, ...) and keeps
the AST2700-specific constraints - notably the mandatory USB3 PHY - out of
the generic schema.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
Changes in v2:
- Constrain clocks and clock-names in the binding rather than leaving them
  to snps,dwc3.yaml.
- Link to v1: https://lore.kernel.org/r/20260707-xhci-v1-1-b202b9b3274e@aspeedtech.com

The common DWC3 node properties are inherited from snps,dwc3.yaml via the
allOf $ref, so this schema only defines the AST2700-specific constraints:
the compatible, the clocks, a single interrupt and the USB3 PHY. reg is
required but not redefined here, as snps,dwc3.yaml already constrains it
to a single region.
---
 .../devicetree/bindings/usb/aspeed,dwc3.yaml       | 93 ++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/aspeed,dwc3.yaml b/Documentation/devicetree/bindings/usb/aspeed,dwc3.yaml
new file mode 100644
index 000000000000..fff5a200f8c7
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/aspeed,dwc3.yaml
@@ -0,0 +1,93 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/aspeed,dwc3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Aspeed SuperSpeed DWC3 USB SoC controller
+
+maintainers:
+  - Ryan Chen <ryan_chen@aspeedtech.com>
+
+description:
+  The common content of the node is defined in snps,dwc3.yaml.
+
+select:
+  properties:
+    compatible:
+      contains:
+        const: aspeed,ast2700-xhci
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - const: aspeed,ast2700-xhci
+      - const: snps,dwc3
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Controller bus early clock
+      - description: PHY reference clock
+      - description: Controller suspend clock
+
+  clock-names:
+    items:
+      - const: bus_early
+      - const: ref
+      - const: suspend
+
+  resets:
+    maxItems: 1
+
+  phys:
+    maxItems: 1
+
+  phy-names:
+    const: usb3-phy
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - phys
+  - phy-names
+
+allOf:
+  - $ref: snps,dwc3.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/aspeed,ast2700-scu.h>
+    #include <dt-bindings/reset/aspeed,ast2700-scu.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    bus {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        usb@12030000 {
+            compatible = "aspeed,ast2700-xhci", "snps,dwc3";
+            reg = <0x0 0x12030000 0x0 0x10000>;
+            interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&syscon0 SCU0_CLK_GATE_PORTAUSB2CLK>,
+                     <&syscon0 SCU0_CLK_U2PHY_REFCLK>,
+                     <&syscon0 SCU0_CLK_U2PHY_CLK12M>;
+            clock-names = "bus_early", "ref", "suspend";
+            resets = <&syscon0 SCU0_RESET_PORTA_XHCI>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&pinctrl_usb3axh_default &pinctrl_usb2axh_default>;
+            phys = <&uphy3a>;
+            phy-names = "usb3-phy";
+            dr_mode = "host";
+        };
+    };

---
base-commit: be5c93fa674f0fc3c8f359c2143abce6bbb422e6
change-id: 20260624-xhci-185ffd9ef8bd

Best regards,
-- 
Ryan Chen <ryan_chen@aspeedtech.com>

