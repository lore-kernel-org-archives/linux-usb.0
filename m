Return-Path: <SRS0=WR2x=EM=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7E1AC55178
	for <linux-usb@archiver.kernel.org>; Fri,  6 Nov 2020 11:50:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 780D9206E3
	for <linux-usb@archiver.kernel.org>; Fri,  6 Nov 2020 11:50:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726954AbgKFLuK (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 6 Nov 2020 06:50:10 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:7062 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726565AbgKFLuJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 Nov 2020 06:50:09 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CSJbV5YJFzhgtm;
        Fri,  6 Nov 2020 19:49:58 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.487.0; Fri, 6 Nov 2020
 19:49:59 +0800
From:   Zhang Qilong <zhangqilong3@huawei.com>
To:     <b-liu@ti.com>, <gregkh@linuxfoundation.org>
CC:     <tony@atomide.com>, <linux-usb@vger.kernel.org>
Subject: [PATCH v2] usb: musb: fix reference leak in musb_irq_work
Date:   Fri, 6 Nov 2020 19:53:50 +0800
Message-ID: <20201106115350.2281531-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

pm_runtime_get_sync() will increment pm usage at first and it
will resume the device later. If runtime of the device has
error or device is in inaccessible state(or other error state),
resume operation will fail. If we do not call put operation to
decrease the reference, it will result in reference leak in
musb_irq_work. Moreover, this device cannot enter the idle state
and always stay busy or other non-idle state later. So we should
fix it through adding pm_runtime_put_noidle.

Fixes: 3ba7b7795b7e8 ("usb: musb: Fix external abort on non-linefetch for musb_irq_work()")

Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
Changelog:
v2
- added the description and fixes for reference leak details.
---
 drivers/usb/musb/musb_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
index 849e0b770130..160387de59c0 100644
--- a/drivers/usb/musb/musb_core.c
+++ b/drivers/usb/musb/musb_core.c
@@ -2069,7 +2069,7 @@ static void musb_irq_work(struct work_struct *data)
 	error = pm_runtime_get_sync(musb->controller);
 	if (error < 0) {
 		dev_err(musb->controller, "Could not enable: %i\n", error);
-
+		pm_runtime_put_noidle(musb->controller);
 		return;
 	}
 
-- 
2.25.4

