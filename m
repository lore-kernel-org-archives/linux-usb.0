Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5212C433EF
	for <linux-usb@archiver.kernel.org>; Wed, 20 Jul 2022 21:51:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229670AbiGTVvT (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 20 Jul 2022 17:51:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbiGTVvS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 20 Jul 2022 17:51:18 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40E3042AC6
        for <linux-usb@vger.kernel.org>; Wed, 20 Jul 2022 14:51:17 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1oEHb9-0004FX-M3; Wed, 20 Jul 2022 23:51:15 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1oEHb8-002Bvr-S2; Wed, 20 Jul 2022 23:51:14 +0200
Received: from mgr by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1oEHb8-004RKs-8Z; Wed, 20 Jul 2022 23:51:14 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org, kernel@pengutronix.de
Subject: [PATCH 1/2] usb: dwc3: debug: show events parameters in hex
Date:   Wed, 20 Jul 2022 23:51:12 +0200
Message-Id: <20220720215113.1058313-1-m.grzeschik@pengutronix.de>
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

Printing the event parameters in decimal is not useful.
Print them in hex and make it more practical.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
---
 drivers/usb/dwc3/debug.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/debug.h b/drivers/usb/dwc3/debug.h
index d223c54115f4a1..48b44b88dc2529 100644
--- a/drivers/usb/dwc3/debug.h
+++ b/drivers/usb/dwc3/debug.h
@@ -278,7 +278,7 @@ static inline const char *dwc3_ep_event_string(char *str, size_t size,
 		break;
 	case DWC3_DEPEVT_XFERINPROGRESS:
 		scnprintf(str + len, size - len,
-				"Transfer In Progress [%d] (%c%c%c)",
+				"Transfer In Progress [%08x] (%c%c%c)",
 				event->parameters,
 				status & DEPEVT_STATUS_SHORT ? 'S' : 's',
 				status & DEPEVT_STATUS_IOC ? 'I' : 'i',
@@ -286,7 +286,7 @@ static inline const char *dwc3_ep_event_string(char *str, size_t size,
 		break;
 	case DWC3_DEPEVT_XFERNOTREADY:
 		len += scnprintf(str + len, size - len,
-				"Transfer Not Ready [%d]%s",
+				"Transfer Not Ready [%08x]%s",
 				event->parameters,
 				status & DEPEVT_STATUS_TRANSFER_ACTIVE ?
 				" (Active)" : " (Not Active)");
-- 
2.30.2

