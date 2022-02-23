Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 644F0C433EF
	for <linux-usb@archiver.kernel.org>; Wed, 23 Feb 2022 22:13:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242931AbiBWWNd (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 23 Feb 2022 17:13:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231708AbiBWWNd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 23 Feb 2022 17:13:33 -0500
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 83EA04F471
        for <linux-usb@vger.kernel.org>; Wed, 23 Feb 2022 14:13:04 -0800 (PST)
Received: (qmail 1024609 invoked by uid 1000); 23 Feb 2022 17:13:03 -0500
Date:   Wed, 23 Feb 2022 17:13:03 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux USB Mailing List <linux-usb@vger.kernel.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Subject: Re: [PATCH] usb: core: improve handling of hubs with no ports
Message-ID: <Yhaxb0OvMwLtd6vr@rowland.harvard.edu>
References: <994d8963-ca4d-d4cb-a3f6-988d6aa9bcd7@gmail.com>
 <YhWXgyJ4lk8OpT57@rowland.harvard.edu>
 <4701f080-ef18-dbb2-7dd9-d9171a73411f@gmail.com>
 <YhZB9C/xGaoslZzT@rowland.harvard.edu>
 <131166ee-9926-2eb5-2abd-6bab294d2937@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <131166ee-9926-2eb5-2abd-6bab294d2937@gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Feb 23, 2022 at 09:58:56PM +0100, Heiner Kallweit wrote:
> On 23.02.2022 15:17, Alan Stern wrote:
> > Don't change register_root_hub().  Just change xhci_plat_probe(); make 
> > it skip the second call to usb_add_hcd() if there are no USB-3 ports.
> > 
> This works on my system. However a consequence is that xhci->shared_hcd
> is NULL.

Why is that?  xhci->shared_hcd doesn't get set in usb_add_hcd(), so 
skipping that call shouldn't cause it to be NULL.

Note: If you skip calling usb_add_hcd(), you will also have to skip the 
corresponding call to usb_remove_hcd().  There may be a few more 
subtleties involved as well; like I said before, I'm not an expert on 
this driver.  You should ask the xhci-hcd maintainer for advice.

Alan Stern

>  There are a few places like the following in xhci.c where
> this may result in a NPE. Not knowing the USB subsystem in detail
> I can't say whether these places are in any relevant path.
> 
> static int xhci_run_finished(struct xhci_hcd *xhci)
> {
>         if (xhci_start(xhci)) {
>                 xhci_halt(xhci);
>                 return -ENODEV;
>         }
>         xhci->shared_hcd->state = HC_STATE_RUNNING;
> 
> 
> 
> > Alan Stern
> > 
> >> What I can do: submit my patches as RFC, then there's a better basis
> >> for a discussion.
> >>
> >>> Alan Stern
> >>
> >> Heiner
> 
> Heiner
