Return-Path: <SRS0=QQLj=Y7=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EADAC43331
	for <linux-usb@archiver.kernel.org>; Thu,  7 Nov 2019 15:01:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DCE4A21882
	for <linux-usb@archiver.kernel.org>; Thu,  7 Nov 2019 15:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573138904;
	bh=2JVcH5qeFuDIIW5zP8B/NsbGEFa1tUZ+rxgAoeNVm7U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=L6Z/opsDa2eYwr8+2ShFl0LMAG/346BJNF+Mbfk9ZTIKh+WhXNMxGDHu/QcCaC+gq
	 c6oNp1o73RiVTSgJGel6neqPqOA6gkrYr3LttrDxI6RmZbiHV477WUM7iLm0W94KKQ
	 b/iQugaCszmeRZzelVfQm4a0BYLGpbaGlGpREl3w=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729909AbfKGPBo (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 7 Nov 2019 10:01:44 -0500
Received: from mail.kernel.org ([198.145.29.99]:59040 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727142AbfKGPBo (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 7 Nov 2019 10:01:44 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B39172178F;
        Thu,  7 Nov 2019 15:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573138903;
        bh=2JVcH5qeFuDIIW5zP8B/NsbGEFa1tUZ+rxgAoeNVm7U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gy2k/bTio0Rm4d+60bdIzqiNcYLTgtGBdBOU28bfYiJb5DR/eALeQixnf2TSfCvXS
         cRKFDUz+VDTn6BUpDCrT/B88BNSMKE1I8jHZa598opei+h3fcyxCfvObK+QiIcn0fA
         RHjpzoZZzxPlBIW8h/Y5Z2owVIkNhqj7JZSxb0M4=
Date:   Thu, 7 Nov 2019 16:01:40 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     keithp@keithp.com, linux-usb@vger.kernel.org,
        Oliver Neukum <oneukum@suse.de>
Subject: Re: [PATCH] USB: chaoskey: fix error case of a timeout
Message-ID: <20191107150140.GA154021@kroah.com>
References: <20191107142856.16774-1-oneukum@suse.com>
 <20191107142856.16774-2-oneukum@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191107142856.16774-2-oneukum@suse.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Nov 07, 2019 at 03:28:56PM +0100, Oliver Neukum wrote:
> In case of a timeout or if a signal aborts a read
> communication with the device needs to be ended
> lest we overwrite an active URB the next time we
> do IO to the device, as the URB may still be active.
> 
> Signed-off-by: Oliver Neukum <oneukum@suse.de>
> ---
>  drivers/usb/misc/chaoskey.c | 24 +++++++++++++++++++++---
>  1 file changed, 21 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/misc/chaoskey.c b/drivers/usb/misc/chaoskey.c
> index 34e6cd6f40d3..87067c3d6109 100644
> --- a/drivers/usb/misc/chaoskey.c
> +++ b/drivers/usb/misc/chaoskey.c
> @@ -384,13 +384,17 @@ static int _chaoskey_fill(struct chaoskey *dev)
>  		!dev->reading,
>  		(started ? NAK_TIMEOUT : ALEA_FIRST_TIMEOUT) );
>  
> -	if (result < 0)
> +	if (result < 0) {
> +		usb_kill_urb(dev->urb);
>  		goto out;
> +	}
>  
> -	if (result == 0)
> +	if (result == 0) {
>  		result = -ETIMEDOUT;
> -	else
> +		usb_kill_urb(dev->urb);
> +	} else {
>  		result = dev->valid;
> +	}
>  out:
>  	/* Let the device go back to sleep eventually */
>  	usb_autopm_put_interface(dev->interface);
> @@ -526,7 +530,21 @@ static int chaoskey_suspend(struct usb_interface *interface,
>  
>  static int chaoskey_resume(struct usb_interface *interface)
>  {
> +	struct chaoskey *dev;
> +	struct usb_device *udev = interface_to_usbdev(interface);
> +
>  	usb_dbg(interface, "resume");
> +	dev = usb_get_intfdata(interface);
> +
> +	/*
> +	 * We may have lost power.
> +	 * In that case the device that needs a long time
> +	 * for the first requests needs an extended timeout
> +	 * again
> +	 */
> +	if (le16_to_cpu(udev->descriptor.idVendor) == ALEA_VENDOR_ID)

What is this helping with?

> +		dev->reads_started = false;
> +
>  	return 0;
>  }
>  #else
> -- 
> 2.16.4
> 

Why send this twice?

And did this pass the syzbot testing?

thanks,

greg k-h
