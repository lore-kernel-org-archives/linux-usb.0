Return-Path: <SRS0=G55A=A2=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86E31C433E0
	for <linux-usb@archiver.kernel.org>; Wed, 15 Jul 2020 09:30:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5DE19206F4
	for <linux-usb@archiver.kernel.org>; Wed, 15 Jul 2020 09:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594805435;
	bh=97mKMnIMb+bPD+5iGPFi+jkpLZCa4BHUsalF8RTXSWA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=AaiIoaWuPuRoniCu8eBZzI5Woyn8ZVwkXuCvVB6uEgUP3dEzSbadUKCXhwq7ZdxZv
	 PoOUin2j7sDPh9ula/qflmQg/gtvqRIBb7eSX8czAeukIhaAatabt73asPHaVwSS10
	 DpxrEzxmsx4H73Bp9ZzM7ItRcmLIwHO+YCQt96Q4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730740AbgGOJae (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 15 Jul 2020 05:30:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:42732 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726988AbgGOJae (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 15 Jul 2020 05:30:34 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 81896206D5;
        Wed, 15 Jul 2020 09:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594805434;
        bh=97mKMnIMb+bPD+5iGPFi+jkpLZCa4BHUsalF8RTXSWA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hMkLtodBKxMAAWfeARD4Y8U3AlkxUWSh0vxEJMJa/k1/1T79VWGGt7vBZhlk9JN30
         8FouBAB+WVzCjAD4yWN/ohEkmKFbpMibUC9U509jp/BrbFr7bOpyt8UpEPF5+tBMWW
         xCh7RgtG7osZuDVzK2GjR1oVwR+tsfMGNiS17VZw=
Date:   Wed, 15 Jul 2020 11:30:29 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     David Guillen Fandos <david@davidgf.net>
Cc:     linux-usb@vger.kernel.org
Subject: Re: System crash/lockup after plugging CDC ACM device
Message-ID: <20200715093029.GB2759174@kroah.com>
References: <9778f9b8a8604e2c13979ea6909678c23cd286cb.camel@davidgf.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9778f9b8a8604e2c13979ea6909678c23cd286cb.camel@davidgf.net>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 15, 2020 at 10:58:03AM +0200, David Guillen Fandos wrote:
> Hello linux-usb,
> 
> I think I might have found a kernel bug related to the USB subsystem
> (cdc_acm perhaps).
> 
> Context: I was playing around with a device I'm creating, essentially a
> USB quad modem device that exposes four modems to the host system. This
> device is still a prototype so there's a few bugs here and there, most
> likely in the USB descriptors and control requests.
> 
> What happens: After plugging the device the system starts spitting
> warnings and BUGs and it locks up. Most of the time some CPUs get into
> some spinloop and never comes back (you can see it being detected by
> the watchdog after a few seconds). Generally after that the USB devices
> stop working completely and at some point the machine freezes
> completely. In a couple of ocasions I managed to see a bug in dmesg
> saying "unable to handle page fault for address XXX" and "Supervisor
> read access in kernel mode" "error code (0x0000) not present page". I
> could not get a trace for that one since the kernel died completely and
> my log files were truncated/lost.
> 
> Since it is happening to my two machines (both Intel but rather
> different controllers, Sunrise Point-LP USB 3.0 vs 8 Series/C220) and
> with different kernel versions I suspect this might be a bug in the
> kernel.
> 
> I have 4 logs that I collected, they are sort of long-ish, not sure how
> to best send them to the list.

Send the crashes with the callback list, that should be quite small,
right?  We don't need the full log.

The first crash is the most important, the others can be from the first
one and are not reliable.

thanks,

greg k-h
