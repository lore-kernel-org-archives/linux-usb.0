Return-Path: <SRS0=lM5t=SS=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B29FFC10F13
	for <linux-usb@archiver.kernel.org>; Tue, 16 Apr 2019 08:28:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8AFC22086A
	for <linux-usb@archiver.kernel.org>; Tue, 16 Apr 2019 08:28:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728393AbfDPI2N (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 16 Apr 2019 04:28:13 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:42153 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725840AbfDPI2N (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Apr 2019 04:28:13 -0400
X-Originating-IP: 90.88.18.121
Received: from localhost (aaubervilliers-681-1-63-121.w90-88.abo.wanadoo.fr [90.88.18.121])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 5805F240008;
        Tue, 16 Apr 2019 08:28:08 +0000 (UTC)
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-usb@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/6] dt-bindings: usb: Convert the generic OHCI binding to YAML
Date:   Tue, 16 Apr 2019 10:27:58 +0200
Message-Id:
 <d4f50759de223b4f7d57779d3df21a4408a935af.1555403233.git-series.maxime.ripard@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <d930537cfe3124de37b8ecf4eaa02b68ec94cb40.1555403233.git-series.maxime.ripard@bootlin.com>
References: <d930537cfe3124de37b8ecf4eaa02b68ec94cb40.1555403233.git-series.maxime.ripard@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190416082758.MItqM8li-3W4b6nd4vbKdMQp3CiLJJMdLlT4VDF0zfk@z>

The generic OHCI binding is used by many controllers that are using the
OHCI spec.

Convert that binding to a YAML description to enable the validation on all
the nodes using that binding.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 Documentation/devicetree/bindings/usb/generic-ohci.yaml | 89 ++++++++++-
 Documentation/devicetree/bindings/usb/usb-ohci.txt      | 35 +----
 2 files changed, 89 insertions(+), 35 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/generic-ohci.yaml
 delete mode 100644 Documentation/devicetree/bindings/usb/usb-ohci.txt

diff --git a/Documentation/devicetree/bindings/usb/generic-ohci.yaml b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
new file mode 100644
index 000000000000..da5a14becbe5
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
@@ -0,0 +1,89 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/generic-ohci.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: USB OHCI Controller Device Tree Bindings
+
+allOf:
+  - $ref: "usb-hcd.yaml"
+
+maintainers:
+  - Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+
+properties:
+  compatible:
+    contains:
+      const: generic-ohci
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  resets:
+    minItems: 1
+    maxItems: 2
+
+  clocks:
+    minItems: 1
+    maxItems: 3
+    description: |
+      In case the Renesas R-Car Gen3 SoCs:
+        - if a host only channel: first clock should be host.
+        - if a USB DRD channel: first clock should be host and second
+          one should be peripheral
+
+  big-endian:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Set this flag for HCDs with big endian descriptors and big
+      endian registers.
+
+  big-endian-desc:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Set this flag for HCDs with big endian descriptors.
+
+  big-endian-regs:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Set this flag for HCDs with big endian registers.
+
+  remote-wakeup-connected:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Remote wakeup is wired on the platform.
+
+  no-big-frame-no:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Set if frame_no lives in bits [15:0] of HCCA
+
+  num-ports:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Overrides the detected port count
+
+  phys: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+      ohci0: usb@1c14400 {
+          compatible = "allwinner,sun4i-a10-ohci", "generic-ohci";
+          reg = <0x01c14400 0x100>;
+          interrupts = <64>;
+          clocks = <&usb_clk 6>, <&ahb_gates 2>;
+          phys = <&usbphy 1>;
+      };
+
+...
diff --git a/Documentation/devicetree/bindings/usb/usb-ohci.txt b/Documentation/devicetree/bindings/usb/usb-ohci.txt
deleted file mode 100644
index aaaa5255c972..000000000000
--- a/Documentation/devicetree/bindings/usb/usb-ohci.txt
+++ /dev/null
@@ -1,35 +0,0 @@
-USB OHCI controllers
-
-Required properties:
-- compatible : "generic-ohci"
-- reg : ohci controller register range (address and length)
-- interrupts : ohci controller interrupt
-
-Optional properties:
-- big-endian-regs : boolean, set this for hcds with big-endian registers
-- big-endian-desc : boolean, set this for hcds with big-endian descriptors
-- big-endian : boolean, for hcds with big-endian-regs + big-endian-desc
-- no-big-frame-no : boolean, set if frame_no lives in bits [15:0] of HCCA
-- remote-wakeup-connected: remote wakeup is wired on the platform
-- num-ports : u32, to override the detected port count
-- clocks : a list of phandle + clock specifier pairs. In case of Renesas
-	   R-Car Gen3 SoCs:
-	   - if a host only channel: first clock should be host.
-	   - if a USB DRD channel: first clock should be host and second one
-				   should be peripheral.
-- phys : see usb-hcd.txt in the current directory
-- resets : a list of phandle + reset specifier pairs
-
-additionally the properties from usb-hcd.txt (in the current directory) are
-supported.
-
-Example:
-
-	ohci0: usb@1c14400 {
-		compatible = "allwinner,sun4i-a10-ohci", "generic-ohci";
-		reg = <0x01c14400 0x100>;
-		interrupts = <64>;
-		clocks = <&usb_clk 6>, <&ahb_gates 2>;
-		phys = <&usbphy 1>;
-		phy-names = "usb";
-	};
-- 
git-series 0.9.1
