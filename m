Return-Path: <SRS0=WMKl=S3=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A021C43218
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 15:42:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6F4072088F
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 15:42:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="m1HP5Jgx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727444AbfDYPmD (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 25 Apr 2019 11:42:03 -0400
Received: from mail-vk1-f179.google.com ([209.85.221.179]:34278 "EHLO
        mail-vk1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727210AbfDYPmD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Apr 2019 11:42:03 -0400
Received: by mail-vk1-f179.google.com with SMTP id x84so75508vkd.1
        for <linux-usb@vger.kernel.org>; Thu, 25 Apr 2019 08:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OJvh8f1BrQldnLltJiOjTYwDmvNCqLdheWtTZDr4MFA=;
        b=m1HP5Jgxv3ItBuep0ImZAEWy5h+Qsdgbd33tsUxb66IBg/TL5im+3iDy9vNdyz/1Np
         Wws1Dw5jnnuhqEmUnCXw5TVtdDSBgmcvwoPk4lSFzISRzaf467qH9is8bNnsnmxFMEUU
         S3Juep6PHTfV/yfcL8pqyZ31bclmqTKx3U2O0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OJvh8f1BrQldnLltJiOjTYwDmvNCqLdheWtTZDr4MFA=;
        b=ha+cZZYj+QN1N/TXlAv4lYZ+eW0NRRazfw4uGxsMZDrnT0bRY6wjVYnuFRhV7PhNby
         iUdDCe9Mhl92Evybln/x/sQbFaf0GO23CNuFCkEY+cnNEgVjzd08MbDZ8QtgbueSK6S4
         gHvDLvhBR1Ritks/LjbnK6jNvB1HDFfs24oHNsyLE2DEH1UfHcg5VvesW8X3goiLvQYS
         HoM/5p+tB+bXTv4MNCEzY42bSYTH+8atR7ke7Jehd6E9XrDfcJenY76BmqKKkaEjLX6H
         367dhLw0eBt6Kw3L5SP1AE+OjKZ1EAZYPDUUSwIksjbB++LwSLskOUyE6Tr6N9Kd6YPC
         5D9w==
X-Gm-Message-State: APjAAAV9P439cAiroSEQ0tOgeKBgF/tDnBljnHbAYNahU9a3PofNes0z
        C7bw3CA2TSB6MU9Tr9lqFZ0vQTtn0EY=
X-Google-Smtp-Source: APXvYqwWjLYCkbMRquyezNmwQFtsWcpA7ftRa2NMd0gPwNEpevkfO2SxgFe1rZaQFW/tAIC+OS+XYQ==
X-Received: by 2002:a1f:ce07:: with SMTP id e7mr11662374vkg.23.1556206921864;
        Thu, 25 Apr 2019 08:42:01 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id w69sm8899762vsc.8.2019.04.25.08.42.00
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Apr 2019 08:42:00 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id s80so53685vke.6
        for <linux-usb@vger.kernel.org>; Thu, 25 Apr 2019 08:42:00 -0700 (PDT)
X-Received: by 2002:a1f:8382:: with SMTP id f124mr5329214vkd.70.1556206919980;
 Thu, 25 Apr 2019 08:41:59 -0700 (PDT)
MIME-Version: 1.0
References: <201904252107.obtIzehz%lkp@intel.com> <CAD=FV=XSm1T6dgkzgUac25CaCvk3A=KCNUaBSLs9uqEB=2ka-g@mail.gmail.com>
In-Reply-To: <CAD=FV=XSm1T6dgkzgUac25CaCvk3A=KCNUaBSLs9uqEB=2ka-g@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 25 Apr 2019 08:41:48 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xfi-H-eknkYo6WoCGqk_r1jq2gX2BgA2L9xDLvGAjOBg@mail.gmail.com>
Message-ID: <CAD=FV=Xfi-H-eknkYo6WoCGqk_r1jq2gX2BgA2L9xDLvGAjOBg@mail.gmail.com>
Subject: Re: [balbi-usb:testing/next 19/42] drivers/usb/dwc2/core_intr.c:448:25:
 error: 'struct dwc2_hsotg' has no member named 'phy_reset_work'
To:     Felipe Balbi <felipe.balbi@linux.intel.com>
Cc:     kbuild-all@01.org, linux-usb@vger.kernel.org,
        linux-omap <linux-omap@vger.kernel.org>,
        kbuild test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Thu, Apr 25, 2019 at 8:02 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Thu, Apr 25, 2019 at 6:14 AM kbuild test robot <lkp@intel.com> wrote:
> >
> >    439                          /*
> >    440                           * If we've got this quirk then the PHY is stuck upon
> >    441                           * wakeup.  Assert reset.  This will propagate out and
> >    442                           * eventually we'll re-enumerate the device.  Not great
> >    443                           * but the best we can do.  We can't call phy_reset()
> >    444                           * at interrupt time but there's no hurry, so we'll
> >    445                           * schedule it for later.
> >    446                           */
> >    447                          if (hsotg->reset_phy_on_wake)
> >  > 448                                  schedule_work(&hsotg->phy_reset_work);
>
> Doh!  I didn't notice that the part of the structure I put this in has:
>
> #if IS_ENABLED(CONFIG_USB_DWC2_HOST) || IS_ENABLED(CONFIG_USB_DWC2_DUAL_ROLE)
>
> I'll whip something up real quick that should fix it.  Sorry about that!

https://lkml.kernel.org/r/20190425154021.4465-1-dianders@chromium.org

-Doug
