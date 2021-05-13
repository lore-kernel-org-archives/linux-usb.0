Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5924DC433ED
	for <linux-usb@archiver.kernel.org>; Thu, 13 May 2021 05:03:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 266B06142D
	for <linux-usb@archiver.kernel.org>; Thu, 13 May 2021 05:03:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230362AbhEMFEg (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 13 May 2021 01:04:36 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2649 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230176AbhEMFEd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 May 2021 01:04:33 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Fgfbf6dQYzQmB5;
        Thu, 13 May 2021 12:59:58 +0800 (CST)
Received: from huawei.com (10.175.103.91) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.498.0; Thu, 13 May 2021
 13:03:17 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>
CC:     <balbi@kernel.org>, <gregkh@linuxfoundation.org>
Subject: [PATCH -next] USB: gadget: udc: s3c2410_udc: s3c2410_udc_set_ep0_ss() can be static
Date:   Thu, 13 May 2021 13:05:44 +0800
Message-ID: <20210513050544.625824-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

s3c2410_udc_set_ep0_ss() only used within this file. It should be static.

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/usb/gadget/udc/s3c2410_udc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/s3c2410_udc.c b/drivers/usb/gadget/udc/s3c2410_udc.c
index b154b62abefa..902e9c3e940a 100644
--- a/drivers/usb/gadget/udc/s3c2410_udc.c
+++ b/drivers/usb/gadget/udc/s3c2410_udc.c
@@ -198,7 +198,7 @@ static inline void s3c2410_udc_set_ep0_de(void __iomem *base)
 	udc_writeb(base, S3C2410_UDC_EP0_CSR_DE, S3C2410_UDC_EP0_CSR_REG);
 }
 
-inline void s3c2410_udc_set_ep0_ss(void __iomem *b)
+static inline void s3c2410_udc_set_ep0_ss(void __iomem *b)
 {
 	udc_writeb(b, S3C2410_UDC_INDEX_EP0, S3C2410_UDC_INDEX_REG);
 	udc_writeb(b, S3C2410_UDC_EP0_CSR_SENDSTL, S3C2410_UDC_EP0_CSR_REG);
-- 
2.25.1

