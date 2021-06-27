Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39F24C48BC2
	for <linux-usb@archiver.kernel.org>; Sun, 27 Jun 2021 14:09:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1559E61C17
	for <linux-usb@archiver.kernel.org>; Sun, 27 Jun 2021 14:09:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230498AbhF0OL3 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 27 Jun 2021 10:11:29 -0400
Received: from netrider.rowland.org ([192.131.102.5]:57721 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S230436AbhF0OL2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 27 Jun 2021 10:11:28 -0400
Received: (qmail 625664 invoked by uid 1000); 27 Jun 2021 10:09:03 -0400
Date:   Sun, 27 Jun 2021 10:09:03 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     linyyuan@codeaurora.org
Cc:     Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jack Pham <jackp@codeaurora.org>
Subject: Re: [PATCH] usb: dwc3: fix race of usb_gadget_driver operation
Message-ID: <20210627140903.GB624763@rowland.harvard.edu>
References: <20210625104415.8072-1-linyyuan@codeaurora.org>
 <20210625163707.GC574023@rowland.harvard.edu>
 <b24825113327c72c742d55e89ec2726e@codeaurora.org>
 <20210626150304.GA601624@rowland.harvard.edu>
 <1d1f06763c7cdeb67264128537c6a8f4@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1d1f06763c7cdeb67264128537c6a8f4@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Jun 27, 2021 at 10:48:56AM +0800, linyyuan@codeaurora.org wrote:
> On 2021-06-26 23:03, Alan Stern wrote:
> > On Sat, Jun 26, 2021 at 09:16:25AM +0800, linyyuan@codeaurora.org wrote:
> > > On 2021-06-26 00:37, Alan Stern wrote:

> > > > Here and in the other places, you should test dwc->async_callbacks
> > > > _before_ dropping the spinlock.  Otherwise there is a race (the flag
> > > > could be written at about the same time it is checked).
> > > thanks for your comments,
> > > 
> > > if you think there is race here, how to make sure gadget_driver
> > > pointer is
> > > safe,
> > > this is closest place where we can confirm it is non-NULL by checking
> > > async_callbacks ?
> > 
> > I explained this twice already: We know that gadget_driver is not
> > NULL because usb_gadget_remove_driver calls synchronize_irq before
> > doing usb_gadget_udc_stop.
> > 
> > Look at this timing diagram:
> > 
> > 	CPU0				CPU1
> > 	----				----
> > 	IRQ happens for setup packet
> > 	  Handler sees async_callbacks
> > 	    is enabled
> > 	  Handler unlocks dwc->lock
> > 					usb_gadget_remove_driver runs
> > 					  Disables async callbacks
> > 					  Calls synchronize_irq
> > 	  Handler calls dwc->		  . waits for IRQ handler to
> > 	    gadget_driver->setup	  .   return
> > 	  Handler locks dwc-lock	  .
> > 	  ...				  .
> > 	  Handler returns		  .
> > 					  . synchronize_irq returns
> > 					  Calls usb_gadget_udc_stop
> > 					    dwc->gadget_driver is
> > 					      set to NULL
> > 
> > As you can see, dwc->gadget_driver is non-NULL when CPU0 uses it,
> > even though async_callbacks gets cleared during the time when the
> > lock is released.
> thanks for your patient explanation,
> but from this part, seem it is synchronize_irq() help to avoid NULL pointer
> crash.

That's right.

> can you also explain how async_callbacks flag help here  ?

It doesn't help in the situation shown above, but it does help in other 
situations.  Consider this timing diagram:

	CPU0				CPU1
	----				----
					usb_gadget_remove_driver runs
					  Disables async callbacks
					  Calls synchronize_irq
					    synchronize_irq returns
					  Calls udc_driver_unbind
	IRQ happens for disconnect
	  Handler sees async_callbacks
	    is disabled
	  Handler returns
					  Calls usb_gadget_udc_stop
					    dwc->gadget_driver is
					      set to NULL

With the async_callbacks check, everything works okay.  But now look at 
what would happen without the async_callbacks mechanism:

	CPU0				CPU1
	----				----
					usb_gadget_remove_driver runs
					  Calls synchronize_irq
					    synchronize_irq returns
					  Calls udc_driver_unbind
	IRQ happens for disconnect
	  Handler unlocks dwc->lock
	  Calls dwc->gadget_driver->disconnect
	    Gadget driver has already been unbound
	      and is not prepared to handle a
	      callback, so it crashes
					  Calls usb_gadget_udc_stop
					    dwc->gadget_driver is
					      set to NULL

Without the async_callbacks mechanism, the gadget driver can get a
callback at the wrong time (after it has been unbound), which might 
cause it to crash.

Alan Stern
