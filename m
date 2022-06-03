Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9FD3C433EF
	for <linux-usb@archiver.kernel.org>; Fri,  3 Jun 2022 21:24:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346183AbiFCVY0 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 3 Jun 2022 17:24:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230399AbiFCVY0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jun 2022 17:24:26 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 58A813057D
        for <linux-usb@vger.kernel.org>; Fri,  3 Jun 2022 14:24:25 -0700 (PDT)
Received: (qmail 313180 invoked by uid 1000); 3 Jun 2022 17:24:24 -0400
Date:   Fri, 3 Jun 2022 17:24:24 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Michael Grzeschik <mgr@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        kernel@pengutronix.de
Subject: Re: [PATCH v3] usb: hub: port: add sysfs entry to switch port power
Message-ID: <Ypp8CAjuBeRJWYSG@rowland.harvard.edu>
References: <20220603115222.2151283-1-m.grzeschik@pengutronix.de>
 <YpovuqKtQBKQoVos@rowland.harvard.edu>
 <20220603172209.GD26638@pengutronix.de>
 <YppjCCJrtxc4lEGc@rowland.harvard.edu>
 <20220603202958.GA29935@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220603202958.GA29935@pengutronix.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 03, 2022 at 10:29:58PM +0200, Michael Grzeschik wrote:
> On Fri, Jun 03, 2022 at 03:37:44PM -0400, Alan Stern wrote:
> > On Fri, Jun 03, 2022 at 07:22:09PM +0200, Michael Grzeschik wrote:
> > > Also, I just found out that just parsing power_bits is not enough.
> > > 
> > > E.g. when we use other tools to set clear PORT_POWER on the hub like
> > > uhubctl to disable a port. The value does not represent the real state
> > > of the port.
> > 
> > The value in power_bits is always supposed to match the real state of
> > the port.  How does uhubctl manage to get them to disagree?
> 
> https://github.com/mvp/uhubctl/blob/master/uhubctl.c#L1082

I see.  It relies on the fact that the hub-specific requests have their
recipient field set to Device or Other, not Interface (which in my opinion 
it should be).  This means we can't intercept these requests easily.

> It just calls a direct control transfer with rather CLEAR or SET_FEATURE
> set. So this will be transfered completely passing the kernel usb core
> layer. I actually would expect that the hubs interrupt worker would
> trigger. I will have to check if this is the case.

Regardless, the hub driver won't be aware that the port's power state has 
changed, so it won't update the power_bits value.

> > > I think it is better to use hub_port_status and port_is_power_on from
> > > hub.c to test the real state by sending a GET_STATUS command.
> > 
> > Maybe.  But if power_bits is working properly, this should not be
> > needed.  It would be better to fix the value stored in power_bits.
> 
> I don't know if this is trivial. If it is not, I would prefer to
> trigger the GET_STATUS in disable_show for now.

Yes, I think there is no choice.

Alan Stern
