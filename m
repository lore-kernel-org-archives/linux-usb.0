Return-Path: <SRS0=sojL=SO=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 564CFC10F0E
	for <linux-usb@archiver.kernel.org>; Fri, 12 Apr 2019 18:01:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1FA712171F
	for <linux-usb@archiver.kernel.org>; Fri, 12 Apr 2019 18:01:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726851AbfDLSBj (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 12 Apr 2019 14:01:39 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:40028 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726711AbfDLSBi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 12 Apr 2019 14:01:38 -0400
Received: (qmail 8477 invoked by uid 2102); 12 Apr 2019 14:01:37 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 12 Apr 2019 14:01:37 -0400
Date:   Fri, 12 Apr 2019 14:01:37 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     "Bollinger, Seth" <Seth.Bollinger@digi.com>
cc:     USB list <linux-usb@vger.kernel.org>
Subject: Re: Bug: VHCI + USB 3.0
In-Reply-To: <Pine.LNX.4.44L0.1904101047230.1629-100000@iolanthe.rowland.org>
Message-ID: <Pine.LNX.4.44L0.1904121358510.1648-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190412180137.zvruBPJ2ygOjf_T-O3pVSpcCRFfr3g8XqUjMF8zQQ4s@z>

On Wed, 10 Apr 2019, Alan Stern wrote:

> On Wed, 10 Apr 2019, Bollinger, Seth wrote:
> 
> > > On Apr 9, 2019, at 2:13 PM, Bollinger, Seth <Seth.Bollinger@digi.com<mailto:Seth.Bollinger@digi.com>> wrote:
> > >
> > > > Seth, you can try adding:
> > > >
> > > >  blk_queue_virt_boundary(sdev->request_queue, 1024 - 1)
> > > >
> > > > in drivers/usb/storage/scsiglue.c:slave_alloc(), just after the call to
> > > > blk_queue_update_dma_alignment().  Perhaps that will help
> > > >
> > >
> > > I will do that as a test.  However, I’m concerned that we’re solving only a specific case.  Won’t it fail in a similar way if a different subsystem does the same thing (USB modem or > video drivers, etc.)?
> > 
> > Just to follow up, this does seem to solve the specific problem.
> 
> Great!  Okay, here's an actual patch for you to try.  I have removed 
> the blk_queue_update_dma_alignment() call because it doesn't seem to 
> be necessary.  The starting location of each scatterlist element is 
> unimportant; only the length matters.
> 
> If this works, I will submit it as a bugfix for the kernel.

Any more test results?  I need to know that you're confident the patch 
works okay.

Alan Stern

PS: I changed my mind and decided to keep the
blk_queue_update_dma_alignment() call.  It probably doesn't hurt (the
data buffers are most likely already aligned) and some host controllers
may have alignment requirements.

