Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4392CC433FE
	for <linux-usb@archiver.kernel.org>; Mon, 18 Oct 2021 18:39:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2E9A460F93
	for <linux-usb@archiver.kernel.org>; Mon, 18 Oct 2021 18:39:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233779AbhJRSmD (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 18 Oct 2021 14:42:03 -0400
Received: from mxout04.lancloud.ru ([45.84.86.114]:55514 "EHLO
        mxout04.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233186AbhJRSlz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 18 Oct 2021 14:41:55 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout04.lancloud.ru 8531220A8F9B
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC:     Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>
Subject: [PATCH 20/22] usb: host: xhci-mtk: deny IRQ0
Date:   Mon, 18 Oct 2021 21:39:28 +0300
Message-ID: <20211018183930.8448-21-s.shtylyov@omp.ru>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20211018183930.8448-1-s.shtylyov@omp.ru>
References: <20211018183930.8448-1-s.shtylyov@omp.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If platform_get_irq() returns IRQ0 (considered invalid according to Linus)
the driver blithely passes it to usb_add_hcd() that treats IRQ0 as no IRQ
at all. Deny IRQ0 right away, returning -EINVAL from the probe() method...

Fixes: 0cbd4b34cda9 ("xhci: mediatek: support MTK xHCI host controller")
Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
---
 drivers/usb/host/xhci-mtk.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index c53f6f276d5c..d2dc8d9863ee 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -495,7 +495,7 @@ static int xhci_mtk_probe(struct platform_device *pdev)
 		return ret;
 
 	irq = platform_get_irq_byname_optional(pdev, "host");
-	if (irq < 0) {
+	if (irq <= 0) {
 		if (irq == -EPROBE_DEFER)
 			return irq;
 
@@ -503,6 +503,8 @@ static int xhci_mtk_probe(struct platform_device *pdev)
 		irq = platform_get_irq(pdev, 0);
 		if (irq < 0)
 			return irq;
+		if (!irq)
+			return -EINVAL;
 	}
 
 	wakeup_irq = platform_get_irq_byname_optional(pdev, "wakeup");
-- 
2.26.3
