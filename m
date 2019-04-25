Return-Path: <SRS0=WMKl=S3=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59A2AC43219
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 15:02:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 714072081C
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 15:02:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jl8jwBE4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728678AbfDYPCh (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 25 Apr 2019 11:02:37 -0400
Received: from mail-vs1-f43.google.com ([209.85.217.43]:43877 "EHLO
        mail-vs1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726074AbfDYPCg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Apr 2019 11:02:36 -0400
Received: by mail-vs1-f43.google.com with SMTP id t23so33792vso.10
        for <linux-usb@vger.kernel.org>; Thu, 25 Apr 2019 08:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3lomtMqcyhps3PfHVgkP42bl6Mqq5G7s/JMXJKx+hlw=;
        b=jl8jwBE4GGo/5DWK0T740BaJZC1iQDU3GoLTGIJXgSerxs9aMcp+8b0kf/s+5MK/Yw
         9KMmNfS800C7xnWaWTJKFDFGQpKuCAplu1Gfs6FE/n/aAWrMwKES5YptGl9QK6pum17V
         KXpBTIziizz+GBVhsGisd0M+UE57+YB2Vf3xc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3lomtMqcyhps3PfHVgkP42bl6Mqq5G7s/JMXJKx+hlw=;
        b=BIhp1+oyc0T0p8wRsZ11fIXZJ2U+NnsNygQq+6+mFIB+Hlint9eRlgnumw85QZ5NQB
         gxgovyurUfdtwFEGZvzsLXBgJEC0HbDFEk5rUkBL4XVUPqTGwoMJby1VrsWjZ3aNUXUc
         qCq4DB0CuKuU0z0fE+nCPezKpUy53Nhj7MLYnYauXVoG1w9BavN0Dx8nDIcahw8cd1D4
         Ow5KrZvYw+b/p671CG7NKd/NOaWrDrV8wuuPV+Wpepl6fR0sEByDMWK73BK6d/MESMzi
         S5a8MNi8wGv+Tgvu25bqNDLzoph+T+jpQzSixTIw/4CHdcvTGUiwDQ1crVXPLxHBakjF
         sP1w==
X-Gm-Message-State: APjAAAUGXA0NooDaHXp6VpV1Rod64dwNp1P5FJ19381/iP1br2eWVBZp
        q621W/ZbPNXDltAWVV807vXBBbvrpBU=
X-Google-Smtp-Source: APXvYqxrC/d+FaaLKHEsZ2pCh1lPNEukJMXAj4ytGWn5KFS8oluigCAjsPcZ32AGH6Adqy9o/oGCEA==
X-Received: by 2002:a67:f288:: with SMTP id m8mr1748057vsk.138.1556204555208;
        Thu, 25 Apr 2019 08:02:35 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id c192sm14950288vka.10.2019.04.25.08.02.34
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Apr 2019 08:02:34 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id g16so92494uad.2
        for <linux-usb@vger.kernel.org>; Thu, 25 Apr 2019 08:02:34 -0700 (PDT)
X-Received: by 2002:a9f:204a:: with SMTP id 68mr1365838uam.19.1556204553623;
 Thu, 25 Apr 2019 08:02:33 -0700 (PDT)
MIME-Version: 1.0
References: <201904252107.obtIzehz%lkp@intel.com>
In-Reply-To: <201904252107.obtIzehz%lkp@intel.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 25 Apr 2019 08:02:22 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XSm1T6dgkzgUac25CaCvk3A=KCNUaBSLs9uqEB=2ka-g@mail.gmail.com>
Message-ID: <CAD=FV=XSm1T6dgkzgUac25CaCvk3A=KCNUaBSLs9uqEB=2ka-g@mail.gmail.com>
Subject: Re: [balbi-usb:testing/next 19/42] drivers/usb/dwc2/core_intr.c:448:25:
 error: 'struct dwc2_hsotg' has no member named 'phy_reset_work'
To:     Felipe Balbi <felipe.balbi@linux.intel.com>
Cc:     kbuild-all@01.org, linux-usb@vger.kernel.org,
        linux-omap <linux-omap@vger.kernel.org>,
        Yunzhi Li <lyz@rock-chips.com>,
        kbuild test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Thu, Apr 25, 2019 at 6:14 AM kbuild test robot <lkp@intel.com> wrote:
>
>    439                          /*
>    440                           * If we've got this quirk then the PHY is stuck upon
>    441                           * wakeup.  Assert reset.  This will propagate out and
>    442                           * eventually we'll re-enumerate the device.  Not great
>    443                           * but the best we can do.  We can't call phy_reset()
>    444                           * at interrupt time but there's no hurry, so we'll
>    445                           * schedule it for later.
>    446                           */
>    447                          if (hsotg->reset_phy_on_wake)
>  > 448                                  schedule_work(&hsotg->phy_reset_work);

Doh!  I didn't notice that the part of the structure I put this in has:

#if IS_ENABLED(CONFIG_USB_DWC2_HOST) || IS_ENABLED(CONFIG_USB_DWC2_DUAL_ROLE)

I'll whip something up real quick that should fix it.  Sorry about that!

-Doug
