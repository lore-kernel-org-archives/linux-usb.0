Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D213AC433ED
	for <linux-usb@archiver.kernel.org>; Fri, 30 Apr 2021 07:15:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A0D4761424
	for <linux-usb@archiver.kernel.org>; Fri, 30 Apr 2021 07:15:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230463AbhD3HQe (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 30 Apr 2021 03:16:34 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:57480 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S230445AbhD3HQd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 30 Apr 2021 03:16:33 -0400
X-UUID: c7f5c9680bbf411a9c9d9c9c990f23ca-20210430
X-UUID: c7f5c9680bbf411a9c9d9c9c990f23ca-20210430
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1160506484; Fri, 30 Apr 2021 15:15:41 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 30 Apr 2021 15:15:40 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 30 Apr 2021 15:15:40 +0800
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Mathias Nyman <mathias.nyman@intel.com>
CC:     Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        <linux-usb@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Ikjoon Jang <ikjn@chromium.org>,
        Eddie Hung <eddie.hung@mediatek.com>
Subject: [PATCH 3/3] usb: xhci-mtk: use first-fit for LS/FS
Date:   Fri, 30 Apr 2021 15:15:32 +0800
Message-ID: <20210430071532.51794-3-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210430071532.51794-1-chunfeng.yun@mediatek.com>
References: <20210430071532.51794-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Use first-fit instead of best-fit for LS/FS devices under TT,
we found that best-fit will consume more bandwidth for some
cases.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/host/xhci-mtk-sch.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
index 9fb75085e40f..c07411d9b16f 100644
--- a/drivers/usb/host/xhci-mtk-sch.c
+++ b/drivers/usb/host/xhci-mtk-sch.c
@@ -634,6 +634,11 @@ static int check_sch_bw(struct mu3h_sch_bw_info *sch_bw,
 			min_bw = worst_bw;
 			min_index = offset;
 		}
+
+		/* use first-fit for LS/FS */
+		if (sch_ep->sch_tt && min_index >= 0)
+			break;
+
 		if (min_bw == 0)
 			break;
 	}
-- 
2.18.0

