Return-Path: <SRS0=C/te=BE=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55234C433E0
	for <linux-usb@archiver.kernel.org>; Sat, 25 Jul 2020 09:48:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3391A206EB
	for <linux-usb@archiver.kernel.org>; Sat, 25 Jul 2020 09:48:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726593AbgGYJsB (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 25 Jul 2020 05:48:01 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:51025 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726572AbgGYJsB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 25 Jul 2020 05:48:01 -0400
Received: from classic (lns-bzn-39-82-255-60-242.adsl.proxad.net [82.255.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id BBB24200003;
        Sat, 25 Jul 2020 09:47:58 +0000 (UTC)
Message-ID: <79778428c21e3740a0e6c26758217eca6d95196b.camel@hadess.net>
Subject: Re: [PATCH 2/3] USB: Also check for ->match
From:   Bastien Nocera <hadess@hadess.net>
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>
Date:   Sat, 25 Jul 2020 11:47:57 +0200
In-Reply-To: <4243455c-e000-3ca4-c583-0c829f2fbf86@gmail.com>
References: <25f9d978b791d25583b18f4b5d0a929e031fec1f.camel@hadess.net>
         <4243455c-e000-3ca4-c583-0c829f2fbf86@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, 2020-07-25 at 12:43 +0300, Sergei Shtylyov wrote:
> Hello!
> 
> On 25.07.2020 12:14, Bastien Nocera wrote:
> 
> > We only ever used a the ID table matching before, but we should
> > probably
> 
>    So "a" (actually "an") or "the"? :-)

"the" :)

I'll let the tree maintainer fixup the commit message if it's accepted
as-is.

> > also support an open-coded match function.
> > 
> > Fixes: 88b7381a939de ("USB: Select better matching USB drivers when
> > available")
> > Signed-off-by: Bastien Nocera <hadess@hadess.net>
> > ---
> >   drivers/usb/core/generic.c | 5 +++--
> >   1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/usb/core/generic.c
> > b/drivers/usb/core/generic.c
> > index b6f2d4b44754..2b2f1ab6e36a 100644
> > --- a/drivers/usb/core/generic.c
> > +++ b/drivers/usb/core/generic.c
> > @@ -205,8 +205,9 @@ static int __check_usb_generic(struct
> > device_driver *drv, void *data)
> >   	udrv = to_usb_device_driver(drv);
> >   	if (udrv == &usb_generic_driver)
> >   		return 0;
> > -
> > -	return usb_device_match_id(udev, udrv->id_table) != NULL;
> > +	if (usb_device_match_id(udev, udrv->id_table) != NULL)
> > +		return 1;
> > +	return (udrv->match && udrv->match(udev));
> 
>     Outer () not neccesary...

I find it clearer. Unless there's a style guide that disagrees, I'll
leave this as-is.

Cheers

