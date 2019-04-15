Return-Path: <SRS0=TXFt=SR=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 548FBC10F0E
	for <linux-usb@archiver.kernel.org>; Mon, 15 Apr 2019 17:37:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2E01C2073F
	for <linux-usb@archiver.kernel.org>; Mon, 15 Apr 2019 17:37:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727997AbfDORg7 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 15 Apr 2019 13:36:59 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:39820 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727490AbfDORg7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 15 Apr 2019 13:36:59 -0400
Received: (qmail 5931 invoked by uid 2102); 15 Apr 2019 13:36:58 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 15 Apr 2019 13:36:58 -0400
Date:   Mon, 15 Apr 2019 13:36:58 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Felipe Balbi <felipe.balbi@linux.intel.com>
cc:     USB list <linux-usb@vger.kernel.org>
Subject: [PATCH] USB: UDC: net2280: Remove redundant "if" condition
Message-ID: <Pine.LNX.4.44L0.1904151335470.1575-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190415173658.GGV6dkp0vWdTTSbrNM6jMKtrQXddxgIOAWb5uNsy6W0@z>

The net2280 driver includes an unnecessary test for an endpoint's
queue being empty.  The test is redundant; it sits inside a
conditional block of an "if" statement which already tests the
endpoint's queue.

This patch removes the redundant test.

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>

---


[as1888]


 drivers/usb/gadget/udc/net2280.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: usb-devel/drivers/usb/gadget/udc/net2280.c
===================================================================
--- usb-devel.orig/drivers/usb/gadget/udc/net2280.c
+++ usb-devel/drivers/usb/gadget/udc/net2280.c
@@ -1057,7 +1057,7 @@ net2280_queue(struct usb_ep *_ep, struct
 			/* PIO ... stuff the fifo, or unblock it.  */
 			if (ep->is_in)
 				write_fifo(ep, _req);
-			else if (list_empty(&ep->queue)) {
+			else {
 				u32	s;
 
 				/* OUT FIFO might have packet(s) buffered */

