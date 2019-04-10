Return-Path: <SRS0=X9rV=SM=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2EE1C10F14
	for <linux-usb@archiver.kernel.org>; Wed, 10 Apr 2019 06:48:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9B4AB217D6
	for <linux-usb@archiver.kernel.org>; Wed, 10 Apr 2019 06:48:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728643AbfDJGsC (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 10 Apr 2019 02:48:02 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:12013 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726056AbfDJGsB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 Apr 2019 02:48:01 -0400
X-UUID: 8d3b645fbb8a43a89a780aeee688f151-20190410
X-UUID: 8d3b645fbb8a43a89a780aeee688f151-20190410
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 1731274032; Wed, 10 Apr 2019 14:47:45 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 10 Apr 2019 14:47:44 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 10 Apr 2019 14:47:43 +0800
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Mathias Nyman <mathias.nyman@intel.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        Dongjin Kim <tobetter@gmail.com>
Subject: [v2 PATCH 3/6] usb: misc: usb3503: get optional clock by devm_clk_get_optional()
Date:   Wed, 10 Apr 2019 14:47:26 +0800
Message-ID:
 <e24a625adb68a0975636d6d59424c9986657a18d.1554877692.git.chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <bc6cdc2dce698dddbd692ba100fbf08c15c7b023.1554877692.git.chunfeng.yun@mediatek.com>
References: <bc6cdc2dce698dddbd692ba100fbf08c15c7b023.1554877692.git.chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-MTK:  N
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190410064726.OVgNfjfBkz9b-1CCdDegkWKE-v0TEHQgzbtgwSkfkDY@z>

Use devm_clk_get_optional() to get optional clock

Cc: Dongjin Kim <tobetter@gmail.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: no changes
---
 drivers/usb/misc/usb3503.c | 48 ++++++++++++++------------------------
 1 file changed, 18 insertions(+), 30 deletions(-)

diff --git a/drivers/usb/misc/usb3503.c b/drivers/usb/misc/usb3503.c
index d5141aa79dd4..72f39a9751b5 100644
--- a/drivers/usb/misc/usb3503.c
+++ b/drivers/usb/misc/usb3503.c
@@ -172,7 +172,6 @@ static int usb3503_probe(struct usb3503 *hub)
 		hub->gpio_reset		= pdata->gpio_reset;
 		hub->mode		= pdata->initial_mode;
 	} else if (np) {
-		struct clk *clk;
 		u32 rate = 0;
 		hub->port_off_mask = 0;
 
@@ -198,34 +197,29 @@ static int usb3503_probe(struct usb3503 *hub)
 			}
 		}
 
-		clk = devm_clk_get(dev, "refclk");
-		if (IS_ERR(clk) && PTR_ERR(clk) != -ENOENT) {
+		hub->clk = devm_clk_get_optional(dev, "refclk");
+		if (IS_ERR(hub->clk)) {
 			dev_err(dev, "unable to request refclk (%ld)\n",
-					PTR_ERR(clk));
-			return PTR_ERR(clk);
+					PTR_ERR(hub->clk));
+			return PTR_ERR(hub->clk);
 		}
 
-		if (!IS_ERR(clk)) {
-			hub->clk = clk;
-
-			if (rate != 0) {
-				err = clk_set_rate(hub->clk, rate);
-				if (err) {
-					dev_err(dev,
-						"unable to set reference clock rate to %d\n",
-						(int) rate);
-					return err;
-				}
-			}
-
-			err = clk_prepare_enable(hub->clk);
+		if (rate != 0) {
+			err = clk_set_rate(hub->clk, rate);
 			if (err) {
 				dev_err(dev,
-					"unable to enable reference clock\n");
+					"unable to set reference clock rate to %d\n",
+					(int)rate);
 				return err;
 			}
 		}
 
+		err = clk_prepare_enable(hub->clk);
+		if (err) {
+			dev_err(dev, "unable to enable reference clock\n");
+			return err;
+		}
+
 		property = of_get_property(np, "disabled-ports", &len);
 		if (property && (len / sizeof(u32)) > 0) {
 			int i;
@@ -324,8 +318,7 @@ static int usb3503_i2c_remove(struct i2c_client *i2c)
 	struct usb3503 *hub;
 
 	hub = i2c_get_clientdata(i2c);
-	if (hub->clk)
-		clk_disable_unprepare(hub->clk);
+	clk_disable_unprepare(hub->clk);
 
 	return 0;
 }
@@ -348,8 +341,7 @@ static int usb3503_platform_remove(struct platform_device *pdev)
 	struct usb3503 *hub;
 
 	hub = platform_get_drvdata(pdev);
-	if (hub->clk)
-		clk_disable_unprepare(hub->clk);
+	clk_disable_unprepare(hub->clk);
 
 	return 0;
 }
@@ -358,18 +350,14 @@ static int usb3503_platform_remove(struct platform_device *pdev)
 static int usb3503_suspend(struct usb3503 *hub)
 {
 	usb3503_switch_mode(hub, USB3503_MODE_STANDBY);
-
-	if (hub->clk)
-		clk_disable_unprepare(hub->clk);
+	clk_disable_unprepare(hub->clk);
 
 	return 0;
 }
 
 static int usb3503_resume(struct usb3503 *hub)
 {
-	if (hub->clk)
-		clk_prepare_enable(hub->clk);
-
+	clk_prepare_enable(hub->clk);
 	usb3503_switch_mode(hub, hub->mode);
 
 	return 0;
-- 
2.21.0

