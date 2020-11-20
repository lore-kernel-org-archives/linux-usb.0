Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A02EDC2D0E4
	for <linux-usb@archiver.kernel.org>; Fri, 20 Nov 2020 17:01:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4BD31221EB
	for <linux-usb@archiver.kernel.org>; Fri, 20 Nov 2020 17:01:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730197AbgKTRA5 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 20 Nov 2020 12:00:57 -0500
Received: from netrider.rowland.org ([192.131.102.5]:36847 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1729985AbgKTRA4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 20 Nov 2020 12:00:56 -0500
Received: (qmail 622202 invoked by uid 1000); 20 Nov 2020 12:00:55 -0500
Date:   Fri, 20 Nov 2020 12:00:55 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Andrey Konovalov <andreyknvl@google.com>
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
Subject: Re: Re: memory leak in hub_event
Message-ID: <20201120170055.GF619708@rowland.harvard.edu>
References: <20201120165609.GE619708@rowland.harvard.edu>
 <000000000000c49c8b05b48cb833@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000000000000c49c8b05b48cb833@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Nov 20, 2020 at 08:56:11AM -0800, syzbot wrote:
> > On Fri, Nov 20, 2020 at 07:15:20AM -0800, syzbot wrote:
> >> Hello,
> >> 
> >> syzbot found the following issue on:
> >> 
> >> HEAD commit:    4d02da97 Merge tag 'net-5.10-rc5' of git://git.kernel.org/..
> >> git tree:       upstream
> >> console output: https://syzkaller.appspot.com/x/log.txt?x=13a7d2b6500000
> >> kernel config:  https://syzkaller.appspot.com/x/.config?x=c5353ac514ca5a43
> >> dashboard link: https://syzkaller.appspot.com/bug?extid=44e64397bd81d5e84cba
> >> compiler:       gcc (GCC) 10.1.0-syz 20200507
> >> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14925089500000
> >> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16810051500000

> > #syz test: upstream 4d02da97
> 
> "upstream" does not look like a valid git repo address.

Okay, Andrey.  If "upstream" is not accepted as a valid git repo 
address, why does syzkaller list it on the "git tree:" line?  It seems 
to me that syzkaller should be willing to accept as input anything it 
produces as output.

And what repo should I put here?

Alan Stern
