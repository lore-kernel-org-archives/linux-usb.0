Return-Path: <SRS0=EamD=VB=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4656DC0650E
	for <linux-usb@archiver.kernel.org>; Thu,  4 Jul 2019 21:58:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 204A221850
	for <linux-usb@archiver.kernel.org>; Thu,  4 Jul 2019 21:58:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727236AbfGDV66 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 4 Jul 2019 17:58:58 -0400
Received: from gate.crashing.org ([63.228.1.57]:60856 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726038AbfGDV66 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 4 Jul 2019 17:58:58 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x64LwmOv031597;
        Thu, 4 Jul 2019 16:58:49 -0500
Message-ID: <e1e27dc501bdb1c6dfb41019d0d9d3760280f4a7.camel@kernel.crashing.org>
Subject: Re: Virtual hub, resets etc...
From:   Benjamin Herrenschmidt <benh@kernel.crashing.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Michal Nazarewicz <mina86@mina86.com>
Date:   Fri, 05 Jul 2019 07:58:47 +1000
In-Reply-To: <776c8b72bff0d7dc80d56e58a0c8c1f46b882eb5.camel@kernel.crashing.org>
References: <Pine.LNX.4.44L0.1907041142410.18767-100000@netrider.rowland.org>
         <776c8b72bff0d7dc80d56e58a0c8c1f46b882eb5.camel@kernel.crashing.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 2019-07-05 at 07:44 +1000, Benjamin Herrenschmidt wrote:
> > >    - At some point I had code to reject EP queue() if the device
> > > is
> > > suspended with -ESHUTDOWN. The end result was bad ...
> > > f_mass_storage
> > > goes into an infinite loop of trying to queue the same stuff in
> > > start_out_transfer() when that happens. It looks like it's not
> > > really
> > > handling errors from queue() in a particularily useful way.
> > 
> > Don't reject EP queue requests.  Accept them as you would at any
> > time;
> > they will complete after the port is resumed.
>
> Except the suspend on a bus reset clears the port enable. You can't
> resume from that, only reset the port no ? Or am I missing something
> ?

Talking of which... do we need this ?

--- a/drivers/usb/gadget/composite.c
+++ b/drivers/usb/gadget/composite.c
@@ -1976,6 +1976,7 @@ void composite_disconnect(struct usb_gadget *gadget)
 	 * disconnect callbacks?
 	 */
 	spin_lock_irqsave(&cdev->lock, flags);
+	cdev->suspended = 0;
 	if (cdev->config)
 		reset_config(cdev);
 	if (cdev->driver->disconnect)

Otherwise with my vhub or with dummy_hcd, a suspend followed by a reset
will keep that stale suspended flag to 1 (which has no effect at the moment
but still...)

If yes, I'll submit a patch accordingly...

Cheers,
Ben.


