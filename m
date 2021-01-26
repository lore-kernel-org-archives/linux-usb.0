Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68FE6C433E0
	for <linux-usb@archiver.kernel.org>; Tue, 26 Jan 2021 15:28:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2D74D22D58
	for <linux-usb@archiver.kernel.org>; Tue, 26 Jan 2021 15:28:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406271AbhAZP2D (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 26 Jan 2021 10:28:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:42436 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2392290AbhAZP1X (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 26 Jan 2021 10:27:23 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2D28C22D58;
        Tue, 26 Jan 2021 15:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611674803;
        bh=w8mSdzw2vih+0TFqWZSIck7PWCi9bcM/xz0FN1eYr3U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rCGV/avioWinhQtovDeog1G705f64yQSpIb7iAvYZNpIetyCCBOZVTs3VWTGUZ7nf
         hHS41ea7skQwo7Mahx23PVE79mRd0UdfR7h73HPjToZO2DD/Ae5+Xf0DTl5FmeiWTO
         ACb/Ytg42CJneuvK8R9+xYsmtsM03n91fzuwsrIOGObGHkOAbX7asDhPFaPg84Daar
         R1GF9813AvMYeu1M+CA+bZzYLJUYdi0jqvEul9DptSVQ+uoPpQ3MAH3jxPY8MEkiOm
         /XNm49yANQeluC1KdJDgnzTPa6zapH1bCW1aAAXNeiwoQ+EuPipE2TVcYkRemsTpoa
         R/O0SotBLRCWA==
Received: from johan by xi.lan with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1l4QF2-0000kb-44; Tue, 26 Jan 2021 16:26:52 +0100
Date:   Tue, 26 Jan 2021 16:26:52 +0100
From:   Johan Hovold <johan@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 00/10] USB: serial: xr: fix up remaining issues in new
 driver
Message-ID: <YBA0vO06cBvoK3Hr@hovoldconsulting.com>
References: <20210121102922.17439-1-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210121102922.17439-1-johan@kernel.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jan 21, 2021 at 11:29:11AM +0100, Johan Hovold wrote:
> This series fixes the remaining issues in the new MaxLinear driver that
> were pointed out here:
> 
> 	https://lore.kernel.org/r/YAlVLOqzx8otPgOg@hovoldconsulting.com

> Johan Hovold (10):
>   USB: serial: xr: fix NULL-deref at probe
>   USB: serial: xr: fix interface leak at disconnect
>   USB: serial: xr: use subsystem usb_device at probe
>   USB: serial: xr: use termios flag helpers
>   USB: serial: xr: document vendor-request recipient
>   USB: serial: xr: clean up line-settings handling
>   USB: serial: xr: simplify line-speed logic
>   USB: serial: xr: fix gpio-mode handling
>   USB: serial: xr: fix pin configuration
>   USB: serial: xr: fix B0 handling
> 
>  drivers/usb/serial/xr_serial.c | 102 +++++++++++++++++++--------------
>  1 file changed, 59 insertions(+), 43 deletions(-)

I have applied these now.

Johan
