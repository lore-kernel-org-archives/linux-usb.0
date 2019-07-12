Return-Path: <SRS0=G3IJ=VJ=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7965C742A5
	for <linux-usb@archiver.kernel.org>; Fri, 12 Jul 2019 02:59:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 83DB920863
	for <linux-usb@archiver.kernel.org>; Fri, 12 Jul 2019 02:59:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729071AbfGLC7U (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 11 Jul 2019 22:59:20 -0400
Received: from gate.crashing.org ([63.228.1.57]:56919 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728485AbfGLC7U (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 11 Jul 2019 22:59:20 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x6C2xEJP010569;
        Thu, 11 Jul 2019 21:59:15 -0500
Message-ID: <aaf0453ce720ff7cc29de9897bdff8aae793679a.camel@kernel.crashing.org>
Subject: Re: [PATCH 00/10] usb: gadget: aspeed: Bug fixes
From:   Benjamin Herrenschmidt <benh@kernel.crashing.org>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, Joel Stanley <joel@jms.id.au>,
        Alan Stern <stern@rowland.harvard.edu>
Date:   Fri, 12 Jul 2019 12:59:14 +1000
In-Reply-To: <20190712025348.21019-1-benh@kernel.crashing.org>
References: <20190712025348.21019-1-benh@kernel.crashing.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 2019-07-12 at 12:53 +1000, Benjamin Herrenschmidt wrote:
> So I finally got back an Aspeed eval board, and thus resumed maintaining
> and handling bug reports for this driver.
> 
> This is a series that fixes a number of enumeration related issues with
> a variety of hosts, OSes, and circumstances (ie, plugging/unplugging at
> funny times, etc...).
> 
> I also added dummy support for the TT requests, it doesn't hurt as some
> host seem to send them even when TT support isn't advertized.
> 
> Most of this is bug fixes and probably shouldn't wait for another
> merge window, except possibly the last 2 patches.
> 
> v2: - Fix a space vs. tab issue in patch 2 reported by Sergei Shtylyov
>     - Put the TT patches at the end of the list as they aren't
>      as clear cut "bug fixes".

and

      - Add the f_mass_storage fix that I posted separately and
accidentaly included in this resend... the patches are completely
identical to the previously posted "v2" of those.

Cheers,
Ben.


