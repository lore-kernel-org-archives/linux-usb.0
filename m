Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D13A34AB03;
	Mon, 20 Jul 2026 08:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784535505; cv=none; b=VDeKXrw2wyuICzWu7M+j23fNdqAXJrRLm6iJTvxK7Rp26RXTMARIfbPl/B29tvE3Frjik0ZBOrtMJVav0tWpfxwjdA6G4pW0gPG7l+vBZMb8L+91KiGMVfQqz4OMOI7qisqxJ8v7+nGL8RVTbrxOBmiEMDKrcgV3Tpi97fjPiv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784535505; c=relaxed/simple;
	bh=kh+4forG9eyv2B/t196KzV1WdpdWQaSAkOWLP27ZN80=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hz+X+qiz3G5FuVF+KrN4mx1NDu3IbVK3+sEwQdnldOUPhpU8bHp/7WnfwPSKJ93XnJR+okkB1w0BSi2M4G5CtaqbSv8nIuCEqB8n7LqzTjisDv8x+Qzd720pLDmW0PVeXu/1TEjUUBxjmhgIDQBVREup2PJmxwZzEYqFdtjgvcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=LzdAj6g1; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="LzdAj6g1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Date:Subject:MIME-Version:Content-Type:
	Message-Id:To; bh=IhXATI2C4JzWL8tShtQ2nZtOGBBOqoNx3sHCUlOGW3U=;
	b=LzdAj6g1I3JA12YDFFhkfiOjN0e+RNkmUh4J6Y0C3njfK+a8w+t+CVeuVN1mKm
	jaVfDBn8xLxdFbW5qrSEfIueLhvkPF/w8uczr8W8PCL78RSf52bD9uXc6NmbV9PF
	szyjVYNcJuhzlkhkCA5PEkC/o5cU+10+DoGUzyTCx4VJw=
