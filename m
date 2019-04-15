Return-Path: <SRS0=TXFt=SR=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,T_DKIMWL_WL_MED,URIBL_BLOCKED,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A333C10F0E
	for <linux-usb@archiver.kernel.org>; Mon, 15 Apr 2019 19:35:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EADFF20818
	for <linux-usb@archiver.kernel.org>; Mon, 15 Apr 2019 19:35:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h3/ILorc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728816AbfDOTf1 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 15 Apr 2019 15:35:27 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:38379 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728349AbfDOTfU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 15 Apr 2019 15:35:20 -0400
Received: by mail-pl1-f196.google.com with SMTP id f36so9071469plb.5
        for <linux-usb@vger.kernel.org>; Mon, 15 Apr 2019 12:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+ls/GUTFHxmWqNfbL8nZPHO/mEsZK+0BWBT3eOnQ4Qs=;
        b=h3/ILorcTzTxllmLWIGP0BOGGDDA73Gwspt4hAlZrWzW4MCVkvokEi/eeXwp+0WPpc
         +p/MQ30G89WjUmX/muWwWpO1A9Wdj1RfY5YT0NEqXpDTikCPGj2pKFb8ssUkh6BrI0cJ
         DiIU4TsB+ko2elGnsPnQIvdPVe7Yg95X2PlCQpAowzj/O3O/nX96gb9cRP17TGlUh00G
         9skfECkbRINt6+ZjxPpanM+V/udpVtXOym01rAqSLLOpebeAC2Do+s1fEgVzArIGiKev
         8sE/CJBZ/76iZEIfaPOe9haJzcX10esIBCaF9tjwMciYa+iblqnvN5+P7ZbW29pDrHsb
         VJRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+ls/GUTFHxmWqNfbL8nZPHO/mEsZK+0BWBT3eOnQ4Qs=;
        b=BYK/spI42nRy1X0YwkKvjaxQiIu6FH3bd3cNgg6cH7jYyldI7FybXJqGiJp1InxVwA
         XunGWVviMS0G1kkyhGKixx0s+ycAc+dGIoR2e3dWxhazqssXVJpIxQXJI1A4wZWnCE/h
         Aofp/cqi7i+iXyXRGwYyaO3rSpxANd28uaS3nRtA+Y5h9ZBAjOZvJWz9x/BMQmW6F6by
         XrfiWYuD7C1qyH7kCFcCIhRk+C3jfOpX5nMynt7Y2MdGCA3hzwFeszfr8jBruK0QVhw8
         uM9D4Hy4KPz3ofsenF+GykBfxeTlvtHvjpqVnKbddU4ZVsT620uXojj2Qj6FNGucYa0E
         kseQ==
X-Gm-Message-State: APjAAAW23rfH22pKPqXtzzvPEqik/Nf/R2YSEyijbClT24Y7v+uOxhDW
        yu8S1aHUdyf8dt9XhdIyIegGakaAGhyXnL1H9SXxeQ==
X-Google-Smtp-Source: APXvYqz8HDSJaoiNXjgVa9if3F4CzpMv18WCnMzhEjEajxJp+JjMXa6KXRAW0hf6jqctigS8e/kcyP8nXbY/EOjiK/Y=
X-Received: by 2002:a17:902:b48c:: with SMTP id y12mr75396478plr.280.1555356919335;
 Mon, 15 Apr 2019 12:35:19 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000006f1596058653d991@google.com> <Pine.LNX.4.44L0.1904121540001.1283-100000@iolanthe.rowland.org>
 <CAAeHK+wrF8Oh7ur+BcuyARvm2sx6KNVGFxqKHoyajApN+tOA_g@mail.gmail.com>
 <52ac871b-ac61-432e-3a85-47b8e97233d2@embeddedor.com> <20190415190054.GA10359@kroah.com>
