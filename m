Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EC94C433F5
	for <linux-usb@archiver.kernel.org>; Sat,  2 Oct 2021 19:02:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0C00C61AAC
	for <linux-usb@archiver.kernel.org>; Sat,  2 Oct 2021 19:02:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233876AbhJBTEF (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 2 Oct 2021 15:04:05 -0400
Received: from netrider.rowland.org ([192.131.102.5]:40571 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S233823AbhJBTEF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 2 Oct 2021 15:04:05 -0400
Received: (qmail 538054 invoked by uid 1000); 2 Oct 2021 15:02:17 -0400
Date:   Sat, 2 Oct 2021 15:02:17 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Greg KH <greg@kroah.com>
Cc:     USB mailing list <linux-usb@vger.kernel.org>
Subject: [PATCH] USB: EHCI: Improve port index sanitizing
Message-ID: <20211002190217.GA537967@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Now that Kees Cook has added a definition for HCS_N_PORTS_MAX in
commit 72dd1843232c ("USB: EHCI: Add register array bounds to HCS
ports"), the code in ehci_hub_control() which sanitizes port index
values can be improved a little.

The idea behind this change is that it prevents a possible
out-of-bounds pointer computation, which the compiler might be able to
detect since the port_status[] array now has a fixed length rather
than a variable length.

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>

---


[as1965]


 drivers/usb/host/ehci-hub.c |   11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

Index: usb-devel/drivers/usb/host/ehci-hub.c
===================================================================
--- usb-devel.orig/drivers/usb/host/ehci-hub.c
+++ usb-devel/drivers/usb/host/ehci-hub.c
@@ -745,12 +745,13 @@ int ehci_hub_control(
 	unsigned	selector;
 
 	/*
-	 * Avoid underflow while calculating (wIndex & 0xff) - 1.
-	 * The compiler might deduce that wIndex can never be 0 and then
-	 * optimize away the tests for !wIndex below.
+	 * Avoid out-of-bounds values while calculating the port index
+	 * from wIndex.  The compiler doesn't like pointers to invalid
+	 * addresses, even if they are never used.
 	 */
-	temp = wIndex & 0xff;
-	temp -= (temp > 0);
+	temp = (wIndex - 1) & 0xff;
+	if (temp >= HCS_N_PORTS_MAX)
+		temp = 0;
 	status_reg = &ehci->regs->port_status[temp];
 	hostpc_reg = &ehci->regs->hostpc[temp];
 
