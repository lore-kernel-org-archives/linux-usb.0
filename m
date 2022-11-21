Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECD0BC43217
	for <linux-usb@archiver.kernel.org>; Mon, 21 Nov 2022 15:21:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232334AbiKUPVi (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 21 Nov 2022 10:21:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232305AbiKUPVQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Nov 2022 10:21:16 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D423418B2F;
        Mon, 21 Nov 2022 07:19:40 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7F16CB810BD;
        Mon, 21 Nov 2022 15:19:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE4C9C433C1;
        Mon, 21 Nov 2022 15:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1669043978;
        bh=eVspgM7NdzFFPBjzEyUawslGXT3iBvw7V1jq6j3k2e4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Z1f2rKbs/QkoGO9uROiVipZDVD8s2OV2/kDoHYVzNtiz5wTzxNAw+62yTifpHyg29
         EIndvzMV6dVtKuYtSSdGIH5N0ph4FxioVWNUlWkUP+szK5vC0tmIhCFOMIvKDZRwh8
         Xv0Kc4wq6YWMGXN2Tefr47sUSR8SEOYeZs1liNjc=
Date:   Mon, 21 Nov 2022 16:19:34 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Santiago Ruano =?iso-8859-1?Q?Rinc=F3n?= 
        <santiago.ruano-rincon@imt-atlantique.fr>
Cc:     Oliver Neukum <oliver@neukum.org>, linux-usb@vger.kernel.org,
        netdev@vger.kernel.org
Subject: Re: [PATCH] net/cdc_ncm: Fix multicast RX support for CDC NCM
 devices with ZLP
Message-ID: <Y3uXBr2U4pWGU3mW@kroah.com>
References: <20221121131336.21494-1-santiago.ruano-rincon@imt-atlantique.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221121131336.21494-1-santiago.ruano-rincon@imt-atlantique.fr>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 21, 2022 at 02:13:37PM +0100, Santiago Ruano Rincón wrote:
> ZLP for DisplayLink ethernet devices was enabled in 6.0:
> 266c0190aee3 ("net/cdc_ncm: Enable ZLP for DisplayLink ethernet devices").
> The related driver_info should be the "same as cdc_ncm_info, but with
> FLAG_SEND_ZLP". However, set_rx_mode that enables handling multicast
> traffic was missing in the new cdc_ncm_zlp_info.
> 
> usbnet_cdc_update_filter rx mode was introduced in linux 5.9 with:
> e10dcb1b6ba7 ("net: cdc_ncm: hook into set_rx_mode to admit multicast
> traffic")
> 
> Without this hook, multicast, and then IPv6 SLAAC, is broken.
> 
> Fixes: 266c0190aee3 ("net/cdc_ncm: Enable ZLP for DisplayLink ethernet
> devices")

This needs to all be on one line.

> 

With no blank line here.

thanks,

greg k-h
