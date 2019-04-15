Return-Path: <SRS0=TXFt=SR=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14007C10F0E
	for <linux-usb@archiver.kernel.org>; Mon, 15 Apr 2019 20:19:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DD6FF2075B
	for <linux-usb@archiver.kernel.org>; Mon, 15 Apr 2019 20:19:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728278AbfDOUTG (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 15 Apr 2019 16:19:06 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:40176 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728243AbfDOUTG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 15 Apr 2019 16:19:06 -0400
Received: (qmail 7742 invoked by uid 2102); 15 Apr 2019 16:19:05 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 15 Apr 2019 16:19:05 -0400
Date:   Mon, 15 Apr 2019 16:19:05 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Felipe Balbi <felipe.balbi@linux.intel.com>,
        Paul Elder <paul.elder@ideasonboard.com>
cc:     USB list <linux-usb@vger.kernel.org>
Subject: Explicit status-stage requests for USB gadgets
Message-ID: <Pine.LNX.4.44L0.1904151439210.1575-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Felipe and Paul:

I finally took the time to put more work into the explicit-status-stage
project.  Now I've got patches adding support to both dummy-hcd and
net2280.  (The two patches for net2280 I sent earlier today address
unrelated issues that turned up while this work was under way.)  Along
with Paul's work on musb, it seems like a good start and worth merging.

Getting someone to do the same for dwc2 and dwc3 shouldn't be very 
hard, but they are out of my ballpark.

Paul, there is one change I think we should make to your original core
patch.  usb_gadget_control_complete() should not check request->length,
because it has to be possible for a gadget driver to send a zero-length
reply as the data stage for a control-IN request and still get an 
implicit status-stage request.

Aside from that, everything seems to be ready to move forward.

Felipe, any comments?

Alan Stern

