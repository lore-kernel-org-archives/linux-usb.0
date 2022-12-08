Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3556C3A5A7
	for <linux-usb@archiver.kernel.org>; Thu,  8 Dec 2022 15:35:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230219AbiLHPfp (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 8 Dec 2022 10:35:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbiLHPfT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Dec 2022 10:35:19 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71A5EA56F0
        for <linux-usb@vger.kernel.org>; Thu,  8 Dec 2022 07:33:32 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0EA6F61F79
        for <linux-usb@vger.kernel.org>; Thu,  8 Dec 2022 15:33:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C606C433C1;
        Thu,  8 Dec 2022 15:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1670513611;
        bh=BDjp1r842Ld5F99prp+AqGemor3KSzWK1mxTs1vCyLY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PCk50mjDG70Fe/fT1q/AZmWR+KH/gP70pnzFXOLedNjqc+k2OjeGGIy7ngDBLaII0
         8N/w5ze5yTTssVUnYSTM1cMZ9yL+QwABQN2Vkp5B11INfFAXz2qOPPhnuzh9S9GO/b
         NYydiMdhbwdRSRlieRRn5tu5LAbAefIFwA4F6J1Q=
Date:   Thu, 8 Dec 2022 16:33:28 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Daniel Scally <dan.scally@ideasonboard.com>
Cc:     linux-usb@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        mgr@pengutronix.de, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH 1/3] usb: gadget: uvc: Rename uvc_control_ep
Message-ID: <Y5IDyPevtLR5qDCb@kroah.com>
References: <20221205143758.1096914-1-dan.scally@ideasonboard.com>
 <20221205143758.1096914-2-dan.scally@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221205143758.1096914-2-dan.scally@ideasonboard.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Dec 05, 2022 at 02:37:56PM +0000, Daniel Scally wrote:
> The f_uvc code defines an endpoint named "uvc_control_ep" but it
> is configured with a non-zero endpoint address and has its
> bmAttributes flagged as USB_ENDPOINT_XFER_INT - this cannot be the
> VideoControl interface's control endpoint, as the default endpoint
> 0 is used for that purpose. This is instead the optional interrupt
> endpoint that can be contained by a VideoControl interface.
> 
> Rename the variables to make that clear.

Does userspace documentation also need to be updated to reflect this
change?

thanks,

greg k-h
