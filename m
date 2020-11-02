Return-Path: <SRS0=da9n=EI=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 697A1C2D0A3
	for <linux-usb@archiver.kernel.org>; Mon,  2 Nov 2020 02:16:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 286B32224E
	for <linux-usb@archiver.kernel.org>; Mon,  2 Nov 2020 02:16:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727470AbgKBCQM (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 1 Nov 2020 21:16:12 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:7025 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727409AbgKBCQL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 1 Nov 2020 21:16:11 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CPc3D3g0mzhfYn;
        Mon,  2 Nov 2020 10:16:08 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.487.0; Mon, 2 Nov 2020
 10:16:07 +0800
From:   Zhang Qilong <zhangqilong3@huawei.com>
To:     <hadess@hadess.net>, <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>
Subject: [PATCH -v3] USB: apple-mfi-fastcharge: fix reference leak in apple_mfi_fc_set_property
Date:   Mon, 2 Nov 2020 10:26:50 +0800
Message-ID: <20201102022650.67115-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

pm_runtime_get_sync() will increment pm usage at first and it
will resume the device later. If runtime of the device has
error or device is in inaccessible state(or other error state),
resume operation will fail. If we do not call put operation to
decrease the reference, the result is that this device cannot
enter the idle state and always stay busy or other non-idle
state.

Fixes: 249fa8217b846 ("USB: Add driver to control USB fast charge for iOS devices")

Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
Changelog:
v3
- added changelog and fix the description.
v2
- added the description and fixes for reference leak details.
---
 drivers/usb/misc/apple-mfi-fastcharge.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/misc/apple-mfi-fastcharge.c b/drivers/usb/misc/apple-mfi-fastcharge.c
index 579d8c84de42..9de0171b5177 100644
--- a/drivers/usb/misc/apple-mfi-fastcharge.c
+++ b/drivers/usb/misc/apple-mfi-fastcharge.c
@@ -120,8 +120,10 @@ static int apple_mfi_fc_set_property(struct power_supply *psy,
 	dev_dbg(&mfi->udev->dev, "prop: %d\n", psp);
 
 	ret = pm_runtime_get_sync(&mfi->udev->dev);
-	if (ret < 0)
+	if (ret < 0) {
+		pm_runtime_put_noidle(&mfi->udev->dev);
 		return ret;
+	}
 
 	switch (psp) {
 	case POWER_SUPPLY_PROP_CHARGE_TYPE:
-- 
2.17.1

