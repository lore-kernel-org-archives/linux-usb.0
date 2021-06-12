Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3D9AC48BE5
	for <linux-usb@archiver.kernel.org>; Sat, 12 Jun 2021 11:15:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C23E061376
	for <linux-usb@archiver.kernel.org>; Sat, 12 Jun 2021 11:15:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231200AbhFLLRN (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 12 Jun 2021 07:17:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230470AbhFLLRM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 12 Jun 2021 07:17:12 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F8F2C061574;
        Sat, 12 Jun 2021 04:15:13 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id r198so12606393lff.11;
        Sat, 12 Jun 2021 04:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=cgwUnmJkB50r3DBuEOmmIHxo48kJwaYqA0S/tM5/SHs=;
        b=abeKq+JNpx20z5F1ICSMZabYj8NC78fKeStMImKX7nV4IpbwpwsRR5GTnMKyfwKuru
         T1ELnEOh05NMpH6YICIHo8FMtg2yGVmMtP0aGwOSFCvSlWPMXVRRi5e2FNMKnWDY8vnh
         4+y/OXxUPOpauCHLhy4A2sPnLKkMcqIJw8JpA16sTSqLzeMfRlEixcR2I6CiWIA0OqUA
         Uc3WKI9XZFVZO9J6SWbX7L+8eA05ux/u086K+Vw8iCjlRmhiUWEObo6gt0H9yydBQjHb
         VBlcyPVyQN3j2YR5MdAwyAlTuBaYdnU4AjXN4MURiH1+4yL+R8E0Ug/Jb1gWUV5/sUmB
         MuXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=cgwUnmJkB50r3DBuEOmmIHxo48kJwaYqA0S/tM5/SHs=;
        b=AcB4Ib3BpOgDJA2G0WbabnQIxOEPsfzi1eYTLE0Wkdb6WmfC68MF36o+ykhjvio/pi
         FLAKfc+FKrQ54/SVxOmWFqA3VQHGI51qCGmFV7w7rmgyPp+K1TA3QYZ0n5ybu+mJCdqa
         pllDGyEqa1ihVAz4IQURPvsk2ecj/3WSeh6+AaMpJfZqnUBbylE0pV/xjY7KsTBldyAw
         gRgC8SNjxmJ1LISz43Z5M6SsngPcsCyuG0Ufen3WXkQojBWWX9NHXFvoZWW7KC4PdQIu
         dE/Rb4mqCAG6wBzoRTU7lCoDDQVk/zjG5O8lrNeR5pLMEaTjEVKn9Fx4pnMPg6zyzJ/U
         wv2Q==
X-Gm-Message-State: AOAM530Qwx0fs7Az5aqWmdMqyrS7KUOPT3MDT8mPPYfobiy4UaZf/ENd
        5eLWWbg3M0XDu9LN8W/J4ubEiKBMIHAWAdqle+cJIT2z7vqQHQ==
X-Google-Smtp-Source: ABdhPJwlziM9cCOwflS0bsLUk2oJuChO0xswWolhjoHYtXv3ZWtmM95Oq9hFCjGGAf2N1nD77cf0DCe8pMtODDQ/CNk=
X-Received: by 2002:ac2:5b44:: with SMTP id i4mr5781720lfp.652.1623496511442;
 Sat, 12 Jun 2021 04:15:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAHhAz+haTa8FJep+mokae4O7Gy9zzq2dbPk28fuEH5FO24uTzw@mail.gmail.com>
 <26698.1623455194@turing-police>
In-Reply-To: <26698.1623455194@turing-police>
From:   Muni Sekhar <munisekharrms@gmail.com>
Date:   Sat, 12 Jun 2021 16:45:00 +0530
Message-ID: <CAHhAz+goVhacpDPc-OaVuG151TS8QKYdsqdnK9UcAx+Hc07zSg@mail.gmail.com>
Subject: Re: USB sound card issues
To:     =?UTF-8?Q?Valdis_Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>
Cc:     linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
        alsa-devel <alsa-devel@alsa-project.org>,
        kernelnewbies <kernelnewbies@kernelnewbies.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Jun 12, 2021 at 5:16 AM Valdis Kl=C4=93tnieks
<valdis.kletnieks@vt.edu> wrote:
>
> On Tue, 08 Jun 2021 16:20:07 +0530, Muni Sekhar said:
>
> > $ arecord --device hw:1,0 --channels 1 --format S16_LE --rate 32000_Hz =
x.wav
> > Recording WAVE 'x.wav' : Signed 16 bit Little Endian, Rate 32000 Hz, Mo=
no
> > arecord: pcm_read:2032: read error: Input/output error
>
> Always check the obvious stuff first  does the card support S16_LE 32Khz =
data?
Yes , it supports.
> And if it's configurable for multiple formats, was it set for the correct=
 one?
Is there a way to verify was it set for the correct one or not?
>
> Does wireshark or other USB snoop program show any traffic at all?
> Does the record die immediately, or hang for a few seconds and timeout?
What is the difference between these two ways? For my hardware, I
noticed that it hangs for a few seconds and gives EIO (arecord:
pcm_read:2032: read error: Input/output error).
> Does 'arecord -v' or arecord -vv' tell us anything more about the situati=
on?



--=20
Thanks,
Sekhar
