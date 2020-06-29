Return-Path: <SRS0=jI6n=AK=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5FF4C433E1
	for <linux-usb@archiver.kernel.org>; Mon, 29 Jun 2020 19:18:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D6C4B206E2
	for <linux-usb@archiver.kernel.org>; Mon, 29 Jun 2020 19:18:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731959AbgF2TRz (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 29 Jun 2020 15:17:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731962AbgF2TRo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 Jun 2020 15:17:44 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F018AC02A563
        for <linux-usb@vger.kernel.org>; Mon, 29 Jun 2020 06:22:10 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1jptjd-0005C7-Hs; Mon, 29 Jun 2020 15:22:09 +0200
Received: from mgr by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1jptjc-0001HS-8u; Mon, 29 Jun 2020 15:22:08 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     Thinh.Nguyen@synopsys.com, balbi@kernel.org,
        gregkh@linuxfoundation.org, kernel@pengutronix.de
Subject: [PATCH v3 2/2] usb: dwc3: gadget: when the started list is empty stop the active xfer
Date:   Mon, 29 Jun 2020 15:22:06 +0200
Message-Id: <20200629132206.3914-3-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200629132206.3914-1-m.grzeschik@pengutronix.de>
References: <20200629132206.3914-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When we have nothing left to be queued after handling the last trb
we have to stop the current transfer. This way we can ensure that
the next request will be queued with an new and valid timestamp
and will not directly run into an missed xfer.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

---
v1 -> v2: - This Patch replaces the following patch by Michael Olbrich:
            usb: dwc3: gadget: restart the transfer if a isoc request is queued too late
v2 -> v3: - rearranged condition for easier read (suggested by Tinh Nguyen)

 drivers/usb/dwc3/gadget.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 7ad85a7d06f70bf..2e15878aa8ae781 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2735,7 +2735,9 @@ static bool dwc3_gadget_endpoint_trbs_complete(struct dwc3_ep *dep,
 	if (dep->flags & DWC3_EP_END_TRANSFER_PENDING)
 		goto out;
 
-	if (status == -EXDEV && list_empty(&dep->started_list))
+	if (usb_endpoint_xfer_isoc(dep->endpoint.desc) &&
+		list_empty(&dep->started_list) &&
+		(list_empty(&dep->pending_list) || status == -EXDEV))
 		dwc3_stop_active_transfer(dep, true, true);
 	else if (dwc3_gadget_ep_should_continue(dep))
 		if (__dwc3_gadget_kick_transfer(dep) == 0)
-- 
2.27.0

