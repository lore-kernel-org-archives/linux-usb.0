Return-Path: <SRS0=7kPi=AO=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FF68C433DF
	for <linux-usb@archiver.kernel.org>; Fri,  3 Jul 2020 06:00:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5841D20B80
	for <linux-usb@archiver.kernel.org>; Fri,  3 Jul 2020 06:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1593756017;
	bh=jb1k2t/A58n2Lg2iYAhiCmXcNCldC/XPkQTzv20D0nI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=KH4TLyqo8EUV02NNxQiU1USc6zn5zEgH/fjSSfVgKfAe+Bftolq2Fr/NEYFYFVStj
	 i4F46MC3fMU8cq+BWWSVyKTelWZuD5VIPMvylEdX0oCUJAPmXZqjQaQiHIZGTmT2gf
	 ZDBajZMWYzZ+7Q0TwLsRxY/j0gg/q7MnxmsflJWo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725891AbgGCGAQ (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 3 Jul 2020 02:00:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:56390 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725648AbgGCGAQ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 3 Jul 2020 02:00:16 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A465D20724;
        Fri,  3 Jul 2020 06:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593756016;
        bh=jb1k2t/A58n2Lg2iYAhiCmXcNCldC/XPkQTzv20D0nI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=xrJp/gWdBAXeqA0VHBNIX4s3/AznVxZ5YqfqW0EjGqbBIvQmwaHpyjnTsclznsSs1
         l7h8dcTEj/ckDyBkJ+R89QhIzca33tMB2jXfwe2koX1/bWnAsuhWGjsQ5y8GAND7Y0
         pDia8z6w97XRqPeV1QCOT9QBNLZ9caQkZSqf+8Qw=
Date:   Fri, 3 Jul 2020 08:00:13 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Chris Dickens <christopher.a.dickens@gmail.com>
Cc:     linux-usb <linux-usb@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>, andrzej.p@samsung.com
Subject: Re: gadget: Why do Microsoft OS descriptors need their own USB
 request?
Message-ID: <20200703060013.GA6188@kroah.com>
References: <CAL-1MmUi6OajEYNuP+OOEeekesZJjAGP-8VDSjGydXAMEFHhMA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL-1MmUi6OajEYNuP+OOEeekesZJjAGP-8VDSjGydXAMEFHhMA@mail.gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 02, 2020 at 05:11:11PM -0700, Chris Dickens wrote:
> Hi,
> 
> I've never understood it, so I figure I might as well just ask.  Why
> does the Microsoft OS descriptors support require the allocation of a
> separate USB request for the composite gadget device?  Both the
> default control request buffer and the "special" OS descriptors buffer
> are the same size (4KB) and use the same completion handler.  As far
> as I can tell there is nothing distinct between them.  There's only
> ever one outstanding USB request queued to ep0, so can the dedicated
> USB request be removed and just share the default one?  I'm happy to
> provide a patch, unless of course I've missed something.

Try it and see, I think it was needed for some reason, but look at git
history to be sure.

thanks,

greg k-h
