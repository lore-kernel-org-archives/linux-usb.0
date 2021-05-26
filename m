Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_RED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A991FC47088
	for <linux-usb@archiver.kernel.org>; Wed, 26 May 2021 13:18:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7E97F613BA
	for <linux-usb@archiver.kernel.org>; Wed, 26 May 2021 13:18:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232829AbhEZNU1 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 26 May 2021 09:20:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231174AbhEZNU1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 May 2021 09:20:27 -0400
Received: from mail.bugwerft.de (mail.bugwerft.de [IPv6:2a03:6000:1011::59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 85BC9C061574
        for <linux-usb@vger.kernel.org>; Wed, 26 May 2021 06:18:55 -0700 (PDT)
Received: from [10.100.244.107] (unknown [176.126.217.202])
        by mail.bugwerft.de (Postfix) with ESMTPSA id 388A54CC777;
        Wed, 26 May 2021 13:18:51 +0000 (UTC)
Subject: Re: [PATCH 18/24] usb: gadget: udc: pxa27x_udc: Fix documentation for
 'pxa27x_udc_start()'
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org
References: <20210526130037.856068-1-lee.jones@linaro.org>
 <20210526130037.856068-19-lee.jones@linaro.org>
From:   Daniel Mack <daniel@zonque.org>
Message-ID: <e3dc3a08-ffab-e145-2777-34d310c20ef7@zonque.org>
Date:   Wed, 26 May 2021 15:18:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210526130037.856068-19-lee.jones@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 5/26/21 3:00 PM, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/usb/gadget/udc/pxa27x_udc.c:1749: warning: expecting prototype for pxa27x_start(). Prototype was for pxa27x_udc_start() instead
> 

Acked-by: Daniel Mack <daniel@zonque.org>


Thanks!


> Cc: Haojian Zhuang <haojian.zhuang@gmail.com>
> Cc: Robert Jarzmik <robert.jarzmik@free.fr>
> Cc: Felipe Balbi <balbi@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-usb@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/usb/gadget/udc/pxa27x_udc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/udc/pxa27x_udc.c b/drivers/usb/gadget/udc/pxa27x_udc.c
> index ce57961dfd2d6..b2759b04b8e94 100644
> --- a/drivers/usb/gadget/udc/pxa27x_udc.c
> +++ b/drivers/usb/gadget/udc/pxa27x_udc.c
> @@ -1730,7 +1730,7 @@ static void udc_enable(struct pxa_udc *udc)
>  }
>  
>  /**
> - * pxa27x_start - Register gadget driver
> + * pxa27x_udc_start - Register gadget driver
>   * @g: gadget
>   * @driver: gadget driver
>   *
> 

