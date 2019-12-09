Return-Path: <SRS0=Dimz=Z7=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57023C43603
	for <linux-usb@archiver.kernel.org>; Mon,  9 Dec 2019 12:33:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 292262073D
	for <linux-usb@archiver.kernel.org>; Mon,  9 Dec 2019 12:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1575894824;
	bh=UKL/eekfycoEMsRNBzi6LEsqFzMPbiIsoDRVYO1rntk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=akPsExKVBoMe66fERJMkuy7GoQkUfuwbdrQ5G1Ab9+iSFLH5+73gCI9a4h/ccuS4R
	 xpcfSnXMZqDVePmuVKZgXbj2unBChPa8Bnyt7ZAS5KCUM1ubO7wvnA2yDXSse30VA/
	 +LflTDnQtVaGefHWCHy2KXrsryRp4WPUtUPQCg88=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727482AbfLIMdn (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 9 Dec 2019 07:33:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:51074 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726687AbfLIMdn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 9 Dec 2019 07:33:43 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 58E6120726;
        Mon,  9 Dec 2019 12:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575894822;
        bh=UKL/eekfycoEMsRNBzi6LEsqFzMPbiIsoDRVYO1rntk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pEZnYJuCIt/6Yp1cvwKa8URLZD72g3X1EUuD6AVvLwKcgd13YUAMbWIZMK6m9dure
         IecC5NULfPQwuv6y7HIm/8YceiBZMo0AQ7473NzogaYZC1GFz+3YkAxLuheWEb8UwP
         ZqA8K18RlIrerQZ9/jFlhfdxISnFI5lJq5JqKk3g=
Date:   Mon, 9 Dec 2019 13:33:40 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Oliver Neukum <oneukum@suse.com>,
        syzbot+48a2851be24583b864dc@syzkaller.appspotmail.com,
        linux-usb@vger.kernel.org
Subject: Re: WARNING in dln2_start_rx_urbs/usb_submit_urb
Message-ID: <20191209123340.GA1134572@kroah.com>
References: <1574263316.14298.36.camel@suse.com>
 <20191209122604.GH3468@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191209122604.GH3468@dell>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Dec 09, 2019 at 12:26:04PM +0000, Lee Jones wrote:
> On Wed, 20 Nov 2019, Oliver Neukum wrote:
> 
> > #syz test: https://github.com/google/kasan.git b1aa9d83
> > 
> > From 6f3de1e2c53fcee54d90a6891df9cea763eca86b Mon Sep 17 00:00:00 2001
> > From: Oliver Neukum <oneukum@suse.com>
> > Date: Wed, 20 Nov 2019 16:15:13 +0100
> > Subject: [PATCH] mfd: dln2: more sanity checking for endpoints
> > 
> > It is not enough to check for the number of endpoints.
> > The types must also be correct.
> > 
> > Reported-by: syzbot+48a2851be24583b864dc@syzkaller.appspotmail.com
> > Signed-off-by: Oliver Neukum <oneukum@suse.com>
> > ---
> >  drivers/mfd/dln2.c | 13 +++++++++++--
> >  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> Looks okay in principle.
> 
> It would be great if one of the USB guys could take a quick look.
> 
> Is this not something that could be done at a subsystem level?

We have functions in the USB core for this, look at
usb_find_common_endpoints() for an example of this.  You can convert the
driver to use this, or use the usb helper functions that Oliver is using
here in a much simpler patch :)

thanks,

greg k-h
