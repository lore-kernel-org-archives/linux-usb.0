Return-Path: <SRS0=02k9=EB=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24E79C4363A
	for <linux-usb@archiver.kernel.org>; Mon, 26 Oct 2020 12:00:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BF88C22281
	for <linux-usb@archiver.kernel.org>; Mon, 26 Oct 2020 12:00:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="U8/rNVm/";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="zXLUWzFT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1774600AbgJZMAI (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 26 Oct 2020 08:00:08 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:39504 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1768859AbgJZMAG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 26 Oct 2020 08:00:06 -0400
Date:   Mon, 26 Oct 2020 13:00:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1603713604;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Y0pqgjx4S6GWrhq/VAgdXIHvPYenVut2N2gBfaaZqZw=;
        b=U8/rNVm/z0IACXD2UU7LaiTki3sCbumu6U2jtBig1EUAIGYH2qsByotDR1tgcmN31C1fce
        lilr8bYHLG3I3tXCCCbTRMly1Bm+6omi72j3BNQI5qFEYNWvWwyhg2BrQJnqfVg8NEn6AM
        kJIXt6ZLEgFBZc3TAqSwF+thm7cRRRwu+sotND/cC7hz9DAz8wXDm0ETZrJeNMrUI60xfB
        ch/RgFLO/SwfYxMqhFK2Pr7mexguoiGG6Fypc4En8UVDQzYbjNV8ZIGNBw/tBaeGyDAVID
        nuKJ0HrkK7QQcTtY7KZ6FYN+JYwrm8o1U11XhsOJ5ZQ6Fp5XbJDQl3zlfGWIKw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1603713604;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Y0pqgjx4S6GWrhq/VAgdXIHvPYenVut2N2gBfaaZqZw=;
        b=zXLUWzFTm+ipT4zf63mooubl6hLLyztZ4zs07MRoM3bTgCH6vFd3ungwPU5e2Pd9u5YY8A
        Lk+CYKRGuAYa0YCQ==
From:   Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org,
        "Ahmed S . Darwish" <a.darwish@linutronix.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 11/14] USB: serial: keyspan_pda: clean up xircom/entrega
 support
Message-ID: <20201026120002.vl3htwmizmcvydn3@linutronix.de>
References: <20201025174600.27896-1-johan@kernel.org>
 <20201025174600.27896-12-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201025174600.27896-12-johan@kernel.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2020-10-25 18:45:57 [+0100], Johan Hovold wrote:
> Drop the separate Kconfig symbol for Xircom / Entrega and always include
> support in the keyspan_pda driver.
> 
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>  drivers/usb/serial/Kconfig       | 19 ++-------
>  drivers/usb/serial/Makefile      |  1 -
>  drivers/usb/serial/keyspan_pda.c | 68 +++++---------------------------
>  3 files changed, 13 insertions(+), 75 deletions(-)
> 
> diff --git a/drivers/usb/serial/Kconfig b/drivers/usb/serial/Kconfig
> index 4007fa25a8ff..a21ff5ab6df9 100644
> --- a/drivers/usb/serial/Kconfig
> +++ b/drivers/usb/serial/Kconfig
> @@ -538,17 +538,6 @@ config USB_SERIAL_CYBERJACK
>  
>  	  If unsure, say N.
>  
> -config USB_SERIAL_XIRCOM

Should this patch remove this symbol from defconfigs or does it happen
every now and then on its own? All of them select USB_SERIAL_KEYSPAN_PDA
so there is no loss.

> -	tristate "USB Xircom / Entrega Single Port Serial Driver"
> -	select USB_EZUSB_FX2
> -	help
> -	  Say Y here if you want to use a Xircom or Entrega single port USB to
> -	  serial converter device.  This driver makes use of firmware
> -	  developed from scratch by Brian Warner.
> -
> -	  To compile this driver as a module, choose M here: the
> -	  module will be called keyspan_pda.
> -
>  config USB_SERIAL_WWAN
>  	tristate
>  

Sebastian
