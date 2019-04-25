Return-Path: <SRS0=WMKl=S3=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13FF8C43219
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 14:22:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1CA14206C1
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 14:22:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727452AbfDYOW2 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 25 Apr 2019 10:22:28 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:55426 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726176AbfDYOW2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Apr 2019 10:22:28 -0400
Received: (qmail 2226 invoked by uid 2102); 25 Apr 2019 10:22:27 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 25 Apr 2019 10:22:27 -0400
Date:   Thu, 25 Apr 2019 10:22:27 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     "Bollinger, Seth" <Seth.Bollinger@digi.com>
cc:     USB list <linux-usb@vger.kernel.org>,
        Seth Bollinger <seth.boll@gmail.com>
Subject: Re: Command ring abort xhci_handshake question
In-Reply-To: <097F0764-F4F5-48FC-9BAA-276E88B1E676@digi.com>
Message-ID: <Pine.LNX.4.44L0.1904251021290.1503-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 25 Apr 2019, Bollinger, Seth wrote:

> Hello All,
> 
> Recently I’ve been troubleshooting a problem with the host
> controller dying and noticed that when the controller dies, the
> system was unresponsive for a _long_ period of time.  When I explored
> the code a bit, I saw that xhci_handshake will spin with interrupts
> disabled for up to 5 seconds.  I also saw places where it would spin
> for up to 10 seconds (I have not experienced this though…).  5
> seconds with interrupts disabled seems like an eternity.

Are you certain that those places with the very long timeouts are 
called with interrupts disabled?

> Is there a reason that it’s done this way?  It looks like the code
> was inherited from ehci, so the code has been used for a long period
> of time.

In ehci-hcd, the long timeouts occur only with interrupts enabled.

Alan Stern

> Would it be possible to wait for the command ring stopped event for 5
> seconds, then check the CRR bit and halt and die if it’s not
> cleared?
> 
> Thanks!
> 
> Seth


