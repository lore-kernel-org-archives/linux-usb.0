Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86908C6FA92
	for <linux-usb@archiver.kernel.org>; Thu, 22 Sep 2022 13:50:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231888AbiIVNuw (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 22 Sep 2022 09:50:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231482AbiIVNua (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Sep 2022 09:50:30 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EEA1AEDBF;
        Thu, 22 Sep 2022 06:50:13 -0700 (PDT)
Received: from dggpemm500021.china.huawei.com (unknown [172.30.72.55])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MYGlT3l6jzWgq8;
        Thu, 22 Sep 2022 21:46:13 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500021.china.huawei.com (7.185.36.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 22 Sep 2022 21:50:10 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 22 Sep
 2022 21:50:10 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-usb@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
CC:     <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@somainline.org>, <heikki.krogerus@linux.intel.com>,
        <gregkh@linuxfoundation.org>, <yangyingliang@huawei.com>
Subject: [PATCH -next] usb: typec: qcom-pmic-typec: Switch to use dev_err_probe() helper
Date:   Thu, 22 Sep 2022 21:57:08 +0800
Message-ID: <20220922135708.2212249-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In the probe path, dev_err() can be replaced with dev_err_probe()
which will check if error code is -EPROBE_DEFER and prints the
error name. It also sets the defer probe reason which can be
checked later through debugfs. It's more simple in error path.

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/usb/typec/qcom-pmic-typec.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/qcom-pmic-typec.c b/drivers/usb/typec/qcom-pmic-typec.c
index a0454a80c4a2..432ea62f1bab 100644
--- a/drivers/usb/typec/qcom-pmic-typec.c
+++ b/drivers/usb/typec/qcom-pmic-typec.c
@@ -195,9 +195,8 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
 
 	qcom_usb->role_sw = fwnode_usb_role_switch_get(dev_fwnode(qcom_usb->dev));
 	if (IS_ERR(qcom_usb->role_sw)) {
-		if (PTR_ERR(qcom_usb->role_sw) != -EPROBE_DEFER)
-			dev_err(dev, "failed to get role switch\n");
-		ret = PTR_ERR(qcom_usb->role_sw);
+		ret = dev_err_probe(dev, PTR_ERR(qcom_usb->role_sw),
+				    "failed to get role switch\n");
 		goto err_typec_port;
 	}
 
-- 
2.25.1

