Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A127C433F5
	for <linux-usb@archiver.kernel.org>; Thu, 19 May 2022 13:52:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236553AbiESNws (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 19 May 2022 09:52:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239137AbiESNuj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 19 May 2022 09:50:39 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 9803163AF
        for <linux-usb@vger.kernel.org>; Thu, 19 May 2022 06:50:13 -0700 (PDT)
Received: (qmail 223673 invoked by uid 1000); 19 May 2022 09:49:30 -0400
Date:   Thu, 19 May 2022 09:49:30 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Dmytro Bagrii <dimich.dmb@gmail.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: core: Call disconnect() only if it is provided by
 driver
Message-ID: <YoZK6vJnAe/QgHzX@rowland.harvard.edu>
References: <20220519132900.4392-1-dimich.dmb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220519132900.4392-1-dimich.dmb@gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 19, 2022 at 04:29:00PM +0300, Dmytro Bagrii wrote:
> A driver may use devres allocations. Disconnect handler is not needed in
> this case. Allow such driver to leave .disconnect field uninitialized in
> struct usb_driver instead of providing empty stub function.
> 
> Signed-off-by: Dmytro Bagrii <dimich.dmb@gmail.com>
> ---
>  drivers/usb/core/driver.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
> index 355ed33a2179..d7fe440b033c 100644
> --- a/drivers/usb/core/driver.c
> +++ b/drivers/usb/core/driver.c
> @@ -455,7 +455,8 @@ static int usb_unbind_interface(struct device *dev)
>  	if (!driver->soft_unbind || udev->state == USB_STATE_NOTATTACHED)
>  		usb_disable_interface(udev, intf, false);
>  
> -	driver->disconnect(intf);
> +	if (driver->disconnect)
> +		driver->disconnect(intf);
>  
>  	/* Free streams */
>  	for (i = 0, j = 0; i < intf->cur_altsetting->desc.bNumEndpoints; i++) {

I'm very dubious about this change.  Disconnect routines generally do 
more than just deallocation.

Can you point to any drivers that would actually benefit from this?

Alan Stern
