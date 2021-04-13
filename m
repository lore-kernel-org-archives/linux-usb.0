Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F32EC433B4
	for <linux-usb@archiver.kernel.org>; Tue, 13 Apr 2021 16:31:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8343760FF0
	for <linux-usb@archiver.kernel.org>; Tue, 13 Apr 2021 16:31:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243980AbhDMQb6 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 13 Apr 2021 12:31:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:49640 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242063AbhDMQby (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 13 Apr 2021 12:31:54 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E9D1160720;
        Tue, 13 Apr 2021 16:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618331494;
        bh=zJhxcN/RJxOOssx/cavt+PFsmMdQWb27PjnSMts/9VQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hxLnzxBXxXdRIbI2Mx8egmkuPIGDE4dJBVdkrCZRFTvbv5gfqm7Yk/tBQE9hqt/xc
         1rIXR/a3jefJycO2EAgxqqylaT51j3HwxjM0M9G3KwjShYTWcB55w6EilsP2NGpHTQ
         uowDTArvLEF8hmEgHVu7oJp+FoEnJaJkvsp1uXdOlt/+l7nlazhZlP1IgixHgewUgM
         PuQEiovR3QKl9itpIYazJWZjE7eGYPo7/vx12D4NkgmTrZYnC84A54+XVfNY//rzAp
         a/+jvFgu5zz5k6c9LBLrtRMn1BVw35XAW/uTsmvVw3qCrKfw3VuxW5QgKjEtH5jseG
         eMFrfoUQhVqJw==
Received: from johan by xi.lan with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1lWLwp-0008IB-VU; Tue, 13 Apr 2021 18:31:32 +0200
Date:   Tue, 13 Apr 2021 18:31:31 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH 00/10] USB: serial: clean up the ti drivers
Message-ID: <YHXHY5+55rrMzn/j@hovoldconsulting.com>
References: <20210412094738.944-1-johan@kernel.org>
 <YHQoHCp6/BUoyxDh@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YHQoHCp6/BUoyxDh@kroah.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Apr 12, 2021 at 12:59:40PM +0200, Greg Kroah-Hartman wrote:
> On Mon, Apr 12, 2021 at 11:47:28AM +0200, Johan Hovold wrote:
> > The io_ti and ti_usb_3410_5052 drivers are drivers for devices based on
> > the same TI chips and one appears to have been based on the other
> > judging from the code similarities.
> 
> All I had to work off of was a vendor-driver for the ti_usb_3410_5052
> codebase and trying to figure out what was common and what wasn't was
> pretty hard at the time.  Thanks for working on this cleanup now.

Ah, thanks. That explains the similarities.

> > This series clean up their implementations a bit by introducing
> > port-command helpers and fixing up some related style inconsistencies.
> > 
> > This is based on top of the recently posted closing-wait series.
> 
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

And thanks for reviewing both of these sets. Now applied.

Johan
