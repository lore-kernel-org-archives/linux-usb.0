Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E664CC4361A
	for <linux-usb@archiver.kernel.org>; Tue, 16 Mar 2021 09:23:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CE2ED6500E
	for <linux-usb@archiver.kernel.org>; Tue, 16 Mar 2021 09:23:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236082AbhCPJXH (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 16 Mar 2021 05:23:07 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:55813 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S236017AbhCPJWj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Mar 2021 05:22:39 -0400
X-UUID: 43788c447ec8405192ebc55d27c30bf1-20210316
X-UUID: 43788c447ec8405192ebc55d27c30bf1-20210316
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw02.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 906734361; Tue, 16 Mar 2021 17:22:35 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Mar 2021 17:22:34 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 16 Mar 2021 17:22:34 +0800
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
CC:     Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jie Qiu <jie.qiu@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
        Cawa Cheng <cawa.cheng@mediatek.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-usb@vger.kernel.org>
Subject: [PATCH v5 04/13] dt-bindings: phy: mediatek: tphy: change patternProperties
Date:   Tue, 16 Mar 2021 17:22:23 +0800
Message-ID: <20210316092232.9806-4-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210316092232.9806-1-chunfeng.yun@mediatek.com>
References: <20210316092232.9806-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The phy may be named as pcie-phy when the T-PHY only supports
PCIe mode, it's also the similar case for SATA, named as
sata-phy.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v5: no changes
v4: add reviewed-by Rob
v2~v3: no changes
---
 Documentation/devicetree/bindings/phy/mediatek,tphy.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
index 602e6ff45785..4f1733fd9a55 100644
--- a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
+++ b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
@@ -117,7 +117,7 @@ properties:
 
 # Required child node:
 patternProperties:
-  "^usb-phy@[0-9a-f]+$":
+  "^(usb|pcie|sata)-phy@[0-9a-f]+$":
     type: object
     description:
       A sub-node is required for each port the controller provides.
-- 
2.18.0

