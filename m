Return-Path: <SRS0=hNA8=SH=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA4ABC282CE
	for <linux-usb@archiver.kernel.org>; Fri,  5 Apr 2019 21:01:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B2F792175B
	for <linux-usb@archiver.kernel.org>; Fri,  5 Apr 2019 21:01:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726561AbfDEVBW (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 5 Apr 2019 17:01:22 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:53832 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1725967AbfDEVBV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 5 Apr 2019 17:01:21 -0400
Received: (qmail 5948 invoked by uid 2102); 5 Apr 2019 17:01:20 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 5 Apr 2019 17:01:20 -0400
Date:   Fri, 5 Apr 2019 17:01:19 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     "Bollinger, Seth" <Seth.Bollinger@digi.com>
cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Bug: VHCI + USB 3.0
In-Reply-To: <41405930-1E38-4B4C-896E-CD97942C521F@digi.com>
Message-ID: <Pine.LNX.4.44L0.1904051658360.1442-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 5 Apr 2019, Bollinger, Seth wrote:

> Hello All,
> 
> We recently have run into a problem using a USB 3.0 thumb drive over USBIP where the driver will unlink URBs when trying to mount a FAT partition.  This happens because of the remote XHCI controller returning errno 75 during IN URB processing.  I've traced the failure to the following steps:
> 
> 1. usb-storage sends a SCSI READ_10 request OUT URB to vhci
> 2. vhci forwards to remote workstation over USBIP and submits the URB
> 3. usb-storage sends a 32K IN URB using a SG table
> 4. usb_sg_init notices that vhci bus doesn't support SG (usb/core/message.c:399)
> 5. usb_sg_init breaks the SG table into an URB for each SG entry (usb/core/message.c:418)
> 6. vhci forwards to remote and submits the URBs
> 7. XHCI processes the first URB, but the buffer is too small to contain the bulk of the data and sets errno -75 when it would overflow the URB buffer (xhci-ring.c:2371)
> 
> It appears to me when the SG read is broken into multiple URBs, the latency in processing the remote URBs is causing XHCI to fail the IN.  A similar error sometimes occurs on OUTs as well.  I apologize, but I don't remember the errno off the top of my head for the OUT.

Latency doesn't seem to have anything to do with it.  You wrote just 
above that the remote buffer is too small.  That's the problem.

> I patched usb_sg_init to alloc/free a contiguous URB so as not to fragment INS/OUTS and this is working well so far.
> 
> 1. Does that seem like the correct fix?

No.

> 2. Is this fix something the community would be interested in?
> 
> I'm open to working on a more "correct" patch if prompted to do so (as long as we're not talking weeks of work...).

Why is the remote buffer too small?  If you can figure that out then 
you should be able to fix the problem pretty easily.

Alan Stern

