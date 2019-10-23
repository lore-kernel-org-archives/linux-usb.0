Return-Path: <SRS0=fPcF=YQ=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7B42CA9EB6
	for <linux-usb@archiver.kernel.org>; Wed, 23 Oct 2019 14:12:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AA9E42086D
	for <linux-usb@archiver.kernel.org>; Wed, 23 Oct 2019 14:12:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404395AbfJWOMW (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 23 Oct 2019 10:12:22 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:39820 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1732167AbfJWOMW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 23 Oct 2019 10:12:22 -0400
Received: (qmail 2590 invoked by uid 2102); 23 Oct 2019 10:12:20 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 23 Oct 2019 10:12:20 -0400
Date:   Wed, 23 Oct 2019 10:12:20 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Christoph Hellwig <hch@lst.de>
cc:     Greg KH <greg@kroah.com>,
        Piergiorgio Sartor <piergiorgio.sartor@nexgo.de>,
        Seth Bollinger <Seth.Bollinger@digi.com>,
        Jens Axboe <axboe@kernel.dk>,
        USB list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb-storage: Revert commit 747668dbc061 ("usb-storage:
 Set virt_boundary_mask to avoid SG overflows")
In-Reply-To: <20191023015348.GA16123@lst.de>
Message-ID: <Pine.LNX.4.44L0.1910231011190.1878-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 23 Oct 2019, Christoph Hellwig wrote:

> On Mon, Oct 21, 2019 at 11:48:06AM -0400, Alan Stern wrote:
> > There is no longer any reason to keep the virt_boundary_mask setting
> > for usb-storage.  It was needed in the first place only for handling
> > devices with a block size smaller than the maxpacket size and where
> > the host controller was not capable of fully general scatter-gather
> > operation (that is, able to merge two SG segments into a single USB
> > packet).  But:
> > 
> > 	High-speed or slower connections never use a bulk maxpacket
> > 	value larger than 512;
> > 
> > 	The SCSI layer does not handle block devices with a block size
> > 	smaller than 512 bytes;
> > 
> > 	All the host controllers capable of SuperSpeed operation can
> > 	handle fully general SG;
> > 
> > 	Since commit ea44d190764b ("usbip: Implement SG support to
> > 	vhci-hcd and stub driver") was merged, the USB/IP driver can
> > 	also handle SG.
> > 
> > Therefore all supported device/controller combinations should be okay
> > with no need for any special virt_boundary_mask.  So in order to fix
> > the swiotlb problem, this patch reverts commit 747668dbc061.
> 
> That's great to know.  The same should also apply to uas, shouldn't
> it?

Ah, yes, excellent point -- I had forgotten about it.  Additional patch 
coming up soon...

Alan Stern

> Otherwise:
> 
> Acked-by: Christoph Hellwig <hch@lst.de>

