Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0338C433ED
	for <linux-usb@archiver.kernel.org>; Tue, 13 Apr 2021 16:57:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C43696135C
	for <linux-usb@archiver.kernel.org>; Tue, 13 Apr 2021 16:57:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346953AbhDMQ5t (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 13 Apr 2021 12:57:49 -0400
Received: from netrider.rowland.org ([192.131.102.5]:39743 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S238598AbhDMQ5p (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Apr 2021 12:57:45 -0400
Received: (qmail 1462034 invoked by uid 1000); 13 Apr 2021 12:57:25 -0400
Date:   Tue, 13 Apr 2021 12:57:24 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     syzbot <syzbot+eb4674092e6cc8d9e0bd@syzkaller.appspotmail.com>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Subject: Re: [syzbot] general protection fault in gadget_setup
Message-ID: <20210413165724.GD1454681@rowland.harvard.edu>
References: <00000000000075c58405bfd6228c@google.com>
 <CACT4Y+bTjQz=RBXVNrVMQ9xPz5CzGNBE854fsb0ukS-2_wdi3Q@mail.gmail.com>
 <20210413161311.GC1454681@rowland.harvard.edu>
 <CACT4Y+YEw4iJPxY4b6LPXrU91TODfu09dG=53exvQkwjPBg23w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACT4Y+YEw4iJPxY4b6LPXrU91TODfu09dG=53exvQkwjPBg23w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Apr 13, 2021 at 06:47:47PM +0200, Dmitry Vyukov wrote:
> On Tue, Apr 13, 2021 at 6:13 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> > Hopefully this patch will make the race a lot more likely to occur.  Is
> > there any way to tell syzkaller to test it, despite the fact that
> > syzkaller doesn't think it has a reproducer for this issue?
> 
> If there is no reproducer the only way syzbot can test it is if it's
> in linux-next under CONFIG_DEBUG_AID_FOR_SYZBOT:
> http://bit.do/syzbot#no-custom-patches

There _is_ a theoretical reproducer: the test that provoked syzkaller's 
original bug report.  But syzkaller doesn't realize that it is (or may 
be) a reproducer.

It ought to be possible to ask syzkaller to run a particular test that 
it has done before, with a patch applied -- and without having to add 
anything to linux-next.

Alan Stern
