Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E07AC433E0
	for <linux-usb@archiver.kernel.org>; Tue,  2 Feb 2021 08:39:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C671464F58
	for <linux-usb@archiver.kernel.org>; Tue,  2 Feb 2021 08:39:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232523AbhBBIjk (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 2 Feb 2021 03:39:40 -0500
Received: from mailgw02.mediatek.com ([1.203.163.81]:48355 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S231538AbhBBIjh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 Feb 2021 03:39:37 -0500
X-UUID: 8f11d486a71149cca7d168ee12aef293-20210202
X-UUID: 8f11d486a71149cca7d168ee12aef293-20210202
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 435550767; Tue, 02 Feb 2021 16:38:43 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 2 Feb 2021 16:38:40 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 2 Feb 2021 16:38:40 +0800
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ikjoon Jang <ikjn@chromium.org>
CC:     Matthias Brugger <matthias.bgg@gmail.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        <linux-usb@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Zhanyong Wang <zhanyong.wang@mediatek.com>,
        Tianping Fang <tianping.fang@mediatek.com>,
        stable <stable@vger.kernel.org>
Subject: [PATCH next] usb: xhci-mtk: break loop when find the endpoint to drop
Date:   Tue, 2 Feb 2021 16:38:24 +0800
Message-ID: <1612255104-5363-1-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: E273454B680D21EEE534227D442FE4AE8A972EA8CF78BED64B96D2EEA019C50F2000:8
X-MTK:  N
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

No need to check the following endpoints after finding the endpoint
wanted to drop.

Fixes: 54f6a8af3722 ("usb: xhci-mtk: skip dropping bandwidth of unchecked endpoints")
Cc: stable <stable@vger.kernel.org>
Reported-by: Ikjoon Jang <ikjn@chromium.org>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/host/xhci-mtk-sch.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
index dee8a329076d..b45e5bf08997 100644
--- a/drivers/usb/host/xhci-mtk-sch.c
+++ b/drivers/usb/host/xhci-mtk-sch.c
@@ -689,8 +689,10 @@ void xhci_mtk_drop_ep_quirk(struct usb_hcd *hcd, struct usb_device *udev,
 	sch_bw = &sch_array[bw_index];
 
 	list_for_each_entry_safe(sch_ep, tmp, &sch_bw->bw_ep_list, endpoint) {
-		if (sch_ep->ep == ep)
+		if (sch_ep->ep == ep) {
 			destroy_sch_ep(udev, sch_bw, sch_ep);
+			break;
+		}
 	}
 }
 EXPORT_SYMBOL_GPL(xhci_mtk_drop_ep_quirk);
-- 
2.18.0

