Return-Path: <SRS0=C/te=BE=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12780C433DF
	for <linux-usb@archiver.kernel.org>; Sat, 25 Jul 2020 14:47:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E958820674
	for <linux-usb@archiver.kernel.org>; Sat, 25 Jul 2020 14:46:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727828AbgGYOq7 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 25 Jul 2020 10:46:59 -0400
Received: from netrider.rowland.org ([192.131.102.5]:47425 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726652AbgGYOq7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 25 Jul 2020 10:46:59 -0400
Received: (qmail 1421312 invoked by uid 1000); 25 Jul 2020 10:46:58 -0400
Date:   Sat, 25 Jul 2020 10:46:58 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Bastien Nocera <hadess@hadess.net>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 1/3] USB: Simplify USB ID table match
Message-ID: <20200725144658.GA1421097@rowland.harvard.edu>
References: <616e0a918957ce9936478574a4856df742c20ad7.camel@hadess.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <616e0a918957ce9936478574a4856df742c20ad7.camel@hadess.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Jul 25, 2020 at 11:13:12AM +0200, Bastien Nocera wrote:
> usb_device_match_id() supports being passed NULL tables, so no need to
> check for it.
> 
> Signed-off-by: Bastien Nocera <hadess@hadess.net>
> ---
>  drivers/usb/core/generic.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/usb/core/generic.c b/drivers/usb/core/generic.c
> index 4626227a6dd2..b6f2d4b44754 100644
> --- a/drivers/usb/core/generic.c
> +++ b/drivers/usb/core/generic.c
> @@ -205,8 +205,6 @@ static int __check_usb_generic(struct device_driver *drv, void *data)
>  	udrv = to_usb_device_driver(drv);
>  	if (udrv == &usb_generic_driver)
>  		return 0;
> -	if (!udrv->id_table)
> -		return 0;
>  
>  	return usb_device_match_id(udev, udrv->id_table) != NULL;
>  }

Acked-by: Alan Stern <stern@rowland.harvard.edu>
