Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93763C433C1
	for <linux-usb@archiver.kernel.org>; Mon, 29 Mar 2021 07:06:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5A6FE61936
	for <linux-usb@archiver.kernel.org>; Mon, 29 Mar 2021 07:06:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230394AbhC2HFy (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 29 Mar 2021 03:05:54 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:14943 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230329AbhC2HFb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 Mar 2021 03:05:31 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4F83TJ51D1zkgTW;
        Mon, 29 Mar 2021 15:03:48 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Mon, 29 Mar 2021 15:05:25 +0800
From:   Tian Tao <tiantao6@hisilicon.com>
To:     <hminas@synopsys.com>, <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>
Subject: [PATCH v2] usb: dwc2: add parenthess and space around *
Date:   Mon, 29 Mar 2021 15:05:56 +0800
Message-ID: <1617001556-61868-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Just fix the following checkpatch error:
ERROR: Macros with complex values should be enclosed in parentheses.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
Signed-off-by: Zeng Tao <prime.zeng@hisilicon.com>
---
v2: update the commit message.
---
 drivers/usb/dwc2/hcd_queue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc2/hcd_queue.c b/drivers/usb/dwc2/hcd_queue.c
index 68bbac6..621a484 100644
--- a/drivers/usb/dwc2/hcd_queue.c
+++ b/drivers/usb/dwc2/hcd_queue.c
@@ -59,7 +59,7 @@
 #define DWC2_UNRESERVE_DELAY (msecs_to_jiffies(5))
 
 /* If we get a NAK, wait this long before retrying */
-#define DWC2_RETRY_WAIT_DELAY 1*1E6L
+#define DWC2_RETRY_WAIT_DELAY (1 * 1E6L)
 
 /**
  * dwc2_periodic_channel_available() - Checks that a channel is available for a
-- 
2.7.4

