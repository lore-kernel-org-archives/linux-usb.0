Return-Path: <SRS0=lmIm=SV=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,T_DKIMWL_WL_HIGH,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8430C282DA
	for <linux-usb@archiver.kernel.org>; Fri, 19 Apr 2019 18:35:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AF39C20449
	for <linux-usb@archiver.kernel.org>; Fri, 19 Apr 2019 18:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555698925;
	bh=4aTEJMKwLTo7S9Knn47fYs9tcly3ypragoAo47SA5ag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=g57LNT8oOvI/Vkfh5im2MBUsePBnYY1f7kjthIgb3lvgFmUZIZKzvKH+k4+3d7cgC
	 N5m/Tsv+fBLUyVA55KdfdwXZw9oGl/GM45aduBh4zKb6kAEUIpRwKd4g89mXPW6Bw1
	 ECgAy+EAEqwJ62x6kIa3tee391s//ZppVnzleEnU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726710AbfDSSfY (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 19 Apr 2019 14:35:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:53860 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726279AbfDSS3P (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 19 Apr 2019 14:29:15 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 94914218AF;
        Fri, 19 Apr 2019 08:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1555662932;
        bh=4aTEJMKwLTo7S9Knn47fYs9tcly3ypragoAo47SA5ag=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wa1Htz0KnawivjqxDEqmzPqdBpi04h1cbz+hzZY5UydImi7QiGD4pEy4NmOirk/x5
         PsOGBUXuPqnDv6/ugRYcDCK0S8w4MoWjSaPU1o3lhihhNrlyqZSE50AbaT0EBrGPC4
         9W5KxUmyfPlSujUdixcc4eoQG3Bnjip8S+5aif0w=
Date:   Fri, 19 Apr 2019 10:35:29 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Andrey Konovalov <andreyknvl@google.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        USB list <linux-usb@vger.kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Kostya Serebryany <kcc@google.com>,
        Alexander Potapenko <glider@google.com>
Subject: Re: USB fuzzing with syzbot
Message-ID: <20190419083529.GD28648@kroah.com>
References: <CAAeHK+z+d=Gh4j1VSsEtLuYUpd7-T3Cu1ww0-5otSE5kDTgMGA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAeHK+z+d=Gh4j1VSsEtLuYUpd7-T3Cu1ww0-5otSE5kDTgMGA@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Apr 17, 2019 at 06:33:39PM +0200, Andrey Konovalov wrote:
> Hi,
> 
> As you might have noticed, syzbot has started reporting bugs in the
> USB subsystem that can be triggered externally by a malicious USB
> device. Right now the fuzzing is done via a GadgetFS-like interface to
> emulate USB devices through the USB Gadget subsystem and the Dummy
> HCD/UDC module to "loopback" connect those devices to the running
> kernel. There are more details in my OffensiveCon talk [1], [2].
> 
> A few questions/comments:
> 
> 1. Which tree should we use for testing?
> 
> Right now we're targeting the upstream tree, but we can switch to some
> USB development tree, where the fixes are likely to end up earlier.

USB fixes land in the usb.git tree on git.kernel.org in the usb-testing
branch (for the next release), and in the usb-linus branch (for this
release).

So you can just merge those two branches together if you like to be sure
you have all of the latest fixes.

> 2. Is there an easy way to figure out which config options enable
> drivers reachable over USB?

Looking for all options that depend on USB is a good start.

> Right now our kernel config is based on one of the Debian kernel
> configs, that supposedly enables enough relevant USB drivers. At the
> same time it enables a lot of other unnecessary stuff, which makes the
> kernel big and long to compile. Ideally, we would to have a way to
> auto-generate a kernel config that enables all the relevant (enabled
> by at least one of the distros) USB drivers. I've looked at whether
> it's possible to figure out which particular options in some kernel
> config are related to USB, but it seems that neither the option names,
> nor the way they are grouped in the config file, are representative
> enough.

Yeah, it's hard to just carve out this type of configuration, but here's
what I have done in the past to try to be sure I enabled all USB drivers
in my kernel configuration.

First, start with a "minimally working configuration" by running:
	make localmodconfig
on a working system, with the needed modules for booting and operating
properly already loaded.

