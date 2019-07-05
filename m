Return-Path: <SRS0=Q4mg=VC=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCD96C5B57D
	for <linux-usb@archiver.kernel.org>; Fri,  5 Jul 2019 22:09:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ABF40216E3
	for <linux-usb@archiver.kernel.org>; Fri,  5 Jul 2019 22:09:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725945AbfGEWJd (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 5 Jul 2019 18:09:33 -0400
Received: from gate.crashing.org ([63.228.1.57]:57766 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725882AbfGEWJd (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 5 Jul 2019 18:09:33 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x65M9NN7013911;
        Fri, 5 Jul 2019 17:09:24 -0500
Message-ID: <b93cdcb5f1b58621419c49eba952e092578753c3.camel@kernel.crashing.org>
Subject: Re: [PATCH V3] usb: gadget: storage: Remove warning message
From:   Benjamin Herrenschmidt <benh@kernel.crashing.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     EJ Hsu <ejh@nvidia.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        WK Tsai <wtsai@nvidia.com>
Date:   Sat, 06 Jul 2019 08:09:23 +1000
In-Reply-To: <Pine.LNX.4.44L0.1907051024420.1606-100000@iolanthe.rowland.org>
References: <Pine.LNX.4.44L0.1907051024420.1606-100000@iolanthe.rowland.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 2019-07-05 at 10:30 -0400, Alan Stern wrote:
> I haven't looked at the new patches yet.
> 
> Still, what I originally had in mind for this situation was that the 
> _last_ event should always take precedence.  This goes against the idea 
> of having separate FSG_STATE_* levels for disconnect and config-change, 
> because the driver assumes that higher levels should override lower 
> levels.

Right, this is what my new tentative patch does. The main caveat is to
ensure that if that last event arrives after the previous one was
"dequeued" by the thread but before it was *processed*, then we don't
clobber it's argument (new_fsg) and thus end up processing both events
each with the appropriate corresponding value of new_fsg.

This is the root of the bug in fact: When the second event occurs in
that window, we end up processing twice, as expected, but potentially
using twice the *new* new_fsg value.

> Also, if the thread has already started processing one of these events 
> when another one occurs, the new exception should cause the thread to 
> restart the handler and thus take care of the new event.  And yes, 
> there should be enough locking to ensure that nothing gets stomped on 
> except in situations where it won't matter.
> 
> That's how I think this should all work, and it doesn't look like we 
> really need a queue to do it properly.

Yes, I agree. That's what the patch I posted last night aims at, I need
to test it today.

Cheers,
Ben.


