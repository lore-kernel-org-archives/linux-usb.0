Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33873C2BB9A
	for <linux-usb@archiver.kernel.org>; Thu, 10 Dec 2020 09:20:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D5DD823D9A
	for <linux-usb@archiver.kernel.org>; Thu, 10 Dec 2020 09:20:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388876AbgLJJTe (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 10 Dec 2020 04:19:34 -0500
Received: from ns2.baikalchip.com ([94.125.187.42]:36918 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728990AbgLJJTc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 10 Dec 2020 04:19:32 -0500
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Felipe Balbi <balbi@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Santosh Shilimkar <ssantosh@kernel.org>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v4 06/10] arm: dts: keystone: Harmonize DWC USB3 DT nodes name
Date:   Thu, 10 Dec 2020 12:17:51 +0300
Message-ID: <20201210091756.18057-7-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20201210091756.18057-1-Sergey.Semin@baikalelectronics.ru>
References: <20201210091756.18057-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In accordance with the DWC USB3 bindings the corresponding node
name is suppose to comply with the Generic USB HCD DT schema, which
requires the USB nodes to have the name acceptable by the regexp:
"^usb(@.*)?" . Make sure the "snps,dwc3"-compatible nodes are correctly
named.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/keystone-k2e.dtsi | 4 ++--
 arch/arm/boot/dts/keystone.dtsi     | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/keystone-k2e.dtsi b/arch/arm/boot/dts/keystone-k2e.dtsi
index fa1b8499c5a7..b8f152e7af7f 100644
--- a/arch/arm/boot/dts/keystone-k2e.dtsi
+++ b/arch/arm/boot/dts/keystone-k2e.dtsi
@@ -52,7 +52,7 @@ &soc0 {
 
 		usb: usb@2680000 {
 			interrupts = <GIC_SPI 152 IRQ_TYPE_EDGE_RISING>;
-			dwc3@2690000 {
+			usb@2690000 {
 				interrupts = <GIC_SPI 152 IRQ_TYPE_EDGE_RISING>;
 			};
 		};
@@ -78,7 +78,7 @@ keystone_usb1: usb@25000000 {
 			dma-ranges;
 			status = "disabled";
 
-			usb1: dwc3@25010000 {
+			usb1: usb@25010000 {
 				compatible = "snps,dwc3";
 				reg = <0x25010000 0x70000>;
 				interrupts = <GIC_SPI 414 IRQ_TYPE_EDGE_RISING>;
diff --git a/arch/arm/boot/dts/keystone.dtsi b/arch/arm/boot/dts/keystone.dtsi
index 8d046a1b690c..fc9fdc857ae8 100644
--- a/arch/arm/boot/dts/keystone.dtsi
+++ b/arch/arm/boot/dts/keystone.dtsi
@@ -217,7 +217,7 @@ keystone_usb0: usb@2680000 {
 			dma-ranges;
 			status = "disabled";
 
-			usb0: dwc3@2690000 {
+			usb0: usb@2690000 {
 				compatible = "snps,dwc3";
 				reg = <0x2690000 0x70000>;
 				interrupts = <GIC_SPI 393 IRQ_TYPE_EDGE_RISING>;
-- 
2.29.2

