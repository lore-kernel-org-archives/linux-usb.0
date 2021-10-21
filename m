Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB4D7C433F5
	for <linux-usb@archiver.kernel.org>; Thu, 21 Oct 2021 19:22:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D5098611F2
	for <linux-usb@archiver.kernel.org>; Thu, 21 Oct 2021 19:22:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231738AbhJUTYQ (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 21 Oct 2021 15:24:16 -0400
Received: from netrider.rowland.org ([192.131.102.5]:47769 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S230020AbhJUTYP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 21 Oct 2021 15:24:15 -0400
Received: (qmail 1170639 invoked by uid 1000); 21 Oct 2021 15:21:58 -0400
Date:   Thu, 21 Oct 2021 15:21:58 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 04/10] usb: host: ehci-atmel: fix deferred probing
Message-ID: <20211021192158.GB1170019@rowland.harvard.edu>
References: <20211021191437.8737-1-s.shtylyov@omp.ru>
 <20211021191437.8737-5-s.shtylyov@omp.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211021191437.8737-5-s.shtylyov@omp.ru>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Oct 21, 2021 at 10:14:31PM +0300, Sergey Shtylyov wrote:
> The driver overrides the error codes (and also IRQ0) returned by
> platform_get_irq() to -ENODEV, so if it returns -EPROBE_DEFER, the driver
> will fail the probe permanently instead of the deferred probing. Switch to
> propagating the error codes upstream -- that means we have to explicitly
> filter out IRQ0 as bad since usb_add_hcd() doesn't quite like it... :-)
> 
> Fixes: 501c9c0802d9 ("USB: at91: Add USB EHCI driver for at91sam9g45 series")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> ---

For patches 4 - 9:

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/host/ehci-atmel.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/host/ehci-atmel.c b/drivers/usb/host/ehci-atmel.c
> index 05d41fd65f25..3f7c8ccc6d7f 100644
> --- a/drivers/usb/host/ehci-atmel.c
> +++ b/drivers/usb/host/ehci-atmel.c
> @@ -104,8 +104,12 @@ static int ehci_atmel_drv_probe(struct platform_device *pdev)
>  	pr_debug("Initializing Atmel-SoC USB Host Controller\n");
>  
>  	irq = platform_get_irq(pdev, 0);
> -	if (irq <= 0) {
> -		retval = -ENODEV;
> +	if (irq < 0) {
> +		retval = irq;
> +		goto fail_create_hcd;
> +	}
> +	if (!irq) {
> +		retval = -EINVAL;
>  		goto fail_create_hcd;
>  	}
>  
> -- 
> 2.26.3
> 
