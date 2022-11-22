Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B286CC4332F
	for <linux-usb@archiver.kernel.org>; Tue, 22 Nov 2022 16:12:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232588AbiKVQMT (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 22 Nov 2022 11:12:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234218AbiKVQLn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Nov 2022 11:11:43 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52DF274CCC;
        Tue, 22 Nov 2022 08:11:15 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E3E366178F;
        Tue, 22 Nov 2022 16:11:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C329FC433C1;
        Tue, 22 Nov 2022 16:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1669133474;
        bh=DPfUUEf5SdwXXfpEimIcQW3ez7YNLIyDYM6dezIVTO0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=yT0ugN50zO2A7GurkeYlFNRMV1fYtBN7Nyr9gxlNYWXiGaMdmrf1vZ4taSzQ+JHbc
         iKW7RGp2U8pFq7EmcQZWqMId8vChXkt8JpMFEJfDwOnECjka0jHfRDo25fXTHAF7q6
         feBncb4W4CnrEiTMqzrBfGz3PzRz6iEGnhdyeB6A=
Date:   Tue, 22 Nov 2022 17:11:10 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Cc:     b-liu@ti.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, tony@atomide.com
Subject: Re: [PATCH] usb: musb: remove extra check in musb_gadget_vbus_draw
Message-ID: <Y3z0nvoyiHQZ3MnY@kroah.com>
References: <1668416387-24984-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1668416387-24984-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 14, 2022 at 10:59:47AM +0200, Ivaylo Dimitrov wrote:
> The check for musb->xceiv->set_power duplicates the check done in
> usb_phy_set_power(). Moreover, not calling usb_phy_set_power() results in
> current USB config max current not being propagated through usb_charger FW

What does "FW" mean here?

> 
> Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
> ---
>  drivers/usb/musb/musb_gadget.c | 2 --
>  1 file changed, 2 deletions(-)

And is this a bugfix?  If so, what commit id does it fix?  Should it go
to stable kernels?  What hardware was this tested on that this solved a
problem for?

Please fix this and send a v2.

thanks,

greg k-h
