Return-Path: <SRS0=e+xf=S2=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16E6DC282CE
	for <linux-usb@archiver.kernel.org>; Wed, 24 Apr 2019 09:29:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DA05E20878
	for <linux-usb@archiver.kernel.org>; Wed, 24 Apr 2019 09:29:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728033AbfDXJ3c (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 24 Apr 2019 05:29:32 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:35911 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726176AbfDXJ3c (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 Apr 2019 05:29:32 -0400
X-IronPort-AV: E=Sophos;i="5.60,389,1549897200"; 
   d="scan'208";a="14200204"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 24 Apr 2019 18:29:31 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id D3E3F42A0829;
        Wed, 24 Apr 2019 18:29:27 +0900 (JST)
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
Subject: [PATCH V5 4/9] dt-bindings: usb: renesas_usb3: Add renesas,usb-role-switch property
Date:   Wed, 24 Apr 2019 10:22:18 +0100
Message-Id: <1556097743-12717-5-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1556097743-12717-1-git-send-email-biju.das@bp.renesas.com>
References: <1556097743-12717-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190424092218.qkkbywklU9b1TfSzKxtd03YjPC9_unW4CfwZh4vB2AQ@z>

Add an optional property renesas,usb-role-switch to support
dual role switch for USB Type-C DRP port controller devices
using USB role switch class framework.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
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

