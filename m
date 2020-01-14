Return-Path: <SRS0=yvD0=3D=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2A0EC33CAF
	for <linux-usb@archiver.kernel.org>; Tue, 14 Jan 2020 00:29:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A3B91207FF
	for <linux-usb@archiver.kernel.org>; Tue, 14 Jan 2020 00:29:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FFTP8Arc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728961AbgANA3U (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 13 Jan 2020 19:29:20 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:41886 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728890AbgANA3U (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Jan 2020 19:29:20 -0500
Received: by mail-lj1-f196.google.com with SMTP id h23so12245826ljc.8
        for <linux-usb@vger.kernel.org>; Mon, 13 Jan 2020 16:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VO45Gm3vTMMdU5tMeyluQ4SSaWkLBmovveUZfjidmmY=;
        b=FFTP8ArcfltV/7YAlvGBFcKXKSmmhDlSO+sZjzExfbv2M+PJrmslSK543aebJXYjbp
         3Om9HPcYuhJr1sCKtGLUZsAORuT60axO6N63sL+W6W5HTmtFN5kgQi2Tfou6qsjzAovi
         52FzxbmC7V5TtmLrd3bB/Evt3WW/mImUb/ikVk5vkTdCokeD9mefQiu/mRBFitdpI3Kx
         JTi5IdQ8BVi6uR2dz6Wc9i4RRCFUD86QgmEBZpOluaj7GQ0jZDMTWP6VwLo/wyeHE23b
         opfA1bZmXGo6Vq+592iIp6ByazY4XwqRhIrKGLTxZ/fXh4NmU5qxICpIIcg4wpQGPU+H
         CHdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VO45Gm3vTMMdU5tMeyluQ4SSaWkLBmovveUZfjidmmY=;
        b=UGukAZ2snfIV0cMYtHlNhCLV1UmjRoZBbY31beVycvvR1/hIKJJhKZVlnvgfOfn+RH
         R3dKDLVtWc8CL18h0J3uxNooBbh61u4YpTl1o8/VmJ8o28JCD+G+F1lNhdI6I/hOT60V
         7BE0D5HTtqWKyIfdPQkAAIKx6AjibSK3YE+j8dZEIQhv49WaTh4CcLe8KnFG20A6/Jpp
         H8n5dV/wosCK4zUKF14TQh6+aAJPAhEVsIEbIR9YFSWEJSmg5XhL592qvDrjroi47zOU
         AWhCXUwc3tPqZOt0YaF5Po/I0dbOSaAZ7p48aRP+VPiWoPeSFp7gUPTI8c58lIY7z7mp
         hgvA==
X-Gm-Message-State: APjAAAUeDIrT52xgHSL2dottRSS8E0ZAGdCByqw9ZkNBaCmy3DHMe/3e
        ffQsnFrTESavy2Ki19tYddzB58c5fI5W5m5Reytd5w==
X-Google-Smtp-Source: APXvYqyHBrorHLab1gBP4uFJlMR0HKpiyBcGp3R96G/IK3VQB1dKbBGcgQZuqCqT1rXFomoxWTX4vQsZIQfe14TCC4w=
X-Received: by 2002:a05:651c:111c:: with SMTP id d28mr12963940ljo.32.1578961758221;
 Mon, 13 Jan 2020 16:29:18 -0800 (PST)
MIME-Version: 1.0
References: <20200106151005.321983-1-linus.walleij@linaro.org> <87a76syjnq.fsf@belgarion.home>
In-Reply-To: <87a76syjnq.fsf@belgarion.home>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 14 Jan 2020 01:29:06 +0100
Message-ID: <CACRpkdYrGB4qYa09TiucDWV0wdOfc4pskXULRTHFKdmCeXd41w@mail.gmail.com>
Subject: Re: [PATCH v2] usb: phy: phy-gpio-vbus-usb: Convert to GPIO descriptors
To:     Robert Jarzmik <robert.jarzmik@free.fr>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Jan 12, 2020 at 12:54 PM Robert Jarzmik <robert.jarzmik@free.fr> wrote:
> Linus Walleij <linus.walleij@linaro.org> writes:

> Hi Linus,
>
> Throughout this patch, if I get it right, you suppose that :
>  - the gpio_request() for the vbus is called as gpio_request(xx, gpio, "vbus")
>  - the gpio_request() for the pullup is called as gpio_request(xx, gpio, "pullup")
>
> My understanding from drivers/usb/phy/phy-gpio-vbus-usb.c is that these name are
> :
>  - "vbus_detect"
>  - "udc_pullup"
>
> Have I missed something ?

There are two names. The lookup name that I just invented to be
"vbus" and "pullup". One reason to choose these names is that
if someone migrates the platforms to device tree they can name
the DT property vbus-gpios = <...>; pullup-gpios = <...>;
which I think makes sense.

Then there is the consumer name that is shown in debugfs etc.

That is preserved with these calls:

+       gpiod_set_consumer_name(gpio_vbus->vbus_gpiod, "vbus_detect");
(...)
+       if (gpio_vbus->pullup_gpiod)
+               gpiod_set_consumer_name(gpio_vbus->pullup_gpiod, "udc_pullup");

Yours,
Linus Walleij
