Return-Path: <SRS0=UxLj=5J=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7E81C4332B
	for <linux-usb@archiver.kernel.org>; Tue, 24 Mar 2020 10:20:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7E2DE208C3
	for <linux-usb@archiver.kernel.org>; Tue, 24 Mar 2020 10:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1585045218;
	bh=vkq8bxVgmL5gkdrkU259mQP5zA0sCQsY3ZJ+QeG3X/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=sTiuvf/J9aZ4r+Os2Ro/FSm9v+KToWjN6qHtaSy3ZkIjBTZmx8erSycwxQf9EZOtK
	 ogBz88JOXWd29EmoHN+yUyiplHN8SsXzWnkqLnB+79XKAmliSA1e0GInxM5fOreR3X
	 Eu0IphYYXanG7LG4pleMUfYMhcWOaT/ejx7h/6KE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727066AbgCXKUR (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 24 Mar 2020 06:20:17 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:34904 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726845AbgCXKUR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 Mar 2020 06:20:17 -0400
Received: by mail-lj1-f195.google.com with SMTP id k21so1883803ljh.2
        for <linux-usb@vger.kernel.org>; Tue, 24 Mar 2020 03:20:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ML2vnfwC1qL5HbhpJYQjypeKTtlZAFm6nk+RAiAX64c=;
        b=HTvjDCo/Bt8ekK/Ic7aaaRl6L2GFLoJ24E2Ka7ecIYjSywm38KNSIB9KWVAYNa4mcm
         iRKzJnkqCxwaZJZJYj9i9cz6WqYdPVZKgRZXFg4chpZkjaQtIsyK9aIoLekCuKrsCrXM
         HxiVCJBFzVC9B8nPEdGcfZ3kwwyqAuCymESrZzz15VtnTlVT8OfO05z26ptdHNlpL5O4
         Nhc6SZBYfqN0xlw/qOAOwH4dZff2qE1RL7RCI050qPECbo3r/TQFSeIFqHGLlpojdsC7
         T8pUIWUAKvOBKxMrmyxO8qE1P/EsNI8VY6fShqNEOTwLe4kzzzKjCjJ2yFcyaIMMs+tf
         3dsw==
X-Gm-Message-State: ANhLgQ163YhL6C6MVFyxrUFZ6LFIEZ+cGzoanapqXdzvrz6DMg6SfJz6
        fb8HdCuQs3LR22tAPaaF9l4=
X-Google-Smtp-Source: ADFU+vvoGdX2KJsik37I8Jk7Q9ZlO75Ti6WLEmg2WGWpHaKhtr4nTa5dJPpdz7GLgszs4LRv6iil7A==
X-Received: by 2002:a2e:a0d8:: with SMTP id f24mr3922081ljm.270.1585045215070;
        Tue, 24 Mar 2020 03:20:15 -0700 (PDT)
Received: from xi.terra (c-12aae455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.170.18])
        by smtp.gmail.com with ESMTPSA id t17sm9741082ljk.17.2020.03.24.03.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 03:20:13 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1jGgfD-0006Ts-3n; Tue, 24 Mar 2020 11:20:03 +0100
Date:   Tue, 24 Mar 2020 11:20:03 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Michael Hanselmann <public@hansmi.ch>
Cc:     linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>,
        Michael Dreher <michael@5dot1.de>,
        Jonathan Olds <jontio@i4free.co.nz>
Subject: Re: [PATCH 1/4] ch341: Name more registers
Message-ID: <20200324102003.GE5810@localhost>
References: <cover.1583520568.git.public@hansmi.ch>
 <7a9882c0c5deaa64dcd3199a2d892e9809e6cb8e.1583520568.git.public@hansmi.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7a9882c0c5deaa64dcd3199a2d892e9809e6cb8e.1583520568.git.public@hansmi.ch>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Mar 06, 2020 at 07:00:42PM +0000, Michael Hanselmann wrote:
> Add more #defines with register names.

Please be more specific (e.g. which registers are you naming). Update
the patch summary too.

> Signed-off-by: Michael Hanselmann <public@hansmi.ch>
> ---
>  drivers/usb/serial/ch341.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/serial/ch341.c b/drivers/usb/serial/ch341.c
> index c5ecdcd51ffc..518209072c50 100644
> --- a/drivers/usb/serial/ch341.c
> +++ b/drivers/usb/serial/ch341.c
> @@ -59,6 +59,8 @@
>  #define CH341_REQ_MODEM_CTRL   0xA4
>  
>  #define CH341_REG_BREAK        0x05
> +#define CH341_REG_PRESCALER    0x12
> +#define CH341_REG_DIVISOR      0x13
>  #define CH341_REG_LCR          0x18
>  #define CH341_NBREAK_BITS      0x01
>  
> @@ -221,6 +223,7 @@ static int ch341_get_divisor(speed_t speed)
>  static int ch341_set_baudrate_lcr(struct usb_device *dev,
>  				  struct ch341_private *priv, u8 lcr)
>  {
> +	uint16_t reg;

Use u16.

>  	int val;
>  	int r;
>  
> @@ -237,11 +240,15 @@ static int ch341_set_baudrate_lcr(struct usb_device *dev,
>  	 */
>  	val |= BIT(7);
>  
> -	r = ch341_control_out(dev, CH341_REQ_WRITE_REG, 0x1312, val);
> +	reg = ((uint16_t)CH341_REG_DIVISOR << 8) | CH341_REG_PRESCALER;

No need to cast.

> +
> +	r = ch341_control_out(dev, CH341_REQ_WRITE_REG, reg, val);
>  	if (r)
>  		return r;
>  
> -	r = ch341_control_out(dev, CH341_REQ_WRITE_REG, 0x2518, lcr);
> +	reg = ((uint16_t)0x2500) | CH341_REG_LCR;

Ditto, and please add a bit shift for consistency.

Hmm, but this is unrelated to the defines you are adding, and there are
other magic constants for registers in this driver. Perhaps drop this
bit or break it out in its own patch (rule of thumb: one logical change
per patch).

> +
> +	r = ch341_control_out(dev, CH341_REQ_WRITE_REG, reg, lcr);
>  	if (r)
>  		return r;

I'd also move this last in the series as it's more of a clean up or
documentation patch.

Johan
