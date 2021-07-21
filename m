Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C378C12002
	for <linux-usb@archiver.kernel.org>; Wed, 21 Jul 2021 16:17:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D69246023B
	for <linux-usb@archiver.kernel.org>; Wed, 21 Jul 2021 16:17:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232672AbhGUPgr (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 21 Jul 2021 11:36:47 -0400
Received: from netrider.rowland.org ([192.131.102.5]:52579 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S231732AbhGUPgq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Jul 2021 11:36:46 -0400
Received: (qmail 638707 invoked by uid 1000); 21 Jul 2021 12:17:22 -0400
Date:   Wed, 21 Jul 2021 12:17:22 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Guido Kiener <Guido.Kiener@rohde-schwarz.com>
Cc:     dave penkler <dpenkler@gmail.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        "qiang.zhang@windriver.com" <qiang.zhang@windriver.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        "paulmck@kernel.org" <paulmck@kernel.org>,
        USB <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] USB: usbtmc: Fix RCU stall warning
Message-ID: <20210721161722.GD633399@rowland.harvard.edu>
References: <3bef7f032d2142ddac469eef8aee0d49@rohde-schwarz.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3bef7f032d2142ddac469eef8aee0d49@rohde-schwarz.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 21, 2021 at 03:24:13PM +0000, Guido Kiener wrote:
> > -----Original Message-----
> > From: Alan Stern <stern@rowland.harvard.edu>
> > Sent: Wednesday, July 21, 2021 4:22 PM
> > To: dave penkler <dpenkler@gmail.com>
> > Cc: Greg KH <gregkh@linuxfoundation.org>; qiang.zhang@windriver.com; Dmitry
> > Vyukov <dvyukov@google.com>; paulmck@kernel.org; Kiener Guido 14DS1
> > <Guido.Kiener@rohde-schwarz.com>; USB <linux-usb@vger.kernel.org>
> > Subject: *EXT* Re: [PATCH] USB: usbtmc: Fix RCU stall warning
> > 
> > On Wed, Jul 21, 2021 at 11:44:23AM +0200, dave penkler wrote:
> > > Sorry, the issue this patch is trying to fix occurs because the
> > > current usbtmc driver resubmits the URB when it gets an EPROTO return.
> > > The dummy usb host controller driver used in the syzbot tests keeps
> > > returning the resubmitted URB with EPROTO causing a loop that starves
> > > RCU. With an actual HCI driver it either recovers or returns an EPIPE.
> > 
> > Are you sure about that?  Have you ever observed a usbtmc device recovering and
> > continuing to operate after an EPROTO error?
> 
> I can't speak for Dave and his investigations. However as you remember I did tests with
> EPROTO errors, see thread: https://marc.info/?l=linux-usb&m=162163776930423&w=2
> In the thread you can see the recovering.

Ah yes, now I remember.

That message doesn't show the _device_ recovering and continuing to operate, 
though.  It shows the _system_ recovering and realizing that the device has 
been disconnected.

What I was asking about was whether you knew of a case where there was an 
EPROTO error but afterward the usbtmc device continued to work -- no 
disconnection.  Assuming such cases are vanishingly rare, there's no harm in 
having the driver give up whenever it encounters EPROTO.

> Since no user blamed the usbtmc driver for system locks up to now, it's worth to think about
> whether the problem is caused by the dummy_hcd driver.

Both drivers contributed to the lockup.  The question is: Which driver was 
doing the wrong thing?  (Or which was _more_ wrong?)  I believe the usbtmc 
driver was.

> I still have no time for further investigations and would agree to use the simple patch
> to get rid of the topic for the usbtmc driver. Then the syzbot will maybe find another usb driver.

Agreed.  So Greg should go ahead and apply the $SUBJECT patch.

Alan Stern
