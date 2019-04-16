Return-Path: <SRS0=lM5t=SS=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72C52C10F14
	for <linux-usb@archiver.kernel.org>; Tue, 16 Apr 2019 08:28:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3EF0920868
	for <linux-usb@archiver.kernel.org>; Tue, 16 Apr 2019 08:28:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728743AbfDPI2V (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 16 Apr 2019 04:28:21 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:40345 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728391AbfDPI2U (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Apr 2019 04:28:20 -0400
Received: from localhost (aaubervilliers-681-1-63-121.w90-88.abo.wanadoo.fr [90.88.18.121])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 80B46100014;
        Tue, 16 Apr 2019 08:28:18 +0000 (UTC)
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-usb@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 6/6] arm64: dts: allwinner: Remove useless phy-names from EHCI and OHCI
Date:   Tue, 16 Apr 2019 10:28:02 +0200
Message-Id:
 <587c094b69f88c2b534e1de5b441cf823ecf4d8e.1555403233.git-series.maxime.ripard@bootlin.com>
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
Message-ID: <20190416082802.cXoNH478IPZD8sjkSieOhvsFUvJxJtCCDdq8nnNPYu4@z>

Neither the OHCI or EHCI bindings are using the phy-names property, so we
can just drop it.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts | 2 --
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi         | 2 --
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi          | 2 --
 3 files changed, 6 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts
index 78c82a665c84..2b6345db7dc0 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts
@@ -104,7 +104,6 @@
 
 &ehci0 {
 	phys = <&usbphy 0>;
-	phy-names = "usb";
 	status = "okay";
 };
 
@@ -151,7 +150,6 @@
 
 &ohci0 {
 	phys = <&usbphy 0>;
-	phy-names = "usb";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index 6f27eb082429..666f32b876c4 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -553,7 +553,6 @@
 			resets = <&ccu RST_BUS_OHCI1>,
 				 <&ccu RST_BUS_EHCI1>;
 			phys = <&usbphy 1>;
-			phy-names = "usb";
 			status = "disabled";
 		};
 
@@ -565,7 +564,6 @@
 				 <&ccu CLK_USB_OHCI1>;
 			resets = <&ccu RST_BUS_OHCI1>;
 			phys = <&usbphy 1>;
-			phy-names = "usb";
 			status = "disabled";
 		};
 
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
index e0dc4a05c1ba..3e0ec6e92869 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
@@ -445,7 +445,6 @@
 			resets = <&ccu RST_BUS_OHCI3>,
 				 <&ccu RST_BUS_EHCI3>;
 			phys = <&usb2phy 3>;
-			phy-names = "usb";
 			status = "disabled";
 		};
 
@@ -457,7 +456,6 @@
 				 <&ccu CLK_USB_OHCI3>;
 			resets = <&ccu RST_BUS_OHCI3>;
 			phys = <&usb2phy 3>;
-			phy-names = "usb";
 			status = "disabled";
 		};
 
-- 
git-series 0.9.1
