Return-Path: <SRS0=7cGN=S4=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43634C43218
	for <linux-usb@archiver.kernel.org>; Fri, 26 Apr 2019 20:45:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 12AFA2084F
	for <linux-usb@archiver.kernel.org>; Fri, 26 Apr 2019 20:45:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kkgHH93o"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726324AbfDZUpU (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 26 Apr 2019 16:45:20 -0400
Received: from mail-ua1-f68.google.com ([209.85.222.68]:37572 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725966AbfDZUpU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 26 Apr 2019 16:45:20 -0400
Received: by mail-ua1-f68.google.com with SMTP id l17so1646490uar.4
        for <linux-usb@vger.kernel.org>; Fri, 26 Apr 2019 13:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=danbixtRkMpbGQOKC4rHtO5Bgk98IM8uNR/bclUh/IU=;
        b=kkgHH93oLf2jvdv05Z77EwCEfEyEpkIa2Qivid1YtaW5V4gpo0lC0H6P13DylPCuZv
         fmK3g+oqEy2Yu3rzmZWJe+73vvlw/xXJlXyYv7H0y77A7NCAIvKUyNNAJU03B+NU/h6X
         ylSW8J+EjdlWc9VTB1xNniLgrEBqUClWq0Wq8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=danbixtRkMpbGQOKC4rHtO5Bgk98IM8uNR/bclUh/IU=;
        b=h1dAWGW6DfDKcEctUqvaMP1F9THYDTUrTpayT5qsR/pnvBU2J/mgTiyiWJ7msRudu1
         KVjtA5feET8bMwumKThMInbkQHuTEv5fEryKuXAXk3ZZUPAZVO9hL/ivsFudDXcW5rWN
         ubkyFmsLzBX2unqi+3YExS/qZAWhhHJJ/bhaeIeScHzGdPIA4DZ4dstXW14+Updl6GID
         mkOhyjy8D1HDFPA7OyhmD8LulWrSxL22s0IUcrGcvfbqFnxoupDK2QD3hCOiMo1eGPCk
         fzlhqQA956FqFNJuO5E94ubY5dVWdeAIKv15upGNKtFAvKeHvWdzFp+zeOGZJs1nr4gR
         x2kA==
X-Gm-Message-State: APjAAAWMojCBdQbX3osnCY5foqQMV/JY2j62lFpP49wh49pZQxwp8a8a
        ewtYuxzZyj+ZNrVlDmIiHyPdxeXZ9OA=
X-Google-Smtp-Source: APXvYqwqpiwDdiGmunTLVJ5xcf7hNOuXtA9tJ/l/3sCYYvVX4s9MDU/OlCEd/xRFLa1Lc26B4IJuFQ==
X-Received: by 2002:a9f:31b2:: with SMTP id v47mr2912240uad.47.1556311519013;
        Fri, 26 Apr 2019 13:45:19 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id w184sm20376360vkd.0.2019.04.26.13.45.18
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Apr 2019 13:45:18 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id r12so1788982vsp.7
        for <linux-usb@vger.kernel.org>; Fri, 26 Apr 2019 13:45:18 -0700 (PDT)
X-Received: by 2002:a67:e88c:: with SMTP id x12mr755410vsn.87.1556311517747;
 Fri, 26 Apr 2019 13:45:17 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1555672441.git.arturp@synopsys.com> <ac07dae6922ad0110dbecffcab1dc495ce6a6cbc.1555672441.git.arturp@synopsys.com>
In-Reply-To: <ac07dae6922ad0110dbecffcab1dc495ce6a6cbc.1555672441.git.arturp@synopsys.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 26 Apr 2019 13:45:06 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WGJj1O2kbEYbSP7O-1pZ4F5LpwE=endPX-zmq-9WP6Tg@mail.gmail.com>
Message-ID:
 <CAD=FV=WGJj1O2kbEYbSP7O-1pZ4F5LpwE=endPX-zmq-9WP6Tg@mail.gmail.com>
Subject: Re: [PATCH v1 05/14] usb: dwc2: Add port conn. sts. checking in
 _dwc2_hcd_resume() function.
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
Message-ID: <20190426204506.XLnMyGaaqGuZGFZYsEp5XgJwDXywb32BgvnGJCXjmu4@z>

Hi,

On Fri, Apr 19, 2019 at 11:53 AM Artur Petrosyan
<Arthur.Petrosyan@synopsys.com> wrote:
>
> Added port connection status checking which prevents exiting from
> Partial Power Down mode from _dwc2_hcd_resume() when no entering
> to Partial Power Down mode happened.
>
> Signed-off-by: Artur Petrosyan <arturp@synopsys.com>
> ---
>  drivers/usb/dwc2/hcd.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/usb/dwc2/hcd.c b/drivers/usb/dwc2/hcd.c
> index 1d18258b5ff8..8367902a47eb 100644
> --- a/drivers/usb/dwc2/hcd.c
> +++ b/drivers/usb/dwc2/hcd.c
> @@ -4544,6 +4544,9 @@ static int _dwc2_hcd_resume(struct usb_hcd *hcd)
>         struct dwc2_hsotg *hsotg = dwc2_hcd_to_hsotg(hcd);
>         unsigned long flags;
>         int ret = 0;
> +       u32 hprt0;
> +
> +       hprt0 = dwc2_read_hprt0(hsotg);
>
>         spin_lock_irqsave(&hsotg->lock, flags);

In this patch you put the reading of hprt0 before the spinlock (which
seems wrong) and then you move it after the spinlock in the last patch
in the series, AKA ("usb: dwc2: Add enter/exit hibernation from system
issued suspend/resume").  Can you just put it in the right place here
so you don't need to move it in a later patch?


-Doug