That gives you a .config file that should take only minutes to build,
compared to much longer for the normal distro configuration (also be
sure to disable some debugging options so you don't spend extra time
building and stripping symbols).

Boot and make sure that configuration works.

Then, take that .config and do:
	- disable USB from the configuration by deleting the:
		CONFIG_USB_SUPPORT=y
	  option from your .config
	- run 'make oldconfig' to disable all USB drivers
	- turn USB back on by setting CONFIG_USB_SUPPORT=y back on in
	  your .config
	- run 'make oldconfig' and answer 'y' or 'm' to all of the
	  driver options you are presented with.

That usually catches almost all of them.  Sometimes you need to make
sure you have some other subsystem enabled (like SCSI), but odds are, if
you start with a "normally stripped down" configuration that works, you
should be fine.

> 3. Regarding that GadgetFS-like interface.
> 
> Initially I was using GadgetFS (together with the Dummy HCD/UDC
> module) to perform emulation of USB devices for fuzzing, but later
> switched to a custom written interface. This interface is essentially
> implemented in the following patch [3]. An example that emulates a USB
> keyboard through this interface can be found here [4]. And the
> syzkaller parts responsible for USB fuzzing are here [5], [6]. The
> incentive to implement a different interface was to provide a somewhat
> raw and direct access to the USB Gadget layer for the userspace, where
> every USB request is passed to the userspace to get a response.
> 
> The main differences between this interface (referred to as usb-fuzzer
> for now) and GadgetFS are:
> 
> 1) GadgetFS does some sanity checks on the provided USB descriptors,
> which is something we don't want for fuzzing. We want the descriptors
> to be as corrupted as they can.
> 
> 2) GadgetFS handles some of the USB requests internally based on the
> provided device descriptor, which is also something we don't want. For
> example we may want to be able to provide differently corrupted
> responses to the same request.
> 
> 3) usb-fuzzer has ioctl-based interface instead of a filesystem-based
> one. I wouldn't say it's that big of a deal, but it makes it somewhat
> easier to incorporate into a fuzzer.
> 
> 4) Somewhat related to the previous point: usb-fuzzer uses predictable
> endpoint names across different UDCs.
> 
> Right now each UDC driver defines endpoint names via EP_INFO() as it
> pleases. And GadgetFS uses those names to create file entries for each
> of the endpoints. As a result, endpoint names for different UDCs will
> be different and it requires more work to write a portable userspace
> gadget. The usb-fuzzer interface auto selects and assigns an endpoint
> based on the required features like the transfer type.
> 
> 5) GadgetFS binds to the first available UDC, usb-fuzzer provides a
> way to select a UDC to bind to.
> 
> Since the fuzzing happens in multiple processes each of which has its
> own Dummy UDC assigned, we want to have control over which UDC we bind
> to. This part is a bit confusing, but what I found out is that a UDC
> is selected based on two different identifying names. I call the first
> one "udc_device_name" and the second one "udc_driver_name".
> "udc_device_name" has to be assigned to usb_gadget_driver->udc_name
> when usb_gadget_probe_driver() is called, and "udc_driver_name" is
> what we have to compare usb_gadget->name with inside of the
> usb_gadget_driver->bind() callback. For example, Dummy UDC has
> "dummy_udc" as its "udc_driver_name" and "dummy_udc.N" as its
> "udc_device_name". At the same time the dwc2 driver that is used on
> Raspberry Pi Zero, has "20980000.usb" as both "udc_driver_name" and
> "udc_device_name".
> 
> Overall, the usb-fuzzer interface implementation has a similar
> structure to that of GadgetFS, but looks way simpler (although that
> might be because I've missed to implement some functionality :).
> 
> We'd like to get this upstreamed, but I'm not sure whether this should
> be a separate interface (which we can rebrand as a raw usb gadget
> interface or something like that) or we should try to make it a
> special mode of GadgetFS. I like the former approach more, as GadgetFS
> looks quite complicated from my point of view and making fundamental
> changes to it doesn't seem like an easy task. This is where we'd like
> to get your input.

I'll leave the gadgetfs questions to others that know that api better
than I do :)

thanks,

greg k-h
