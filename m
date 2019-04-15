Return-Path: <SRS0=TXFt=SR=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED526C10F0E
	for <linux-usb@archiver.kernel.org>; Mon, 15 Apr 2019 21:47:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BB6D0206B6
	for <linux-usb@archiver.kernel.org>; Mon, 15 Apr 2019 21:47:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=mbuki-mvuki-org.20150623.gappssmtp.com header.i=@mbuki-mvuki-org.20150623.gappssmtp.com header.b="kt8zl76P"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728084AbfDOVrT (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 15 Apr 2019 17:47:19 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:45924 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727214AbfDOVrT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 15 Apr 2019 17:47:19 -0400
Received: by mail-wr1-f68.google.com with SMTP id s15so23889933wra.12
        for <linux-usb@vger.kernel.org>; Mon, 15 Apr 2019 14:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mbuki-mvuki-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2mYPKJwiykBYivU1xKRnC9lEdWiu662zi9Gpi4fZ6KE=;
        b=kt8zl76PaUjEhO8D1LVUSnTTRJ6rWv8L7w8nOtVQxh2lWnFL2vP9fldXfdSKbpjxwv
         utR398y+ET2zjcDkjiQasptZX5+VrI17QA+ldghk0uZPJJuYIpV3zc92JQrKvJSNJqEn
         OMGpS1SmyswbrMGSLEaI865Naz4Q4TSwhEMyKpFLLDHjXQHswmB3vzl8i7zyJSrq2fD9
         yCEJDOu15mb4OQYCv6q1cJPKe9oUhIK7lpgaoB476AFvnU2mUx9Bzk8rkpjk4RK6oZO8
         S2WQT+1eNK42uPy9piiwKVK29wW/m8Vk9PTkp5Dm85q6wBegb/R4JoMMmJYyU5JS1ecf
         lA9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2mYPKJwiykBYivU1xKRnC9lEdWiu662zi9Gpi4fZ6KE=;
        b=gLrgq2HY8iHKe+TUwwQEgvGA2V7HTr2EzpEEVrk6m9xpPyNiQuwBTnocyby3MmJNPz
         wkSYqH2sBdiX0axjfIF816Ou6o6j1GwtPTyjlkIrBFMl+KwndaKpvLWjVuvZoZiUSTZI
         iFO5K/oP0M57ME8BZ6Rrq4EYmpLQnDGluZmbets0WlVsefHyFqd2zi8EKSwH8tSpWzpf
         jqXGxcPNrHNW9Xb14jdSAzKY76EbqlN8vawj3t4JWmGgcNE2zbK580TeNR0+EYSx/bik
         UvqBnvstTdhmE5RaphYGnRevqArRPm8Ljll3EXnErcY2+L7kZTqC9P1R0AC+ZEKe6X3V
         4fcg==
X-Gm-Message-State: APjAAAWxdwDHOMWfsMOBX5nIPp2ht6F9wHFHzgChOXZShkqnyv4KTNEq
        djVmHX2JyNjo2FxNhFSnhuZC/2JNMSOVl8r/zm7Tag==
X-Google-Smtp-Source: APXvYqzq8Wl4F14sE8D7priUVkmNA2BEjKQfSvwMC8ttpoGm5cLQofJ8g/5uedXxs3Gitt5j6YLCFbKA9NIk3dSONtU=
X-Received: by 2002:adf:edca:: with SMTP id v10mr20631184wro.157.1555364836976;
 Mon, 15 Apr 2019 14:47:16 -0700 (PDT)
MIME-Version: 1.0
References: <CANSNSoVGLEkRE5DPyVhPVdsCbu44SOu0Tpf7smWjPUn_qwRHHA@mail.gmail.com>
 <Pine.LNX.4.44L0.1904061121410.19196-100000@netrider.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1904061121410.19196-100000@netrider.rowland.org>
From:   Jesse Hathaway <jesse@mbuki-mvuki.org>
Date:   Mon, 15 Apr 2019 16:47:06 -0500
Message-ID: <CANSNSoVpnK6fyfFct7cLNRJAvdLWh0ac=isnPOkOAp4LV+WoSw@mail.gmail.com>
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

On Sat, Apr 6, 2019 at 10:32 AM Alan Stern <stern@rowland.harvard.edu> wrote:
> Well, at least that's forward progress.  I don't know what pstore is or
> what connection it has to the USB subsystem.  Does the machine hang
> similarly if you boot without the Comtrol PCI card present?

Yes the box boots fine when the Comtrol PCI card is *not* present.

> For that matter, what happens if you remove EHCI from the kernel
> configuration completely?

If I remove USB support, the box still hangs after registering the pstore, but
if I remove pstore support and APEI support from the kernel then the box boots
without issue.

> As for how the PCI card affects the USB handoff, it depends on how the
> BIOS behaves.  Normally the BIOS will take control of all the available
> EHCI controllers during bootup (so that it can use them to communicate
> with a USB keyboard or mouse), including controllers on add-on PCI
> cards as well as those on the motherboard.  When the kernel starts up,
> it tries to take ownership of the controllers away from the BIOS
> (that's the handoff) so that Linux can use them.  However, if the BIOS
> was never tested for handoff of USB controllers on add-on PCI cards, it
> could easily have a bug that would crash the machine.

The Comtrol card provides 32 serial ports, via a breakout box, but it has
no USB functionality, which was why I was surprised that its presence
somehow breaks the USB hand off.
