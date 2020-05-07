Return-Path: <SRS0=qVei=6V=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DECE9C38A24
	for <linux-usb@archiver.kernel.org>; Thu,  7 May 2020 06:45:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BE8772078C
	for <linux-usb@archiver.kernel.org>; Thu,  7 May 2020 06:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1588833916;
	bh=tqjVJvTgkKsLjnMlFNwr1vnwK2nrbrSCJOG4WY/n4Ow=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=UOG37Ag4/fj4aLnIXgKXHbV9QzKt3Uv8+hUBv7bZ9fb+vsBBdHy2uInukGKKF91bD
	 8nLOTqLHuwq3z8v7JqEEmO/VPH/KVGQZe66+rYjyWjo3ADV2ywK/f+VaAoIT6hfVU8
	 NFGL5UNykdeDodgFtAGeWqAAqL4jgof4hEPB1anE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725953AbgEGGpN (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 7 May 2020 02:45:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:60740 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725763AbgEGGpN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 7 May 2020 02:45:13 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 34F802078C;
        Thu,  7 May 2020 06:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588833912;
        bh=tqjVJvTgkKsLjnMlFNwr1vnwK2nrbrSCJOG4WY/n4Ow=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bMpVumtdIQ+nfmBaFiOVyFXsnepy0M0Tpj0XL2ogpwhPBjwRBlVjp+sTCr9h9JGI2
         vaosUT+vI1CLqCIAvabfcP8A5A6HN8myuqC9Pr+4iAcYxxk14Mam9QvRYkcy1SPNSf
         qMkt+UFpl2ATZC6anMrR0iIvaMy4QkZZHec5UcDQ=
Date:   Thu, 7 May 2020 08:45:10 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc:     mathias.nyman@intel.com,
        "open list:USB XHCI DRIVER" <linux-usb@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] xhci: Make debug message consistent with bus and port
 number
Message-ID: <20200507064510.GA787064@kroah.com>
References: <20200507061755.13280-1-kai.heng.feng@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200507061755.13280-1-kai.heng.feng@canonical.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 07, 2020 at 02:17:55PM +0800, Kai-Heng Feng wrote:
> Current xhci debug message doesn't always output bus number, so it's
> hard to figure out it's from USB2 or USB3 root hub.
> 
> In addition to that, some port numbers are offset to 0 and others are
> offset to 1. Use the latter to match the USB core.
> 
> So use "bus number - port index + 1" to make debug message consistent.
> 
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> ---
>  drivers/usb/host/xhci-hub.c | 41 +++++++++++++++++++++----------------
>  1 file changed, 23 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
> index f37316d2c8fa..83088c262cc4 100644
> --- a/drivers/usb/host/xhci-hub.c
> +++ b/drivers/usb/host/xhci-hub.c
> @@ -1241,7 +1241,8 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
>  			temp = readl(ports[wIndex]->addr);
>  			/* Disable port */
>  			if (link_state == USB_SS_PORT_LS_SS_DISABLED) {
> -				xhci_dbg(xhci, "Disable port %d\n", wIndex);
> +				xhci_dbg(xhci, "Disable port %d-%d\n",
> +					 hcd->self.busnum, wIndex + 1);

Shouldn't xhci_dbg() show the bus number already?  If not, please fix
that up there instead of having to add it to all messages "by hand".

thanks,

greg k-h
