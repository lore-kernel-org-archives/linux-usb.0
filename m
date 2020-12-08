Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7297EC4361B
	for <linux-usb@archiver.kernel.org>; Tue,  8 Dec 2020 09:38:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2DEB223A84
	for <linux-usb@archiver.kernel.org>; Tue,  8 Dec 2020 09:38:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727815AbgLHJiw (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 8 Dec 2020 04:38:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:44888 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727193AbgLHJiw (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 8 Dec 2020 04:38:52 -0500
Date:   Tue, 8 Dec 2020 10:39:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1607420291;
        bh=uXVXr8V5MoxbQwULnMEUI/UL4zWwl6hY2nFTRCM5Vwk=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=FFjqMOANQmdQgwTH5wi2E3nKB36STztUTednoAzpTzIoy5mxiGBZ0wY7PdDpdV91J
         U+m55eHHaWUq/k7MPou4W5iLOS59/Ynw11Rl6kixqGaIdteAp4f/tRgJzqXWwweyuY
         k0DAzSUcife/aO6anPrJ5d4hhygVPjGrKEIBhVpE=
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     linux-usb@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH 4/5] xhci-pci: Allow host runtime PM as default for Intel
 Maple Ridge xHCI
Message-ID: <X89JxxWX25kiUsdk@kroah.com>
References: <20201208092912.1773650-1-mathias.nyman@linux.intel.com>
 <20201208092912.1773650-5-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201208092912.1773650-5-mathias.nyman@linux.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Dec 08, 2020 at 11:29:11AM +0200, Mathias Nyman wrote:
> From: Mika Westerberg <mika.westerberg@linux.intel.com>
> 
> Intel Maple Ridge is successor of Titan Ridge Thunderbolt controller. As
> Titan Ridge this one also includes xHCI host controller. In order to
> safe energy we should put it to low power state by default when idle.
> For this reason allow host runtime PM for Maple Ridge.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> ---
>  drivers/usb/host/xhci-pci.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Should this be backported to stable kernels too?

thanks,

greg k-h
