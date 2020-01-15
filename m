Return-Path: <SRS0=3jNv=3E=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17C2CC33CB1
	for <linux-usb@archiver.kernel.org>; Wed, 15 Jan 2020 13:25:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E0A6B2084D
	for <linux-usb@archiver.kernel.org>; Wed, 15 Jan 2020 13:25:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="HSZLr53Q"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729077AbgAONZy (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 15 Jan 2020 08:25:54 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:53868 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728904AbgAONZw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jan 2020 08:25:52 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00FDPolr073267;
        Wed, 15 Jan 2020 07:25:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1579094750;
        bh=YVFdkc5lkW+O80b4FQmhNiJEra5Z05Aen0FpFrdx/RU=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=HSZLr53QwX2/JdE9jAuErkEVUeebSz3d/aABTM4b47BKIHAKdfTi+0dEJ7DAfb0JV
         Ka/GyvvhfCZL4Sk6VcPQN3aTFWZwiOCoxrcXZ3iS8+iwsukpVNDaCuGQX7ztcL4TYr
         rDnZbz3u20EefFZrDgJJJHIG9X34wMg4HX/dKFeA=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00FDPo7t019854
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 15 Jan 2020 07:25:50 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 15
 Jan 2020 07:25:50 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 15 Jan 2020 07:25:49 -0600
Received: from uda0271908.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00FDPm3N066537;
        Wed, 15 Jan 2020 07:25:49 -0600
From:   Bin Liu <b-liu@ti.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Bin Liu <b-liu@ti.com>
Subject: [PATCH 25/25] usb: musb: remove dummy driver musb_am335x.c
Date:   Wed, 15 Jan 2020 07:25:47 -0600
Message-ID: <20200115132547.364-26-b-liu@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200115132547.364-1-b-liu@ti.com>
References: <20200115132547.364-1-b-liu@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Since commit 0782e8572ce4 ("ARM: dts: Probe am335x musb with ti-sysc"),
the dummy driver musb_am335x.c is no longer needed, let's drop it.

Acked-by: Tony Lindgren <tony@atomide.com>
Signed-off-by: Bin Liu <b-liu@ti.com>
---
 drivers/usb/musb/Kconfig       |  4 ----
 drivers/usb/musb/Makefile      |  3 ---
 drivers/usb/musb/musb_am335x.c | 44 ----------------------------------
 3 files changed, 51 deletions(-)
 delete mode 100644 drivers/usb/musb/musb_am335x.c

diff --git a/drivers/usb/musb/Kconfig b/drivers/usb/musb/Kconfig
index 63376d494f0f..eb2ded1026ee 100644
--- a/drivers/usb/musb/Kconfig
+++ b/drivers/usb/musb/Kconfig
@@ -101,7 +101,6 @@ config USB_MUSB_AM35X
 
 config USB_MUSB_DSPS
 	tristate "TI DSPS platforms"
-	select USB_MUSB_AM335X_CHILD
 	depends on ARCH_OMAP2PLUS || COMPILE_TEST
 	depends on OF_IRQ
 
@@ -122,9 +121,6 @@ config USB_MUSB_MEDIATEK
 	depends on GENERIC_PHY
 	select USB_ROLE_SWITCH
 
-config USB_MUSB_AM335X_CHILD
-	tristate
-
 comment "MUSB DMA mode"
 
 config MUSB_PIO_ONLY
diff --git a/drivers/usb/musb/Makefile b/drivers/usb/musb/Makefile
index 63d82d0fab67..932247360a9f 100644
--- a/drivers/usb/musb/Makefile
+++ b/drivers/usb/musb/Makefile
@@ -26,9 +26,6 @@ obj-$(CONFIG_USB_MUSB_JZ4740)			+= jz4740.o
 obj-$(CONFIG_USB_MUSB_SUNXI)			+= sunxi.o
 obj-$(CONFIG_USB_MUSB_MEDIATEK)      		+= mediatek.o
 
-
-obj-$(CONFIG_USB_MUSB_AM335X_CHILD)		+= musb_am335x.o
-
 # the kconfig must guarantee that only one of the
 # possible I/O schemes will be enabled at a time ...
 # PIO only, or DMA (several potential schemes).
diff --git a/drivers/usb/musb/musb_am335x.c b/drivers/usb/musb/musb_am335x.c
deleted file mode 100644
index 5f04f8e3a640..000000000000
--- a/drivers/usb/musb/musb_am335x.c
+++ /dev/null
@@ -1,44 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-#include <linux/platform_device.h>
-#include <linux/pm_runtime.h>
-#include <linux/module.h>
-#include <linux/of_platform.h>
-
-static int am335x_child_probe(struct platform_device *pdev)
-{
-	int ret;
-
-	pm_runtime_enable(&pdev->dev);
-
-	ret = of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
-	if (ret)
-		goto err;
-
-	return 0;
-err:
-	pm_runtime_disable(&pdev->dev);
-	return ret;
-}
-
-static const struct of_device_id am335x_child_of_match[] = {
-	{ .compatible = "ti,am33xx-usb" },
-	{  },
-};
-MODULE_DEVICE_TABLE(of, am335x_child_of_match);
-
-static struct platform_driver am335x_child_driver = {
-	.probe		= am335x_child_probe,
-	.driver         = {
-		.name   = "am335x-usb-childs",
-		.of_match_table	= am335x_child_of_match,
-	},
-};
-
-static int __init am335x_child_init(void)
-{
-	return platform_driver_register(&am335x_child_driver);
-}
-module_init(am335x_child_init);
-
-MODULE_DESCRIPTION("AM33xx child devices");
-MODULE_LICENSE("GPL v2");
-- 
2.17.1

