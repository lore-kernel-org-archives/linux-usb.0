Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D3B5C55ABD
	for <linux-usb@archiver.kernel.org>; Fri, 13 Nov 2020 06:05:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3ED572078B
	for <linux-usb@archiver.kernel.org>; Fri, 13 Nov 2020 06:05:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726200AbgKMGFi (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 13 Nov 2020 01:05:38 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:7531 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725971AbgKMGFi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 13 Nov 2020 01:05:38 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CXScf3d7jzhl4C;
        Fri, 13 Nov 2020 14:05:22 +0800 (CST)
Received: from compute.localdomain (10.175.112.70) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Fri, 13 Nov 2020 14:05:21 +0800
From:   Zhang Changzhong <zhangchangzhong@huawei.com>
To:     <davem@davemloft.net>, <kuba@kernel.org>, <linux@zary.sk>
CC:     <linux-usb@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH net] cx82310_eth: fix error return code in cx82310_bind()
Date:   Fri, 13 Nov 2020 14:07:07 +0800
Message-ID: <1605247627-15385-1-git-send-email-zhangchangzhong@huawei.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.70]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fix to return a negative error code from the error handling
case instead of 0, as done elsewhere in this function.

Fixes: ca139d76b0d9 ("cx82310_eth: re-enable ethernet mode after router reboot")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zhang Changzhong <zhangchangzhong@huawei.com>
---
 drivers/net/usb/cx82310_eth.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/usb/cx82310_eth.c b/drivers/net/usb/cx82310_eth.c
index ca89d82..c4568a4 100644
--- a/drivers/net/usb/cx82310_eth.c
+++ b/drivers/net/usb/cx82310_eth.c
@@ -197,7 +197,8 @@ static int cx82310_bind(struct usbnet *dev, struct usb_interface *intf)
 	}
 
 	/* enable ethernet mode (?) */
-	if (cx82310_enable_ethernet(dev))
+	ret = cx82310_enable_ethernet(dev);
+	if (ret)
 		goto err;
 
 	/* get the MAC address */
-- 
2.9.5

