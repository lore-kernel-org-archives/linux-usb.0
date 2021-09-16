Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C698C433F5
	for <linux-usb@archiver.kernel.org>; Thu, 16 Sep 2021 14:10:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6515061212
	for <linux-usb@archiver.kernel.org>; Thu, 16 Sep 2021 14:10:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238204AbhIPOLZ (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 16 Sep 2021 10:11:25 -0400
Received: from netrider.rowland.org ([192.131.102.5]:53373 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S238436AbhIPOLY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Sep 2021 10:11:24 -0400
Received: (qmail 232875 invoked by uid 1000); 16 Sep 2021 10:10:02 -0400
Date:   Thu, 16 Sep 2021 10:10:02 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org
Subject: Re: [PATCH v2] usb: host: ohci-tmio: check return value after
 calling platform_get_resource()
Message-ID: <20210916141002.GA232429@rowland.harvard.edu>
References: <20210916031317.2871282-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210916031317.2871282-1-yangyingliang@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Sep 16, 2021 at 11:13:17AM +0800, Yang Yingliang wrote:
> It will cause null-ptr-deref if platform_get_resource() returns NULL,
> we need check the return value.
> 
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/host/ohci-tmio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/ohci-tmio.c b/drivers/usb/host/ohci-tmio.c
> index 08ec2ab0d95a..3f3d62dc0674 100644
> --- a/drivers/usb/host/ohci-tmio.c
> +++ b/drivers/usb/host/ohci-tmio.c
> @@ -199,7 +199,7 @@ static int ohci_hcd_tmio_drv_probe(struct platform_device *dev)
>  	if (usb_disabled())
>  		return -ENODEV;
>  
> -	if (!cell)
> +	if (!cell || !regs || !config || !sram)
>  		return -EINVAL;
>  
>  	if (irq < 0)
> -- 
> 2.25.1
> 
