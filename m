Return-Path: <SRS0=X9rV=SM=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B55EC10F14
	for <linux-usb@archiver.kernel.org>; Wed, 10 Apr 2019 06:48:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CD9C32133D
	for <linux-usb@archiver.kernel.org>; Wed, 10 Apr 2019 06:48:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728653AbfDJGsI (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 10 Apr 2019 02:48:08 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:8866 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727753AbfDJGsG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 Apr 2019 02:48:06 -0400
X-UUID: 4a760d603d5c44cb91f3c9cc4256a8ac-20190410
X-UUID: 4a760d603d5c44cb91f3c9cc4256a8ac-20190410
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 204629780; Wed, 10 Apr 2019 14:47:46 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31DR.mediatek.inc (172.27.6.102) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 10 Apr 2019 14:47:44 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 10 Apr 2019 14:47:44 +0800
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Mathias Nyman <mathias.nyman@intel.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        Minas Harutyunyan <hminas@synopsys.com>
Subject: [v2 PATCH 4/6] usb: dwc2: get optional clock by devm_clk_get_optional()
Date:   Wed, 10 Apr 2019 14:47:27 +0800
Message-ID:
 <80836043f845d6afcdfe20adae5cfdd69a9c2a7f.1554877692.git.chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <bc6cdc2dce698dddbd692ba100fbf08c15c7b023.1554877692.git.chunfeng.yun@mediatek.com>
References: <bc6cdc2dce698dddbd692ba100fbf08c15c7b023.1554877692.git.chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-MTK:  N
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190410064727.QjtrBZVg2PgtQRoDHCXAs5Syepw2WWHuP6Ygki4JSBY@z>

Use devm_clk_get_optional() to get optional clock

Cc: Minas Harutyunyan <hminas@synopsys.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
Acked-by: Minas Harutyunyan <hminas@synopsys.com>
---
v2: add Acked-by Minas Harutyunyan
---
 drivers/usb/dwc2/platform.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
index c0b64d483552..9aa9682a5cd2 100644
--- a/drivers/usb/dwc2/platform.c
+++ b/drivers/usb/dwc2/platform.c
@@ -284,10 +284,10 @@ static int dwc2_lowlevel_hw_init(struct dwc2_hsotg *hsotg)
 	}
 
 	/* Clock */
-	hsotg->clk = devm_clk_get(hsotg->dev, "otg");
+	hsotg->clk = devm_clk_get_optional(hsotg->dev, "otg");
 	if (IS_ERR(hsotg->clk)) {
-		hsotg->clk = NULL;
-		dev_dbg(hsotg->dev, "cannot get otg clock\n");
+		dev_err(hsotg->dev, "cannot get otg clock\n");
+		return PTR_ERR(hsotg->clk);
 	}
 
 	/* Regulators */
-- 
2.21.0

