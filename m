Received: from ironport.ite.com.tw (60-251-196-230.hinet-ip.hinet.net [60.251.196.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBEBE3E7BB0;
	Fri, 31 Jul 2026 10:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.251.196.230
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785492150; cv=none; b=HP1NtX+TAbpJyGrVVrZ9ZYNKzJsVjmzlW13AyeP8z3e+SjC3CaAwppThvS40HaDoaSfheEkK33WrVDf1nwFfI4csuQ6c8zFrgWNGKf5+ctIPw2e8YpmtCT3huMGAX55NiFYMeyPQWGJ7OLAf8+5H0OJ6W+FkIyourpB3hq7oyqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785492150; c=relaxed/simple;
	bh=IZPAxIKUCc6svbkSeBMwX1RX+AQy58Z6xCNDoGq/Ric=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=rVP6/HzQLdQfGklk1JbvOxsW8XeBFVsP4KMqIOJv2jg3luP2gA1HZdFkN70OfYA2wgCEvZbkxcop/fhAwarlGjCip/X2jmq5rEskHeDmbSpsLHY35QKzcTdgRt3XEAUDI9He3Hp9SvAwQcbCcd8OFmmjwDQmNFM/csvit17P034=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw; spf=pass smtp.mailfrom=ite.com.tw; dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b=kHSzSjfJ; arc=none smtp.client-ip=60.251.196.230
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b="kHSzSjfJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=ite.com.tw; s=dkim;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=x/zXcSSIniSdyLwC9Nz372K+ayiRmOI5iQTyTGTNpQQ=;
  b=kHSzSjfJAwG5VizMmFmbb18PNgUaMmwpUsQv70lR/PgB+g4b8xKvzfi5
   keTBIFVid4l9LNPOksqxpT8ZxekL8yGGGTKlBO3cDNQqq0sG4tKmclj3s
   fHXDW4rLB4x3Z3EHmLQKlp+oiy7zUe/V6SHxXgHA9IA5xnHexfWQVr3J+
   c+cEI0Z97c5iRJyP2wqlbW9LizRLKujfBItgfCn5ymhdBJGyj2ydfIIVo
   UFs1bk5itmgWwNDtEc+Zsae6ivXVFblJVJAAYjRBvD1lQ++25Mxr0najR
   d5jNNYNn1u347vPzqyDnS44wZPQtiTJWZ5sI+jViB9Kz+ohXGm3z7Bq05
   w==;
X-CSE-ConnectionGUID: 5drS5tONTHWxGQNiq4lNmw==
X-CSE-MsgGUID: ey/n6KIhSX2dE7DBqbA9Eg==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
  by ironport.ite.com.tw with ESMTP; 31 Jul 2026 18:01:52 +0800
Received: from hscmail1.internal.ite.com.tw (HSCMAIL1.internal.ite.com.tw [192.168.35.58])
	by mse.ite.com.tw with ESMTP id 66VA1knq005672;
	Fri, 31 Jul 2026 18:01:46 +0800 (+08)
	(envelope-from amber.kao@ite.com.tw)
Received: from [127.0.1.1] (192.168.37.107) by HSCMAIL1.internal.ite.com.tw
 (192.168.35.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 31 Jul
 2026 18:01:44 +0800
From: Amber Kao <amber.kao@ite.com.tw>
Date: Fri, 31 Jul 2026 18:02:03 +0800
Subject: [PATCH v6 1/2] dt-bindings: usb: Add ITE IT8851/IT8853 Type-C PD
 controllers
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260731-ucsi-itepd-v6-1-d25ae12b181f@ite.com.tw>
References: <20260731-ucsi-itepd-v6-0-d25ae12b181f@ite.com.tw>
In-Reply-To: <20260731-ucsi-itepd-v6-0-d25ae12b181f@ite.com.tw>
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
	<doreen.lin@ite.com.tw>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TPEMAIL1.internal.ite.com.tw (192.168.15.58) To
 HSCMAIL1.internal.ite.com.tw (192.168.35.58)
X-TM-SNTS-SMTP:
	ACDA380D6A546B158E8E437BD98DCD71ACE3CAFF1442ADD27F660B008A14B08D2002:8
X-MAIL:mse.ite.com.tw 66VA1knq005672

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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

