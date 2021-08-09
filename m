Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E93A2C4338F
	for <linux-usb@archiver.kernel.org>; Mon,  9 Aug 2021 10:08:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D2D9761078
	for <linux-usb@archiver.kernel.org>; Mon,  9 Aug 2021 10:08:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233618AbhHIKIq (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 9 Aug 2021 06:08:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:54172 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233514AbhHIKIp (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 9 Aug 2021 06:08:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 131DE6101D;
        Mon,  9 Aug 2021 10:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628503705;
        bh=wAbasrLWqtdXqVLY0pl1G5ydSmEuc+BxQs28J8KZVE8=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=AD92iTbZl99g8OCmHfAxOd6JDRzNJOnAShfhHnxawg8H59o4h361n0QBJlMqSKYDn
         ZKBiaUYcvOueeimhb6Mh1oMRr8cQi0etvx2oUZD3DybQ+m9BCxKTvM+ZrqnGxX2lss
         GFfktQmuUk0bowHouT9IU4b0Eyonn0rgxPG6uwPuFw1kZ8tAYdS62sIvBxoQhLo8Yw
         cyF5nrMszBtcO8cD8FslzQib8ipXO3B5eaTHdpb6T22uB2Z8Y1/EKpCxWrf2pZkmdP
         nC6ZPUTrqPh/lnYR4vS5gh7LUvRZN4bJGHS/5q1SSnKn/egNJfa8LbfQNs2IGkkRA2
         sb1ez7PeHh78Q==
References: <717ddd7c-22cd-d82c-e43d-80254718c801@omp.ru>
 <3ebcf6ee-4ca7-d7dc-6e04-62bc4f9e1ead@omp.ru>
User-agent: mu4e 1.6.2; emacs 27.2
From:   Felipe Balbi <balbi@kernel.org>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/9] usb: gadget: udc: at91: add IRQ check
Date:   Mon, 09 Aug 2021 13:07:39 +0300
In-reply-to: <3ebcf6ee-4ca7-d7dc-6e04-62bc4f9e1ead@omp.ru>
Message-ID: <8735rjkk16.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Sergey Shtylyov <s.shtylyov@omp.ru> writes:

> The driver neglects to check the result of platform_get_irq()'s call and
> blithely passes the negative error codes to devm_request_irq() (which takes
> *unsigned* IRQ #), causing it to fail with -EINVAL, overriding an original
> error code. Stop calling devm_request_irq() with the invalid IRQ #s.
>
> Fixes: 8b2e76687b39 ("USB: AT91 UDC updates, mostly power management")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
>
> ---
>  drivers/usb/gadget/udc/at91_udc.c |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> Index: usb/drivers/usb/gadget/udc/at91_udc.c
> ===================================================================
> --- usb.orig/drivers/usb/gadget/udc/at91_udc.c
> +++ usb/drivers/usb/gadget/udc/at91_udc.c
> @@ -1876,7 +1876,9 @@ static int at91udc_probe(struct platform
>  	clk_disable(udc->iclk);
>  
>  	/* request UDC and maybe VBUS irqs */
> -	udc->udp_irq = platform_get_irq(pdev, 0);
> +	udc->udp_irq = retval = platform_get_irq(pdev, 0);
> +	if (retval < 0)
> +		goto err_unprepare_iclk;

let's avoid multiple assignments in one line. How about:

	if (udc->udp_irq < 0) {
        	retval = udc->udp_irq;
                goto err_unprepare_iclk;
        }

-- 
balbi
