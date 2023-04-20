Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B659DC77B72
	for <linux-usb@archiver.kernel.org>; Thu, 20 Apr 2023 08:05:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234303AbjDTIFz (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 20 Apr 2023 04:05:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233697AbjDTIFy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 Apr 2023 04:05:54 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 939C613E;
        Thu, 20 Apr 2023 01:05:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2FD7A645C8;
        Thu, 20 Apr 2023 08:05:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B640C433EF;
        Thu, 20 Apr 2023 08:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1681977951;
        bh=+qe60FxZ8S+AEFk5qkOdglqHYeXQSiB/ZLnG9r85jZU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vJyiMIBuG3fkJoXI39w2qRTLx5IQcOH27ELWkNr5bSIuY+sTdigfl+u++ulqEf9i2
         FeAyLzyQ1EajgMqHRUBVGq4lnlrAU2QqBuThZbeH9ycUjyN/Cl2FqSIIGP0ew/o4be
         AYZI0lZgdKPUla9/fSkhSfBc2u5G0msSMRmqWh5I=
Date:   Thu, 20 Apr 2023 10:05:44 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Weitao Wang <WeitaoWang-oc@zhaoxin.com>
Cc:     stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, tonywwang@zhaoxin.com,
        weitaowang@zhaoxin.com
Subject: Re: [PATCH] =?utf-8?B?VUhDSe+8mmFkanVz?= =?utf-8?Q?t?= zhaoxin UHCI
 controllers OverCurrent bit value
Message-ID: <ZEDyWC7GsbcEn7UK@kroah.com>
References: <20230420111445.5028-1-WeitaoWang-oc@zhaoxin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230420111445.5028-1-WeitaoWang-oc@zhaoxin.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Apr 20, 2023 at 07:14:45PM +0800, Weitao Wang wrote:
> Over Current condition is not standardized in the UHCI spec.
> Zhaoxin UHCI controllers report OverCurrent bit active off.
> Intel controllers report it active on, so we'll adjust the bit value.
> 
> Signed-off-by: Weitao Wang <WeitaoWang-oc@zhaoxin.com>

Note, your Subject: line has odd characters in it, can you rewrite it to
just use ascii?  I think it's the '：' character which should be ':',
right?

> ---
>  drivers/usb/host/uhci-pci.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/usb/host/uhci-pci.c b/drivers/usb/host/uhci-pci.c
> index 3592f757fe05..177e3c2aa287 100644
> --- a/drivers/usb/host/uhci-pci.c
> +++ b/drivers/usb/host/uhci-pci.c
> @@ -126,6 +126,10 @@ static int uhci_pci_init(struct usb_hcd *hcd)
>  	if (to_pci_dev(uhci_dev(uhci))->vendor == PCI_VENDOR_ID_VIA)
>  		uhci->oc_low = 1;
>  
> +	/* ZHAOXIN controllers report OverCurrent bit active off. */
> +	if (to_pci_dev(uhci_dev(uhci))->vendor == PCI_VENDOR_ID_ZHAOXIN)
> +		uhci->oc_low = 1;
> +

This should also go to the stable kernels, right?

But a new UHCI controller?  And this affects all of them?  And why is
Intel an issue here (as you mention in the changelog text)?

thanks,

greg k-h
