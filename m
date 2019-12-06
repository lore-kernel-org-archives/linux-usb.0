Return-Path: <SRS0=VKfj=Z4=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86FC6C43603
	for <linux-usb@archiver.kernel.org>; Fri,  6 Dec 2019 15:45:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5924224670
	for <linux-usb@archiver.kernel.org>; Fri,  6 Dec 2019 15:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1575647134;
	bh=Vih+CIKc2fyI3d8jYqKxGGBqXwrmsZGVAePzgq6IAiY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=rj7TKXaecOR2xoGBtEwpfbDhk1XRuk+JaPX2AWXT7+tOcwN8krTBVGRZDUF5WOzKS
	 8Hd7TfTjJN+ftcEIVviZNzEUgJykshaBFuNPkrcqs/KLgM+tqu4fB50P3P3mhutT1k
	 eW8bG9v8amb52Ve12jFfWC6dBytvtlRL6X7mIONk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726317AbfLFPpd (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 6 Dec 2019 10:45:33 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:38227 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726251AbfLFPpd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 Dec 2019 10:45:33 -0500
Received: by mail-lf1-f67.google.com with SMTP id r14so5627290lfm.5
        for <linux-usb@vger.kernel.org>; Fri, 06 Dec 2019 07:45:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yfzUwxqZXYIbqFUo+/IUg/BLCTKV6RQnxKAuIyPMcPw=;
        b=pMsz2cOjvmITfwlqWn5yh+26FZCOO3ojMZxoxD4vxRScDwEwbH13ajssrz6J8Ovyax
         B40cT7H9Vq5AMxGvTtC/JlXyv8f/lk7ZvNn5ocVGpH2PMd2vGO6jyBaYKypvXX7LeIgq
         tLgyi3qZOK03BQzb1voLPilXDMVVr0ORnlPP2o3zaXYsvvpNO8k1Vp+Mjy4fe+Ntg1+N
         +0/B9nWhA4Y8x0Oiv0OiOoZUm06sCHLobstg6V9SgSwiLhtx8Y2uK9InlYxzik9dF9Oe
         wiuM4Psro6yuGzxHKwungGlZOnqmEYA0/M+s2haevUQkHvyUBFCzOwIlbb+iQxRZznXH
         zlgQ==
X-Gm-Message-State: APjAAAWWW0mUiEm6DIabqdl6SYwuAKa78UDAikthUK66UgOhuWEOhaj4
        /OkhUE8u5NoosYXjZW1fFqY=
X-Google-Smtp-Source: APXvYqyh5FE8oHsX0l6Qr3QTZnyCg4g2rEeCTPTYFpQbzfnb9ktj/S/nBFO0iUh/aJUPfVi/ZZPaWg==
X-Received: by 2002:a19:e011:: with SMTP id x17mr7932009lfg.59.1575647131668;
        Fri, 06 Dec 2019 07:45:31 -0800 (PST)
Received: from xi.terra (c-14b8e655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.184.20])
        by smtp.gmail.com with ESMTPSA id u20sm6755900lju.34.2019.12.06.07.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2019 07:45:30 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1idFnV-00059c-0S; Fri, 06 Dec 2019 16:45:37 +0100
Date:   Fri, 6 Dec 2019 16:45:37 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Daniele Palmas <dnlplm@gmail.com>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH V2 1/1] usb: serial: option: add ZLP support for
 0x1bc7/0x9010
Message-ID: <20191206154537.GQ10631@localhost>
References: <20191206153732.2451-1-dnlplm@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191206153732.2451-1-dnlplm@gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Dec 06, 2019 at 04:37:32PM +0100, Daniele Palmas wrote:
> Telit FN980 flashing device 0x1bc7/0x9010 requires zero packet
> to be sent if out data size is equal to the endpoint max size.
> 
> Signed-off-by: Daniele Palmas <dnlplm@gmail.com>
> ---
> V2: removed transfer_length calculations

> diff --git a/drivers/usb/serial/usb-wwan.h b/drivers/usb/serial/usb-wwan.h
> index 1c120eaf4091..934e9361cf6b 100644
> --- a/drivers/usb/serial/usb-wwan.h
> +++ b/drivers/usb/serial/usb-wwan.h
> @@ -38,6 +38,7 @@ struct usb_wwan_intf_private {
>  	spinlock_t susp_lock;
>  	unsigned int suspended:1;
>  	unsigned int use_send_setup:1;
> +	unsigned int use_zlp:1;
>  	int in_flight;
>  	unsigned int open_ports;
>  	void *private;
> diff --git a/drivers/usb/serial/usb_wwan.c b/drivers/usb/serial/usb_wwan.c
> index 7e855c87e4f7..5e5a284a4ba3 100644
> --- a/drivers/usb/serial/usb_wwan.c
> +++ b/drivers/usb/serial/usb_wwan.c
> @@ -228,6 +228,8 @@ int usb_wwan_write(struct tty_struct *tty, struct usb_serial_port *port,
>  		} else {
>  			intfdata->in_flight++;
>  			spin_unlock_irqrestore(&intfdata->susp_lock, flags);
> +			if (intfdata->use_zlp)
> +				this_urb->transfer_flags |= URB_ZERO_PACKET;

Just set it once when allocating the URBs at port_probe.

>  			err = usb_submit_urb(this_urb, GFP_ATOMIC);
>  			if (err) {
>  				dev_err(&port->dev,

Johan
