Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EDECC433EF
	for <linux-usb@archiver.kernel.org>; Fri,  1 Jul 2022 20:55:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232350AbiGAUzP (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 1 Jul 2022 16:55:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232303AbiGAUzL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 1 Jul 2022 16:55:11 -0400
Received: from mailout1.hostsharing.net (mailout1.hostsharing.net [IPv6:2a01:37:1000::53df:5fcc:0])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A13E568A2E;
        Fri,  1 Jul 2022 13:55:10 -0700 (PDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
         client-signature RSA-PSS (4096 bits) client-digest SHA256)
        (Client CN "*.hostsharing.net", Issuer "RapidSSL TLS DV RSA Mixed SHA256 2020 CA-1" (verified OK))
        by mailout1.hostsharing.net (Postfix) with ESMTPS id EDCAD10192636;
        Fri,  1 Jul 2022 22:55:08 +0200 (CEST)
Received: from localhost (unknown [89.246.108.87])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by h08.hostsharing.net (Postfix) with ESMTPSA id BB6FC61A6B52;
        Fri,  1 Jul 2022 22:55:08 +0200 (CEST)
X-Mailbox-Line: From c45e311ac5b95798fe7cddd7bb834c5df83bb97e Mon Sep 17 00:00:00 2001
Message-Id: <c45e311ac5b95798fe7cddd7bb834c5df83bb97e.1656707954.git.lukas@wunner.de>
In-Reply-To: <cover.1656707954.git.lukas@wunner.de>
References: <cover.1656707954.git.lukas@wunner.de>
From:   Lukas Wunner <lukas@wunner.de>
Date:   Fri, 1 Jul 2022 22:47:53 +0200
Subject: [PATCH net-next v2 3/3] usbnet: smsc95xx: Clean up unnecessary
 BUG_ON() upon register access
To:     "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Eric Dumazet <edumazet@google.com>
Cc:     netdev@vger.kernel.org, linux-usb@vger.kernel.org,
        Steve Glendinning <steve.glendinning@shawell.net>,
        UNGLinuxDriver@microchip.com, Oliver Neukum <oneukum@suse.com>,
        Andre Edich <andre.edich@microchip.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Martyn Welch <martyn.welch@collabora.com>,
        Gabriel Hojda <ghojda@yo2urs.ro>,
        Christoph Fritz <chf.fritz@googlemail.com>,
        Lino Sanfilippo <LinoSanfilippo@gmx.de>,
        Philipp Rosenberger <p.rosenberger@kunbus.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Ferry Toth <fntoth@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
        Alan Stern <stern@rowland.harvard.edu>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

smsc95xx_read_reg() and smsc95xx_write_reg() call BUG_ON() if the
struct usbnet pointer passed in is NULL.

The functions have just been amended to dereference the pointer on
entry.  So the kernel now oopses if the pointer is NULL, eliminating
the need for an explicit BUG_ON().

Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
 drivers/net/usb/smsc95xx.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/net/usb/smsc95xx.c b/drivers/net/usb/smsc95xx.c
index 5458629cf694..bfb58c91db04 100644
--- a/drivers/net/usb/smsc95xx.c
+++ b/drivers/net/usb/smsc95xx.c
@@ -86,8 +86,6 @@ static int __must_check smsc95xx_read_reg(struct usbnet *dev, u32 index,
 	int ret;
 	int (*fn)(struct usbnet *, u8, u8, u16, u16, void *, u16);
 
-	BUG_ON(!dev);
-
 	if (current != pdata->pm_task)
 		fn = usbnet_read_cmd;
 	else
@@ -117,8 +115,6 @@ static int __must_check smsc95xx_write_reg(struct usbnet *dev, u32 index,
 	int ret;
 	int (*fn)(struct usbnet *, u8, u8, u16, u16, const void *, u16);
 
-	BUG_ON(!dev);
-
 	if (current != pdata->pm_task)
 		fn = usbnet_write_cmd;
 	else
-- 
2.36.1

