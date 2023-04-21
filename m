Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A4C2C77B71
	for <linux-usb@archiver.kernel.org>; Fri, 21 Apr 2023 14:59:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233062AbjDUO7r (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 21 Apr 2023 10:59:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231748AbjDUO7q (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 21 Apr 2023 10:59:46 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 26741E58
        for <linux-usb@vger.kernel.org>; Fri, 21 Apr 2023 07:59:42 -0700 (PDT)
Received: (qmail 546476 invoked by uid 1000); 21 Apr 2023 10:59:41 -0400
Date:   Fri, 21 Apr 2023 10:59:41 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Weitao Wang <WeitaoWang-oc@zhaoxin.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, tonywwang@zhaoxin.com,
        weitaowang@zhaoxin.com, stable@vger.kernel.org
Subject: Re: [PATCH v2] UHCI:adjust zhaoxin UHCI controllers OverCurrent bit
 value
Message-ID: <a55aa38d-0fbf-4a95-a2b2-40821815275f@rowland.harvard.edu>
References: <20230421174142.382602-1-WeitaoWang-oc@zhaoxin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230421174142.382602-1-WeitaoWang-oc@zhaoxin.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Apr 22, 2023 at 01:41:42AM +0800, Weitao Wang wrote:
> OverCurrent condition is not standardized in the UHCI spec.
> Zhaoxin UHCI controllers report OverCurrent bit active off.
> In order to handle OverCurrent condition correctly, the uhci-hcd
> driver needs to be told to expect the active-off behavior.
> 
> Suggested-by: Alan Stern <stern@rowland.harvard.edu>
> Cc: stable@vger.kernel.org
> Signed-off-by: Weitao Wang <WeitaoWang-oc@zhaoxin.com>
> ---
> v1->v2
>  - Modify the description of this patch.
>  - Let Zhaoxin and VIA share a common oc_low flag
> 
>  drivers/usb/host/uhci-pci.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/host/uhci-pci.c b/drivers/usb/host/uhci-pci.c
> index 3592f757fe05..034586911bb5 100644
> --- a/drivers/usb/host/uhci-pci.c
> +++ b/drivers/usb/host/uhci-pci.c
> @@ -119,11 +119,12 @@ static int uhci_pci_init(struct usb_hcd *hcd)
>  
>  	uhci->rh_numports = uhci_count_ports(hcd);
>  
> -	/* Intel controllers report the OverCurrent bit active on.
> -	 * VIA controllers report it active off, so we'll adjust the
> -	 * bit value.  (It's not standardized in the UHCI spec.)
> +	/* Intel controllers report the OverCurrent bit active on.  VIA
> +	 * and ZHAOXIN controllers report it active off, so we'll adjust
> +	 * the bit value.  (It's not standardized in the UHCI spec.)
>  	 */

The style we use now for multi-line comments is:

	/*
	 * Blah blah blah
	 * blah blah blah
	 */

> -	if (to_pci_dev(uhci_dev(uhci))->vendor == PCI_VENDOR_ID_VIA)
> +	if (to_pci_dev(uhci_dev(uhci))->vendor == PCI_VENDOR_ID_VIA ||
> +		to_pci_dev(uhci_dev(uhci))->vendor == PCI_VENDOR_ID_ZHAOXIN)

The indentation level of the continuation line should be different from 
the indentation of the statement below.  Otherwise it looks like the 
continuation line is part of the conditional block.

Alan Stern

>  		uhci->oc_low = 1;
>  
>  	/* HP's server management chip requires a longer port reset delay. */
> -- 
> 2.32.0
> 
