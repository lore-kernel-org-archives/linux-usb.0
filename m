Return-Path: <SRS0=Mi6m=3F=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B341C33CAF
	for <linux-usb@archiver.kernel.org>; Thu, 16 Jan 2020 22:06:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F26B820728
	for <linux-usb@archiver.kernel.org>; Thu, 16 Jan 2020 22:06:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732459AbgAPWGO (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 16 Jan 2020 17:06:14 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:41696 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1729260AbgAPWGO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Jan 2020 17:06:14 -0500
Received: (qmail 11448 invoked by uid 2102); 16 Jan 2020 17:06:12 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 16 Jan 2020 17:06:12 -0500
Date:   Thu, 16 Jan 2020 17:06:12 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
cc:     Chris Dickens <christopher.a.dickens@gmail.com>,
        linux-usb <linux-usb@vger.kernel.org>
Subject: Re: Inconsistency in how URBs are unlinked
In-Reply-To: <20200116214034.GA1250873@kroah.com>
Message-ID: <Pine.LNX.4.44L0.2001161656270.1301-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 16 Jan 2020, Greg Kroah-Hartman wrote:

> On Thu, Jan 16, 2020 at 01:34:21PM -0800, Chris Dickens wrote:
> > Hi,
> > 
> > A bug [1] has been reported against libusb about a segfault that
> > occurs when a device is disconnected while processing isochronous
> > transfers.  In my investigation I discovered an interesting
> > inconsistency in how URBs are unlinked across the USB core.
> > 
> > The usbfs driver will unlink URBs in the same order they are
> > submitted.

You're talking about destroy_async(), right?  Yes, I should change that 
to make it go in backwards order -- thanks for pointing this out.

> >  From what I can see this code is executed when
> > setting/releasing an interface or when alloc'ing/freeing streams.  I
> > see there is also a call within the usbfs driver's disconnect
> > function, but that appears to be a no-op (is this really the case?) as
> > by the time that function is called the interface would have already
> > been disabled and thus usb_hcd_flush_endpoint() would have been
> > called.

Not necessarily.  You can unbind a driver such as usbfs without 
disabling the interface.

> > Since commit 2eac136243 ("usb: core: unlink urbs from the tail of the
> > endpoint's urb_list"), the usb_hcd_flush_endpoint() function will
> > unlink URBs in the reverse order of submission.  This subtle change is
> > what led to the crash within libusb.  The bug manifests when transfers
> > within libusb are split into multiple URBs.  Prior to this change, the
> > order in which URBs were reaped matched the order in which they were
> > submitted.  Internally libusb expects this order to match and frees
> > memory when it encounters the last URB in a multi-URB transfer, but
> > since it reaps the last URB first the memory is freed right away and
> > things take a turn when the freed memory is accessed when reaping the
> > other URB(s) in that same transfer.
> 
> That commit was from July 2017, has no one really noticed since then?
> 
> Anyway, who is splitting the urb up, libusb or usbfs?  I'm guessing
> libusb here as otherwise this wouldn't be an issue, but if you are
> splitting them up, shouldn't you never count on the order in which they
> are handled as some host controllers can reorder them (I think xhci
> can).  So this type of fix for libusb is to be expected I would think,
> you can't count on an async interface ever working in an ordered manner,
> right?

Host controllers can't reorder URBs for the same endpoint, although 
they can reorder URBs for differing endpoints.

> Also, what does other operating systems do here?

In general it is better to unlink URBs in reverse order.  This
eliminates all possibility that the kernel will unlink URB x before it
executes but then URB x+1 will get executed before the kernel can
unlink it.

> > I will fix libusb to account for this behavior, but I thought it worth
> > mentioning as this new behavior isn't what I (and possibly others)
> > necessarily expect.
> 
> New as of 2017 :)

The kernel guarantees that URBs for a single endpoint will complete in
order _unless_ they have been unlinked.  Unlinked URBs can complete in
any order -- and not necessarily the order in which they were unlinked.

Alan Stern

