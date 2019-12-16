Return-Path: <SRS0=1PTI=2G=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04ED0C43603
	for <linux-usb@archiver.kernel.org>; Mon, 16 Dec 2019 14:59:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CBB1E2072B
	for <linux-usb@archiver.kernel.org>; Mon, 16 Dec 2019 14:59:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AP+6nl7P"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728183AbfLPO7Q (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 16 Dec 2019 09:59:16 -0500
Received: from mail-pf1-f175.google.com ([209.85.210.175]:45089 "EHLO
        mail-pf1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728008AbfLPO7Q (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Dec 2019 09:59:16 -0500
Received: by mail-pf1-f175.google.com with SMTP id 2so5710644pfg.12
        for <linux-usb@vger.kernel.org>; Mon, 16 Dec 2019 06:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XzX7HvMfI+FbqPlfhV2QEZ5DIKSU6MexUmhq7WHK0dY=;
        b=AP+6nl7PXq2jPyHPmfVoAai/3dvZ2JGyHbWEgYA57PvuUUSNGrk9aiHkCoGvOMjEA0
         7EAhnsqCTnRXchkXmlN7Ql5FE994ua5b2QJuWKTZbLN9R7YSN7F6LboUuZvCNvQawF/z
         8jsgPl3quzgQzmwCHbJRpWeiruGAFCVBl9cZXV4nQ1L1dyGKgEStEsdhx9VsCS6t+eFA
         uijFdZcAWu3UEIjszbUfp8XHQA4MmEkzJmBFGwsv0FJZqEWbCWrb3vtk/tPPA3nDha4H
         dm79PR0l44gSvyyB2kusAPzCDCw4wnfiMdXV+teaCfhrZjAa++jIMtqUpeuH50+rdNY5
         i7pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XzX7HvMfI+FbqPlfhV2QEZ5DIKSU6MexUmhq7WHK0dY=;
        b=KLxwNXR/ney80HysDpfjZVztt2xEAfArnAdvspwKg3Uap4jWc4WsMb8EFNY1nQjWEa
         3XjcO8h4rS/GZ63CXREkv00dtADP77o8tTPFP0K3FfYJaXvsfdu5PNbFIWSCnAWtf3Fo
         aW2v+y2gKsLia4B2mPIee515uqhEw/lqdFwuV4pdWgGgCn4oNeZFBu565TtDwlgfoXCG
         S7ke5VFg/nhyLQ9RpV6gUtlDKIACEm2GIa7/gk0LnEmd0lQaeqH9gR5D8ZZasWfGNlB3
         jcCrGi4vmSXjTLH5n4G1mTUhtsI6s6nwnMjwfCCnjxChGWgaLa26WVB6Q7vQ+3sPuUS/
         UW4w==
X-Gm-Message-State: APjAAAX+X4wkxqMcy8EfV91IyL55iphxFYRY6MGzntKLB5jAfcdSzyZE
        18IIfUuHnSzLaTkDu9mSY3DjkNPQfZDAyLF9lc0XOQ==
X-Google-Smtp-Source: APXvYqzAWcJn/GX3RpowzTZXhFl+J7gwVSc0Vb1CNqW2dSxEB0yUnbpdoQqq1NY4OZ+rgF482f6/S7WksE+b5zSKIz4=
X-Received: by 2002:a62:1d90:: with SMTP id d138mr16122258pfd.93.1576508355707;
 Mon, 16 Dec 2019 06:59:15 -0800 (PST)
MIME-Version: 1.0
References: <CAAeHK+xSWEFUA7DQyhm90uiwggx60gYa8q7QqzOWp7DX_xWSWg@mail.gmail.com>
 <Pine.LNX.4.44L0.1912131448080.1332-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1912131448080.1332-100000@iolanthe.rowland.org>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Mon, 16 Dec 2019 15:59:04 +0100
Message-ID: <CAAeHK+yz3dtfx0Jfd4sbOcN8tSxp8+qAvW609sP_yJC5q6vq8A@mail.gmail.com>
Subject: Re: Re: general protection fault in usb_set_interface
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     syzbot <syzbot+7fa38a608b1075dfd634@syzkaller.appspotmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>, mans@mansr.com,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Dec 13, 2019 at 8:51 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Fri, 13 Dec 2019, Andrey Konovalov wrote:
>
> > > > Let's retry here:
> > >
> > > > #syz test: https://github.com/google/kasan.git f0df5c1b
> > >
> > > This bug is already marked as fixed. No point in testing.
> > >
> >
> > Hm, that explains some of the weirdness. It doesn't explain though
> > neither why the patch was actually tested when Alan requested it nor
> > why syzbot sent no reply.
>
> In the meantime, is there any way to get syzbot to test the new patch
> with the old reproducer?  Perhaps tell it to re-open this bug?

No, we can only test this manually now. I can run the reproducer for
you. Should I revert the fix for this bug and then apply your patch?
What's the expected result?
