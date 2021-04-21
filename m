Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B25F9C43470
	for <linux-usb@archiver.kernel.org>; Wed, 21 Apr 2021 20:48:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 295E96144D
	for <linux-usb@archiver.kernel.org>; Wed, 21 Apr 2021 20:48:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245696AbhDUUtV (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 21 Apr 2021 16:49:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245692AbhDUUtU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Apr 2021 16:49:20 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05141C06138B
        for <linux-usb@vger.kernel.org>; Wed, 21 Apr 2021 13:48:46 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1lZJm8-000541-N4; Wed, 21 Apr 2021 22:48:44 +0200
Received: from mgr by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1lZJm8-00017y-ED; Wed, 21 Apr 2021 22:48:44 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, Thinh.Nguyen@synopsys.com, kernel@pengutronix.de
Subject: [PATCH 1/2] dwc3: gadget: fix setting of pending_sgs
Date:   Wed, 21 Apr 2021 22:48:36 +0200
Message-Id: <20210421204837.4185-2-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210421204837.4185-1-m.grzeschik@pengutronix.de>
References: <20210421204837.4185-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In the dwc3_prepare_trbs_sg routine, when all data from request was
handled pending_sgs should be set to the number of mapped sgs that are
not queued up.

Currently the code will result in pending_sgs == queued_sgs. That
variables value will likely not be zero and break dwc3_prepare_trbs.

This patch fixes the setting of the variable to its intended purpose.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
---
 drivers/usb/dwc3/gadget.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 6227641f2d318..118b5bcc565d6 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -1242,7 +1242,7 @@ static int dwc3_prepare_trbs_sg(struct dwc3_ep *dep,
 		 * don't include unused SG entries.
 		 */
 		if (length == 0) {
-			req->num_pending_sgs -= req->request.num_mapped_sgs - req->num_queued_sgs;
+			req->num_pending_sgs = req->request.num_mapped_sgs - req->num_queued_sgs;
 			break;
 		}
 
-- 
2.29.2

