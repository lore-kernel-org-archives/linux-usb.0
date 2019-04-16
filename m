Return-Path: <SRS0=lM5t=SS=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 161A7C10F13
	for <linux-usb@archiver.kernel.org>; Tue, 16 Apr 2019 08:28:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DA1CF2073F
	for <linux-usb@archiver.kernel.org>; Tue, 16 Apr 2019 08:28:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728686AbfDPI2U (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 16 Apr 2019 04:28:20 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:57841 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728543AbfDPI2U (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Apr 2019 04:28:20 -0400
X-Originating-IP: 90.88.18.121
Received: from localhost (aaubervilliers-681-1-63-121.w90-88.abo.wanadoo.fr [90.88.18.121])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 54B811BF215;
        Tue, 16 Apr 2019 08:28:13 +0000 (UTC)
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-usb@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/6] ARM: dts: sunxi: Remove useless phy-names from EHCI and OHCI
Date:   Tue, 16 Apr 2019 10:28:00 +0200
Message-Id:
 <b7c3e6ebb9a98458b50f66323f8aa15f7af1772e.1555403233.git-series.maxime.ripard@bootlin.com>
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
Message-ID: <20190416082800.L4fkfo_w9Lilq3NN-1h0jTlijIirWsQETMhUlJa7nCY@z>

Neither the OHCI or EHCI bindings are using the phy-names property, so we
can just drop it.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 arch/arm/boot/dts/sun4i-a10.dtsi     | 4 ----
 arch/arm/boot/dts/sun5i.dtsi         | 2 --
 arch/arm/boot/dts/sun6i-a31.dtsi     | 4 ----
 arch/arm/boot/dts/sun7i-a20.dtsi     | 4 ----
 arch/arm/boot/dts/sun8i-a23-a33.dtsi | 2 --
 arch/arm/boot/dts/sun8i-a83t.dtsi    | 3 ---
 arch/arm/boot/dts/sun8i-r40.dtsi     | 4 ----
 arch/arm/boot/dts/sun9i-a80.dtsi     | 5 -----
 8 files changed, 28 deletions(-)

diff --git a/arch/arm/boot/dts/sun4i-a10.dtsi b/arch/arm/boot/dts/sun4i-a10.dtsi
index ef6ec526f394..e88daa4ef1af 100644
--- a/arch/arm/boot/dts/sun4i-a10.dtsi
+++ b/arch/arm/boot/dts/sun4i-a10.dtsi
@@ -520,7 +520,6 @@
 			interrupts = <39>;
 			clocks = <&ccu CLK_AHB_EHCI0>;
 			phys = <&usbphy 1>;
-			phy-names = "usb";
 			status = "disabled";
 		};
 
@@ -530,7 +529,6 @@
 			interrupts = <64>;
 			clocks = <&ccu CLK_USB_OHCI0>, <&ccu CLK_AHB_OHCI0>;
 			phys = <&usbphy 1>;
-			phy-names = "usb";
 			status = "disabled";
 		};
 
@@ -610,7 +608,6 @@
 			interrupts = <40>;
 			clocks = <&ccu CLK_AHB_EHCI1>;
 			phys = <&usbphy 2>;
-			phy-names = "usb";
 			status = "disabled";
 		};
 
@@ -620,7 +617,6 @@
 			interrupts = <65>;
 			clocks = <&ccu CLK_USB_OHCI1>, <&ccu CLK_AHB_OHCI1>;
 			phys = <&usbphy 2>;
-			phy-names = "usb";
 			status = "disabled";
 		};
 
diff --git a/arch/arm/boot/dts/sun5i.dtsi b/arch/arm/boot/dts/sun5i.dtsi
index cb820bd7974c..0d71b01967a3 100644
--- a/arch/arm/boot/dts/sun5i.dtsi
+++ b/arch/arm/boot/dts/sun5i.dtsi
@@ -391,7 +391,6 @@
 			interrupts = <39>;
 			clocks = <&ccu CLK_AHB_EHCI>;
 			phys = <&usbphy 1>;
-			phy-names = "usb";
 			status = "disabled";
 		};
 
