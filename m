Return-Path: <SRS0=xlna=ST=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,
	T_DKIMWL_WL_HIGH,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74941C282DA
	for <linux-usb@archiver.kernel.org>; Wed, 17 Apr 2019 11:13:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 42EC420821
	for <linux-usb@archiver.kernel.org>; Wed, 17 Apr 2019 11:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555499619;
	bh=RHKcalS8rV/mm56h8YNahdVzbd4n9zN/bJzE+WDFYCM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=KC5zwN6nyn0fZZ24U8YRzQ7hFOKsYjBYhVOgA5+EEXr9O27sJ/PBReNVP/79icIVE
	 1H8S6bJt8PoNchummFxdJWB0Pui4ugjOjpKOjsuk7hW7mCmlaKlb5NLuf1Y7umb5L/
	 Ic2t4/yhQ7D+OAymIcM17nJNhKVLuK+Z90UjN7PM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731659AbfDQLNi (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 17 Apr 2019 07:13:38 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:34272 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729522AbfDQLNi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 Apr 2019 07:13:38 -0400
Received: by mail-lj1-f194.google.com with SMTP id j89so22057225ljb.1
        for <linux-usb@vger.kernel.org>; Wed, 17 Apr 2019 04:13:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=AJZ0tE5GYQiM+qj3PzdYxfAjH5yudsheWP6VcqZ8ixU=;
        b=YYwenNjndVB4qzpjP+pZCbAtGv/wJGLN/bq4WUyW1JfxaQInPbfwuwX2/eAYSlbZH9
         uo74/4eJ5F2z3uh4z6qR+sXfN2jqJ0OCPZqV7QgPCkM+TqaKSWU3REmYB0OnYReC0o9x
         1099QOlYCF77Sfl/+Yr4Xj32494D3ZT9iJh2MYZioY+2lPpkaiiyEYQ9yJ97ZGleQLuH
         b8Z4qyTaGtY/mvR5IsLtAriUIrOah0BLJYjC22YveMiCcimwcqEGZCK6UOp+jLwACkZt
         LVVWFeSEF0XAUqNitGR4xlauVU25tblJSbZINr92pQ3h5Q8L71PLDjIFi51FD6DB8zac
         pB7Q==
X-Gm-Message-State: APjAAAUaSKpfKxNeJiQqiv0+geyaFf+bKjvpxQG/eg6j8CkdpNBBiGQR
        bHysnr2HUuMcO+7H8kJ/9fM=
X-Google-Smtp-Source: APXvYqzC02a2J45bBlVJeQ6HQbLrlhv16Ato+Q7hT5waAgtDaZY+dgtERhXhhL7UC5Yz6ttqG9e5/w==
X-Received: by 2002:a2e:8ec5:: with SMTP id e5mr37172647ljl.7.1555499616073;
        Wed, 17 Apr 2019 04:13:36 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id y3sm11227752lfh.12.2019.04.17.04.13.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Apr 2019 04:13:33 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.91)
        (envelope-from <johan@kernel.org>)
        id 1hGiVY-000165-HL; Wed, 17 Apr 2019 13:13:40 +0200
Date:   Wed, 17 Apr 2019 13:13:40 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Charles Yeh <charlesyeh522@gmail.com>
Cc:     Johan Hovold <johan@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        =?utf-8?B?WWVoLkNoYXJsZXMgW+iRieamrumRq10=?= 
        <charles-yeh@prolific.com.tw>
Subject: Re: [PATCH] USB:serial:pl2303:Add new PID to support PL2303HXN
 (TYPE_HXN)
Message-ID: <20190417111340.GA2520@localhost>
References: <20190213123000.4656-1-charlesyeh522@gmail.com>
 <20190402072235.GI12562@localhost>
 <CAAZvQQ6eOVH_YPxHq_PmDSmFSErswnm8njfjOO6mR9oOi0r5_Q@mail.gmail.com>
 <20190415085626.GB29656@localhost>
 <CAAZvQQ6JHwZ+iOo02s45SqYUo2sV3o49VJ3QGkL4Yh9Pyi_mMA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <CAAZvQQ6JHwZ+iOo02s45SqYUo2sV3o49VJ3QGkL4Yh9Pyi_mMA@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190417111340.QitXzENeultS5nK3-dt9vhKgYMzgAPJa9xl1I3UV07k@z>

On Wed, Apr 17, 2019 at 06:50:55PM +0800, Charles Yeh wrote:
> Hello Sir,
> 
> Please download the PL2303_Linux_0419.zip from
> https://app.box.com/s/uh9kldrdldjnmjffku8gkdvvaq5496tk
> 
> > > After the actual test (I have tested the old PL2303H chip on Linux),
> > > when I plug in the PL2303H (TYPE_01), the Linux code will execute the code:
> > > if (spriv->quirks & PL2303_QUIRK_LEGACY) itinerary code.
> > > So I confirm This "PL2303_QUIRK_LEGACY" of code refers to PL2303H(TYPE_01)
> >
> > Correct, but my question was about bit 0x20 for TYPE_01 devices; why
> > isn't it being as set as for TYPE_HX?
> >
> 
> TYPE_01 / TYPE_HX / TYPE_HXN are different hardware design.
> Please refer to PL2303_Linux_0419\PL2303_TYPE_01_UART_Flow.jpg &
> PL2303_TYPE_HX_UART_Flow.jpg

Thanks, that will be very helpful.

> > Well, without documentation it is hard to give advice. But the
> > information you provided above, indicates that you should not be
> > overwriting these registers completely for HXN either when updating the
> > flow-control settings. Only the bits 2..4 (and possibly 0..1) should be
> > written.
> >
> > Take a look at the patches I merged for doing this on the older devices.
> > You should be able to use the same helper when updating these
> > registers.
> 
> Please refer to PL2303_Linux_0419\
> PL2303_TYPE_01_UART_Flow.jpg &
> PL2303_TYPE_HX_UART_Flow.jpg &
> PL2303G_TYPE_HXN_UART_Flow.jpg
> 
> 
> 
> If you have other questions (whether it's my newly written patch code or
> the code that originally existed), please try to raise it... Thanks!

I will, thanks. I'm looking at how best to abstract this now.

> The code that originally existed; not what I wrote..
> But I have rewritten many times to a lot of customers...
> probably can also guess the usage of the original code.
> 
> 
> I just used
> "git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git"
> to get the latest Linux kernel.
> 
> The code I see in the pl2303_set_termios function
> is still pl2303_vendor_write(serial,0x0,0x41),
> Not pl2303_update_reg(serial,0,PL2303_FLOWCTRL_MASK,0x40);

Yes, you need to base it on my usb-next branch (or linux-next):

	git://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git

> Can I write a new patch?
> "git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git"
> But I don't want to rewrite the original code.
> For example "pl2303_vendor_write(serial,0x0,0x41)"
> Because that's the old code.. Not that I added the patch code this time.

Got it, but please take a look my usb-next branch.

I'll try to clean up the current driver some more based on your
feedback. I'll get back to you as soon as have something concrete
and we'll get the HXN support in place.

Meanwhile here are few questions:

 1. Can bcdUSB be used to detect the HXN devices?

 2. Does the old (type 01 and hx) devices require the register address
    to be ORed with 0x80 when reading?

 3. And the HXN does not need that ORing with 0x80 it seems?

 4. How do you use the chip-reset register (0x7) on HXN; do you write
    0x03 if you only want to reset both data pipes?

And please try to respond inline when replying, no need to keep second
copy at the end of your mails.

Thanks,
Johan
