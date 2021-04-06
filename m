Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 171F8C433ED
	for <linux-usb@archiver.kernel.org>; Tue,  6 Apr 2021 05:26:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C8A4E613B8
	for <linux-usb@archiver.kernel.org>; Tue,  6 Apr 2021 05:26:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234255AbhDFF0g (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 6 Apr 2021 01:26:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:33134 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232874AbhDFF0g (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 6 Apr 2021 01:26:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3B57561246;
        Tue,  6 Apr 2021 05:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1617686788;
        bh=SmVeK0AzoGvnM/oVSClhxdFpdRkFXOYQtTI6gWclCvc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TXS6ap2HESrw9shecjMTxGQh5jxSPKvPO+smESiwctRKnpV6WpvNKWmq9PTc+mk/h
         nbGKTFYFDGNzK54Ul6+wmLHt3nq4UiWnJhtHAThCjhM6hbXgJtGy1kl149R1GHRDeq
         jqf9KKj1Hn0ZsLFZbObhdvHkgNv85iVxQGuQ4gU4=
Date:   Tue, 6 Apr 2021 07:26:26 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc:     balbi@kernel.org, joel@jms.id.au, andrew@aj.id.au,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: aspeed: Remove unnecessary version.h
 includes
Message-ID: <YGvxAmHIgnRMcyuq@kroah.com>
References: <1617681598-28165-1-git-send-email-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1617681598-28165-1-git-send-email-jiapeng.chong@linux.alibaba.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Apr 06, 2021 at 11:59:58AM +0800, Jiapeng Chong wrote:
> "make versioncheck" shows:
> 
> ./drivers/usb/gadget/udc/aspeed-vhub/hub.c: 33 linux/version.h not
> needed.

Then you need to fix the tool, and always test-build patches before you
send them out, as this is obviously wrong :(

