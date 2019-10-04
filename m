Return-Path: <SRS0=WE58=X5=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C598C47404
	for <linux-usb@archiver.kernel.org>; Fri,  4 Oct 2019 12:11:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 410D621D81
	for <linux-usb@archiver.kernel.org>; Fri,  4 Oct 2019 12:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1570191076;
	bh=uNOW1jkBNFsKdxqhCbzixLFWEpQSBX4Fn02eZ/OGkSY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=iNbnZsB1coEFgqz/dcxEz4gDkwfPjBko00feDaHIEzrDsoaE4JYUf3QXhXEEYM5fS
	 V9gX0ciBTM3mHXQ74Kya2sIozPf9W7SFh9rNJ9G0za8KwsGIDTESsVB1mhgwmbtVBQ
	 pyWyUABn34hOa8fAybH1ZwEc6mphevmC+v5a736k=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729844AbfJDMLP (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 4 Oct 2019 08:11:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:46612 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727688AbfJDMLP (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 4 Oct 2019 08:11:15 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 85E5F2070B;
        Fri,  4 Oct 2019 12:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570191075;
        bh=uNOW1jkBNFsKdxqhCbzixLFWEpQSBX4Fn02eZ/OGkSY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=xm8Re10knYSoiIw89hDLJD8X7ojjAv+NAWuu7GKQPNVA8GRi03aCvKgylltUiKIkZ
         10Yy/ZNcUzn5FO1aGw8faSNB3Iob9ijugUolIPwn2BSii29N8p/WQ+azJoEDjCZ6ny
         deLUz6EhMNsX585a5FgBeRYeGEQviSCB7JZQr2Yw=
Date:   Fri, 4 Oct 2019 14:11:12 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     aliasgar.surti500@gmail.com
Cc:     b-liu@ti.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH] drivers: musb: removed unused status variable
Message-ID: <20191004121112.GA382033@kroah.com>
References: <20191002173913.12847-1-aliasgar.surti500@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191002173913.12847-1-aliasgar.surti500@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Oct 02, 2019 at 11:09:13PM +0530, aliasgar.surti500@gmail.com wrote:
> From: Aliasgar Surti <aliasgar.surti500@gmail.com>
> 
> Status variable is initialized and returned without updating it's value.
> Removed status variable and returned value directly.
> 
> Signed-off-by: Aliasgar Surti <aliasgar.surti500@gmail.com>
> ---
>  drivers/usb/musb/musb_gadget.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/musb/musb_gadget.c b/drivers/usb/musb/musb_gadget.c
> index ffe462a657b1..2cb31fc0cd60 100644
> --- a/drivers/usb/musb/musb_gadget.c
> +++ b/drivers/usb/musb/musb_gadget.c
> @@ -1085,7 +1085,6 @@ static int musb_gadget_disable(struct usb_ep *ep)
>  	u8		epnum;
>  	struct musb_ep	*musb_ep;
>  	void __iomem	*epio;
> -	int		status = 0;
>  
>  	musb_ep = to_musb_ep(ep);
>  	musb = musb_ep->musb;
> @@ -1118,7 +1117,7 @@ static int musb_gadget_disable(struct usb_ep *ep)
>  
>  	musb_dbg(musb, "%s", musb_ep->end_point.name);
>  
> -	return status;
> +	return 0;
>  }
>  
>  /*
> -- 
> 2.17.1
> 

Someone else sent this same patch 2 hours before you did, sorry :(
