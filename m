Return-Path: <SRS0=/GjO=VD=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50E97C468AA
	for <linux-usb@archiver.kernel.org>; Sat,  6 Jul 2019 00:41:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 33939216B7
	for <linux-usb@archiver.kernel.org>; Sat,  6 Jul 2019 00:41:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725917AbfGFAl6 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 5 Jul 2019 20:41:58 -0400
Received: from gate.crashing.org ([63.228.1.57]:41097 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725813AbfGFAl6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 5 Jul 2019 20:41:58 -0400
Received: from ufdda393ec48b57.ant.amazon.com (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x660fZFV017659;
        Fri, 5 Jul 2019 19:41:36 -0500
From:   Benjamin Herrenschmidt <benh@kernel.crashing.org>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, Alan Stern <stern@rowland.harvard.edu>,
        EJ Hsu <ejh@nvidia.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        WK Tsai <wtsai@nvidia.com>,
        =?UTF-8?q?Micha=C5=82=20Nazarewicz?= <mina86@mina86.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH v2 1/2] usb: gadget: composite: Clear "suspended" on reset/disconnect
Date:   Sat,  6 Jul 2019 10:41:34 +1000
Message-Id: <20190706004135.14955-1-benh@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In some cases, one can get out of suspend with a reset or
a disconnect followed by a reconnect. Previously we would
leave a stale suspended flag set.

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 drivers/usb/gadget/composite.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
index b8a15840b4ff..dfcabadeed01 100644
--- a/drivers/usb/gadget/composite.c
+++ b/drivers/usb/gadget/composite.c
@@ -1976,6 +1976,7 @@ void composite_disconnect(struct usb_gadget *gadget)
 	 * disconnect callbacks?
 	 */
 	spin_lock_irqsave(&cdev->lock, flags);
+	cdev->suspended = 0;
 	if (cdev->config)
 		reset_config(cdev);
 	if (cdev->driver->disconnect)
-- 
2.17.1

