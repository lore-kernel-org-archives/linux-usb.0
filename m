Return-Path: <SRS0=OYMf=DJ=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E62C4C35257
	for <linux-usb@archiver.kernel.org>; Fri,  2 Oct 2020 22:21:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AD74A20738
	for <linux-usb@archiver.kernel.org>; Fri,  2 Oct 2020 22:21:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725764AbgJBWVm (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 2 Oct 2020 18:21:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725283AbgJBWVm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 2 Oct 2020 18:21:42 -0400
Received: from shards.monkeyblade.net (shards.monkeyblade.net [IPv6:2620:137:e000::1:9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B844AC0613D0;
        Fri,  2 Oct 2020 15:21:41 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 3865E11E47977;
        Fri,  2 Oct 2020 15:04:53 -0700 (PDT)
Date:   Fri, 02 Oct 2020 15:21:39 -0700 (PDT)
Message-Id: <20201002.152139.1938275765670177999.davem@davemloft.net>
To:     l.stelmach@samsung.com
Cc:     f.fainelli@gmail.com, steve.glendinning@shawell.net,
        UNGLinuxDriver@microchip.com, kuba@kernel.org,
        netdev@vger.kernel.org, linux-usb@vger.kernel.org,
        b.zolnierkie@samsung.com, m.szyprowski@samsung.com
Subject: Re: [PATCH] net/smscx5xx: change to of_get_mac_address()
 eth_platform_get_mac_address()
From:   David Miller <davem@davemloft.net>
In-Reply-To: <dleftj362xf54z.fsf%l.stelmach@samsung.com>
References: <6fad98ac-ff25-2954-8d62-85c39c16383c@gmail.com>
        <CGME20201002073950eucas1p24615a7f620afa1c1f9c0fc2e47daaef0@eucas1p2.samsung.com>
        <dleftj362xf54z.fsf%l.stelmach@samsung.com>
X-Mailer: Mew version 6.8 on Emacs 27.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [2620:137:e000::1:9]); Fri, 02 Oct 2020 15:04:53 -0700 (PDT)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Lukasz Stelmach <l.stelmach@samsung.com>
Date: Fri, 02 Oct 2020 09:39:40 +0200

> In both drivers the second to last line of the *_init_mac_address()[1][2]
> functions is
> 
>     eth_hw_addr_random(dev->net);

My bad, indeed it does take care of this already.

Applied to net-next, thanks.
