Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26287C2B9F4
	for <linux-usb@archiver.kernel.org>; Sun, 20 Jun 2021 02:13:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 023B86101A
	for <linux-usb@archiver.kernel.org>; Sun, 20 Jun 2021 02:13:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230175AbhFTCPv (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 19 Jun 2021 22:15:51 -0400
Received: from netrider.rowland.org ([192.131.102.5]:39447 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S229591AbhFTCPu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 19 Jun 2021 22:15:50 -0400
Received: (qmail 362265 invoked by uid 1000); 19 Jun 2021 22:13:37 -0400
Date:   Sat, 19 Jun 2021 22:13:37 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Linyu Yuan <linyyuan@codeaurora.org>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jack Pham <jackp@codeaurora.org>
Subject: Re: [PATCH v3 1/2] usb: udc: core: hide struct usb_gadget_driver to
 gadget driver
Message-ID: <20210620021337.GA361976@rowland.harvard.edu>
References: <20210619154309.52127-1-linyyuan@codeaurora.org>
 <20210619154309.52127-2-linyyuan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210619154309.52127-2-linyyuan@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Jun 19, 2021 at 11:43:08PM +0800, Linyu Yuan wrote:
> currently most gadget driver have a pointer to save
> struct usb_gadget_driver from upper layer,
> it allow upper layer set and unset of the pointer.
> 
> there is race that upper layer unset the pointer first,
> but gadget driver use the pointer later,
> and it cause system crash due to NULL pointer access.

This race has already been fixed in Greg's usb-next branch.  See commit 
7dc0c55e9f30 ("USB: UDC core: Add udc_async_callbacks gadget op") and 
following commits 04145a03db9d ("USB: UDC: Implement 
udc_async_callbacks in dummy-hcd") and b42e8090ba93 ("USB: UDC: 
Implement udc_async_callbacks in net2280").

You just need to write a corresponding patch implementing the 
async_callbacks op for dwc3.

Alan Stern
