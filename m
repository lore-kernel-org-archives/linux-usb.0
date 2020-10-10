Return-Path: <SRS0=wmHi=DR=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49247C433E7
	for <linux-usb@archiver.kernel.org>; Sat, 10 Oct 2020 23:15:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 18B8020760
	for <linux-usb@archiver.kernel.org>; Sat, 10 Oct 2020 23:15:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387977AbgJJXPm (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 10 Oct 2020 19:15:42 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:57826 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387958AbgJJWxB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 10 Oct 2020 18:53:01 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 412AA8001383;
        Sat, 10 Oct 2020 22:41:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 1iw0bvkHNSdA; Sun, 11 Oct 2020 01:41:32 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Roger Quadros <rogerq@ti.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 11/18] dt-bindings: usb: dwc3: Add interrupt-names property support
Date:   Sun, 11 Oct 2020 01:41:14 +0300
Message-ID: <20201010224121.12672-12-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20201010224121.12672-1-Sergey.Semin@baikalelectronics.ru>
References: <20201010224121.12672-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The controller driver supports two types of DWC USB3 devices: with a
common interrupt lane and with individual interrupts for each mode. Add
both of these cases support to the DWC USB3 DT schema.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
---
 Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
index 24808fc2c7e3..6857086920c2 100644
--- a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
@@ -23,8 +23,19 @@ properties:
       const: "snps,dwc3"
 
   interrupts:
+    description: |
+      It's either a single common DWC3 interrupt (dwc_usb3) or individual
+      interrupts for the host, gadget and DRD modes.
+    minItems: 1
+    maxItems: 3
+
+  interrupt-names:
     minItems: 1
     maxItems: 3
+    oneOf:
+      - const: "dwc_usb3"
+      - items:
+          enum: ["host", "peripheral", "otg"]
 
   clocks:
     description: |
-- 
2.27.0

