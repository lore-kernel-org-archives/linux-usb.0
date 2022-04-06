Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDCE5C433F5
	for <linux-usb@archiver.kernel.org>; Wed,  6 Apr 2022 20:59:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234492AbiDFVBT (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 6 Apr 2022 17:01:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235120AbiDFVBI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 6 Apr 2022 17:01:08 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD3DAE1277
        for <linux-usb@vger.kernel.org>; Wed,  6 Apr 2022 12:29:20 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1ncBLC-00022D-1f; Wed, 06 Apr 2022 21:29:18 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1ncBLC-001TPU-IR; Wed, 06 Apr 2022 21:29:17 +0200
Received: from mgr by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1ncBL9-00DrTf-OK; Wed, 06 Apr 2022 21:29:15 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org
Subject: [PATCH] usb: gadget: f_acm: add support for USB_CDC_REQ_SEND_BREAK
Date:   Wed,  6 Apr 2022 21:29:14 +0200
Message-Id: <20220406192914.3302636-1-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Currently the usb side setting of the USB_CDC_REQ_SEND_BREAK control
is not supported. This patch adds the support.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
---
 drivers/usb/gadget/function/f_acm.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/usb/gadget/function/f_acm.c b/drivers/usb/gadget/function/f_acm.c
index 349945e064bba3..411eb489e0ff11 100644
--- a/drivers/usb/gadget/function/f_acm.c
+++ b/drivers/usb/gadget/function/f_acm.c
@@ -333,6 +333,8 @@ static void acm_complete_set_line_coding(struct usb_ep *ep,
 	}
 }
 
+static int acm_send_break(struct gserial *port, int duration);
+
 static int acm_setup(struct usb_function *f, const struct usb_ctrlrequest *ctrl)
 {
 	struct f_acm		*acm = func_to_acm(f);
@@ -391,6 +393,14 @@ static int acm_setup(struct usb_function *f, const struct usb_ctrlrequest *ctrl)
 		acm->port_handshake_bits = w_value;
 		break;
 
+	case ((USB_DIR_OUT | USB_TYPE_CLASS | USB_RECIP_INTERFACE) << 8)
+			| USB_CDC_REQ_SEND_BREAK:
+		if (w_index != acm->ctrl_id)
+			goto invalid;
+
+		acm_send_break(&acm->port, w_value);
+		break;
+
 	default:
 invalid:
 		dev_vdbg(&cdev->gadget->dev,
-- 
2.30.2

