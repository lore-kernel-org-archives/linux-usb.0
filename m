Return-Path: <SRS0=nhXQ=S5=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,T_DKIMWL_WL_HIGH,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EE1EC43218
	for <linux-usb@archiver.kernel.org>; Sat, 27 Apr 2019 18:24:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 19E9F208C2
	for <linux-usb@archiver.kernel.org>; Sat, 27 Apr 2019 18:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556389476;
	bh=biI+8oUYlCQ0+sKZW1v8XuyCSqLFx0lNAfupWvrpOUY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=1OiINYtnvcKSYRjD8XSnNUAOc3SFvUuLV544gmO3i79lfWoQQGuI4qlMx/Q3Z9Hbg
	 /tiFlp12EYVuzFVliAlsvHdYT3bfSQoHpIBGOvd+IFHZgPo8GbXmYWMNGomzEwmg1M
	 tJrYrUq2nNtUtrViSAVFGHEwsXimlEgnId2Pfgk4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726066AbfD0SYf (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 27 Apr 2019 14:24:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:45492 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725942AbfD0SYf (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 27 Apr 2019 14:24:35 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 784332087E;
        Sat, 27 Apr 2019 18:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556389474;
        bh=biI+8oUYlCQ0+sKZW1v8XuyCSqLFx0lNAfupWvrpOUY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=b/mmJwbUFeSurCSAO38uHmRk2pjs7pmFO1625IPAkRmh1kWJ+nH1aOuRKy4tY5biU
         zEHXuu1qB4vL8ENIry5vNk4cm0BMlFfM8L2k8MADmWGy/raxzzUkVS053WtlTegSzP
         zSYW3oSzA4RJHe3RU6XjKrGfAIt3dQksk8NAdo/0=
Date:   Sat, 27 Apr 2019 20:24:32 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Christo Gouws <gouws.christo@gmail.com>, linux-usb@vger.kernel.org
Subject: Re: Line6 podstudio UX1 - driver crash on usb_hcd_map_urb_for_dma
Message-ID: <20190427182432.GA5213@kroah.com>
References: <20190427070136.GE28250@kroah.com>
 <Pine.LNX.4.44L0.1904271124490.17640-100000@netrider.rowland.org>
 <20190427180728.GA3200@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <20190427180728.GA3200@kroah.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190427182432.nToR_dLFT5L6J6kZ-w1uulfSvAv31YFhCxsx79ySqRg@z>

On Sat, Apr 27, 2019 at 08:07:28PM +0200, Greg KH wrote:
> On Sat, Apr 27, 2019 at 11:34:03AM -0400, Alan Stern wrote:
> > On Sat, 27 Apr 2019, Greg KH wrote:
> > 
> > > On Fri, Apr 26, 2019 at 11:50:14AM +0200, Christo Gouws wrote:
> > > > Hi,
> > > > 
> > > > I have a Line6 Pod Studio UX1 card, but each time I plug it in, I get
> > > > the following crash in dmesg on Ubuntu 18.04
> > > > Linux my-pc 4.20.8-042008-generic #201902121544 SMP Tue Feb 12
> > > > 20:46:50 UTC 2019 x86_64 x86_64 x86_64 GNU/Linux
> > > > 
> > > > I've also tested this with a Fedora 30 v5.0.6-300 kernel, but still
> > > > seems to happen (using liveCD).
> > > > 
> > > > 
> > > > The output on the card seems to work, but none of the inputs work.
> > > > 
> > > > I've also now tested with latest kernel available on Arch Linux
> > > > Linux my-pc 5.0.9-arch1-1-ARCH #1 SMP PREEMPT Sat Apr 20 15:00:46 UTC
> > > > 2019 x86_64 GNU/Linux
> > > > 
> > > > After some further testing, I found that this issue cropped in beween
> > > > v4.8.17 and v4.9-rc1.
> > > > 
> > > > v4.8.17   - Works fine.
> > > > v4.9-rc1+  - Produces crash
> > > 
> > > Any chance you can use 'git bisect' to find the exact commit that caused
> > > the failure?
> > 
> > No need.  The bug is in line6_read_data() in sound/usb/line6/driver.c.  
> > That routine passes an invalid buffer to usb_control_message().  
> > Instead it should allocate its own buffer for the USB transfer and then
> > copy the value to the caller's buffer.
> > 
> > There is a similar problem in line6_write_data().  Furthermore, both
> > routines do DMA to/from a buffer on the stack.
> 
> I have an old patch in my local tree for the dma buffer on the stack
> issue, it's below.  I should clean it up and send it correctly one of
> these days :)

But, in reading your response, it doesn't fix the reported issue here.
Let me go audit the whole driver and fix it up and add it to my original
patch...

