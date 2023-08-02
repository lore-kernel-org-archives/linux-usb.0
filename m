Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ADB2EB64DD
	for <linux-usb@archiver.kernel.org>; Wed,  2 Aug 2023 03:13:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229485AbjHBDNW (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 1 Aug 2023 23:13:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232123AbjHBDNR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Aug 2023 23:13:17 -0400
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66DD3E53
        for <linux-usb@vger.kernel.org>; Tue,  1 Aug 2023 20:13:16 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.57])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4RFxn41G08zLnvv;
        Wed,  2 Aug 2023 11:10:32 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 2 Aug
 2023 11:13:13 +0800
From:   Ruan Jinjie <ruanjinjie@huawei.com>
To:     <stern@rowland.harvard.edu>, <gregkh@linuxfoundation.org>,
        <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <claudiu.beznea@tuxon.dev>, <justin.chen@broadcom.com>,
        <alcooperx@gmail.com>, <bcm-kernel-feedback-list@broadcom.com>,
        <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC:     <ruanjinjie@huawei.com>
Subject: [PATCH -next] usb: host: Do not check for 0 return after calling platform_get_irq()
Date:   Wed, 2 Aug 2023 11:12:36 +0800
Message-ID: <20230802031236.2272196-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

It is not possible for platform_get_irq() to return 0. Use the
return value from platform_get_irq().

Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
---
 drivers/usb/host/ehci-atmel.c | 4 ++--
 drivers/usb/host/ehci-brcm.c  | 4 ++--
 drivers/usb/host/ehci-orion.c | 4 ++--
 drivers/usb/host/ehci-sh.c    | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/host/ehci-atmel.c b/drivers/usb/host/ehci-atmel.c
index 61808c51e702..6ee08476afd9 100644
--- a/drivers/usb/host/ehci-atmel.c
+++ b/drivers/usb/host/ehci-atmel.c
@@ -102,8 +102,8 @@ static int ehci_atmel_drv_probe(struct platform_device *pdev)
 	pr_debug("Initializing Atmel-SoC USB Host Controller\n");
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq <= 0) {
-		retval = -ENODEV;
+	if (irq < 0) {
+		retval = irq;
 		goto fail_create_hcd;
 	}
 
diff --git a/drivers/usb/host/ehci-brcm.c b/drivers/usb/host/ehci-brcm.c
index 0362a082abb4..77e42c739c58 100644
--- a/drivers/usb/host/ehci-brcm.c
+++ b/drivers/usb/host/ehci-brcm.c
@@ -140,8 +140,8 @@ static int ehci_brcm_probe(struct platform_device *pdev)
 		return err;
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq <= 0)
-		return irq ? irq : -EINVAL;
+	if (irq < 0)
+		return irq;
 
 	/* Hook the hub control routine to work around a bug */
 	ehci_brcm_hc_driver.hub_control = ehci_brcm_hub_control;
diff --git a/drivers/usb/host/ehci-orion.c b/drivers/usb/host/ehci-orion.c
index 2cfb27dc943a..a4663351ba26 100644
--- a/drivers/usb/host/ehci-orion.c
+++ b/drivers/usb/host/ehci-orion.c
@@ -220,8 +220,8 @@ static int ehci_orion_drv_probe(struct platform_device *pdev)
 	pr_debug("Initializing Orion-SoC USB Host Controller\n");
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq <= 0) {
-		err = -ENODEV;
+	if (irq < 0) {
+		err = irq;
 		goto err;
 	}
 
diff --git a/drivers/usb/host/ehci-sh.c b/drivers/usb/host/ehci-sh.c
index 0520e762801d..f982c236e187 100644
--- a/drivers/usb/host/ehci-sh.c
+++ b/drivers/usb/host/ehci-sh.c
@@ -82,8 +82,8 @@ static int ehci_hcd_sh_probe(struct platform_device *pdev)
 		return -ENODEV;
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq <= 0) {
-		ret = -ENODEV;
+	if (irq < 0) {
+		ret = irq;
 		goto fail_create_hcd;
 	}
 
-- 
2.34.1

