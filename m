Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC1CDC433ED
	for <linux-usb@archiver.kernel.org>; Fri,  9 Apr 2021 00:50:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8015961151
	for <linux-usb@archiver.kernel.org>; Fri,  9 Apr 2021 00:50:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233043AbhDIAu5 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 8 Apr 2021 20:50:57 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:15986 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232984AbhDIAu5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Apr 2021 20:50:57 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FGfdC53zpzyNwN;
        Fri,  9 Apr 2021 08:48:31 +0800 (CST)
Received: from huawei.com (10.174.28.241) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.498.0; Fri, 9 Apr 2021
 08:50:32 +0800
From:   Bixuan Cui <cuibixuan@huawei.com>
To:     <linux-kernel@vger.kernel.org>, <agross@kernel.org>
CC:     <john.wanghui@huawei.com>, <bjorn.andersson@linaro.org>,
        <balbi@kernel.org>, <gregkh@linuxfoundation.org>,
        <mgautam@codeaurora.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, Bixuan Cui <cuibixuan@huawei.com>
Subject: [PATCH] usb: dwc3: qcom: Fixed an issue that the ret value is incorrect in dwc3_qcom_probe()
Date:   Fri, 9 Apr 2021 08:49:45 +0800
Message-ID: <20210409004945.56776-1-cuibixuan@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.28.241]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

There is a error message after devm_ioremap_resource failed, and the ret
is needs to be obtained through PTR_ERR(qcom->qscratch_base).
We need to move the dev_err() downwards to ensure that the ret value is
correct.

Fixes: a4333c3a6ba9 ('usb: dwc3: Add Qualcomm DWC3 glue driver')
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Bixuan Cui <cuibixuan@huawei.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index e37cc58dfa55..4716ca8c753d 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -774,8 +774,8 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 
 	qcom->qscratch_base = devm_ioremap_resource(dev, parent_res);
 	if (IS_ERR(qcom->qscratch_base)) {
-		dev_err(dev, "failed to map qscratch, err=%d\n", ret);
 		ret = PTR_ERR(qcom->qscratch_base);
+		dev_err(dev, "failed to map qscratch, err=%d\n", ret);
 		goto clk_disable;
 	}
 
-- 
2.17.1

