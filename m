Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAC80C433F5
	for <linux-usb@archiver.kernel.org>; Sun,  6 Mar 2022 21:13:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234082AbiCFVN5 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 6 Mar 2022 16:13:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234210AbiCFVN4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 6 Mar 2022 16:13:56 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B0381009
        for <linux-usb@vger.kernel.org>; Sun,  6 Mar 2022 13:13:00 -0800 (PST)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1nQyBW-0000Ns-Ea; Sun, 06 Mar 2022 22:12:58 +0100
Received: from mgr by dude.hi.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1nQyBQ-009ZVG-Pv; Sun, 06 Mar 2022 22:12:52 +0100
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org,
        kernel@pengutronix.de, Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [RESEND v3 1/2] usb: dwc3: gadget: ep_queue simplify isoc start condition
Date:   Sun,  6 Mar 2022 22:12:50 +0100
Message-Id: <20220306211251.2281335-2-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220306211251.2281335-1-m.grzeschik@pengutronix.de>
References: <20220306211251.2281335-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

To improve reading the code this patch moves the cases to start_isoc or
return the function under one common condition check.

Reviewed-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

---
v1 -> v3: added reviewed by, no further changes

 drivers/usb/dwc3/gadget.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index a0c883f19a417c..37dbf6132731b7 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -1913,13 +1913,11 @@ static int __dwc3_gadget_ep_queue(struct dwc3_ep *dep, struct dwc3_request *req)
 	 * errors which will force us issue EndTransfer command.
 	 */
 	if (usb_endpoint_xfer_isoc(dep->endpoint.desc)) {
-		if (!(dep->flags & DWC3_EP_PENDING_REQUEST) &&
-				!(dep->flags & DWC3_EP_TRANSFER_STARTED))
-			return 0;
-
-		if ((dep->flags & DWC3_EP_PENDING_REQUEST)) {
-			if (!(dep->flags & DWC3_EP_TRANSFER_STARTED))
+		if (!(dep->flags & DWC3_EP_TRANSFER_STARTED)) {
+			if ((dep->flags & DWC3_EP_PENDING_REQUEST))
 				return __dwc3_gadget_start_isoc(dep);
+
+			return 0;
 		}
 	}
 
-- 
2.30.2

