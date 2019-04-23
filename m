Return-Path: <SRS0=tIEv=SZ=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 608C8C282DD
	for <linux-usb@archiver.kernel.org>; Tue, 23 Apr 2019 20:18:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2DE2C21850
	for <linux-usb@archiver.kernel.org>; Tue, 23 Apr 2019 20:18:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=mbuki-mvuki-org.20150623.gappssmtp.com header.i=@mbuki-mvuki-org.20150623.gappssmtp.com header.b="Gr2YwS3q"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727216AbfDWUSx (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 23 Apr 2019 16:18:53 -0400
Received: from mail-wm1-f49.google.com ([209.85.128.49]:56236 "EHLO
        mail-wm1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727184AbfDWUSx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 Apr 2019 16:18:53 -0400
Received: by mail-wm1-f49.google.com with SMTP id o25so1646824wmf.5
        for <linux-usb@vger.kernel.org>; Tue, 23 Apr 2019 13:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mbuki-mvuki-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ASdjcawRrrgqD5NQTFWWrPiiL1LVNSOCmnViIVcvQ6Y=;
        b=Gr2YwS3qU7+5fjpkMPPgO5j7LWl8WnaQDSn+E87hOzPVDtV7IJFviPAHW4Nwsmpl9E
         zNpD+1L95k15UwdQmn64KWeDIpMPHU1kIda0298HbUTMCmYFL9aE6kgR5bXePIJ4jMfw
         /BfGBzbGhz3vxGcTWiQera/+BY3vR805TiVK4oGa2pswGKlOjUYoMmpO6fYNLmYSy1HG
         hVSKjM6DLe+XUzOiFuAIMYbAzW0vdPpgjsAwDve03WdaUk2NjAVUg72k1YZDZMFgE9fa
         5ATsXw8pTKCxvgl/DQFaiO4O1GSdectA6/Hb1wmH+DLEvUu56E50do6dHudL9+CEGB9a
         wF8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ASdjcawRrrgqD5NQTFWWrPiiL1LVNSOCmnViIVcvQ6Y=;
        b=nlz8QXkhI+tIxZn83x5NQAs95iI8F2p5/plNE7BQgFWcQxzWcuS6/A5pLx8m/HIE6j
         Px94G/QVOFyT7V19q9z8cqRgjfugG72tLxARKFshqJs3fWsBLHqKOX3Wm4NL6JlWTXPl
         HLW5zDRWqpcZelrKigfHNZ+bl/4sP+1RX08qI1V4l0EsJNBG9bAJCqER3v/NWyUPdmRi
         Gy5+svA9BYptqd0gMyONXCiBgRYO1frt35pMaYI/8MLpcpSpY4vfS2TBI+0Ks4ZjPoQM
         kVqvSRagyuPrq3bhiVZUQz8DnORas18wghCwwFGoGjz/h7RaRR4CvI338ofu5jO2V7aF
         0a8Q==
X-Gm-Message-State: APjAAAU8OF1AcFWvvKvW6fthqR6uT4WLEMessM+j0rtlv2OorEFLxOyo
        X5uk8lwN7pMSX5OiWci9+F/0Ox6kUz2RM7NP357A+w==
X-Google-Smtp-Source: APXvYqz0c74W3/SXXAurawT7D62mo7DC7HpYucHH34+Gj20/qv8EnEvmc2KbfzlCiAGiiZUZopMUy698V0IClWXvKn0=
X-Received: by 2002:a1c:96d5:: with SMTP id y204mr3682109wmd.22.1556050731126;
 Tue, 23 Apr 2019 13:18:51 -0700 (PDT)
MIME-Version: 1.0
References: <CANSNSoVpnK6fyfFct7cLNRJAvdLWh0ac=isnPOkOAp4LV+WoSw@mail.gmail.com>
 <Pine.LNX.4.44L0.1904161054060.1605-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1904161054060.1605-100000@iolanthe.rowland.org>
From:   Jesse Hathaway <jesse@mbuki-mvuki.org>
Date:   Tue, 23 Apr 2019 15:18:40 -0500
Message-ID: <CANSNSoXHZf6kb2W1yJ81HztSkc-3BAjxghL6NchTLLyv362mQw@mail.gmail.com>
Subject: Re: Regression causes a hang on boot with a Comtrol PCI card
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Bjorn Helgaas <helgaas@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Apr 16, 2019 at 10:00 AM Alan Stern <stern@rowland.harvard.edu> wrote:
> Whatever the source of the problem, I don't think you're going to find
> it by looking at the USB code.  Perhaps the early initialization of the
> functions that _are_ present on the Comtrol card somehow messes up
> other parts of the system.

Thanks for all you help Alan,

I think at this point my Linux kernel debugging knowledge has run
aground. I would
love to crack this nut, but I doubt that will be possible with my
current knowledge base.
For now I am going to run the patched kernel even if I don't
understand precisely why
they prevent the box from hanging on boot when the Comtrol card is present.
