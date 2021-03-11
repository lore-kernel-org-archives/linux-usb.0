Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D82EC433E0
	for <linux-usb@archiver.kernel.org>; Thu, 11 Mar 2021 13:16:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 258F664FDE
	for <linux-usb@archiver.kernel.org>; Thu, 11 Mar 2021 13:16:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233335AbhCKNP1 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 11 Mar 2021 08:15:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:37802 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233250AbhCKNPO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 11 Mar 2021 08:15:14 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3574564FE2;
        Thu, 11 Mar 2021 13:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1615468513;
        bh=3nAypL4y4htnJ/Vuee8wD9KExes2e0tPPHqhhiR3rzc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=M6ezm+T3dH+WiLyELzPZzvjAhIig6UHF32K2JKmR7u+YfHZdtLXm0VXUhfEbuEd4G
         yBcQh+yosiSeH2I/HvMT5c9PRtGspthEJAmyMsvgAlO04QWsKi8xKCQBLad8q8v6MA
         7n0K+t6Dw7B4P4gQYhL9ejlA22+2ufCcKm5MgHZ0=
Date:   Thu, 11 Mar 2021 14:15:10 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Elias Rudberg <mail@eliasrudberg.se>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: typec: Remove vdo[3] part of
 tps6598x_rx_identity_reg struct
Message-ID: <YEoX3i54VVHJ4155@kroah.com>
References: <20210311124710.6563-1-mail@eliasrudberg.se>
 <YEoVSRfVaGr6uxXe@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YEoVSRfVaGr6uxXe@kuha.fi.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Mar 11, 2021 at 03:04:09PM +0200, Heikki Krogerus wrote:
> Hi,
> 
> On Thu, Mar 11, 2021 at 01:47:10PM +0100, Elias Rudberg wrote:
> > Remove the unused "u32 vdo[3]" part in the tps6598x_rx_identity_reg
> > struct. This helps avoid "failed to register partner" errors which
> > happen when tps6598x_read_partner_identity() fails because the
> > amount of data read is 12 bytes smaller than the struct size.
> > Note that vdo[3] is already in usb_pd_identity and hence
> > shouldn't be added to tps6598x_rx_identity_reg as well.
> > 
> > Fixes: f6c56ca91b92 ("usb: typec: Add the Product Type VDOs to struct usb_pd_identity")
> > 
> > Signed-off-by: Elias Rudberg <mail@eliasrudberg.se>
> 
> This needs to go to the stable kernels as well. Please resend with the
> appropriate "Cc: stable@vger.kernel.org" tag. Please also include my
> reviewed-by tag:
> 
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

I can add the cc: stable when committting this, thanks.

greg k-h
