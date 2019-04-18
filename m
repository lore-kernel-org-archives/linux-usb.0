Return-Path: <SRS0=JW0E=SU=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E7D5C10F0E
	for <linux-usb@archiver.kernel.org>; Thu, 18 Apr 2019 06:50:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 290722184B
	for <linux-usb@archiver.kernel.org>; Thu, 18 Apr 2019 06:50:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388070AbfDRGuF (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 18 Apr 2019 02:50:05 -0400
Received: from mx2.suse.de ([195.135.220.15]:50574 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725886AbfDRGuF (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 18 Apr 2019 02:50:05 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id D413EAF96;
        Thu, 18 Apr 2019 06:50:03 +0000 (UTC)
Message-ID: <1555569464.7835.4.camel@suse.com>
Subject: Re: [PATCH] usbnet: fix kernel crash after disconnect
From:   Oliver Neukum <oneukum@suse.com>
To:     Kloetzke Jan <Jan.Kloetzke@preh.de>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Date:   Thu, 18 Apr 2019 08:37:44 +0200
In-Reply-To: <20190417091849.7475-1-Jan.Kloetzke@preh.de>
References: <20190417091849.7475-1-Jan.Kloetzke@preh.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190418063744.-hOf6Y6TgJgV1-IDMWvQzwYpvYmxvaNMG6yLQ8_tgmo@z>

On Mi, 2019-04-17 at 09:19 +0000, Kloetzke Jan wrote:
> When disconnecting cdc_ncm the kernel sporadically crashes shortly
> after the disconnect:
> 
>   [   57.868812] Unable to handle kernel NULL pointer dereference at virtual address 00000000
>   ...
>   [   58.006653] PC is at 0x0
>   [   58.009202] LR is at call_timer_fn+0xec/0x1b4
>   [   58.013567] pc : [<0000000000000000>] lr : [<ffffff80080f5130>] pstate: 00000145
>   [   58.020976] sp : ffffff8008003da0
>   [   58.024295] x29: ffffff8008003da0 x28: 0000000000000001
>   [   58.029618] x27: 000000000000000a x26: 0000000000000100
>   [   58.034941] x25: 0000000000000000 x24: ffffff8008003e68
>   [   58.040263] x23: 0000000000000000 x22: 0000000000000000
>   [   58.045587] x21: 0000000000000000 x20: ffffffc68fac1808
>   [   58.050910] x19: 0000000000000100 x18: 0000000000000000
>   [   58.056232] x17: 0000007f885aff8c x16: 0000007f883a9f10
>   [   58.061556] x15: 0000000000000001 x14: 000000000000006e
>   [   58.066878] x13: 0000000000000000 x12: 00000000000000ba
>   [   58.072201] x11: ffffffc69ff1db30 x10: 0000000000000020
>   [   58.077524] x9 : 8000100008001000 x8 : 0000000000000001
>   [   58.082847] x7 : 0000000000000800 x6 : ffffff8008003e70
>   [   58.088169] x5 : ffffffc69ff17a28 x4 : 00000000ffff138b
>   [   58.093492] x3 : 0000000000000000 x2 : 0000000000000000
>   [   58.098814] x1 : 0000000000000000 x0 : 0000000000000000
>   ...
>   [   58.205800] [<          (null)>]           (null)
>   [   58.210521] [<ffffff80080f5298>] expire_timers+0xa0/0x14c
>   [   58.215937] [<ffffff80080f542c>] run_timer_softirq+0xe8/0x128
>   [   58.221702] [<ffffff8008081120>] __do_softirq+0x298/0x348
>   [   58.227118] [<ffffff80080a6304>] irq_exit+0x74/0xbc
>   [   58.232009] [<ffffff80080e17dc>] __handle_domain_irq+0x78/0xac
>   [   58.237857] [<ffffff8008080cf4>] gic_handle_irq+0x80/0xac
>   ...
> 
> The crash happens roughly 125..130ms after the disconnect. This
> correlates with the 'delay' timer that is started on certain USB tx/rx
> errors in the URB completion handler.
> 
> The suspected problem is a race of usbnet_stop() with
> usbnet_start_xmit(). In usbnet_stop() we call usbnet_terminate_urbs()
> to cancel all URBs in flight. This only makes sense if no new URBs are
> submitted concurrently, though. But the usbnet_start_xmit() can run at
> the same time on another CPU which almost unconditionally submits an
> URB. The error callback of the new URB will then schedule the timer
> after it was already stopped.

Hi,

interesting. How sure are you of the details of your analysis?
I am asking because usbnet_stop() does a del_timer_sync().
It is indeed written under the assumption that the upper layer
will have ceased transmission when it stops an interface.

So I am wondering whether the correct fix would not be to make
sure the timer is started.

	Regards
		Oliver

