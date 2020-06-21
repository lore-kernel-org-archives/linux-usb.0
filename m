Return-Path: <SRS0=VqZY=AC=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35D5FC433DF
	for <linux-usb@archiver.kernel.org>; Sun, 21 Jun 2020 11:04:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 05218248D3
	for <linux-usb@archiver.kernel.org>; Sun, 21 Jun 2020 11:04:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H4IfNF4x"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729892AbgFULEq (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 21 Jun 2020 07:04:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729869AbgFULEq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 21 Jun 2020 07:04:46 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7205BC061794
        for <linux-usb@vger.kernel.org>; Sun, 21 Jun 2020 04:04:45 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id q19so16193759lji.2
        for <linux-usb@vger.kernel.org>; Sun, 21 Jun 2020 04:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GAC4eWYFbiL8PO8lfgrnxcB2RxaUyFz02u8sVfqqZRs=;
        b=H4IfNF4xYZNPtA5ralsd3u4QudnIsYKAOQqAWpltw18pM7WDenLu/zZiSlzAKeEL8T
         ByFyPN310qXq9ZwxZqDRiAliTfDOK7mQobfSOlgvdSzj+q1oIz6KERlbplCTU6YShXoB
         jJDp1XbZea0eYKALiUt5TK+ojhZs7shwNEQsZN8iMNiQ24do3/JyaSK/k2kfhMQAJwXK
         N+fzWD6hGLTinTn7koC32Ynu+zDBQvVOhOoZuKCVAjWzGtp9GNv/KevqdGBWjy9J5Cft
         1d4VYfHFQi2JwNfInBU0urOqeFvwkBFaaF9esVYlU3L/KXPbnkFM23X6PZh3br3sx7VF
         mASQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GAC4eWYFbiL8PO8lfgrnxcB2RxaUyFz02u8sVfqqZRs=;
        b=TDPDnwjLsEBEW7dpLRchSkrevIeeNBpHcKkz6Pskgma7Ohx1LtmWtJwMnXR2Kied/s
         TCHX5FCz0MSuYCiKPEu1hBRLPzZ27G//U7eqjUYCytSL3ivJDuU57XUwX27friK0pT+v
         uBDwwLMZfPBokg+l8/474tYKNdJGqIctpazhM0lUW8oInJmzUfsj1OTl5+gzzrPz4Eoh
         DI908txG4chiyMusnQuZnwTeUdy+xas0xa0HirXHwJy5tbi4UGh5eWkyhB84GXQJvK1K
         tM3Juau9PCjIKYGoRTazyAtj/BIuEiE2pKMqCkgq8x2mPXkM6VkY7rkuNaZmL/cYr2gN
         SayQ==
X-Gm-Message-State: AOAM531MmBn/zHCYp5aBoy/c7k2Wab1cKvwzoj7Vec+fDkY6+/HQJxMl
        +y0ak6jRJ+HMscOgP7TNis41uG4YJh0IDau0yx796TF4JsNr+A==
X-Google-Smtp-Source: ABdhPJy6OZxlNT48yKSWyGyQKmkzpmxDIVYHiq5jtQk2LAbMLiiJhYXLFM4Jpczp8mfKcJZReN2m7o0zERgKcAxNEkA=
X-Received: by 2002:a05:651c:1181:: with SMTP id w1mr5743822ljo.432.1592737483679;
 Sun, 21 Jun 2020 04:04:43 -0700 (PDT)
MIME-Version: 1.0
References: <CACtzdJ2Yu_sHtJpWQ8UtF-yVEp5ON_vTWzaL72TJxW96MydVdQ@mail.gmail.com>
 <20200621095625.GB120230@kroah.com>
In-Reply-To: <20200621095625.GB120230@kroah.com>
From:   jaap aarts <jaap.aarts1@gmail.com>
Date:   Sun, 21 Jun 2020 13:04:32 +0200
Message-ID: <CACtzdJ3pWvHF=DVVoGse4K9Z1XA6vubX7=wwFQCpu2_LWiA7wg@mail.gmail.com>
Subject: Re: kernel driver for USB liquid cooler controls
To:     Greg KH <greg@kroah.com>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I have a corsair h100i v2, I am currently only developing with that atm.
I am currently using the protocol from
https://github.com/audiohacked/OpenCorsairLink which supports pretty
much all corsair products.
I dont have the money myself to buy all the products available but
https://github.com/jonasmalacofilho/liquidctl has other devices
available.
They are both GPL licensed so that should be no problem.
I have no idea who would test other products/brands, but since a lot
share the same controller it might not be that big of a deal.

Jaap Aarts

On Sun, 21 Jun 2020 at 11:56, Greg KH <greg@kroah.com> wrote:
>
> On Sun, Jun 21, 2020 at 11:39:27AM +0200, jaap aarts wrote:
> > Hello USB mailing list,
> >
> > There are all-in-one liquid coolers for your CPU (like the corsair
> > h100i), these are populair among gamers and high-end desktop
> > enthusiasts for cooling their CPU. Under windows these have
> > proprietary software that control the fan speed, pump speed and most
> > importantly (for gamers) the RGB led controls.
> > Under linux there is software that manages to control these devices by
> > talking to the device via USB. But this doesn't allow for the fans to
> > be controlled via generic fan control under linux.
> > As a hobby project I started to implement some of the features from
> > one of these user-space drivers as a kernel module.
> > Some features would have to be device specific like RGB controls, but
> > fan and pump speed could be controlled just like system fans.
> > I was wondering if there would be any interest in having a driver for
> > these all-in-one usb controlled coolers in the linux kernel itself?
>
> Sure, why not, just tie into the correct kernel subsystems and all will
> be good.  What exact device do you have, I have one here that I could
> test with if it's the same one.
>
> thanks,
>
> greg k-h
