Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DC63C47095
	for <linux-usb@archiver.kernel.org>; Wed,  9 Jun 2021 10:08:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 34E8A61029
	for <linux-usb@archiver.kernel.org>; Wed,  9 Jun 2021 10:08:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238641AbhFIKKw (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 9 Jun 2021 06:10:52 -0400
Received: from out4436.biz.mail.alibaba.com ([47.88.44.36]:30412 "EHLO
        out4436.biz.mail.alibaba.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238612AbhFIKKw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Jun 2021 06:10:52 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R301e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04426;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0UbqxsMV_1623232322;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0UbqxsMV_1623232322)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 09 Jun 2021 17:52:08 +0800
From:   Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To:     valentina.manea.m@gmail.com
Cc:     shuah@kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: [PATCH] usbip: tools: usbipd: use ARRAY_SIZE for sockfdlist
Date:   Wed,  9 Jun 2021 17:51:56 +0800
Message-Id: <1623232316-89719-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Use ARRAY_SIZE instead of dividing sizeof array with sizeof an
element.

Clean up the following coccicheck warning:

./tools/usb/usbip/src/usbipd.c:536:19-20: WARNING: Use ARRAY_SIZE.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 tools/usb/usbip/src/usbipd.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tools/usb/usbip/src/usbipd.c b/tools/usb/usbip/src/usbipd.c
index 48398a7..4826d13 100644
--- a/tools/usb/usbip/src/usbipd.c
+++ b/tools/usb/usbip/src/usbipd.c
@@ -532,8 +532,7 @@ static int do_standalone_mode(int daemonize, int ipv4, int ipv6)
 		usbip_driver_close(driver);
 		return -1;
 	}
-	nsockfd = listen_all_addrinfo(ai_head, sockfdlist,
-		sizeof(sockfdlist) / sizeof(*sockfdlist));
+	nsockfd = listen_all_addrinfo(ai_head, sockfdlist, ARRAY_SIZE(sockfdlist));
 	freeaddrinfo(ai_head);
 	if (nsockfd <= 0) {
 		err("failed to open a listening socket");
-- 
1.8.3.1

