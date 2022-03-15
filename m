Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66AFCC433F5
	for <linux-usb@archiver.kernel.org>; Tue, 15 Mar 2022 14:34:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349295AbiCOOfW (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 15 Mar 2022 10:35:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349244AbiCOOfN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Mar 2022 10:35:13 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5824738180
        for <linux-usb@vger.kernel.org>; Tue, 15 Mar 2022 07:34:01 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1nU8FL-0004wn-H1; Tue, 15 Mar 2022 15:33:59 +0100
Received: from mgr by dude.hi.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1nU8FK-00GRow-KK; Tue, 15 Mar 2022 15:33:58 +0100
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, laurent.pinchart@ideasonboard.com,
        paul.elder@ideasonboard.com, kernel@pengutronix.de,
        nicolas@ndufresne.ca, kieran.bingham@ideasonboard.com
Subject: [PATCH v7 3/7] usb: gadget: uvc: prevent index variables to start from 0
Date:   Tue, 15 Mar 2022 15:33:52 +0100
Message-Id: <20220315143356.3919911-4-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220315143356.3919911-1-m.grzeschik@pengutronix.de>
References: <20220315143356.3919911-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Some configfs variables like bDefaultFrameIndex are always starting by
1. This patch adds a check to prevent setting those variables to 0.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

---
v1 -> v7: -

 drivers/usb/gadget/function/uvc_configfs.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
index 77d64031aa9c2a..b6bb5706299951 100644
--- a/drivers/usb/gadget/function/uvc_configfs.c
+++ b/drivers/usb/gadget/function/uvc_configfs.c
@@ -1565,6 +1565,12 @@ uvcg_uncompressed_##cname##_store(struct config_item *item,		\
 	if (ret)							\
 		goto end;						\
 									\
+	/* index values in uvc are never 0 */				\
+	if (!num) {							\
+		ret = -EINVAL;						\
+		goto end;						\
+	}								\
+									\
 	u->desc.aname = num;						\
 	ret = len;							\
 end:									\
@@ -1758,6 +1764,12 @@ uvcg_mjpeg_##cname##_store(struct config_item *item,			\
 	if (ret)							\
 		goto end;						\
 									\
+	/* index values in uvc are never 0 */				\
+	if (!num) {							\
+		ret = -EINVAL;						\
+		goto end;						\
+	}								\
+									\
 	u->desc.aname = num;						\
 	ret = len;							\
 end:									\
-- 
2.30.2

