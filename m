Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B87F3C433EF
	for <linux-usb@archiver.kernel.org>; Tue, 21 Sep 2021 12:17:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 958A1610A0
	for <linux-usb@archiver.kernel.org>; Tue, 21 Sep 2021 12:17:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232624AbhIUMS4 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 21 Sep 2021 08:18:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:36432 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229984AbhIUMS4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 21 Sep 2021 08:18:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1416C610A0;
        Tue, 21 Sep 2021 12:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632226648;
        bh=bWsTDjni5u6mdvyJlAemtOiPqypgXEyovig5ApuWNOc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hhB1k93T+uA4csLp23S25X6hM8PNNkjgDb9ZiixWIjp56kg41K4emiNFAroYks1xZ
         nI27uB2RP2pNRfqH2isIJVNjSrkD6V+O+enucCB6L8Y+rjwBKW1yADymW5exl0137k
         gUAYJxDGfhxrAC5KN/R55n8pkdnAvahzcmOg6sAQmQTCZNSDglSp46/1J/wLw6JfuU
         8rMYrcnkbI2IJXH+uuMprLxyjBeitYzlN9JxTpoXvaNNZtcJCdsDMAl3AfDg2oxew1
         CEn0/bPNZ5yXyjkaw6WlnxV8pZe6Z2v/I9N2AManNjvX7V5R75ffQC8+03DaPbXd2C
         L0LwyHMMfC48A==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1mSeiE-0004tY-AS; Tue, 21 Sep 2021 14:17:27 +0200
Date:   Tue, 21 Sep 2021 14:17:26 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Himadri Pandya <himadrispandya@gmail.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/6] USB: serial: ftdi_sio: use usb_control_msg_recv()
Message-ID: <YUnNVupLrhPo0e4X@hovoldconsulting.com>
References: <20210801203122.3515-1-himadrispandya@gmail.com>
 <20210801203122.3515-5-himadrispandya@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210801203122.3515-5-himadrispandya@gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 02, 2021 at 02:01:20AM +0530, Himadri Pandya wrote:
> usb_control_msg_recv() nicely wraps usb_control_msg() and removes the
> compulsion of using dma buffers for usb messages. It also includes proper
> error check for possible short read. So use the wrapper and remove dma
> buffers from the callers.
> 
> Signed-off-by: Himadri Pandya <himadrispandya@gmail.com>
> ---
> Changes in v2:
>  - Drop unnecessary use of wrappers

Now applied, with a slightly amended commit message:

    USB: serial: ftdi_sio: use usb_control_msg_recv()
    
    usb_control_msg_recv() nicely wraps usb_control_msg() and removes the
    compulsion of using DMA buffers for USB messages. It also includes proper
    error check for possible short read. So use the wrapper where
    appropriate and remove DMA buffers from the callers.

Johan
