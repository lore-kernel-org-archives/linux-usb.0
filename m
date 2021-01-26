Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42C53C4332D
	for <linux-usb@archiver.kernel.org>; Tue, 26 Jan 2021 22:52:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 06CBE20663
	for <linux-usb@archiver.kernel.org>; Tue, 26 Jan 2021 22:52:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730582AbhAZWvO (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 26 Jan 2021 17:51:14 -0500
Received: from mail.kernel.org ([198.145.29.99]:38964 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2392950AbhAZRkl (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 26 Jan 2021 12:40:41 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2929B22228;
        Tue, 26 Jan 2021 17:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1611682800;
        bh=t5FEKloI/6KDyGm6sAJ0H3ldMzvUb5M0dXOLgYL8aOo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tHr9IRSqUdTQdutykeZAniX66EyqUCsXr+aKVV05pnC0QWOhwqhMM7FDCElq9cdFa
         UtNRv9YL+2rOEe/uy1emrn8XfqjDwL8SM6GUvQPDryiM4+iSja7S2Mqk/dj28u0pee
         EszTIIe1KNAJEEEJdqKz1Mk9Tzv9wj4dkfScFz1Q=
Date:   Tue, 26 Jan 2021 18:39:58 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Zou Wei <zou_wei@huawei.com>
Cc:     balbi@kernel.org, joel@jms.id.au, andrew@aj.id.au,
        benh@kernel.crashing.org, sashal@kernel.org, rentao.bupt@gmail.com,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] usb: gadget: Remove unused including
 <linux/version.h>
Message-ID: <YBBT7gNiKGmM4jjD@kroah.com>
References: <1611578492-43121-1-git-send-email-zou_wei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1611578492-43121-1-git-send-email-zou_wei@huawei.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jan 25, 2021 at 08:41:32PM +0800, Zou Wei wrote:
> Fix the following versioncheck warning:
> 
> drivers/usb/gadget/udc/aspeed-vhub/hub.c:33:1: unused including <linux/version.h>
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zou Wei <zou_wei@huawei.com>
> ---
>  drivers/usb/gadget/udc/aspeed-vhub/hub.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/udc/aspeed-vhub/hub.c b/drivers/usb/gadget/udc/aspeed-vhub/hub.c
> index 396a7d8..b192d57 100644
> --- a/drivers/usb/gadget/udc/aspeed-vhub/hub.c
> +++ b/drivers/usb/gadget/udc/aspeed-vhub/hub.c
> @@ -30,7 +30,6 @@
>  #include <linux/regmap.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/bcd.h>
> -#include <linux/version.h>
>  #include <linux/usb.h>
>  #include <linux/usb/hcd.h>

You didn't test this patch either :(

Your script is not correct...

greg k-h
