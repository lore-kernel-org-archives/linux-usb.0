Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7825C47078
	for <linux-usb@archiver.kernel.org>; Fri, 21 May 2021 14:39:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AA47061244
	for <linux-usb@archiver.kernel.org>; Fri, 21 May 2021 14:39:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233106AbhEUOk4 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 21 May 2021 10:40:56 -0400
Received: from netrider.rowland.org ([192.131.102.5]:46723 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S230239AbhEUOkx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 21 May 2021 10:40:53 -0400
Received: (qmail 1241031 invoked by uid 1000); 21 May 2021 10:39:29 -0400
Date:   Fri, 21 May 2021 10:39:29 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     "Geoffrey D. Bennett" <g@b4.vu>
Cc:     USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] USB: usbfs: remove double evaluation of usb_sndctrlpipe()
Message-ID: <20210521143929.GC1239965@rowland.harvard.edu>
References: <20210521125856.116349-1-g@b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210521125856.116349-1-g@b4.vu>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, May 21, 2021 at 10:28:56PM +0930, Geoffrey D. Bennett wrote:
> usb_sndctrlpipe() is evaluated in do_proc_control(), saved in a
> variable, then evaluated again. Use the saved variable instead, to
> match the use of usb_rcvctrlpipe().
> 
> Fixes: 4c6e8971cbe0 ("USB: make the "usbfs_snoop" log more pertinent")
> Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
> ---
>  drivers/usb/core/devio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
> index 533236366a03..4a8ec136460c 100644
> --- a/drivers/usb/core/devio.c
> +++ b/drivers/usb/core/devio.c
> @@ -1162,7 +1162,7 @@ static int do_proc_control(struct usb_dev_state *ps,
>  			tbuf, ctrl->wLength);
>  
>  		usb_unlock_device(dev);
> -		i = usb_control_msg(dev, usb_sndctrlpipe(dev, 0), ctrl->bRequest,
> +		i = usb_control_msg(dev, pipe, ctrl->bRequest,
>  				    ctrl->bRequestType, ctrl->wValue, ctrl->wIndex,
>  				    tbuf, ctrl->wLength, tmo);
>  		usb_lock_device(dev);

When you resubmit without the Fixes: tag, you can add:

Acked-by: Alan Stern <stern@rowland.harvard.edu>

Alan Stern