Received: from [127.0.1.1] (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wA3PReg2V1qcZ5iKg--.42916S3;
	Mon, 20 Jul 2026 16:17:40 +0800 (CST)
From: Hongyang Zhao <hongyang.zhao@163.com>
Date: Mon, 20 Jul 2026 16:17:11 +0800
Subject: [PATCH 1/3] dt-bindings: usb: Add Hynetek HUSB320 Type-C
 controller
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-husb320-v1-1-4a1e259d7dc8@163.com>
References: <20260720-husb320-v1-0-4a1e259d7dc8@163.com>
In-Reply-To: <20260720-husb320-v1-0-4a1e259d7dc8@163.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: Roger Shimizu <rosh@debian.org>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hongyang Zhao <hongyang.zhao@163.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784535459; l=5179;
 i=hongyang.zhao@163.com; s=20260127; h=from:subject:message-id;
 bh=kh+4forG9eyv2B/t196KzV1WdpdWQaSAkOWLP27ZN80=;
 b=mJUQwdiGMIm9ZMcBbsBXmZilbETueok5dNFqiRRo2KMud4VV+d9pfsdAUvZ+9NCEu7Y00JGVy
 Ht/scPTSuLqD859cgPtRRnJnkh2xHnXhH9PqmSbQ72rXHqZKfkzO2Bp
X-Developer-Key: i=hongyang.zhao@163.com; a=ed25519;
 pk=D9yL5W9Zj0lPBDAq9gzY++1849VlXuTWAkROzZ88J/4=
X-CM-TRANSID:_____wA3PReg2V1qcZ5iKg--.42916S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxCF1xtrWruFW7Zr48uFyrXrb_yoWrXF1fpF
	ZxCrs3J3y0gryfuaykJF18u3WYyFWkC3Z5Cr17X34UKFs8Kas3t3yakry5Xa47GrykXa43
	XFWDZF1xtwnrCaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UU5rxUUUUU=
X-CM-SenderInfo: 5krqw5hdqjh6xkdrqiywtou0bp/xtbCzwWRbmpd2aVfEQAA3w

The HUSB320 is an autonomous USB Type-C Configuration Channel
controller supporting source, sink, and dual-role port operation.

Document its two I2C addresses, active-low interrupt, optional supplies
and enable GPIO, and managed USB-C connector.

Signed-off-by: Hongyang Zhao <hongyang.zhao@163.com>
---
 .../devicetree/bindings/usb/hynetek,husb320.yaml   | 171 +++++++++++++++++++++
 1 file changed, 171 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/hynetek,husb320.yaml b/Documentation/devicetree/bindings/usb/hynetek,husb320.yaml
new file mode 100644
index 000000000000..b84b6b725e84
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/hynetek,husb320.yaml
@@ -0,0 +1,171 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/hynetek,husb320.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Hynetek HUSB320 USB Type-C controller
+
+maintainers:
+  - Hongyang Zhao <hongyang.zhao@163.com>
+
+description:
+  The HUSB320 is an autonomous USB Type-C Configuration Channel controller.
+  It supports source, sink and dual-role port configurations, including
+  optional Try.SRC and Try.SNK role preferences. The controller reports cable
+  attachment, orientation, advertised current and accessory detection over
+  I2C and an active-low interrupt.
+
+properties:
+  compatible:
+    const: hynetek,husb320
+
+  reg:
+    description:
+      7-bit I2C address selected by the ADDR/ORIENT pin strap. Ground selects
+      0x21 and VDD selects 0x31. These correspond to the 8-bit write addresses
+      0x42 and 0x62 shown in the datasheet.
+    enum: [0x21, 0x31]
+
+  interrupts:
+    maxItems: 1
+
+  wakeup-source: true
+
+  vdd-supply:
+    description: Power supply for the controller
+
+  enable-gpios:
+    description: Active-low controller enable
+    maxItems: 1
+
+  connector:
+    type: object
+    $ref: /schemas/connector/usb-connector.yaml#
+    unevaluatedProperties: false
+    description:
+      USB Type-C connector managed by the controller. A dual-role data port
+      requires a High-Speed graph connection to a USB role-switch provider.
+
+    properties:
+      compatible:
+        const: usb-c-connector
+
+      try-power-role:
+        enum: [source, sink]
+
+    required:
+      - compatible
+      - pd-disable
+      - power-role
+      - typec-power-opmode
+
+    allOf:
+      - if:
+          properties:
+            power-role:
+              enum: [source, dual]
+        then:
+          required:
+            - vbus-supply
+
+      - if:
+          properties:
+            power-role:
+              const: source
+        then:
+          properties:
+            data-role:
+              const: host
+            try-power-role: false
+
+      - if:
+          properties:
+            power-role:
+              const: sink
+        then:
+          properties:
+            data-role:
+              const: device
+            try-power-role: false
+
+      - if:
+          properties:
+            power-role:
+              const: dual
+        then:
+          properties:
+            data-role:
+              const: dual
+
+      - if:
+          required:
+            - data-role
+          properties:
+            data-role:
+              const: dual
+        then:
+          anyOf:
+            - required:
+                - port
+            - required:
+                - ports
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - connector
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        typec@31 {
+            compatible = "hynetek,husb320";
+            reg = <0x31>;
+            vdd-supply = <&vreg_3v3>;
+            enable-gpios = <&gpio 54 GPIO_ACTIVE_LOW>;
+            interrupts-extended = <&gpio 55 IRQ_TYPE_LEVEL_LOW>;
+            wakeup-source;
+
+            connector {
+                compatible = "usb-c-connector";
+                label = "USB-C";
+                vbus-supply = <&usb_vbus>;
+                data-role = "dual";
+                power-role = "dual";
+                try-power-role = "sink";
+                typec-power-opmode = "default";
+                pd-disable;
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+
+                        endpoint {
+                            remote-endpoint = <&usb_role>;
+                        };
+                    };
+
+                    port@1 {
+                        reg = <1>;
+
+                        endpoint {
+                            remote-endpoint = <&usb_ss>;
+                        };
+                    };
+                };
+            };
+        };
+    };

-- 
2.43.0

