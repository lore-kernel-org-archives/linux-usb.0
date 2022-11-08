Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7BBAC4332F
	for <linux-usb@archiver.kernel.org>; Tue,  8 Nov 2022 06:11:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233298AbiKHGLv (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 8 Nov 2022 01:11:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233473AbiKHGLj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Nov 2022 01:11:39 -0500
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49B162ED7A;
        Mon,  7 Nov 2022 22:11:38 -0800 (PST)
Received: from canpemm500007.china.huawei.com (unknown [172.30.72.56])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4N5yR46k5CzRp5s;
        Tue,  8 Nov 2022 14:11:28 +0800 (CST)
Received: from localhost (10.174.179.215) by canpemm500007.china.huawei.com
 (7.192.104.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 8 Nov
 2022 14:11:36 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <vincent.sunplus@gmail.com>, <vkoul@kernel.org>,
        <kishon@kernel.org>
CC:     <linux-usb@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH] phy: usb: sunplus: Fix memleak in update_disc_vol()
Date:   Tue, 8 Nov 2022 14:11:13 +0800
Message-ID: <20221108061113.35964-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 canpemm500007.china.huawei.com (7.192.104.62)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

'otp_v' is allocated in nvmem_cell_read(), it should be freed
before return.

Fixes: 99d9ccd97385 ("phy: usb: Add USB2.0 phy driver for Sunplus SP7021")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/phy/sunplus/phy-sunplus-usb2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/sunplus/phy-sunplus-usb2.c b/drivers/phy/sunplus/phy-sunplus-usb2.c
index e827b79f6d49..450cf8e6d7fb 100644
--- a/drivers/phy/sunplus/phy-sunplus-usb2.c
+++ b/drivers/phy/sunplus/phy-sunplus-usb2.c
@@ -96,6 +96,7 @@ static int update_disc_vol(struct sp_usbphy *usbphy)
 		set = *(otp_v + 1);
 		set = (set << (sizeof(char) * 8)) | *otp_v;
 		set = (set >> usbphy->disc_vol_addr_off) & J_DISC;
+		kfree(otp_v);
 	}
 
 	if (IS_ERR(otp_v) || set == 0)
-- 
2.17.1

