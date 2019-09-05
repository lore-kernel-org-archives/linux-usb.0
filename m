Return-Path: <SRS0=KboW=XA=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94E99C3A5A5
	for <linux-usb@archiver.kernel.org>; Thu,  5 Sep 2019 09:57:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 72C7121883
	for <linux-usb@archiver.kernel.org>; Thu,  5 Sep 2019 09:57:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387663AbfIEJ5o (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 5 Sep 2019 05:57:44 -0400
Received: from mail.sysgo.com ([176.9.12.79]:49524 "EHLO mail.sysgo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732586AbfIEJ5n (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 5 Sep 2019 05:57:43 -0400
X-Greylist: delayed 335 seconds by postgrey-1.27 at vger.kernel.org; Thu, 05 Sep 2019 05:57:43 EDT
From:   Roman Kapl <rka@sysgo.com>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>, Roman Kapl <rka@sysgo.com>
Subject: [PATCH] usb: dwc3: reset the address and run_stop on init
Date:   Thu,  5 Sep 2019 11:51:51 +0200
Message-Id: <20190905095151.26590-1-rka@sysgo.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The address should be set to zero during reset according to the
documentation. Clearing RunStop ensures that the host disconnects from
the device (it was not cleared by CSFTRST, at least on ls1043).

This allows the dwc3 to properly initialize even if the previous
driver did not shutdown the device (e.g. when using virtualization).

Signed-off-by: Roman Kapl <rka@sysgo.com>
---
 drivers/usb/dwc3/core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index c9bb93a2c81e..c633f5e0621d 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -250,6 +250,7 @@ static int dwc3_core_soft_reset(struct dwc3 *dwc)
 
 	reg = dwc3_readl(dwc->regs, DWC3_DCTL);
 	reg |= DWC3_DCTL_CSFTRST;
+	reg &= ~DWC3_DCTL_RUN_STOP;
 	dwc3_writel(dwc->regs, DWC3_DCTL, reg);
 
 	do {
@@ -266,6 +267,10 @@ static int dwc3_core_soft_reset(struct dwc3 *dwc)
 	return -ETIMEDOUT;
 
 done:
+	reg = dwc3_readl(dwc->regs, DWC3_DCFG);
+	reg &= ~(DWC3_DCFG_DEVADDR_MASK);
+	dwc3_writel(dwc->regs, DWC3_DCFG, reg);
+
 	/*
 	 * For DWC_usb31 controller, once DWC3_DCTL_CSFTRST bit is cleared,
 	 * we must wait at least 50ms before accessing the PHY domain
-- 
2.22.0

