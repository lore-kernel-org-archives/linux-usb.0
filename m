Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 006B6C43461
	for <linux-usb@archiver.kernel.org>; Thu,  8 Apr 2021 13:09:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D318261074
	for <linux-usb@archiver.kernel.org>; Thu,  8 Apr 2021 13:09:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231672AbhDHNJh (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 8 Apr 2021 09:09:37 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:16845 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231557AbhDHNJg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Apr 2021 09:09:36 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4FGM3y23VCz9vww;
        Thu,  8 Apr 2021 21:07:10 +0800 (CST)
Received: from huawei.com (10.174.28.241) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.498.0; Thu, 8 Apr 2021
 21:09:15 +0800
From:   Bixuan Cui <cuibixuan@huawei.com>
To:     <linux-kernel@vger.kernel.org>
CC:     <john.wanghui@huawei.com>, <linux-usb@vger.kernel.org>,
        <gregkh@linuxfoundation.org>, <stern@rowland.harvard.edu>,
        <gustavoars@kernel.org>, <oneukum@suse.com>,
        <erosca@de.adit-jv.com>, "Bixuan Cui" <cuibixuan@huawei.com>
Subject: [PATCH] usb: core: hub: Fix PM reference leak in usb_port_resume()
Date:   Thu, 8 Apr 2021 21:08:31 +0800
Message-ID: <20210408130831.56239-1-cuibixuan@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.28.241]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

pm_runtime_get_sync will increment pm usage counter even it failed.
thus a pairing decrement is needed.
Fix it by replacing it with pm_runtime_resume_and_get to keep usage
counter balanced.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Bixuan Cui <cuibixuan@huawei.com>
---
 drivers/usb/core/hub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 9a83390072da..b2bc4b7c4289 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -3605,7 +3605,7 @@ int usb_port_resume(struct usb_device *udev, pm_message_t msg)
 	u16		portchange, portstatus;
 
 	if (!test_and_set_bit(port1, hub->child_usage_bits)) {
-		status = pm_runtime_get_sync(&port_dev->dev);
+		status = pm_runtime_resume_and_get(&port_dev->dev);
 		if (status < 0) {
 			dev_dbg(&udev->dev, "can't resume usb port, status %d\n",
 					status);
-- 
2.17.1

