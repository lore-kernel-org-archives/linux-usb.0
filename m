Return-Path: <SRS0=TXFt=SR=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88B05C10F12
	for <linux-usb@archiver.kernel.org>; Mon, 15 Apr 2019 17:19:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 620DB218A1
	for <linux-usb@archiver.kernel.org>; Mon, 15 Apr 2019 17:19:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727821AbfDORT1 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 15 Apr 2019 13:19:27 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:39768 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726516AbfDORT1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 15 Apr 2019 13:19:27 -0400
Received: (qmail 5796 invoked by uid 2102); 15 Apr 2019 13:19:25 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 15 Apr 2019 13:19:25 -0400
Date:   Mon, 15 Apr 2019 13:19:25 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Greg KH <greg@kroah.com>
cc:     Seth Bollinger <Seth.Bollinger@digi.com>,
        Ming Lei <tom.leiming@gmail.com>,
        Oliver Neukum <oneukum@suse.com>,
        USB list <linux-usb@vger.kernel.org>,
        USB Storage list <usb-storage@lists.one-eyed-alien.net>
Subject: [PATCH] usb-storage: Set virt_boundary_mask to avoid SG overflows
Message-ID: <Pine.LNX.4.44L0.1904151315320.1575-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190415171925.Ogm2j3YY1r8-YoX2jhtfRdfOfDjkHWJRTj7PG4gZgTI@z>

The USB subsystem has always had an unusual requirement for its
scatter-gather transfers: Each element in the scatterlist (except the
last one) must have a length divisible by the bulk maxpacket size.
This is a particular issue for USB mass storage, which uses SG lists
created by the block layer rather than setting up its own.

So far we have scraped by okay because most devices have a logical
block size of 512 bytes or larger, and the bulk maxpacket sizes for
USB 2 and below are all <= 512.  However, USB 3 has a bulk maxpacket
size of 1024.  Since the xhci-hcd driver includes native SG support,
this hasn't mattered much.  But now people are trying to use USB-3
mass storage devices with USBIP, and the vhci-hcd driver currently
does not have full SG support.

The result is an overflow error, when the driver attempts to implement
an SG transfer of 63 512-byte blocks as a single
3584-byte (7 blocks) transfer followed by seven 4096-byte (8 blocks)
transfers.  The device instead sends 31 1024-byte packets followed by
a 512-byte packet, and this overruns the first SG buffer.

Ideally this would be fixed by adding better SG support to vhci-hcd.
But for now it appears we can work around the problem by
asking the block layer to respect the maxpacket limitation, through
the use of the virt_boundary_mask.

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Reported-by: Seth Bollinger <Seth.Bollinger@digi.com>
Tested-by: Seth Bollinger <Seth.Bollinger@digi.com>
CC: Ming Lei <tom.leiming@gmail.com>

---

uas should get a similar change.  Oliver said he would take care of 
it.


[as1886]


 drivers/usb/storage/scsiglue.c |   26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

Index: usb-devel/drivers/usb/storage/scsiglue.c
===================================================================
--- usb-devel.orig/drivers/usb/storage/scsiglue.c
+++ usb-devel/drivers/usb/storage/scsiglue.c
@@ -65,6 +65,7 @@ static const char* host_info(struct Scsi
 static int slave_alloc (struct scsi_device *sdev)
 {
 	struct us_data *us = host_to_us(sdev->host);
+	int maxp;
 
 	/*
 	 * Set the INQUIRY transfer length to 36.  We don't use any of
@@ -74,20 +75,17 @@ static int slave_alloc (struct scsi_devi
 	sdev->inquiry_len = 36;
 
 	/*
-	 * USB has unusual DMA-alignment requirements: Although the
-	 * starting address of each scatter-gather element doesn't matter,
-	 * the length of each element except the last must be divisible
-	 * by the Bulk maxpacket value.  There's currently no way to
-	 * express this by block-layer constraints, so we'll cop out
-	 * and simply require addresses to be aligned at 512-byte
-	 * boundaries.  This is okay since most block I/O involves
-	 * hardware sectors that are multiples of 512 bytes in length,
-	 * and since host controllers up through USB 2.0 have maxpacket
-	 * values no larger than 512.
-	 *
-	 * But it doesn't suffice for Wireless USB, where Bulk maxpacket
-	 * values can be as large as 2048.  To make that work properly
-	 * will require changes to the block layer.
+	 * USB has unusual scatter-gather requirements: the length of each
+	 * scatterlist element except the last must be divisible by the
+	 * Bulk maxpacket value.  Fortunately this value is always a
+	 * power of 2.  Inform the block layer about this requirement.
+	 */
+	maxp = usb_maxpacket(us->pusb_dev, us->recv_bulk_pipe, 0);
+	blk_queue_virt_boundary(sdev->request_queue, maxp - 1);
+
+	/*
+	 * Some host controllers may have alignment requirements.
+	 * We'll play it safe by requiring 512-byte alignment always.
 	 */
 	blk_queue_update_dma_alignment(sdev->request_queue, (512 - 1));
 


