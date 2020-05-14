Return-Path: <SRS0=M0dr=64=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0B39C433DF
	for <linux-usb@archiver.kernel.org>; Thu, 14 May 2020 14:05:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 877302070A
	for <linux-usb@archiver.kernel.org>; Thu, 14 May 2020 14:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1589465119;
	bh=vi7D8odpHPsw+TiNG785ugnhclCugZpc3lIMz6dW5tQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=zRRINADCzVt6ULSVGKUPC9+DKmCmjKarkmAkWUMg1muFi/dynWF915gPP8bh1VOLr
	 WU4QtVkVDGphqMgX+2Cdha71/TPF1jE50HeCsvKebmTtjIEQJrBneyw6fO/yxlw7//
	 b+OaROw7jmfuCYwxQYcL2eWexDgfZ4rD9QYSCNnA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726067AbgENOFS (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 14 May 2020 10:05:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:52320 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726037AbgENOFS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 14 May 2020 10:05:18 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F2CBF20671;
        Thu, 14 May 2020 14:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589465117;
        bh=vi7D8odpHPsw+TiNG785ugnhclCugZpc3lIMz6dW5tQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Dj/kGHb5sgxR/ZnDa93VjqDN51VZJcEt24DpUEBL6BMbqPsLs0PZ6N1sFsqgvI76E
         /BLEXqW7yODu+J1OTnTye14qNNCDcYYdkahLzJ7YAMhDSWMw5/3Rs+qqS2q4cCg2Ko
         uTla82i2aP/0UgSlcTibmY5Ge2xBWRKs5dri3Ai4=
Date:   Thu, 14 May 2020 16:05:15 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Christian Gromm <christian.gromm@microchip.com>
Cc:     driverdev-devel@linuxdriverproject.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/7] staging: most: usb: remove reference to USB error
 codes
Message-ID: <20200514140515.GD2581983@kroah.com>
References: <1589463989-30029-1-git-send-email-christian.gromm@microchip.com>
 <1589463989-30029-3-git-send-email-christian.gromm@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1589463989-30029-3-git-send-email-christian.gromm@microchip.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 14, 2020 at 03:46:24PM +0200, Christian Gromm wrote:
> This patch removes the reference to the driver API file for USB error
> codes.
> 
> Signed-off-by: Christian Gromm <christian.gromm@microchip.com>
> Reported-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  drivers/staging/most/usb/usb.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/staging/most/usb/usb.c b/drivers/staging/most/usb/usb.c
> index 85d4fa0..76963c0 100644
> --- a/drivers/staging/most/usb/usb.c
> +++ b/drivers/staging/most/usb/usb.c
> @@ -477,8 +477,6 @@ static void hdm_write_completion(struct urb *urb)
>   * controller use to indicate a transfer has failed because of device
>   * disconnect.  In the interval before the hub driver starts disconnect
>   * processing, devices may receive such fault reports for every request.
> - *
> - * See <https://www.kernel.org/doc/Documentation/driver-api/usb/error-codes.rst>

Remove the whole text above this as well, as that just duplicates what
is written here and isn't needed at all as we all "know" the different
values that urb status returns.

thanks,

greg k-h
