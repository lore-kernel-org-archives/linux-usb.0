Return-Path: <SRS0=zRYX=EC=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59802C388F9
	for <linux-usb@archiver.kernel.org>; Tue, 27 Oct 2020 16:43:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 154C421D24
	for <linux-usb@archiver.kernel.org>; Tue, 27 Oct 2020 16:43:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1811862AbgJ0Qm5 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 27 Oct 2020 12:42:57 -0400
Received: from aposti.net ([89.234.176.197]:47556 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1811848AbgJ0Qmy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 27 Oct 2020 12:42:54 -0400
From:   Paul Cercueil <paul@crapouillou.net>
To:     Bin Liu <b-liu@ti.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Tony Lindgren <tony@atomide.com>, od@zcrc.me,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>
Subject: [RESEND PATCH 4/4] musb: jz4740: Add missing CR to error strings
Date:   Tue, 27 Oct 2020 16:42:00 +0000
Message-Id: <20201027164200.18602-5-paul@crapouillou.net>
In-Reply-To: <20201027164200.18602-1-paul@crapouillou.net>
References: <20201027164200.18602-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If you pass a string that is not terminated with a carriage return to
dev_err(), it will eventually be printed with a carriage return, but
not right away, since the kernel will wait for a pr_cont().

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/usb/musb/jz4740.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/musb/jz4740.c b/drivers/usb/musb/jz4740.c
index c4fe1f4cd17a..50afc3b94a37 100644
--- a/drivers/usb/musb/jz4740.c
+++ b/drivers/usb/musb/jz4740.c
@@ -205,26 +205,26 @@ static int jz4740_probe(struct platform_device *pdev)
 
 	pdata = of_device_get_match_data(dev);
 	if (!pdata) {
-		dev_err(dev, "missing platform data");
+		dev_err(dev, "missing platform data\n");
 		return -EINVAL;
 	}
 
 	musb = platform_device_alloc("musb-hdrc", PLATFORM_DEVID_AUTO);
 	if (!musb) {
-		dev_err(dev, "failed to allocate musb device");
+		dev_err(dev, "failed to allocate musb device\n");
 		return -ENOMEM;
 	}
 
 	clk = devm_clk_get(dev, "udc");
 	if (IS_ERR(clk)) {
-		dev_err(dev, "failed to get clock");
+		dev_err(dev, "failed to get clock\n");
 		ret = PTR_ERR(clk);
 		goto err_platform_device_put;
 	}
 
 	ret = clk_prepare_enable(clk);
 	if (ret) {
-		dev_err(dev, "failed to enable clock");
+		dev_err(dev, "failed to enable clock\n");
 		goto err_platform_device_put;
 	}
 
@@ -240,19 +240,19 @@ static int jz4740_probe(struct platform_device *pdev)
 	ret = platform_device_add_resources(musb, pdev->resource,
 					    pdev->num_resources);
 	if (ret) {
-		dev_err(dev, "failed to add resources");
+		dev_err(dev, "failed to add resources\n");
 		goto err_clk_disable;
 	}
 
 	ret = platform_device_add_data(musb, pdata, sizeof(*pdata));
 	if (ret) {
-		dev_err(dev, "failed to add platform_data");
+		dev_err(dev, "failed to add platform_data\n");
 		goto err_clk_disable;
 	}
 
 	ret = platform_device_add(musb);
 	if (ret) {
-		dev_err(dev, "failed to register musb device");
+		dev_err(dev, "failed to register musb device\n");
 		goto err_clk_disable;
 	}
 
-- 
2.28.0

