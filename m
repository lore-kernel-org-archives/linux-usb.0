Received: from ironport.ite.com.tw (219-87-157-213.static.tfn.net.tw [219.87.157.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B75E3A3E98;
	Mon, 15 Jun 2026 05:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=219.87.157.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781502997; cv=none; b=qfXfNjGZ89L3wo7hQiSTcm5rveJw2IOjI+cnVqCDnZ5K44XnStdt8eiwLC2SCc3pcj/gPvlLOSiKQgslPx+CpwM0OMDnZZWSaXmTz8WYlhOr9JR7OGS2lnopLAYVVXQ9RGraPnIDL8ZXiEmhfla7d6sKKLcN5mVEK/Rg9i+MtsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781502997; c=relaxed/simple;
	bh=r7HZ7SjJDL4kbPtuQtlzFQVOFeSBjL/KqcGWJpZYWXc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=eocNW2+fQ8+Ds1DPo8odPZ0qids2ZaFYSNKgCmC+rfJpThqudxCV+9Gi61zIQkhqixIuPqij/ws3oLTJzxPGB72xIZ8lSRM8KBUFLxS7IWavqR61K8WKxFcLLLGoHU8y56+jXxbiZ6aiPX2FVFBDTidP3aA5OK2Ayvn+iRyCcew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw; spf=pass smtp.mailfrom=ite.com.tw; dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b=bQvimAy9; arc=none smtp.client-ip=219.87.157.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b="bQvimAy9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=ite.com.tw; s=dkim;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=lHUDI48IB0vNnyP/jIIJx+CbSD3K8jAiqutdVgoT/9c=;
  b=bQvimAy9fB0broQUVQn07V/bugrfmUjAeIaJmLbKTLASAUJHis2pARHp
   Cwq0ScOmU93cGGvJj/86SuWlIQMDC8eNBbeJVh6TFvVZANghhGKUintnC
   fQ4tosMyDhsjmYeFwYwgTpRgMqNeSyC4wO4xK+XMR4m01DPKQIIMIUYb8
   lbM22jRXykbAEhLJw5/vG+YXLqZVrm4rqpLN/EvQAvRCiiilphguJ35+w
   SndnRzs8rCb04wVNrH8b23KC90WuYghfKg246Zq5MCVv5s60Z7om7tiGR
   Od3iT0U4h7U2pO9w68qyBEHicnkGjFwLHoMaZbFJq2KyrPryS1Wz6hNLc
   A==;
X-CSE-ConnectionGUID: Xam9FUj1RiSjk5g8XoBZLQ==
X-CSE-MsgGUID: fSgV5QVXSCyjJEazl3L7jA==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
  by ironport.ite.com.tw with ESMTP; 15 Jun 2026 13:48:56 +0800
Received: from hscmail1.internal.ite.com.tw (HSCMAIL1.internal.ite.com.tw [192.168.35.58])
	by mse.ite.com.tw with ESMTP id 65F5mrEw030761;
	Mon, 15 Jun 2026 13:48:53 +0800 (+08)
	(envelope-from amber.kao@ite.com.tw)
Received: from [127.0.1.1] (192.168.37.107) by HSCMAIL1.internal.ite.com.tw
 (192.168.35.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 15 Jun
 2026 13:48:51 +0800
From: Amber Kao <amber.kao@ite.com.tw>
Date: Mon, 15 Jun 2026 21:47:39 +0800
Subject: [PATCH 1/2] dt-bindings: usb: Add ITE IT885x support
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260615-ucsi-itepd-feature-v1-1-a826cfd0df6a@ite.com.tw>
References: <20260615-ucsi-itepd-feature-v1-0-a826cfd0df6a@ite.com.tw>
In-Reply-To: <20260615-ucsi-itepd-feature-v1-0-a826cfd0df6a@ite.com.tw>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Jeson Yang <jeson.yang@ite.com.tw>,
        Yaode Fang
	<Yaode.Fang@ite.com.tw>,
        Bling Chiang <Bling.Chiang@ite.com.tw>, Eric Su
	<Eric.Su@ite.com.tw>,
        Doreen Lin <doreen.lin@ite.com.tw>,
        Heikki Krogerus
	<heikki.krogerus@linux.intel.com>
CC: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Amber Kao <amber.kao@ite.com.tw>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: CSBMAIL1.internal.ite.com.tw (192.168.65.58) To
 HSCMAIL1.internal.ite.com.tw (192.168.35.58)
X-TM-SNTS-SMTP:
	7FD34ABA158DD4EF9E49A1E2FD261B5B5E556E7261FE938ED12F8974BC27CF4F2002:8
X-MAIL:mse.ite.com.tw 65F5mrEw030761

Add device tree binding documentation for the ITE IT885x.
The ITE IT885x is an I2C-based USB Type-C Power Delivery (PD) controller.

Cc: Yaode Fang <Yaode.Fang@ite.com.tw>
Cc: Jeson Yang <jeson.yang@ite.com.tw>
Cc: Bling Chiang <Bling.Chiang@ite.com.tw>
Cc: Eric Su <Eric.Su@ite.com.tw>
Cc: Doreen Lin <doreen.lin@ite.com.tw>
Signed-off-by: Amber Kao <amber.kao@ite.com.tw>
---
 .../devicetree/bindings/usb/ite,itepd-it885x.yaml  | 109 +++++++++++++++++++++
 MAINTAINERS                                        |  11 +++
 2 files changed, 120 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/ite,itepd-it885x.yaml b/Documentation/devicetree/bindings/usb/ite,itepd-it885x.yaml
new file mode 100644
index 000000000000..59e4eaa32ff1
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/ite,itepd-it885x.yaml
@@ -0,0 +1,109 @@
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
+  gpios:
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
+        itepd@40 {
+            compatible = "ite,itepd-it885x";
+            reg = <0x40>;
+            gpios = <&tlmm 129 GPIO_ACTIVE_LOW>;
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
index 461a3eed6129..94afe3729059 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13720,6 +13720,17 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml
 F:	drivers/gpu/drm/bridge/ite-it66121.c
 
+ITE IT885x TYPE-C PD CONTROLLER DRIVER
+M:	Amber Kao <amber.kao@ite.com.tw>
+M:	Jeson Yang <jeson.yang@ite.com.tw>
+R:	Yaode Fang <Yaode.Fang@ite.com.tw>
+R:	Bling Chiang <Bling.Chiang@ite.com.tw>
+R:	Eric Su <Eric.Su@ite.com.tw>
+R:	Doreen Lin <doreen.lin@ite.com.tw>
+L:	linux-usb@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/usb/ite,itepd-it885x.yaml
+
 IVTV VIDEO4LINUX DRIVER
 M:	Andy Walls <awalls@md.metrocast.net>
 L:	linux-media@vger.kernel.org

-- 
2.53.0

