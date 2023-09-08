Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2B36EE57DA
	for <linux-usb@archiver.kernel.org>; Fri,  8 Sep 2023 07:15:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242440AbjIHHPF (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 8 Sep 2023 03:15:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230503AbjIHHPE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 8 Sep 2023 03:15:04 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5BF91BCB;
        Fri,  8 Sep 2023 00:15:00 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 132DCC433D9;
        Fri,  8 Sep 2023 07:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1694157300;
        bh=IZ47q+is+FwYQqUkK7ML06kda5TdpnlDQaP49BoFpMc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dmjKGyFVyjbh96WgEm3Zn86UgSacB1BrVwJlP0BcMJHZ/bEyc05feeisM3YFEN9p2
         EzT0wuwMmVJGTiuf8HLBQ2Gdc3XOO7hsW7wVT0q12CDjmhfKiU9YpmeDrxGsfNRdVa
         exIruX5qr8PngLdezhU7QFG/pm1RwlgwFTwFBz+c=
Date:   Fri, 8 Sep 2023 08:14:57 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Hayes Wang <hayeswang@realtek.com>
Cc:     kuba@kernel.org, davem@davemloft.net, netdev@vger.kernel.org,
        nic_swsd@realtek.com, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH net] r8152: check budget for r8152_poll()
Message-ID: <2023090823-fog-giddy-548d@gregkh>
References: <20230908070152.26484-422-nic_swsd@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230908070152.26484-422-nic_swsd@realtek.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Sep 08, 2023 at 03:01:52PM +0800, Hayes Wang wrote:
> According to the document of napi, there is no rx process when the
> budget is 0. Therefore, r8152_poll() has to return 0 directly when the
> budget is equal to 0.
> 
> Fixes: d2187f8e4454 ("r8152: divide the tx and rx bottom functions")
> Signed-off-by: Hayes Wang <hayeswang@realtek.com>
> ---
>  drivers/net/usb/r8152.c | 3 +++
>  1 file changed, 3 insertions(+)

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You have marked a patch with a "Fixes:" tag for a commit that is in an
  older released kernel, yet you do not have a cc: stable line in the
  signed-off-by area at all, which means that the patch will not be
  applied to any older kernel releases.  To properly fix this, please
  follow the documented rules in the
  Documetnation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
