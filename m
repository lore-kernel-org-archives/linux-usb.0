Return-Path: <SRS0=iu7A=SK=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E280AC10F13
	for <linux-usb@archiver.kernel.org>; Mon,  8 Apr 2019 14:33:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B5768206C0
	for <linux-usb@archiver.kernel.org>; Mon,  8 Apr 2019 14:33:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726766AbfDHOdR (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 8 Apr 2019 10:33:17 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:51626 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726612AbfDHOdQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 8 Apr 2019 10:33:16 -0400
Received: (qmail 2856 invoked by uid 2102); 8 Apr 2019 10:33:15 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 8 Apr 2019 10:33:15 -0400
Date:   Mon, 8 Apr 2019 10:33:15 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     "Bollinger, Seth" <Seth.Bollinger@digi.com>
cc:     USB list <linux-usb@vger.kernel.org>
Subject: Re: Bug: VHCI + USB 3.0
In-Reply-To: <A91C245C-B630-47E8-9243-EB4CA8E91E51@digi.com>
Message-ID: <Pine.LNX.4.44L0.1904081018530.1440-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 8 Apr 2019, Bollinger, Seth wrote:

> On Apr 6, 2019, at 11:08 AM, Alan Stern <stern@rowland.harvard.edu<mailto:stern@rowland.harvard.edu>> wrote:
> 
> Can you provide the "lsusb -v" output for the storage device as shown
> on both computers?  I want to see if the server and the client disagree
> on the maxpacket sizes for the bulk endpoints.  The key is that 3584 is
> a multiple of 512 but not of 1024.
> 
> Sorry for the delay.
> 
> Physical device:

...

> Virtual Device:

...

So no disagreement; in both cases the maxpacket values are 1024.  
Clearly this will not work if a Scatter-Gather component has length 
3584.

In fact, this bug has nothing at all to do with VHCI.  You would 
observe the same problem if you performed all the accesses on the 
host computer.

In theory, the device should report a block size of 1024.  Does it
actually do this?  A usbmon trace (on the host) showing what happens
when the device is first plugged in will provide the answer.  Can you 
collect one and post it?

Alan Stern

