Return-Path: <SRS0=OnHz=6C=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD578C352BE
	for <linux-usb@archiver.kernel.org>; Sat, 18 Apr 2020 18:53:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B98CE221E9
	for <linux-usb@archiver.kernel.org>; Sat, 18 Apr 2020 18:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1587236004;
	bh=UgXOgSwIMyfiGPkOtWwuniPLy2NcYx/OJ8KMhNGbheM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=hK9ji2ku9h6XKfVC5vczCZpxXIq/+xJ7qfQ7G5RmodQ2snY6c9Dh9D/mZtQghosSi
	 rH49jWebfGZ8P72z11PrrGbHW63y0nb1sx2/NlVgQaVVsTUK/xlP1b6yHpQ8U8Qf4L
	 /P4QNIL05G+plkdXDSSUuTA3bOmJk4Yc/YCHl99M=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728113AbgDRSxY (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 18 Apr 2020 14:53:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725824AbgDRSxX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 18 Apr 2020 14:53:23 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40A57C061A0C
        for <linux-usb@vger.kernel.org>; Sat, 18 Apr 2020 11:53:23 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id b2so85591ljp.4
        for <linux-usb@vger.kernel.org>; Sat, 18 Apr 2020 11:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pJRI8oZ6j+rGEg2+OCymOS7794uvyRZcSR2Htjt5TI4=;
        b=Dab8X2CtWipiSivi9nyLxp8nBHQpWedKwzW35yNj8kBU3VxCHrB+3Kn5U3rtIjeKoA
         Lw3k/ndceMaBnN8HktM5POukz2zYdQKxOk+s6N6D5bBob3ys4IoAy4L7IIPc1NiF89LI
         qpPs2HFFi+SoqSVPJ7yi1QNfgGKP7Teiklti0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pJRI8oZ6j+rGEg2+OCymOS7794uvyRZcSR2Htjt5TI4=;
        b=iMCyzcq6MdPB28YAPwX5CjM+hX2ooJ69VvrD+ybCjCMvLt/z7BIDAy7LiWKbdELkzL
         FNh+5SU0dcpT5RgOKlk/q2tbb/s/PIBGsyyigBsQ1QFboDSGSiYa5Uy1KktB1yjnxvYj
         14mW3p1TXDOyd/k3+EHHO2gRNovCHelFqk+iKGv9qciDNovhENOeB/Y8CJJTGRPDtbwk
         eTxZOsoCtBCSXhVStcu6s9Oo2AXID/HP3QZAp28swmECDDwaxxtOLFWbNjpfz2ZbjnGR
         RqSZ8TvheKaYOHmDqX/kLTsoYeOUwgC1i1IgoKpSNoVuvJwA6Rc+OfPkGNEyNeCoftyK
         2+Jg==
X-Gm-Message-State: AGi0PuaovNvpGfaw9Tv9VqmuJKCOmKYEILIvDsYC9OWYvt7gzbV++Ymr
        GpIBIVtX8oPdjxRkXZ02djbIRl+2PH8=
X-Google-Smtp-Source: APiQypLmi7febFSbTbzLCQk76T8PRWsdbNh7TuUhVYeBDrlPA+hs3tALuIAxAlrfYFqu1oOkJhsGSA==
X-Received: by 2002:a2e:a549:: with SMTP id e9mr5500809ljn.28.1587236000645;
        Sat, 18 Apr 2020 11:53:20 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id o3sm16646287lfl.78.2020.04.18.11.53.19
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Apr 2020 11:53:19 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id u10so4558976lfo.8
        for <linux-usb@vger.kernel.org>; Sat, 18 Apr 2020 11:53:19 -0700 (PDT)
X-Received: by 2002:a05:6512:405:: with SMTP id u5mr5483360lfk.192.1587235998911;
 Sat, 18 Apr 2020 11:53:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200418184111.13401-1-rdunlap@infradead.org> <20200418184111.13401-3-rdunlap@infradead.org>
In-Reply-To: <20200418184111.13401-3-rdunlap@infradead.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 18 Apr 2020 11:53:03 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjSzuTyyBkmMDG4fx_sXzLJsh+9Xk-ubgbpJzJq_kzPsA@mail.gmail.com>
Message-ID: <CAHk-=wjSzuTyyBkmMDG4fx_sXzLJsh+9Xk-ubgbpJzJq_kzPsA@mail.gmail.com>
Subject: Re: [PATCH 2/9] fs: fix empty-body warning in posix_acl.c
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        "J. Bruce Fields" <bfields@fieldses.org>,
        Chuck Lever <chuck.lever@oracle.com>,
        "open list:NFS, SUNRPC, AND..." <linux-nfs@vger.kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Dan Williams <dan.j.williams@intel.com>,
        Vishal Verma <vishal.l.verma@intel.com>,
        Dave Jiang <dave.jiang@intel.com>,
        linux-nvdimm <linux-nvdimm@lists.01.org>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        linux-scsi <linux-scsi@vger.kernel.org>,
        target-devel <target-devel@vger.kernel.org>,
        Zzy Wysm <zzy@zzywysm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Apr 18, 2020 at 11:41 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Fix gcc empty-body warning when -Wextra is used:

Please don't do this.

First off, "do_empty()" adds nothing but confusion. Now it
syntactically looks like it does something, and it's a new pattern to
everybody. I've never seen it before.

Secondly, even if we were to do this, then the patch would be wrong:

>         if (cmpxchg(p, ACL_NOT_CACHED, sentinel) != ACL_NOT_CACHED)
> -               /* fall through */ ;
> +               do_empty(); /* fall through */

That comment made little sense before, but it makes _no_ sense now.

What fall-through? I'm guessing it meant to say "nothing", and
somebody was confused. With "do_empty()", it's even more confusing.

Thirdly, there's a *reason* why "-Wextra" isn't used.

The warnings enabled by -Wextra are usually complete garbage, and
trying to fix them often makes the code worse. Exactly like here.

             Linus
