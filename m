Return-Path: <SRS0=lmIm=SV=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=3.0 tests=DATE_IN_PAST_06_12,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D259BC282DA
	for <linux-usb@archiver.kernel.org>; Fri, 19 Apr 2019 19:32:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 93A36217D7
	for <linux-usb@archiver.kernel.org>; Fri, 19 Apr 2019 19:32:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z+4yqhqZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727531AbfDSTcH (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 19 Apr 2019 15:32:07 -0400
Received: from mail-it1-f170.google.com ([209.85.166.170]:53310 "EHLO
        mail-it1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726423AbfDSTcH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 Apr 2019 15:32:07 -0400
Received: by mail-it1-f170.google.com with SMTP id y204so9790164itf.3;
        Fri, 19 Apr 2019 12:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=sGgXGDy0V0b1zywo405McnWkTjByJlT6AzLVuvxL0yw=;
        b=Z+4yqhqZznDOo8l35FwKavKXpLqOYhrddGHQJpQdZOPS2SbNqz/aaaMVBa64lWUrc0
         /OhlyMA6J+aSuFghNMetxuzuM2zSGBH8llgcGDK2SQFkSA/6cZe8fmj9Bb0OpJB13Orl
         HibAyoUwzl2FadmJlbQE4No2P2+o3RqvOJy017q2cPwA2hb/pRknPsRZWqG5JRNz5Woo
         rTDWXBzWJ3igzVCiv5UJTG7KUk0hN5ZLgbfhD+yGpqa/B2hF/jsMqJqWo5JnzANixF33
         3ipr1Vw3WNqsJhtFo1QwGZWRbYKvMm11aKTy20Vl1vCNaTQByO5kLQC4Nn1ePNkfSYqW
         3bDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=sGgXGDy0V0b1zywo405McnWkTjByJlT6AzLVuvxL0yw=;
        b=SSfngy0ZZo1SAIxE0U8otVURszNy+4HcKkENuBe4UiiHNJ7eYSY4vnI9IO1zEeHA64
         D4A6C6xFPHxsSTj/Di5q8v2++gRPZbvSiueijbvsPCoJpFcfUyIOkc+FGG3NboMGW/GQ
         RtgT/QitPk7W06doVKNcz/XfNYDxlBfW89IKWglMkVQsZ8riZNHqAlQysLvpSuNjlDuL
         FV7/FyAalpaKo+Hrodia/5+RL8My5/zGjkVapMSE9MHWgtyy4JpgfuIllC9vre3g3/8t
         ElMrhBbuOEkWRtACGSCUaZk/AMigf5vV7KB2gQdKrhwdyiadCiMARCeQP8Jb2b1WaH4y
         jISQ==
X-Gm-Message-State: APjAAAWxOiq9O/vnkK8u+PK3d/ackSrDZ16pHwwZ0EHTlcPCUBHbyqLr
        Xtbp/HToek1C7MwVKJSHH5Q70D4tSS54c2gHfPS7ygriaic=
X-Google-Smtp-Source: APXvYqzoo5C984vU8Iy+tl043oXRKitBZW0Ulp5APFzZZJhaONueZejyYbL10a7sQO1ThU7lzPZcbZxGe7YDyCmN48k=
X-Received: by 2002:a02:896:: with SMTP id 144mr1647986jac.53.1555679899976;
 Fri, 19 Apr 2019 06:18:19 -0700 (PDT)
MIME-Version: 1.0
References: <CANpvso7JHdKUSyt0c5L_hXR6us39Or112t0NPvhJ6w5m07JYkA@mail.gmail.com>
In-Reply-To: <CANpvso7JHdKUSyt0c5L_hXR6us39Or112t0NPvhJ6w5m07JYkA@mail.gmail.com>
From:   Eric Curtin <ericcurtin17@gmail.com>
Date:   Fri, 19 Apr 2019 14:18:07 +0100
Message-ID: <CANpvso6ZB-nQm2ABWdbtoSuMU-pMnr_y-JradtS0UHPkOGMnGQ@mail.gmail.com>
Subject: Re: Microphone volume low on linux driver
To:     USB list <linux-usb@vger.kernel.org>, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

*the Windows driver

On Fri, 19 Apr 2019 at 14:17, Eric Curtin <ericcurtin17@gmail.com> wrote:
>
> Hi Guys,
>
> I have a headset, Linux recognizes it as "HyperX Virtual Surround Sound
> Digital Stereo", I have it set to 150% recording volume. It's a "HyperX
> Cloud II" headset, the Windows seems to work fine. I also tried
> "Digital Stereo (IEC958) Input" mode.
>
> Is there a quirk or similar in the kernel I can set in order to
> increase the recording volume of this device specifically?
>
> Some details about my system (it's xubuntu):
>
> username@hp-zbook-15-g5 14:13:12
> ~/>dpkg -l | grep -i pulseaud
> ii  gstreamer1.0-pulseaudio:amd64
> 1.14.1-1ubuntu1~ubuntu18.04.1
>      amd64        GStreamer plugin for PulseAudio
> ii  libcanberra-pulse:amd64                       0.30-5ubuntu1
>                                                        amd64
> PulseAudio backend for libcanberra
> ii  libpulse-mainloop-glib0:amd64                 1:11.1-1ubuntu7.2
>                                                        amd64
> PulseAudio client libraries (glib support)
> ii  libpulse0:amd64                               1:11.1-1ubuntu7.2
>                                                        amd64
> PulseAudio client libraries
> rc  libpulse0:i386                                1:11.1-1ubuntu7.2
>                                                        i386
> PulseAudio client libraries
> ii  libpulsedsp:amd64                             1:11.1-1ubuntu7.2
>                                                        amd64
> PulseAudio OSS pre-load library
> ii  pavucontrol                                   3.0-4
>                                                        amd64
> PulseAudio Volume Control
> ii  pulseaudio                                    1:11.1-1ubuntu7.2
>                                                        amd64
> PulseAudio sound server
> ii  pulseaudio-module-bluetooth                   1:11.1-1ubuntu7.2
>                                                        amd64
> Bluetooth module for PulseAudio sound server
> ii  pulseaudio-utils                              1:11.1-1ubuntu7.2
>                                                        amd64
> Command line tools for the PulseAudio sound server
> ii  xfce4-pulseaudio-plugin:amd64                 0.4.1-0ubuntu1
>                                                        amd64
> Xfce4 panel plugin to control pulseaudio
> username@hp-zbook-15-g5 14:13:15
> ~/git/Domino>lsb_release -a
> No LSB modules are available.
> Distributor ID: Ubuntu
> Description: Ubuntu 18.04.2 LTS
> Release: 18.04
> Codename: bionic
> username@hp-zbook-15-g5 14:13:20
> ~/git/Domino>uname -a
> Linux hp-zbook-15-g5 4.18.0-17-generic #18~18.04.1-Ubuntu SMP Fri Mar
> 15 15:27:12 UTC 2019 x86_64 x86_64 x86_64 GNU/Linux
>
> Regards,
>
> Eric
