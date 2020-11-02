Return-Path: <SRS0=da9n=EI=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57725C00A89
	for <linux-usb@archiver.kernel.org>; Mon,  2 Nov 2020 14:58:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F405D2227F
	for <linux-usb@archiver.kernel.org>; Mon,  2 Nov 2020 14:58:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726056AbgKBO6W (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 2 Nov 2020 09:58:22 -0500
Received: from netrider.rowland.org ([192.131.102.5]:45523 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1725817AbgKBO6W (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 2 Nov 2020 09:58:22 -0500
Received: (qmail 1479826 invoked by uid 1000); 2 Nov 2020 09:58:21 -0500
Date:   Mon, 2 Nov 2020 09:58:21 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Greg KH <greg@kroah.com>
Cc:     Julien Humbert <julroy67@gmail.com>,
        Hans de Goede <jwrdegoede@fedoraproject.org>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: [PATCH] USB: Add NO_LPM quirk for Kingston flash drive
Message-ID: <20201102145821.GA1478741@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In Bugzilla #208257, Julien Humbert reports that a 32-GB Kingston
flash drive spontaneously disconnects and reconnects, over and over.
Testing revealed that disabling Link Power Management for the drive
fixed the problem.

This patch adds a quirk entry for that drive to turn off LPM permanently.

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Reported-and-tested-by: Julien Humbert <julroy67@gmail.com>
CC: Hans de Goede <jwrdegoede@fedoraproject.org>
CC: <stable@vger.kernel.org>

---


[as1946]


 drivers/usb/core/quirks.c |    3 +++
 1 file changed, 3 insertions(+)

Index: usb-devel/drivers/usb/core/quirks.c
===================================================================
--- usb-devel.orig/drivers/usb/core/quirks.c
+++ usb-devel/drivers/usb/core/quirks.c
@@ -370,6 +370,9 @@ static const struct usb_device_id usb_qu
 	{ USB_DEVICE(0x0926, 0x3333), .driver_info =
 			USB_QUIRK_CONFIG_INTF_STRINGS },
 
+	/* Kingston DataTraveler 3.0 */
+	{ USB_DEVICE(0x0951, 0x1666), .driver_info = USB_QUIRK_NO_LPM },
+
 	/* X-Rite/Gretag-Macbeth Eye-One Pro display colorimeter */
 	{ USB_DEVICE(0x0971, 0x2000), .driver_info = USB_QUIRK_NO_SET_INTF },
 
