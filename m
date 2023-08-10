Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D75CEEB64DD
	for <linux-usb@archiver.kernel.org>; Thu, 10 Aug 2023 01:54:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232318AbjHJBye (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 9 Aug 2023 21:54:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232288AbjHJByd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Aug 2023 21:54:33 -0400
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3475AC
        for <linux-usb@vger.kernel.org>; Wed,  9 Aug 2023 18:54:23 -0700 (PDT)
Received: from dggpemm500011.china.huawei.com (unknown [172.30.72.57])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RLqh60Qwlz1L9G1;
        Thu, 10 Aug 2023 09:53:10 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500011.china.huawei.com (7.185.36.110) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 10 Aug 2023 09:54:21 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 10 Aug
 2023 09:54:21 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-usb@vger.kernel.org>
CC:     <Thinh.Nguyen@synopsys.com>, <gregkh@linuxfoundation.org>,
        <yangyingliang@huawei.com>
Subject: [PATCH -next] usb: dwc3: dwc3-octeon: remove unnecessary platform_set_drvdata()
Date:   Thu, 10 Aug 2023 09:51:17 +0800
Message-ID: <20230810015117.3085574-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Remove unnecessary platform_set_drvdata(..., NULL) in ->remove(),
the driver_data will be cleared in device_unbind_cleanup() after
calling ->remove() in driver call code.

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/usb/dwc3/dwc3-octeon.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-octeon.c b/drivers/usb/dwc3/dwc3-octeon.c
index 6b6581057345..356347780c15 100644
--- a/drivers/usb/dwc3/dwc3-octeon.c
+++ b/drivers/usb/dwc3/dwc3-octeon.c
@@ -517,7 +517,6 @@ static void dwc3_octeon_remove(struct platform_device *pdev)
 	struct dwc3_octeon *octeon = platform_get_drvdata(pdev);
 
 	of_platform_depopulate(octeon->dev);
-	platform_set_drvdata(pdev, NULL);
 }
 
 static const struct of_device_id dwc3_octeon_of_match[] = {
-- 
2.25.1

