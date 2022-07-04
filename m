Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71259C433EF
	for <linux-usb@archiver.kernel.org>; Mon,  4 Jul 2022 07:24:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231460AbiGDHY3 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 4 Jul 2022 03:24:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229656AbiGDHY2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 4 Jul 2022 03:24:28 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D022DB83;
        Mon,  4 Jul 2022 00:24:27 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 667E060FA6;
        Mon,  4 Jul 2022 07:24:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41033C3411E;
        Mon,  4 Jul 2022 07:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1656919466;
        bh=WRBaVx9bp/wO2munD1LYq0may6Q0kfaPIzzySbpN3yI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UaW2wnMS/uqOYGlvU3PLCB0EFaXY5J8w/tN4rD/jGxFVkPXiZj2gKu2LjA6MgAjPu
         8jaJlqSuhNG1QJc0zysG8JDFKraDO7oUZ/AP0F9G70L3jVVQgwZO9A5+tSNIVpr93m
         yZOs9jLfcfMeFXPxz2fI6H5lYzp/xa1qVr1I+acc=
Date:   Mon, 4 Jul 2022 09:24:23 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     =?utf-8?Q?=C5=81ukasz?= Spintzyk <lukasz.spintzyk@synaptics.com>
Cc:     netdev@vger.kernel.org, linux-usb@vger.kernel.org,
        oliver@neukum.org, kuba@kernel.org, ppd-posix@synaptics.com
Subject: Re: [PATCH 2/2] net/cdc_ncm: Increase NTB max RX/TX values to 64kb
Message-ID: <YsKVp2U3wzuSMxtQ@kroah.com>
References: <20220704070407.45618-1-lukasz.spintzyk@synaptics.com>
 <20220704070407.45618-3-lukasz.spintzyk@synaptics.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220704070407.45618-3-lukasz.spintzyk@synaptics.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jul 04, 2022 at 09:04:07AM +0200, Łukasz Spintzyk wrote:
> DisplayLink ethernet devices require NTB buffers larger then 32kb in order to run with highest performance.
> 
> Signed-off-by: Łukasz Spintzyk <lukasz.spintzyk@synaptics.com>
> ---
>  include/linux/usb/cdc_ncm.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/usb/cdc_ncm.h b/include/linux/usb/cdc_ncm.h
> index f7cb3ddce7fb..2d207cb4837d 100644
> --- a/include/linux/usb/cdc_ncm.h
> +++ b/include/linux/usb/cdc_ncm.h
> @@ -53,8 +53,8 @@
>  #define USB_CDC_NCM_NDP32_LENGTH_MIN		0x20
>  
>  /* Maximum NTB length */
> -#define	CDC_NCM_NTB_MAX_SIZE_TX			32768	/* bytes */
> -#define	CDC_NCM_NTB_MAX_SIZE_RX			32768	/* bytes */
> +#define	CDC_NCM_NTB_MAX_SIZE_TX			65536	/* bytes */
> +#define	CDC_NCM_NTB_MAX_SIZE_RX			65536	/* bytes */

Does this mess with the throughput of older devices that are not on
displaylink connections?

What devices did you test this on, and what is the actual performance
changes?  You offer no real information here at all, and large buffer
sizes does have other downsides, so determining how you tested this is
key.

Also, please wrap your changelogs at 72 columns like git asks you to do.

thanks,

greg k-h
