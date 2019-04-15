Return-Path: <SRS0=TXFt=SR=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A8FEC10F0E
	for <linux-usb@archiver.kernel.org>; Mon, 15 Apr 2019 18:15:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E79F6205ED
	for <linux-usb@archiver.kernel.org>; Mon, 15 Apr 2019 18:15:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727447AbfDOSPs (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 15 Apr 2019 14:15:48 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:39936 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726182AbfDOSPs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 15 Apr 2019 14:15:48 -0400
Received: (qmail 6449 invoked by uid 2102); 15 Apr 2019 14:15:47 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 15 Apr 2019 14:15:47 -0400
Date:   Mon, 15 Apr 2019 14:15:47 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Doug Anderson <dianders@chromium.org>
cc:     Lukas Wunner <lukas@wunner.de>,
        Minas Harutyunyan <minas.harutyunyan@synopsys.com>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
        Woojung Huh <woojung.huh@microchip.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-rpi-kernel@lists.infradead.org" 
        <linux-rpi-kernel@lists.infradead.org>,
        Alexandru M Stan <amstan@chromium.org>
Subject: Re: lan78xx: About 8000 usb interrupts per second when idle
In-Reply-To: <CAD=FV=Wbt-g0QtWQ2KzmWsXRygCk6=mJ6xYrnbL6E_NAUY6QkA@mail.gmail.com>
Message-ID: <Pine.LNX.4.44L0.1904151410090.1575-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 15 Apr 2019, Doug Anderson wrote:

> Hi,
> 
> On Sun, Apr 14, 2019 at 12:46 PM Lukas Wunner <lukas@wunner.de> wrote:
> >
> > On Tue, Apr 09, 2019 at 09:28:16AM +0000, Minas Harutyunyan wrote:
> > > Am 09.04.19 um 08:54 schrieb Jisheng Zhang:
> > > > The second one: 8000 usb interrupts per second when idle.
> > > > This is abnormal. any idea? Is it due to the lan78xx?
> > >
> > > dwc2 in host mode enable SOF interrupts if any periodic EP are in use.
> > > So, 8000 interrupts per second is expectant behavior.
> >
> > The dwc_otg driver patched into the Raspberry Pi Foundation's
> > kernel seems to make do with much fewer interrupts and much
> > lower CPU load.  How does it do that and how could dwc2 be
> > made to do the same?  Would it be possible for you to provide
> > me with documentation on the chip?  The Synopsis website
> > requires registration for downloads and registration requires
> > a Synopsis customer ID.
> >
> > It seems the Foundation's dwc_otg driver was forked from code
> > that later begat dwc2.
> 
> Your information might be misleading.  The downstream dwc2 driver for
> Raspberry PI handles the SoF interrupts at FIQ (fast interrupt) time.
> The idea here is that this is to prioritize it above all other things
> in the system since FIQ can fire even if we're currently in another
> interrupt handler.
> 
> IIRC:
> 
> * FIQs don't get counted in /proc/interrupts.  So probably you really
> are getting 8000 FIQs per second still, you just don't know it.
> 
> * FIQs don't count towards CPU load calculations, so it looks like the
> CPU is less loaded by this than it really is.  I have no evidence
> here, but I seem to remember someone telling me this, so if you
> believe this is wrong then ignore it.
> 
> 
> That all being said, though the purpose of using the FIQ is to improve
> the latency of handling SoF interrupts, it is also plausible that when
> it was written it also had the side effect of making the code more
> efficient.  I mean, there's theoretically maybe some built-in
> efficiency by skipping all the Linux interrupt infrastructure, but I'd
> bet that's not a huge deal and a bigger deal is how inefficient the
> mainline dwc2 driver is at handling interrupts.  I doubt you'd manage
> to get FIQ support for something like this on mainline, but you could
> possible spend more time improving the efficiency of the interrupt
> handler.  I spent some time on this a while ago but it was just small
> things--I didn't gut it and re-think how to make it faster.
> 
> 
> Note also that I spent a bit of time a few years ago making the
> upstream dwc2 driver more robust despite some of its inefficiencies.
> In the end it was fairly robust, though if you wanted to do something
> like audio or USB webcams with it you'd still struggle without higher
> CPU speeds or patches like <https://crbug.com/820961>.  I'm still of
> the belief that, unless the downstream driver has ported over the
> uFrame work I did, that the upstream dwc2 driver will be compatible
> with more more combinations of devices/hubs than the downstream one.

I can confirm that the upstream dwc2 driver has fixed some bugs that
are (or were at the time) present in dwc_otg.  It was years ago and I
don't remember the details, but one of the problems involved
communication with a full-speed device.  Possibly isochronous
transfers; I'm not sure.  The transfers were failing, and a USB bus
analyzer showed that the reason was an invalid byte sequence sent by
the Raspberry Pi while using dwc_otg.  dwc2 sent the correct sequence.

I don't know how much development work is currently going into dwc_otg, 
but I suspect it's a lot less than the amount of work being put into 
dwc2.

Alan Stern

