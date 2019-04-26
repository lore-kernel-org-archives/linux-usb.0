Return-Path: <SRS0=7cGN=S4=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99B78C43219
	for <linux-usb@archiver.kernel.org>; Fri, 26 Apr 2019 20:42:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 633A92084F
	for <linux-usb@archiver.kernel.org>; Fri, 26 Apr 2019 20:42:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="anXa6uBC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726077AbfDZUmp (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 26 Apr 2019 16:42:45 -0400
Received: from mail-vs1-f65.google.com ([209.85.217.65]:41073 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725966AbfDZUmp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 26 Apr 2019 16:42:45 -0400
Received: by mail-vs1-f65.google.com with SMTP id g187so2698308vsc.8
        for <linux-usb@vger.kernel.org>; Fri, 26 Apr 2019 13:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HGypsX695+XzA+9zcSp9hcDcp3/RHB9cjEAy5XMxfsw=;
        b=anXa6uBC2Ql7XEyGeDesB5CFGhx7QLV9JNITTUdW1utfyt1/AycfznAfGtMy1A0KBv
         MzTaVCTnUixuKVe9gnxuu3/baNZMdyjCRdW1fzTysBdthUqAP5sop+BwHneOgay0S2zw
         0oLnBQmLRCNxlof9TwdMZQB0uphbj8QYo8Zls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HGypsX695+XzA+9zcSp9hcDcp3/RHB9cjEAy5XMxfsw=;
        b=ORdhtKaOEp6X04aGYCcMG+6xiL21kDQ2H+5eW3kZFXGFSwYy9gzQlg5GI1SseB+Pds
         C3JojIFpfexQ5icFmARtIUpW8EmLWPOSlXX0rQI/vNa8Hh1Kj00xmtvXUGt4wkIgfHns
         xW7XEg7GdYaAV0V/BG1KpH7BhTMelBJaVTeLXKTwcntNqCE2H3GHPWtWmryavYpQ84cJ
         tggwLUz5F+9M4SdoDREP3Zu/fb/MHnH9YzwOVR3H8LI6T22n3Mz0fWDuQjjq+F0/g/Tp
         L8LEBnk2ilAEcrMpo4K0Lm/xpTeCFY8+SUs+pUJpLeBIlvf0a11GQNsW20EinuanW8HI
         KS0g==
X-Gm-Message-State: APjAAAVi1RquM6IZQ4XJ7A+9pByzH4B1Kwp97mNSKmk/FcnXh/ZCuXXi
        79cZEHz/BfEtZ8/3Xg9LSOpfd3qMfA0=
X-Google-Smtp-Source: APXvYqxH1J+iIpga6ZWPHAHRwWMwhqK1AeKduDX1Ff9KdSkpbj2r9wHu7HDiK4cjGoYAUhH/MfBe5Q==
X-Received: by 2002:a67:dd01:: with SMTP id y1mr8700570vsj.39.1556311363965;
        Fri, 26 Apr 2019 13:42:43 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id w197sm252599vkw.51.2019.04.26.13.42.43
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Apr 2019 13:42:43 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id g187so2698272vsc.8
        for <linux-usb@vger.kernel.org>; Fri, 26 Apr 2019 13:42:43 -0700 (PDT)
X-Received: by 2002:a67:7b53:: with SMTP id w80mr26349014vsc.144.1556311362615;
 Fri, 26 Apr 2019 13:42:42 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1555075927.git.arturp@synopsys.com> <b4129291df7b2d061e93c03862c081b6a35b2e7f.1555075927.git.arturp@synopsys.com>
In-Reply-To: <b4129291df7b2d061e93c03862c081b6a35b2e7f.1555075927.git.arturp@synopsys.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 26 Apr 2019 13:42:31 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U4muZuc-Wh-1xf5eFDSnyDVXK4BQHeJihWJpaU1ooB0g@mail.gmail.com>
Message-ID:
 <CAD=FV=U4muZuc-Wh-1xf5eFDSnyDVXK4BQHeJihWJpaU1ooB0g@mail.gmail.com>
Subject: Re: [PATCH 01/14] usb: dwc2: Fix dwc2_restore_device_registers() function.
To:     Artur Petrosyan <arthur.petrosyan@synopsys.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <minas.harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <john.youn@synopsys.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190426204231.BeacxpTyfU_aqxZZ8T54ZVl_3tY4XjsBj52luqSyc38@z>

Hi,

On Fri, Apr 12, 2019 at 6:38 AM Artur Petrosyan
<arthur.petrosyan@synopsys.com> wrote:
>
> - Added backup of DCFG register.
> - Added Set the Power-On Programming done bit.
>
> Signed-off-by: Artur Petrosyan <arturp@synopsys.com>
> ---
>  drivers/usb/dwc2/gadget.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
> index 6812a8a3a98b..dcb0fbb8bc42 100644
> --- a/drivers/usb/dwc2/gadget.c
> +++ b/drivers/usb/dwc2/gadget.c
> @@ -5004,6 +5004,7 @@ int dwc2_restore_device_registers(struct dwc2_hsotg *hsotg, int remote_wakeup)
>  {
>         struct dwc2_dregs_backup *dr;
>         int i;
> +       u32 dctl;
>
>         dev_dbg(hsotg->dev, "%s\n", __func__);
>
> @@ -5019,6 +5020,15 @@ int dwc2_restore_device_registers(struct dwc2_hsotg *hsotg, int remote_wakeup)
>         if (!remote_wakeup)
>                 dwc2_writel(hsotg, dr->dctl, DCTL);
>
> +       if (hsotg->params.power_down == DWC2_POWER_DOWN_PARAM_PARTIAL) {
> +               dwc2_writel(hsotg, dr->dcfg, DCFG);
> +
> +               /* Set the Power-On Programming done bit */
> +               dctl = dwc2_readl(hsotg, DCTL);
> +               dctl |= DCTL_PWRONPRGDONE;
> +               dwc2_writel(hsotg, dctl, DCTL);
> +       }

I can't vouch one way or the other for the correctness of this change,
but I will say that it's frustrating how asymmetric hibernate and
partial power down are.  It makes things really hard to reason about.
Is there any way you could restructure this so it happens in the same
way between hibernate and partial power down?

Specifically looking at the similar sequence in
dwc2_gadget_exit_hibernation() (which calls this function), I see:

1. There are some extra delays.  Are those needed for partial power down?

2. For exiting hibernation the setting of "DCTL_PWRONPRGDONE" only
happens if "not remote wakeup".  Is it truly on purpose that you don't
do that?

3. I see that dctl gets "DCTL_PWRONPRGDONE" set as part of the
sequence in the "not remote wakeup" case before calling this function.
...but then part of the function (that you didn't change) clobbers it,
I think.


I have no idea if any of that is a problem but the fact that the
hibernate and partial power down code runs through such different
paths makes it really hard to know / reason about.  Many of those
differences exist before your patch, but you're adding a new
difference rather than trying to unify and that worries me.



-Doug
