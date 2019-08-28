Return-Path: <SRS0=FNJE=WY=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F40AC3A5A1
	for <linux-usb@archiver.kernel.org>; Wed, 28 Aug 2019 10:56:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3C5C720828
	for <linux-usb@archiver.kernel.org>; Wed, 28 Aug 2019 10:56:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726272AbfH1K4E (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 28 Aug 2019 06:56:04 -0400
Received: from gate.crashing.org ([63.228.1.57]:32911 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726246AbfH1K4E (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 28 Aug 2019 06:56:04 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x7SAtikZ011311;
        Wed, 28 Aug 2019 05:55:45 -0500
Message-ID: <d2f02109e718a6578d91467e6a4d522819be7a23.camel@kernel.crashing.org>
Subject: Re: [PATCH 1/2] usb: gadget: net2280: Move all "ll" registers in
 one structure
From:   Benjamin Herrenschmidt <benh@kernel.crashing.org>
To:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org
Cc:     Guido Kiener <guido@kiener-muenchen.de>,
        Alan Stern <stern@rowland.harvard.edu>
Date:   Wed, 28 Aug 2019 20:55:44 +1000
In-Reply-To: <87ftllwqi7.fsf@gmail.com>
References: <bc390967a9ac59e658ae79ba74a23a6ca898351b.camel@kernel.crashing.org>
         <87ftllwqi7.fsf@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 2019-08-28 at 13:09 +0300, Felipe Balbi wrote:
> Hi,
> 
> Benjamin Herrenschmidt <benh@kernel.crashing.org> writes:
> 
> > The split into multiple structures of the "ll" register bank is
> > impractical. It makes it hard to add ll_lfps_timers_2 which is
> > at offset 0x794, which is outside of the existing "lfps" structure
> > and would require us to add yet another one.
> > 
> > Instead, move all the "ll" registers into a single usb338x_ll_regs
> > structure, and add ll_lfps_timers_2 while at it. It will be used
> > in a subsequent patch.
> > 
> > Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> 
> I tried applying your patches but it resulted in build break. Can you
> collect all the dependencies and send a single series? I'm applying on
> top of my testing/next branch.

You mean the 2 net2280 patches ? Or something else ?

What break did you get ? It's just one series of 2 patches.... I'll try
rebasing them against your branch tomorrow.

Cheers,
Ben.


