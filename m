Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8732C47095
	for <linux-usb@archiver.kernel.org>; Wed,  9 Jun 2021 09:11:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B4FF5611C9
	for <linux-usb@archiver.kernel.org>; Wed,  9 Jun 2021 09:11:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237965AbhFIJNb (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 9 Jun 2021 05:13:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:53580 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237949AbhFIJNZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 9 Jun 2021 05:13:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4116A6120F;
        Wed,  9 Jun 2021 09:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1623229884;
        bh=Av4p6YZul5jrtML6xM/8nh8RzHFeSoerRs4QnKy2pKM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=2UzPugfonhi+RlM/Nlhuskn4P4THLjqQ2CUXQVoBSkBFR+PIi+sL8L3ozrZN8J5q1
         gFLCVZgTDC+0xaSxBMyah1IKfE1CjOtP7LACB2Y5dG6hNqZHkaPMrqCM6Pu625FoIP
         ajxhwYAWyzKRWjv2DKeXfX07ISor+uY35eETKmaE=
Date:   Wed, 9 Jun 2021 11:11:22 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jason Wang <wangborong@cdjrlc.com>
Cc:     stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: ehci: do not initialise static variables
Message-ID: <YMCFun8cF/0FImBC@kroah.com>
References: <20210608120930.16483-1-wangborong@cdjrlc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210608120930.16483-1-wangborong@cdjrlc.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jun 08, 2021 at 08:09:30PM +0800, Jason Wang wrote:
> Global static variables dont need to be initialised manully.
> 
> Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
> ---
>  drivers/usb/host/ehci-hcd.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

This never showed up on lore.kernel.org for some reason.

Can you resend so it properly shows up?

thanks,

greg k-h
