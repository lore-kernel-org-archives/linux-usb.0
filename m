Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96162C433E0
	for <linux-usb@archiver.kernel.org>; Thu, 25 Feb 2021 10:02:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 47E8264EC8
	for <linux-usb@archiver.kernel.org>; Thu, 25 Feb 2021 10:02:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235178AbhBYKBp (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 25 Feb 2021 05:01:45 -0500
Received: from foo.stuge.se ([212.116.89.98]:45028 "EHLO foo.stuge.se"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234606AbhBYJ7U (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 25 Feb 2021 04:59:20 -0500
Received: (qmail 6197 invoked by uid 1000); 25 Feb 2021 09:58:25 -0000
Message-ID: <20210225095825.6196.qmail@stuge.se>
Date:   Thu, 25 Feb 2021 09:58:24 +0000
From:   Peter Stuge <peter@stuge.se>
To:     Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Cc:     dri-devel@lists.freedesktop.org, hudson@trmm.net,
        markus@raatikainen.cc, sam@ravnborg.org, linux-usb@vger.kernel.org,
        th020394@gmail.com, lkundrak@v3.sk, pontus.fuchs@gmail.com,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH v6 3/3] drm: Add GUD USB Display driver
References: <20210219121702.50964-1-noralf@tronnes.org>
 <20210219121702.50964-4-noralf@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210219121702.50964-4-noralf@tronnes.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Noralf,

Noralf Trønnes wrote:
> The driver supports a one bit monochrome transfer format: R1. This is not
> implemented in the gadget driver. It is added in preparation for future
> monochrome e-ink displays.

I forgot, but I have a two-tone (black/red) e-ink display here, and I
also have a 3-bpp RGB TFT display.

Should we add maybe R2 and R3? (or R3/R8 for number of colours?)

I'm particularly considering the 3-bpp RGB panel for GUD use now, and
while it will surely work with say a 16-bit RGB mode many bits will
be wasted in the process.

What are your thoughts? Would you take a patch for that now, later, never?


//Peter
