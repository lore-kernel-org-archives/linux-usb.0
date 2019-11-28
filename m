Return-Path: <SRS0=C34Z=ZU=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC72CC432C0
	for <linux-usb@archiver.kernel.org>; Thu, 28 Nov 2019 02:38:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CE0F82168B
	for <linux-usb@archiver.kernel.org>; Thu, 28 Nov 2019 02:38:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728328AbfK1CiJ (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 27 Nov 2019 21:38:09 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:44134 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727113AbfK1CiJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 27 Nov 2019 21:38:09 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 7C4909A29E93C202E5FA;
        Thu, 28 Nov 2019 10:38:06 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.439.0; Thu, 28 Nov 2019
 10:37:57 +0800
From:   zhengbin <zhengbin13@huawei.com>
To:     <balbi@kernel.org>, <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>
CC:     <zhengbin13@huawei.com>
Subject: [PATCH 2/2] usb: gadget: udc: Remove unneeded semicolon
Date:   Thu, 28 Nov 2019 10:45:19 +0800
Message-ID: <1574909119-19714-3-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574909119-19714-1-git-send-email-zhengbin13@huawei.com>
References: <1574909119-19714-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fixes coccicheck warning:

drivers/usb/gadget/udc/omap_udc.c:2579:2-3: Unneeded semicolon

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: zhengbin <zhengbin13@huawei.com>
---
 drivers/usb/gadget/udc/omap_udc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/omap_udc.c b/drivers/usb/gadget/udc/omap_udc.c
index f36f073..6bb65f3 100644
--- a/drivers/usb/gadget/udc/omap_udc.c
+++ b/drivers/usb/gadget/udc/omap_udc.c
@@ -2576,7 +2576,7 @@ omap_ep_setup(char *name, u8 addr, u8 type,
 	case USB_ENDPOINT_XFER_INT:
 		ep->ep.caps.type_int = true;
 		break;
-	};
+	}

 	if (addr & USB_DIR_IN)
 		ep->ep.caps.dir_in = true;
--
2.7.4

