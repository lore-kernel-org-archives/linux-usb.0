Return-Path: <SRS0=TXFt=SR=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99EFCC10F0E
	for <linux-usb@archiver.kernel.org>; Mon, 15 Apr 2019 20:48:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 71C01205F4
	for <linux-usb@archiver.kernel.org>; Mon, 15 Apr 2019 20:48:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727892AbfDOUs2 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 15 Apr 2019 16:48:28 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:40196 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726556AbfDOUs2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 15 Apr 2019 16:48:28 -0400
Received: (qmail 7836 invoked by uid 2102); 15 Apr 2019 16:48:27 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 15 Apr 2019 16:48:27 -0400
Date:   Mon, 15 Apr 2019 16:48:27 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Georg Chini <georg@chini.tk>
cc:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        <linux-usb@vger.kernel.org>
Subject: Re: Problem with USB2 devices connected to a hub
In-Reply-To: <e9786675-d78d-9e2c-e096-931e67e135d4@chini.tk>
Message-ID: <Pine.LNX.4.44L0.1904151644530.1575-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 15 Apr 2019, Georg Chini wrote:

> >> So what you are saying is that it's a "bug" or "feature" of the C3858
> >> CPU and can't be fixed, right?
> > An unfortunate feature of the xHCI design is that bandwidth
> > computations are all done internally by the xHC controller.  There's no
> > way to tell _how_ they were done, what the results were in detail, or
> > to fix any mistakes.
> >
> > Alan Stern
> 
> So what you are saying is still that the CPU has a bug because the 
> controller
> seems to be integrated on the CPU:
> 
> 00:15.0 USB controller: Intel Corporation Atom Processor C3000 Series 
> USB 3.0 xHCI Controller (rev 11)

Well, it's a matter of terminology.  Even though the xHCI host
controller may be integrated on the same chip as the CPU, I'd still
prefer to say the bug is in the host controller and not in the CPU.

> Or can it be a firmware/board issue as well?

That seems pretty unlikely.

Alan Stern

