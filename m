Return-Path: <SRS0=0aa0=ZS=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11C0AC432C0
	for <linux-usb@archiver.kernel.org>; Tue, 26 Nov 2019 17:45:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D9E692075C
	for <linux-usb@archiver.kernel.org>; Tue, 26 Nov 2019 17:45:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728198AbfKZRpT (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 26 Nov 2019 12:45:19 -0500
Received: from muru.com ([72.249.23.125]:43626 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726926AbfKZRpT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 26 Nov 2019 12:45:19 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 85583806C;
        Tue, 26 Nov 2019 17:45:56 +0000 (UTC)
Date:   Tue, 26 Nov 2019 09:45:15 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-omap@vger.kernel.org,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>, Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH] usb: musb: fix idling for suspend after disconnect
 interrupt
Message-ID: <20191126174515.GZ35479@atomide.com>
References: <20191126034151.38154-1-tony@atomide.com>
 <5ae7f3aa-3992-a810-f5d4-0b5bb8fa6356@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ae7f3aa-3992-a810-f5d4-0b5bb8fa6356@cogentembedded.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

* Sergei Shtylyov <sergei.shtylyov@cogentembedded.com> [191126 10:21]:
> Hello!
> 
> On 26.11.2019 6:41, Tony Lindgren wrote:
> 
> > When disconnected as USB B-device, we sometimes get a suspend interrupt
> > after disconnect interrupt. In that case we have devctl set to 99 with
> > VBUS still valid and musb_pm_runtime_check_session() wrongly things we
> 
>     Thinks?

Thanks will fix.

Tony
