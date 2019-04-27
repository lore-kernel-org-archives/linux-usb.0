Return-Path: <SRS0=nhXQ=S5=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEAC8C43218
	for <linux-usb@archiver.kernel.org>; Sat, 27 Apr 2019 15:34:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 97C7B206C1
	for <linux-usb@archiver.kernel.org>; Sat, 27 Apr 2019 15:34:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726958AbfD0PeF (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 27 Apr 2019 11:34:05 -0400
Received: from netrider.rowland.org ([192.131.102.5]:57257 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1725942AbfD0PeF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 27 Apr 2019 11:34:05 -0400
Received: (qmail 18417 invoked by uid 500); 27 Apr 2019 11:34:03 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 27 Apr 2019 11:34:03 -0400
Date:   Sat, 27 Apr 2019 11:34:03 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     Greg KH <gregkh@linuxfoundation.org>
cc:     Christo Gouws <gouws.christo@gmail.com>,
        <linux-usb@vger.kernel.org>
Subject: Re: Line6 podstudio UX1 - driver crash on usb_hcd_map_urb_for_dma
In-Reply-To: <20190427070136.GE28250@kroah.com>
Message-ID: <Pine.LNX.4.44L0.1904271124490.17640-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, 27 Apr 2019, Greg KH wrote:

> On Fri, Apr 26, 2019 at 11:50:14AM +0200, Christo Gouws wrote:
> > Hi,
> > 
> > I have a Line6 Pod Studio UX1 card, but each time I plug it in, I get
> > the following crash in dmesg on Ubuntu 18.04
> > Linux my-pc 4.20.8-042008-generic #201902121544 SMP Tue Feb 12
> > 20:46:50 UTC 2019 x86_64 x86_64 x86_64 GNU/Linux
> > 
> > I've also tested this with a Fedora 30 v5.0.6-300 kernel, but still
> > seems to happen (using liveCD).
> > 
> > 
> > The output on the card seems to work, but none of the inputs work.
> > 
> > I've also now tested with latest kernel available on Arch Linux
> > Linux my-pc 5.0.9-arch1-1-ARCH #1 SMP PREEMPT Sat Apr 20 15:00:46 UTC
> > 2019 x86_64 GNU/Linux
> > 
> > After some further testing, I found that this issue cropped in beween
> > v4.8.17 and v4.9-rc1.
> > 
> > v4.8.17   - Works fine.
> > v4.9-rc1+  - Produces crash
> 
> Any chance you can use 'git bisect' to find the exact commit that caused
> the failure?

No need.  The bug is in line6_read_data() in sound/usb/line6/driver.c.  
That routine passes an invalid buffer to usb_control_message().  
Instead it should allocate its own buffer for the USB transfer and then
copy the value to the caller's buffer.

There is a similar problem in line6_write_data().  Furthermore, both
routines do DMA to/from a buffer on the stack.

Alan Stern

