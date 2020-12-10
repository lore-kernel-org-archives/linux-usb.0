Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14652C433FE
	for <linux-usb@archiver.kernel.org>; Thu, 10 Dec 2020 09:19:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C1FE823C43
	for <linux-usb@archiver.kernel.org>; Thu, 10 Dec 2020 09:19:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732006AbgLJJTf (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 10 Dec 2020 04:19:35 -0500
Received: from mx.baikalelectronics.ru ([94.125.187.42]:36920 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731311AbgLJJTb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 10 Dec 2020 04:19:31 -0500
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Felipe Balbi <balbi@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v4 05/10] powerpc: dts: akebono: Harmonize EHCI/OHCI DT nodes name
Date:   Thu, 10 Dec 2020 12:17:50 +0300
Message-ID: <20201210091756.18057-6-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20201210091756.18057-1-Sergey.Semin@baikalelectronics.ru>
References: <20201210091756.18057-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In accordance with the Generic EHCI/OHCI bindings the corresponding node
name is suppose to comply with the Generic USB HCD DT schema, which
requires the USB nodes to have the name acceptable by the regexp:
"^usb(@.*)?" . Make sure the "generic-ehci" and "generic-ohci"-compatible
nodes are correctly named.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/powerpc/boot/dts/akebono.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/boot/dts/akebono.dts b/arch/powerpc/boot/dts/akebono.dts
index df18f8dc4642..343326c30380 100644
--- a/arch/powerpc/boot/dts/akebono.dts
+++ b/arch/powerpc/boot/dts/akebono.dts
@@ -126,7 +126,7 @@ SATA0: sata@30000010000 {
 			interrupts = <93 2>;
 		};
 
-		EHCI0: ehci@30010000000 {
+		EHCI0: usb@30010000000 {
 			compatible = "ibm,476gtr-ehci", "generic-ehci";
 			reg = <0x300 0x10000000 0x0 0x10000>;
 			interrupt-parent = <&MPIC>;
@@ -140,14 +140,14 @@ SD0: sd@30000000000 {
 			interrupt-parent = <&MPIC>;
 		};
 
-		OHCI0: ohci@30010010000 {
+		OHCI0: usb@30010010000 {
 			compatible = "ibm,476gtr-ohci", "generic-ohci";
 			reg = <0x300 0x10010000 0x0 0x10000>;
 			interrupt-parent = <&MPIC>;
 			interrupts = <89 1>;
 			};
 
-		OHCI1: ohci@30010020000 {
+		OHCI1: usb@30010020000 {
 			compatible = "ibm,476gtr-ohci", "generic-ohci";
 			reg = <0x300 0x10020000 0x0 0x10000>;
 			interrupt-parent = <&MPIC>;
-- 
2.29.2

