Return-Path: <SRS0=e+xf=S2=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,T_DKIMWL_WL_MED,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39DB6C10F11
	for <linux-usb@archiver.kernel.org>; Wed, 24 Apr 2019 16:06:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DE55121900
	for <linux-usb@archiver.kernel.org>; Wed, 24 Apr 2019 16:06:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MIxSQiim"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731026AbfDXQGJ (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 24 Apr 2019 12:06:09 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:34626 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729027AbfDXQGI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 Apr 2019 12:06:08 -0400
Received: by mail-pl1-f193.google.com with SMTP id y6so9537919plt.1
        for <linux-usb@vger.kernel.org>; Wed, 24 Apr 2019 09:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=U55RsKoNEUQu47Gv/8nE3a7fVbwsSQrsGQLL/kReqQc=;
        b=MIxSQiimxGtPLVQyWeRjVKwy6y6CM4/JL8iRjhJrLzr0Bvi/ynI0px/KID8MbnjZnG
         29orRp2XXBE9SZ+PU0HmJxjjJqkh2niXcpKXVnl9e5Q5fT2qyqB6HF4l1LLaSV+5AVIL
         okwG+Eb0VeSZmXzz8EosuZtYzLx4ARVO4cE/aWB1WeAMIN1+B2/V4Vxr1LVE4guhwXv4
         yPxHBIwV7x7O41kuM7hOCfq82NYij4zqs9UEUFF6WQ7Jp2UXcIvUHDzWsbXIPeLpwnWi
         Ro7kaMMMwwsm3vptZ+rINk1Kzu+81OWSvGXVtIgYhpcrdQm9yu8c91XpGzr6DgozJBmP
         wVbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U55RsKoNEUQu47Gv/8nE3a7fVbwsSQrsGQLL/kReqQc=;
        b=G539/Oz0BNPWhbg/l8DlBa3Vpvx82cAwjj+VIL+DT3O2Imd8opnqftQjdJbqgGJ4A3
         gG252Z/ZByjx1xOqHKB73OJKmzjlyCjemI7BtSCuEvQZsM0YK7sFHlDdMPD9838D9MWN
         ByXCpDVxml9iiareQRw331U4c0bk/1RGnxX0VuRlGGJQ572gwcagNqO5MkT2ZPyUFL1X
         +bG079KhZdLHKXBShPkPCYEtV5Hs1KvIuESEcqtUimpYcTH/0AY9oKcQ+NXngTmNn14z
         8jHstFepss0yYiPlLQM19X7dAiA0He1APzJdJ6pv5GDQjbEjxD6YFavMpJSOp9JZgdjc
         iCzg==
X-Gm-Message-State: APjAAAVKj6dGVWyMggP+63NdnsglanUYmipLsqGKXsMNQ3YNvW57OzFx
        QBQshYNofF+prHykPDE+YQkqSn3v3wKef3xf0RyrIw==
X-Google-Smtp-Source: APXvYqzqU/F07ymu26y3wzz4LzZT9rViZ7WXalWyhvVhQn5YOCxaUTOecm3ES51/ys9UBeyBKfROQ6Qoa/PrAZ8/z3s=
X-Received: by 2002:a17:902:f094:: with SMTP id go20mr33403563plb.159.1556121966836;
 Wed, 24 Apr 2019 09:06:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAAeHK+z+d=Gh4j1VSsEtLuYUpd7-T3Cu1ww0-5otSE5kDTgMGA@mail.gmail.com>
 <20190419083529.GD28648@kroah.com>
In-Reply-To: <20190419083529.GD28648@kroah.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Wed, 24 Apr 2019 18:05:55 +0200
Message-ID: <CAAeHK+zOg=SKynp85f9xQm56V1NzDrECaxBBu8UcBj_HBj9=+Q@mail.gmail.com>
Subject: Re: USB fuzzing with syzbot
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        USB list <linux-usb@vger.kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Kostya Serebryany <kcc@google.com>,
        Alexander Potapenko <glider@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Apr 19, 2019 at 10:35 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Apr 17, 2019 at 06:33:39PM +0200, Andrey Konovalov wrote:
> > Hi,
> >
> > As you might have noticed, syzbot has started reporting bugs in the
> > USB subsystem that can be triggered externally by a malicious USB
> > device. Right now the fuzzing is done via a GadgetFS-like interface to
> > emulate USB devices through the USB Gadget subsystem and the Dummy
> > HCD/UDC module to "loopback" connect those devices to the running
> > kernel. There are more details in my OffensiveCon talk [1], [2].
> >
> > A few questions/comments:
> >
> > 1. Which tree should we use for testing?
> >
> > Right now we're targeting the upstream tree, but we can switch to some
> > USB development tree, where the fixes are likely to end up earlier.
>
> USB fixes land in the usb.git tree on git.kernel.org in the usb-testing
> branch (for the next release), and in the usb-linus branch (for this
> release).

OK, I've switched to the usb-linus branch of the usb.git tree, since I
see that all Alan's fixes went in that one.

>
> So you can just merge those two branches together if you like to be sure
> you have all of the latest fixes.
>
> > 2. Is there an easy way to figure out which config options enable
> > drivers reachable over USB?
>
> Looking for all options that depend on USB is a good start.
>
> > Right now our kernel config is based on one of the Debian kernel
> > configs, that supposedly enables enough relevant USB drivers. At the
> > same time it enables a lot of other unnecessary stuff, which makes the
> > kernel big and long to compile. Ideally, we would to have a way to
> > auto-generate a kernel config that enables all the relevant (enabled
> > by at least one of the distros) USB drivers. I've looked at whether
> > it's possible to figure out which particular options in some kernel
> > config are related to USB, but it seems that neither the option names,
> > nor the way they are grouped in the config file, are representative
> > enough.
>
> Yeah, it's hard to just carve out this type of configuration, but here's
> what I have done in the past to try to be sure I enabled all USB drivers
> in my kernel configuration.
>
> First, start with a "minimally working configuration" by running:
>         make localmodconfig
> on a working system, with the needed modules for booting and operating
> properly already loaded.
>
> That gives you a .config file that should take only minutes to build,
> compared to much longer for the normal distro configuration (also be
> sure to disable some debugging options so you don't spend extra time
> building and stripping symbols).
>
> Boot and make sure that configuration works.
>
> Then, take that .config and do:
>         - disable USB from the configuration by deleting the:
>                 CONFIG_USB_SUPPORT=y
>           option from your .config
>         - run 'make oldconfig' to disable all USB drivers
>         - turn USB back on by setting CONFIG_USB_SUPPORT=y back on in
>           your .config
>         - run 'make oldconfig' and answer 'y' or 'm' to all of the
>           driver options you are presented with.
>
> That usually catches almost all of them.  Sometimes you need to make
> sure you have some other subsystem enabled (like SCSI), but odds are, if
> you start with a "normally stripped down" configuration that works, you
> should be fine.

I suspect that make localmodconfig (+ switching CONFIG_USB_SUPPORT off
and on) would likely include a lot of stuff that we don't need (there
are many options that are =y, but not related to USB at all), but it
definitely sounds better than what I have right now (converting almost
all =m into =y). I'll give it a shot, thanks!

>
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
>
> thanks,
>
> greg k-h
