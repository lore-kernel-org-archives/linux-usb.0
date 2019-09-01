Return-Path: <SRS0=iTK2=W4=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B624BC3A5A4
	for <linux-usb@archiver.kernel.org>; Sun,  1 Sep 2019 22:27:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8A6D822CF7
	for <linux-usb@archiver.kernel.org>; Sun,  1 Sep 2019 22:27:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729106AbfIAW1F (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 1 Sep 2019 18:27:05 -0400
Received: from muru.com ([72.249.23.125]:59428 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728942AbfIAW1F (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 1 Sep 2019 18:27:05 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id CFAFC80C0;
        Sun,  1 Sep 2019 22:27:32 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Bin Liu <b-liu@ti.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-omap@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>,
        Marcel Partap <mpartap@gmx.net>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Michael Scott <hashcode0f@gmail.com>,
        NeKit <nekit1000@gmail.com>, Pavel Machek <pavel@ucw.cz>,
        Sebastian Reichel <sre@kernel.org>
Subject: [PATCH] usb: musb: omap2430: Idle musb on init
Date:   Sun,  1 Sep 2019 15:27:00 -0700
Message-Id: <20190901222700.36410-1-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

We want to configure musb state in omap2430_musb_enable() instead of
omap2430_musb_init(). Otherwise musb may not idle properly until
USB cable has been connected at least once.

And we already have omap_musb_set_mailbox() configure mode with
omap_control_usb_set_mode() so we can remove those calls from
omap2430_musb_enable().

Cc: Jacopo Mondi <jacopo@jmondi.org>
Cc: Marcel Partap <mpartap@gmx.net>
Cc: Merlijn Wajer <merlijn@wizzup.org>
Cc: Michael Scott <hashcode0f@gmail.com>
Cc: NeKit <nekit1000@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Sebastian Reichel <sre@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/usb/musb/omap2430.c | 20 +++-----------------
 1 file changed, 3 insertions(+), 17 deletions(-)

diff --git a/drivers/usb/musb/omap2430.c b/drivers/usb/musb/omap2430.c
--- a/drivers/usb/musb/omap2430.c
+++ b/drivers/usb/musb/omap2430.c
@@ -211,7 +211,6 @@ static int omap2430_musb_init(struct musb *musb)
 	u32 l;
 	int status = 0;
 	struct device *dev = musb->controller;
-	struct omap2430_glue *glue = dev_get_drvdata(dev->parent);
 	struct musb_hdrc_platform_data *plat = dev_get_platdata(dev);
 	struct omap_musb_board_data *data = plat->board_data;
 
@@ -267,9 +266,6 @@ static int omap2430_musb_init(struct musb *musb)
 			musb_readl(musb->mregs, OTG_INTERFSEL),
 			musb_readl(musb->mregs, OTG_SIMENABLE));
 
-	if (glue->status != MUSB_UNKNOWN)
-		omap_musb_set_mailbox(glue);
-
 	return 0;
 }
 
@@ -278,19 +274,9 @@ static void omap2430_musb_enable(struct musb *musb)
 	struct device *dev = musb->controller;
 	struct omap2430_glue *glue = dev_get_drvdata(dev->parent);
 
-	switch (glue->status) {
-
-	case MUSB_ID_GROUND:
-		omap_control_usb_set_mode(glue->control_otghs, USB_MODE_HOST);
-		break;
-
-	case MUSB_VBUS_VALID:
-		omap_control_usb_set_mode(glue->control_otghs, USB_MODE_DEVICE);
-		break;
-
-	default:
-		break;
-	}
+	if (glue->status == MUSB_UNKNOWN)
+		glue->status = MUSB_VBUS_OFF;
+	omap_musb_set_mailbox(glue);
 }
 
 static void omap2430_musb_disable(struct musb *musb)
-- 
2.23.0
