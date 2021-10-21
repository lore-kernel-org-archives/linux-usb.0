Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39573C433F5
	for <linux-usb@archiver.kernel.org>; Thu, 21 Oct 2021 19:14:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 25DB9610A1
	for <linux-usb@archiver.kernel.org>; Thu, 21 Oct 2021 19:14:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231800AbhJUTRC (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 21 Oct 2021 15:17:02 -0400
Received: from mxout02.lancloud.ru ([45.84.86.82]:36220 "EHLO
        mxout02.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230267AbhJUTRA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 21 Oct 2021 15:17:00 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout02.lancloud.ru A03C920998CA
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>
CC:     Sergey Shtylyov <s.shtylyov@omprussia.ru>
Subject: [PATCH 07/10] usb: host: ohci-da8xx: fix deferred probing
Date:   Thu, 21 Oct 2021 22:14:34 +0300
Message-ID: <20211021191437.8737-8-s.shtylyov@omp.ru>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20211021191437.8737-1-s.shtylyov@omp.ru>
References: <20211021191437.8737-1-s.shtylyov@omp.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Sergey Shtylyov <s.shtylyov@omprussia.ru>

The driver overrides the error codes returned by platform_get_irq() to
-ENODEV for some strange reason, so if it returns -EPROBE_DEFER, the driver
will fail the probe permanently instead of the deferred probing. Switch to
propagating the error codes upstream.

Fixes: efe7daf2231a ("USB: OHCI: DA8xx/OMAP-L1x glue layer")
Signed-off-by: Sergey Shtylyov <s.shtylyov@omprussia.ru>
Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
---
 drivers/usb/host/ohci-da8xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/ohci-da8xx.c b/drivers/usb/host/ohci-da8xx.c
index 6d08ab2bf163..8eceb6a92fe9 100644
--- a/drivers/usb/host/ohci-da8xx.c
+++ b/drivers/usb/host/ohci-da8xx.c
@@ -446,7 +446,7 @@ static int ohci_da8xx_probe(struct platform_device *pdev)
 
 	hcd_irq = platform_get_irq(pdev, 0);
 	if (hcd_irq < 0) {
-		error = -ENODEV;
+		error = hcd_irq;
 		goto err;
 	}
 	if (!hcd_irq) {
-- 
2.26.3

