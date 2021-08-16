Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 125FBC4338F
	for <linux-usb@archiver.kernel.org>; Mon, 16 Aug 2021 01:04:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D6BE561181
	for <linux-usb@archiver.kernel.org>; Mon, 16 Aug 2021 01:04:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231969AbhHPBD7 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 15 Aug 2021 21:03:59 -0400
Received: from netrider.rowland.org ([192.131.102.5]:59911 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S230124AbhHPBD7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 15 Aug 2021 21:03:59 -0400
Received: (qmail 107272 invoked by uid 1000); 15 Aug 2021 21:03:27 -0400
Date:   Sun, 15 Aug 2021 21:03:27 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Peter Chen <peter.chen@kernel.org>
Cc:     Jeaho Hwang <jhhwang@rtst.co.kr>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: chipidea: fix RT issue for udc
Message-ID: <20210816010327.GA106658@rowland.harvard.edu>
References: <20210810060228.GA3326442@ubuntu>
 <20210816005205.GA3907@nchen>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210816005205.GA3907@nchen>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 16, 2021 at 08:52:06AM +0800, Peter Chen wrote:
> On 21-08-10 15:02:28, Jeaho Hwang wrote:
> > hw_ep_prime sometimes fails if irq occurs while it rus on RT kernel.
> > to prevent local_irq_save should keep the function from irqs.
> > 
> > I am not sure where is the best to submit this patch, between RT and USB
> > community so sending to both. thanks.
> 
> Greg, do you have any suggestions about it, the RT kernel schedules the interrupt
> handler (top-half) out which causes the USB hardware atomic sequences are broken,
> these hardware operations needs to be executed within limited time.

The RT kernel does its scheduling based on priorities.  If the 
interrupt handler is scheduled out, it's because some other process 
with a higher priority needs to run.  The answer should be to increase 
the handler's priority.

Alan Stern
