Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC910C43334
	for <linux-usb@archiver.kernel.org>; Fri,  1 Jul 2022 08:01:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235710AbiGAIBP (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 1 Jul 2022 04:01:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235373AbiGAIBO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 1 Jul 2022 04:01:14 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE0B46F35D
        for <linux-usb@vger.kernel.org>; Fri,  1 Jul 2022 01:01:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5BBA9616EB
        for <linux-usb@vger.kernel.org>; Fri,  1 Jul 2022 08:01:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EFEBC3411E;
        Fri,  1 Jul 2022 08:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1656662472;
        bh=TuUU1yJaeDk2y8dUgOcn4X6zugkarM6aCmZnLwn3EQA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qfSmOLuatO5D+wi2s4eg35tsA6JfTGdndIW2KYfNU7VGhzK/hGfFaOFDEa5wUemTn
         78E8LpLf73JcrfurY31yJ9zRhtqNP2z+1k9lKd0he0pkSLmApmtH1+ceP3n/p0yQcY
         WEwErDn7HvL1p+sXco1jpDiS54fv1L0vNUwGbd7Q=
Date:   Fri, 1 Jul 2022 10:01:10 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, balbi@kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] usb: dwc3: gadget: fix high-speed multiplier setting
Message-ID: <Yr6pxoV+SB/whAkF@kroah.com>
References: <20220630140216.185919-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220630140216.185919-1-m.grzeschik@pengutronix.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jun 30, 2022 at 04:02:16PM +0200, Michael Grzeschik wrote:
> For high-speed transfers the __dwc3_prepare_one_trb function is
> calculating the multiplier setting for the trb based on the length of
> the trb currently prepared. This assumption is wrong. For trbs with a
> sglist the length of the actual request has to be taken instead.
> 
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> ---

What commit id does this fix?

thanks,

greg k-h
