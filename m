Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0877FC433DB
	for <linux-usb@archiver.kernel.org>; Mon, 22 Mar 2021 19:02:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BDFCE61992
	for <linux-usb@archiver.kernel.org>; Mon, 22 Mar 2021 19:02:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232442AbhCVTCL (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 22 Mar 2021 15:02:11 -0400
Received: from netrider.rowland.org ([192.131.102.5]:38547 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S231740AbhCVTBa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 22 Mar 2021 15:01:30 -0400
Received: (qmail 678067 invoked by uid 1000); 22 Mar 2021 15:01:25 -0400
Date:   Mon, 22 Mar 2021 15:01:25 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc:     Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stanislaw Gruszka <sgruszka@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH] USB: ehci: drop workaround for forced irq threading
Message-ID: <20210322190125.GD675969@rowland.harvard.edu>
References: <20210322111249.32141-1-johan@kernel.org>
 <20210322164200.GB667925@rowland.harvard.edu>
 <20210322165917.it5d5f5kuvs7jah5@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210322165917.it5d5f5kuvs7jah5@linutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Mar 22, 2021 at 05:59:17PM +0100, Sebastian Andrzej Siewior wrote:
> On 2021-03-22 12:42:00 [-0400], Alan Stern wrote:
> > What happens on RT systems?  Are they smart enough to avoid the whole 
> > problem by enabling interrupts during _all_ callbacks?
> 
> tl;dr: Yes. 
> 
> The referenced commit (id 81e2073c175b) disables interrupts only on !RT
> configs so for RT everything remains unchanged (the backports are
> already adjusted for the old stable trees to use the proper CONFIG_* for
> enabled RT).
> 
> All hrtimer callbacks run as HRTIMER_MODE_SOFT by default. The
> HRTIMER_MODE_HARD ones (which expire in HARDIRQ context) were audited /
> explicitly enabled.
> The same goes irq_work.
> The printk code is different compared to mainline. A printk() on RT in
> HARDIRQ context is printed once the HARDIRQ context is left. So the
> serial/console/… driver never gets a chance to acquire its lock in
> hardirq context.
> 
> An interrupt handler which is not forced-threaded must be marked as such
> and must not use any spinlock_t based locking. lockdep/might_sleep
> complain here already.

Okay, in that case:

Acked-by: Alan Stern <stern@rowland.harvard.edu>
