Received: from ironport.ite.com.tw (60-251-196-230.hinet-ip.hinet.net [60.251.196.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DCBE3F39F5;
	Thu,  9 Jul 2026 08:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.251.196.230
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783586305; cv=none; b=TzUQuKatfpPmF5rSjSiEG7DNQDup1Ue8sw4RevfTeMfNVVoCfHGta+uUmkhG4Z4I8f/MVRW5OrJeasnH2RXWQhRr7xiTCL20vtwqxCen5tYMzzSkWbt4MTuQhkYW3zwu8EL9CQPlJOZtQFrdwrqxld6OSjDgEsV7yFEJEpbuF4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783586305; c=relaxed/simple;
	bh=9o+LYMvJ5wTINY6vywTmDSKEfqklmtFKkqmFQK7irC0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Ks6A96Tk17o1FlBM5Qk98/ClOTUDlxVThgGdkM7Kah71Oc0VkajSzgjP0XlTwbVqA16pCmdO3x2VXdR+ES1ON/LpedQqF2XmIoQ6SnQ2jjh0e36QrRx1e/4xR0Av8i+GpYqobAsxm3Q3JrlDus1cRE2p6Pg2ejsN7Dnv8z28gy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw; spf=pass smtp.mailfrom=ite.com.tw; dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b=hcsSZroH; arc=none smtp.client-ip=60.251.196.230
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b="hcsSZroH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=ite.com.tw; s=dkim;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=dl0sTBLRcsvu2kwdX88tZmgP8RojEdTSEm5X+P/uvkk=;
  b=hcsSZroH9jNZgkONg9vjB6Qi1lYVG0Lj7OLWxaE4a1YI5WYob/zdSNBt
   p6sON8G2ZzjcLkpdTGEzHaNRfEF/KVTbwyfIsaoBpqPTH3ntGdoGpGfBJ
   SFyTomm2g7KbyHPe63kjNfieia+DEh5XIYazYqVKVBBQmlCX5PYUDsXlD
   eIOTqQ8MUrKCoS6StysPgPyYXnM91R0WrEuF9MUQ0Irt+wILjTPGtEkLF
   D8/elCNG9+UuWpsz+RMVzzffQR0bXLBsdzKw15Tgk9BaK/X5hptIB3qqy
   PG4f8d5n1yLax6NVgHdwB+cYvLsBS6yPEdgnknYgTCkmpHuzHQjUrRUa8
   Q==;
X-CSE-ConnectionGUID: wVRz5ltPSISofCGq77huaQ==
X-CSE-MsgGUID: Nkfy+ZoZSseQLnpBdNHjfQ==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
  by ironport.ite.com.tw with ESMTP; 09 Jul 2026 16:34:55 +0800
Received: from hscmail1.internal.ite.com.tw (HSCMAIL1.internal.ite.com.tw [192.168.35.58])
	by mse.ite.com.tw with ESMTP id 6698Ymf9046663;
	Thu, 9 Jul 2026 16:34:48 +0800 (+08)
	(envelope-from amber.kao@ite.com.tw)
Received: from [127.0.1.1] (192.168.37.107) by HSCMAIL1.internal.ite.com.tw
 (192.168.35.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 9 Jul
 2026 16:34:46 +0800
From: Amber Kao <amber.kao@ite.com.tw>
Date: Fri, 10 Jul 2026 00:34:42 +0800
Subject: [PATCH v2 1/2] dt-bindings: usb: Add ITE IT885x support
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260710-ucsi-itepd-feature-v2-1-41943fd5df38@ite.com.tw>
References: <20260710-ucsi-itepd-feature-v2-0-41943fd5df38@ite.com.tw>
In-Reply-To: <20260710-ucsi-itepd-feature-v2-0-41943fd5df38@ite.com.tw>
To: Jeson Yang <jeson.yang@ite.com.tw>, Yaode Fang <Yaode.Fang@ite.com.tw>,
        Bling Chiang <Bling.Chiang@ite.com.tw>,
        Doreen Lin <doreen.lin@ite.com.tw>, Eric Su <Eric.Su@ite.com.tw>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki
 Krogerus <heikki.krogerus@linux.intel.com>
CC: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Amber Kao <amber.kao@ite.com.tw>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: CSBMAIL1.internal.ite.com.tw (192.168.65.58) To
 HSCMAIL1.internal.ite.com.tw (192.168.35.58)
X-TM-SNTS-SMTP:
	5EA805916C6A947DF9A92BF8E94E8E317E595490D18120358E8F26845D8ADA832002:8
X-MAIL:mse.ite.com.tw 6698Ymf9046663

Add device tree binding documentation for the ITE IT885x. The ITE
IT885x is an I2C-based USB Type-C Power Delivery (PD) controller.

v1 -> v2:
- Per Conor/Sashiko: dropped the redundant `gpios` property, the
  interrupt line is already described via `interrupts`
- Per Conor: renamed example node from `itepd@40` to `typec@40`

Cc: Yaode Fang <Yaode.Fang@ite.com.tw>
Cc: Jeson Yang <jeson.yang@ite.com.tw>
Cc: Bling Chiang <Bling.Chiang@ite.com.tw>
Cc: Eric Su <Eric.Su@ite.com.tw>
Cc: Doreen Lin <doreen.lin@ite.com.tw>
Signed-off-by: Amber Kao <amber.kao@ite.com.tw>

---
v1: https://lore.kernel.org/all/20260615-ucsi-itepd-feature-v1-0-a826cfd0df6a@ite.com.tw/
---
 .../devicetree/bindings/usb/ite,itepd-it885x.yaml  | 105 +++++++++++++++++++++
 MAINTAINERS                                        |  11 +++
 2 files changed, 116 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/ite,itepd-it885x.yaml b/Documentation/devicetree/bindings/usb/ite,itepd-it885x.yaml
new file mode 100644
index 000000000000..0a292a8e72cd
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/ite,itepd-it885x.yaml
@@ -0,0 +1,105 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/ite,itepd-it885x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ITE IT885x USB Type-C Power Delivery Controller
+
+maintainers:
+  - Jeson Yang <jeson.yang@ite.com.tw>
+
+description:
+  The ITE IT885x is an I2C-based USB Type-C Power Delivery (PD) controller.
+
+properties:
+  compatible:
+    const: ite,itepd-it885x
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  wakeup-source: true
+
+  pinctrl-names:
+    minItems: 1
+
+  pinctrl-0: true
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  "^connector(@[0-9a-f]+)?$":
+    $ref: /schemas/connector/usb-connector.yaml#
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+unevaluatedProperties: false
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
+        typec@40 {
+            compatible = "ite,itepd-it885x";
+            reg = <0x40>;
+            interrupts-extended = <&tlmm 129 IRQ_TYPE_EDGE_FALLING>;
+            wakeup-source;
+
+            pinctrl-names = "default";
+            pinctrl-0 = <&itepd_int_default>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            connector@0 {
+                compatible = "usb-c-connector";
+                reg = <0>;
+                label = "USB-C";
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
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 461a3eed6129..1b03fa3aa060 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13720,6 +13720,17 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml
 F:	drivers/gpu/drm/bridge/ite-it66121.c
 
+ITE IT885x TYPE-C PD CONTROLLER DRIVER
+M:	Jeson Yang <jeson.yang@ite.com.tw>
+M:	Amber Kao <amber.kao@ite.com.tw>
+R:	Yaode Fang <Yaode.Fang@ite.com.tw>
+R:	Bling Chiang <Bling.Chiang@ite.com.tw>
+R:	Doreen Lin <doreen.lin@ite.com.tw>
+R:	Eric Su <Eric.Su@ite.com.tw>
+L:	linux-usb@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/usb/ite,itepd-it885x.yaml
+
 IVTV VIDEO4LINUX DRIVER
 M:	Andy Walls <awalls@md.metrocast.net>
 L:	linux-media@vger.kernel.org

-- 
2.53.0

