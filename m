Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7F6CC0015E
	for <linux-usb@archiver.kernel.org>; Fri, 28 Jul 2023 10:46:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234629AbjG1KqG (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 28 Jul 2023 06:46:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233660AbjG1KqE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 28 Jul 2023 06:46:04 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A1B1A0;
        Fri, 28 Jul 2023 03:46:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EA3F6620D9;
        Fri, 28 Jul 2023 10:46:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E91ADC433C7;
        Fri, 28 Jul 2023 10:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1690541162;
        bh=Aw9zQDUwmF8mcqYjQGFVNqVy+2g4jvxNOf80m5uLU30=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TafXzI+Aat/LZKgWiGZ9YJDetnYPd/hpYKMBSWEpGQln02GXg+GYn0rFEpP1r4tBF
         cRhbWEeytqWEQAKmXzdQ9PduXxkEUPg8JDIGSIXMuERr26N76IEZqZ1qF6vufkM6LI
         /mJ0vjJQCF6Mu1cHKvWHLxzWMuyWtMX7mUPabP4I=
Date:   Fri, 28 Jul 2023 12:45:59 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Surong Pang <surong.pang@unisoc.com>
Cc:     Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Orson.Zhai@unisoc.com,
        Zhiyong.liu@unisoc.com, Surong.Pang@gmail.com
Subject: Re: [PATCH] usb: dwc3: gadget: let pm runtime get/put paired
Message-ID: <2023072844-ceremony-lushness-c229@gregkh>
References: <20230728073919.6473-1-surong.pang@unisoc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230728073919.6473-1-surong.pang@unisoc.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jul 28, 2023 at 03:39:19PM +0800, Surong Pang wrote:
> Pm_runtime_get is called when setting pending_events to true.
> Pm_runtime_put is needed for pairing with pm_runtime_get.
> 
> Signed-off-by: Surong Pang <surong.pang@unisoc.com>
> ---
>  drivers/usb/dwc3/gadget.c | 1 +
>  1 file changed, 1 insertion(+)

What commit id does this fix?

thanks,

greg k-h
