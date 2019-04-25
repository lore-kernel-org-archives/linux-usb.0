Return-Path: <SRS0=WMKl=S3=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,T_DKIMWL_WL_HIGH autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0EE0C43219
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 20:12:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9831520717
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 20:12:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HLnqbkZw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730629AbfDYUMh (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 25 Apr 2019 16:12:37 -0400
Received: from mail-vs1-f65.google.com ([209.85.217.65]:34595 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725937AbfDYUMh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Apr 2019 16:12:37 -0400
Received: by mail-vs1-f65.google.com with SMTP id n17so651437vsr.1
        for <linux-usb@vger.kernel.org>; Thu, 25 Apr 2019 13:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UfNCC4cNJiY3lAUAdfNHomLA3rntwN1qhSdX3fgdF8U=;
        b=HLnqbkZwGIyYIxWOvDny5h/cIgWh9KBW/0awCRtKoyIvsow79Dykk74jMdsnNi+cMk
         L/PHBYJfjM6HYdfi7jTF2ZdRU1tsBP/ek9ss4dn6D9MMnz3ZpugTfutJn7f5STfouONU
         MfP44zMNQN3/TPuxiJyZj99PNzY1tlo992M1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UfNCC4cNJiY3lAUAdfNHomLA3rntwN1qhSdX3fgdF8U=;
        b=Xa6+WACrg1wFezfWXurIZ6riIKRRZEX2iHxvlBqJdFIHJHDL4bfE2H7CEMaNcy9CBR
         5DVQ0EO6s8Nc5RSuV5mEvKZ2MK0pNDOio1BzfweqXIJDc+PSWEoglCcirGTiXvW5MMYi
         +KE3mKBVV16sJy8M4lWzNlpgADtqop0qVRX9mqOAR654Nmk13CPgKMpNDR+Wwowd1/Ho
         cqNlPF0VinsXgEs/N41H0aEmcsREnK793NjOHJtmEsIeUvyKUXquCXR3nrEAG+QDZFRD
         O+3v4NtbhZrPe6xbAl1JOUQIbS7J0CkZ9/dT6nDPJBC8X76rk/IS9RfiKGfa2wd0i2Dj
         EFUQ==
X-Gm-Message-State: APjAAAXyKFosZdpTGWYoOYqAqxvezBOxGANN0N8Vu/YkYVZdb8TKxSf2
        JwDPu+zE/fpkWMk0yNbeEda6OQ8410U=
X-Google-Smtp-Source: APXvYqypM7ofjXe6ZqAzlMvI9HaTIPP8MV4XQsUErTAOkI17f+wgJndiuEi1LYPqcTa1sBSmKwiRbg==
X-Received: by 2002:a67:f353:: with SMTP id p19mr22699697vsm.114.1556223156222;
        Thu, 25 Apr 2019 13:12:36 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id y1sm15481677uai.0.2019.04.25.13.12.35
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Apr 2019 13:12:35 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id n17so651401vsr.1
        for <linux-usb@vger.kernel.org>; Thu, 25 Apr 2019 13:12:35 -0700 (PDT)
X-Received: by 2002:a67:7b53:: with SMTP id w80mr22582363vsc.144.1556223154836;
 Thu, 25 Apr 2019 13:12:34 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1555672441.git.arturp@synopsys.com> <87k1fis1b5.fsf@linux.intel.com>
 <SN1PR12MB2431EB450993E07730C3672FA73D0@SN1PR12MB2431.namprd12.prod.outlook.com>
In-Reply-To: <SN1PR12MB2431EB450993E07730C3672FA73D0@SN1PR12MB2431.namprd12.prod.outlook.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 25 Apr 2019 13:12:23 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WKJMks9oCdUVS9vTKp9yD_VPE_uaAmTM9HgNoz8tt4pA@mail.gmail.com>
Message-ID: <CAD=FV=WKJMks9oCdUVS9vTKp9yD_VPE_uaAmTM9HgNoz8tt4pA@mail.gmail.com>
Subject: Re: [PATCH v1 00/14] usb: dwc2: Fix and improve power saving modes.
To:     Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Thu, Apr 25, 2019 at 7:01 AM Artur Petrosyan
<Arthur.Petrosyan@synopsys.com> wrote:
>
> Hi,
>
> On 4/25/2019 16:43, Felipe Balbi wrote:
> > Artur Petrosyan <Arthur.Petrosyan@synopsys.com> writes:
> >> This patch set, fixes and improves partial power down and hibernation power
> >> saving modes. Also, adds support for entering/exiting hibernation by
> >> system issued suspend/resume.
> >>
> >> This series contains patches which were submitted to LKML. However, a part
> >> of those patches didn't reach to LKML because of local issue related to
> >> smtp server.
> >>
> >> The patches which reached to LKML are:
> >>
> >> - usb: dwc2: Add part. power down exit from dwc2_conn_id_status_change().
> >> - usb: dwc2: Add port conn. sts. checking in _dwc2_hcd_resume() function.
> >> - usb: dwc2: Fix suspend state in host mode for partial power down.
> >> - usb: dwc2: Fix wakeup detected and session request interrupt handlers.
> >> - usb: dwc2: Add descriptive debug messages for Partial Power Down mode.
> >> - usb: dwc2: Fix dwc2_restore_device_registers() function.
> >>
> >> The patches which didn't reach to LKML are:
> >>
> >> - usb: dwc2: Add enter/exit hibernation from system issued suspend/resume
> >> - usb: dwc2: Clear GINTSTS_RESTOREDONE bit after restore is generated.
> >> - usb: dwc2: Clear fifo_map when resetting core.
> >> - usb: dwc2: Allow exiting hibernation from gpwrdn rst detect
> >> - usb: dwc2: Fix hibernation between host and device modes.
> >> - usb: dwc2: Update dwc2_handle_usb_suspend_intr function.
> >> - usb: dwc2: Add default param to control power optimization.
> >> - usb: dwc2: Reset DEVADDR after exiting gadget hibernation.
> >>
> >> Submitting all of the patches together in this version.
> >>
> >> Changes from V0:
> >>   - Replaced 1 with DWC2_POWER_DOWN_PARAM_PARTIAL in commit
> >>     "9eed02b9fe96 usb: dwc2: Fix wakeup detected and session request
> >>     interrupt handlers.
> >>
> >>
> >> Artur Petrosyan (14):
> >>    usb: dwc2: Fix dwc2_restore_device_registers() function.
> >>    usb: dwc2: Add descriptive debug messages for Partial Power Down mode.
> >>    usb: dwc2: Fix wakeup detected and session request interrupt handlers.
> >>    usb: dwc2: Fix suspend state in host mode for partial power down.
> >>    usb: dwc2: Add port conn. sts. checking in _dwc2_hcd_resume()
> >>      function.
> >>    usb: dwc2: Add part. power down exit from
> >>      dwc2_conn_id_status_change().
> >>    usb: dwc2: Reset DEVADDR after exiting gadget hibernation.
> >>    usb: dwc2: Add default param to control power optimization.
> >>    usb: dwc2: Update dwc2_handle_usb_suspend_intr function.
> >>    usb: dwc2: Fix hibernation between host and device modes.
> >>    usb: dwc2: Allow exiting hibernation from gpwrdn rst detect
> >>    usb: dwc2: Clear fifo_map when resetting core.
> >>    usb: dwc2: Clear GINTSTS_RESTOREDONE bit after restore is generated.
> >>    usb: dwc2: Add enter/exit hibernation from system issued
> >>      suspend/resume
> >
> > patches don't apply.
> >
>
> Do we need to wait for Minas's acknowledge or there is problem related
> to the patches?

It looks like the problem is that my patches won the race and Felipe
applied them before yours.  Thus, presumably, it'll be up to you to
rebase your patches atop mine and re-submit.  Specifically, you can
do:

git remote add linux_usb_balbi
git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git
git fetch linux_usb_balbi
git checkout linux_usb_balbi/testing/next

If you do that and then try to apply your patches you'll find that
they no longer apply.  AKA try running:

for patch in 10909749 10909737 10909739 10909745 10909533 \
   10909531 10909747 10909535 10909523 10909741 10909525 \
   10909751 10909527 10909743; do
  curl -L https://patchwork.kernel.org/patch/${patch}/mbox | git am
done

You'll see:

> Applying: usb: dwc2: Fix wakeup detected and session request interrupt handlers.
> error: patch failed: drivers/usb/dwc2/core_intr.c:435
> error: drivers/usb/dwc2/core_intr.c: patch does not apply
> Patch failed at 0001 usb: dwc2: Fix wakeup detected and session request interrupt handlers.

NOTE: before reposting it might be a good idea to apply the last 3
patches in my series as per [1] before sending up your series.  Since
Felipe has already applied patches #1 and #2 in that series presumably
he'll also apply #3 - #5.

I know it'a also up to me to try testing our your patches.  It's still
on my list to give it a shot...

[1] https://lkml.kernel.org/r/CAD=FV=WA07+gUkVvsikN=iDHZLUJQtzjkKtiBHAEDw4gLNWY7w@mail.gmail.com

P.S: It's helpful if you CC LKML on patches and discussions about
them.  That allows the magic "permalink via message ID" on
lkml.kernel.org and also allows your patches to be found on
lore.kernel.org/patchwork/

-Doug
