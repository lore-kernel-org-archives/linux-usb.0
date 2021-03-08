Return-Path: <SRS0=dNjG=IG=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CF9DC4360C
	for <linux-usb@archiver.kernel.org>; Mon,  8 Mar 2021 02:53:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 72C7D65166
	for <linux-usb@archiver.kernel.org>; Mon,  8 Mar 2021 02:53:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233696AbhCHCwf (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 7 Mar 2021 21:52:35 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:36452 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S232408AbhCHCwY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 7 Mar 2021 21:52:24 -0500
X-UUID: 52dbb02261854926873d80d9fe019e3f-20210308
X-UUID: 52dbb02261854926873d80d9fe019e3f-20210308
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw02.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1414969503; Mon, 08 Mar 2021 10:52:21 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 8 Mar 2021 10:52:20 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 8 Mar 2021 10:52:19 +0800
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ikjoon Jang <ikjn@chromium.org>
CC:     Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        <linux-usb@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Eddie Hung <eddie.hung@mediatek.com>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v2 08/18] usb: xhci-mtk: remove unnecessary members of mu3h_sch_tt struct
Date:   Mon, 8 Mar 2021 10:51:57 +0800
Message-ID: <9afecc2411895a3c76658df26ebca1c961a39fbb.1615170625.git.chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <d287899e6beb2fc1bfb8900c75a872f628ecde55.1615170625.git.chunfeng.yun@mediatek.com>
References: <d287899e6beb2fc1bfb8900c75a872f628ecde55.1615170625.git.chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 8BEE9C41A6D1BD77277C16C8C503E854EEE51375D952F5DFC1F3215BE4FDA3B72000:8
X-MTK:  N
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The members @usb_tt and @tt_port in mu3h_sch_tt struct
are not used after initialization, so can be removed

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: no changes
---
 drivers/usb/host/xhci-mtk-sch.c | 7 +------
 drivers/usb/host/xhci-mtk.h     | 4 ----
 2 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
index 8fe4481eb43d..6fb7a040c73c 100644
--- a/drivers/usb/host/xhci-mtk-sch.c
+++ b/drivers/usb/host/xhci-mtk-sch.c
@@ -104,7 +104,6 @@ static struct mu3h_sch_tt *find_tt(struct usb_device *udev)
 {
 	struct usb_tt *utt = udev->tt;
 	struct mu3h_sch_tt *tt, **tt_index, **ptt;
-	unsigned int port;
 	bool allocated_index = false;
 
 	if (!utt)
@@ -126,10 +125,8 @@ static struct mu3h_sch_tt *find_tt(struct usb_device *udev)
 			utt->hcpriv = tt_index;
 			allocated_index = true;
 		}
-		port = udev->ttport - 1;
-		ptt = &tt_index[port];
+		ptt = &tt_index[udev->ttport - 1];
 	} else {
-		port = 0;
 		ptt = (struct mu3h_sch_tt **) &utt->hcpriv;
 	}
 
@@ -144,8 +141,6 @@ static struct mu3h_sch_tt *find_tt(struct usb_device *udev)
 			return ERR_PTR(-ENOMEM);
 		}
 		INIT_LIST_HEAD(&tt->ep_list);
-		tt->usb_tt = utt;
-		tt->tt_port = port;
 		*ptt = tt;
 	}
 
diff --git a/drivers/usb/host/xhci-mtk.h b/drivers/usb/host/xhci-mtk.h
index f42769c69249..f61e53b02706 100644
--- a/drivers/usb/host/xhci-mtk.h
+++ b/drivers/usb/host/xhci-mtk.h
@@ -23,15 +23,11 @@
  * @ss_bit_map: used to avoid start split microframes overlay
  * @fs_bus_bw: array to keep track of bandwidth already used for FS
  * @ep_list: Endpoints using this TT
- * @usb_tt: usb TT related
- * @tt_port: TT port number
  */
 struct mu3h_sch_tt {
 	DECLARE_BITMAP(ss_bit_map, XHCI_MTK_MAX_ESIT);
 	u32 fs_bus_bw[XHCI_MTK_MAX_ESIT];
 	struct list_head ep_list;
-	struct usb_tt *usb_tt;
-	int tt_port;
 };
 
 /**
-- 
2.18.0

