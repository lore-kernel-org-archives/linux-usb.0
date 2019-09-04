Return-Path: <SRS0=fNt9=W7=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9576BC3A5A8
	for <linux-usb@archiver.kernel.org>; Wed,  4 Sep 2019 07:05:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5F91D2339E
	for <linux-usb@archiver.kernel.org>; Wed,  4 Sep 2019 07:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1567580711;
	bh=BvhCnpCI7Jpy8VXdwe7ysGKs1koYaDcnvbTLdLeJAiI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=b+/50nIqZG4v2nhO5Nbfo0H39ZJUC71t9SR2gPqeHKteUqYa609Ioqx9Zrh0IB1tK
	 zpnRRBetH9cFfA1mh9fvCnilkgfqdFv2kXW+xnLlGfQFrkrDpYFba1vh+yh1MfHdb6
	 8bkApJ7sN53wWg/SUAu2pI1mBK7KEOKcqvzEwkcU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727499AbfIDHFK (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 4 Sep 2019 03:05:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:59078 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725840AbfIDHFK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 4 Sep 2019 03:05:10 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 839BA22CED;
        Wed,  4 Sep 2019 07:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567580710;
        bh=BvhCnpCI7Jpy8VXdwe7ysGKs1koYaDcnvbTLdLeJAiI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KDNtYyrNQqprj/svcXeemD0AdjchjOU1HueB3PHYRzg1CWgUOhmRR3xIAzLa8MtBL
         2pX3HkJAEdYEMJbc+Nz6dO/erZRU6MjlLS87RUKAouSbAngHdA4vG8eDNn8LprrLPI
         q1s3lHLi/AQNrlMAKdC3f2BXSMfC6zN0DOXT/oZs=
Date:   Wed, 4 Sep 2019 09:05:07 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Gavin Li <gavinli@thegavinli.com>
Cc:     linux-usb@vger.kernel.org, Gavin Li <git@thegavinli.com>
Subject: Re: [PATCH] usb: devio: fix mmap() on non-coherent DMA architectures
Message-ID: <20190904070507.GA18791@kroah.com>
References: <20190801220436.3871-1-gavinli@thegavinli.com>
 <20190802121416.GA20689@kroah.com>
 <CA+GxvY7LswVFZvk0mLRLgUqdo=Gb0pQ1KMsgmWbiFEPvMvquXQ@mail.gmail.com>
 <20190805151713.GA7067@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190805151713.GA7067@kroah.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 05, 2019 at 05:17:13PM +0200, Greg KH wrote:
> On Fri, Aug 02, 2019 at 10:57:00AM -0700, Gavin Li wrote:
> > usbfs mmap() looks like it was introduced for 4.6 in commit
> > f7d34b445abc, so it should probably be backported to 4.9 and onwards.
> > This issue has been present since the introduction of the feature.
> > 
> > One sidenote: this patch will cause the following warning on x86 due
> > to dmap_mmap_coherent() trying to map normal memory in as uncached:
> > 
> > x86/PAT: ... map pfn RAM range req uncached-minus for [mem
> > 0x77b000000-0x77b210fff], got write-back
> > 
> > This warning is harmless, as x86 is DMA coherent and the memory gets
> > correctly mapped in as write-back. I will submit a patch to the DMA
> > mapping team to eliminate this warning.
> 
> Let me know what the git commit id of that patch is, I will wait for it
> to hit the tree before adding this one.

Dropping this patch from my queue now, please feel free to resend when
you have refreshed it against the latest tree.

thanks,

greg k-h
