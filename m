Return-Path: <SRS0=EBKK=BY=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD50BC433E1
	for <linux-usb@archiver.kernel.org>; Fri, 14 Aug 2020 05:13:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8F69D20675
	for <linux-usb@archiver.kernel.org>; Fri, 14 Aug 2020 05:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1597381986;
	bh=LMbUrH5Q8OgVF/Dz4ohkfTynlkyefSFj6DVwjy5fKR0=;
	h=From:To:Subject:In-Reply-To:References:Date:List-ID:From;
	b=n0tPr+ex/7UxL6CbQWr3WHgC0PwfKD32AVNWxCr3OkBWCMdiPfm7ZgDJVIV3ahfS4
	 algQN650884xysxLb9LoIG8CUnHrbBj5r9kNmLgbNNtEotTYF4m/Vk+hqe9FLCXqpD
	 8jYtSJkwfSTofpYEfBFmvUdjTYevEvn3jtYNvVOc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726124AbgHNFNF (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 14 Aug 2020 01:13:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726006AbgHNFNF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 14 Aug 2020 01:13:05 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EA0EC061757
        for <linux-usb@vger.kernel.org>; Thu, 13 Aug 2020 22:13:05 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id f26so8616621ljc.8
        for <linux-usb@vger.kernel.org>; Thu, 13 Aug 2020 22:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=gzWdN7cyXENnAZZTpDeoARpqpHyMxh8WhXL19wqKyQE=;
        b=dHHdZEeH785hRcE+UnQmgHWhJRGBEvP1vRxl4rosw0u5j945ctlYEYggF1qlRvrmd2
         rWtfdExtullbAL520UnsP2qpcle5qao9Rbpr4rR1jPfKU2sDRbKu9nRl6ri9t1P1ao9c
         Llr/7i5r+FCTw1VJzTsk9JpxMQUVIEzuhmSk7/KVN6PcyvorXJSONDpPx527N/PmD9jP
         YnFzJdcRypBUir4Z75qkn7NJeiMr6s3r2IuHPVHB5k3Za3dUDB8pu4BCF74RSPFB8XVl
         HFewVPHHbvOYVX5mXHM60o3s0ZbO0Arg+KER0g8Y1M2BKdtXGtac+DSbhdE5fP3PQAzy
         YgTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=gzWdN7cyXENnAZZTpDeoARpqpHyMxh8WhXL19wqKyQE=;
        b=r+Q/QYrrFH8rMMZacdDkpOmjdUqlwyLoppxAh7ys3DKt97uC3G7avYI4Dvh6GHYXA+
         C+Mydwti2jTKhRMc35A3GliPXFFW/LRE7dAaT+WDk4ecrbLJwOy8q35ISOFxzAiQg3dC
         7GCcSqs6fsSUdllqKoWkrfzq/Q0BeavD+hoFmsVirHgeQhakrMMsQBiNY6B4AAk/Logl
         BMLdUMIlqtFnBLLJ0F90p3DvucXg+yTjz2M+C8reDkUCLWQqwneu+g1OiyO405QiEkCG
         IQempdDK2w0KvZfNdNgU2z8prBAu+M7jukbZStEUbucrnkZCk3oZcnWQcYGw3nNfp4dx
         LGcw==
X-Gm-Message-State: AOAM530m2A+HuhBrSeX3JzdMMq8sKQKEbA+CxUHQXAickLUDG3U4EVgN
        86a9WXykchiFJa4XaqKPgMo8itY1
X-Google-Smtp-Source: ABdhPJy57RSx1UJXhM2ril6jPxVFjksjUswsWXM8ETMMbqrdHbtBogJLlW0hMzIPbOHHbCTmxbOUkw==
X-Received: by 2002:a2e:a54f:: with SMTP id e15mr464536ljn.115.1597381983250;
        Thu, 13 Aug 2020 22:13:03 -0700 (PDT)
Received: from saruman ([194.34.132.58])
        by smtp.gmail.com with ESMTPSA id t20sm1525827ljd.12.2020.08.13.22.13.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Aug 2020 22:13:02 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Linux USB <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 11/11] dwc3: debugfs: fix checkpatch warnings
In-Reply-To: <0f678c7a-f2e1-a8cc-2f7f-75bc92513cc7@synopsys.com>
References: <20200813062532.829720-1-balbi@kernel.org> <20200813062532.829720-11-balbi@kernel.org> <0f678c7a-f2e1-a8cc-2f7f-75bc92513cc7@synopsys.com>
Date:   Fri, 14 Aug 2020 08:12:50 +0300
Message-ID: <87pn7tolnx.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Thinh Nguyen <Thinh.Nguyen@synopsys.com> writes:

> Hi Felipe,
>
> balbi@kernel.org wrote:
>> From: Felipe Balbi <balbi@kernel.org>
>>
>> no functional changes
>>
>> Signed-off-by: Felipe Balbi <balbi@kernel.org>
>> ---
>>  drivers/usb/dwc3/debugfs.c | 56 ++++++++++++++++++--------------------
>>  1 file changed, 26 insertions(+), 30 deletions(-)
>>
>
> These checkpatch fixes will create many conflicts to the patches I
> submitted.
>
> Did you get a chance to take a look at them yet before I revise them to
> be able to rebase on your testing/next branch?

Which patches specifically do you have in mind? I can rebase my patches
on top of yours, shouldn't be a big issue.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl82HVQACgkQzL64meEa
mQa6Vw/8CCBlE7dICqxUnrFkx/GT3ZqPmodioLghnJcgTy8RbVY1vECwHlHkn9nE
/EOCh7q9x9BdJf4cAA9vJYA26TbWYt5G5D+5+0pRlq2EiLDfMpsfw3OArfE91U0E
GNB68Ke6R+MgS0B2q3nteb15ZNcJ+1SoRWRNEchW2qUH5GR7suwGII7KgwzOnQHQ
IqClqQnEEU7q/MmQ5uZ6DJPjKCoailOKTh4vkytbH9HpsdgrUItm1BnKXze7wU8v
HvmBx85k+dCgeZuTFLN29GVm7ro5iYf+LcvyP9xen0Isg6bYaXJbqfMK7V0DGmML
OEpKSxoOh+awhyJ8cttwmegw320eesSHy1SUzd47VBZyeHQ7VC0iASW3YpKX7Sxb
jEsZI6jghu7yNrKUSgI+6wKVL4iE+hyc+NnuwWwBHgee5Y9hpIbBpic084vSKiDu
JXxw/csugHllxIMEiNoQZdtPIsP6tqQxXV99eIK7pCtFwE/gBQYUMrNM4MAA4x2j
12bioE7sU8E3Dqdd3L+xB+7OFGnxjGNIDaskZBKwp2m0PoIMaDunV+2JFvm9Hq7s
lUDuZ/4xct5hYroRTbxNmP47KRozQK7gM6xGGl/gwPqy2lqa0Hf3SupyeOmZ+EFb
Jbk+p5rYuIJRY+kIgv1py4DCC4Lti4xDthRrYCvHVi8meiUBLng=
=YfYA
-----END PGP SIGNATURE-----
--=-=-=--
