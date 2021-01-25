Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF27AC433DB
	for <linux-usb@archiver.kernel.org>; Tue, 26 Jan 2021 19:35:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A342F22A84
	for <linux-usb@archiver.kernel.org>; Tue, 26 Jan 2021 19:35:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732551AbhAZFll (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 26 Jan 2021 00:41:41 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:11493 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728490AbhAYMyU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Jan 2021 07:54:20 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DPTlt2PZpzjCd2;
        Mon, 25 Jan 2021 20:32:42 +0800 (CST)
Received: from linux-lmwb.huawei.com (10.175.103.112) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.498.0; Mon, 25 Jan 2021 20:33:45 +0800
From:   Zou Wei <zou_wei@huawei.com>
To:     <gregkh@linuxfoundation.org>, <andreyknvl@google.com>,
        <dvyukov@google.com>, <allen.lkml@gmail.com>,
        <stern@rowland.harvard.edu>, <sashal@kernel.org>,
        <gustavoars@kernel.org>, <a.darwish@linutronix.de>
CC:     <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Zou Wei <zou_wei@huawei.com>
Subject: [PATCH -next] usb: core: Remove unused including <linux/version.h>
Date:   Mon, 25 Jan 2021 20:44:48 +0800
Message-ID: <1611578688-43256-1-git-send-email-zou_wei@huawei.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.103.112]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fix the following versioncheck warning:

drivers/usb/core/hcd.c:14:1: unused including <linux/version.h>

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zou Wei <zou_wei@huawei.com>
---
 drivers/usb/core/hcd.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index 3f03813..53bc93d 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -11,7 +11,6 @@
 
 #include <linux/bcd.h>
 #include <linux/module.h>
-#include <linux/version.h>
 #include <linux/kernel.h>
 #include <linux/sched/task_stack.h>
 #include <linux/slab.h>
-- 
2.6.2

