Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B0C5C433EF
	for <linux-usb@archiver.kernel.org>; Sun, 27 Feb 2022 07:00:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230043AbiB0HBO (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 27 Feb 2022 02:01:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbiB0HBN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 27 Feb 2022 02:01:13 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61A402BB35
        for <linux-usb@vger.kernel.org>; Sat, 26 Feb 2022 23:00:37 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7A39860915
        for <linux-usb@vger.kernel.org>; Sun, 27 Feb 2022 07:00:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82032C340E9;
        Sun, 27 Feb 2022 07:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1645945235;
        bh=SoYOmjuGEalZMbfn7wNUqFtPyQ3V4wXLiuoxYV1Y8WE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=g4ssHRISf7Xqazh/w0VAuZBtQ3+VfCJwi6aPeUw+rnPP/54pAfc0JiIwXHsTGV6dE
         1UM2nzdhLAGqhM03e28nIyCNum/kLE4ehHxR6BTUnExndUVAJhkQPDc9W2l8m5h2jI
         s542F89wNAmociUxYLdFcR+FmUibNZQawjMOtMd4=
Date:   Sun, 27 Feb 2022 08:00:31 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Felix Becker <linux.felixbecker2@gmx.de>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: serial: simple: add Nokia phone driver
Message-ID: <Yhshj29HdtsABnsU@kroah.com>
References: <20220224133109.10523-1-johan@kernel.org>
 <20220226185244.1080e666@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220226185244.1080e666@gmx.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Feb 26, 2022 at 06:52:44PM +0100, Felix Becker wrote:
> Dear Johan,
> dear people.
> 
> I see that this includes my email address publicly in a non-obfuscated
> form, and this is also available freely on the web at
> https://lore.kernel.org/r/20220208201506.6c65834d@gmx.de.
> 
> I do not want to have my Email address publicly available (e.g. against
> automated email address harvesting).
> 
> According to the GPDR, I want that you remove my email address from the
> patch before it is published somewhere on the web or/and in
> downloadable source code (if already done, I wish that it get's removed
> from everything published), and that you remove it from publicly
> accessible email list archives.
> 
> Please confirm back to me when you have done that, or please refer to
> me whom I should contact to get my email address removed.

When sending a message to a public mailing list, the GPDR does not come
into play, sorry.  There's nothing we can do here.

thanks,

greg k-h
