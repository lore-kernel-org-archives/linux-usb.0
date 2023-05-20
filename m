Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFE2DC77B7F
	for <linux-usb@archiver.kernel.org>; Sat, 20 May 2023 15:11:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231671AbjETPLW (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 20 May 2023 11:11:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229737AbjETPLU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 20 May 2023 11:11:20 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id C6779EE
        for <linux-usb@vger.kernel.org>; Sat, 20 May 2023 08:11:19 -0700 (PDT)
Received: (qmail 73797 invoked by uid 1000); 20 May 2023 11:11:19 -0400
Date:   Sat, 20 May 2023 11:11:19 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [bug report] USB: gadget: Fix obscure lockdep violation for
 udc_mutex
Message-ID: <63e14a1b-8539-4a6a-8e13-db8e3878e7ab@rowland.harvard.edu>
References: <683df726-4510-4a79-968a-b238e21c4346@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <683df726-4510-4a79-968a-b238e21c4346@kili.mountain>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, May 20, 2023 at 01:34:43PM +0300, Dan Carpenter wrote:
> Hello Alan Stern,
> 
> The patch 1016fc0c096c: "USB: gadget: Fix obscure lockdep violation
> for udc_mutex" from Aug 26, 2022, leads to the following Smatch
> static checker warning:
> 
> 	drivers/usb/gadget/udc/core.c:767 usb_gadget_disconnect()
> 	warn: sleeping in atomic context
> 
> drivers/usb/gadget/udc/core.c
>     757                  * Gadget will stay disconnected after activation.
>     758                  */
>     759                 gadget->connected = false;
>     760                 goto out;
>     761         }
>     762 
>     763         ret = gadget->ops->pullup(gadget, 0);
>     764         if (!ret)
>     765                 gadget->connected = 0;
>     766 
> --> 767         mutex_lock(&udc_lock);
>     768         if (gadget->udc->driver)
>     769                 gadget->udc->driver->disconnect(gadget);
>     770         mutex_unlock(&udc_lock);
>     771 
> 
> The call tree where we're holding a spinlock is:
> 
> max3420_vbus_handler() <- disables preempt
> -> usb_udc_vbus_handler()
>    -> usb_udc_connect_control()
>       -> usb_gadget_disconnect()

Indeed, I've been discussing this issue with Badhri Jagan Sridharan.  
See these threads for more information:

https://lore.kernel.org/linux-usb/20230517115955.1078339-1-badhri@google.com/#r
https://lore.kernel.org/linux-usb/20230519043041.1593578-1-badhri@google.com/#r

Alan Stern
