Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EB9EC38A2D
	for <linux-usb@archiver.kernel.org>; Tue, 25 Oct 2022 07:39:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231865AbiJYHjN (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 25 Oct 2022 03:39:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231917AbiJYHjB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Oct 2022 03:39:01 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74FF4143A59;
        Tue, 25 Oct 2022 00:38:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7FF2A617AE;
        Tue, 25 Oct 2022 07:38:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97D26C4314B;
        Tue, 25 Oct 2022 07:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1666683535;
        bh=RqosCf/BhmAt5jmMkGgng+kBPtHT3kKyioYvrugSluM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Q+aAp3bi30UcqwKg/b/d/6YOPj2ZXOS8hqkWGXr4V6KFJZEEnUt0ieJ4MBy80uIfq
         2eR2JLevIpTdNv05uJ+59BTyhFvugMp24WZaQfShLw8nnLBdzi1uMiADUt5O0k2P13
         /0m7Kt2lGjzJQDkOhO8K35oCcc0MMTYAW8emRrt0=
Date:   Tue, 25 Oct 2022 09:39:48 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Joel Stanley <joel@jms.id.au>
Cc:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Neal Liu <neal_liu@aspeedtech.com>,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Add Ben as a reviewer for ASPEED UCD
Message-ID: <Y1eSxJE+0T68I5CW@kroah.com>
References: <20221025020856.744202-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221025020856.744202-1-joel@jms.id.au>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 25, 2022 at 12:38:56PM +1030, Joel Stanley wrote:
> He wrote the vhub driver and would like to be cc'd on patches.

You also added more files to the entry, but did not document that here
:(

> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  MAINTAINERS | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3bb30c0d1cb4..637beabc70f1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3232,12 +3232,15 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/media/aspeed-video.txt
>  F:	drivers/media/platform/aspeed/
>  
> -ASPEED USB UDC DRIVER
> +ASPEED USB UDC DRIVERS
>  M:	Neal Liu <neal_liu@aspeedtech.com>
> +R:	Benjamin Herrenschmidt <benh@kernel.crashing.org>

I would need Ben's ack before accepting this.

thanks,

greg k-h
