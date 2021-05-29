Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EA6DC4708E
	for <linux-usb@archiver.kernel.org>; Sat, 29 May 2021 12:12:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2D24C6117A
	for <linux-usb@archiver.kernel.org>; Sat, 29 May 2021 12:12:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbhE2MNj (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 29 May 2021 08:13:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:36254 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229602AbhE2MNR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 29 May 2021 08:13:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 511056113B;
        Sat, 29 May 2021 12:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1622290300;
        bh=a04XgNt8VBVT/mEJkohX1vjTZHsrsgHJ0yvL7oX6ALY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pfKUNmS3NWjQGuAoYFqtn6xQ0BHGkWc5/xNQ/uyzO1/AURAmoa1QUJ6RhWiCpHcwY
         6wPXMqcool5TBVCwARpLXfMJnTjg50ViCoZC7bkUz15L5FqEcvTdAzeGaP+E+8bNXF
         4jhBGJO04YPr6Lcj+ZvoSMPi3NLn9gOk4/Ad46+I=
Date:   Sat, 29 May 2021 14:11:36 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] USB: gadget: f_fs: Remove unneed cast in
 ffs_prepare_buffer()
Message-ID: <YLIveGTHK5RjxtS+@kroah.com>
References: <20210529120408.23456-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210529120408.23456-1-yuehaibing@huawei.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, May 29, 2021 at 08:04:08PM +0800, YueHaibing wrote:
> A coccicheck run provided information like the following.
> 
> ./drivers/usb/gadget/function/f_fs.c:3832:9-16:
>  WARNING: ERR_CAST can be used with data
> 
> ffs_prepare_buffer() should return an ERR_PTR() encoded error
> code on failure.

It does return such a pointer today, so this statement does not make
much sense :(

And is this a v2 patch?  What changed from the previous version?

thanks,

greg k-h
