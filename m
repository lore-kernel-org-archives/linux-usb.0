Return-Path: <SRS0=gvS/=7Q=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40071C433E1
	for <linux-usb@archiver.kernel.org>; Wed,  3 Jun 2020 15:22:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1A53B207D5
	for <linux-usb@archiver.kernel.org>; Wed,  3 Jun 2020 15:22:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lV4LTO8Z"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726177AbgFCPV4 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 3 Jun 2020 11:21:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726011AbgFCPVz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 3 Jun 2020 11:21:55 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53250C08C5C0
        for <linux-usb@vger.kernel.org>; Wed,  3 Jun 2020 08:21:55 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id o8so1958339pgm.7
        for <linux-usb@vger.kernel.org>; Wed, 03 Jun 2020 08:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hrMJmm7uV8Kq8FT0QWve+Yk2ZlMASQ0lIxNFVi0I4n8=;
        b=lV4LTO8Z7CECN0h8bLPSecTfQfT3g1oO1DyrfJYHMsdQ+4mpGA7mv1RKZde+dOOwWz
         ip0/JO5ZkcDWESyffNkXU9QiEZp0MvcN54BAffNkFC/7jDB7vEruTcPzxB/SDRH3WGJM
         bf1Kz6QfoMgzuC1uL/1/WqtuG5XyhwbEWMclB94zwrm130ioJTBTLnYP8J8tyg3G9SEh
         X6a1IwOFXv1cGc6gqCqCpQGAYMeGhb8ym2YMZJtjeqmZwBPx9OGctphAbjm5Ztmiy9up
         sOX2sGV8hgfrbWPggLrEtdTgdRpHpYjQwPputqh6xWDNoi8DnGd3nSvfrPCOZzOzNQWn
         Ldmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hrMJmm7uV8Kq8FT0QWve+Yk2ZlMASQ0lIxNFVi0I4n8=;
        b=UlY2ywJwLeunFbGbV7IRo6c3uIWIrEiX8cwxy1bnWM4kpYqW6k2KrYLT59XblN4Sy7
         5RDykgvKlckOay2bYBRHdS1PGJ1QhUh8e9syMGu4KtU3N5ICSIEDthYecQOMLr4E88iv
         hNHQ2o7ben8NbBM9XQMRY/ajNrfNjFiGVx2dLTyu7nkqhLhh6QVU8Qc1uBPCLOc0GSNk
         Wdd0/SyGqJ23EXj2GURmj9U9nWWUmLc59S52WAkO+ABgW45iWI0YRjM1NFbL7/dIQs15
         W+exItFots4UIT797ZKGxYnw4U4VP1sgKuQNzGiF20zGpQyb2d+vYiA/8aJ7FZ6Cc58G
         zz5Q==
X-Gm-Message-State: AOAM532HIOduVi4iOXrdwJQacae3Dj2IqWdSIUC5duGSLzwzzr5nn4C4
        mLHEwlY5kwKM+HFT+BMsZynKG8gXMpmtlDawSj98gw==
X-Google-Smtp-Source: ABdhPJx7lj+k4HtoDUnAWWncwUPHKPLtPH+5vE4OXVU+sm+4n/l4l4EMI32FhbCzRQUrAy9yuUVXzvZ388i3Ejt1yNo=
X-Received: by 2002:a63:dd43:: with SMTP id g3mr29777399pgj.286.1591197714146;
 Wed, 03 Jun 2020 08:21:54 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000bbd09005a6fdc6cc@google.com> <0000000000000eb4b905a7277a7d@google.com>
 <20200603061251.GA531505@kroah.com>
In-Reply-To: <20200603061251.GA531505@kroah.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Wed, 3 Jun 2020 17:21:43 +0200
Message-ID: <CAAeHK+ykNcRU2yyH_eH1w5Kkh9qp9W=zXS7u=6wwjhG0kJgshg@mail.gmail.com>
Subject: Re: WARNING in snd_usbmidi_submit_urb/usb_submit_urb
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     syzbot <syzbot+5f1d24c49c1d2c427497@syzkaller.appspotmail.com>,
        Felipe Balbi <balbi@kernel.org>, ingrassia@epigenesys.com,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 3, 2020 at 8:12 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Tue, Jun 02, 2020 at 10:41:16PM -0700, syzbot wrote:
> > syzbot has found a reproducer for the following crash on:
> >
> > HEAD commit:    1ee08de1 Merge tag 'for-5.8/io_uring-2020-06-01' of git://..
> > git tree:       upstream
> > console output: https://syzkaller.appspot.com/x/log.txt?x=15f9e516100000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=b46ebd806238a886
> > dashboard link: https://syzkaller.appspot.com/bug?extid=5f1d24c49c1d2c427497
> > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> > userspace arch: i386
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1667dcca100000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13f9e516100000
> >
> > The bug was bisected to:
> >
> > commit f2c2e717642c66f7fe7e5dd69b2e8ff5849f4d10
> > Author: Andrey Konovalov <andreyknvl@google.com>
> > Date:   Mon Feb 24 16:13:03 2020 +0000
> >
> >     usb: gadget: add raw-gadget interface
>
> I thought this "bisect to the tool that finds bugs" issue was fixed :)

The change was merged after this message was sent, and it also takes
some time to be deployed.
