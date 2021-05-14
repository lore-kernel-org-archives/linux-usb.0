Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9692BC43460
	for <linux-usb@archiver.kernel.org>; Fri, 14 May 2021 10:45:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 74D2361458
	for <linux-usb@archiver.kernel.org>; Fri, 14 May 2021 10:45:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231949AbhENKqT (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 14 May 2021 06:46:19 -0400
Received: from mail.manjaro.org ([176.9.38.148]:38908 "EHLO mail.manjaro.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231721AbhENKqR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 14 May 2021 06:46:17 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.manjaro.org (Postfix) with ESMTP id 8EE782225A0;
        Fri, 14 May 2021 12:26:40 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at manjaro.org
Received: from mail.manjaro.org ([127.0.0.1])
        by localhost (manjaro.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id EU0bzOb9GlNG; Fri, 14 May 2021 12:26:37 +0200 (CEST)
From:   Tobias Schramm <t.schramm@manjaro.org>
To:     linux-usb@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Tobias Schramm <t.schramm@manjaro.org>
Subject: [PATCH 1/4] Documentation: bindings: phy: add compatible for RK3308 USB phy
Date:   Fri, 14 May 2021 12:27:31 +0200
Message-Id: <20210514102734.2091238-2-t.schramm@manjaro.org>
In-Reply-To: <20210514102734.2091238-1-t.schramm@manjaro.org>
References: <20210514102734.2091238-1-t.schramm@manjaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The RK3308 features a different USB phy than other Rockchip SoCs. This
patch adds a compatible string for it.

Signed-off-by: Tobias Schramm <t.schramm@manjaro.org>
---
 Documentation/devicetree/bindings/phy/rockchip-usb-phy.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/rockchip-usb-phy.txt b/Documentation/devicetree/bindings/phy/rockchip-usb-phy.txt
index 4ed569046daf..6547b829c27a 100644
--- a/Documentation/devicetree/bindings/phy/rockchip-usb-phy.txt
+++ b/Documentation/devicetree/bindings/phy/rockchip-usb-phy.txt
@@ -5,6 +5,7 @@ Required properties:
      "rockchip,rk3066a-usb-phy"
      "rockchip,rk3188-usb-phy"
      "rockchip,rk3288-usb-phy"
+     "rockchip,rk3308-usb-phy"
  - #address-cells: should be 1
  - #size-cells: should be 0
 
-- 
2.31.1

