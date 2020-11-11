Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2300EC5517A
	for <linux-usb@archiver.kernel.org>; Wed, 11 Nov 2020 12:59:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B7636207BB
	for <linux-usb@archiver.kernel.org>; Wed, 11 Nov 2020 12:59:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FUUrPeEy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725979AbgKKM7b (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 11 Nov 2020 07:59:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725933AbgKKM7a (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 Nov 2020 07:59:30 -0500
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AB8AC0613D1;
        Wed, 11 Nov 2020 04:59:30 -0800 (PST)
Received: by mail-ed1-x542.google.com with SMTP id b9so2172076edu.10;
        Wed, 11 Nov 2020 04:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=naiXUCmSl6hLpXohb70ro0STbH/AhhPgkWlcemJAgl0=;
        b=FUUrPeEy5bYDcr8CDP/fPnFMQq2vMEsrT7Tc71Y9DHf06H3lEB8lMmCWqa97EBcq2Z
         AFIMOQR0QuxcL6ng0nyNrP+bvcWB0JqKXqyRkS+Zqc3POZY/U39mFwZStz6MSdcOn5DB
         RPTwNu8kRaCjS/Eh88jAHdYdn4OdN/XkUjgOC4D7vtkjdHLvUQD2iHVvzvqOvOFsefaz
         maSEmb5soISdd3Rp7y1ZI6XLcIdIDa4glQcMPBZjJN2I4s+SyQ9kyHXLqgovJO1QmjXa
         fuwinjJiGhTSQAq+9mUWfLzNMgXYKRoOH/v/8ufjKcFee+i5hK1FGGHU3a79mHmfAV9V
         lHlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=naiXUCmSl6hLpXohb70ro0STbH/AhhPgkWlcemJAgl0=;
        b=I2kBfY9MRPcFVIjqr8AplAIDI5o1edv0u6LmY2XdxcHb6Y8z6b7k8/Rkjap0jotY/p
         uPIQWgU877I8hib/+vFljpHsBBC3tVHL0QN+SJkiCG49cqNhurdaMVu9U1XI5A1s0NRz
         +1pIP7ZyHaUb48Y5efewVVcpctZ1nimclT+f1vO1Qwe7PktNUXSps8nEiQXgPJvWvK7j
         V8pqplu+usG69MuEji84PCz7wFURcopLl4dX0KBHjdSNlNZMkLumCAKlEpIhMd0z2qSB
         TdK7/wthRP7wphLBaGfhvzfV1hy8eTk85M2+fXDB64afU0rMvig/cOIbJwoz6uEIJ99M
         /oQQ==
X-Gm-Message-State: AOAM5338MF9yYu7hDoreW+TOv4z+3CrfINQcbV/z5ONPHeOZAuGR0iGm
        B+EcbkpCXdAfKLsNu4UUF8gllzx2DqLIFbe6cro=
X-Google-Smtp-Source: ABdhPJy5ik3AI9eZMElnUe65jPrr5qriWyQJfoRxHx62qn0ZVQUCNLn1w3vL0RmB/q7qGPyvfTU+rQmbZTVIjJqGR/U=
X-Received: by 2002:a50:ab5e:: with SMTP id t30mr26750399edc.314.1605099569249;
 Wed, 11 Nov 2020 04:59:29 -0800 (PST)
MIME-Version: 1.0
References: <245047b3fffaf5c0b791ed226d1ea272b2aef031.1605060950.git.andreyknvl@google.com>
In-Reply-To: <245047b3fffaf5c0b791ed226d1ea272b2aef031.1605060950.git.andreyknvl@google.com>
From:   Andrey Konovalov <andreyknvl@gmail.com>
Date:   Wed, 11 Nov 2020 13:59:18 +0100
Message-ID: <CA+fCnZeKepFMskWh3ep841AS47hhy9mXAHZSziT6KqvO75=DWQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: add usb raw gadget entry
To:     Andrey Konovalov <andreyknvl@google.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB list <linux-usb@vger.kernel.org>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Nov 11, 2020 at 3:18 AM Andrey Konovalov <andreyknvl@google.com> wr=
ote:
>
> Add myself (using the personal email address) as a reviewer for the
> USB Raw Gadget driver.
>
> Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
> ---
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 94ac10a153c7..f68835aaaddc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18176,6 +18176,14 @@ L:     linux-usb@vger.kernel.org
>  S:     Supported
>  F:     drivers/usb/class/usblp.c
>
> +USB RAW GADGET DRIVER
> +R:     Andrey Konovalov <andreyknvl@gmail.com>
> +L:     linux-usb@vger.kernel.org
> +S:     Maintained
> +F:     Documentation/usb/raw-gadget.rst
> +F:     drivers/usb/gadget/legacy/raw_gadget.c
> +F:     include/uapi/linux/usb/raw_gadget.h
> +
>  USB QMI WWAN NETWORK DRIVER
>  M:     Bj=C3=B8rn Mork <bjorn@mork.no>
>  L:     netdev@vger.kernel.org
> --
> 2.29.2.222.g5d2a92d10f8-goog
>

Acked-by: Andrey Konovalov <andreyknvl@gmail.com>
