Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A339C433FE
	for <linux-usb@archiver.kernel.org>; Tue, 18 Oct 2022 10:37:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229906AbiJRKhj (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 18 Oct 2022 06:37:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229917AbiJRKhf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Oct 2022 06:37:35 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59577B4499
        for <linux-usb@vger.kernel.org>; Tue, 18 Oct 2022 03:37:32 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1okjyU-0002Go-Af; Tue, 18 Oct 2022 12:37:30 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <sha@pengutronix.de>)
        id 1okjyS-002G1D-6v; Tue, 18 Oct 2022 12:37:28 +0200
Received: from sha by dude02.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <sha@pengutronix.de>)
        id 1okjyQ-00BIRN-Po; Tue, 18 Oct 2022 12:37:26 +0200
From:   Sascha Hauer <s.hauer@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     Peng Fan <peng.fan@oss.nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org,
        Xu Yang <xu.yang.nxp@gmail.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Xu Yang <xu.yang_2@nxp.com>
Subject: [PATCH v2 2/4] usb: chipidea: usbmisc_imx: Fix setting i.MX6SX wakeup source
Date:   Tue, 18 Oct 2022 12:37:23 +0200
Message-Id: <20221018103725.2580679-3-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221018103725.2580679-1-s.hauer@pengutronix.de>
References: <20221018103725.2580679-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

MX6SX_USB_VBUS_WAKEUP_SOURCE are two bits containing an enum value,
so when read/modify/write that we have to clear both bits bits before
setting the desired bits. The clearing of the bits was forgotten, add
it.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
Reviewed-by: Xu Yang <xu.yang_2@nxp.com>
Link: https://lore.kernel.org/r/20221011082924.884123-3-s.hauer@pengutronix.de
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/usb/chipidea/usbmisc_imx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
index 8f805aa9c383c..e1b4b7f9b3f31 100644
--- a/drivers/usb/chipidea/usbmisc_imx.c
+++ b/drivers/usb/chipidea/usbmisc_imx.c
@@ -551,6 +551,7 @@ static int usbmisc_imx6sx_init(struct imx_usbmisc_data *data)
 		spin_lock_irqsave(&usbmisc->lock, flags);
 		/* Set vbus wakeup source as bvalid */
 		val = readl(reg);
+		val &= ~MX6SX_USB_VBUS_WAKEUP_SOURCE(3);
 		writel(val | MX6SX_USB_VBUS_WAKEUP_SOURCE_BVALID, reg);
 		/*
 		 * Disable dp/dm wakeup in device mode when vbus is
-- 
2.30.2

