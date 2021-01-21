Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E721C433E9
	for <linux-usb@archiver.kernel.org>; Thu, 21 Jan 2021 07:40:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E88782396D
	for <linux-usb@archiver.kernel.org>; Thu, 21 Jan 2021 07:40:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727463AbhAUHkZ (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 21 Jan 2021 02:40:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:44934 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727458AbhAUHkV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 21 Jan 2021 02:40:21 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1F6BB238EE;
        Thu, 21 Jan 2021 07:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1611214781;
        bh=Js9RTQ+Gp199tmwcbMTEOUZ8ivQeNI+zmjDA6dqjb1g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=yrzbtTfTY4WCk43ssvpGXnD1lQ4w/sLBZOdAunuAM4v8U0sU+77pln38X7jcwx6ru
         RlXrdYqYbLUtNkCDWeW8r4WFPykyGcg87jDZKbPQSyR/KZybtSMJdpT3rjK0l7cLtP
         tn5zyrn7qRK06UP1JdKSLF3mghdG9M0SdxlLt/ik=
Date:   Thu, 21 Jan 2021 08:39:37 +0100
From:   "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To:     Pho Tran <Pho.Tran@silabs.com>
Cc:     "johan@kernel.org" <johan@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Hung Nguyen <Hung.Nguyen@silabs.com>
Subject: Re: [PATCH v3] USB: serial: cp210x: Fix error 32 when hardware flow
 control  is enabled.
Message-ID: <YAkvua8BMkSh1QHs@kroah.com>
References: <9E531B87-06A8-45F0-A2A8-EC6FA61A99A7@silabs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9E531B87-06A8-45F0-A2A8-EC6FA61A99A7@silabs.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jan 21, 2021 at 07:09:13AM +0000, Pho Tran wrote:
> Fix error 32 returned by CP210X_SET_MHS when hardware flow control is enabled.
> 
> The root cause of error 32 is that user application (CoolTerm, linux-serial-test)
> opened cp210x device with hardware flow control then attempt to control RTS/DTR pins.
> In hardware flow control, RTS/DTR pins will be controlled by hardware only,
> any attempt to control those pins will cause error 32 from the device.
> This fix will block MHS command(command to control RTS/DTR pins) to the device
> if hardware flow control is being used.
> 
> Signed-off-by: Pho Tran <pho.tran@silabs.com>
> ---
> 01/19/2021: Patch v2  Modified based on comment from Johan Hovold <johan@kernel.org>
> and Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  drivers/usb/serial/cp210x.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/serial/cp210x.c b/drivers/usb/serial/cp210x.c
> index fbb10dfc56e3..5b6bbda2b424 100644
> --- a/drivers/usb/serial/cp210x.c
> +++ b/drivers/usb/serial/cp210x.c
> @@ -1204,7 +1204,12 @@ static int cp210x_tiocmset(struct tty_struct *tty,
>  		unsigned int set, unsigned int clear)
>  {
>  	struct usb_serial_port *port = tty->driver_data;
> -	return cp210x_tiocmset_port(port, set, clear);
> +	if (C_CRTSCTS(tty))
> +
> +	/* Don't send SET_MHS command if device in hardware flow control mode. */
> +		return 0;

That indentation and whitespace is very odd.  Did you run checkpatch.pl
on your change before sending it to us to verify that all is ok?

Please do so.

thanks,

greg k-h
