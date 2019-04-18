Return-Path: <SRS0=JW0E=SU=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A644DC10F0E
	for <linux-usb@archiver.kernel.org>; Thu, 18 Apr 2019 17:12:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7B6672171F
	for <linux-usb@archiver.kernel.org>; Thu, 18 Apr 2019 17:12:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389593AbfDRRMJ (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 18 Apr 2019 13:12:09 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:48580 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1733192AbfDRRMI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 Apr 2019 13:12:08 -0400
Received: (qmail 2385 invoked by uid 2102); 18 Apr 2019 13:12:07 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 18 Apr 2019 13:12:07 -0400
Date:   Thu, 18 Apr 2019 13:12:07 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Greg KH <greg@kroah.com>
cc:     andreyknvl@google.com, <gustavo@embeddedor.com>,
        USB list <linux-usb@vger.kernel.org>,
        <syzkaller-bugs@googlegroups.com>
Subject: [PATCH] USB: dummy-hcd: Fix failure to give back unlinked URBs
In-Reply-To: <00000000000054e5e70586bf46cc@google.com>
Message-ID: <Pine.LNX.4.44L0.1904181307350.1303-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190418171207.P7livWZZ1WKKjCln99lxT0JM8z_xuJUJgOeWyopowDg@z>

The syzkaller USB fuzzer identified a failure mode in which dummy-hcd
would never give back an unlinked URB.  This causes usb_kill_urb() to
hang, leading to WARNINGs and unkillable threads.

In dummy-hcd, all URBs are given back by the dummy_timer() routine as
it scans through the list of pending URBS.  Failure to give back URBs
can be caused by failure to start or early exit from the scanning
loop.  The code currently has two such pathways: One is triggered when
an unsupported bus transfer speed is encountered, and the other by
exhausting the simulated bandwidth for USB transfers during a frame.

This patch removes those two paths, thereby allowing all unlinked URBs
to be given back in a timely manner.  It adds a check for the bus
speed when the gadget first starts running, so that dummy_timer() will
never thereafter encounter an unsupported speed.  And it prevents the
loop from exiting as soon as the total bandwidth has been used up (the
scanning loop continues, giving back unlinked URBs as they are found,
but not transferring any more data).

Thanks to Andrey Konovalov for manually running the syzkaller fuzzer
to help track down the source of the bug.

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Reported-and-tested-by: syzbot+d919b0f29d7b5a4994b9@syzkaller.appspotmail.com
CC: <stable@vger.kernel.org>

---


[as1889]


 drivers/usb/gadget/udc/dummy_hcd.c |   19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

Index: usb-devel/drivers/usb/gadget/udc/dummy_hcd.c
===================================================================
--- usb-devel.orig/drivers/usb/gadget/udc/dummy_hcd.c
+++ usb-devel/drivers/usb/gadget/udc/dummy_hcd.c
@@ -979,8 +979,18 @@ static int dummy_udc_start(struct usb_ga
 	struct dummy_hcd	*dum_hcd = gadget_to_dummy_hcd(g);
 	struct dummy		*dum = dum_hcd->dum;
 
-	if (driver->max_speed == USB_SPEED_UNKNOWN)
+	switch (g->speed) {
+	/* All the speeds we support */
+	case USB_SPEED_LOW:
+	case USB_SPEED_FULL:
+	case USB_SPEED_HIGH:
+	case USB_SPEED_SUPER:
+		break;
+	default:
+		dev_err(dummy_dev(dum_hcd), "Unsupported driver max speed %d\n",
+				driver->max_speed);
 		return -EINVAL;
+	}
 
 	/*
 	 * SLAVE side init ... the layer above hardware, which
@@ -1784,9 +1794,10 @@ static void dummy_timer(struct timer_lis
 		/* Bus speed is 500000 bytes/ms, so use a little less */
 		total = 490000;
 		break;
-	default:
+	default:	/* Can't happen */
 		dev_err(dummy_dev(dum_hcd), "bogus device speed\n");
-		return;
+		total = 0;
+		break;
 	}
 
 	/* FIXME if HZ != 1000 this will probably misbehave ... */
@@ -1828,7 +1839,7 @@ restart:
 
 		/* Used up this frame's bandwidth? */
 		if (total <= 0)
-			break;
+			continue;
 
 		/* find the gadget's ep for this request (if configured) */
 		address = usb_pipeendpoint (urb->pipe);

