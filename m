Return-Path: <SRS0=N8Gi=WJ=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2C73C433FF
	for <linux-usb@archiver.kernel.org>; Tue, 13 Aug 2019 20:15:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B12672067D
	for <linux-usb@archiver.kernel.org>; Tue, 13 Aug 2019 20:15:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726704AbfHMUPj (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 13 Aug 2019 16:15:39 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:42676 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1725944AbfHMUPj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Aug 2019 16:15:39 -0400
Received: (qmail 3699 invoked by uid 2102); 13 Aug 2019 16:15:38 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 13 Aug 2019 16:15:38 -0400
Date:   Tue, 13 Aug 2019 16:15:38 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Greg KH <greg@kroah.com>
cc:     Mayuresh Kulkarni <mkulkarni@opensource.cirrus.com>,
        USB list <linux-usb@vger.kernel.org>
Subject: [PATCH] USB: usbfs: Add a capability flag for runtime suspend
Message-ID: <Pine.LNX.4.44L0.1908131613490.1941-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The recent commit 7794f486ed0b ("usbfs: Add ioctls for runtime power
management") neglected to add a corresponding capability flag.  This
patch rectifies the omission.

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
CC: Mayuresh Kulkarni <mkulkarni@opensource.cirrus.com>

---

[as1908]


 drivers/usb/core/devio.c          |    9 ++++++++-
 include/uapi/linux/usbdevice_fs.h |    1 +
 2 files changed, 9 insertions(+), 1 deletion(-)

Index: usb-devel/drivers/usb/core/devio.c
===================================================================
--- usb-devel.orig/drivers/usb/core/devio.c
+++ usb-devel/drivers/usb/core/devio.c
@@ -44,6 +44,12 @@
 
 #include "usb.h"
 
+#ifdef CONFIG_PM
+#define MAYBE_CAP_SUSPEND	USBDEVFS_CAP_SUSPEND
+#else
+#define MAYBE_CAP_SUSPEND	0
+#endif
+
 #define USB_MAXBUS			64
 #define USB_DEVICE_MAX			(USB_MAXBUS * 128)
 #define USB_SG_SIZE			16384 /* split-size for large txs */
@@ -2312,7 +2318,8 @@ static int proc_get_capabilities(struct
 
 	caps = USBDEVFS_CAP_ZERO_PACKET | USBDEVFS_CAP_NO_PACKET_SIZE_LIM |
 			USBDEVFS_CAP_REAP_AFTER_DISCONNECT | USBDEVFS_CAP_MMAP |
-			USBDEVFS_CAP_DROP_PRIVILEGES | USBDEVFS_CAP_CONNINFO_EX;
+			USBDEVFS_CAP_DROP_PRIVILEGES |
+			USBDEVFS_CAP_CONNINFO_EX | MAYBE_CAP_SUSPEND;
 	if (!ps->dev->bus->no_stop_on_short)
 		caps |= USBDEVFS_CAP_BULK_CONTINUATION;
 	if (ps->dev->bus->sg_tablesize)
Index: usb-devel/include/uapi/linux/usbdevice_fs.h
===================================================================
--- usb-devel.orig/include/uapi/linux/usbdevice_fs.h
+++ usb-devel/include/uapi/linux/usbdevice_fs.h
@@ -158,6 +158,7 @@ struct usbdevfs_hub_portinfo {
 #define USBDEVFS_CAP_MMAP			0x20
 #define USBDEVFS_CAP_DROP_PRIVILEGES		0x40
 #define USBDEVFS_CAP_CONNINFO_EX		0x80
+#define USBDEVFS_CAP_SUSPEND			0x100
 
 /* USBDEVFS_DISCONNECT_CLAIM flags & struct */
 

