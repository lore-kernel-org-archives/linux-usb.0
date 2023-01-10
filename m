Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F415C54EBC
	for <linux-usb@archiver.kernel.org>; Tue, 10 Jan 2023 18:11:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234655AbjAJSLK (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 10 Jan 2023 13:11:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238934AbjAJSKP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 Jan 2023 13:10:15 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DF06C57
        for <linux-usb@vger.kernel.org>; Tue, 10 Jan 2023 10:08:16 -0800 (PST)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <l.stach@pengutronix.de>)
        id 1pFJ2c-0002VQ-CO; Tue, 10 Jan 2023 19:08:06 +0100
From:   Lucas Stach <l.stach@pengutronix.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>, Li Jun <jun.li@nxp.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, patchwork-lst@pengutronix.de
Subject: [PATCH resend] dt-bindings: usb: dwc3-imx8mp: add power domain property
Date:   Tue, 10 Jan 2023 19:08:04 +0100
Message-Id: <20230110180804.594462-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The USB controllers in the i.MX8MP are located inside the HSIO
power domain. Add the power-domains property to the DT binding
to be able to describe the hardware properly.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml b/Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml
index 01ab0f922ae8..3fb4feb6d3d9 100644
--- a/Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml
@@ -71,6 +71,9 @@ properties:
     description:
       Power pad (PWR) polarity is active low.
 
+  power-domains:
+    maxItems: 1
+
 # Required child node:
 
 patternProperties:
@@ -87,12 +90,14 @@ required:
   - clocks
   - clock-names
   - interrupts
+  - power-domains
 
 additionalProperties: false
 
 examples:
   - |
     #include <dt-bindings/clock/imx8mp-clock.h>
+    #include <dt-bindings/power/imx8mp-power.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     usb3_0: usb@32f10100 {
       compatible = "fsl,imx8mp-dwc3";
@@ -102,6 +107,7 @@ examples:
                <&clk IMX8MP_CLK_USB_ROOT>;
       clock-names = "hsio", "suspend";
       interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
+      power-domains = <&hsio_blk_ctrl IMX8MP_HSIOBLK_PD_USB>;
       #address-cells = <1>;
       #size-cells = <1>;
       dma-ranges = <0x40000000 0x40000000 0xc0000000>;
-- 
2.30.2

