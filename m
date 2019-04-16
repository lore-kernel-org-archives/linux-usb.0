Return-Path: <SRS0=lM5t=SS=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D1ACC10F13
	for <linux-usb@archiver.kernel.org>; Tue, 16 Apr 2019 08:28:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CE0972073F
	for <linux-usb@archiver.kernel.org>; Tue, 16 Apr 2019 08:28:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727638AbfDPI2J (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 16 Apr 2019 04:28:09 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:52713 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726713AbfDPI2J (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Apr 2019 04:28:09 -0400
Received: from localhost (aaubervilliers-681-1-63-121.w90-88.abo.wanadoo.fr [90.88.18.121])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 4D48210000A;
        Tue, 16 Apr 2019 08:28:04 +0000 (UTC)
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-usb@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/6] dt-bindings: usb: Convert USB HCD generic binding to YAML
Date:   Tue, 16 Apr 2019 10:27:57 +0200
Message-Id:
 <d930537cfe3124de37b8ecf4eaa02b68ec94cb40.1555403233.git-series.maxime.ripard@bootlin.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190416082757.PuMqP6XnvYsTgmv6Mo_JDYrkdopeoQDYfoc370ETHDY@z>

The USB HCD generic binding is used by many USB host bindings.

In order to allow the DT validation to happen on those, let's create a YAML
description for that generic binding that can be referenced later on.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 Documentation/devicetree/bindings/usb/usb-hcd.txt  |  9 +-----
 Documentation/devicetree/bindings/usb/usb-hcd.yaml | 25 +++++++++++++++-
 2 files changed, 25 insertions(+), 9 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/usb/usb-hcd.txt
 create mode 100644 Documentation/devicetree/bindings/usb/usb-hcd.yaml

diff --git a/Documentation/devicetree/bindings/usb/usb-hcd.txt b/Documentation/devicetree/bindings/usb/usb-hcd.txt
deleted file mode 100644
index 50529b838c9c..000000000000
--- a/Documentation/devicetree/bindings/usb/usb-hcd.txt
+++ /dev/null
@@ -1,9 +0,0 @@
-Generic USB HCD (Host Controller Device) Properties
-
-Optional properties:
-- phys: a list of all USB PHYs on this HCD
-
-Example:
-	&usb1 {
-		phys = <&usb2_phy1>, <&usb3_phy1>;
-	};
diff --git a/Documentation/devicetree/bindings/usb/usb-hcd.yaml b/Documentation/devicetree/bindings/usb/usb-hcd.yaml
new file mode 100644
index 000000000000..9c8c56d3a792
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/usb-hcd.yaml
@@ -0,0 +1,25 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/usb-hcd.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic USB Host Controller Device Tree Bindings
+
+maintainers:
+  - Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+
+properties:
+  $nodename:
+    pattern: "^usb(@.*)?"
+
+  phys:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      List of all the USB PHYs on this HCD
+
+examples:
+  - |
+    usb {
+        phys = <&usb2_phy1>, <&usb3_phy1>;
+    };

base-commit: f9221a7a1014d8a047b277a73289678646ddc110
-- 
git-series 0.9.1
