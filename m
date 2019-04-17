Return-Path: <SRS0=xlna=ST=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2757BC282DA
	for <linux-usb@archiver.kernel.org>; Wed, 17 Apr 2019 13:48:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E622F21773
	for <linux-usb@archiver.kernel.org>; Wed, 17 Apr 2019 13:48:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ASfXFw3I"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732325AbfDQNs3 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 17 Apr 2019 09:48:29 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:33106 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732240AbfDQNs2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 Apr 2019 09:48:28 -0400
Received: by mail-wm1-f67.google.com with SMTP id z6so4709372wmi.0
        for <linux-usb@vger.kernel.org>; Wed, 17 Apr 2019 06:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=BRJIESZOUsXsyyzk2sOSx8NXQuhZ+IEXlwobmUZsQqg=;
        b=ASfXFw3I1oaDEWb5mhjLskRBtINpgMuECJZi3f7kstFqRANVI+/GSNhDHiBqH1a4CO
         FE1zPWvIuL2CkaOxknNiyF1jcw8MTlUxswdhFp3CxxBXyFWtsSsGe80OoMpc4XN5RFD2
         pJX590++mYl/J/uvwd/0SUS9KCE9qArnA1nL/3Vld29UJBSYn9csGHUY0EOBk4IuK5tX
         v38k3Tl8GE9Jc+TYiioMa9KWt8SopwmCxAiGF+NJiHpAbMHaqscFPxanrndWDcupFjON
         Vc8UzL+t2ivkeV+b4CDFpvz42YiXIFmFRRk70YJ4XIIW8n9Qqvm6E89yrjuATtF/oxpV
         0/OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=BRJIESZOUsXsyyzk2sOSx8NXQuhZ+IEXlwobmUZsQqg=;
        b=RSnoShzApaU6P9IBFroWsAjaKqNcIYVjpAzrFEyAgy8kO2/xVDH1DBTBexThxPAX3M
         nyrDLh7N2bZo0U7kMLtZBG4TApFxn3YhJC/D889VpiEao6f+8MAGk9tsEroi2l0KZAkK
         5NeAjw5WgW3MGj9SISeDVEVoyDWBIOgEPFg11OBYUwluu26WTUeJlSNtVXPk6jEZaAh9
         ECKrjnb5yKEWB9oYyO3Br7D12M8+2hcM8WktjP1PdAifCVpH4ddyAKHULF9JRGRl+/Il
         Uz18U91zZYcjs6sOC5WGDFDyudhvnkcefwdHneh6fcwhqQC9xTqN05B7V/32l5MWEvDv
         MWog==
X-Gm-Message-State: APjAAAXgM3paqepxsHjwqzdNS7HRl5xxBaiOoqnduBFaaHSfwUZTwglC
        LOXcea/yb3FGEVgS4fWqYvBePpAi4uwd6Uhbrgg=
X-Google-Smtp-Source: APXvYqzn4MxpbeLow1Jjj+mfe/LM9LxX/K78mBMh+6uM/ryO4t5LEgwA8j7PVH2Z7lyCUHEUtD9eYbskdsaOG3pjiAE=
X-Received: by 2002:a1c:df89:: with SMTP id w131mr30606838wmg.82.1555508906666;
 Wed, 17 Apr 2019 06:48:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190213123000.4656-1-charlesyeh522@gmail.com>
 <20190402072235.GI12562@localhost> <CAAZvQQ6eOVH_YPxHq_PmDSmFSErswnm8njfjOO6mR9oOi0r5_Q@mail.gmail.com>
 <20190415085626.GB29656@localhost> <CAAZvQQ6JHwZ+iOo02s45SqYUo2sV3o49VJ3QGkL4Yh9Pyi_mMA@mail.gmail.com>
 <20190417111340.GA2520@localhost>
In-Reply-To: <20190417111340.GA2520@localhost>
From:   Charles Yeh <charlesyeh522@gmail.com>
Date:   Wed, 17 Apr 2019 21:48:13 +0800
Message-ID:
 <CAAZvQQ6=KnZCHryxByJ2N2GhCqrk6gcGHwTETnHWH=-yCzc7HQ@mail.gmail.com>
Subject: Re: [PATCH] USB:serial:pl2303:Add new PID to support PL2303HXN (TYPE_HXN)
To:     Johan Hovold <johan@kernel.org>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
        =?UTF-8?B?WWVoLkNoYXJsZXMgW+iRieamrumRq10=?= 
        <charles-yeh@prolific.com.tw>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190417134813.IRQ1vbgjVpxlMBw9skuJ_3kCnbTXasLnfCpzBt_5nmw@z>

Johan Hovold <johan@kernel.org> =E6=96=BC 2019=E5=B9=B44=E6=9C=8817=E6=97=
=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=887:13=E5=AF=AB=E9=81=93=EF=BC=9A

> > The code I see in the pl2303_set_termios function
> > is still pl2303_vendor_write(serial,0x0,0x41),
> > Not pl2303_update_reg(serial,0,PL2303_FLOWCTRL_MASK,0x40);
>
> Yes, you need to base it on my usb-next branch (or linux-next):
>
>         git://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.gi=
t

OK, I will use
"git://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git "


> I'll try to clean up the current driver some more based on your
> feedback. I'll get back to you as soon as have something concrete
> and we'll get the HXN support in place.

Thank you very much!

>
> Meanwhile here are few questions:
>
>  1. Can bcdUSB be used to detect the HXN devices?

No , you can't use bcdUSB be used to detect the HXN devices.
>
>  2. Does the old (type 01 and hx) devices require the register address
>     to be ORed with 0x80 when reading?

Yes, the old (type_01 and HX ) needs require the register address to be
ORed with 0x80 when reading.


>  3. And the HXN does not need that ORing with 0x80 it seems?
Yes, HXN's hardware design is different old (type_01 and hx).

>  4. How do you use the chip-reset register (0x7) on HXN; do you write
>     0x03 if you only want to reset both data pipes?
Yes, I only want to reset both data pipes.

Charles.
