Return-Path: <SRS0=WMKl=S3=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BF49C43218
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 20:58:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 17E28206BF
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 20:58:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727194AbfDYU6W (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 25 Apr 2019 16:58:22 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:50310 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726282AbfDYU6V (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Apr 2019 16:58:21 -0400
Received: (qmail 6878 invoked by uid 2102); 25 Apr 2019 16:58:20 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 25 Apr 2019 16:58:20 -0400
Date:   Thu, 25 Apr 2019 16:58:20 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Johan Hovold <johan@kernel.org>
cc:     Oliver Neukum <oneukum@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 0/5] USB: fix tty unthrottle races
In-Reply-To: <20190425160540.10036-1-johan@kernel.org>
Message-ID: <Pine.LNX.4.44L0.1904251655590.1292-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 25 Apr 2019, Johan Hovold wrote:

> This series fixes a couple of long-standing issues in USB serial and
> cdc-acm which essentially share the same implementation.
> 
> As noted by Oliver a few years back, read-urb completion can race with
> unthrottle() running on another CPU and this can potentially lead to
> memory corruption. This particular bug in cdc-acm was unfortunately
> reintroduced a year later.
> 
> There's also a second race due to missing memory barriers which could
> theoretically lead to the port staying throttled until reopened on
> weakly ordered systems. A second set of memory barriers should address
> that.
> 
> I would appreciate your keen eyes on this one to make sure I got the
> barriers right.
> 
> I noticed there's some on-going discussion about the atomic memory
> barriers that Alan's involved in, and I'll try to catch up on his
> data-race work as well. I'm still a little concerned about whether the
> smp_mb__before_atomic() is sufficient to prevent the compiler from
> messing things up without adding READ_ONCE().

I think your changes in patches 1 and 4 are correct.  Regardless of the
issues still undergoing discussion elsewhere, smp_mb__before_atomic()
should cause both the compiler and the CPU to order every preceding
operation (READ_ONCE or not) before the atomic op.

Alan Stern

> Note that none of these have stable tags as the issues have been there
> for eight years or so without anyone noticing (besides Oliver).
> 
> Still feels good to clean up your own mess.
> 
> Note that the cdc-acm patches have so far only been compile tested.
> 
> Johan
> 
> 
> Johan Hovold (5):
>   USB: serial: fix unthrottle races
>   USB: serial: clean up throttle handling
>   USB: serial: generic: drop unnecessary goto
>   USB: cdc-acm: fix unthrottle races
>   USB: cdc-acm: clean up throttle handling
> 
>  drivers/usb/class/cdc-acm.c  | 63 +++++++++++++++---------------
>  drivers/usb/class/cdc-acm.h  |  3 +-
>  drivers/usb/serial/generic.c | 76 +++++++++++++++++++-----------------
>  include/linux/usb/serial.h   |  5 +--
>  4 files changed, 75 insertions(+), 72 deletions(-)
> 
> 