In-Reply-To: <20190415190054.GA10359@kroah.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Mon, 15 Apr 2019 21:35:08 +0200
Message-ID: <CAAeHK+wgB+HsA_aAtL=ddJB51BNjkkRBHnK8NQ0ke94SLZ+Sqw@mail.gmail.com>
Subject: Re: INFO: task hung in usb_kill_urb
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Kernel development list <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Apr 15, 2019 at 9:09 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Apr 15, 2019 at 01:39:57PM -0500, Gustavo A. R. Silva wrote:
> >
> >
> > On 4/15/19 12:48 PM, Andrey Konovalov wrote:
> > > On Fri, Apr 12, 2019 at 9:46 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> > >>
> > >> Andrey:
> > >>
> > >> It's really hard to tell just what's going on here.
> > >>
> > >> On Fri, 12 Apr 2019, syzbot wrote:
> > >>
> > >>> Hello,
> > >>>
> > >>> syzbot found the following crash on:
> > >>>
> > >>> HEAD commit:    9a33b369 usb-fuzzer: main usb gadget fuzzer driver
> > >>> git tree:       https://github.com/google/kasan/tree/usb-fuzzer
> > >>> console output: https://syzkaller.appspot.com/x/log.txt?x=14c4c1af200000
> > >>> kernel config:  https://syzkaller.appspot.com/x/.config?x=23e37f59d94ddd15
> > >>> dashboard link: https://syzkaller.appspot.com/bug?extid=d919b0f29d7b5a4994b9
> > >>> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> > >>> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14410dbb200000
> > >>> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12f0acd3200000
> > >>>
> > >>> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> > >>> Reported-by: syzbot+d919b0f29d7b5a4994b9@syzkaller.appspotmail.com
> > >>>
> > >>> usb-fuzzer-gadget dummy_udc.0: failed to start USB fuzzer: -22
> > >>> usb-fuzzer-gadget dummy_udc.0: failed to start USB fuzzer: -22
> > >>> usb-fuzzer-gadget dummy_udc.0: failed to start USB fuzzer: -22
> > >>> usb-fuzzer-gadget dummy_udc.0: failed to start USB fuzzer: -22
> > >>> usb-fuzzer-gadget dummy_udc.0: failed to start USB fuzzer: -22
> > >>> INFO: task kworker/0:2:532 blocked for more than 143 seconds.
> > >>>        Not tainted 5.1.0-rc4-319354-g9a33b36 #3
> > >>> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> > >>> kworker/0:2     D26656   532      2 0x80000000
> > >>> Workqueue: usb_hub_wq hub_event
> > >>> Call Trace:
> > >>>   schedule+0x8f/0x180 kernel/sched/core.c:3562
> > >>>   usb_kill_urb drivers/usb/core/urb.c:695 [inline]
> > >>>   usb_kill_urb+0x22a/0x2c0 drivers/usb/core/urb.c:687
> > >>>   usb_start_wait_urb+0x257/0x4d0 drivers/usb/core/message.c:63
> > >>>   usb_internal_control_msg drivers/usb/core/message.c:101 [inline]
> > >>>   usb_control_msg+0x321/0x4a0 drivers/usb/core/message.c:152
> > >>
> > >> It looks like something is stuck waiting for usb_kill_urb() to finish.
> > >> But what happened before that?
> > >
> > > This crash is somewhat special. It happens quite often during USB
> > > fuzzing, but at the same time it's a hang, which makes it a bit harder
> > > debug. I initially thought that is somehow related to my custom USB
> > > fuzzing kernel patches, but then I saw that someone else hit this
> > > issue while doing USB fuzzing in a completely different way that
> > > doesn't require kernel modifications. So it might be an actual issue
> > > in the kernel.
> > >
> > > The full console output is provided by the syzbot, but I guess it's
> > > not very useful in this case. I've just made sure that this issue is
> > > manually reproducible, so we can easily retest it with debug patches
> > > (syzbot should be also able to do that via the syz test command). Or
> > > is there a way to turn on some verbose mode to see some USB debug
> > > messages?
> > >
> > >>
> > >> I can't tell from the reproducer source, because it uses a bunch of
> > >> special stuff you added in your usb-fuzzer tree.
> > >>
> > >> Alan Stern
> > >>
> > >
> > > I understand, for now I guess the simpler way to debug this is to run
> > > the reproducer. I'll write you and Greg a separate email regarding all
> > > that special stuff that I added.
> > >
> >
> > Hi Andrey,
> >
> > Please, CC me on that email too.
>
> Please cc: all of linux-usb@vger.kernel.org, no need to keep anything
> private.

Sure!

>
> thanks,
>
> greg k-h
>
