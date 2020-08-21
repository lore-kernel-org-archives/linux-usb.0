Return-Path: <SRS0=Ypd4=B7=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8794C433DF
	for <linux-usb@archiver.kernel.org>; Fri, 21 Aug 2020 17:01:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9DD7820656
	for <linux-usb@archiver.kernel.org>; Fri, 21 Aug 2020 17:01:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728388AbgHURBg (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 21 Aug 2020 13:01:36 -0400
Received: from netrider.rowland.org ([192.131.102.5]:59589 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728712AbgHURBQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 21 Aug 2020 13:01:16 -0400
Received: (qmail 260200 invoked by uid 1000); 21 Aug 2020 13:01:06 -0400
Date:   Fri, 21 Aug 2020 13:01:06 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Martin Thierer <mthierer@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Data toggles not reset on "set configuration" for ports handled
 by "xhci_hcd" driver
Message-ID: <20200821170106.GB256196@rowland.harvard.edu>
References: <CAL3BvCzb6dGZOm6jy2PddSfioM7hThMEBm+aQ_gmMAWAXFYOuQ@mail.gmail.com>
 <20200821160321.GA256196@rowland.harvard.edu>
 <CAL3BvCyz3W+aRu0e=RE3teaMMh6KDYxu8NbFicY07Xt-=f9Whg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL3BvCyz3W+aRu0e=RE3teaMMh6KDYxu8NbFicY07Xt-=f9Whg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Aug 21, 2020 at 06:34:55PM +0200, Martin Thierer wrote:
> I read the usb 2.0 specs and generally came to the same conclusion,
> except I wasn't 100% sure because 9.1.1.5 talks about "configuring" in
> the context of bringing a device into the "configured" state, which
> one could argue isn't really the case if a "set configuration" message
> is sent to a device that is already configured with the exact same
> configuration.

Nonsense.  The text explicitly says "configuration involves correctly 
processing a SetConfiguration() request with a non-zero configuration 
value."  There's no requirement about what state the device was in 
previously.

> > Together these should explain the correct behavior.
> 
> I'm not sure I understand what you're implying here. That the kernel's
> behaviour is correct or not?

That the EHCI behavior is correct and the xHCI behavior is wrong.

>  (You're explicitly citing the usb *2.0*
> specs, but that should also apply to a usb 2 device plugged into an
> usb 3 port, right?)

Yes; the USB 3 spec says that the behavior of USB-2 devices should be 
governed by the USB-2 spec, even when they are plugged into a hub or 
controller.

Alan Stern
