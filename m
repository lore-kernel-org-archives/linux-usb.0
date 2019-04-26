Return-Path: <SRS0=7cGN=S4=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB47BC43218
	for <linux-usb@archiver.kernel.org>; Fri, 26 Apr 2019 20:51:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 78B652084F
	for <linux-usb@archiver.kernel.org>; Fri, 26 Apr 2019 20:51:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Soay34AM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726322AbfDZUvR (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 26 Apr 2019 16:51:17 -0400
Received: from mail-vs1-f65.google.com ([209.85.217.65]:41451 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725966AbfDZUvQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 26 Apr 2019 16:51:16 -0400
Received: by mail-vs1-f65.google.com with SMTP id g187so2710537vsc.8
        for <linux-usb@vger.kernel.org>; Fri, 26 Apr 2019 13:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QoGZ8aBd5pUDNka2LL2yVwPWAVu8fmOL/8JcQwGWdRs=;
        b=Soay34AMmhIGBdhGM4OhRYleXmT8hmVMzCDvwou61BsU9MdPg49+ZHcBDlLhPMKOVN
         oSMZ4cjlkkNoEZ0nzHHzGuIdVfcAShjPdEzW95PJ3Aj+qV8XjPVxqkj/dTy0w4eK+zP3
         eAj2+/bLeJaBClYOT9rxDfullsG4C5rM0Hrn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QoGZ8aBd5pUDNka2LL2yVwPWAVu8fmOL/8JcQwGWdRs=;
        b=p1Qi4Nx/BU7/VP8eoxYQ6mSB6e/nDwOSNKdq4bRbTH7t8IVviUkOc7yvS61CEeXFbZ
         PpU8diDEgO38jEud+k5GvYFMPH4UR6caRDGQ714wtFMaoxWyimmbmC51T1T9Z0RPtP6z
         XfCh4bhhanDRpbUji+8750rbM2gfN5zmwdLjY4Faxdo5qguCapy/IXO2zvM5Ejy1QJlD
         g018UDP61qn2w3iM5dIEcu697EjrTWNfRNzO1Ced/sbuZWbDGv3sjbmqfVGnNeFzgTZ+
         tb/+gaTZOL3fmDYYkJzFBlEiK06pSjWV6szIqCv0Vkv/ZHQBpuKnv7tloai69tc4xYGK
         lpPQ==
X-Gm-Message-State: APjAAAWB2XOS6L7fbe3qL9yZZFsCcZsITfKEVqPGcNYQ81u0dHFckdoK
        0TpC5Nmq9imrmw3Yt8ufftlPOfROW6A=
X-Google-Smtp-Source: APXvYqzanIn66t/ZQb0ENuxGToeBSvVt89w0hTnUFNVaA8H9Z2NzU78TdsV6ZYLgD6+lAd0BAhqfRg==
X-Received: by 2002:a67:ed11:: with SMTP id l17mr12089835vsp.154.1556311875647;
        Fri, 26 Apr 2019 13:51:15 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id j71sm15629929vsd.0.2019.04.26.13.51.14
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Apr 2019 13:51:14 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id 33so1658485uay.0
        for <linux-usb@vger.kernel.org>; Fri, 26 Apr 2019 13:51:14 -0700 (PDT)
X-Received: by 2002:ab0:4870:: with SMTP id c45mr2652894uad.21.1556311874299;
 Fri, 26 Apr 2019 13:51:14 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1555672441.git.arturp@synopsys.com> <edf4726d21dd5a00013e5c26ac783906bc589d4d.1555672441.git.arturp@synopsys.com>
In-Reply-To: <edf4726d21dd5a00013e5c26ac783906bc589d4d.1555672441.git.arturp@synopsys.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 26 Apr 2019 13:51:03 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UNL-=n1CW+pQ2U4T1Mth5-qEY6ycp70jE8zqTTWE8BDQ@mail.gmail.com>
Message-ID:
 <CAD=FV=UNL-=n1CW+pQ2U4T1Mth5-qEY6ycp70jE8zqTTWE8BDQ@mail.gmail.com>
Subject: Re: [PATCH v1 09/14] usb: dwc2: Update dwc2_handle_usb_suspend_intr function.
To:     Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190426205103.jUHEakzPxBorfumERh3sMixmZ2GT8VxwTZnKXjFNxfs@z>

Hi,

On Fri, Apr 19, 2019 at 11:53 AM Artur Petrosyan
<Arthur.Petrosyan@synopsys.com> wrote:
>
> To avoid working in two modes (partial power down
> and hibernation) changed conditions for entering
> partial power down or hibernation.
>
> Instead of checking hw_params.power_optimized and
> hw_params.hibernation now checking power_down
> param which already set to one of the options
> (Hibernation or Partial Power Down) based on
> OTG_EN_PWROPT.
>
> Signed-off-by: Artur Petrosyan <arturp@synopsys.com>
> Signed-off-by: Minas Harutyunyan <hminas@synopsys.com>
> ---
>  drivers/usb/dwc2/core_intr.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)

In general I'm in support of this patch--it's cleaner and gets rid of
a needless goto \o/

...but you don't go far enough.  You can fully get rid of all of the
"-ENOTSUPP" stuff.  I've actually picked my patches and yours atop
Felipe's "testing/next" tree and you can find it here:

https://chromium.googlesource.com/chromiumos/third_party/kernel/+log/refs/sandbox/dianders/190426-dwc2-stuff

...as part of that I've included a patch ("usb: dwc2: Get rid of
useless error checks for hibernation/partial power down"), AKA:

https://chromium.googlesource.com/chromiumos/third_party/kernel/+/0c924f736e2f7c1bb02531aa33c04a3ae5f4fc4c

Feel free to squash that into your patch or add it to your series if
you like it.  Note that patch points out that there's are still some
instances where calling dwc2_exit_partial_power_down() might still
happen in a case where it's not obvious if we were in partial power
down mode and made me wonder if there might be some bugs there.

-Doug
