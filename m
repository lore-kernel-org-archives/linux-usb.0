Return-Path: <SRS0=G55A=A2=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC8FFC433E3
	for <linux-usb@archiver.kernel.org>; Wed, 15 Jul 2020 01:25:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D41A920674
	for <linux-usb@archiver.kernel.org>; Wed, 15 Jul 2020 01:25:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727024AbgGOBZT (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 14 Jul 2020 21:25:19 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:39929 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726356AbgGOBZT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Jul 2020 21:25:19 -0400
Received: from cwh (fob.gandi.net [217.70.181.1])
        (Authenticated sender: wxcafe@wxcafe.net)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id CFFD040007;
        Wed, 15 Jul 2020 01:25:16 +0000 (UTC)
Message-ID: <0202c34b1b335d8d8fcdd5406f5e8178b4c198ec.camel@wxcafe.net>
Subject: [PATCH 2/4] cdc_ether: use dev->intf to get interface information
From:   =?ISO-8859-1?Q?Wxcaf=E9?= <wxcafe@wxcafe.net>
To:     linux-usb@vger.kernel.org
Cc:     Miguel =?ISO-8859-1?Q?Rodr=EDguez_P=E9rez?= 
        <miguel@det.uvigo.gal>, oliver@neukum.org, netdev@vger.kernel.org
Date:   Tue, 14 Jul 2020 21:25:13 -0400
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This makes the function available to other drivers, like cdn_ncm.

Signed-off-by: Miguel Rodríguez Pérez <miguel@det.uvigo.gal>
---
 drivers/net/usb/cdc_ether.c | 3 ++-
 include/linux/usb/usbnet.h  | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/usb/cdc_ether.c b/drivers/net/usb/cdc_ether.c
index 2afe258e3648..8c1d61c2cbac 100644
--- a/drivers/net/usb/cdc_ether.c
+++ b/drivers/net/usb/cdc_ether.c
@@ -63,7 +63,7 @@ static const u8 mbm_guid[16] = {
 	0xa6, 0x07, 0xc0, 0xff, 0xcb, 0x7e, 0x39, 0x2a,
 };
 
-static void usbnet_cdc_update_filter(struct usbnet *dev)
+void usbnet_cdc_update_filter(struct usbnet *dev)
 {
 	struct net_device	*net = dev->net;
 
@@ -90,6 +90,7 @@ static void usbnet_cdc_update_filter(struct usbnet *dev)
 			USB_CTRL_SET_TIMEOUT
 		);
 }
+EXPORT_SYMBOL_GPL(usbnet_cdc_update_filter);
 
 /* probes control interface, claims data interface, collects the bulk
  * endpoints, activates data interface (if needed), maybe sets MTU.
diff --git a/include/linux/usb/usbnet.h b/include/linux/usb/usbnet.h
index b0bff3083278..33e7803b85af 100644
--- a/include/linux/usb/usbnet.h
+++ b/include/linux/usb/usbnet.h
@@ -286,4 +286,5 @@ extern void usbnet_update_max_qlen(struct usbnet *dev);
 extern void usbnet_get_stats64(struct net_device *dev,
 			       struct rtnl_link_stats64 *stats);
 
+extern void usbnet_cdc_update_filter(struct usbnet *);
 #endif /* __LINUX_USB_USBNET_H */
-- 
2.27.0

-- 
Wxcafé <wxcafe@wxcafe.net>

