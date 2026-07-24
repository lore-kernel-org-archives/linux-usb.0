Received: from ironport.ite.com.tw (60-251-196-230.hinet-ip.hinet.net [60.251.196.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96AB0416878;
	Fri, 24 Jul 2026 10:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.251.196.230
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784887743; cv=none; b=BwTuO4iGsKt5+bL6ycIjuvr7eaLhDeR0fbq6Okql1baEubHORwYyotMTg2G7q3ug4/H+HSgcLcbmxUafAXCfRo86KdZlrXsl/KnfGsS1N2RVqSrQCOx6yYhquZJS0AsaBvip7Jkb6JeTcjXvdL4+PNzDYWFMjpZtgCuK4Yf5VFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784887743; c=relaxed/simple;
	bh=acEI5Gw6dYNxP33jw0e2rAhD+c+eK3jrTue64c2uSqE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=UhIhYzX2gVqVxcMQnfOwmnGyrsAGgj1hA/1BBsSR/2kld37XD/x5UwuKH7t0HzjTuwQocMIuIA69oXvYRQVnpFgn8XclIuEzAV+eZneCJy6zhdWWznHAQ8H0NY/1/AvXoVrGw16O8j6+s6vM4ezkfEdJDvXJFzw8ZrId/7WqWp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw; spf=pass smtp.mailfrom=ite.com.tw; dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b=Ji3xYmDf; arc=none smtp.client-ip=60.251.196.230
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b="Ji3xYmDf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=ite.com.tw; s=dkim;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=P9vgipVo0TutfRAiI+OJ1Sg2e3LF+xl6HfO0OK57zVY=;
  b=Ji3xYmDf0R90+fTFP6SBt3GxrR1YM/siujZI8RaAXjaXUT3HsAgHR5M0
   YLhH5WdTTZSjSxTzrHIHdxzTwW1Hb4w9O5CGth1e7MFpiwEAzNtGbUMp1
   wK3LF1ipq4GdUWtS4riDmgFTJWQv2OP288aiJze94zUqwEM9oTySRt9P0
   5ZZ1P2E/xGDNtqdzSell3QgX31JeaUssBQZJ2hxvNDHtxP2RR3OjfDm8c
   u8VivwGVS6J3oB6SFl6BD092mYD7nWv20pLYzwbmTYJPBEQ9CW4QQxGre
   SPp9U3hMJfkQ6WdJsUlX8MiYAldFROiUFVIHPnA3pLHCleVxl96Va3zBx
   w==;
X-CSE-ConnectionGUID: AxBMMWzaQ/OGqR670JY3cA==
X-CSE-MsgGUID: gF1aoK4TSLW3l5LtKO/EXw==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
  by ironport.ite.com.tw with ESMTP; 24 Jul 2026 18:08:49 +0800
Received: from hscmail1.internal.ite.com.tw (HSCMAIL1.internal.ite.com.tw [192.168.35.58])
	by mse.ite.com.tw with ESMTP id 66OA8hIb061267;
	Fri, 24 Jul 2026 18:08:43 +0800 (+08)
	(envelope-from amber.kao@ite.com.tw)
Received: from [127.0.1.1] (192.168.37.107) by HSCMAIL1.internal.ite.com.tw
 (192.168.35.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 24 Jul
 2026 18:08:41 +0800
From: Amber Kao <amber.kao@ite.com.tw>
Date: Fri, 24 Jul 2026 18:09:19 +0800
Subject: [PATCH v5 1/2] dt-bindings: usb: Add ITE IT8851/IT8853 Type-C PD
 controllers
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260724-ucsi-itepd-v5-1-d1a83e5c9c77@ite.com.tw>
References: <20260724-ucsi-itepd-v5-0-d1a83e5c9c77@ite.com.tw>
In-Reply-To: <20260724-ucsi-itepd-v5-0-d1a83e5c9c77@ite.com.tw>
To: Jeson Yang <jeson.yang@ite.com.tw>, Yaode Fang <Yaode.Fang@ite.com.tw>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Amber Kao <amber.kao@ite.com.tw>,
        Bling
 Chiang <Bling.Chiang@ite.com.tw>, Eric Su <Eric.Su@ite.com.tw>,
        Doreen Lin
	<doreen.lin@ite.com.tw>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TPEMAIL1.internal.ite.com.tw (192.168.15.58) To
 HSCMAIL1.internal.ite.com.tw (192.168.35.58)
X-TM-SNTS-SMTP:
	47243B1D9EF50DB4B817731147E835B8E67EA0F016C52FF6E6074A0DD840BDA02002:8
X-MAIL:mse.ite.com.tw 66OA8hIb061267

Add device tree binding for the ITE IT8851 and IT8853 I2C-based USB
Type-C Power Delivery controllers.
The IT8851 supports one Type-C port; the IT8853 is the two-port variant
sharing the same interface.

Add a MAINTAINERS entry for the binding.

Cc: Yaode Fang <Yaode.Fang@ite.com.tw>
Cc: Jeson Yang <jeson.yang@ite.com.tw>
Cc: Bling Chiang <Bling.Chiang@ite.com.tw>
Cc: Eric Su <Eric.Su@ite.com.tw>
Cc: Doreen Lin <doreen.lin@ite.com.tw>
Signed-off-by: Amber Kao <amber.kao@ite.com.tw>
---
 .../devicetree/bindings/usb/ite,it8851.yaml        | 151 +++++++++++++++++++++
 MAINTAINERS                                        |   8 ++
 2 files changed, 159 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/ite,it8851.yaml b/Documentation/devicetree/bindings/usb/ite,it8851.yaml
new file mode 100644
index 000000000000..246d34734b4a
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/ite,it8851.yaml
@@ -0,0 +1,151 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/ite,it8851.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ITE IT8851/IT8853 USB Type-C Power Delivery Controller
+
+maintainers:
+  - Jeson Yang <jeson.yang@ite.com.tw>
+
+description:
+  The ITE IT8851 is an I2C-based USB Type-C Power Delivery (PD) controller
+  supporting one Type-C port.
+  The IT8853 is the two-port variant sharing the same programming interface.
+
+properties:
+  compatible:
+    oneOf:
+      - const: ite,it8851
+      - items:
+          - const: ite,it8853
+          - const: ite,it8851
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  wakeup-source: true
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  '^connector@[01]$':
+    $ref: /schemas/connector/usb-connector.yaml#
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+anyOf:
+  - required:
+      - connector@0
+  - required:
+      - connector@1
+
+allOf:
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: ite,it8853
+    then:
+      properties:
+        connector@1: false
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        typec@40 {
+            compatible = "ite,it8853", "ite,it8851";
+            reg = <0x40>;
+            interrupts-extended = <&tlmm 129 IRQ_TYPE_EDGE_FALLING>;
+            wakeup-source;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            connector@0 {
+                compatible = "usb-c-connector";
+                reg = <0>;
+                label = "USB-C-0";
+                power-role = "dual";
+                data-role = "dual";
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+                        endpoint {
+                            remote-endpoint = <&eud_con>;
+                        };
+                    };
+
+                    port@1 {
+                        reg = <1>;
+                        endpoint {
+                            remote-endpoint = <&redriver_ss_out>;
+                        };
+                    };
+
+                    port@2 {
+                        reg = <2>;
+                        endpoint {
+                            remote-endpoint = <&fsa4480_sbu_mux>;
+                        };
+                    };
+                };
+            };
+
+            connector@1 {
+                compatible = "usb-c-connector";
+                reg = <1>;
+                label = "USB-C-1";
+                power-role = "dual";
+                data-role = "dual";
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+                        endpoint {
+                          remote-endpoint = <&usb1_hs_con>;
+                        };
+                    };
+                    port@1 {
+                        reg = <1>;
+                        endpoint {
+                          remote-endpoint = <&redriver1_ss_out>;
+                        };
+                    };
+                    port@2 {
+                        reg = <2>;
+                        endpoint {
+                          remote-endpoint = <&sbu_mux1>;
+                        };
+                    };
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 461a3eed6129..ec0eeea79b9e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13720,6 +13720,14 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml
 F:	drivers/gpu/drm/bridge/ite-it66121.c
 
+ITE IT8851 TYPE-C PD CONTROLLER DRIVER
+M:	Amber Kao <amber.kao@ite.com.tw>
+R:	Jeson Yang <jeson.yang@ite.com.tw>
+R:	Yaode Fang <Yaode.Fang@ite.com.tw>
+L:	linux-usb@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/usb/ite,it8851.yaml
+
 IVTV VIDEO4LINUX DRIVER
 M:	Andy Walls <awalls@md.metrocast.net>
 L:	linux-media@vger.kernel.org

-- 
2.53.0

