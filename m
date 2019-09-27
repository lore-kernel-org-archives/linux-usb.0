Return-Path: <SRS0=AAIs=XW=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4786BC4360C
	for <linux-usb@archiver.kernel.org>; Fri, 27 Sep 2019 20:21:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 19F8321655
	for <linux-usb@archiver.kernel.org>; Fri, 27 Sep 2019 20:21:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726698AbfI0UVj (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 27 Sep 2019 16:21:39 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:56444 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726033AbfI0UVj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 27 Sep 2019 16:21:39 -0400
Received: (qmail 6725 invoked by uid 2102); 27 Sep 2019 16:21:38 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 27 Sep 2019 16:21:38 -0400
Date:   Fri, 27 Sep 2019 16:21:38 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Bastien Nocera <hadess@hadess.net>
cc:     linux-usb@vger.kernel.org, <benjamin.tissoires@redhat.com>
Subject: Re: Driver for something that's neither a device nor an interface
 driver?
In-Reply-To: <7f25b01ceb1a3aa6bd213599474ceffc34a0054b.camel@hadess.net>
Message-ID: <Pine.LNX.4.44L0.1909271611440.4732-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 27 Sep 2019, Bastien Nocera wrote:

> On Fri, 2019-09-27 at 13:56 -0400, Alan Stern wrote:
> > 
> <snip>
> > Is there any reason this needs to be done in a kernel driver?
> 
> To offer a unified interface all the devices with similar needs.
> 
> >   Can it 
> > be handled from userspace instead?
> 
> It could, at a great infrastructure cost, trying to get buy-in from
> various distributions, at the very least.

As Greg said, we generally prefer it if people do things that way
(assuming it's possible).  As for buy-in from distributions, other
programs such as usb_modeswitch have been widely accepted.  There's no
reason to think yours wouldn't be just as popular.

> > You said this was for a "power supply" class driver.  It's not clear 
> > what that means -- the devices you want to communicate with are 
> > iphones, ipads, etc., not power supplies.
> 
> There's tons of "device" scope "power_supply" devices in the kernel,
> which don't power the Linux machine they're running on. Grep for
> "POWER_SUPPLY_SCOPE_DEVICE" in the kernel, most wireless mice and
> keyboards implement this already.
> 
> > Under what circumstances would these messages need to get sent?  
> 
> User-space would control it by changing the device's
> POWER_SUPPLY_PROP_CHARGE_TYPE to "Fast", if available.
> 
> eg.
> # echo "Fast" > /sys/devices/pci0000:00/0000:00:14.0/usb3/3-
> 1/power_supply/apple_mfi_fastcharge/charge_type
> 
> > What 
> > piece of code is responsible for them?
> 
> In user-space? Hasn't been decided yet, but I can imagine a policy
> daemon that cares about what devices charge from which other device,
> and how fast. For example, a laptop in "low power mode" wouldn't want
> to fast charge a phone, if the only reason the phone was plugged in was
> to fetch some data off of it, for example.

I actually meant in the kernel.  But you'll probably say that's what 
we're trying to settle in this discussion.

> > If necessary, you can modify the core/generic.c driver.  However
> > that 
> > might not be the right approach, considering that this is meant only 
> > for devices manufactured by Apple.
> 
> It's also used by at least one Blackberry device, and I can imagine
> other vendors having similar "APIs" to work-around USB 1.x charging
> current limits.
> 
> I take it that by saying "modify core/generic.c" driver you mean that
> it's not possible to inherit from it, right?

The two don't have to be mutually exclusive.  That is, no, it was never
intended for other drivers to inherit from generic.c (although it was
originally intended that other drivers might _replace_ it in some
situations -- that hasn't worked out in practice).  But in theory you
could modify generic.c in a way that would make inheritance possible.

Or you could allow generic.c to attach "subdrivers" based on matching a
device's VID/PID, and one such subdriver could be your power-supply
manager.

Alan Stern

