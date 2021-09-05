Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 653C2C433EF
	for <linux-usb@archiver.kernel.org>; Sun,  5 Sep 2021 16:27:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4464960F5E
	for <linux-usb@archiver.kernel.org>; Sun,  5 Sep 2021 16:27:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238075AbhIEQ22 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 5 Sep 2021 12:28:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:47124 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237752AbhIEQ22 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 5 Sep 2021 12:28:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9FEFD60F14;
        Sun,  5 Sep 2021 16:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1630859245;
        bh=I2WfJr/f0EIODv81jR2GhecxYbVgUkTsTda3m8szi4U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WmUqkn9B/f0/pkOahayiqwipZT8A4sd+WvFkHXLFFjUZtM7tkjoTOrbHDq8JWfm1W
         VIm2ecqYe+SOehv7OiRDyo5I9P2VlY2XzWqdMtMkVLkV1AqMXTkWfl+YjjEYPRSCPu
         lZX7ZAT0GkA5YILi2/3oJ9tE5IBeSHTV6Rt7bem8=
Date:   Sun, 5 Sep 2021 18:27:22 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Florian Faber <faber@faberman.de>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: core: Fix possible memleak in usb_add_gadget
Message-ID: <YTTv6u2FXTJFrSFx@kroah.com>
References: <311d64c6-f0e2-da42-5619-1efe46df0007@faberman.de>
 <YTTahtscWqQyY0CU@kroah.com>
 <dda401c9-2a0c-19a8-871e-28f1a903bcd4@faberman.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dda401c9-2a0c-19a8-871e-28f1a903bcd4@faberman.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Sep 05, 2021 at 05:16:36PM +0200, Florian Faber wrote:
> Greg,
> 
> On 9/5/21 4:56 PM, Greg KH wrote:
> > On Sat, Sep 04, 2021 at 05:34:29PM +0200, Florian Faber wrote:
> > > The memory for the udc structure allocated via kzalloc in line 1295 is not
> > > freed in the error handling code, leading to a memory leak in case of an
> > > error.
> > > 
> > > Singed-off-by: Florian Faber <faber@faberman.de>
> > > 
> > > ---
> > >   drivers/usb/gadget/udc/core.c | 2 ++
> > >   1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
> > > index 14fdf918ecfe..a1270a44855a 100644
> > > --- a/drivers/usb/gadget/udc/core.c
> > > +++ b/drivers/usb/gadget/udc/core.c
> > > @@ -1346,6 +1346,8 @@ int usb_add_gadget(struct usb_gadget *gadget)
> > > 
> > >    err_put_udc:
> > >   	put_device(&udc->dev);
> > > +	kfree(udc);
> > > +	gadget->udc = NULL;
> > > 
> > >    error:
> > >   	return ret;
> > > -- 
> > > 2.33.0
> > > 
> > > Flo
> > > -- 
> > > Machines can do the work, so people have time to think.
> > 
> > Did you test this?  I think you will find that you just caused a
> > use-after-free :(
> 
> Correct, please forget about this patch.
> 
> This 'leak' was found by Klocwork and seemed plausible at first oversight.
> Sorry for wasting your time and not checking it further.

What is "Klockwork"?  How can it miss the reference counted logic that
all drivers use in the kernel?

> > Please read the documentation for device_initialize() for why this is
> > not the correct thing to do here.
> 
> I know now :) It was a bit counter intuitive that two different methods are
> used for memory allocation and freeing.

The joy of reference counted stuff, sorry.

thanks,

greg k-h