@@ -401,7 +400,6 @@
 			interrupts = <40>;
 			clocks = <&ccu CLK_USB_OHCI>, <&ccu CLK_AHB_OHCI>;
 			phys = <&usbphy 1>;
-			phy-names = "usb";
 			status = "disabled";
 		};
 
diff --git a/arch/arm/boot/dts/sun6i-a31.dtsi b/arch/arm/boot/dts/sun6i-a31.dtsi
index fa983f9ff5f5..c04efad81bbc 100644
--- a/arch/arm/boot/dts/sun6i-a31.dtsi
+++ b/arch/arm/boot/dts/sun6i-a31.dtsi
@@ -543,7 +543,6 @@
 			clocks = <&ccu CLK_AHB1_EHCI0>;
 			resets = <&ccu RST_AHB1_EHCI0>;
 			phys = <&usbphy 1>;
-			phy-names = "usb";
 			status = "disabled";
 		};
 
@@ -554,7 +553,6 @@
 			clocks = <&ccu CLK_AHB1_OHCI0>, <&ccu CLK_USB_OHCI0>;
 			resets = <&ccu RST_AHB1_OHCI0>;
 			phys = <&usbphy 1>;
-			phy-names = "usb";
 			status = "disabled";
 		};
 
@@ -565,7 +563,6 @@
 			clocks = <&ccu CLK_AHB1_EHCI1>;
 			resets = <&ccu RST_AHB1_EHCI1>;
 			phys = <&usbphy 2>;
-			phy-names = "usb";
 			status = "disabled";
 		};
 
@@ -576,7 +573,6 @@
 			clocks = <&ccu CLK_AHB1_OHCI1>, <&ccu CLK_USB_OHCI1>;
 			resets = <&ccu RST_AHB1_OHCI1>;
 			phys = <&usbphy 2>;
-			phy-names = "usb";
 			status = "disabled";
 		};
 
diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a20.dtsi
index 794c915f504b..9ad8e445b240 100644
--- a/arch/arm/boot/dts/sun7i-a20.dtsi
+++ b/arch/arm/boot/dts/sun7i-a20.dtsi
@@ -612,7 +612,6 @@
 			interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&ccu CLK_AHB_EHCI0>;
 			phys = <&usbphy 1>;
-			phy-names = "usb";
 			status = "disabled";
 		};
 
@@ -622,7 +621,6 @@
 			interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&ccu CLK_USB_OHCI0>, <&ccu CLK_AHB_OHCI0>;
 			phys = <&usbphy 1>;
-			phy-names = "usb";
 			status = "disabled";
 		};
 
@@ -705,7 +703,6 @@
 			interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&ccu CLK_AHB_EHCI1>;
 			phys = <&usbphy 2>;
-			phy-names = "usb";
 			status = "disabled";
 		};
 
@@ -715,7 +712,6 @@
 			interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&ccu CLK_USB_OHCI1>, <&ccu CLK_AHB_OHCI1>;
 			phys = <&usbphy 2>;
-			phy-names = "usb";
 			status = "disabled";
 		};
 
diff --git a/arch/arm/boot/dts/sun8i-a23-a33.dtsi b/arch/arm/boot/dts/sun8i-a23-a33.dtsi
index f76aad0c5d4d..af2fa694a467 100644
--- a/arch/arm/boot/dts/sun8i-a23-a33.dtsi
+++ b/arch/arm/boot/dts/sun8i-a23-a33.dtsi
@@ -307,7 +307,6 @@
 			clocks = <&ccu CLK_BUS_EHCI>;
 			resets = <&ccu RST_BUS_EHCI>;
 			phys = <&usbphy 1>;
-			phy-names = "usb";
 			status = "disabled";
 		};
 
@@ -318,7 +317,6 @@
 			clocks = <&ccu CLK_BUS_OHCI>, <&ccu CLK_USB_OHCI>;
 			resets = <&ccu RST_BUS_OHCI>;
 			phys = <&usbphy 1>;
-			phy-names = "usb";
 			status = "disabled";
 		};
 
diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-a83t.dtsi
index b105a85467b3..392b0cabbf0d 100644
--- a/arch/arm/boot/dts/sun8i-a83t.dtsi
+++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
@@ -632,7 +632,6 @@
 			clocks = <&ccu CLK_BUS_EHCI0>;
 			resets = <&ccu RST_BUS_EHCI0>;
 			phys = <&usbphy 1>;
-			phy-names = "usb";
 			status = "disabled";
 		};
 
@@ -644,7 +643,6 @@
 			clocks = <&ccu CLK_BUS_OHCI0>, <&ccu CLK_USB_OHCI0>;
 			resets = <&ccu RST_BUS_OHCI0>;
 			phys = <&usbphy 1>;
-			phy-names = "usb";
 			status = "disabled";
 		};
 
@@ -656,7 +654,6 @@
 			clocks = <&ccu CLK_BUS_EHCI1>;
 			resets = <&ccu RST_BUS_EHCI1>;
 			phys = <&usbphy 2>;
-			phy-names = "usb";
 			status = "disabled";
 		};
 
diff --git a/arch/arm/boot/dts/sun8i-r40.dtsi b/arch/arm/boot/dts/sun8i-r40.dtsi
index 56c6885b02d1..bb856e53b806 100644
--- a/arch/arm/boot/dts/sun8i-r40.dtsi
+++ b/arch/arm/boot/dts/sun8i-r40.dtsi
@@ -273,7 +273,6 @@
 			clocks = <&ccu CLK_BUS_EHCI1>;
 			resets = <&ccu RST_BUS_EHCI1>;
 			phys = <&usbphy 1>;
-			phy-names = "usb";
 			status = "disabled";
 		};
 
@@ -285,7 +284,6 @@
 				 <&ccu CLK_USB_OHCI1>;
 			resets = <&ccu RST_BUS_OHCI1>;
 			phys = <&usbphy 1>;
-			phy-names = "usb";
 			status = "disabled";
 		};
 
@@ -296,7 +294,6 @@
 			clocks = <&ccu CLK_BUS_EHCI2>;
 			resets = <&ccu RST_BUS_EHCI2>;
 			phys = <&usbphy 2>;
-			phy-names = "usb";
 			status = "disabled";
 		};
 
@@ -308,7 +305,6 @@
 				 <&ccu CLK_USB_OHCI2>;
 			resets = <&ccu RST_BUS_OHCI2>;
 			phys = <&usbphy 2>;
-			phy-names = "usb";
 			status = "disabled";
 		};
 
diff --git a/arch/arm/boot/dts/sun9i-a80.dtsi b/arch/arm/boot/dts/sun9i-a80.dtsi
index c1aa26db44ae..0c1eec9000e3 100644
--- a/arch/arm/boot/dts/sun9i-a80.dtsi
+++ b/arch/arm/boot/dts/sun9i-a80.dtsi
@@ -342,7 +342,6 @@
 			clocks = <&usb_clocks CLK_BUS_HCI0>;
 			resets = <&usb_clocks RST_USB0_HCI>;
 			phys = <&usbphy1>;
-			phy-names = "usb";
 			status = "disabled";
 		};
 
@@ -354,7 +353,6 @@
 				 <&usb_clocks CLK_USB_OHCI0>;
 			resets = <&usb_clocks RST_USB0_HCI>;
 			phys = <&usbphy1>;
-			phy-names = "usb";
 			status = "disabled";
 		};
 
@@ -376,7 +374,6 @@
 			clocks = <&usb_clocks CLK_BUS_HCI1>;
 			resets = <&usb_clocks RST_USB1_HCI>;
 			phys = <&usbphy2>;
-			phy-names = "usb";
 			status = "disabled";
 		};
 
@@ -406,7 +403,6 @@
 			clocks = <&usb_clocks CLK_BUS_HCI2>;
 			resets = <&usb_clocks RST_USB2_HCI>;
 			phys = <&usbphy3>;
-			phy-names = "usb";
 			status = "disabled";
 		};
 
@@ -418,7 +414,6 @@
 				 <&usb_clocks CLK_USB_OHCI2>;
 			resets = <&usb_clocks RST_USB2_HCI>;
 			phys = <&usbphy3>;
-			phy-names = "usb";
 			status = "disabled";
 		};
 
-- 
git-series 0.9.1
