Return-Path: <SRS0=wyUQ=Y2=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B66B5CA9EC7
	for <linux-usb@archiver.kernel.org>; Sat,  2 Nov 2019 22:09:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 87EF021906
	for <linux-usb@archiver.kernel.org>; Sat,  2 Nov 2019 22:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572732575;
	bh=M91BK//G0AGxiPTVbAufD9sXjzn7Sec8N7JlW6FjSq0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=sVbl+VvwsMu8Rg7akId9n7xjLkHqPh5Gd5k2yr91zwQ3KMSeAEnIahefYTFvGLNz8
	 5nwMEcM2jKzRyXBnOZVvi2smiCVgadV9lk/ZymRd9hBFkYbobZVBTWu3Ylf36kjnAs
	 QC936sXlYgiWvWi5KdVxn+T7VEI4nw1tfXcE+jjY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726762AbfKBWJb (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 2 Nov 2019 18:09:31 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:34564 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726931AbfKBWJa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 2 Nov 2019 18:09:30 -0400
Received: by mail-lj1-f196.google.com with SMTP id 139so13746669ljf.1
        for <linux-usb@vger.kernel.org>; Sat, 02 Nov 2019 15:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=w/G6EKdeKHyA10XyqtoNEQBxMdg61j9NrYNZ+OC/8O0=;
        b=fiTiutJMMhzHoUatnMj/i0xks6LRSmy0r7/BRz4Oo2NzE6YmtOVVD9WTTp3vp/4Ftl
         susZvLuDrEDv2Y0EisfAoYbNX8c8ba0GWiLrv658sEXczCmotmacJTxLnXp7ikF2o1OS
         tH5KGMhlSFlbvPUr5HFJ0KdvbB3vKmi6HfEto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=w/G6EKdeKHyA10XyqtoNEQBxMdg61j9NrYNZ+OC/8O0=;
        b=Hzb8Eibs5kFsSlDsg4vujx8nGimAGlrBMuTOaXShcrnvssgDOC2A/ir780e7RTXJLW
         Ce3GiCF55itovm3ebMnaHFDMOpid1/lghAwM2O8z6HCPpTDPTe0ufe1GV5nqjC/fttQZ
         /aFvWAwQgzhCq1tBKXaPNOdqu+Y158NboCGCJfK4Qhz3Le0M3Afcq9cK7TuyqXlAClmN
         xUOLcc8MZaH8uuJbhxWnFVZkQP+VcIIjG3L40XKoh+Hz+HD6dI9favN2racjIjd10l8t
         OzH1bRbT/r51Cf6Aev71oP56BoeYrb/Y7eK1Nn999bKkjcmteAefCIG1V6+Rkrvjmw5q
         9uig==
X-Gm-Message-State: APjAAAW6IHAS4b7OXrsdlmlSyZ4RE+D638f69EAOoCCWNXTTWabDAKo8
        k0FNLCUr757piWespSrcMpVEIlq2EJc=
X-Google-Smtp-Source: APXvYqznXi/8LhufAbp3gSSLGsRNq0pzSkmt9kC6ma/t5js40m2HY6DqT5oWjb4mEjrSb85D9fRMWg==
X-Received: by 2002:a2e:478a:: with SMTP id u132mr1169541lja.181.1572732568185;
        Sat, 02 Nov 2019 15:09:28 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id j7sm4135855lfk.17.2019.11.02.15.09.25
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Nov 2019 15:09:26 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id 195so9577608lfj.6
        for <linux-usb@vger.kernel.org>; Sat, 02 Nov 2019 15:09:25 -0700 (PDT)
X-Received: by 2002:a19:6f0e:: with SMTP id k14mr11937953lfc.79.1572732565288;
 Sat, 02 Nov 2019 15:09:25 -0700 (PDT)
MIME-Version: 1.0
References: <25886.1572723272@warthog.procyon.org.uk> <CC3328CC-2F05-461E-AAC3-8DEBAB1BA162@amacapital.net>
 <CAHk-=wj1BLz6s9cG9Ptk4ULxrTy=MkF7ZH=HF67d7M5HL1fd_A@mail.gmail.com>
In-Reply-To: <CAHk-=wj1BLz6s9cG9Ptk4ULxrTy=MkF7ZH=HF67d7M5HL1fd_A@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 2 Nov 2019 15:09:09 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiNJYdEcomZKaD034S==-gEXg_V3JpW+DpKXFi5fJuruw@mail.gmail.com>
Message-ID: <CAHk-=wiNJYdEcomZKaD034S==-gEXg_V3JpW+DpKXFi5fJuruw@mail.gmail.com>
Subject: Re: [RFC PATCH 11/10] pipe: Add fsync() support [ver #2]
To:     Andy Lutomirski <luto@amacapital.net>
Cc:     David Howells <dhowells@redhat.com>,
        Konstantin Khlebnikov <khlebnikov@yandex-team.ru>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Nicolas Dichtel <nicolas.dichtel@6wind.com>, raven@themaw.net,
        Christian Brauner <christian@brauner.io>,
        keyrings@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-block <linux-block@vger.kernel.org>,
        LSM List <linux-security-module@vger.kernel.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        Linux API <linux-api@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Nov 2, 2019 at 3:03 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Sat, Nov 2, 2019 at 1:31 PM Andy Lutomirski <luto@amacapital.net> wrot=
e:
> >
> > Add in the fact that it=E2=80=99s not obvious that vmsplice *can* be us=
ed correctly, and I=E2=80=99m wondering if we should just remove it or make=
 it just do write() under the hood.
>
> Sure it can. Just don't modify the data you vmsplice. It's really that si=
mple.
>
> That said, if we don't have any actual users, then we should look at
> removing it (maybe turning it into "write()" as you say). Not because
> it's hard to use, but simply because it probably doesn't have that
> many uses.

Looking at debian code search, there are _some_ uses (including
openssl and fuse):

  https://codesearch.debian.net/search?q=3D%3D+vmsplice%28&literal=3D1

but I didn't check any more closely what they do.

             Linus
