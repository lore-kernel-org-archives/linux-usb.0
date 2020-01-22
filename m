Return-Path: <SRS0=IeTI=3L=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38AFAC2D0DB
	for <linux-usb@archiver.kernel.org>; Wed, 22 Jan 2020 09:16:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0BC1B2465B
	for <linux-usb@archiver.kernel.org>; Wed, 22 Jan 2020 09:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579684560;
	bh=2w8eSpelvTIRW1SwjHvFtX0xowrLFApA/X0ZHfjarOg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=wDzhIk/qUUeYLCpSC+XR7ymFM5eQhuPnQMqngwBL/HByFxTHUlhjquSHLMLCXw4wJ
	 fsqEplNOXXfcQEPV6RVhfvSqBMVInyFbdDrBFof6sbrc7nPN30HncZZ5ChiXZ0lGO9
	 H0VYS3k3Ar/p4wdzBN13eSSGZjEQGJowj0yvHsfg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726204AbgAVJP7 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 22 Jan 2020 04:15:59 -0500
Received: from mail.kernel.org ([198.145.29.99]:33064 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725911AbgAVJP7 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 22 Jan 2020 04:15:59 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 405B724655;
        Wed, 22 Jan 2020 09:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579684558;
        bh=2w8eSpelvTIRW1SwjHvFtX0xowrLFApA/X0ZHfjarOg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LFWfgT4Q6XGDb0RxjsXcX5vb4rmhmW/Gn6aK4lL7Cq4W9Hk2TwEggiMtCVVII+4k2
         hkj498k8NQ77GYRI2HuTykt/ou88oEXcG/Kbxtm8x72MculdlG5+YM16BeoPMVCe8c
         G0mgKbpkHsEdXWClo7ixDwd9vwB9g5PWyiQiOvNY=
Date:   Wed, 22 Jan 2020 10:15:56 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v2] usb: phy: phy-gpio-vbus-usb: Convert to GPIO
 descriptors
Message-ID: <20200122091556.GA2689180@kroah.com>
References: <20200106151005.321983-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200106151005.321983-1-linus.walleij@linaro.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jan 06, 2020 at 04:10:05PM +0100, Linus Walleij wrote:
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
> Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
> ---
> ChangeLog v1->v2:
> - Fix a chip label typo in mach-s3c64xx
> - Collect the ACKs!

With this applied, I now get the following build warnings:
drivers/usb/phy/phy-gpio-vbus-usb.c: In function ‘gpio_vbus_probe’:
drivers/usb/phy/phy-gpio-vbus-usb.c:237:11: warning: unused variable ‘gpio’ [-Wunused-variable]
  237 |  int err, gpio, irq;
      |           ^~~~
drivers/usb/phy/phy-gpio-vbus-usb.c:235:20: warning: unused variable ‘gpiod’ [-Wunused-variable]
  235 |  struct gpio_desc *gpiod;
      |                    ^~~~~

Can you please fix that up and resend?

thanks,

greg k-h
