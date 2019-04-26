Return-Path: <SRS0=7cGN=S4=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 619B4C43218
	for <linux-usb@archiver.kernel.org>; Fri, 26 Apr 2019 20:51:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2AFCF2084F
	for <linux-usb@archiver.kernel.org>; Fri, 26 Apr 2019 20:51:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ClSwj9Xn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726154AbfDZUvu (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 26 Apr 2019 16:51:50 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:42561 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725966AbfDZUvu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 26 Apr 2019 16:51:50 -0400
Received: by mail-vs1-f68.google.com with SMTP id w20so2701216vso.9
        for <linux-usb@vger.kernel.org>; Fri, 26 Apr 2019 13:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iGD8PT3eYvVgr6/id19hOTwHSfSjHZkkZ2C7ckw/4UM=;
        b=ClSwj9XnvmnYfSiYpDoFIOZl8FvPIkg230U6E+WZ+8MwBk6aU6VAzb1yZiTd6Rt1op
         49p5gsNg5YY+AsZMOncaKi9AdMuYMixL+Z2u2NuXerqRXmbp3Bzs5Esvx6MPZzVjwUIi
         kAoFNdUyaDooPsJSad0RJNoOTbE31PB3sOSWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iGD8PT3eYvVgr6/id19hOTwHSfSjHZkkZ2C7ckw/4UM=;
        b=avx4h+4ht++sHif9MzNaC3VuZpJnJIZvg7ZfUIl2mhX5+Ae9Gue4lSduA2WXgQDsyc
         9o/JJnRF7K1yPPTWEUw0yoXEVEBS7ws/GFV5x9is+x5ze2amJcByvuO8xbU+6za0269M
         CjlV1q6YcRFjNETJl5tsSiEA5E+6xh/Zswd0Y99cdnH+hWHhtC5tGd9ISdX9nDOeCZ4z
         yEE49GOJ3hKuWyvnG+cHtDnyfhBoDWnuWxUu23M9lNpXJabIJ9Hgx1c7pTVRyA7Qwwlf
         vIckYRHainohBl6kx480I7xOvSpalSvcaMsmuylCegrEsAZcLYdpGZXoPTbjB6nGq/92
         8b6w==
X-Gm-Message-State: APjAAAWIEgANNjx4n0gxCkIGANVrkaGzWTyZEXiilU8YfkG4o4NSNUcn
        6iHqTf2PGhqdUgPKPa5p3L4YOWuCg1Y=
X-Google-Smtp-Source: APXvYqxUMfwBqJhGwPKWtOENJ6O6ALaqB1L2EXwaUkGcGCXpvLrohcX9VHh8NptJD7N+7RSyHa7nxg==
X-Received: by 2002:a67:fac8:: with SMTP id g8mr4288118vsq.42.1556311909096;
        Fri, 26 Apr 2019 13:51:49 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id v22sm6880260vkv.35.2019.04.26.13.51.47
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Apr 2019 13:51:48 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id w13so2723934vsc.4
        for <linux-usb@vger.kernel.org>; Fri, 26 Apr 2019 13:51:47 -0700 (PDT)
X-Received: by 2002:a67:ffce:: with SMTP id w14mr4285222vsq.111.1556311907511;
 Fri, 26 Apr 2019 13:51:47 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1555672441.git.arturp@synopsys.com> <abd6b3cf465aac7c4e0dd3274ab1549980601c6d.1555672441.git.arturp@synopsys.com>
In-Reply-To: <abd6b3cf465aac7c4e0dd3274ab1549980601c6d.1555672441.git.arturp@synopsys.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 26 Apr 2019 13:51:36 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UV1X35rK7URehcicwnRnwPgjiXuxa=i-DY_Hx=P=52yQ@mail.gmail.com>
Message-ID:
 <CAD=FV=UV1X35rK7URehcicwnRnwPgjiXuxa=i-DY_Hx=P=52yQ@mail.gmail.com>
Subject: Re: [PATCH v1 12/14] usb: dwc2: Clear fifo_map when resetting core.
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
Message-ID: <20190426205136.iXX84aILx2uMW68SWAOzuS_9WadMw0djjJYf-p1y_44@z>

Hi,

On Fri, Apr 19, 2019 at 1:06 PM Artur Petrosyan
<Arthur.Petrosyan@synopsys.com> wrote:
>
> If core enters host hibernation when switching from
> device mode to host mode disconnection of host cable
> asserts a WARNING in dwc2_hsotg_init_fifo() that
> fifo_map is not cleared.
>
> To avoid the WARNING, fifo_map should be cleared
> in dwc2_core_reset() function.
>
> - Cleared fifo_map when resetting the core.
>
> Signed-off-by: Artur Petrosyan <arturp@synopsys.com>
> ---
>  drivers/usb/dwc2/core.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/usb/dwc2/core.c b/drivers/usb/dwc2/core.c
> index fb471d18a3de..fbbd6a2f10ad 100644
> --- a/drivers/usb/dwc2/core.c
> +++ b/drivers/usb/dwc2/core.c
> @@ -532,6 +532,12 @@ int dwc2_core_reset(struct dwc2_hsotg *hsotg, bool skip_wait)
>         greset |= GRSTCTL_CSFTRST;
>         dwc2_writel(hsotg, greset, GRSTCTL);
>
> +       /* Clear fifo_map */
> +       #if IS_ENABLED(CONFIG_USB_DWC2_PERIPHERAL) || \
> +               IS_ENABLED(CONFIG_USB_DWC2_DUAL_ROLE)
> +       hsotg->fifo_map = 0;
> +       #endif /* CONFIG_USB_DWC2_PERIPHERAL || CONFIG_USB_DWC2_DUAL_ROLE */

Please please no sprinkling "#if" statements in code like this.  Here
lies the way to madness.  The right way to do this in the style of the
Linux kernel is to add a function that is a "static inline" no-op when
the options are compiled out.

As one example you can see my recent patch:

https://lkml.kernel.org/r/20190425154021.4465-1-dianders@chromium.org



-Doug
