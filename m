Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BECCC4361B
	for <linux-usb@archiver.kernel.org>; Thu, 10 Dec 2020 06:13:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 560EB23770
	for <linux-usb@archiver.kernel.org>; Thu, 10 Dec 2020 06:13:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733062AbgLJGNV (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 10 Dec 2020 01:13:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:45702 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730894AbgLJGNV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 10 Dec 2020 01:13:21 -0500
Date:   Thu, 10 Dec 2020 07:12:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1607580760;
        bh=TiHZAMbjTBaRiELh0z3ZLfW5HFrvHNV7sgm6yAtLliE=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=pWOwlLjnA+NedqwemeCHQBWiXMX7qPiArvKXw+ronfShOaU0OfU0iUwIkaN6LZcTm
         w0BsG8FbC7QB36AasiVREm6q+DvUmFi64Xr9Osldz7vQ6YyKT5Ci6myMW1YI8HqzVO
         Yd5/QvV9j4jNRSRSs3sDoOjbbIaxh4n21xLTLMKk=
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Souptick Joarder <jrdr.linux@gmail.com>
Cc:     pawell@cadence.com, peter.chen@nxp.com, rogerq@ti.com,
        a-govindraju@ti.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: cdns3: Fixed kernel test robot warning
Message-ID: <X9G8VDtkaM11m2Co@kroah.com>
References: <1607544952-4891-1-git-send-email-jrdr.linux@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1607544952-4891-1-git-send-email-jrdr.linux@gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Dec 10, 2020 at 01:45:52AM +0530, Souptick Joarder wrote:
> Kernel test robot throws below warning ->
> 
> In file included from drivers/usb/cdns3/core.c:23:
> >> drivers/usb/cdns3/host-export.h:27:51: warning: 'struct usb_hcd'
> >> declared inside parameter list will not be visible outside of this
> >> definition or declaration
>       27 | static inline int xhci_cdns3_suspend_quirk(struct usb_hcd
> *hcd)
>          |                                                   ^~~~~~~
> 
> This patch will silence it.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
> ---
>  drivers/usb/cdns3/host-export.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/cdns3/host-export.h b/drivers/usb/cdns3/host-export.h
> index fb8541b..c1259af 100644
> --- a/drivers/usb/cdns3/host-export.h
> +++ b/drivers/usb/cdns3/host-export.h
> @@ -24,7 +24,7 @@ static inline int cdns_host_init(struct cdns *cdns)
>  }
>  
>  static inline void cdns_host_exit(struct cdns *cdns) { }
> -static inline int xhci_cdns3_suspend_quirk(struct usb_hcd *hcd)
> +static int xhci_cdns3_suspend_quirk(struct usb_hcd *hcd)

That should not change anything for this warning, sorry.

