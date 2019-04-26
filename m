Return-Path: <SRS0=7cGN=S4=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16974C43218
	for <linux-usb@archiver.kernel.org>; Fri, 26 Apr 2019 21:00:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C77E020679
	for <linux-usb@archiver.kernel.org>; Fri, 26 Apr 2019 21:00:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ct8kMJw1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727004AbfDZVAd (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 26 Apr 2019 17:00:33 -0400
Received: from mail-vk1-f196.google.com ([209.85.221.196]:41367 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725966AbfDZVAd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 26 Apr 2019 17:00:33 -0400
Received: by mail-vk1-f196.google.com with SMTP id g63so1081402vke.8
        for <linux-usb@vger.kernel.org>; Fri, 26 Apr 2019 14:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wYDZbK4Lc7DSAgdObVYlVDbrj5KkLYrQSqMdmmyQcM0=;
        b=ct8kMJw16jJLQ8HAxoSaiTu1KoizgHszZqr43aYlTTnrYfmqf9464r7bqO9xNUOQr5
         lKOGOHmqOhjYGU4ELBjg2O0xhXQTr/mCWcw7QNKNxptNduHzWHOZYnfUCrBOq8r8by5T
         zRHPMvtDE7ifaAmQb5cBYnJa4dxaXWMk8+H+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wYDZbK4Lc7DSAgdObVYlVDbrj5KkLYrQSqMdmmyQcM0=;
        b=DGGs/9RQv1jYHk0J8ShMFnB+M1nEYCWsPiB0R8J9prV3XbFO/zGuMbiq2IZ0JAKp5v
         ITGlYzQfip/t14CAMLULzxABWCw86woaNZCBNDdBmich162Xg5uhcCdV8zCEq3kV3o0J
         uycBLQBWdkpCqhID264PfHXne1O9+6H8IX3DDC1OYfRZA2gOIQG2GPmo29PD2PIy2vN4
         Ftkc1CRwnROZiTu1XBywAgtHTViimLlxEWqz/d9huEcUzGO0GDKwQNgQUlC0FW7ourKE
         6gdrNqIJhpJmimmwk+sQZWFH0230RoYskD8qywR/zr8V1im1jH+SMCVFQHI00UtNYpoq
         Z5yw==
X-Gm-Message-State: APjAAAUk3eYu+6DmesMwltyJ3Uh3Ay8R/2XM0wlz/QLEkQAA6rlZ1IS2
        Z0noDFb/iKVXu+UTaX3A2IedOmySJ/0=
X-Google-Smtp-Source: APXvYqyWZ0g82YnUFLkctUCL97lO/y938FlgEHgUFCrp92YYrgLHtMn8aoL0uzv3QF3sEGHIaBlKqQ==
X-Received: by 2002:a1f:95d0:: with SMTP id x199mr25910803vkd.83.1556312430959;
        Fri, 26 Apr 2019 14:00:30 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id p6sm11928112vke.16.2019.04.26.14.00.29
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Apr 2019 14:00:29 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id g187so2723334vsc.8
        for <linux-usb@vger.kernel.org>; Fri, 26 Apr 2019 14:00:29 -0700 (PDT)
X-Received: by 2002:a67:b102:: with SMTP id w2mr8024502vsl.20.1556312429304;
 Fri, 26 Apr 2019 14:00:29 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1555672441.git.arturp@synopsys.com> <c62b99a6e4ad6de2982de988e9f9bcd0c6ec4daa.1555672441.git.arturp@synopsys.com>
In-Reply-To: <c62b99a6e4ad6de2982de988e9f9bcd0c6ec4daa.1555672441.git.arturp@synopsys.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 26 Apr 2019 14:00:18 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VDVhA0qzBN13=3C44mAzhDaQBUia_QADqyggSSFwKXqQ@mail.gmail.com>
Message-ID:
 <CAD=FV=VDVhA0qzBN13=3C44mAzhDaQBUia_QADqyggSSFwKXqQ@mail.gmail.com>
Subject: Re: [PATCH v1 14/14] usb: dwc2: Add enter/exit hibernation from
 system issued suspend/resume
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
Message-ID: <20190426210018.yYdV6fH0xgxgDz_xxDEO1NSSaL0emiHfv6IJCnKpH4k@z>

Hi,

On Fri, Apr 19, 2019 at 1:05 PM Artur Petrosyan
<Arthur.Petrosyan@synopsys.com> wrote:
>
> Added a new flow of entering and exiting hibernation when PC is
> hibernated or suspended.
>
> Signed-off-by: Artur Petrosyan <arturp@synopsys.com>
> ---
>  drivers/usb/dwc2/hcd.c | 128 +++++++++++++++++++++++++++++++------------------
>  1 file changed, 81 insertions(+), 47 deletions(-)
>
> diff --git a/drivers/usb/dwc2/hcd.c b/drivers/usb/dwc2/hcd.c
> index 45d4a3e1ebd2..f1e92a287cb1 100644
> --- a/drivers/usb/dwc2/hcd.c
> +++ b/drivers/usb/dwc2/hcd.c
> @@ -4510,35 +4510,54 @@ static int _dwc2_hcd_suspend(struct usb_hcd *hcd)
>         if (hsotg->op_state == OTG_STATE_B_PERIPHERAL)
>                 goto unlock;
>
> -       if (hsotg->params.power_down != DWC2_POWER_DOWN_PARAM_PARTIAL ||
> +       if (hsotg->params.power_down == DWC2_POWER_DOWN_PARAM_NONE ||
>             hsotg->flags.b.port_connect_status == 0)
>                 goto skip_power_saving;
>
> -       /*
> -        * Drive USB suspend and disable port Power
> -        * if usb bus is not suspended.
> -        */
> -       if (!hsotg->bus_suspended) {
> -               hprt0 = dwc2_read_hprt0(hsotg);
> -               hprt0 |= HPRT0_SUSP;
> -               hprt0 &= ~HPRT0_PWR;
> -               dwc2_writel(hsotg, hprt0, HPRT0);
> -               spin_unlock_irqrestore(&hsotg->lock, flags);
> -               dwc2_vbus_supply_exit(hsotg);
> -               spin_lock_irqsave(&hsotg->lock, flags);
> -       }
> +       switch (hsotg->params.power_down) {
> +       case DWC2_POWER_DOWN_PARAM_PARTIAL:
> +               /*
> +                * Drive USB suspend and disable port Power
> +                * if usb bus is not suspended.
> +                */
> +               if (!hsotg->bus_suspended) {
> +                       hprt0 = dwc2_read_hprt0(hsotg);
> +                       hprt0 |= HPRT0_SUSP;
> +                       hprt0 &= ~HPRT0_PWR;
> +                       dwc2_writel(hsotg, hprt0, HPRT0);
> +                       spin_unlock_irqrestore(&hsotg->lock, flags);
> +                       dwc2_vbus_supply_exit(hsotg);
> +                       spin_lock_irqsave(&hsotg->lock, flags);
> +               }
>
> -       /* Enter partial_power_down */
> -       ret = dwc2_enter_partial_power_down(hsotg);
> -       if (ret) {
> -               if (ret != -ENOTSUPP)
> -                       dev_err(hsotg->dev,
> -                               "enter partial_power_down failed\n");
> +               /* Enter partial_power_down */
> +               ret = dwc2_enter_partial_power_down(hsotg);
> +               if (ret) {
> +                       if (ret != -ENOTSUPP)
> +                               dev_err(hsotg->dev,
> +                                       "enter partial_power_down failed\n");
> +                       goto skip_power_saving;
> +               }
> +               hsotg->bus_suspended = true;
> +               break;
> +       case DWC2_POWER_DOWN_PARAM_HIBERNATION:
> +               if (!hsotg->bus_suspended) {

Do you have any idea why for DWC2_POWER_DOWN_PARAM_PARTIAL we still
call dwc2_enter_partial_power_down() even if bus_suspended is true,
but for hibernate you don't call dwc2_enter_hibernation()?


> +                       /* Enter hibernation */
> +                       spin_unlock_irqrestore(&hsotg->lock, flags);
> +                       ret = dwc2_enter_hibernation(hsotg, 1);
> +                       spin_lock_irqsave(&hsotg->lock, flags);
> +                       if (ret && ret != -ENOTSUPP)
> +                               dev_err(hsotg->dev,
> +                                       "%s: enter hibernation failed\n",
> +                                       __func__);

nit: no __func__ in dev_xxx() error messages.  The device plus the
message should be enough.  Only resort to __func__ if you're forced to
do an error message without a "struct device *".

nit: as per my comments in an earlier patch, remove special case for -ENOTSUPP

Also, presumably you want to match the error handling in
DWC2_POWER_DOWN_PARAM_PARTIAL and do a "goto skip_power_saving" when
you see an error?


> +               } else {
> +                       goto skip_power_saving;
> +               }
> +               break;
> +       default:
>                 goto skip_power_saving;
>         }
>
> -       hsotg->bus_suspended = true;
> -

It's a bit weird to remove this, but I guess it just got moved to the
partial power down case?  ...and in the hibernate case you're relying
on the hibernate function to set this?  Yet another frustratingly
asymmetric code structure...


>         /* Ask phy to be suspended */
>         if (!IS_ERR_OR_NULL(hsotg->uphy)) {
>                 spin_unlock_irqrestore(&hsotg->lock, flags);
> @@ -4564,17 +4583,17 @@ static int _dwc2_hcd_resume(struct usb_hcd *hcd)
>         int ret = 0;
>         u32 hprt0;
>
> -       hprt0 = dwc2_read_hprt0(hsotg);
> -
>         spin_lock_irqsave(&hsotg->lock, flags);
>
> -       if (dwc2_is_device_mode(hsotg))
> +       if (!hsotg->bus_suspended)

As per my comments above I don't have a good grasp on what
"bus_suspended" is for.  ...that being said, if your change here is
actually correct then you probably (?) want to remove the "if
(hsotg->bus_suspended)" check later in this same function.

Said another way, you've now got code that looks like:

if (!hsotg->bus_suspended)
  goto exit;

/* code that I think doesn't touch bus_suspended */

if (hsotg->bus_suspended) {
  /* do something */
} else {
  /* do something else */
}

Presumably the "do something" is now dead code?


>                 goto unlock;
>
>         if (hsotg->lx_state != DWC2_L2)
>                 goto unlock;
>
> -       if (hsotg->params.power_down != DWC2_POWER_DOWN_PARAM_PARTIAL ||
> +       hprt0 = dwc2_read_hprt0(hsotg);
> +
> +       if (hsotg->params.power_down == DWC2_POWER_DOWN_PARAM_NONE ||
>             hprt0 & HPRT0_CONNSTS) {
>                 hsotg->lx_state = DWC2_L0;
>                 goto unlock;
> @@ -4597,36 +4616,51 @@ static int _dwc2_hcd_resume(struct usb_hcd *hcd)
>                 spin_lock_irqsave(&hsotg->lock, flags);
>         }
>
> -       /* Exit partial_power_down */
> -       ret = dwc2_exit_partial_power_down(hsotg, true);
> -       if (ret && (ret != -ENOTSUPP))
> -               dev_err(hsotg->dev, "exit partial_power_down failed\n");
> +       switch (hsotg->params.power_down) {
> +       case DWC2_POWER_DOWN_PARAM_PARTIAL:
>
> -       hsotg->lx_state = DWC2_L0;
> +               /* Exit partial_power_down */
> +               ret = dwc2_exit_partial_power_down(hsotg, true);
> +               if (ret && (ret != -ENOTSUPP))
> +                       dev_err(hsotg->dev, "exit partial_power_down failed\n");
>
> -       spin_unlock_irqrestore(&hsotg->lock, flags);
> +               hsotg->lx_state = DWC2_L0;
>
> -       if (hsotg->bus_suspended) {
> -               spin_lock_irqsave(&hsotg->lock, flags);
> -               hsotg->flags.b.port_suspend_change = 1;
>                 spin_unlock_irqrestore(&hsotg->lock, flags);
> -               dwc2_port_resume(hsotg);
> -       } else {
> -               dwc2_vbus_supply_init(hsotg);
>
> -               /* Wait for controller to correctly update D+/D- level */
> -               usleep_range(3000, 5000);
> +               if (hsotg->bus_suspended) {
> +                       spin_lock_irqsave(&hsotg->lock, flags);
> +                       hsotg->flags.b.port_suspend_change = 1;
> +                       spin_unlock_irqrestore(&hsotg->lock, flags);
> +                       dwc2_port_resume(hsotg);
> +               } else {
> +                       dwc2_vbus_supply_init(hsotg);
>
> -               /*
> -                * Clear Port Enable and Port Status changes.
> -                * Enable Port Power.
> -                */
> -               dwc2_writel(hsotg, HPRT0_PWR | HPRT0_CONNDET |
> +                       /* Wait for controller to correctly update D+/D- level */
> +                       usleep_range(3000, 5000);
> +
> +                       /*
> +                        * Clear Port Enable and Port Status changes.
> +                        * Enable Port Power.
> +                        */
> +                       dwc2_writel(hsotg, HPRT0_PWR | HPRT0_CONNDET |
>                                 HPRT0_ENACHG, HPRT0);
> -               /* Wait for controller to detect Port Connect */
> -               usleep_range(5000, 7000);
> +                       /* Wait for controller to detect Port Connect */
> +                       usleep_range(5000, 7000);
> +               }
> +               break;
> +       case DWC2_POWER_DOWN_PARAM_HIBERNATION:
> +
> +               /* Exit host hibernation. */
> +               if (hsotg->hibernated)
> +                       dwc2_exit_hibernation(hsotg, 0, 0, 1);
> +               break;
> +       default:
> +               goto unlock;
>         }
>
> +       spin_unlock_irqrestore(&hsotg->lock, flags);
> +

I'm pretty curious if you tested DWC2_POWER_DOWN_PARAM_PARTIAL after
applying your patch series.  As far as I can tell your switch
statement for DWC2_POWER_DOWN_PARAM_PARTIAL will "break" with the
spinlock already unlocked.  ...so you'll run spin_unlock_irqrestore
twice.  Is that really legit?



NOTE: in case it helps you, I've attempted to rebase this atop my
series.  Please double-check that I didn't mess anything up, though.

https://chromium.googlesource.com/chromiumos/third_party/kernel/+log/refs/sandbox/dianders/190426-dwc2-stuff


...with that a quick test seems to show that partial power down is
sorta working on rk3288 now.  I _think_ I saw one case where hotplug
failed but I've seen several where it works.  ...unfortunately it
seems to break when I do hotplug on the port where I have
"snps,reset-phy-on-wake" set.

-Doug
