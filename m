Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72A55C4167B
	for <linux-usb@archiver.kernel.org>; Thu, 10 Dec 2020 13:35:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 413B123BAB
	for <linux-usb@archiver.kernel.org>; Thu, 10 Dec 2020 13:35:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389373AbgLJNei (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 10 Dec 2020 08:34:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:42192 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389402AbgLJNeg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 10 Dec 2020 08:34:36 -0500
From:   Peter Chen <peter.chen@kernel.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     pawell@cadence.com, rogerq@ti.com
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, a-govindraju@ti.com,
        frank.li@nxp.com, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 1/1] usb: cdns3: imx: improve driver .remove API
Date:   Thu, 10 Dec 2020 21:33:21 +0800
Message-Id: <20201210133321.20328-1-peter.chen@kernel.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Peter Chen <peter.chen@nxp.com>

Keep the runtime active during the remove operation, and disable
related clocks.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/cdns3/cdns3-imx.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/cdns3/cdns3-imx.c b/drivers/usb/cdns3/cdns3-imx.c
index ca8e2ad2913a..f03562c76a50 100644
--- a/drivers/usb/cdns3/cdns3-imx.c
+++ b/drivers/usb/cdns3/cdns3-imx.c
@@ -221,8 +221,13 @@ static int cdns_imx_probe(struct platform_device *pdev)
 static int cdns_imx_remove(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	struct cdns_imx *data = dev_get_drvdata(dev);
 
+	pm_runtime_get_sync(dev);
 	of_platform_depopulate(dev);
+	clk_bulk_disable_unprepare(data->num_clks, data->clks);
+	pm_runtime_disable(dev);
+	pm_runtime_put_noidle(dev);
 	platform_set_drvdata(pdev, NULL);
 
 	return 0;
-- 
2.17.1

