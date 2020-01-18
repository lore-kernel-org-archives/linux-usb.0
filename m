Return-Path: <SRS0=FyyG=3H=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C13ACC32771
	for <linux-usb@archiver.kernel.org>; Sat, 18 Jan 2020 22:01:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9E55B206E6
	for <linux-usb@archiver.kernel.org>; Sat, 18 Jan 2020 22:01:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727050AbgARWBH (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 18 Jan 2020 17:01:07 -0500
Received: from smtp06.smtpout.orange.fr ([80.12.242.128]:45883 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727043AbgARWBG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 18 Jan 2020 17:01:06 -0500
Received: from belgarion ([90.89.233.68])
        by mwinf5d41 with ME
        id ry0w210021VCWxW03y136Y; Sat, 18 Jan 2020 23:01:05 +0100
X-ME-Helo: belgarion
X-ME-Auth: amFyem1pay5yb2JlcnRAb3JhbmdlLmZy
X-ME-Date: Sat, 18 Jan 2020 23:01:05 +0100
X-ME-IP: 90.89.233.68
From:   Robert Jarzmik <robert.jarzmik@free.fr>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v2] usb: phy: phy-gpio-vbus-usb: Convert to GPIO descriptors
References: <20200106151005.321983-1-linus.walleij@linaro.org>
        <87a76syjnq.fsf@belgarion.home>
        <CACRpkdYrGB4qYa09TiucDWV0wdOfc4pskXULRTHFKdmCeXd41w@mail.gmail.com>
X-URL:  http://belgarath.falguerolles.org/
Date:   Sat, 18 Jan 2020 23:00:55 +0100
In-Reply-To: <CACRpkdYrGB4qYa09TiucDWV0wdOfc4pskXULRTHFKdmCeXd41w@mail.gmail.com>
        (Linus Walleij's message of "Tue, 14 Jan 2020 01:29:06 +0100")
Message-ID: <87k15o1l2g.fsf@belgarion.home>
User-Agent: Gnus/5.130008 (Ma Gnus v0.8) Emacs/26 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Linus Walleij <linus.walleij@linaro.org> writes:

> On Sun, Jan 12, 2020 at 12:54 PM Robert Jarzmik <robert.jarzmik@free.fr> wrote:
> There are two names. The lookup name that I just invented to be
> "vbus" and "pullup". One reason to choose these names is that
> if someone migrates the platforms to device tree they can name
> the DT property vbus-gpios = <...>; pullup-gpios = <...>;
> which I think makes sense.
>
> Then there is the consumer name that is shown in debugfs etc.
>
> That is preserved with these calls:
>
> +       gpiod_set_consumer_name(gpio_vbus->vbus_gpiod, "vbus_detect");
> (...)
> +       if (gpio_vbus->pullup_gpiod)
> +               gpiod_set_consumer_name(gpio_vbus->pullup_gpiod, "udc_pullup");

Ah yes, I see it now.

For the mach-pxa part :
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>

Cheers.

-- 
Robert
