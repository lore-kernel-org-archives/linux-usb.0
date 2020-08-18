Return-Path: <SRS0=A6ac=B4=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFC78C433DF
	for <linux-usb@archiver.kernel.org>; Tue, 18 Aug 2020 17:03:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 912132067C
	for <linux-usb@archiver.kernel.org>; Tue, 18 Aug 2020 17:03:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oL+DdbYC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727024AbgHRRDA (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 18 Aug 2020 13:03:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727106AbgHRRCf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Aug 2020 13:02:35 -0400
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63A4BC061389
        for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2020 10:02:35 -0700 (PDT)
Received: by mail-io1-xd2d.google.com with SMTP id u126so21778080iod.12
        for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2020 10:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=XYgU2Aw5qPwWIAzHILNIig6YhC/8F3cdAsjV+bgbMr4=;
        b=oL+DdbYCsXH8GVjwjg/LMTybisGOGUm/PamzyMcoW2HkpEExhRt3++dDD5MazGljr3
         IYSUp4RVRa3sP1sHi//V5oH1D0/DmiU8xSUdiS9bQ4i3yzbNPgyiS3KCcyc7h+pVY8iU
         E9IbqZ8YfOuB3rkcn09J0q5bJhxjp2nqtkZUPxyXArw5jRe1y3c8SuLdbF/6ZYYKLTIk
         ZTgyItlUjfXcH3xF8O5AkMFaViTvnM5/VOTcpx3j7YtVDTMOt3tLtMiniIIBMNBc55PC
         qTfWoW2Qx/MDuvhBND8rKDWobkwUJTRU2t4bOaElYckC8zPLUeVn2lQg3XGusnl7ARTH
         pmHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=XYgU2Aw5qPwWIAzHILNIig6YhC/8F3cdAsjV+bgbMr4=;
        b=Lt14ADVB9GPzXw5AONwIMngD/E1Qq3UZcVobeUFovJeGdTHsIb2YD5FUPHnI8cTGr8
         Mtm9kbMFUIv6IOzQMQAxIXaGpW/clsHtyJ80RV8rec2hOPB6I31xnauH4/sJ3Oy7CJez
         WJgIlUdmt5V9GTTLQQj7LYPHPglbvB67i7rZkF5y89jPYpNP2+MmfIi2dhIqEJJmraxp
         4KLvZmKiqu1KYMZrshbm8vbcMwJRsh/7fs8YOATCvxXFXfKgvdpX8jVdc91qW+ddmZNk
         Bo8AE/8893U7pGH5ZJMtj0zrV7cwcuPRZF0B0jks55gXSWRoSO+Kt4r+m6ywu/b0HuuJ
         kjHA==
X-Gm-Message-State: AOAM533BV//PsOXDNGk2QKMPWxwa9D48JldW83AldxkItfJr0Rlmd9cV
        052yI8Z6F/ZhhATpUEuyu4mQflZXCuLbwCmG6clVZQ==
X-Google-Smtp-Source: ABdhPJyKrzZQudc2oTz7q6k7aVVaYse/lgFUov1vM8mdqUaUz+pqUj9i3GSL3votYb7u0+4G+JuVnx02uc8zH5C0jv4=
X-Received: by 2002:a6b:5a04:: with SMTP id o4mr17064150iob.171.1597770153876;
 Tue, 18 Aug 2020 10:02:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200805075810.604063-1-lorenzo@google.com> <87mu39tmu6.fsf@kernel.org>
 <CAKD1Yr17hFju=xvDHWWcLjwj=nuSBBVJn9xQ5ocHHXQm6PAw_A@mail.gmail.com> <CAHo-Ooyk_uqciWJ=2L+OwM+DBfPCRKLQz6-5SCxKSRTV8-FCHA@mail.gmail.com>
In-Reply-To: <CAHo-Ooyk_uqciWJ=2L+OwM+DBfPCRKLQz6-5SCxKSRTV8-FCHA@mail.gmail.com>
From:   Lorenzo Colitti <lorenzo@google.com>
Date:   Wed, 19 Aug 2020 02:02:21 +0900
Message-ID: <CAKD1Yr3YKxuUZBLUw9FyKEM8pDPwtzKmHQLB-6qkw265N+J98A@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: f_ncm: allow using NCM in SuperSpeed Plus gadgets.
To:     =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <zenczykowski@gmail.com>
Cc:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 6, 2020 at 3:04 AM Maciej =C5=BBenczykowski
<zenczykowski@gmail.com> wrote:
> This means:
>   5 gbps -> 5*8/10*0.965 =3D 3.86 gbps (USB 3.0 / USB3.1 gen1 / USB3.2 ge=
n 1x1)
>   10 gbps -> 10*128/132*0.965 =3D 9.35 gbps (this is USB3.1 gen2 / USB3.2=
 gen 2x1)
>   10 gbps -> 10*8/10*0.965 =3D 7.72 gbps (this is dual link USB3.2 gen 1x=
2)
>   20 gbps -> 20*128/132*0.965 =3D 18.72 gbps (this is dual link USB3.2 ge=
n 2x2)

Thanks for the detailed calculations, but unfortunately it turns out
that this is just a 32-bit number. :-(

So v2 sets it to a round 4 Gbps for anything 5 Gbps or above.
