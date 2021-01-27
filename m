Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC6C5C433E0
	for <linux-usb@archiver.kernel.org>; Wed, 27 Jan 2021 18:09:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7EFB764DA8
	for <linux-usb@archiver.kernel.org>; Wed, 27 Jan 2021 18:09:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344068AbhA0SJp (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 27 Jan 2021 13:09:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343941AbhA0SJm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 Jan 2021 13:09:42 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A163C061574;
        Wed, 27 Jan 2021 10:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=EHIvDmsj4Y5VIDXHlhxPxp3i77gwNlMY4UhYupe3QP4=; b=R0ugJu1h3eJyjepFBkG9U0K1fI
        hLpulWsoEYjLJxERx17/6nHHdf1+BAl5rcl5hbYtam/zjkDf+2ibErfFJEpC9AWp85qY9jUM12vYj
        YcM1UP36QYVdTjhcy3LyHFJ5GIzqfvw/qu+szVBtIsdOM1+o2u9B11ihHWZcDa1bp6az2S5DUWOQv
        aQ6oYmSIYL7sZ+MZLULvhebRM2Yzby+dfAWwHGQmwg1H3CmRX34QFOwxpa5XBNx0OFU6Oh/ErH+x+
        rrY2hCe4iTTtLc5+kM0sdrw6LNioErMN7a5z+1LjP88Z1eXWri352iN7nEfMt9lP0sl7tn8HuRWJP
        4vMuYV0Q==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1l4pFE-007Kc7-QW; Wed, 27 Jan 2021 18:08:47 +0000
Date:   Wed, 27 Jan 2021 18:08:44 +0000
From:   Christoph Hellwig <hch@infradead.org>
To:     Ray Chi <raychi@google.com>
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        kyletso@google.com
Subject: Re: [PATCH] usb: dwc3: add EXPORT_SYMBOL_GPL for role init functions
Message-ID: <20210127180844.GA1747134@infradead.org>
References: <20210126094913.180945-1-raychi@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210126094913.180945-1-raychi@google.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jan 26, 2021 at 05:49:13PM +0800, Ray Chi wrote:
> Currently, role init functions are used in dwc3 driver but
> can't be called from kernel modules.
>   dwc3_host_init
>   dwc3_host_exit
>   dwc3_gadget_init
>   dwc3_gadget_exit
>   dwc3_event_buffers_setup
>   dwc3_event_buffers_cleanup
> 
> If other kernel modules want to use these functions, it needs
> EXPORT_SYMBOL_GPL() to get compile pass.

What "other kernel modules" would want to use it an why?

Please specify that in your patch, and only resend it togethe with the
patches actually adding/modifying those modules.
