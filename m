Return-Path: <SRS0=tIEv=SZ=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2E22C282DD
	for <linux-usb@archiver.kernel.org>; Tue, 23 Apr 2019 05:15:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9B9A521841
	for <linux-usb@archiver.kernel.org>; Tue, 23 Apr 2019 05:15:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726029AbfDWFPh (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 23 Apr 2019 01:15:37 -0400
Received: from shards.monkeyblade.net ([23.128.96.9]:59600 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725882AbfDWFPh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 Apr 2019 01:15:37 -0400
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::d71])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 22BB7108BD789;
        Mon, 22 Apr 2019 22:15:36 -0700 (PDT)
Date:   Mon, 22 Apr 2019 22:15:35 -0700 (PDT)
Message-Id: <20190422.221535.1229436130411690227.davem@davemloft.net>
To:     crag0715@gmail.com
Cc:     linux-usb@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, hayeswang@realtek.com,
        mario_limonciello@dell.com, crag.wang@dell.com, sjg@chromium.org,
        grundler@chromium.org, seanpaul@chromium.org, david.chen7@dell.com,
        kai.heng.feng@canonical.com, gustavo@embeddedor.com,
        charles.hyde@dell.corp-partner.google.com, bigeasy@linutronix.de,
        zhongjiang@huawei.com
Subject: Re: [PATCH v2 1/1] r8152: sync sa_family with the media type of
 network device
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20190422050344.24513-1-crag0715@gmail.com>
References: <20190422050344.24513-1-crag0715@gmail.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Mon, 22 Apr 2019 22:15:36 -0700 (PDT)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190423051535.uXaDPcHWqyfRZqYfpK9V2yDEhvk6EwlTSRPaYn8I8qY@z>

From: crag0715@gmail.com
Date: Mon, 22 Apr 2019 13:03:43 +0800

> From: "Crag.Wang" <crag.wang@dell.com>
> 
> Without this patch the socket address family sporadically gets wrong
> value ends up the dev_set_mac_address() fails to set the desired MAC
> address.
> 
> Signed-off-by: Crag.Wang <crag.wang@dell.com>

Applied to net-next with Fixes: tag added.
