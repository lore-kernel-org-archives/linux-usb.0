Return-Path: <SRS0=//eN=BB=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52DCFC433E2
	for <linux-usb@archiver.kernel.org>; Wed, 22 Jul 2020 08:09:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 287052077D
	for <linux-usb@archiver.kernel.org>; Wed, 22 Jul 2020 08:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1595405395;
	bh=emKiWWdF7XMGF/ezTrwLMUH0xdHbkRZyyTYMbK5vGGs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=zKY3W/oWTHR41D98I0Hv+jnnMXQi1k3F9debcywVeexnt07ejOtQbBVm9TImAAnrU
	 /b/r6d7jkiES6UpKycRc+79YYSvYu/uJgNcJyWAb/ds3DMM5CGuWF2Rp/jHv7dlOpH
	 3QGIfPFHgL8QSWeVGdWtwZCLUQp/P38yfoaOv8fQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728297AbgGVIJy (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 22 Jul 2020 04:09:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:57988 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726892AbgGVIJy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 22 Jul 2020 04:09:54 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8103420717;
        Wed, 22 Jul 2020 08:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595405394;
        bh=emKiWWdF7XMGF/ezTrwLMUH0xdHbkRZyyTYMbK5vGGs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Mq3bNYm2+tmlz8Vo6wbRPBub3Pib1QNtgU+GK1bIBVshzpia8S93ip0faFarYpqkJ
         C+6QSLyYBLcwNiIZ3hrdPqr+p32Cjwu9+jSDLP0p6xvFqe69Bk3rfoBv65Jw38vcKc
         nxIg9HMQGvtjSyNXa5BboDsi87C+BhcNSi4GIGw4=
Date:   Wed, 22 Jul 2020 10:09:59 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Christoph Hellwig <hch@lst.de>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: usbfs: stop using compat_alloc_user_space
Message-ID: <20200722080959.GA2800885@kroah.com>
References: <20200722073655.220011-1-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200722073655.220011-1-hch@lst.de>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 22, 2020 at 09:36:55AM +0200, Christoph Hellwig wrote:
> Just switch the low-level routines to take kernel structures, and do the
> conversion from the compat to the native structure on that.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/usb/core/devio.c | 126 +++++++++++++++++++++------------------
>  1 file changed, 69 insertions(+), 57 deletions(-)

No objection to this, but why?  Are you trying to get rid of
compat_alloc_user_space()?

And do you want me to take this through my tree, or do you need to take
it through yours?

thanks,

greg k-h
