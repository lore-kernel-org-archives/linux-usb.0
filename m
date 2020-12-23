Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4388CC433E0
	for <linux-usb@archiver.kernel.org>; Wed, 23 Dec 2020 14:11:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0F39023159
	for <linux-usb@archiver.kernel.org>; Wed, 23 Dec 2020 14:11:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728751AbgLWOLA (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 23 Dec 2020 09:11:00 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:9912 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728650AbgLWOLA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 23 Dec 2020 09:11:00 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4D1FSs6nd4z7K9P;
        Wed, 23 Dec 2020 22:09:33 +0800 (CST)
Received: from ubuntu.network (10.175.138.68) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.498.0; Wed, 23 Dec 2020 22:10:08 +0800
From:   Zheng Yongjun <zhengyongjun3@huawei.com>
To:     <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: [PATCH -next] usb: misc: use DEFINE_MUTEX (and mutex_init() had been too late)
Date:   Wed, 23 Dec 2020 22:10:44 +0800
Message-ID: <20201223141044.32235-1-zhengyongjun3@huawei.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.138.68]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
---
 drivers/usb/misc/ftdi-elan.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/misc/ftdi-elan.c b/drivers/usb/misc/ftdi-elan.c
index 8a3d9c0c8d8b..bfb538f2cac1 100644
--- a/drivers/usb/misc/ftdi-elan.c
+++ b/drivers/usb/misc/ftdi-elan.c
@@ -61,7 +61,7 @@ extern struct platform_driver u132_platform_driver;
  * ftdi_module_lock exists to protect access to global variables
  *
  */
-static struct mutex ftdi_module_lock;
+static DEFINE_MUTEX(ftdi_module_lock);
 static int ftdi_instances = 0;
 static struct list_head ftdi_static_list;
 /*
@@ -2761,7 +2761,6 @@ static int __init ftdi_elan_init(void)
 {
 	int result;
 	pr_info("driver %s\n", ftdi_elan_driver.name);
-	mutex_init(&ftdi_module_lock);
 	INIT_LIST_HEAD(&ftdi_static_list);
 	result = usb_register(&ftdi_elan_driver);
 	if (result) {
-- 
2.22.0

