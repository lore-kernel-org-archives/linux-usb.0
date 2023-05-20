Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0A3EC77B7D
	for <linux-usb@archiver.kernel.org>; Sat, 20 May 2023 15:06:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231716AbjETPG1 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 20 May 2023 11:06:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231643AbjETPGZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 20 May 2023 11:06:25 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 2D1FD115
        for <linux-usb@vger.kernel.org>; Sat, 20 May 2023 08:06:24 -0700 (PDT)
Received: (qmail 73707 invoked by uid 1000); 20 May 2023 11:06:23 -0400
Date:   Sat, 20 May 2023 11:06:23 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     syzbot <syzbot+e761775e8f4a28711f19@syzkaller.appspotmail.com>
Cc:     andreyknvl@google.com, charu@tickmarks.net,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] INFO: task hung in usb_register_dev
Message-ID: <32b49d74-16df-4f8e-9956-c7705a900ee9@rowland.harvard.edu>
References: <0000000000003a41f705a9c74dfa@google.com>
 <00000000000041730905fc1940ff@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00000000000041730905fc1940ff@google.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, May 19, 2023 at 10:24:25PM -0700, syzbot wrote:
> syzbot suspects this issue was fixed by commit:
> 
> commit df05a9b05e466a46725564528b277d0c570d0104
> Author: Alan Stern <stern@rowland.harvard.edu>
> Date:   Mon Apr 10 19:38:22 2023 +0000
> 
>     USB: sisusbvga: Add endpoint checks
> 
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1286f641280000
> start commit:   7d2a07b76933 Linux 5.14
> git tree:       upstream
> kernel config:  https://syzkaller.appspot.com/x/.config?x=b04081cf516e2565
> dashboard link: https://syzkaller.appspot.com/bug?extid=e761775e8f4a28711f19
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=133519b1300000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=116ec82e300000
> 
> If the result looks correct, please mark the issue as fixed by replying with:
> 
> #syz fix: USB: sisusbvga: Add endpoint checks
> 
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection

If that commit does fix this problem, it's entirely by accident.  I 
suspect that instead the commit merely prevents the reproducer from 
entering the buggy pathway, but that pathway still exists.

In fact, I'd guess from reading through the driver that the problem is 
that it does dozens of I/O operations, with 5-second timeouts and 
multiple retries, without checking for errors until the end.  All while 
holding a contested mutex.

However the driver is not maintained much AFAICT, so it's not likely to 
get fixed.  It's probably also not used by more than a few people, if 
any.

Alan Stern
