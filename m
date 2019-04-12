Return-Path: <SRS0=sojL=SO=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA4CEC10F0E
	for <linux-usb@archiver.kernel.org>; Fri, 12 Apr 2019 10:23:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 94C42218AF
	for <linux-usb@archiver.kernel.org>; Fri, 12 Apr 2019 10:23:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726826AbfDLKXD (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 12 Apr 2019 06:23:03 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:38875 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726327AbfDLKXD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 12 Apr 2019 06:23:03 -0400
X-IronPort-AV: E=Sophos;i="5.60,340,1549897200"; 
   d="scan'208";a="12867494"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 12 Apr 2019 19:23:00 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 8D47142F9423;
        Fri, 12 Apr 2019 19:22:57 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH V3 2/7] dt-bindings: usb: renesas_usb3: Add renesas,usb-role-switch property
Date:   Fri, 12 Apr 2019 11:16:14 +0100
Message-Id: <1555064179-15626-3-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1555064179-15626-1-git-send-email-biju.das@bp.renesas.com>
References: <1555064179-15626-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190412101614.N5GZols1YMjnnWuRHW0Pe2X-Tt4swHtaoETcQa13wIM@z>

Add an optional property renesas,usb-role-switch to support
dual role switch for USB Type-C DRP port controller devices
using USB role switch class framework.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 V2-->V3
  * Added optional renesas,usb-role-switch property.
 V1-->V2
  * Added usb-role-switch-property
  * Updated the example with usb-role-switch property.
---
 .../devicetree/bindings/usb/renesas_usb3.txt       | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/renesas_usb3.txt b/Documentation/devicetree/bindings/usb/renesas_usb3.txt
index 35039e7..f1cb06a 100644
--- a/Documentation/devicetree/bindings/usb/renesas_usb3.txt
+++ b/Documentation/devicetree/bindings/usb/renesas_usb3.txt
@@ -22,6 +22,7 @@ Required properties:
 Optional properties:
   - phys: phandle + phy specifier pair
   - phy-names: must be "usb"
+  - renesas,usb-role-switch: use USB role switch to handle role switch events
 
 Example of R-Car H3 ES1.x:
 	usb3_peri0: usb@ee020000 {
@@ -39,3 +40,24 @@ Example of R-Car H3 ES1.x:
 		interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&cpg CPG_MOD 327>;
 	};
+
+Example of RZ/G2E:
+	usb3_peri0: usb@ee020000 {
+		compatible = "renesas,r8a774c0-usb3-peri",
+			     "renesas,rcar-gen3-usb3-peri";
+		reg = <0 0xee020000 0 0x400>;
+		interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cpg CPG_MOD 328>;
+		companion = <&xhci0>;
+		renesas,usb-role-switch;
+
+		port {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			usb3peri_role_switch: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&hd3ss3220_ep>;
+			};
+		};
+	};
-- 
2.7.4

