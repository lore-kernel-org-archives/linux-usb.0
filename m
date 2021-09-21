Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CDC1C433EF
	for <linux-usb@archiver.kernel.org>; Tue, 21 Sep 2021 14:32:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 647B360F9E
	for <linux-usb@archiver.kernel.org>; Tue, 21 Sep 2021 14:32:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233589AbhIUOeV (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 21 Sep 2021 10:34:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:60214 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229577AbhIUOeV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 21 Sep 2021 10:34:21 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5CCD260EC0;
        Tue, 21 Sep 2021 14:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1632234772;
        bh=zQxpb0Ck9L61Y91Q3j6IA0anwKfO4DPTphZBNgiEbQA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OkxYCVTG2+8/QUMCTFbzXjXBcPCtBlBtybCSTDRSFsx1Hg4AqW3cn8ERWJlzb/t+t
         XgSZ/WSCHInDySE+8lvkAPKcd3gQ/GpweqcEFSEXeSM/u3VAZkRWYSXvW+28nurZ7H
         BgoaOtxtee4AYvfs+6Q1fdtIP8LHG8h7v3R3d0CM=
Date:   Tue, 21 Sep 2021 16:32:43 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        stern@rowland.harvard.edu
Subject: Re: [PATCH v2] usb: host: ohci-tmio: check return value after
 calling platform_get_resource()
Message-ID: <YUntCyDOxif+DPxB@kroah.com>
References: <20210916031317.2871282-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210916031317.2871282-1-yangyingliang@huawei.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Sep 16, 2021 at 11:13:17AM +0800, Yang Yingliang wrote:
> It will cause null-ptr-deref if platform_get_resource() returns NULL,
> we need check the return value.
> 
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
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


Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/SubmittingPatches for what needs to be done
  here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
