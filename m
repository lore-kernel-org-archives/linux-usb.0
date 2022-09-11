Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DECB3C6FA83
	for <linux-usb@archiver.kernel.org>; Mon, 12 Sep 2022 00:01:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229567AbiILABw (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 11 Sep 2022 20:01:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbiILABu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 11 Sep 2022 20:01:50 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8252F1F2DF;
        Sun, 11 Sep 2022 17:01:49 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A8A8816F8;
        Sun, 11 Sep 2022 17:01:55 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9AFF03F73B;
        Sun, 11 Sep 2022 17:01:46 -0700 (PDT)
From:   Andre Przywara <andre.przywara@arm.com>
To:     Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, Karl Kurbjun <karl.os@veroson.com>,
        Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH 2/7] dt-bindings: usb: Add special clock for Allwinner H616 PHY
Date:   Mon, 12 Sep 2022 00:59:40 +0100
Message-Id: <20220911235945.6635-3-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220911235945.6635-1-andre.przywara@arm.com>
References: <20220911235945.6635-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The USB PHY IP in the Allwinner H616 SoC requires a quirk that involves
some resources from port 2's PHY and HCI IP. In particular the PMU clock
for port 2 must be surely ungated before accessing the REG_HCI_PHY_CTL
register of port 2. To allow each USB port to be controlled
independently of port 2, we need a handle to that particular PMU clock
in the *PHY* node, as the HCI and PHY part might be handled by separate
drivers.

Add that clock to the requirements of the H616 PHY binding, so that a
PHY driver can apply the quirk in isolation, without requiring help from
port 2's HCI driver.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 .../phy/allwinner,sun8i-h3-usb-phy.yaml       | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/allwinner,sun8i-h3-usb-phy.yaml b/Documentation/devicetree/bindings/phy/allwinner,sun8i-h3-usb-phy.yaml
index e288450e0844..3a3168392597 100644
--- a/Documentation/devicetree/bindings/phy/allwinner,sun8i-h3-usb-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/allwinner,sun8i-h3-usb-phy.yaml
@@ -36,18 +36,22 @@ properties:
       - const: pmu3
 
   clocks:
+    minItems: 4
     items:
       - description: USB OTG PHY bus clock
       - description: USB Host 0 PHY bus clock
       - description: USB Host 1 PHY bus clock
       - description: USB Host 2 PHY bus clock
+      - description: PMU clock for host port 2
 
   clock-names:
+    minItems: 4
     items:
       - const: usb0_phy
       - const: usb1_phy
       - const: usb2_phy
       - const: usb3_phy
+      - const: pmu2_clk
 
   resets:
     items:
@@ -98,6 +102,21 @@ required:
 
 additionalProperties: false
 
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - sun50i-h616-usb-phy
+
+then:
+  properties:
+    clocks:
+      minItems: 5
+
+    clock-names:
+      minItems: 5
+
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
-- 
2.35.3

