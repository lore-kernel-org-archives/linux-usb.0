Return-Path: <SRS0=u9El=7K=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08879C433E0
	for <linux-usb@archiver.kernel.org>; Thu, 28 May 2020 16:04:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DE6F72071A
	for <linux-usb@archiver.kernel.org>; Thu, 28 May 2020 16:04:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404859AbgE1QEY (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 28 May 2020 12:04:24 -0400
Received: from netrider.rowland.org ([192.131.102.5]:39575 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S2404688AbgE1QEV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 May 2020 12:04:21 -0400
Received: (qmail 14781 invoked by uid 1000); 28 May 2020 12:04:20 -0400
Date:   Thu, 28 May 2020 12:04:20 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Zebediah Figura <zfigura@codeweavers.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        usb-storage@lists.one-eyed-alien.net, linux-usb@vger.kernel.org
Subject: Re: Bug 207877: ASMedia drive (174c:55aa) hangs in ioctl
 CDROM_DRIVE_STATUS when mounting a DVD
Message-ID: <20200528160420.GA14188@rowland.harvard.edu>
References: <7d0b20b9-4735-bbed-bb50-72764aefd6d8@codeweavers.com>
 <20200528075440.GA2881385@kroah.com>
 <465eaae3-fa60-f37e-1d62-c52236720798@codeweavers.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <465eaae3-fa60-f37e-1d62-c52236720798@codeweavers.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 28, 2020 at 10:02:07AM -0500, Zebediah Figura wrote:
> On 5/28/20 2:54 AM, Greg KH wrote:
> > On Wed, May 27, 2020 at 11:23:13PM -0500, Zebediah Figura wrote:
> > > Hello all,
> > > 
> > > I was asked to report this bug here. There's more details in the bug report,
> > > but it's been proposed that there's a deadlock between device_reset() in
> > > scsiglue.c and usb_stor_control_thread().
> > 
> > What bug report where?  Can you provide a link and the details here in
> > the email?
> 
> Oops, meant to link it and forgot. Sorry about that.
> 
> https://bugzilla.kernel.org/show_bug.cgi?id=207877

This doesn't look like a deadlock to me, at least, not a deadlock 
involving the device reset code.

Your next step should be to collect a usbmon trace showing what happens 
when the problem occurs.  See the instructions in 
Documentation/usb/usbmon.rst.

Alan Stern
