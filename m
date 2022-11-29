Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 987B3C4332F
	for <linux-usb@archiver.kernel.org>; Tue, 29 Nov 2022 03:13:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235215AbiK2DN3 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 28 Nov 2022 22:13:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234820AbiK2DN2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Nov 2022 22:13:28 -0500
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75E2162DC;
        Mon, 28 Nov 2022 19:13:27 -0800 (PST)
Received: from canpemm500010.china.huawei.com (unknown [172.30.72.57])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4NLnT82yxnzHwFb;
        Tue, 29 Nov 2022 11:12:44 +0800 (CST)
Received: from localhost.localdomain (10.175.112.70) by
 canpemm500010.china.huawei.com (7.192.105.118) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 29 Nov 2022 11:13:25 +0800
From:   Wang Yufen <wangyufen@huawei.com>
To:     <gregkh@linuxfoundation.org>, <linus.walleij@linaro.org>,
        <mailhol.vincent@wanadoo.fr>
CC:     <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <wangyufen@huawei.com>
Subject: [PATCH] USB: FHCI: fix error return code in of_fhci_probe()
Date:   Tue, 29 Nov 2022 11:33:30 +0800
Message-ID: <1669692810-26744-1-git-send-email-wangyufen@huawei.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.70]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 canpemm500010.china.huawei.com (7.192.105.118)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fix to return a negative error code of PTR_ERR(fhci->gpiods[i])
instead of 0.

Fixes: a4efdb8a423b ("USB: FHCI: Switch to GPIO descriptors")
Signed-off-by: Wang Yufen <wangyufen@huawei.com>
---
 drivers/usb/host/fhci-hcd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/host/fhci-hcd.c b/drivers/usb/host/fhci-hcd.c
index 95a4446..afef72a 100644
--- a/drivers/usb/host/fhci-hcd.c
+++ b/drivers/usb/host/fhci-hcd.c
@@ -639,6 +639,7 @@ static int of_fhci_probe(struct platform_device *ofdev)
 					NULL, i, GPIOD_OUT_LOW);
 
 		if (IS_ERR(fhci->gpiods[i])) {
+			ret = PTR_ERR(fhci->gpiods[i])
 			dev_err(dev, "incorrect GPIO%d: %ld\n",
 				i, PTR_ERR(fhci->gpiods[i]));
 			goto err_gpios;
-- 
1.8.3.1

