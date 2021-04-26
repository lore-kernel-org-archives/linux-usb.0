Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_RED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B75CC433B4
	for <linux-usb@archiver.kernel.org>; Mon, 26 Apr 2021 20:09:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 17E6E6100B
	for <linux-usb@archiver.kernel.org>; Mon, 26 Apr 2021 20:09:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241748AbhDZUKI (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 26 Apr 2021 16:10:08 -0400
Received: from shards.monkeyblade.net ([23.128.96.9]:35800 "EHLO
        mail.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241724AbhDZUKH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 26 Apr 2021 16:10:07 -0400
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
        by mail.monkeyblade.net (Postfix) with ESMTPSA id C73E84F48ADC4;
        Mon, 26 Apr 2021 13:09:23 -0700 (PDT)
Date:   Mon, 26 Apr 2021 13:09:19 -0700 (PDT)
Message-Id: <20210426.130919.1291678249925211750.davem@davemloft.net>
To:     gregkh@linuxfoundation.org
Cc:     johan@kernel.org, leoanto@aruba.it, linux-usb@vger.kernel.org,
        kuba@kernel.org, mail@anirudhrb.com, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: hso: fix NULL-deref on disconnect regression
From:   David Miller <davem@davemloft.net>
In-Reply-To: <YIaM9B/UZ1qHAC9+@kroah.com>
References: <20210426112911.fb3593c3a9ecbabf98a13313@aruba.it>
        <YIaJcgmiJFERvbEF@hovoldconsulting.com>
        <YIaM9B/UZ1qHAC9+@kroah.com>
X-Mailer: Mew version 6.8 on Emacs 27.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.2 (mail.monkeyblade.net [0.0.0.0]); Mon, 26 Apr 2021 13:09:24 -0700 (PDT)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Mon, 26 Apr 2021 11:50:44 +0200

> netdev maintainers, mind if I take this fix through my tree to Linus
> this week, or can you all get it to him before -rc1 through the
> networking tree?

I tossed this into net-next so Linus will see it later this week.

Thanks.
