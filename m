Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DA9AC2D0E4
	for <linux-usb@archiver.kernel.org>; Tue, 24 Nov 2020 07:24:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DC2EF20684
	for <linux-usb@archiver.kernel.org>; Tue, 24 Nov 2020 07:24:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="N533lIgj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730056AbgKXHXv (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 24 Nov 2020 02:23:51 -0500
Received: from mail.kernel.org ([198.145.29.99]:51818 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729614AbgKXHXu (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 24 Nov 2020 02:23:50 -0500
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B80F720679;
        Tue, 24 Nov 2020 07:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1606202630;
        bh=hGvjCXUrD2s4wdSYVX0JDuusUwGBrIWDOHYN8zVuzv8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=N533lIgjC0TkGs7IOqLrfv/v08xX5xYIetmohAEM+zPMCshpdpEs1R1ccVfwkCNZS
         qX38NB2JRe+AOg3tLwSX1LGU6WbMT4TVeVOSYCp1SJJEBm7PPSjnVEwZnFm9VK61Yx
         yd/lsmvhQSSfjoA3Lo//S0jlPTqzm2M45G1M8GKk=
Date:   Tue, 24 Nov 2020 08:24:58 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     min.guo@mediatek.com
Cc:     Bin Liu <b-liu@ti.com>, Alan Stern <stern@rowland.harvard.edu>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        chunfeng.yun@mediatek.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] usb: musb: remove unused variable 'devctl'
Message-ID: <X7y1SpiRE+CcBQIa@kroah.com>
References: <20201124063613.28796-1-min.guo@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201124063613.28796-1-min.guo@mediatek.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Nov 24, 2020 at 02:36:13PM +0800, min.guo@mediatek.com wrote:
> From: Min Guo <min.guo@mediatek.com>
> 
> Remove unused 'devctl' variable to fix compile warnings:
> 
>     drivers/usb/musb/musbhsdma.c: In function 'dma_controller_irq':
>     drivers/usb/musb/musbhsdma.c:324:8: warning: variable 'devctl' set
>     but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Min Guo <min.guo@mediatek.com>
> ---
> changes in v2
> suggested by Alan Stern:
> Add void before musb_read to indicate that the register MUSB_DEVCTL
> was intended to be read and discarded.
> ---
>  drivers/usb/musb/musbhsdma.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/musb/musbhsdma.c b/drivers/usb/musb/musbhsdma.c
> index 0aacfc8be5a1..f59a009c533e 100644
> --- a/drivers/usb/musb/musbhsdma.c
> +++ b/drivers/usb/musb/musbhsdma.c
> @@ -321,8 +321,6 @@ irqreturn_t dma_controller_irq(int irq, void *private_data)
>  				musb_channel->channel.status =
>  					MUSB_DMA_STATUS_BUS_ABORT;
>  			} else {
> -				u8 devctl;
> -
>  				addr = musb_read_hsdma_addr(mbase,
>  						bchannel);
>  				channel->actual_len = addr
> @@ -336,7 +334,7 @@ irqreturn_t dma_controller_irq(int irq, void *private_data)
>  						< musb_channel->len) ?
>  					"=> reconfig 0" : "=> complete");
>  
> -				devctl = musb_readb(mbase, MUSB_DEVCTL);
> +				(void)musb_readb(mbase, MUSB_DEVCTL);

Please put a comment here as to why the read is happening so that people
do not throw it away sometime in the future.

thanks,

greg k-h
