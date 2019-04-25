Return-Path: <SRS0=WMKl=S3=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,T_DKIMWL_WL_HIGH,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A93E4C43219
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 14:25:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A36392077C
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 14:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556202354;
	bh=rTeAolsAvvk41cjk44y1F4qpwyBD7MAORyG56/7wJYs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Z+0Y9nafQnL6swPjVsmg2iG6lGdQyGLjc0g+N8DHTlLJy8mpVkCA9R1iBkKeq5hd5
	 K38W4M0ZzBa+oM74Aoro38QAN0FAzTRr8fr3BPDVqsvHC5H9UDTMz/5ySixyeyoNsE
	 4MLH1oj7UPOlpS3kAl1tSNqOgxHh9QYyzZF+gdAg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726048AbfDYOZy (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 25 Apr 2019 10:25:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:37930 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725959AbfDYOZx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 25 Apr 2019 10:25:53 -0400
Received: from localhost (62-193-50-229.as16211.net [62.193.50.229])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 208C6206C1;
        Thu, 25 Apr 2019 14:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556202352;
        bh=rTeAolsAvvk41cjk44y1F4qpwyBD7MAORyG56/7wJYs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eB/0Ync1khk47r+blPiIMlXSDCJriZOfQT++/he3myBEzXZ3t+TnUEGUZWqfurH3F
         hw63WNGJWnx2xSgHV6rbuxMunIM5ncrBUqTrLvu72EgX9chVamw2ns3V5EffOj6AdS
         7Xf/Zau0daaVTYbqMu8UTOdFu+2dnWnQVibSXKxc=
Date:   Thu, 25 Apr 2019 16:25:16 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Andrey Konovalov <andreyknvl@google.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        USB list <linux-usb@vger.kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Kostya Serebryany <kcc@google.com>,
        Alexander Potapenko <glider@google.com>
Subject: Re: USB fuzzing with syzbot
Message-ID: <20190425142516.GA28336@kroah.com>
References: <CAAeHK+z+d=Gh4j1VSsEtLuYUpd7-T3Cu1ww0-5otSE5kDTgMGA@mail.gmail.com>
 <20190419083529.GD28648@kroah.com>
 <CAAeHK+zOg=SKynp85f9xQm56V1NzDrECaxBBu8UcBj_HBj9=+Q@mail.gmail.com>
 <CAAeHK+xGGfK03UqNKhXsogTer3dBNbvEEOk4y3dN0Y-xkcOz8Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAeHK+xGGfK03UqNKhXsogTer3dBNbvEEOk4y3dN0Y-xkcOz8Q@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Apr 25, 2019 at 02:44:11PM +0200, Andrey Konovalov wrote:
> On Wed, Apr 24, 2019 at 6:05 PM Andrey Konovalov <andreyknvl@google.com> wrote:
> >
> > On Fri, Apr 19, 2019 at 10:35 AM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > > 2. Is there an easy way to figure out which config options enable
> > > > drivers reachable over USB?
> > >
> > > Looking for all options that depend on USB is a good start.
> > >
> > > > Right now our kernel config is based on one of the Debian kernel
> > > > configs, that supposedly enables enough relevant USB drivers. At the
> > > > same time it enables a lot of other unnecessary stuff, which makes the
> > > > kernel big and long to compile. Ideally, we would to have a way to
> > > > auto-generate a kernel config that enables all the relevant (enabled
> > > > by at least one of the distros) USB drivers. I've looked at whether
> > > > it's possible to figure out which particular options in some kernel
> > > > config are related to USB, but it seems that neither the option names,
> > > > nor the way they are grouped in the config file, are representative
> > > > enough.
> > >
> > > Yeah, it's hard to just carve out this type of configuration, but here's
> > > what I have done in the past to try to be sure I enabled all USB drivers
> > > in my kernel configuration.
> > >
> > > First, start with a "minimally working configuration" by running:
> > >         make localmodconfig
> > > on a working system, with the needed modules for booting and operating
> > > properly already loaded.
> > >
> > > That gives you a .config file that should take only minutes to build,
> > > compared to much longer for the normal distro configuration (also be
> > > sure to disable some debugging options so you don't spend extra time
> > > building and stripping symbols).
> > >
> > > Boot and make sure that configuration works.
> > >
> > > Then, take that .config and do:
> > >         - disable USB from the configuration by deleting the:
> > >                 CONFIG_USB_SUPPORT=y
> > >           option from your .config
> > >         - run 'make oldconfig' to disable all USB drivers
> > >         - turn USB back on by setting CONFIG_USB_SUPPORT=y back on in
> > >           your .config
> > >         - run 'make oldconfig' and answer 'y' or 'm' to all of the
> > >           driver options you are presented with.
> > >
> > > That usually catches almost all of them.  Sometimes you need to make
> > > sure you have some other subsystem enabled (like SCSI), but odds are, if
> > > you start with a "normally stripped down" configuration that works, you
> > > should be fine.
> >
> > I suspect that make localmodconfig (+ switching CONFIG_USB_SUPPORT off
> > and on) would likely include a lot of stuff that we don't need (there
> > are many options that are =y, but not related to USB at all), but it
> > definitely sounds better than what I have right now (converting almost
> > all =m into =y). I'll give it a shot, thanks!
> 
> I've tried this and unfortunately it doesn't work as desired. The
> reason is that localmodconfig will only enable options for the modules
> that are currently loaded, and if a module that some USB driver
> depends on is not loaded, then this driver won't be enabled after yes
> | make oldconfig. For example my machine didn't have the cfg80211
> module loaded, and thus e.g. CONFIG_AT76C50X_USB didn't get enabled
> after oldconfig. However when I plug in a wireless USB adapter,
> cfg80211 gets loaded together with the USB driver for that adapter. I
> guess the same applies to other kinds of dependency modules (e.g.
> bluetooth). So this would only work if all the dependency modules are
> already loaded.

Yes, sorry, I thought I said that with:

> > > First, start with a "minimally working configuration" by running:
> > >         make localmodconfig
> > > on a working system, with the needed modules for booting and operating
> > > properly already loaded.

I guess "working system" implied everything that you _knew_ you wanted
to have loaded :)

Sorry about the dependancy mess, hopefully you have sorted this out
better now.

thanks,

greg k-h
