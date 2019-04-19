Return-Path: <SRS0=lmIm=SV=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=3.0 tests=DATE_IN_PAST_03_06,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7F77C282DA
	for <linux-usb@archiver.kernel.org>; Fri, 19 Apr 2019 19:11:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B30BE20821
	for <linux-usb@archiver.kernel.org>; Fri, 19 Apr 2019 19:11:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qn1sNW11"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727852AbfDSTLi (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 19 Apr 2019 15:11:38 -0400
Received: from mail-io1-f47.google.com ([209.85.166.47]:39969 "EHLO
        mail-io1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726634AbfDSTLh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 Apr 2019 15:11:37 -0400
Received: by mail-io1-f47.google.com with SMTP id i21so4557117iol.7;
        Fri, 19 Apr 2019 12:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=YX1+LC6ogeciedQzxSK5Z/nE7MwrJJYpFIy+EY18FBU=;
        b=qn1sNW11MBGs+jOB+vH7Ybf6UZgc5j2sNJ8hbRZeHcvyN4TAESYbXq82vFC3fA30E7
         gyzbIG49YGXHhd/0ipTy9VN2Ew57C4xpBpFhezrlmEL/6K3WdX8PM9/LQamEhKGoi+0h
         A9gOTmTgQO+2vfacz0bgkP6KqYcpLhCeXPtIxOPzBB5AbpGwQwhz+5YQ+hjKUDHDf6fZ
         zC8Ve91AtUPuUFhFP1RY6nXmVQcI18VP8Q7gHJoBsrvxJsIj8URrsrTx5i7/ziv+fGdN
         RVL7E4AZnB//CDMRky0UhAP4eRC2cEw116b5SJ8tRD4xYKaQ8QRcfWUZPeuh48Dz7wnM
         hwbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=YX1+LC6ogeciedQzxSK5Z/nE7MwrJJYpFIy+EY18FBU=;
        b=N+BZ5D0eO2k1wZfOelCLyXHPBpNlk9i3QAGoAYzOXarZxkr6kP9UYfpcHmy6OeB5Dw
         /vzsxJgh4WwOadvAgviwW528KFp1dZZl0Vmu1sP9733/zNjRfZ+vrD5R1GpE2j9jRtq+
         wdn5lEdOHqLluJse50oC5vUEI7TCQdzsR5h14lTdgFy/XEdKs89ELD3IcAKsfMjPyUT/
         9hBZ/VxVqWqrUZ8e/KJ1XCyfDXz+QQrhdCKYXI2vyRTxJhlkvDDOPZxykTwbk7QIQkMh
         oXz0XVw8DtfkL51FoS6xxB2BgIxH+8TltAIglCofm/a1avOoYhpsF7mbsI8V9v5HUA/V
         uAJg==
X-Gm-Message-State: APjAAAXq9o6JKKxqesl00+ps2n1dHUKoKlF+gE9UrIBFlvV37UUixyqF
        1IdJQVzh3pljVKmEY/KJIP1CLlEHTak9M60hsVTyR4/yzLxJfA==
X-Google-Smtp-Source: APXvYqzXnVAh1BvMXSYknDvK4uhT+Ux1IpjBT3M3VMSd9bP2RzudU0VN0EQSETTaTKzJFMz3WOmKTiB3S3eTooNYzfs=
X-Received: by 2002:a5d:9d46:: with SMTP id k6mr177227iok.12.1555679863690;
 Fri, 19 Apr 2019 06:17:43 -0700 (PDT)
MIME-Version: 1.0
From:   Eric Curtin <ericcurtin17@gmail.com>
Date:   Fri, 19 Apr 2019 14:17:31 +0100
Message-ID: <CANpvso7JHdKUSyt0c5L_hXR6us39Or112t0NPvhJ6w5m07JYkA@mail.gmail.com>
Subject: Microphone volume low on linux driver
To:     USB list <linux-usb@vger.kernel.org>, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Guys,

I have a headset, Linux recognizes it as "HyperX Virtual Surround Sound
Digital Stereo", I have it set to 150% recording volume. It's a "HyperX
Cloud II" headset, the Windows seems to work fine. I also tried
"Digital Stereo (IEC958) Input" mode.

Is there a quirk or similar in the kernel I can set in order to
increase the recording volume of this device specifically?

Some details about my system (it's xubuntu):

username@hp-zbook-15-g5 14:13:12
~/>dpkg -l | grep -i pulseaud
ii  gstreamer1.0-pulseaudio:amd64
1.14.1-1ubuntu1~ubuntu18.04.1
     amd64        GStreamer plugin for PulseAudio
ii  libcanberra-pulse:amd64                       0.30-5ubuntu1
                                                       amd64
PulseAudio backend for libcanberra
ii  libpulse-mainloop-glib0:amd64                 1:11.1-1ubuntu7.2
                                                       amd64
PulseAudio client libraries (glib support)
ii  libpulse0:amd64                               1:11.1-1ubuntu7.2
                                                       amd64
PulseAudio client libraries
rc  libpulse0:i386                                1:11.1-1ubuntu7.2
                                                       i386
PulseAudio client libraries
ii  libpulsedsp:amd64                             1:11.1-1ubuntu7.2
                                                       amd64
PulseAudio OSS pre-load library
ii  pavucontrol                                   3.0-4
                                                       amd64
PulseAudio Volume Control
ii  pulseaudio                                    1:11.1-1ubuntu7.2
                                                       amd64
PulseAudio sound server
ii  pulseaudio-module-bluetooth                   1:11.1-1ubuntu7.2
                                                       amd64
Bluetooth module for PulseAudio sound server
ii  pulseaudio-utils                              1:11.1-1ubuntu7.2
                                                       amd64
Command line tools for the PulseAudio sound server
ii  xfce4-pulseaudio-plugin:amd64                 0.4.1-0ubuntu1
                                                       amd64
Xfce4 panel plugin to control pulseaudio
username@hp-zbook-15-g5 14:13:15
~/git/Domino>lsb_release -a
No LSB modules are available.
Distributor ID: Ubuntu
Description: Ubuntu 18.04.2 LTS
Release: 18.04
Codename: bionic
username@hp-zbook-15-g5 14:13:20
~/git/Domino>uname -a
Linux hp-zbook-15-g5 4.18.0-17-generic #18~18.04.1-Ubuntu SMP Fri Mar
15 15:27:12 UTC 2019 x86_64 x86_64 x86_64 GNU/Linux

Regards,

Eric
