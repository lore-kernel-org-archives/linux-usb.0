Return-Path: <SRS0=nhXQ=S5=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,T_DKIMWL_WL_HIGH,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3F5FC43218
	for <linux-usb@archiver.kernel.org>; Sat, 27 Apr 2019 07:01:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 73EF82077B
	for <linux-usb@archiver.kernel.org>; Sat, 27 Apr 2019 07:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556348500;
	bh=PnvIG/rN0ZE0sYOaBvkEZGMPQB74UD8RbQ7BiNEQ+qc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=DQudcxzjHH6Aav68+KUZ+LcrpkWmillsgNLxHZawcYikjP/hQR1QcGRpUplrpPTvN
	 aV6BH6j7azt5+47OgxZ3kA8UAg8CI2IgQzOl1DuAlkb2xmgpmfqoyn3/JkmnrrOI8C
	 yEuoaa12/ZdU+lEiZhDFPI3CvwR76YQwVVHwtU6Q=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726181AbfD0HBj (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 27 Apr 2019 03:01:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:49704 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726001AbfD0HBj (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 27 Apr 2019 03:01:39 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6635E2077B;
        Sat, 27 Apr 2019 07:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556348499;
        bh=PnvIG/rN0ZE0sYOaBvkEZGMPQB74UD8RbQ7BiNEQ+qc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tD6OLZFCdvfm9oJUPZXgL1qlRrkEJ5TZmqkTJqWVTyIN6EngJqKegYvzewCUR19wr
         ltnr1pFE2oBGqc3kO1bYocEDYWUPiVToXbkq3cVIBY3bYFS14uuge9STro5xUgULoO
         Pesg8HTGQsqMJ9LoQ6F8LvS5ZhjX09HjhlT1VtUg=
Date:   Sat, 27 Apr 2019 09:01:36 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Christo Gouws <gouws.christo@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Line6 podstudio UX1 - driver crash on usb_hcd_map_urb_for_dma
Message-ID: <20190427070136.GE28250@kroah.com>
References: <CAPHvrskWo2yhtNRthWFMST-S_=afo06fZo7SmbBOKY7VXHWA-g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPHvrskWo2yhtNRthWFMST-S_=afo06fZo7SmbBOKY7VXHWA-g@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Apr 26, 2019 at 11:50:14AM +0200, Christo Gouws wrote:
> Hi,
> 
> I have a Line6 Pod Studio UX1 card, but each time I plug it in, I get
> the following crash in dmesg on Ubuntu 18.04
> Linux my-pc 4.20.8-042008-generic #201902121544 SMP Tue Feb 12
> 20:46:50 UTC 2019 x86_64 x86_64 x86_64 GNU/Linux
> 
> I've also tested this with a Fedora 30 v5.0.6-300 kernel, but still
> seems to happen (using liveCD).
> 
> 
> The output on the card seems to work, but none of the inputs work.
> 
> I've also now tested with latest kernel available on Arch Linux
> Linux my-pc 5.0.9-arch1-1-ARCH #1 SMP PREEMPT Sat Apr 20 15:00:46 UTC
> 2019 x86_64 GNU/Linux
> 
> After some further testing, I found that this issue cropped in beween
> v4.8.17 and v4.9-rc1.
> 
> v4.8.17   - Works fine.
> v4.9-rc1+  - Produces crash

Any chance you can use 'git bisect' to find the exact commit that caused
the failure?

thanks,

greg k-h
