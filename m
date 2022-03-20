Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63B21C433F5
	for <linux-usb@archiver.kernel.org>; Sun, 20 Mar 2022 19:45:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243217AbiCTTrP (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 20 Mar 2022 15:47:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231210AbiCTTrO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 20 Mar 2022 15:47:14 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 002AFDB481
        for <linux-usb@vger.kernel.org>; Sun, 20 Mar 2022 12:45:49 -0700 (PDT)
Received: (qmail 78149 invoked by uid 1000); 20 Mar 2022 15:45:48 -0400
Date:   Sun, 20 Mar 2022 15:45:48 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>
Cc:     USB mailing list <linux-usb@vger.kernel.org>
Subject: [RFC PATCH 0/4] USB: gadget: Create a bus for gadgets
Message-ID: <YjeEbHL8ITkW692W@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Everyone:

The following series of patches implements Greg's suggestion that 
gadgets should be registered on some sort of bus.  It turns out that the 
best way to do this is to create a new "gadget" bus, with specialized 
matching and probing routines, rather than using an existing bus.

Patches 1-3 are simple preparations for the big change.  They stand on 
their own, make useful little changes, and could be merged by themselves
without committing to adding the "gadget" bus.  Patch 4 is main one.

I'm posting this series for feedback from the Gadget/UDC maintainer and 
others.  If everything works out okay, the patches can be submitted for 
real once the upcoming merge window closes.

Alan Stern
