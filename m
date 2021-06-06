Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EA9EC47096
	for <linux-usb@archiver.kernel.org>; Sun,  6 Jun 2021 15:45:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 47BDB613C7
	for <linux-usb@archiver.kernel.org>; Sun,  6 Jun 2021 15:45:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230149AbhFFPrS (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 6 Jun 2021 11:47:18 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:52121 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230108AbhFFPrR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 6 Jun 2021 11:47:17 -0400
Received: from mail-wr1-f54.google.com ([209.85.221.54]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MIKs0-1lbb5m22Lc-00EO1n; Sun, 06 Jun 2021 17:45:26 +0200
Received: by mail-wr1-f54.google.com with SMTP id c9so5846230wrt.5;
        Sun, 06 Jun 2021 08:45:26 -0700 (PDT)
X-Gm-Message-State: AOAM531WyvQj5cyLjRk1g2cIgxqev43RKJqJfFT0A6Ju2PU/S9c+gIGJ
        Khp8RIc1zVKXy4a6RpUIVK4gjsrkh4Ds54WvFuY=
X-Google-Smtp-Source: ABdhPJxtH8sg72nbDMc2xvlPEkjVgPkkeVaBoEaft/QXwhgaWWLA0oGbW/f7EgR9AF8QpW+XOKQuoewXDnnIPfZJ7ak=
X-Received: by 2002:a5d:5084:: with SMTP id a4mr13544368wrt.286.1622994326220;
 Sun, 06 Jun 2021 08:45:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210606103656.71079-1-sven@svenpeter.dev>
In-Reply-To: <20210606103656.71079-1-sven@svenpeter.dev>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Sun, 6 Jun 2021 17:43:39 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3TetrYDq0un8NT2ZPM=MSGg68Qr0gEV0Ua4Jfqoy-ErQ@mail.gmail.com>
Message-ID: <CAK8P3a3TetrYDq0un8NT2ZPM=MSGg68Qr0gEV0Ua4Jfqoy-ErQ@mail.gmail.com>
Subject: Re: [PATCH v2] usb: dwc3: support 64 bit DMA in platform driver
To:     Sven Peter <sven@svenpeter.dev>
Cc:     USB list <linux-usb@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:gFrwvFMRjzWLG74QxE6g7S/QvbeOVNsRRetFPZM2/nMmrCeDbz2
 HJQP+YSBK2fqxCAEWdxttO9U9pCFsDfe4oxVH0GsiD2O0jGhSHsFRuextKzPgA5ZE44NxEE
 Ec+dzQpYYdwVdXpNXlCT6MKOn80yhjGr0yTU9LrJX5RW0ZB2a432ugCFkJElxQv/Zat1TTY
 ukzBHWFWzhmb4tb9ZJnyw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:KgQcoNB7rK0=:Fzl8i+NOf5PrBrN4JjgKrj
 XqXftn0tuqj5ttxWD7u0O37Z+0C3lB7WiAY0dzXlYEmglIJkvwgGJvHHQ1+Dmw2arHq+d/rtT
 P9WKVXHjKfDuqMK3R0UyoR4Wcz7hrXKCQ/yRo1U+opdfFM/VIAQ2p/VPtsz5i+gTyefW09Umu
 LfLF8maKbOQSD6mqDzgH43GF/5qTZ/VDt4G3ZLnlTBwbbWjSMfgWQY3k4yb0cKxTzSIlpjuOi
 mUIi6AsYpmgRWqzCSV/aU7piHZaou31VYp8H/K23s3jtk1IHlwq0oy5VZxlGuKheHbhnPs7xx
 9FStf1piCZ96T6jWIeFfxb2cR0ezwPWl9YwVPoz5N7z3F3KxbytUfbTcYXvPJDL9Te6xpCR/e
 GuEj82iW0qoCnh7xmzmS/oTCWoKarzI8PUtKAWWka4xqClodTDGVK0/1enxpCtYUt9XMWq0Ag
 GeNWWm2u4CJaHS3by/fsRAwRW0RBCv6psr/DYNXkPrGgHDDysVdb4cG8kZlulm9YsoqkSvz01
 b7M3NQwyfBkNyzNXfWHoAE=
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Jun 6, 2021 at 12:36 PM Sven Peter <sven@svenpeter.dev> wrote:
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index b6e53d8212cd..4930541a8984 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -1545,6 +1545,21 @@ static int dwc3_probe(struct platform_device *pdev)
>
>         dwc3_get_properties(dwc);
>
> +       /* Try to set 64-bit DMA first */
> +       if (!dwc->sysdev->dma_mask)
> +               /* Platform did not initialize dma_mask */
> +               ret = dma_coerce_mask_and_coherent(dwc->sysdev,
> +                                                  DMA_BIT_MASK(64));
> +       else
> +               ret = dma_set_mask_and_coherent(dwc->sysdev, DMA_BIT_MASK(64));
> +
> +       /* If seting 64-bit DMA mask fails, fall back to 32-bit DMA mask */
> +       if (ret) {
> +               ret = dma_set_mask_and_coherent(dwc->sysdev, DMA_BIT_MASK(32));
> +               if (ret)
> +                       return ret;
> +       }

Please drop the dma_coerce_mask_and_coherent() code path as well: if
the device is marked as non-DMA capable in the platform, it's better have
it not be usable at all than to assume a particular bus property that may
or may not be present on that bus.

The 32-bit mask is the default on all buses you might see a dwc3 controller
on, so you can drop that as well, and just leave the
dma_set_mask_and_coherent().

        Arnd
