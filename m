Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9223C636D4
	for <linux-usb@archiver.kernel.org>; Tue, 14 Feb 2023 02:03:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231160AbjBNCDW (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 13 Feb 2023 21:03:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229632AbjBNCDV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Feb 2023 21:03:21 -0500
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id A5701113F6
        for <linux-usb@vger.kernel.org>; Mon, 13 Feb 2023 18:03:15 -0800 (PST)
Received: (qmail 930176 invoked by uid 1000); 13 Feb 2023 21:03:14 -0500
Date:   Mon, 13 Feb 2023 21:03:14 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Boqun Feng <boqun.feng@gmail.com>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Kent Overstreet <kent.overstreet@linux.dev>,
        Kent Overstreet <kent.overstreet@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Coly Li <colyli@suse.de>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        syzkaller <syzkaller@googlegroups.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Ingo Molnar <mingo@redhat.com>,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        Hillf Danton <hdanton@sina.com>
Subject: Re: [PATCH RFC] drivers/core: Replace lockdep_set_novalidate_class()
 with unique class keys
Message-ID: <Y+rr4p6njVOTSYxs@rowland.harvard.edu>
References: <Y+gjuqJ5RFxwLmht@moria.home.lan>
 <Y+hRurRwm//1+IcK@rowland.harvard.edu>
 <Y+hTEtCKPuO0zGIt@moria.home.lan>
 <Y+hW74TAVzCpSv7c@rowland.harvard.edu>
 <Y+hYn6uzIUBaxDdV@moria.home.lan>
 <Y+kEgDLSRwdODRdD@rowland.harvard.edu>
 <Y+oBveWO2z6xdTW/@hirez.programming.kicks-ass.net>
 <Y+pWhyFJeE93nlWd@rowland.harvard.edu>
 <Y+plfZnEqw6mG+XH@hirez.programming.kicks-ass.net>
 <Y+rpD7QPheQQ8Lxj@boqun-archlinux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y+rpD7QPheQQ8Lxj@boqun-archlinux>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Feb 13, 2023 at 05:51:11PM -0800, Boqun Feng wrote:
> Basically if you have two lock instances A and B with the same class,
> and you know that locking ordering is always A -> B, then you can do
> 
> 	mutex_lock(A);
> 	mutex_lock_nest_lock(B, A); // lock B.
> 
> to tell the lockdep this is not deadlock, plus lockdep will treat the
> acquisition of A and the precondition of acquisition B, so the following
> is not a deadlock as well:
> 
> T1:
> 	mutex_lock(A);
> 	mutex_lock(C);
> 	mutex_lock_nest_lock(B, A);
> 
> T2:
> 	mutex_lock(A);
> 	mutex_lock_nest_lock(B, A);
> 	mutex_lock(C);

Why isn't this treated as a deadlock?  It sure looks like a deadlock to 
me.  Is this an example where lockdep just doesn't get the right answer?

Alan Stern
