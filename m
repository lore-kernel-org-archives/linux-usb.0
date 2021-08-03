Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1732FC4338F
	for <linux-usb@archiver.kernel.org>; Tue,  3 Aug 2021 00:58:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E78AA60F9C
	for <linux-usb@archiver.kernel.org>; Tue,  3 Aug 2021 00:58:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233176AbhHCA6q (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 2 Aug 2021 20:58:46 -0400
Received: from netrider.rowland.org ([192.131.102.5]:46723 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S233050AbhHCA6p (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 2 Aug 2021 20:58:45 -0400
Received: (qmail 350320 invoked by uid 1000); 2 Aug 2021 20:58:34 -0400
Date:   Mon, 2 Aug 2021 20:58:34 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Salah Triki <salah.triki@gmail.com>
Cc:     Keith Packard <keithp@keithp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: misc: chaoskey: get lock before calling
 usb_[disable|enable]_autosuspend()
Message-ID: <20210803005834.GB349864@rowland.harvard.edu>
References: <20210802222205.GA1389315@pc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210802222205.GA1389315@pc>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 02, 2021 at 11:22:05PM +0100, Salah Triki wrote:
> Based on the documentation of usb_[disable|enable]_autosuspend(), the
> caller must hold udev's device lock.
> 
> Signed-off-by: Salah Triki <salah.triki@gmail.com>
> ---
>  drivers/usb/misc/chaoskey.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/misc/chaoskey.c b/drivers/usb/misc/chaoskey.c
> index 87067c3d6109..8af00be7b9e8 100644
> --- a/drivers/usb/misc/chaoskey.c
> +++ b/drivers/usb/misc/chaoskey.c
> @@ -206,7 +206,9 @@ static int chaoskey_probe(struct usb_interface *interface,
>  	if (!dev->hwrng_registered)
>  		usb_err(interface, "Unable to register with hwrng");
>  
> +	usb_lock_device(udev);
>  	usb_enable_autosuspend(udev);
> +	usb_unlock_device(udev);

Not needed (indeed, actively harmful).  When this code runs it already 
holds the device lock, because it is part of a probe routine.

Alan Stern
