Return-Path: <SRS0=N1Cw=C3=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68C87C43464
	for <linux-usb@archiver.kernel.org>; Fri, 18 Sep 2020 02:48:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 205DF23444
	for <linux-usb@archiver.kernel.org>; Fri, 18 Sep 2020 02:48:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727985AbgIRCrz (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 17 Sep 2020 22:47:55 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:57414 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729200AbgIRCrx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 17 Sep 2020 22:47:53 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 3F78ACBDC176CC835473;
        Fri, 18 Sep 2020 10:47:50 +0800 (CST)
Received: from huawei.com (10.175.113.32) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.487.0; Fri, 18 Sep 2020
 10:47:41 +0800
From:   Liu Shixin <liushixin2@huawei.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Liu Shixin <liushixin2@huawei.com>
Subject: [PATCH -next] usb: appledisplay: use module_usb_driver to simplify the code
Date:   Fri, 18 Sep 2020 11:10:12 +0800
Message-ID: <20200918031012.3980558-1-liushixin2@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.32]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

module_usb_driver() makes the code simpler by eliminating
boilerplate code.

Signed-off-by: Liu Shixin <liushixin2@huawei.com>
---
 drivers/usb/misc/appledisplay.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/usb/misc/appledisplay.c b/drivers/usb/misc/appledisplay.c
index 36fed1a09666..c8098e9b432e 100644
--- a/drivers/usb/misc/appledisplay.c
+++ b/drivers/usb/misc/appledisplay.c
@@ -342,20 +342,8 @@ static struct usb_driver appledisplay_driver = {
 	.disconnect	= appledisplay_disconnect,
 	.id_table	= appledisplay_table,
 };
-
-static int __init appledisplay_init(void)
-{
-	return usb_register(&appledisplay_driver);
-}
-
-static void __exit appledisplay_exit(void)
-{
-	usb_deregister(&appledisplay_driver);
-}
+module_usb_driver(appledisplay_driver);
 
 MODULE_AUTHOR("Michael Hanselmann");
 MODULE_DESCRIPTION("Apple Cinema Display driver");
 MODULE_LICENSE("GPL");
-
-module_init(appledisplay_init);
-module_exit(appledisplay_exit);
-- 
2.25.1

