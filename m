Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F37F1C388F9
	for <linux-usb@archiver.kernel.org>; Wed, 11 Nov 2020 14:21:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A311B20756
	for <linux-usb@archiver.kernel.org>; Wed, 11 Nov 2020 14:21:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726788AbgKKOVG (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 11 Nov 2020 09:21:06 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:7479 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726720AbgKKOVG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 Nov 2020 09:21:06 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CWRjM5KMCzhZXF;
        Wed, 11 Nov 2020 22:20:55 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.487.0; Wed, 11 Nov 2020
 22:21:00 +0800
From:   Zhang Qilong <zhangqilong3@huawei.com>
To:     <balbi@kernel.org>, <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>
Subject: [PATCH] usb: gadget: udc: renesas_usb3: Fix PM disable depth imbalance on error handling
Date:   Wed, 11 Nov 2020 22:24:46 +0800
Message-ID: <20201111142446.306109-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The pm_runtime_enable will increase power disable depth. Thus
a pairing decrement is needed on the error handling path to
keep it balanced.

Fixes: d998844016b24 ("usb: gadget: udc: renesas_usb3: should call pm_runtime_enable() before add udc")
Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 drivers/usb/gadget/udc/renesas_usb3.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
index 0c418ce50ba0..fd3530a7bf98 100644
--- a/drivers/usb/gadget/udc/renesas_usb3.c
+++ b/drivers/usb/gadget/udc/renesas_usb3.c
@@ -2820,7 +2820,7 @@ static int renesas_usb3_probe(struct platform_device *pdev)
 	pm_runtime_enable(&pdev->dev);
 	ret = usb_add_gadget_udc(&pdev->dev, &usb3->gadget);
 	if (ret < 0)
-		goto err_add_udc;
+		goto err_pm_disable;
 
 	ret = device_create_file(&pdev->dev, &dev_attr_role);
 	if (ret < 0)
@@ -2858,6 +2858,9 @@ static int renesas_usb3_probe(struct platform_device *pdev)
 err_dev_create:
 	usb_del_gadget_udc(&usb3->gadget);
 
+err_pm_disable:
+	pm_runtime_disable(&pdev->dev);
+
 err_add_udc:
 	renesas_usb3_dma_free_prd(usb3, &pdev->dev);
 
-- 
2.25.4

