Return-Path: <SRS0=0aa0=ZS=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F33EC432C3
	for <linux-usb@archiver.kernel.org>; Tue, 26 Nov 2019 03:43:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 27F312071E
	for <linux-usb@archiver.kernel.org>; Tue, 26 Nov 2019 03:43:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727296AbfKZDnU (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 25 Nov 2019 22:43:20 -0500
Received: from muru.com ([72.249.23.125]:43572 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726962AbfKZDnU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 25 Nov 2019 22:43:20 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id DB06D80EA;
        Tue, 26 Nov 2019 03:43:56 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Bin Liu <b-liu@ti.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-omap@vger.kernel.org,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>, Sebastian Reichel <sre@kernel.org>
Subject: [PATCH] usb: musb: fix idling for suspend after disconnect interrupt
Date:   Mon, 25 Nov 2019 19:41:51 -0800
Message-Id: <20191126034151.38154-1-tony@atomide.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When disconnected as USB B-device, we sometimes get a suspend interrupt
after disconnect interrupt. In that case we have devctl set to 99 with
VBUS still valid and musb_pm_runtime_check_session() wrongly things we
have an active session. We have no other interrupts after disconnect
coming in this case at least with the omap2430 glue.

Let's fix the issue by checking the interrupt status again with
delayed work for the devctl 99 case. In the suspend after disconnect
case the devctl session bit has cleared by then and musb can idle.
For a typical USB B-device connect case we just continue with normal
interrupts.

Cc: Merlijn Wajer <merlijn@wizzup.org>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Sebastian Reichel <sre@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/usb/musb/musb_core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
--- a/drivers/usb/musb/musb_core.c
+++ b/drivers/usb/musb/musb_core.c
@@ -1943,6 +1943,9 @@ ATTRIBUTE_GROUPS(musb);
 #define MUSB_QUIRK_B_INVALID_VBUS_91	(MUSB_DEVCTL_BDEVICE | \
 					 (2 << MUSB_DEVCTL_VBUS_SHIFT) | \
 					 MUSB_DEVCTL_SESSION)
+#define MUSB_QUIRK_B_DISCONNECT_99	(MUSB_DEVCTL_BDEVICE | \
+					 (3 << MUSB_DEVCTL_VBUS_SHIFT) | \
+					 MUSB_DEVCTL_SESSION)
 #define MUSB_QUIRK_A_DISCONNECT_19	((3 << MUSB_DEVCTL_VBUS_SHIFT) | \
 					 MUSB_DEVCTL_SESSION)
 
@@ -1965,6 +1968,11 @@ static void musb_pm_runtime_check_session(struct musb *musb)
 	s = MUSB_DEVCTL_FSDEV | MUSB_DEVCTL_LSDEV |
 		MUSB_DEVCTL_HR;
 	switch (devctl & ~s) {
+	case MUSB_QUIRK_B_DISCONNECT_99:
+		musb_dbg(musb, "Poll devctl in case of suspend after disconnect\n");
+		schedule_delayed_work(&musb->irq_work,
+				      msecs_to_jiffies(1000));
+		break;
 	case MUSB_QUIRK_B_INVALID_VBUS_91:
 		if (musb->quirk_retries && !musb->flush_irq_work) {
 			musb_dbg(musb,
-- 
2.24.0
