Return-Path: <SRS0=lM5t=SS=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C74DC10F13
	for <linux-usb@archiver.kernel.org>; Tue, 16 Apr 2019 08:28:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 398AC2073F
	for <linux-usb@archiver.kernel.org>; Tue, 16 Apr 2019 08:28:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728807AbfDPI2X (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 16 Apr 2019 04:28:23 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:46033 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728757AbfDPI2W (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Apr 2019 04:28:22 -0400
X-Originating-IP: 90.88.18.121
Received: from localhost (aaubervilliers-681-1-63-121.w90-88.abo.wanadoo.fr [90.88.18.121])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 053141BF208;
        Tue, 16 Apr 2019 08:28:19 +0000 (UTC)
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-usb@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 5/6] ARM: dts: sunxi: h3/h5: Remove useless phy-names from EHCI and OHCI
Date:   Tue, 16 Apr 2019 10:28:01 +0200
Message-Id:
 <0fde1ca2c173ff124aa55811ed066ae215734eb0.1555403233.git-series.maxime.ripard@bootlin.com>
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
Message-ID: <20190416082801.S50HvxHBki_WuWlI2JJ06cFOZFsEgE9CQmPnvdaMIKk@z>

Neither the OHCI or EHCI bindings are using the phy-names property, so we
can just drop it.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 arch/arm/boot/dts/sunxi-h3-h5.dtsi | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm/boot/dts/sunxi-h3-h5.dtsi b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
index 3b18fd71efc1..84977d4eb97a 100644
--- a/arch/arm/boot/dts/sunxi-h3-h5.dtsi
+++ b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
@@ -304,7 +304,6 @@
 			clocks = <&ccu CLK_BUS_EHCI1>, <&ccu CLK_BUS_OHCI1>;
 			resets = <&ccu RST_BUS_EHCI1>, <&ccu RST_BUS_OHCI1>;
 			phys = <&usbphy 1>;
-			phy-names = "usb";
 			status = "disabled";
 		};
 
@@ -316,7 +315,6 @@
 				 <&ccu CLK_USB_OHCI1>;
 			resets = <&ccu RST_BUS_EHCI1>, <&ccu RST_BUS_OHCI1>;
 			phys = <&usbphy 1>;
-			phy-names = "usb";
 			status = "disabled";
 		};
 
@@ -327,7 +325,6 @@
 			clocks = <&ccu CLK_BUS_EHCI2>, <&ccu CLK_BUS_OHCI2>;
 			resets = <&ccu RST_BUS_EHCI2>, <&ccu RST_BUS_OHCI2>;
 			phys = <&usbphy 2>;
-			phy-names = "usb";
 			status = "disabled";
 		};
 
@@ -339,7 +336,6 @@
 				 <&ccu CLK_USB_OHCI2>;
 			resets = <&ccu RST_BUS_EHCI2>, <&ccu RST_BUS_OHCI2>;
 			phys = <&usbphy 2>;
-			phy-names = "usb";
 			status = "disabled";
 		};
 
@@ -350,7 +346,6 @@
 			clocks = <&ccu CLK_BUS_EHCI3>, <&ccu CLK_BUS_OHCI3>;
 			resets = <&ccu RST_BUS_EHCI3>, <&ccu RST_BUS_OHCI3>;
 			phys = <&usbphy 3>;
-			phy-names = "usb";
 			status = "disabled";
 		};
 
@@ -362,7 +357,6 @@
 				 <&ccu CLK_USB_OHCI3>;
 			resets = <&ccu RST_BUS_EHCI3>, <&ccu RST_BUS_OHCI3>;
 			phys = <&usbphy 3>;
-			phy-names = "usb";
 			status = "disabled";
 		};
 
-- 
git-series 0.9.1
