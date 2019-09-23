Return-Path: <SRS0=05/B=XS=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A550C04EBF
	for <linux-usb@archiver.kernel.org>; Mon, 23 Sep 2019 12:46:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1BE0E20882
	for <linux-usb@archiver.kernel.org>; Mon, 23 Sep 2019 12:46:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YnbEX9Yr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439573AbfIWMqQ (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 23 Sep 2019 08:46:16 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:40338 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439569AbfIWMqP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 23 Sep 2019 08:46:15 -0400
Received: by mail-pg1-f196.google.com with SMTP id w10so7961446pgj.7
        for <linux-usb@vger.kernel.org>; Mon, 23 Sep 2019 05:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=F+HQfuBxfvIu7W6ZgciNovtXVVjwRh4rUaRkloSdUms=;
        b=YnbEX9YrzVd4HKmWNNyz0MX6pw5AGyMgC/HIETbbV5vg0ouq25l5SBJx348GY6J3Bm
         WLlUMBbKFIz56RNRZ08uPtqOa4KHpLwm10P3W9JII27LwnVOhqZnusLkwK2DN6DFo0Uu
         OKk9c1mQdSwo4yejP5ufeO4gpEWU9GL/lwqQKhI5dvi8bDS5CWalrfP/RaPwA7MH5YSY
         9Bg0VmwiXsTT4W5SUOwR5W5bk36psss+YB5kOzbcEG/iYFAsAzno5su2vUDzBrquV3Oq
         hp0aEYMEatB8HwgJdjobBhQ1HE7tDKZLUSACUNAR4rG+5U2WTSk+LFCw8q27uFlAoZJ1
         y6qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F+HQfuBxfvIu7W6ZgciNovtXVVjwRh4rUaRkloSdUms=;
        b=jKeW7soG7rqSYUbYKeoTZMy8BYKr9uaG7TZ52JJ7cw5cBDO1GGvXNdSwVqu4gVFZ+Y
         qEWNxzsDaZTUvRIvWQtOjGydhUwjmKSc8XcLaZTTo4tiJvlvDo9SJigsdakrD4Zmw3RC
         dMtQcmQO/Nfuz/zmsoJiItioP1m3oNYwXKFNruent8CnAXpXMOOp65SAg1zJCIjvSS1u
         B69vMd+YIUeuDkYaV9/3nHaP8TelYx5IyGsem75RCg6l8hBT9r8/pftCXwGVdHtnAXol
         xysKLig4E8C63t9y1kKfQ6RRW4JUWAYsOcWQqi5s3vNtbL3jDTO5P5h27iGPkA9KEMSG
         pHXQ==
X-Gm-Message-State: APjAAAXbjbdO8Q9Xt37B2lv5HBUJXmxhgpIC5TMHEFcyS3CuDuJae4EA
        j7ZFqErpyYLnFD36LkeMa2Pt/hcqVGS9O10VoGmMZg==
X-Google-Smtp-Source: APXvYqxBkpxfuwbV+o3etfbSciPN7x1xJ74p7y0vhwIXrPA29r9v/4Lcgtxvu9BzfA8gtYCOvG9hQERKzDO0NmIpaBQ=
X-Received: by 2002:a63:d1a:: with SMTP id c26mr1165797pgl.286.1569242773370;
 Mon, 23 Sep 2019 05:46:13 -0700 (PDT)
MIME-Version: 1.0
References: <1564472907.25582.16.camel@suse.com> <00000000000081a9c1058ee1d06a@google.com>
 <CAAeHK+w0vKt94g-h+NOqW-GJKyqikbAfU4sTBeKeJS-sUkZ69g@mail.gmail.com> <1569229570.7831.3.camel@suse.com>
In-Reply-To: <1569229570.7831.3.camel@suse.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Mon, 23 Sep 2019 14:46:01 +0200
Message-ID: <CAAeHK+xspiZSWzzVYbMoAV21T0jFX8g+7D8fwkv413ezNWwT_g@mail.gmail.com>
Subject: Re: general protection fault in flexcop_usb_probe
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     syzbot <syzbot+d93dff37e6a89431c158@syzkaller.appspotmail.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        linux-media@vger.kernel.org, USB list <linux-usb@vger.kernel.org>,
        Oliver Neukum <oneukum@suse.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Sep 23, 2019 at 11:21 AM Oliver Neukum <oneukum@suse.com> wrote:
>
> Am Freitag, den 20.09.2019, 18:01 +0200 schrieb Andrey Konovalov:
>
> > > Reported-and-tested-by:
> > > syzbot+d93dff37e6a89431c158@syzkaller.appspotmail.com
>
> [..]
> > Hi Oliver,
> >
> > I was wondering if you've submitted this patch anywhere? The bug is
> > still happening.
> >
> > https://syzkaller.appspot.com/bug?id=c0203bd72037d07493f4b7562411e4f5f4553a8f
>
> Hi,
>
> I definitely did submit it:
> https://www.mail-archive.com/linux-media@vger.kernel.org/msg148850.html

Hi Mauro,

Do you know what happened to this patch? Did it get lost?

Thanks!
