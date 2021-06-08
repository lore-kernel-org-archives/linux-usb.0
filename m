Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88F02C48BCD
	for <linux-usb@archiver.kernel.org>; Tue,  8 Jun 2021 10:50:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 73198610A1
	for <linux-usb@archiver.kernel.org>; Tue,  8 Jun 2021 10:50:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232038AbhFHKwa (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 8 Jun 2021 06:52:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231790AbhFHKw3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Jun 2021 06:52:29 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45702C061789;
        Tue,  8 Jun 2021 03:50:20 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id r14so7220607ljd.10;
        Tue, 08 Jun 2021 03:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=dB+nmR8+Tc/nCCNZcI2EpDQSJlpRU8A/+Y1HXrRVoUw=;
        b=BstLqIKpfGoEK6rDUJbcZLEppzp/Q8bBIEMInEoh6j+sdJ2090UapIvSb+eji2vXi1
         m7daULS6gEfxmnXocM6GdrPNcfWe10uFhczJk+qL8eDj9xqtvp95rh3rutByzMRz+4Ec
         YT//T2Sa+y41tGDJekiurs//NJP/NWRqIIhMxENxfs+8IoDlK1hS0kRzsPEp9LNtVMC2
         ENTD374GmJPC66LTPNG2pE9SeQVeZppCXOfqYW/4wWCk16Rmsjlx5U9lJoNmUOWdvZz9
         KoEY5Q+EwvidnRZZdsNO/B5q0TXiP6n2hB4f8nzh2xlLCSdCcmAUNkEKMTLAYsKT83D7
         X6Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=dB+nmR8+Tc/nCCNZcI2EpDQSJlpRU8A/+Y1HXrRVoUw=;
        b=ouc/NSxlLUXSPUt7Zeia8FkqktnoYNFWX2ihAExofCP5l9Ipy9ngLwW45lzmX9m1yb
         C3d+DcMOf0HyDJ+CuUzsTzl4MRjMt22RmD/DYxDJsTRh7TqsFwH6O2aVDgsHGXVOUPAN
         /ShwW/Mfl/Yh7qWctdKpqRa3lS+w284De4TwqQYzxexB324mktZ6J1BHUOqLIBxMLKCG
         mxy6kcIuNHRsKiTzqivy4F5TMx3DnA99duOTI6RcwTEnuTu2x6SbtOjgXUhDAY8ugGGf
         6xs/JxJvENny0DY8xBlQhMf6G18r1Dan7e4FxSZdpK3U70TJ/KAPpvy5EOpE501qR08s
         mTBg==
X-Gm-Message-State: AOAM533YHwCx6yQKBJQsv/d7n/ff1OOK93i1fSuPwVoeiVj0sTZGFvEw
        835zcsVHOpT7qIzk25IMCpHQfi+IA5KjsEm6Y5QucGSKcDJ5qw==
X-Google-Smtp-Source: ABdhPJzGGtmDdcTqLOq9F3vOQ+dyl6J+bDPgUqWDqLPfQXbx263eVN2SgMbznVF/Kdr4UDmw6vlLVi9H5F326FscODE=
X-Received: by 2002:a05:651c:20c:: with SMTP id y12mr3565070ljn.428.1623149418374;
 Tue, 08 Jun 2021 03:50:18 -0700 (PDT)
MIME-Version: 1.0
From:   Muni Sekhar <munisekharrms@gmail.com>
Date:   Tue, 8 Jun 2021 16:20:07 +0530
Message-ID: <CAHhAz+haTa8FJep+mokae4O7Gy9zzq2dbPk28fuEH5FO24uTzw@mail.gmail.com>
Subject: USB sound card issues
To:     linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
        alsa-devel <alsa-devel@alsa-project.org>,
        kernelnewbies <kernelnewbies@kernelnewbies.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi all,

I am using a USB sound card(snd-usb-audio), and it fails while doing
the audio recording "arecord: pcm_read:2032: read error: Input/output
error".

What could be the problem? and is there a workaround for this?

$ arecord -l
**** List of CAPTURE Hardware Devices ****
card 1: BT_AG [BT_002], device 0: USB Audio [USB Audio]
  Subdevices: 1/1
  Subdevice #0: subdevice #0


$ arecord --device hw:1,0 --channels 1 --format S16_LE --rate 32000_Hz x.wav
Recording WAVE 'x.wav' : Signed 16 bit Little Endian, Rate 32000 Hz, Mono
arecord: pcm_read:2032: read error: Input/output error

-- 
Thanks,
Sekhar
