Return-Path: <SRS0=nhXQ=S5=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDF94C43219
	for <linux-usb@archiver.kernel.org>; Sat, 27 Apr 2019 07:02:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B5BD120693
	for <linux-usb@archiver.kernel.org>; Sat, 27 Apr 2019 07:02:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726049AbfD0HCV (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 27 Apr 2019 03:02:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:50172 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726001AbfD0HCV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 27 Apr 2019 03:02:21 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E6C9920656;
        Sat, 27 Apr 2019 07:02:19 +0000 (UTC)
Date:   Sat, 27 Apr 2019 09:02:17 +0200
From:   Greg KH <greg@kroah.com>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: serial: drop unused iflag macro
Message-ID: <20190427070217.GF28250@kroah.com>
References: <20190426060132.13584-1-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <20190426060132.13584-1-johan@kernel.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190427070217.CITkEnNmUJsJ2aFAG1BrCvQfsmEZGanxICAZjDR5Z00@z>

On Fri, Apr 26, 2019 at 08:01:32AM +0200, Johan Hovold wrote:
> Drop the RELEVANT_IFLAG() macro which essentially hasn't been used for
> over a decade except in some remnant debug printks that were recently
> removed.
> 
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>  include/linux/usb/serial.h | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/include/linux/usb/serial.h b/include/linux/usb/serial.h
> index 9d378826248b..1b631ea476ee 100644
> --- a/include/linux/usb/serial.h
> +++ b/include/linux/usb/serial.h
> @@ -23,9 +23,6 @@
>  /* The maximum number of ports one device can grab at once */
>  #define MAX_NUM_PORTS		16
>  
> -/* parity check flag */
> -#define RELEVANT_IFLAG(iflag)	(iflag & (IGNBRK|BRKINT|IGNPAR|PARMRK|INPCK))
> -
>  /* USB serial flags */
>  #define USB_SERIAL_WRITE_BUSY	0
>  #define USB_SERIAL_THROTTLED	1

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
