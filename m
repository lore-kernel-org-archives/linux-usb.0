Return-Path: <SRS0=7kPi=AO=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57FB0C433DF
	for <linux-usb@archiver.kernel.org>; Fri,  3 Jul 2020 19:49:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3623520899
	for <linux-usb@archiver.kernel.org>; Fri,  3 Jul 2020 19:49:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726832AbgGCTtV (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 3 Jul 2020 15:49:21 -0400
Received: from netrider.rowland.org ([192.131.102.5]:46249 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726379AbgGCTtV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jul 2020 15:49:21 -0400
Received: (qmail 632299 invoked by uid 1000); 3 Jul 2020 15:49:20 -0400
Date:   Fri, 3 Jul 2020 15:49:20 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH 2/2] usb: ohci-omap: Convert to use GPIO descriptors
Message-ID: <20200703194920.GC631551@rowland.harvard.edu>
References: <20200703175701.570446-1-linus.walleij@linaro.org>
 <20200703175701.570446-2-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200703175701.570446-2-linus.walleij@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jul 03, 2020 at 07:57:01PM +0200, Linus Walleij wrote:
> The OMAP1 OHCI driver is using the legacy GPIO API to grab some
> random GPIO lines. One is from the TPS65010 chip and used for
> power, another one is for overcurrent and while the driver picks
> this line it doesn't watch it at all.
> 
> Convert the driver and the OMAP1 OSK board file to pass these
> two GPIOs as machine descrived GPIO descriptors.
> 
> Cc: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> Cc: Tony Lindgren <tony@atomide.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

This patch suffers from the same problems as the previous one: incorrect 
cleanup in the failure pathways.

Alan Stern
