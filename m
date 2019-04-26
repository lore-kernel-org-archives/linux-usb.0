Return-Path: <SRS0=7cGN=S4=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A155C43218
	for <linux-usb@archiver.kernel.org>; Fri, 26 Apr 2019 20:45:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F08BA208CB
	for <linux-usb@archiver.kernel.org>; Fri, 26 Apr 2019 20:45:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PM06YeP3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727026AbfDZUpr (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 26 Apr 2019 16:45:47 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:35368 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726935AbfDZUpl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 26 Apr 2019 16:45:41 -0400
Received: by mail-vs1-f68.google.com with SMTP id d8so2729951vsp.2
        for <linux-usb@vger.kernel.org>; Fri, 26 Apr 2019 13:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NE8KI5WKHoVGptN05I/Xnro17rwyv/I4SijDLJH1mEI=;
        b=PM06YeP3FiC6SOpvfBSQ5mgzoUmwJhXgJxDONoqk/s0FON5irNAuhYztj8JSCeS7j8
         1eig6xBNUX8AbDRaaNY3XJL1IIZcoUh7+MnnAbEtC+Z6KM7gGjel+5mVO/FFLPHppN7Y
         FzuIlFbQAH6AC/BJwk6D2L/zFet5ZkTCaQhKg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NE8KI5WKHoVGptN05I/Xnro17rwyv/I4SijDLJH1mEI=;
        b=UPdl6e0SZLZNxUzL7uEwdjgaZK/0MiXPvh3P6p+NrxFuf98YkkC+zJuxf13EFw86u7
         IVF5GpkTABANw7VPyg5H8uquyAuJxIs+AAlaYwRc1jeRHGHGJHmAW6e1RFQba0bzBeir
         /Z5RaRLJVccgP3cJV5gir8XEBmnxcMFv8iNOKO0hjrSHl5iy/gswK7f47QglJG6KZNlm
         ZWiePMFWP26hKXh3rjj7hcUJl+5yEzRFlj4BNc//K9s63ssWiRQp53yU5HmRYAKLjVWk
         fMjjH1wWlDDrjtC6KKPhYT3dJtbXngswww6d25iwFKHDNmqpeLhiUNFKXHvcEcHZFcSX
         0peg==
X-Gm-Message-State: APjAAAWSF9DnfnYWxcAcu/l+0EkSrRJ5bWgVe2sGMwTWcIrBASkKjWq5
        7Jqa1KWP5gyYRipZdl3QdRibxVJZcdY=
X-Google-Smtp-Source: APXvYqx/Qia1xxUYlbvPdTAyEmFuOHyElVsacbwzrkeAxpbFJc+TNFbnCf8EOB0vT0iD5tZMoU+9Cg==
X-Received: by 2002:a67:e28d:: with SMTP id g13mr15610292vsf.121.1556311540465;
        Fri, 26 Apr 2019 13:45:40 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id 2sm30622757vke.27.2019.04.26.13.45.39
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Apr 2019 13:45:39 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id b8so1637552uaq.7
        for <linux-usb@vger.kernel.org>; Fri, 26 Apr 2019 13:45:39 -0700 (PDT)
X-Received: by 2002:a9f:204a:: with SMTP id 68mr6192211uam.19.1556311539340;
 Fri, 26 Apr 2019 13:45:39 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1555672441.git.arturp@synopsys.com> <8d5e1a9ea7207845069104f967e0e1ae558c0624.1555672441.git.arturp@synopsys.com>
In-Reply-To: <8d5e1a9ea7207845069104f967e0e1ae558c0624.1555672441.git.arturp@synopsys.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 26 Apr 2019 13:45:28 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Um27u59PBN_RHvkVw6rh=KJ41QhiRD=ctrqc2BJGMMxw@mail.gmail.com>
Message-ID:
 <CAD=FV=Um27u59PBN_RHvkVw6rh=KJ41QhiRD=ctrqc2BJGMMxw@mail.gmail.com>
Subject: Re: [PATCH v1 06/14] usb: dwc2: Add part. power down exit from dwc2_conn_id_status_change().
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
Message-ID: <20190426204528.GIzIhaHJs9mcqV9azbg-Z12CrJxo8KGriXrtnccGwKE@z>

Hi,

On Fri, Apr 19, 2019 at 11:53 AM Artur Petrosyan
<Arthur.Petrosyan@synopsys.com> wrote:
>
> Before changing to connector B exiting from Partial
> Power Down is required.
>
> - Added exiting from Partial Power Down mode when
>   connector ID status changes to "connId B".
>   Because if connector ID status changed to B connector
>   while core was in partial power down mode, HANG would
>   accrue from a soft reset.
>
> Signed-off-by: Artur Petrosyan <arturp@synopsys.com>
> ---
>  drivers/usb/dwc2/hcd.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/drivers/usb/dwc2/hcd.c b/drivers/usb/dwc2/hcd.c
> index 8367902a47eb..54450fa352cf 100644
> --- a/drivers/usb/dwc2/hcd.c
> +++ b/drivers/usb/dwc2/hcd.c
> @@ -3348,6 +3348,7 @@ static void dwc2_conn_id_status_change(struct work_struct *work)
>                                                 wf_otg);
>         u32 count = 0;
>         u32 gotgctl;
> +       u32 pcgcctl;
>         unsigned long flags;
>
>         dev_dbg(hsotg->dev, "%s()\n", __func__);
> @@ -3387,6 +3388,23 @@ static void dwc2_conn_id_status_change(struct work_struct *work)
>                 if (count > 250)
>                         dev_err(hsotg->dev,
>                                 "Connection id status change timed out\n");
> +
> +               if (hsotg->params.power_down ==
> +                   DWC2_POWER_DOWN_PARAM_PARTIAL &&
> +                   hsotg->lx_state == DWC2_L2) {
> +                       pcgcctl = dwc2_readl(hsotg, PCGCTL);
> +                       pcgcctl &= ~PCGCTL_STOPPCLK;
> +                       dwc2_writel(hsotg, pcgcctl, PCGCTL);
> +
> +                       pcgcctl = dwc2_readl(hsotg, PCGCTL);
> +                       pcgcctl &= ~PCGCTL_PWRCLMP;
> +                       dwc2_writel(hsotg, pcgcctl, PCGCTL);
> +
> +                       pcgcctl = dwc2_readl(hsotg, PCGCTL);
> +                       pcgcctl &= ~PCGCTL_RSTPDWNMODULE;
> +                       dwc2_writel(hsotg, pcgcctl, PCGCTL);

You really need to read it over and over?  ...and you really can't
just write this all at once?

...if this really needs to be separate steps, do you need a delay
between them or can they just happen as fast as possible?

As far as I can tell from the programming guide I've seen, you:

1. Don't need to read it over and over again.

2. Should delay 10 PHY clock cycles after the writes


-Doug
