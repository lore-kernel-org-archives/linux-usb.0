Return-Path: <SRS0=7kPi=AO=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99963C433E0
	for <linux-usb@archiver.kernel.org>; Fri,  3 Jul 2020 07:24:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 73BE1208B8
	for <linux-usb@archiver.kernel.org>; Fri,  3 Jul 2020 07:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1593761073;
	bh=YBFT0hWGAMbBdnNnRUuj03yZyoC7B37PdhPl39F3tPk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=W8uR6/lHLlrSPCbehkzDurQx3jOWYh5HP19/T9ySEGaCm02PUFglA2Nz57HD+xuFf
	 o8ZpLZcBmEB0D7Lu03/fVBPHjSkOLdMW8eMBBILVYfuJ2RLt8XvmljRS7DgO9dUW20
	 LDigx2yQ6hznVkVdj3+xDgC313E8eT4Q+4hNN/Go=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726112AbgGCHYd (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 3 Jul 2020 03:24:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:56168 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725648AbgGCHYc (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 3 Jul 2020 03:24:32 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id ECFA320720;
        Fri,  3 Jul 2020 07:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593761072;
        bh=YBFT0hWGAMbBdnNnRUuj03yZyoC7B37PdhPl39F3tPk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YAABfR7r7QIrICSbxoHiHx3Cfz4MHzb10GCKjHOa5xr5O6QYcbI4SaklYKufBgtEV
         DMXzuEirtYE2a7+axSoAfLPtqKTloG5HXSAGfdB+8lJJTaEKspWvHBVoadyyHrdDyT
         VL0sMCHWXgzQ2ADZwdqzx4WElFp7CioziNV4Scy0=
Date:   Fri, 3 Jul 2020 09:24:36 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Chris Dickens <christopher.a.dickens@gmail.com>
Cc:     linux-usb <linux-usb@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>, andrzej.p@samsung.com
Subject: Re: gadget: Why do Microsoft OS descriptors need their own USB
 request?
Message-ID: <20200703072436.GB2225285@kroah.com>
References: <CAL-1MmUi6OajEYNuP+OOEeekesZJjAGP-8VDSjGydXAMEFHhMA@mail.gmail.com>
 <20200703060013.GA6188@kroah.com>
 <CAL-1MmX7xKjYUUAgSGfJ7roi6W3ucD+oyQT4vmxAaDtJpjU07Q@mail.gmail.com>
 <20200703065715.GA2220026@kroah.com>
 <CAL-1MmVnbFk2hw8pBL02WyE1zxdYAUO=_HM0V=gGfh_9e-_QOg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL-1MmVnbFk2hw8pBL02WyE1zxdYAUO=_HM0V=gGfh_9e-_QOg@mail.gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jul 03, 2020 at 12:03:43AM -0700, Chris Dickens wrote:
> Apologies, I just hit Reply in Gmail without editing...
> 
> On Thu, Jul 2, 2020 at 11:57 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> > Look in the older history trees, perhaps it is in there?
> >
> > And if it pre-dates git, odds are we don't remember anymore, some of us
> > deal with thousands of patches a week :)
> 
> It doesn't pre-date git--it was introduced in commit 19824d5eee ("usb:
> gadget: OS String support") dated May 8, 2014.

I don't understand what you mean by "duplicate" here, can you submit a
patch to show what you are wanting to change?

thanks,

greg k-h
