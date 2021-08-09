Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2B2BC4338F
	for <linux-usb@archiver.kernel.org>; Mon,  9 Aug 2021 20:54:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8EC3D601FF
	for <linux-usb@archiver.kernel.org>; Mon,  9 Aug 2021 20:54:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236076AbhHIUzA (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 9 Aug 2021 16:55:00 -0400
Received: from netrider.rowland.org ([192.131.102.5]:60185 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S234454AbhHIUzA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Aug 2021 16:55:00 -0400
Received: (qmail 560371 invoked by uid 1000); 9 Aug 2021 16:54:38 -0400
Date:   Mon, 9 Aug 2021 16:54:38 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>
Subject: Re: [PATCH v2 5/9] usb: host: ohci-tmio: add IRQ check
Message-ID: <20210809205438.GA560062@rowland.harvard.edu>
References: <47bacc02-4e34-3208-779c-7072a6261782@omp.ru>
 <9bfa4edb-6852-d948-3f57-9c486e79a208@omp.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9bfa4edb-6852-d948-3f57-9c486e79a208@omp.ru>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 09, 2021 at 11:41:59PM +0300, Sergey Shtylyov wrote:
> The driver neglects to check the  result of platform_get_irq()'s call and
> blithely passes the negative error codes to usb_add_hcd() (which takes
> *unsigned* IRQ #), causing request_irq() that it calls to fail with
> -EINVAL, overriding an original error code. Stop calling usb_add_hcd()
> with the invalid IRQ #s.
> 
> Fixes: 78c73414f4f6 ("USB: ohci: add support for tmio-ohci cell")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> 
> ---
>  drivers/usb/host/ohci-tmio.c |    2 ++
>  1 file changed, 2 insertions(+)
> 
> Index: usb/drivers/usb/host/ohci-tmio.c
> ===================================================================
> --- usb.orig/drivers/usb/host/ohci-tmio.c
> +++ usb/drivers/usb/host/ohci-tmio.c
> @@ -242,6 +242,8 @@ static int ohci_hcd_tmio_drv_probe(struc
>  	if (ret < 0)
>  		goto err_enable;
>  
> +	if (irq < 0)
> +		goto err_enable;
>  	ret = usb_add_hcd(hcd, irq, 0);
>  	if (ret)
>  		goto err_add_hcd;

Surely this test should be placed near the start of the function, before 
the call to usb_create_hcd().  There's no point in doing all the extra 
work if the irq value is already invalid.

Alan Stern
