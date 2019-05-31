Return-Path: <SRS0=yz8b=T7=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46190C28CC3
	for <linux-usb@archiver.kernel.org>; Fri, 31 May 2019 10:07:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 297642674F
	for <linux-usb@archiver.kernel.org>; Fri, 31 May 2019 10:07:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727070AbfEaKHx (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 31 May 2019 06:07:53 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:18024 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726998AbfEaKHx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 31 May 2019 06:07:53 -0400
X-IronPort-AV: E=Sophos;i="5.60,534,1549897200"; 
   d="scan'208";a="17479562"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 31 May 2019 19:07:52 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 2D189421D792;
        Fri, 31 May 2019 19:07:45 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v7 2/7] dt-bindings: usb: renesas_usb3: Document usb role switch support
Date:   Fri, 31 May 2019 10:59:55 +0100
Message-Id: <1559296800-5610-3-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559296800-5610-1-git-send-email-biju.das@bp.renesas.com>
References: <1559296800-5610-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Update the DT bindings documentation to support usb role switch
for USB Type-C connector using USB role switch class framework.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 V6-->V7
  * Incorporated shimoda-san's review comments.
    (https://patchwork.kernel.org/patch/10944631/)
 V5-->V6
  * Updated description
  * Added usb-role-switch-property
 V4-->V5
  * No Change
 V3-->V4
  * No Change
 V2-->V3
  * Added optional renesas,usb-role-switch property.
 V1-->V2
  * Added usb-role-switch-property
  * Updated the example with usb-role-switch property.
---
 .../devicetree/bindings/usb/renesas_usb3.txt       | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/renesas_usb3.txt b/Documentation/devicetree/bindings/usb/renesas_usb3.txt
index 35039e7..5eecfbc 100644
--- a/Documentation/devicetree/bindings/usb/renesas_usb3.txt
+++ b/Documentation/devicetree/bindings/usb/renesas_usb3.txt
@@ -22,6 +22,12 @@ Required properties:
 Optional properties:
   - phys: phandle + phy specifier pair
   - phy-names: must be "usb"
+  - usb-role-switch: support role switch. see usb/generic.txt
+
+Sub-nodes:
+- any connector to the data bus of this controller should be modelled using the
+  OF graph bindings specified in bindings/graph.txt, if the "usb-role-switch"
+  property is used.
 
 Example of R-Car H3 ES1.x:
 	usb3_peri0: usb@ee020000 {
@@ -39,3 +45,20 @@ Example of R-Car H3 ES1.x:
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
+		usb-role-switch;
+
+		port {
+			usb3_role_switch: endpoint {
+				remote-endpoint = <&hd3ss3220_ep>;
+			};
+		};
+	};
-- 
2.7.4

