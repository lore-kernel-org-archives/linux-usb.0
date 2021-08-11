Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C849C4338F
	for <linux-usb@archiver.kernel.org>; Wed, 11 Aug 2021 06:40:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 423A460FA0
	for <linux-usb@archiver.kernel.org>; Wed, 11 Aug 2021 06:40:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234961AbhHKGka (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 11 Aug 2021 02:40:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:50948 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234935AbhHKGk3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 11 Aug 2021 02:40:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5AAEC60720;
        Wed, 11 Aug 2021 06:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1628664006;
        bh=M/EQATTNka7Ynj3+YG4nHYABF/2U53riW3CKegP6pj8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=o1LVOZI0etNtwl79m2Tttxsd1iT4M5sMeWejlqPEfU3Z0qU8/QRTAVWldjmfvb47W
         3y+w+5bK1jB9YFc7+q62OoeWnk+IAd9NbA4sNA+6G0lskTIg4C4sedvTSGEwIqRgAi
         XTsP9BwJ8aJYrn0Wq85G46Esg/PuG3z/jqwIrD1I=
Date:   Wed, 11 Aug 2021 08:40:03 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Slark Xiao <slark_xiao@163.com>
Cc:     johan@kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] This change aims to support Foxconn SDX55. In some
 scenario, we need to use this port to capture memory dump.
Message-ID: <YRNww/CJuvsHkKcH@kroah.com>
References: <20210811035309.7942-1-slark_xiao@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210811035309.7942-1-slark_xiao@163.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 11, 2021 at 11:53:09AM +0800, Slark Xiao wrote:
> Signed-off-by: Slark Xiao <slark_xiao@163.com>
> ---
>  drivers/usb/serial/qcserial.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/serial/qcserial.c b/drivers/usb/serial/qcserial.c
> index 83da8236e3c8..d8b58aea3c60 100644
> --- a/drivers/usb/serial/qcserial.c
> +++ b/drivers/usb/serial/qcserial.c
> @@ -111,6 +111,7 @@ static const struct usb_device_id id_table[] = {
>  	{USB_DEVICE(0x16d8, 0x8002)},	/* CMDTech Gobi 2000 Modem device (VU922) */
>  	{USB_DEVICE(0x05c6, 0x9204)},	/* Gobi 2000 QDL device */
>  	{USB_DEVICE(0x05c6, 0x9205)},	/* Gobi 2000 Modem device */
> +	{USB_DEVICE(0x05c6, 0x901d)},	/* Foxconn SDX55 QDL */
>  
>  	/* Gobi 3000 devices */
>  	{USB_DEVICE(0x03f0, 0x371d)},	/* HP un2430 Gobi 3000 QDL */
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

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/SubmittingPatches for what is needed in order to
  properly describe the change.

- You did not write a descriptive Subject: for the patch, allowing Greg,
  and everyone else, to know what this patch is all about.  Please read
  the section entitled "The canonical patch format" in the kernel file,
  Documentation/SubmittingPatches for what a proper Subject: line should
  look like.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
