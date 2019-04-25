Return-Path: <SRS0=WMKl=S3=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	T_DKIMWL_WL_MED,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC1D5C10F03
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 12:44:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9156520644
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 12:44:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jp4c3lma"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387880AbfDYMoZ (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 25 Apr 2019 08:44:25 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:36854 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387827AbfDYMoY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Apr 2019 08:44:24 -0400
Received: by mail-pg1-f195.google.com with SMTP id 85so11170670pgc.3
        for <linux-usb@vger.kernel.org>; Thu, 25 Apr 2019 05:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vysJTc3VIIALTU1K+5KCAcK6aFYXy/xvUF+hyLLe65I=;
        b=jp4c3lma986L6/SD+jRfkyWEO3PbEAARqWeJ/8eC/UbSlC0EncVn3G205AYMb+B0II
         0QhXKwu8THR5+F7y+q6JvNa+q2ubH5DXEFa9C1ZHYRwfV5li65KEF7buo0MRwfQRZf0r
         Q1s1BXVOSzlsYcbDCoqS5D+Sv1M5SMtb2HMjQrZgter4zNBN7caJZgfr/MZm4p2ZrsmJ
         29tteWrW7Kz3j2z+XIKCZ/mvRqQHSD12LrOs7XBmxgjosDGsFNS2jRaRO2Ynf+vtb6tl
         UjxMdAZi/3iqE5nF4bZLCotJTErCGEnMvD5hFeAbt5/0rYANJlg8QQGI3RL0H3oU3RFT
         0RPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vysJTc3VIIALTU1K+5KCAcK6aFYXy/xvUF+hyLLe65I=;
        b=ryIwXkYpQ0nZbqIytCB04r7lLA2vwD8MUwRSI73eXUEEqvJbO+nqWTnDhj6Z3sCBPw
         ddQyFMC0IdioMUntIb2pcXD+slU/C6rFKvyNskMYrcY9+tiZhvW0Kl3Ai4xsu8vgzNZt
         4M/GVS6BF+nouOw/7+tmO25Ul/in5Dv10JxSUV+NpLGf9k+x33lKGimm2iq3mHmaWoCW
         fMQa+PyAf+KJm+Wi316ykwnYL9L5Tg+oeuFPWmPYul06HLahsm83zlc9uKWC59Q+9xb0
         k49QeL1rYOFkMln5tru49rcEo5zdHOBGQ0OzKuiAbTs4MArNWzQGj0z2xyPaNFWPddxI
         et4Q==
X-Gm-Message-State: APjAAAUjz1Y02+ZYe9DKQ1SB0qPAkVQqyS8HQhBSRv1ASlQVowrYI9xk
        coRxEiFv85WOOBisF6N6+/q3NQJcJW7t1dK1iLX8dA==
X-Google-Smtp-Source: APXvYqzZ/q4k0HKrjCuJIkIpox84XCdCh4/DvE/xYp1VqzcxKWJd8m7Ha0NB/1cfg4T0QaRKQ4qwSTpb0vbpIMG83Ok=
X-Received: by 2002:aa7:8289:: with SMTP id s9mr39902638pfm.208.1556196262640;
 Thu, 25 Apr 2019 05:44:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAAeHK+z+d=Gh4j1VSsEtLuYUpd7-T3Cu1ww0-5otSE5kDTgMGA@mail.gmail.com>
 <20190419083529.GD28648@kroah.com> <CAAeHK+zOg=SKynp85f9xQm56V1NzDrECaxBBu8UcBj_HBj9=+Q@mail.gmail.com>
In-Reply-To: <CAAeHK+zOg=SKynp85f9xQm56V1NzDrECaxBBu8UcBj_HBj9=+Q@mail.gmail.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Thu, 25 Apr 2019 14:44:11 +0200
Message-ID: <CAAeHK+xGGfK03UqNKhXsogTer3dBNbvEEOk4y3dN0Y-xkcOz8Q@mail.gmail.com>
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

On Wed, Apr 24, 2019 at 6:05 PM Andrey Konovalov <andreyknvl@google.com> wrote:
>
> On Fri, Apr 19, 2019 at 10:35 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > > 2. Is there an easy way to figure out which config options enable
> > > drivers reachable over USB?
> >
> > Looking for all options that depend on USB is a good start.
> >
> > > Right now our kernel config is based on one of the Debian kernel
> > > configs, that supposedly enables enough relevant USB drivers. At the
> > > same time it enables a lot of other unnecessary stuff, which makes the
> > > kernel big and long to compile. Ideally, we would to have a way to
> > > auto-generate a kernel config that enables all the relevant (enabled
> > > by at least one of the distros) USB drivers. I've looked at whether
> > > it's possible to figure out which particular options in some kernel
> > > config are related to USB, but it seems that neither the option names,
> > > nor the way they are grouped in the config file, are representative
> > > enough.
> >
> > Yeah, it's hard to just carve out this type of configuration, but here's
> > what I have done in the past to try to be sure I enabled all USB drivers
> > in my kernel configuration.
> >
> > First, start with a "minimally working configuration" by running:
> >         make localmodconfig
> > on a working system, with the needed modules for booting and operating
> > properly already loaded.
> >
> > That gives you a .config file that should take only minutes to build,
> > compared to much longer for the normal distro configuration (also be
> > sure to disable some debugging options so you don't spend extra time
> > building and stripping symbols).
> >
> > Boot and make sure that configuration works.
> >
> > Then, take that .config and do:
> >         - disable USB from the configuration by deleting the:
> >                 CONFIG_USB_SUPPORT=y
> >           option from your .config
> >         - run 'make oldconfig' to disable all USB drivers
> >         - turn USB back on by setting CONFIG_USB_SUPPORT=y back on in
> >           your .config
> >         - run 'make oldconfig' and answer 'y' or 'm' to all of the
> >           driver options you are presented with.
> >
> > That usually catches almost all of them.  Sometimes you need to make
> > sure you have some other subsystem enabled (like SCSI), but odds are, if
> > you start with a "normally stripped down" configuration that works, you
> > should be fine.
>
> I suspect that make localmodconfig (+ switching CONFIG_USB_SUPPORT off
> and on) would likely include a lot of stuff that we don't need (there
> are many options that are =y, but not related to USB at all), but it
> definitely sounds better than what I have right now (converting almost
> all =m into =y). I'll give it a shot, thanks!

I've tried this and unfortunately it doesn't work as desired. The
reason is that localmodconfig will only enable options for the modules
that are currently loaded, and if a module that some USB driver
depends on is not loaded, then this driver won't be enabled after yes
| make oldconfig. For example my machine didn't have the cfg80211
module loaded, and thus e.g. CONFIG_AT76C50X_USB didn't get enabled
after oldconfig. However when I plug in a wireless USB adapter,
cfg80211 gets loaded together with the USB driver for that adapter. I
guess the same applies to other kinds of dependency modules (e.g.
bluetooth). So this would only work if all the dependency modules are
already loaded.
