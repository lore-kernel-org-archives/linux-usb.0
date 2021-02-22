Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81885C433E0
	for <linux-usb@archiver.kernel.org>; Mon, 22 Feb 2021 08:23:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 330EC64E77
	for <linux-usb@archiver.kernel.org>; Mon, 22 Feb 2021 08:23:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230038AbhBVIXg (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 22 Feb 2021 03:23:36 -0500
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131]:58583 "EHLO
        out30-131.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229863AbhBVIXe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 22 Feb 2021 03:23:34 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e01424;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0UPBmRGZ_1613982169;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0UPBmRGZ_1613982169)
          by smtp.aliyun-inc.com(127.0.0.1);
          Mon, 22 Feb 2021 16:22:50 +0800
From:   Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To:     pawell@cadence.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: [PATCH] usb: cdnsp: remove unneeded semicolon
Date:   Mon, 22 Feb 2021 16:22:42 +0800
Message-Id: <1613982162-72490-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fix the following coccicheck warnings:

./drivers/usb/cdns3/cdnsp-gadget.c:83:2-3: Unneeded semicolon.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/usb/cdns3/cdnsp-gadget.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/cdns3/cdnsp-gadget.c b/drivers/usb/cdns3/cdnsp-gadget.c
index f2ebbac..c186a617 100644
--- a/drivers/usb/cdns3/cdnsp-gadget.c
+++ b/drivers/usb/cdns3/cdnsp-gadget.c
@@ -80,7 +80,7 @@ int cdnsp_find_next_ext_cap(void __iomem *base, u32 start, int id)
 		offset = HCC_EXT_CAPS(val) << 2;
 		if (!offset)
 			return 0;
-	};
+	}
 
 	do {
 		val = readl(base + offset);
-- 
1.8.3.1

