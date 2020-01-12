Return-Path: <SRS0=ALZm=3B=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9878C32771
	for <linux-usb@archiver.kernel.org>; Sun, 12 Jan 2020 11:54:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A146B21569
	for <linux-usb@archiver.kernel.org>; Sun, 12 Jan 2020 11:54:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732750AbgALLyi (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 12 Jan 2020 06:54:38 -0500
Received: from smtp11.smtpout.orange.fr ([80.12.242.133]:18598 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732748AbgALLyi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 12 Jan 2020 06:54:38 -0500
Received: from belgarion ([90.89.233.68])
        by mwinf5d34 with ME
        id pPuZ210031VCWxW03PuZMQ; Sun, 12 Jan 2020 12:54:35 +0100
X-ME-Helo: belgarion
X-ME-Auth: amFyem1pay5yb2JlcnRAb3JhbmdlLmZy
X-ME-Date: Sun, 12 Jan 2020 12:54:35 +0100
X-ME-IP: 90.89.233.68
From:   Robert Jarzmik <robert.jarzmik@free.fr>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v2] usb: phy: phy-gpio-vbus-usb: Convert to GPIO descriptors
References: <20200106151005.321983-1-linus.walleij@linaro.org>
X-URL:  http://belgarath.falguerolles.org/
Date:   Sun, 12 Jan 2020 12:54:33 +0100
In-Reply-To: <20200106151005.321983-1-linus.walleij@linaro.org> (Linus
        Walleij's message of "Mon, 6 Jan 2020 16:10:05 +0100")
Message-ID: <87a76syjnq.fsf@belgarion.home>
User-Agent: Gnus/5.130008 (Ma Gnus v0.8) Emacs/26 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Linus Walleij <linus.walleij@linaro.org> writes:

> Instead of using the legacy GPIO API and keeping track on
> polarity inversion semantics in the driver, switch to use
> GPIO descriptors for this driver and change all consumers
> in the process.
>
> This makes it possible to retire platform data completely:
> the only remaining platform data member was "wakeup" which
> was intended to make the vbus interrupt wakeup capable,
> but was not set by any users and thus remained unused. VBUS
> was not waking any devices up. Leave a comment about it so
> later developers using the platform can consider setting it
> to always enabled so plugging in USB wakes up the platform.
>
> Cc: Robert Jarzmik <robert.jarzmik@free.fr>
> Cc: Daniel Mack <daniel@zonque.org>
> Cc: Haojian Zhuang <haojian.zhuang@gmail.com>
> Acked-by: Felipe Balbi <balbi@kernel.org>
> Acked-by: Sylwester Nawrocki <snawrocki@kernel.org>
> Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Fix a chip label typo in mach-s3c64xx
> - Collect the ACKs!

Hi Linus,

Throughout this patch, if I get it right, you suppose that :
 - the gpio_request() for the vbus is called as gpio_request(xx, gpio, "vbus")
 - the gpio_request() for the pullup is called as gpio_request(xx, gpio, "pullup")

My understanding from drivers/usb/phy/phy-gpio-vbus-usb.c is that these name are
:
 - "vbus_detect"
 - "udc_pullup"

Have I missed something ?

Cheers.

--
Robert
