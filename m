Return-Path: <SRS0=H92C=BV=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B5A4C433E0
	for <linux-usb@archiver.kernel.org>; Tue, 11 Aug 2020 18:38:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E80D120781
	for <linux-usb@archiver.kernel.org>; Tue, 11 Aug 2020 18:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1597171136;
	bh=A8ZLfU1oBTDr3ETDysDR94GMxmaLvBufqFEB1844R5s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=uDyk4gfPR0KAxnzgVHDWioNbQF1caapxT+6ltV6E/KVxBTCUQbvzb0nSAnNnvbWV3
	 ZOQY4dlybjNNnxa2dlhvS7P84yHuRCCh4A4nhTZDaM3+a5MqV1vo7pLs3xwS0fsE41
	 5tZ0NfrRMwl7uocYZmXSLW+p+zEORPrzw7/wtWPw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726085AbgHKSiz (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 11 Aug 2020 14:38:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:57534 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725862AbgHKSiz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 11 Aug 2020 14:38:55 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 389042076B;
        Tue, 11 Aug 2020 18:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597171134;
        bh=A8ZLfU1oBTDr3ETDysDR94GMxmaLvBufqFEB1844R5s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=P+YkeFVw9m/rM90aVV6ceAEzGhEQNMy9Y8g5/E5+Nse+iro6OnT/MuBXapx+yL8v/
         2AnnLRjeVC2vDgzvjKZqu1LXx/hhI/XlLws/110IBndrkYyYrL6YvNUXYM3TX4NygB
         CsGCBnyMxfV7TqWQzuJLmIhMbNb8+DCaZm9g55Uc=
Date:   Tue, 11 Aug 2020 20:39:04 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Patrik Nilsson <nipatriknilsson@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: high speed data to usb disk makes the kernel think that is has
 been unmounted
Message-ID: <20200811183904.GA841555@kroah.com>
References: <a161e45d-6ce8-2077-c513-380b67c4dfd8@gmail.com>
 <20200811175655.GB828356@kroah.com>
 <47a5804c-835a-f1a2-abce-50b3531f2556@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <47a5804c-835a-f1a2-abce-50b3531f2556@gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 11, 2020 at 08:34:53PM +0200, Patrik Nilsson wrote:
> Hi Greg,
> > Can you provide kernel logs?  Odds are the disk disconnects itself as it
> > takes too much power or something.
> udev-kernel logs can be found:
> https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1886172

udev logs do not help, can you do, from a command line:
	sudo dmesg -c		# clears the kernel log
	<do your testing>
	dmesg > kernel_log.txt

and send us the kernel_log.txt file?

> I have tested the usb to sata adapter directly connected to a computer and
> connected to a externally powered usb hub. The bug behavior is the same.

I bet the adapter can't handle the issue here, writing a lot of data to
flash does take a lot of power.

> One time when I tested the whole usb hub disconnected. I have a usb to
> ethernet connected to it too. It vanished and appeared again. Doubt it is
> power. The externally powered hub can deliver 4A, but I hope the usb to sata
> only takes 2A.

If the whole hub disconnected, that is a _huge_ hint it's a power issue,
the operating system can not do that on its own.

thanks,

greg k-h
