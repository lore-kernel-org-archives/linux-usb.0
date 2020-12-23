Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3C83C433E0
	for <linux-usb@archiver.kernel.org>; Wed, 23 Dec 2020 01:27:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B56A2224D2
	for <linux-usb@archiver.kernel.org>; Wed, 23 Dec 2020 01:27:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726596AbgLWB1O (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 22 Dec 2020 20:27:14 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:9674 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726518AbgLWB1O (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Dec 2020 20:27:14 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4D0wWN48b3zkv8j;
        Wed, 23 Dec 2020 09:25:36 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.498.0; Wed, 23 Dec 2020 09:26:28 +0800
From:   Tian Tao <tiantao6@hisilicon.com>
To:     <isaac.hazan@intel.com>, <andreas.noever@gmail.com>,
        <michael.jamet@intel.com>, <mika.westerberg@linux.intel.com>,
        <YehezkelShB@gmail.com>
CC:     <linux-usb@vger.kernel.org>
Subject: [PATCH] thunderbolt: Use kmemdup instead of kzmalloc and memcpy
Date:   Wed, 23 Dec 2020 09:26:33 +0800
Message-ID: <1608686793-52044-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fixes coccicheck warning:
drivers/thunderbolt/dma_test.c:302:13-20: WARNING opportunity for kmemdup.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/thunderbolt/dma_test.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/thunderbolt/dma_test.c b/drivers/thunderbolt/dma_test.c
index f924423..955f980 100644
--- a/drivers/thunderbolt/dma_test.c
+++ b/drivers/thunderbolt/dma_test.c
@@ -299,14 +299,12 @@ static int dma_test_submit_tx(struct dma_test *dt, size_t npackets)
 		tf->frame.size = 0; /* means 4096 */
 		tf->dma_test = dt;
 
-		tf->data = kzalloc(DMA_TEST_FRAME_SIZE, GFP_KERNEL);
+		tf->data = kmemdup(dma_test_pattern, DMA_TEST_FRAME_SIZE, GFP_KERNEL);
 		if (!tf->data) {
 			kfree(tf);
 			return -ENOMEM;
 		}
 
-		memcpy(tf->data, dma_test_pattern, DMA_TEST_FRAME_SIZE);
-
 		dma_addr = dma_map_single(dma_dev, tf->data, DMA_TEST_FRAME_SIZE,
 					  DMA_TO_DEVICE);
 		if (dma_mapping_error(dma_dev, dma_addr)) {
-- 
2.7.4

