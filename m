Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC5EAC433F5
	for <linux-usb@archiver.kernel.org>; Mon, 13 Sep 2021 11:39:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A386C61056
	for <linux-usb@archiver.kernel.org>; Mon, 13 Sep 2021 11:39:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237978AbhIMLkt (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 13 Sep 2021 07:40:49 -0400
Received: from mail.thorsis.com ([92.198.35.195]:40947 "EHLO mail.thorsis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234635AbhIMLks (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 13 Sep 2021 07:40:48 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.thorsis.com (Postfix) with ESMTP id 1B09BEB0;
        Mon, 13 Sep 2021 13:39:31 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
        by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id FWrQzF6qtVib; Mon, 13 Sep 2021 13:39:31 +0200 (CEST)
Received: by mail.thorsis.com (Postfix, from userid 109)
        id 132561FEE; Mon, 13 Sep 2021 13:39:28 +0200 (CEST)
From:   Alexander Dahl <ada@thorsis.com>
To:     cristian.birsan@microchip.com
Cc:     stern@rowland.harvard.edu, gregkh@linuxfoundation.org,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        ludovic.desroches@microchip.com, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] USB: host: ehci-atmel: Add support for HSIC phy
Date:   Mon, 13 Sep 2021 13:39:22 +0200
Message-ID: <2607416.cmL5XOGpRJ@ada>
In-Reply-To: <20210910163842.1596407-3-cristian.birsan@microchip.com>
References: <20210910163842.1596407-1-cristian.birsan@microchip.com> <20210910163842.1596407-3-cristian.birsan@microchip.com>
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Christian,

Am Freitag, 10. September 2021, 18:38:42 CEST schrieb 
cristian.birsan@microchip.com:
> From: Cristian Birsan <cristian.birsan@microchip.com>
> 
> Add support for USB Host High Speed Port HSIC phy.
> 
> Signed-off-by: Cristian Birsan <cristian.birsan@microchip.com>
> ---
>  drivers/usb/host/ehci-atmel.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/usb/host/ehci-atmel.c b/drivers/usb/host/ehci-atmel.c
> index e893467d659c..05d41fd65f25 100644
> --- a/drivers/usb/host/ehci-atmel.c
> +++ b/drivers/usb/host/ehci-atmel.c
> @@ -18,6 +18,8 @@
>  #include <linux/platform_device.h>
>  #include <linux/usb.h>
>  #include <linux/usb/hcd.h>
> +#include <linux/usb/phy.h>
> +#include <linux/usb/of.h>
> 
>  #include "ehci.h"
> 
> @@ -25,6 +27,9 @@
> 
>  static const char hcd_name[] = "ehci-atmel";
> 
> +#define EHCI_INSNREG(index)			((index) * 4 + 0x90)
> +#define EHCI_INSNREG08_HSIC_EN			BIT(2)
> +
>  /* interface and function clocks */
>  #define hcd_to_atmel_ehci_priv(h) \
>  	((struct atmel_ehci_priv *)hcd_to_ehci(h)->priv)
> @@ -154,6 +159,9 @@ static int ehci_atmel_drv_probe(struct platform_device
> *pdev) goto fail_add_hcd;
>  	device_wakeup_enable(hcd->self.controller);
> 
> +	if (of_usb_get_phy_mode(pdev->dev.of_node) == USBPHY_INTERFACE_MODE_HSIC)
> +		writel(EHCI_INSNREG08_HSIC_EN, hcd->regs + EHCI_INSNREG(8));
> +
>  	return retval;
> 
>  fail_add_hcd:

Tested-by: Alexander Dahl <ada@thorsis.com>

Greets
Alex



