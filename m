Return-Path: <SRS0=e+xf=S2=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E0F1C10F11
	for <linux-usb@archiver.kernel.org>; Wed, 24 Apr 2019 09:29:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F026A218B0
	for <linux-usb@archiver.kernel.org>; Wed, 24 Apr 2019 09:29:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727948AbfDXJ3a (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 24 Apr 2019 05:29:30 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:35911 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726176AbfDXJ33 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 Apr 2019 05:29:29 -0400
X-IronPort-AV: E=Sophos;i="5.60,389,1549897200"; 
   d="scan'208";a="14200197"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 24 Apr 2019 18:29:27 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 427D042A0824;
        Wed, 24 Apr 2019 18:29:24 +0900 (JST)
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
Subject: [PATCH V5 3/9] dt-bindings: usb: hd3ss3220 device tree binding document
Date:   Wed, 24 Apr 2019 10:22:17 +0100
Message-Id: <1556097743-12717-4-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1556097743-12717-1-git-send-email-biju.das@bp.renesas.com>
References: <1556097743-12717-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190424092217.B6NCLjhGEfT_oAkKZsth1xE9vIkkBxnXJ01dI7JOFKM@z>

Add device tree binding document for TI HD3SS3220 Type-C DRP port
controller driver.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
V4-->V5
  * No Change.
V3-->V4
  * No Change.
V2-->V3
  * Added Rob's Reviewed by tag.
V1-->V2
  * Added connector node.
  * updated the example with connector node.
---
 .../devicetree/bindings/usb/ti,hd3ss3220.txt       | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt

diff --git a/Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt b/Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt
new file mode 100644
index 0000000..7f41400
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt
@@ -0,0 +1,37 @@
+TI HD3SS3220 TypeC DRP Port Controller.
+
+Required properties:
+ - compatible: Must be "ti,hd3ss3220".
+ - reg: I2C slave address, must be 0x47 or 0x67 based on ADDR pin.
+ - interrupts: <a b> where a is the interrupt number and b represents an
+   encoding of the sense and level information for the interrupt.
+
+Required sub-node:
+ - connector : The "usb-c-connector" attached to the hd3ss3220 chip. The
+   bindings of the connector node are specified in:
+
+	Documentation/devicetree/bindings/connector/usb-connector.txt
+
+Example:
+hd3ss3220@47 {
+	compatible = "ti,hd3ss3220";
+	reg = <0x47>;
+	interrupt-parent = <&gpio6>;
+	interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
+
+	usb_con: connector {
+		compatible = "usb-c-connector";
+		label = "USB-C";
+		data-role = "dual";
+	};
+
+	port {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		hd3ss3220_ep: endpoint@0 {
+			reg = <0>;
+			remote-endpoint = <&usb3peri_role_switch>;
+		};
+	};
+};
-- 
2.7.4

