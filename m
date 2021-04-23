Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1881C433ED
	for <linux-usb@archiver.kernel.org>; Fri, 23 Apr 2021 00:29:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 89FB4613F6
	for <linux-usb@archiver.kernel.org>; Fri, 23 Apr 2021 00:29:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236666AbhDWA3l (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 22 Apr 2021 20:29:41 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:14095 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235302AbhDWA3l (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Apr 2021 20:29:41 -0400
X-Originating-IP: 68.203.5.165
Received: from tacos.lan (cpe-68-203-5-165.austin.res.rr.com [68.203.5.165])
        (Authenticated sender: frank@zago.net)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id B948F240009;
        Fri, 23 Apr 2021 00:29:01 +0000 (UTC)
From:   Frank Zago <frank@zago.net>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org,
        Jan-Niklas Burfeind <kernel@aiyionpri.me>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Wolfram Sang <wsa@kernel.org>, Johan Hovold <johan@kernel.org>,
        linux-usb@vger.kernel.org, gunar@schorcht.net
Cc:     frank zago <frank@zago.net>
Subject: [PATCH v2 1/2] Revert "USB: serial: ch341: add new Product ID for CH341A"
Date:   Thu, 22 Apr 2021 19:28:51 -0500
Message-Id: <20210423002852.3904-1-frank@zago.net>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: frank zago <frank@zago.net>

The 0x5512 USB PID is for the I2C/GPIO/SPI interfaces. UART is still
present but only the TX and RX pins are available; DTS, DTR, ... are
used for other things. Remove the PID, and let a I2C driver bind to
it.

Existing CH341 boards usually have physical jumpers to switch between
the 3 modes.

This reverts commit 46ee4abb10a07bd8f8ce910ee6b4ae6a947d7f63.

Signed-off-by: frank zago <frank@zago.net>
---

Changes from v1:
  - Removed double Signed-off-by

 drivers/usb/serial/ch341.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/serial/ch341.c b/drivers/usb/serial/ch341.c
index 2db917eab799..235adc77ee0e 100644
--- a/drivers/usb/serial/ch341.c
+++ b/drivers/usb/serial/ch341.c
@@ -81,7 +81,6 @@
 #define CH341_QUIRK_SIMULATE_BREAK	BIT(1)

 static const struct usb_device_id id_table[] = {
-	{ USB_DEVICE(0x1a86, 0x5512) },
 	{ USB_DEVICE(0x1a86, 0x5523) },
 	{ USB_DEVICE(0x1a86, 0x7522) },
 	{ USB_DEVICE(0x1a86, 0x7523) },
--
2.27.0
