Return-Path: <SRS0=TXFt=SR=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CE20C10F0E
	for <linux-usb@archiver.kernel.org>; Mon, 15 Apr 2019 17:35:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0DDFB2073F
	for <linux-usb@archiver.kernel.org>; Mon, 15 Apr 2019 17:35:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727646AbfDORfr (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 15 Apr 2019 13:35:47 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:39814 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726956AbfDORfr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 15 Apr 2019 13:35:47 -0400
Received: (qmail 5926 invoked by uid 2102); 15 Apr 2019 13:35:46 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 15 Apr 2019 13:35:46 -0400
Date:   Mon, 15 Apr 2019 13:35:46 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Felipe Balbi <felipe.balbi@linux.intel.com>
cc:     USB list <linux-usb@vger.kernel.org>
Subject: [PATCH] USB: UDC: net22{80,72}: remove mistaken test of req->zero
Message-ID: <Pine.LNX.4.44L0.1904151333280.1575-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190415173546.aqgpO4mPDQlr8mKWBS4o2y6TxiFkj_dT96Ovim2KyHo@z>

The net2280 UDC driver (and also net2272, probably via copy-and-paste)
incorrectly checks the req->zero flag during OUT transfers, after
copying data from the UDC's FIFO into memory.  This makes no sense at
all; the "zero" flag indicates that an extra zero-length packet should
be appended to an IN transfer if the length is an even multiple of the
maxpacket size.  It has nothing to do with OUT transfers.

In practice this doesn't cause any problems because gadget drivers
never set req->zero for OUT transfers anyway.  Still, it is an error
and unnecessary code, so this patch removes the check.

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>

---


[as1887]


 drivers/usb/gadget/udc/net2272.c |    3 +--
 drivers/usb/gadget/udc/net2280.c |    3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

Index: usb-devel/drivers/usb/gadget/udc/net2280.c
===================================================================
--- usb-devel.orig/drivers/usb/gadget/udc/net2280.c
+++ usb-devel/drivers/usb/gadget/udc/net2280.c
@@ -789,8 +789,7 @@ static int read_fifo(struct net2280_ep *
 		(void) readl(&ep->regs->ep_rsp);
 	}
 
-	return is_short || ((req->req.actual == req->req.length) &&
-			!req->req.zero);
+	return is_short || req->req.actual == req->req.length;
 }
 
 /* fill out dma descriptor to match a given request */
Index: usb-devel/drivers/usb/gadget/udc/net2272.c
===================================================================
--- usb-devel.orig/drivers/usb/gadget/udc/net2272.c
+++ usb-devel/drivers/usb/gadget/udc/net2272.c
@@ -573,8 +573,7 @@ net2272_read_fifo(struct net2272_ep *ep,
 
 		/* completion */
 		if (unlikely(cleanup || is_short ||
-				((req->req.actual == req->req.length)
-				 && !req->req.zero))) {
+				req->req.actual == req->req.length)) {
 
 			if (cleanup) {
 				net2272_out_flush(ep);

