Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30BA2C433DB
	for <linux-usb@archiver.kernel.org>; Wed, 23 Dec 2020 14:15:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 008EB23370
	for <linux-usb@archiver.kernel.org>; Wed, 23 Dec 2020 14:15:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728762AbgLWOOt (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 23 Dec 2020 09:14:49 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:9476 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728759AbgLWOOt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 23 Dec 2020 09:14:49 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4D1FYR5HF1zhvSN;
        Wed, 23 Dec 2020 22:13:31 +0800 (CST)
Received: from ubuntu.network (10.175.138.68) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.498.0; Wed, 23 Dec 2020 22:13:56 +0800
From:   Zheng Yongjun <zhengyongjun3@huawei.com>
To:     <valentina.manea.m@gmail.com>, <shuah@kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: [PATCH -next] usb: usbip: Use DEFINE_SPINLOCK() for spinlock
Date:   Wed, 23 Dec 2020 22:14:31 +0800
Message-ID: <20201223141431.835-1-zhengyongjun3@huawei.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.138.68]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

spinlock can be initialized automatically with DEFINE_SPINLOCK()
rather than explicitly calling spin_lock_init().

Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
---
 drivers/usb/usbip/stub_main.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/usb/usbip/stub_main.c b/drivers/usb/usbip/stub_main.c
index c1c0bbc9f8b1..77a5b3f8736a 100644
--- a/drivers/usb/usbip/stub_main.c
+++ b/drivers/usb/usbip/stub_main.c
@@ -23,7 +23,7 @@ struct kmem_cache *stub_priv_cache;
  */
 #define MAX_BUSID 16
 static struct bus_id_priv busid_table[MAX_BUSID];
-static spinlock_t busid_table_lock;
+static DEFINE_SPINLOCK(busid_table_lock);
 
 static void init_busid_table(void)
 {
@@ -35,8 +35,6 @@ static void init_busid_table(void)
 	 */
 	memset(busid_table, 0, sizeof(busid_table));
 
-	spin_lock_init(&busid_table_lock);
-
 	for (i = 0; i < MAX_BUSID; i++)
 		spin_lock_init(&busid_table[i].busid_lock);
 }
-- 
2.22.0

