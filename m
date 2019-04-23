Return-Path: <SRS0=tIEv=SZ=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACE36C10F14
	for <linux-usb@archiver.kernel.org>; Tue, 23 Apr 2019 07:40:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 85ABD21738
	for <linux-usb@archiver.kernel.org>; Tue, 23 Apr 2019 07:40:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726847AbfDWHkk (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 23 Apr 2019 03:40:40 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:7230 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726491AbfDWHk1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 23 Apr 2019 03:40:27 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 5C8582AB8605C2C66D24;
        Tue, 23 Apr 2019 15:40:22 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.439.0; Tue, 23 Apr 2019 15:40:16 +0800
From:   Kefeng Wang <wangkefeng.wang@huawei.com>
To:     <linux-kernel@vger.kernel.org>
CC:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Kefeng Wang <wangkefeng.wang@huawei.com>,
        Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>
Subject: [PATCH next 24/25] usb: musb: dsps: Use dev_get_drvdata()
Date:   Tue, 23 Apr 2019 15:50:19 +0800
Message-ID: <20190423075020.173734-25-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190423075020.173734-1-wangkefeng.wang@huawei.com>
References: <20190423075020.173734-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190423075019.vW_w7I-g7baQ3ido--6VYxnN3mfnxnw9WxAkY0A3Qt8@z>

Using dev_get_drvdata directly.

Cc: Bin Liu <b-liu@ti.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 drivers/usb/musb/musb_dsps.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/musb/musb_dsps.c b/drivers/usb/musb/musb_dsps.c
index 403eb97915f8..327d4f7baaf7 100644
--- a/drivers/usb/musb/musb_dsps.c
+++ b/drivers/usb/musb/musb_dsps.c
@@ -168,8 +168,7 @@ static void dsps_mod_timer_optional(struct dsps_glue *glue)
 static void dsps_musb_enable(struct musb *musb)
 {
 	struct device *dev = musb->controller;
-	struct platform_device *pdev = to_platform_device(dev->parent);
-	struct dsps_glue *glue = platform_get_drvdata(pdev);
+	struct dsps_glue *glue = dev_get_drvdata(dev->parent);
 	const struct dsps_musb_wrapper *wrp = glue->wrp;
 	void __iomem *reg_base = musb->ctrl_base;
 	u32 epmask, coremask;
@@ -195,8 +194,7 @@ static void dsps_musb_enable(struct musb *musb)
 static void dsps_musb_disable(struct musb *musb)
 {
 	struct device *dev = musb->controller;
-	struct platform_device *pdev = to_platform_device(dev->parent);
-	struct dsps_glue *glue = platform_get_drvdata(pdev);
+	struct dsps_glue *glue = dev_get_drvdata(dev->parent);
 	const struct dsps_musb_wrapper *wrp = glue->wrp;
 	void __iomem *reg_base = musb->ctrl_base;
 
-- 
2.20.1

