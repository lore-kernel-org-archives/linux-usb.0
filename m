Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11CCBC433F5
	for <linux-usb@archiver.kernel.org>; Tue, 22 Mar 2022 14:37:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237087AbiCVOjN (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 22 Mar 2022 10:39:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235142AbiCVOjN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Mar 2022 10:39:13 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id ACD4C6AA52
        for <linux-usb@vger.kernel.org>; Tue, 22 Mar 2022 07:37:45 -0700 (PDT)
Received: (qmail 126093 invoked by uid 1000); 22 Mar 2022 10:37:44 -0400
Date:   Tue, 22 Mar 2022 10:37:44 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Jun Li <lijun.kernel@gmail.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [RFC PATCH 1/4] USB: gadget: Rename usb_gadget_probe_driver()
Message-ID: <YjnfOFFSjIlDhZUq@rowland.harvard.edu>
References: <YjeEbHL8ITkW692W@rowland.harvard.edu>
 <YjeEwspj0V3JaV1L@rowland.harvard.edu>
 <CAKgpwJUMXiPoLNNXzk2d=532fhfdWK0awopd0PPPg87kBi3=jg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKgpwJUMXiPoLNNXzk2d=532fhfdWK0awopd0PPPg87kBi3=jg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Mar 22, 2022 at 08:57:04PM +0800, Jun Li wrote:
> Alan Stern <stern@rowland.harvard.edu> 于2022年3月22日周二 06:57写道：
> >
> > In preparation for adding a "gadget" bus, this patch renames
> > usb_gadget_probe_driver() to usb_gadget_register_driver().  The new
> > name will be more accurate, since gadget drivers will be registered on
> > the gadget bus and the probing will be done by the driver core, not
> > the UDC core.
> >
> > Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> 
> Missed one rename change:
> diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
> index 1fb837d9271e..4141206bb0ed 100644
> --- a/drivers/usb/gadget/configfs.c
> +++ b/drivers/usb/gadget/configfs.c
> @@ -284,7 +284,7 @@ static ssize_t gadget_dev_desc_UDC_store(struct
> config_item *item,
>                         goto err;
>                 }
>                 gi->composite.gadget_driver.udc_name = name;
> -               ret = usb_gadget_probe_driver(&gi->composite.gadget_driver);
> +               ret = usb_gadget_register_driver(&gi->composite.gadget_driver);
>                 if (ret) {
>                         gi->composite.gadget_driver.udc_name = NULL;
>                         goto err;
> Li Jun

Ah, yes indeed; how careless of me.  Thanks for pointing this out.

Alan Stern
