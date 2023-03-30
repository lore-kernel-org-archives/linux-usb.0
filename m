Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC453C6FD1D
	for <linux-usb@archiver.kernel.org>; Thu, 30 Mar 2023 15:35:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233171AbjC3Pfl (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 30 Mar 2023 11:35:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233128AbjC3Pfg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Mar 2023 11:35:36 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id D0006D519
        for <linux-usb@vger.kernel.org>; Thu, 30 Mar 2023 08:35:18 -0700 (PDT)
Received: (qmail 200941 invoked by uid 1000); 30 Mar 2023 11:34:46 -0400
Date:   Thu, 30 Mar 2023 11:34:46 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     syzbot <syzbot+23be03b56c5259385d79@syzkaller.appspotmail.com>,
        Thomas Winischhofer <thomas@winischhofer.net>
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] WARNING in sisusb_send_bulk_msg/usb_submit_urb
Message-ID: <b799fc68-8840-43e7-85f5-27e1e6457a44@rowland.harvard.edu>
References: <00000000000096e4f905f81b2702@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00000000000096e4f905f81b2702@google.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Reference: https://syzkaller.appspot.com/bug?extid=23be03b56c5259385d79

The sisusbvga driver just assumes that the endpoints it uses will be 
present, without checking.  I don't know anything about this driver, so 
the fix below may not be entirely correct.

Alan Stern

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/ v6.2

--- usb-devel.orig/drivers/usb/misc/sisusbvga/sisusbvga.c
+++ usb-devel/drivers/usb/misc/sisusbvga/sisusbvga.c
@@ -2772,6 +2772,24 @@ static struct usb_class_driver usb_sisus
 	.minor_base =	SISUSB_MINOR
 };
 
+/*
+ * Check whether the current altsetting for intf contains a bulk endpoint
+ * with the specified address (number and direction).
+ */
+static int check_bulk_ep(struct usb_interface *intf, unsigned int ep_addr)
+{
+	int n, i;
+	const struct usb_endpoint_descriptor *epd;
+
+	n = intf->cur_altsetting->desc.bNumEndpoints;
+	for (i = 0; i < n; ++i) {
+		epd = &intf->cur_altsetting->endpoint[i].desc;
+		if (epd->bEndpointAddress == ep_addr)
+			return usb_endpoint_xfer_bulk(epd);
+	}
+	return 0;
+}
+
 static int sisusb_probe(struct usb_interface *intf,
 		const struct usb_device_id *id)
 {
@@ -2779,6 +2797,17 @@ static int sisusb_probe(struct usb_inter
 	struct sisusb_usb_data *sisusb;
 	int retval = 0, i;
 
+	/* Are the expected endpoints present? */
+	if (!check_bulk_ep(intf, SISUSB_EP_GFX_IN | USB_DIR_IN) ||
+	    !check_bulk_ep(intf, SISUSB_EP_GFX_OUT | USB_DIR_OUT) ||
+	    !check_bulk_ep(intf, SISUSB_EP_GFX_BULK_OUT | USB_DIR_OUT) ||
+	    !check_bulk_ep(intf, SISUSB_EP_GFX_LBULK_OUT | USB_DIR_OUT) ||
+	    !check_bulk_ep(intf, SISUSB_EP_BRIDGE_IN | USB_DIR_IN) ||
+	    !check_bulk_ep(intf, SISUSB_EP_BRIDGE_OUT | USB_DIR_OUT)) {
+		dev_err(&dev->dev, "Invalid USB2VGA device\n");
+		return -EINVAL;
+	}
+
 	dev_info(&dev->dev, "USB2VGA dongle found at address %d\n",
 			dev->devnum);
 

