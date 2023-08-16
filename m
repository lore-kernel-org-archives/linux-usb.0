Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDF88C04A6A
	for <linux-usb@archiver.kernel.org>; Wed, 16 Aug 2023 14:18:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343544AbjHPORk (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 16 Aug 2023 10:17:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343521AbjHPORI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Aug 2023 10:17:08 -0400
Received: from vps3.drown.org (vps3.drown.org [96.126.122.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE9552708
        for <linux-usb@vger.kernel.org>; Wed, 16 Aug 2023 07:17:06 -0700 (PDT)
X-Envelope-From: dan-netdev@drown.org
Received: from vps3.drown.org (vps3.drown.org [IPv6:2600:3c00::f03c:91ff:fedf:5654])
        by vps3.drown.org (Postfix) with ESMTPSA id 2B2633A0566;
        Wed, 16 Aug 2023 09:17:06 -0500 (CDT)
Date:   Wed, 16 Aug 2023 09:17:04 -0500
From:   Dan Drown <dan-netdev@drown.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: cdc-acm: add PPS support
Message-ID: <ZNzaYJ7CC/G280ct@vps3.drown.org>
References: <2e5758f57081786db37482a50bc0e58b@f9ae53fa8754>
 <cf57f9ef-90f4-7ef5-405e-78f79007f7bc@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cf57f9ef-90f4-7ef5-405e-78f79007f7bc@suse.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 16, 2023 at 11:50:15AM +0200, Oliver Neukum wrote:
> On 15.08.23 03:02, Dan Drown wrote:
> > Looks like it was put there to protect the iocount changes in the
> > surrounding code. Are your concerns around performance or deadlocks?
> 
> the lock is there for that and so that wait_serial_change()
> will read consistent counts.
> 
> The latter concerns me. We are calling potentially arbitrary code. That
> you intend it for PPS doesn't change that we'll call it for
> every line discipline that supports that callback.
> Line disciplines are supposed to do something with tty devices,
> aren't they? So what methods could they call in turn?
> Something that can end in wait_serial_change()?

Looking at the callers of tty_register_ldisc, the only one that passes
in a dcd_change handler is the pps-ldisc. That's not to say that
couldn't change in the future.

I could move the call to dcd_change before the read lock is acquired,
would that work for you?
