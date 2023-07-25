Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1429AC001E0
	for <linux-usb@archiver.kernel.org>; Tue, 25 Jul 2023 12:55:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231806AbjGYMzu (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 25 Jul 2023 08:55:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230220AbjGYMzt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Jul 2023 08:55:49 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 494431AA;
        Tue, 25 Jul 2023 05:55:47 -0700 (PDT)
Received: from dggpemm100012.china.huawei.com (unknown [172.30.72.55])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4R9H4656LWzCrJd;
        Tue, 25 Jul 2023 20:52:22 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm100012.china.huawei.com (7.185.36.212) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 25 Jul 2023 20:55:45 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 25 Jul
 2023 20:55:44 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-usb@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
CC:     <bryan.odonoghue@linaro.org>, <linux@roeck-us.net>,
        <heikki.krogerus@linux.intel.com>, <agross@kernel.org>,
        <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <gregkh@linuxfoundation.org>, <caleb.connolly@linaro.org>
Subject: [PATCH] usb: typec: qcom: fix return value check in qcom_pmic_typec_probe()
Date:   Tue, 25 Jul 2023 20:53:19 +0800
Message-ID: <20230725125319.565733-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

device_get_named_child_node() returns NULL, if it fails, replace
IS_ERR() with NULL pointer check.

Fixes: a4422ff22142 ("usb: typec: qcom: Add Qualcomm PMIC Type-C driver")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
index a905160dd860..9b467a346114 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
@@ -209,8 +209,8 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, tcpm);
 
 	tcpm->tcpc.fwnode = device_get_named_child_node(tcpm->dev, "connector");
-	if (IS_ERR(tcpm->tcpc.fwnode))
-		return PTR_ERR(tcpm->tcpc.fwnode);
+	if (!tcpm->tcpc.fwnode)
+		return -EINVAL;
 
 	tcpm->tcpm_port = tcpm_register_port(tcpm->dev, &tcpm->tcpc);
 	if (IS_ERR(tcpm->tcpm_port)) {
-- 
2.25.1

