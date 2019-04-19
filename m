Return-Path: <SRS0=lmIm=SV=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8ABBC282DA
	for <linux-usb@archiver.kernel.org>; Fri, 19 Apr 2019 18:39:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A1A89204EC
	for <linux-usb@archiver.kernel.org>; Fri, 19 Apr 2019 18:39:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728259AbfDSSj2 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 19 Apr 2019 14:39:28 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:60916 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727499AbfDSSj2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 Apr 2019 14:39:28 -0400
Received: (qmail 2613 invoked by uid 2102); 19 Apr 2019 10:39:26 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 19 Apr 2019 10:39:26 -0400
Date:   Fri, 19 Apr 2019 10:39:26 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
cc:     Andrey Konovalov <andreyknvl@google.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        USB list <linux-usb@vger.kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Kostya Serebryany <kcc@google.com>,
        Alexander Potapenko <glider@google.com>
Subject: Re: USB fuzzing with syzbot
In-Reply-To: <20190419083529.GD28648@kroah.com>
Message-ID: <Pine.LNX.4.44L0.1904191035390.1406-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 19 Apr 2019, Greg Kroah-Hartman wrote:

> > 3. Regarding that GadgetFS-like interface.
> > 
> > Initially I was using GadgetFS (together with the Dummy HCD/UDC
> > module) to perform emulation of USB devices for fuzzing, but later
> > switched to a custom written interface. This interface is essentially
> > implemented in the following patch [3]. An example that emulates a USB
> > keyboard through this interface can be found here [4]. And the
> > syzkaller parts responsible for USB fuzzing are here [5], [6]. The
> > incentive to implement a different interface was to provide a somewhat
> > raw and direct access to the USB Gadget layer for the userspace, where
> > every USB request is passed to the userspace to get a response.
> > 
> > The main differences between this interface (referred to as usb-fuzzer
> > for now) and GadgetFS are:
> > 
> > 1) GadgetFS does some sanity checks on the provided USB descriptors,
> > which is something we don't want for fuzzing. We want the descriptors
> > to be as corrupted as they can.
> > 
> > 2) GadgetFS handles some of the USB requests internally based on the
> > provided device descriptor, which is also something we don't want. For
> > example we may want to be able to provide differently corrupted
> > responses to the same request.
> > 
> > 3) usb-fuzzer has ioctl-based interface instead of a filesystem-based
> > one. I wouldn't say it's that big of a deal, but it makes it somewhat
> > easier to incorporate into a fuzzer.
> > 
> > 4) Somewhat related to the previous point: usb-fuzzer uses predictable
> > endpoint names across different UDCs.
> > 
> > Right now each UDC driver defines endpoint names via EP_INFO() as it
> > pleases. And GadgetFS uses those names to create file entries for each
> > of the endpoints. As a result, endpoint names for different UDCs will
> > be different and it requires more work to write a portable userspace
> > gadget. The usb-fuzzer interface auto selects and assigns an endpoint
> > based on the required features like the transfer type.
> > 
> > 5) GadgetFS binds to the first available UDC, usb-fuzzer provides a
> > way to select a UDC to bind to.
> > 
> > Since the fuzzing happens in multiple processes each of which has its
> > own Dummy UDC assigned, we want to have control over which UDC we bind
> > to. This part is a bit confusing, but what I found out is that a UDC
> > is selected based on two different identifying names. I call the first
> > one "udc_device_name" and the second one "udc_driver_name".
> > "udc_device_name" has to be assigned to usb_gadget_driver->udc_name
> > when usb_gadget_probe_driver() is called, and "udc_driver_name" is
> > what we have to compare usb_gadget->name with inside of the
> > usb_gadget_driver->bind() callback. For example, Dummy UDC has
> > "dummy_udc" as its "udc_driver_name" and "dummy_udc.N" as its
> > "udc_device_name". At the same time the dwc2 driver that is used on
> > Raspberry Pi Zero, has "20980000.usb" as both "udc_driver_name" and
> > "udc_device_name".
> > 
> > Overall, the usb-fuzzer interface implementation has a similar
> > structure to that of GadgetFS, but looks way simpler (although that
> > might be because I've missed to implement some functionality :).
> > 
> > We'd like to get this upstreamed, but I'm not sure whether this should
> > be a separate interface (which we can rebrand as a raw usb gadget
> > interface or something like that) or we should try to make it a
> > special mode of GadgetFS. I like the former approach more, as GadgetFS
> > looks quite complicated from my point of view and making fundamental
> > changes to it doesn't seem like an easy task. This is where we'd like
> > to get your input.
> 
> I'll leave the gadgetfs questions to others that know that api better
> than I do :)

Assuming the usb-fuzzer implementation gets merged, I think it 
definitely should be kept separate from gadgetfs.  The differences in 
functionality are too great; it doesn't make sense to combine them in 
a single driver.

Also, while it often is reasonable for people to build gadgetfs for 
production use, usb-fuzzer is very much more of a developer/debugger 
type of thing.

Alan Stern

