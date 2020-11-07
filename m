Return-Path: <SRS0=DEdg=EN=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A97BC4741F
	for <linux-usb@archiver.kernel.org>; Sat,  7 Nov 2020 08:22:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E2CD42151B
	for <linux-usb@archiver.kernel.org>; Sat,  7 Nov 2020 08:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604737334;
	bh=CkbprsLnaQeBBm6DUnL6INt3t6GokDjSX4nOC4dcFLA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=HpmmIVhDCC0WU/SS0TmVSDEfnX/SIra2ha7KALJdkV2sPItxnI1QA065jOA2t6T17
	 MAYsLFrfAw1XvP3ZtR/KRpEql17LZzh5OpkLk7fUTk5Dg/pt74eCjjYypLxlECIUTw
	 7qc2XKNs80yeWAG5JI/JauFOou0qDLMl8Wjia3qU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728034AbgKGIWL (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 7 Nov 2020 03:22:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:46732 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727833AbgKGIWK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 7 Nov 2020 03:22:10 -0500
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9DC50208E4;
        Sat,  7 Nov 2020 08:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604737330;
        bh=CkbprsLnaQeBBm6DUnL6INt3t6GokDjSX4nOC4dcFLA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WNID+V9NRHfr44zwSVrr+mO/v5e+giuAfKqMgQ/LtJSX3R/HDPlgV6lqW8xG5Hbe2
         28fVsWz4pfUvCdHpSVFM7cbEzEkPFOnjwsv/biK2xEIzpdK4mpMrmOyYoPc1yUmi2v
         3hq9EAcqvxDhv2Pw+IcNpc5iR2589AlzUhvL6gl8=
Date:   Sat, 7 Nov 2020 09:22:06 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Eric Biggers <ebiggers@kernel.org>
Cc:     syzbot <syzbot+92340f7b2b4789907fdb@syzkaller.appspotmail.com>,
        andreyknvl@google.com, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, rafael@kernel.org,
        syzkaller-bugs@googlegroups.com
Subject: Re: WARNING in input_register_device
Message-ID: <20201107082206.GA19079@kroah.com>
References: <000000000000872b5405b36f8e31@google.com>
 <20201106140336.GA3319902@kroah.com>
 <20201106170314.GA845@sol.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201106170314.GA845@sol.localdomain>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Nov 06, 2020 at 09:03:14AM -0800, Eric Biggers wrote:
> On Fri, Nov 06, 2020 at 03:03:36PM +0100, Greg KH wrote:
> > On Fri, Nov 06, 2020 at 04:43:17AM -0800, syzbot wrote:
> > > Hello,
> > > 
> > > syzbot found the following issue on:
> > > 
> > > HEAD commit:    9e39aef3 usb: misc: brcmstb-usb-pinmap: Make sync_all_pins..
> > > git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> > > console output: https://syzkaller.appspot.com/x/log.txt?x=145ffa8a500000
> > > kernel config:  https://syzkaller.appspot.com/x/.config?x=a05f5efbb00b1465
> > > dashboard link: https://syzkaller.appspot.com/bug?extid=92340f7b2b4789907fdb
> > > compiler:       gcc (GCC) 10.1.0-syz 20200507
> > > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=172ae7a8500000
> > > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13b24746500000
> > > 
> > > IMPORTANT: if you fix the issue, please add the following tag to the commit:
> > > Reported-by: syzbot+92340f7b2b4789907fdb@syzkaller.appspotmail.com
> > > 
> > > microsoft 0003:045E:07DA.0001: unknown main item tag 0x0
> > > HID 045e:07da: Invalid code 65791 type 1
> > > ------------[ cut here ]------------
> > > init_uevent_argv: buffer size too small
> > > WARNING: CPU: 0 PID: 5 at lib/kobject_uevent.c:259 init_uevent_argv lib/kobject_uevent.c:259 [inline]
> > > WARNING: CPU: 0 PID: 5 at lib/kobject_uevent.c:259 kobject_uevent_env+0x1640/0x1680 lib/kobject_uevent.c:608
> > 
> > You gave it a device with a buffer that was "too small", and it rejected
> > it.
> > 
> > Which, aside from the huge warning message, is to be expected, so I
> > don't think this is really a bug here.
> > 
> 
> The purpose of WARN is for reporting recoverable kernel bugs.  So a reachable
> WARN is a bug.  Either it is reporting one, or the bug is that the use of WARN
> is wrong.

In the past, as you know, we have thought that hardware issues like this
are a "recoverable bug but someone better do something about it".  Now
that we can fake hardware devices so easily, it's probably better to
just knock this down to a dev_warn() and keep on moving.

If I get a chance, I'll write up a patch today, but anyone else should
feel free to also do it.

thanks,

greg k-h
