Return-Path: <SRS0=cP/j=W5=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4523FC3A59E
	for <linux-usb@archiver.kernel.org>; Mon,  2 Sep 2019 16:06:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 179B7217D7
	for <linux-usb@archiver.kernel.org>; Mon,  2 Sep 2019 16:06:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726192AbfIBQG4 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 2 Sep 2019 12:06:56 -0400
Received: from muru.com ([72.249.23.125]:59460 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726023AbfIBQG4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 2 Sep 2019 12:06:56 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 2A58C8022;
        Mon,  2 Sep 2019 16:07:24 +0000 (UTC)
Date:   Mon, 2 Sep 2019 09:06:51 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Pavel Machek <pavel@denx.de>
Cc:     Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-omap@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>,
        Marcel Partap <mpartap@gmx.net>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Michael Scott <hashcode0f@gmail.com>,
        NeKit <nekit1000@gmail.com>, Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH 0/4] musb host improvments mostly for omap2430 glue
Message-ID: <20190902160651.GI52127@atomide.com>
References: <20190830232058.53414-1-tony@atomide.com>
 <20190902092344.GA31410@amd>
 <20190902094408.GB31410@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190902094408.GB31410@amd>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

* Pavel Machek <pavel@denx.de> [190902 09:44]:
> On Mon 2019-09-02 11:23:44, Pavel Machek wrote:
> Hmm. I guess CONFIG_USB_MUSB_DUAL_ROLE=y might be useful.
> 
> And now... if I unplug/replug the usb after the boot, USB hub and
> mouse are recognized. Good!
> 
> Less than minute later:
> 
> mmusb-hdrc.0.auto: Babble
> USB disconnect

The babble is most likely caused by some kind of signaling issue.

> I unplug, replug usb (not at the phone, between hub and dongle, and
> green LED indincating charging starts blinking rapidly.
> 
> cpcap-core spi0.0: EOT timed out.
> 
> I try plug/replug, and now green led is on.
> 
> I unplug replug at the phone, and get bunch more of messages:
> 
> musm _set_peripheral: already in peripheral mode: 99
> musm _set_peripheral: already in peripheral mode: 81
> musm _set_peripheral: already in peripheral mode: 81
> 
> musb_set_host: could not set host: 99
> musb_set_host: could not set host: 99
> musb_set_host: could not set host: 99
> musb_set_host: could not set host: 99
> musb_set_host: could not set host: 99
> musb_set_host: could not set host: 99
> musb_set_host: could not set host: 99
> musb_set_host: could not set host: 99
> 
> Unplug/replug at host, and again, hub+mouse is detected.
> 
> I unplug power connected to one of USB hub's ports... and find out
> that phone was _not_ powering it.
> 
> Ok... so something somehow works.... sometimes :-).

My guess is you're missing a USB micro-B cable with ID pin
grounded, with that things should just work automagically.

So no need for hubs feeding back VBUS and no need to
try to force host mode via sysfs unlike on n900.

Regards,

Tony
