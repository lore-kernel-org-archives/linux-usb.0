Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A91BCC433F5
	for <linux-usb@archiver.kernel.org>; Mon,  4 Apr 2022 08:49:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240715AbiDDIvf (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 4 Apr 2022 04:51:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236395AbiDDIva (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 4 Apr 2022 04:51:30 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5F2F1EAC4
        for <linux-usb@vger.kernel.org>; Mon,  4 Apr 2022 01:49:34 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1nbIOz-0004pL-2E; Mon, 04 Apr 2022 10:49:33 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1nanKw-000dEy-KQ; Sun, 03 Apr 2022 01:39:17 +0200
Received: from mgr by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1nanKu-00FD9e-Au; Sun, 03 Apr 2022 01:39:16 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, laurent.pinchart@ideasonboard.com,
        paul.elder@ideasonboard.com, kernel@pengutronix.de,
        nicolas@ndufresne.ca, kieran.bingham@ideasonboard.com
Subject: [PATCH 5/5] usb: gadget: uvc: stop the pump on more conditions
Date:   Sun,  3 Apr 2022 01:39:14 +0200
Message-Id: <20220402233914.3625405-6-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220402233914.3625405-1-m.grzeschik@pengutronix.de>
References: <20220402233914.3625405-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

While looping in the pump, there are more conditions to stop handling
requests. The streamoff event that will disable the endpoint and
the vb2_queue is called early. We add the variables into account.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
---
 drivers/usb/gadget/function/uvc_video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
index 8b3116d48d2bd8..b1d7083d07846e 100644
--- a/drivers/usb/gadget/function/uvc_video.c
+++ b/drivers/usb/gadget/function/uvc_video.c
@@ -368,7 +368,7 @@ static void uvcg_video_pump(struct work_struct *work)
 	unsigned long flags;
 	int ret;
 
-	while (video->ep->enabled) {
+	while (video->ep->enabled || queue->queue.streaming || video->uvc->streamon) {
 		/* Retrieve the first available USB request, protected by the
 		 * request lock.
 		 */
-- 
2.30.2

