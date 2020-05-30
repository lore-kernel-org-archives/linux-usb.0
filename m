Return-Path: <SRS0=uWyP=7M=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7D1FC433DF
	for <linux-usb@archiver.kernel.org>; Sat, 30 May 2020 15:47:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CC20620722
	for <linux-usb@archiver.kernel.org>; Sat, 30 May 2020 15:47:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729038AbgE3Pra (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 30 May 2020 11:47:30 -0400
Received: from netrider.rowland.org ([192.131.102.5]:38139 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728927AbgE3Pr3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 30 May 2020 11:47:29 -0400
Received: (qmail 30101 invoked by uid 1000); 30 May 2020 11:47:28 -0400
Date:   Sat, 30 May 2020 11:47:28 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     Andrey Konovalov <andreyknvl@google.com>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Colin Ian King <colin.king@canonical.com>,
        Arnd Bergmann <arnd@arndb.de>,
        USB list <linux-usb@vger.kernel.org>,
        syzbot <syzbot+854768b99f19e89d7f81@syzkaller.appspotmail.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Subject: Re: [PATCH] USB: cdc-wdm: Call wake_up_all() when clearing
 WDM_IN_USE bit.
Message-ID: <20200530154728.GB29298@rowland.harvard.edu>
References: <1590408381.2838.4.camel@suse.com>
 <4a686d9a-d09f-44f3-553c-bcf0bd8a8ea1@i-love.sakura.ne.jp>
 <082ae642-0703-6c26-39f6-d725e395ef9a@i-love.sakura.ne.jp>
 <CAAeHK+ww0YLUKGjQF5KfzoUUsdfLJdv5guUXRq4q46VfPiQubQ@mail.gmail.com>
 <27b7545e-8f41-10b8-7c02-e35a08eb1611@i-love.sakura.ne.jp>
 <CAAeHK+ww0u0G94z_Y7VXLCVTQVZ9thO0q69n+Fj3jKT6MtpPng@mail.gmail.com>
 <20200528194057.GA21709@rowland.harvard.edu>
 <CAAeHK+ySAnU03cvg1=+yHh0YK1UFO4mrv-N9FcDDMt_0AfGZSQ@mail.gmail.com>
 <20200528205807.GB21709@rowland.harvard.edu>
 <1590852311.14886.3.camel@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1590852311.14886.3.camel@suse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, May 30, 2020 at 05:25:11PM +0200, Oliver Neukum wrote:
> Am Donnerstag, den 28.05.2020, 16:58 -0400 schrieb Alan Stern:
> > On Thu, May 28, 2020 at 09:51:35PM +0200, Andrey Konovalov wrote:
> 
> > > > I don't understand what the problem is.  Can you explain in more general
> > > > terms -- nothing specific to wdm or anything like that -- what you are
> > > > concerned about?  Is this something that could happen to any gadget
> > > > driver?  Or any USB class device driver?  Or does it only affect
> > > > usespace components of raw-gadget drivers?
> > > 
> > > So, AFAIU, we have a driver whose flush() callback blocks on
> > > wait_event(), which can only terminate when either 1) the driver
> > > receives a particular USB response from the device or 2) the device
> > > disconnects.
> > 
> > This sounds like a bug in the driver.  What would it do if someone had a 
> 
> Arguably yes. I will introduce a timeout. Unfortunately flush()
> requires a non-interruptible sleep, as you cannot sanely return EAGAIN.

But maybe you can kill some URBs and drop some data.

Alan Stern
