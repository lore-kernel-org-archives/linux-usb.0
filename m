Return-Path: <SRS0=v76c=WZ=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 761FBC3A59F
	for <linux-usb@archiver.kernel.org>; Thu, 29 Aug 2019 13:14:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 51A6623403
	for <linux-usb@archiver.kernel.org>; Thu, 29 Aug 2019 13:14:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727046AbfH2NOa (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 29 Aug 2019 09:14:30 -0400
Received: from muru.com ([72.249.23.125]:59074 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726985AbfH2NOa (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 29 Aug 2019 09:14:30 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 4A7A180E7;
        Thu, 29 Aug 2019 13:14:59 +0000 (UTC)
Date:   Thu, 29 Aug 2019 06:14:26 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Bin Liu <b-liu@ti.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH] usb: musb: omap2430: Fix flakeyness enumerating when
 connected to a lapdock
Message-ID: <20190829131426.GG52127@atomide.com>
References: <20190828151100.31996-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190828151100.31996-1-tony@atomide.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

* Tony Lindgren <tony@atomide.com> [190828 08:11]:
> With commit 594632efbb9a ("usb: musb: Adding musb support for OMAP4430")
> Looks like always calling otg_set_vbus() causes flakeyness enumerating when
> droid4 is connected to a lapdock. In this case lapdock runs in USB carkit
> type mode and feeds the VBUS.

I don't think this patch helps much actually, let's forget it for now.

Looks like the core reason for flakeyness enumerating devices is that
clocks are not idling on disconnect properly, and then the next
enumeration will fail. I'll debug more and will send a better patch
at some point.

Regards,

Tony
