Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B829FC433E0
	for <linux-usb@archiver.kernel.org>; Mon, 22 Mar 2021 16:42:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8694861990
	for <linux-usb@archiver.kernel.org>; Mon, 22 Mar 2021 16:42:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231971AbhCVQmR (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 22 Mar 2021 12:42:17 -0400
Received: from netrider.rowland.org ([192.131.102.5]:35573 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S231979AbhCVQmC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 22 Mar 2021 12:42:02 -0400
Received: (qmail 671620 invoked by uid 1000); 22 Mar 2021 12:42:00 -0400
Date:   Mon, 22 Mar 2021 12:42:00 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Johan Hovold <johan@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stanislaw Gruszka <sgruszka@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH] USB: ehci: drop workaround for forced irq threading
Message-ID: <20210322164200.GB667925@rowland.harvard.edu>
References: <20210322111249.32141-1-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210322111249.32141-1-johan@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Mar 22, 2021 at 12:12:49PM +0100, Johan Hovold wrote:
> Force-threaded interrupt handlers used to run with interrupts enabled,
> something which could lead to deadlocks in case a threaded handler
> shared a lock with code running in hard interrupt context (e.g. timer
> callbacks) and did not explicitly disable interrupts.
> 
> Since commit 81e2073c175b ("genirq: Disable interrupts for force
> threaded handlers") interrupt handlers always run with interrupts
> disabled on non-RT so that drivers no longer need to do handle forced
> threading ("threadirqs").

What happens on RT systems?  Are they smart enough to avoid the whole 
problem by enabling interrupts during _all_ callbacks?

Alan Stern
