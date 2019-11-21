Return-Path: <SRS0=FqPF=ZN=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69745C432C0
	for <linux-usb@archiver.kernel.org>; Thu, 21 Nov 2019 10:28:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3B87E20872
	for <linux-usb@archiver.kernel.org>; Thu, 21 Nov 2019 10:28:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726170AbfKUK2T (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 21 Nov 2019 05:28:19 -0500
Received: from mx2.suse.de ([195.135.220.15]:34242 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726014AbfKUK2T (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 21 Nov 2019 05:28:19 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 2488BB2B0;
        Thu, 21 Nov 2019 10:28:18 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     lee.jones@linaro.org, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] mfd: dln2: more sanity checking for endpoints
Date:   Thu, 21 Nov 2019 11:28:10 +0100
Message-Id: <20191121102810.27205-1-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

It is not enough to check for the number of endpoints.
The types must also be correct.

Reported-and-tested-by: syzbot+48a2851be24583b864dc@syzkaller.appspotmail.com
Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/mfd/dln2.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/dln2.c b/drivers/mfd/dln2.c
index 381593fbe50f..7841c11411d0 100644
--- a/drivers/mfd/dln2.c
+++ b/drivers/mfd/dln2.c
@@ -722,6 +722,8 @@ static int dln2_probe(struct usb_interface *interface,
 		      const struct usb_device_id *usb_id)
 {
 	struct usb_host_interface *hostif = interface->cur_altsetting;
+	struct usb_endpoint_descriptor *epin;
+	struct usb_endpoint_descriptor *epout;
 	struct device *dev = &interface->dev;
 	struct dln2_dev *dln2;
 	int ret;
@@ -731,12 +733,19 @@ static int dln2_probe(struct usb_interface *interface,
 	    hostif->desc.bNumEndpoints < 2)
 		return -ENODEV;
 
+	epin = &hostif->endpoint[0].desc;
+	epout = &hostif->endpoint[1].desc;
+	if (!usb_endpoint_is_bulk_out(epout))
+		return -ENODEV;
+	if (!usb_endpoint_is_bulk_in(epin))
+		return -ENODEV;
+
 	dln2 = kzalloc(sizeof(*dln2), GFP_KERNEL);
 	if (!dln2)
 		return -ENOMEM;
 
-	dln2->ep_out = hostif->endpoint[0].desc.bEndpointAddress;
-	dln2->ep_in = hostif->endpoint[1].desc.bEndpointAddress;
+	dln2->ep_out = epout->bEndpointAddress;
+	dln2->ep_in = epin->bEndpointAddress;
 	dln2->usb_dev = usb_get_dev(interface_to_usbdev(interface));
 	dln2->interface = interface;
 	usb_set_intfdata(interface, dln2);
-- 
2.16.4

