Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D02A5C83F16
	for <linux-usb@archiver.kernel.org>; Mon, 28 Aug 2023 14:53:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232027AbjH1Ows (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 28 Aug 2023 10:52:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232332AbjH1Owk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Aug 2023 10:52:40 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 18E83191
        for <linux-usb@vger.kernel.org>; Mon, 28 Aug 2023 07:52:33 -0700 (PDT)
Received: (qmail 353038 invoked by uid 1000); 28 Aug 2023 10:52:32 -0400
Date:   Mon, 28 Aug 2023 10:52:32 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     andrey.konovalov@linux.dev
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Pawel Laszczak <pawell@cadence.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Minas Harutyunyan <hminas@synopsys.com>,
        Justin Chen <justin.chen@broadcom.com>,
        Al Cooper <alcooperx@gmail.com>,
        Herve Codina <herve.codina@bootlin.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] usb: gadgetfs: return USB_GADGET_DELAYED_STATUS from
 setup()
Message-ID: <24b69442-0e33-45d7-a4ed-8a8909d8c495@rowland.harvard.edu>
References: <5c2913d70556b03c9bb1893c6941e8ece04934b0.1693188390.git.andreyknvl@gmail.com>
 <35c01a524b2eb6c3f01bc08f16bdff2d72256a1f.1693188390.git.andreyknvl@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35c01a524b2eb6c3f01bc08f16bdff2d72256a1f.1693188390.git.andreyknvl@gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 28, 2023 at 04:10:32AM +0200, andrey.konovalov@linux.dev wrote:
> From: Andrey Konovalov <andreyknvl@gmail.com>
> 
> Return USB_GADGET_DELAYED_STATUS from the setup() callback for 0-length
> transfers as a workaround to stop some UDC drivers (e.g. dwc3) from
> automatically proceeding with the status stage.
> 
> This workaround should be removed once all UDC drivers are fixed to
> always delay the status stage until a response is queued to EP0.
> 
> Signed-off-by: Andrey Konovalov <andreyknvl@gmail.com>
> ---
>  drivers/usb/gadget/legacy/inode.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/legacy/inode.c b/drivers/usb/gadget/legacy/inode.c
> index 28249d0bf062..154bbf578ba2 100644
> --- a/drivers/usb/gadget/legacy/inode.c
> +++ b/drivers/usb/gadget/legacy/inode.c
> @@ -31,6 +31,7 @@
>  
>  #include <linux/usb/gadgetfs.h>
>  #include <linux/usb/gadget.h>
> +#include <linux/usb/composite.h>

Add:  /* for USB_GADGET_DELAYED_STATUS */

>  
>  
>  /*
> @@ -241,6 +242,7 @@ static DEFINE_MUTEX(sb_mutex);		/* Serialize superblock operations */
>  #define xprintk(d,level,fmt,args...) \
>  	printk(level "%s: " fmt , shortname , ## args)
>  
> +#undef DBG
>  #ifdef DEBUG
>  #define DBG(dev,fmt,args...) \
>  	xprintk(dev , KERN_DEBUG , fmt , ## args)
> @@ -256,8 +258,10 @@ static DEFINE_MUTEX(sb_mutex);		/* Serialize superblock operations */
>  	do { } while (0)
>  #endif /* DEBUG */
>  
> +#undef ERROR
>  #define ERROR(dev,fmt,args...) \
>  	xprintk(dev , KERN_ERR , fmt , ## args)
> +#undef INFO

Please move these #undef lines up, just after the new #include.  And 
add a comment explaining briefly why they are needed.

Aside from these changes,

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>
