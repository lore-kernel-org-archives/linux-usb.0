Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9AA3EB64DA
	for <linux-usb@archiver.kernel.org>; Thu, 20 Jul 2023 17:36:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231807AbjGTRgx (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 20 Jul 2023 13:36:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231205AbjGTRgu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 Jul 2023 13:36:50 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A501E53;
        Thu, 20 Jul 2023 10:36:48 -0700 (PDT)
Received: from jupiter.universe (dyndsl-091-248-215-153.ewe-ip-backbone.de [91.248.215.153])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sre)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id E3555660708D;
        Thu, 20 Jul 2023 18:36:46 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1689874607;
        bh=zUejJZFS4thyPHrNS+i30eUloFjH4qgrqPO4Coui+ks=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GUqkEaoEh8FvbKRvUose4pIR1gzp03yuE2XNbw0FPHANKQq7W2zmaVT2z3rmbMwB8
         BpsmmEM3XOf/Kj1f7+NBiiN7T/CbbfQyVH9z5QvJjgmfQzjZDdHiXJohRxdkqGDeYk
         JnsfAI7TZWwQPrdN1YeLhz+uwGwHppMTl6XZtyi4IFTghBRtIYuke6C6hmsbjqn5rk
         fJjQAMj7MD8xhqJM1RvPm+mJ/PKbr0gVzzB5P4CVrPW0+7spslXLbb4NKjB8DATaWN
         fsFaQjokiDWab5J78B0JbN/WbAoQuXPX3+s7n0xvVM1cG0xvX/l5DpBR49w/jm90Xr
         d+3hFH6ARVMgA==
Received: by jupiter.universe (Postfix, from userid 1000)
        id E5A01480E64; Thu, 20 Jul 2023 19:36:44 +0200 (CEST)
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Heiko Stuebner <heiko@sntech.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-rockchip@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        kernel@collabora.com
Subject: [PATCH v2 1/3] dt-bindings: usb: add rk3588 compatible to rockchip,dwc3
Date:   Thu, 20 Jul 2023 19:36:41 +0200
Message-Id: <20230720173643.69553-2-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230720173643.69553-1-sebastian.reichel@collabora.com>
References: <20230720173643.69553-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

RK3588 has three DWC3 controllers. Two of them are fully functional in
host, device and OTG mode including USB2 support. They are connected to
dedicated PHYs, that also support USB-C's DisplayPort alternate mode.

The third controller is connected to one of the combphy's shared
with PCIe and SATA. It can only be used in host mode and does not
support USB2. Compared to the other controllers this one needs
some extra clocks.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../devicetree/bindings/usb/rockchip,dwc3.yaml        | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml b/Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml
index 291844c8f3e1..cbc3e55e05e1 100644
--- a/Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml
@@ -30,6 +30,7 @@ select:
         enum:
           - rockchip,rk3328-dwc3
           - rockchip,rk3568-dwc3
+          - rockchip,rk3588-dwc3
   required:
     - compatible
 
@@ -39,6 +40,7 @@ properties:
       - enum:
           - rockchip,rk3328-dwc3
           - rockchip,rk3568-dwc3
+          - rockchip,rk3588-dwc3
       - const: snps,dwc3
 
   reg:
@@ -58,7 +60,9 @@ properties:
           Master/Core clock, must to be >= 62.5 MHz for SS
           operation and >= 30MHz for HS operation
       - description:
-          Controller grf clock
+          Controller grf clock OR UTMI clock
+      - description:
+          PIPE clock
 
   clock-names:
     minItems: 3
@@ -66,7 +70,10 @@ properties:
       - const: ref_clk
       - const: suspend_clk
       - const: bus_clk
-      - const: grf_clk
+      - enum:
+          - grf_clk
+          - utmi
+      - const: pipe
 
   power-domains:
     maxItems: 1
-- 
2.40.1

