Return-Path: <SRS0=J28a=DU=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3673C41604
	for <linux-usb@archiver.kernel.org>; Tue, 13 Oct 2020 02:42:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DC2722072C
	for <linux-usb@archiver.kernel.org>; Tue, 13 Oct 2020 02:42:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728787AbgJMCi6 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 12 Oct 2020 22:38:58 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:15206 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728130AbgJMCi6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 12 Oct 2020 22:38:58 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id C547B98CF3E395710DEF;
        Tue, 13 Oct 2020 10:38:56 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.487.0; Tue, 13 Oct 2020 10:38:46 +0800
From:   Jing Xiangfeng <jingxiangfeng@huawei.com>
To:     <andreas.noever@gmail.com>, <michael.jamet@intel.com>,
        <mika.westerberg@linux.intel.com>, <YehezkelShB@gmail.com>,
        <gregkh@linuxfoundation.org>, <andriy.shevchenko@linux.intel.com>
CC:     <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jingxiangfeng@huawei.com>
Subject: [PATCH] thunderbolt: Add the missed ida_simple_remove() in ring_request_msix()
Date:   Tue, 13 Oct 2020 10:45:18 +0800
Message-ID: <20201013024518.195557-1-jingxiangfeng@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

ring_request_msix() misses to call ida_simple_remove() in an error path.
Add the missed function call to fix it.

Fixes: 046bee1f9ab8 ("thunderbolt: Add MSI-X support")
Signed-off-by: Jing Xiangfeng <jingxiangfeng@huawei.com>
---
 drivers/thunderbolt/nhi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index 5f7489fa1327..7732e7a9942f 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -406,8 +406,10 @@ static int ring_request_msix(struct tb_ring *ring, bool no_suspend)
 	ring->vector = ret;
 
 	ring->irq = pci_irq_vector(ring->nhi->pdev, ring->vector);
-	if (ring->irq < 0)
+	if (ring->irq < 0) {
+		ida_simple_remove(&nhi->msix_ida, ret);
 		return ring->irq;
+	}
 
 	irqflags = no_suspend ? IRQF_NO_SUSPEND : 0;
 	return request_irq(ring->irq, ring_msix, irqflags, "thunderbolt", ring);
-- 
2.17.1

