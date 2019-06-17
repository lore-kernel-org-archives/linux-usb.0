Return-Path: <SRS0=mHtA=UQ=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CFF4C31E5B
	for <linux-usb@archiver.kernel.org>; Mon, 17 Jun 2019 17:28:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DFAD5208C0
	for <linux-usb@archiver.kernel.org>; Mon, 17 Jun 2019 17:28:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726215AbfFQR2F (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 17 Jun 2019 13:28:05 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:55896 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726004AbfFQR2F (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 Jun 2019 13:28:05 -0400
Received: (qmail 5640 invoked by uid 2102); 17 Jun 2019 13:28:04 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 17 Jun 2019 13:28:04 -0400
Date:   Mon, 17 Jun 2019 13:28:04 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Andrea Vai <andrea.vai@unipv.it>
cc:     Greg KH <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>
Subject: Re: Slow I/O on USB media
In-Reply-To: <6ff3332b940f02d988d9bc578c1c293e8424e439.camel@unipv.it>
Message-ID: <Pine.LNX.4.44L0.1906171259500.1738-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 17 Jun 2019, Andrea Vai wrote:

> Il giorno lun, 17/06/2019 alle 12.14 -0400, Alan Stern ha scritto:
> > On Mon, 17 Jun 2019, Andrea Vai wrote:
> > 
> > > [...]
> > > 
> > > That happened ALL times, so I never encountered a kernel that made
> > me
> > > say "git bisect good".
> > 
> > Really?  That strongly suggests that the 4.20 kernel also should
> > have
> > been marked bad.  Did you really test it exactly the same way as all
> > the others?  That is, did you go through the entire procedure
> > starting
> > with "git checkout v4.20", then running the build script, then the
> > reboot and "uname -a", and then the test script?
> 
> well, honestly, no, because (sigh) I didn't know the "git checkout"
> command, sorry. I started with building 4.20 from the source
> downloaded with
> 
>  wget https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/snapshot/linux-4.20.tar.gz
> 
> , then said "git bisect good v4.20".
> 
> Is this different from "git checkout v4.20"? I hope it is, so we have
> found the mistake I have done.

In theory the results should be exactly the same.  But it doesn't hurt 
to check.

> > Compare the mainstream 4.20 kernel with the Fedora 4.20.13 kernel.  
> > Also, maybe compare the mainstream 4.20.13 with Fedora's 4.20.13.
> 
> Sorry, what do you mean here by "compare"? And what is the
> "mainstream"? If the mainstream is the one I got with wget, and if
> "compare" means "see if they behave differently", so I have already
> done it and they are both "good".

I was trying to point out that there may be a significant difference
between 4.20 and 4.20.13.  But if you say 4.20 behaves well, this 
doesn't matter.

At any rate, you are some commits you could try (beginning with "git 
checkout <commit>" and then running your scripts):

	c76cd634eb5b
	b1669432b355
	507413a5f88a
	a52fb43a5faa
	38fabca18fc4
	fc2fd5f0f1aa

These are all between 4.20 and 5.0-rc1.

Alan Stern

