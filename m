Return-Path: <SRS0=7cGN=S4=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 221E4C43218
	for <linux-usb@archiver.kernel.org>; Fri, 26 Apr 2019 20:44:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D585F2084F
	for <linux-usb@archiver.kernel.org>; Fri, 26 Apr 2019 20:44:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AWJ0zakL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726571AbfDZUos (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 26 Apr 2019 16:44:48 -0400
Received: from mail-vs1-f66.google.com ([209.85.217.66]:45716 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725966AbfDZUos (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 26 Apr 2019 16:44:48 -0400
Received: by mail-vs1-f66.google.com with SMTP id o10so2675071vsp.12
        for <linux-usb@vger.kernel.org>; Fri, 26 Apr 2019 13:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qrAoWj7gvC8gD5vO2Wj33xyZmTXqIYBC9apK5Phh53w=;
        b=AWJ0zakLHj/fWXUPH6TJTcHNAbRuoz+e4C/Znh7iChfSZRg6g6lLVsCw/5bDq3y658
         I525C5ny4ehiW3FsM28A5FbBNdvhPYgA9oPfBQ40+lfKYDc+csTgKMk9bDg8qc/6gl4r
         TxdqT1K9qpWe3Ljagk1VPrfNL4PnrjmE9LwUE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qrAoWj7gvC8gD5vO2Wj33xyZmTXqIYBC9apK5Phh53w=;
        b=EjRZtVvUIukep6QJTZs1qpQsAtxRAAcZmHl2m7GjMrx+onhq5ijZprxE+yh7lYgCbw
         +O1XDJyjiuoCIFyHkKs8em98SfM7ndHLWLPUN30lXPKj953LJ+k6sceW2vaN8GJH5afX
         Cc1EIHByrapBY28OS41PCOa/p11SHpVT8NeeLp950F9z1g3gjuA1g2z6AR7HEVrzOppP
         5xPOg5jEdqQaRi3OUVm4Ugu448Fk+1vbEWwpS9+ZKSWE+8yvIaovwocitnjOD6CBsxEP
         gGvI7NTusL+nVa6knXc6v5IwDuK2d9pc4gcDl+RgV5qd43MY1b5WEbChwsyAb0L3KNPZ
         hMvA==
X-Gm-Message-State: APjAAAVAUZcN7DMRp1aEuHADyLM3AZMrhqaLj+pfHSVIZ4rJa0Zmfxpm
        AVzWqSgyYqK9qgc79z3glk1ClTT7MKw=
X-Google-Smtp-Source: APXvYqzhSJZrFXHivB8EFM+IX5ek0b2H9GmSfMVJ4Sha8gI5YQ3spmP3Iwm1qcBOaxEycaj/jBCilw==
X-Received: by 2002:a67:cf84:: with SMTP id g4mr26542630vsm.67.1556311487161;
        Fri, 26 Apr 2019 13:44:47 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id z192sm16028227vkd.45.2019.04.26.13.44.46
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Apr 2019 13:44:46 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id e2so2671795vsc.13
        for <linux-usb@vger.kernel.org>; Fri, 26 Apr 2019 13:44:46 -0700 (PDT)
X-Received: by 2002:a67:ffce:: with SMTP id w14mr4267846vsq.111.1556311485955;
 Fri, 26 Apr 2019 13:44:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1555672441.git.arturp@synopsys.com> <0dc725c7e9956eedaf03bb5d68a7d5e856d8cb5a.1555672441.git.arturp@synopsys.com>
In-Reply-To: <0dc725c7e9956eedaf03bb5d68a7d5e856d8cb5a.1555672441.git.arturp@synopsys.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 26 Apr 2019 13:44:34 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UjPPnGVjfch8En+S5UndTDK06HK-7QRHdK3oOr+kCiEw@mail.gmail.com>
Message-ID:
 <CAD=FV=UjPPnGVjfch8En+S5UndTDK06HK-7QRHdK3oOr+kCiEw@mail.gmail.com>
Subject: Re: [PATCH v1 04/14] usb: dwc2: Fix suspend state in host mode for
 partial power down.
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
Message-ID: <20190426204434.jZt5-VIwSP9FGUTF6P9GVaRqdB9FtnQe0-EklurOGIs@z>

Hi,

On Fri, Apr 19, 2019 at 1:05 PM Artur Petrosyan
<Arthur.Petrosyan@synopsys.com> wrote:
>
> - In dwc2_port_suspend() function added waiting for the
>   HPRT0.PrtSusp register field to be set.
>
> - In _dwc2_hcd_suspend() function added checking of
>   "hsotg->flags.b.port_connect_status" port connection
>   status if port connection status is 0 then skipping
>   power saving (entering partial power down mode).
>   Because if there is no device connected there would
>   be no need to enter partial power down mode.
>
> - Added "hsotg->bus_suspended = true" beceuse after

s/beceuse/because

>   entering partial power down in host mode the
>   bus_suspended flag must be set.

The above statement sounds to me like trying to win an argument by
saying "I'm right because I'm right."  Can you give more details about
why "bus_suspended" must be set?  See below also.


> Signed-off-by: Artur Petrosyan <arturp@synopsys.com>
> ---
>  drivers/usb/dwc2/hcd.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/usb/dwc2/hcd.c b/drivers/usb/dwc2/hcd.c
> index dd82fa516f3f..1d18258b5ff8 100644
> --- a/drivers/usb/dwc2/hcd.c
> +++ b/drivers/usb/dwc2/hcd.c
> @@ -3479,6 +3479,10 @@ static void dwc2_port_suspend(struct dwc2_hsotg *hsotg, u16 windex)
>         hprt0 |= HPRT0_SUSP;
>         dwc2_writel(hsotg, hprt0, HPRT0);
>
> +       /* Wait for the HPRT0.PrtSusp register field to be set */
> +       if (dwc2_hsotg_wait_bit_set(hsotg, HPRT0, HPRT0_SUSP, 3000))
> +               dev_warn(hsotg->dev, "Suspend wasn't generated\n");
> +
>         hsotg->bus_suspended = true;
>
>         /*
> @@ -4488,7 +4492,8 @@ static int _dwc2_hcd_suspend(struct usb_hcd *hcd)
>         if (hsotg->op_state == OTG_STATE_B_PERIPHERAL)
>                 goto unlock;
>
> -       if (hsotg->params.power_down != DWC2_POWER_DOWN_PARAM_PARTIAL)
> +       if (hsotg->params.power_down != DWC2_POWER_DOWN_PARAM_PARTIAL ||
> +           hsotg->flags.b.port_connect_status == 0)
>                 goto skip_power_saving;
>
>         /*
> @@ -4514,6 +4519,8 @@ static int _dwc2_hcd_suspend(struct usb_hcd *hcd)
>                 goto skip_power_saving;
>         }
>
> +       hsotg->bus_suspended = true;
> +

I'm a bit unsure about this.  Specifically I note that
_dwc2_hcd_resume() has a special case "if (hsotg->bus_suspended)".
Does that now become dead code?

...I talk about this a bit more in my review of ("usb: dwc2: Add
enter/exit hibernation from system issued suspend/resume")


-Doug
