Return-Path: <SRS0=6DB4=3Q=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E18AC2D0DB
	for <linux-usb@archiver.kernel.org>; Mon, 27 Jan 2020 17:38:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 817A324654
	for <linux-usb@archiver.kernel.org>; Mon, 27 Jan 2020 17:38:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725907AbgA0Ri1 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 27 Jan 2020 12:38:27 -0500
Received: from mail.monom.org ([188.138.9.77]:56516 "EHLO mail.monom.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725893AbgA0Ri1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 27 Jan 2020 12:38:27 -0500
X-Greylist: delayed 470 seconds by postgrey-1.27 at vger.kernel.org; Mon, 27 Jan 2020 12:38:26 EST
Received: from mail.monom.org (localhost [127.0.0.1])
        by filter.mynetwork.local (Postfix) with ESMTP id BA7665005CA;
        Mon, 27 Jan 2020 18:30:34 +0100 (CET)
Received: from localhost (b9168f78.cgn.dg-w.de [185.22.143.120])
        by mail.monom.org (Postfix) with ESMTPSA id 5E4B4500168;
        Mon, 27 Jan 2020 18:30:34 +0100 (CET)
Date:   Mon, 27 Jan 2020 18:30:34 +0100
From:   Daniel Wagner <wagi@monom.org>
To:     JH <jupiter.hce@gmail.com>
Cc:     connman <connman@lists.01.org>, ofono <ofono@ofono.org>,
        linux-usb <linux-usb@vger.kernel.org>
Subject: Re: 4G LTE connection stability with USB voltage requirement
Message-ID: <20200127173034.hw6il2cnpvgl64py@beryllium.lan>
References: <CAA=hcWTiqmULgD1JqEHUo4iXtrCt+zQAHmJL8=wPUNqPA57ENA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA=hcWTiqmULgD1JqEHUo4iXtrCt+zQAHmJL8=wPUNqPA57ENA@mail.gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi JH,

On Mon, Jan 27, 2020 at 01:26:41PM +1100, JH wrote:
> It seems to me there are subtle differences between connman / ofono
> and OpenWrt netifd, could the connman / ofono require more rigid
> stable USB voltage than OpenWrt netifd? Or could the OpenWrt netifd be
> more superior than connman / ofono in terms of 4G LTE connections?
> 
> Appreciate your insight comments and advice.

What about measuring the power drawn by the device? And while at it
also careful check the datasheets of the components if the tolerances
of the hardware components are meet.

I cannot comment on netifd since I don't know anything about it. But
it could be that ConnMan and oFono together do more CPU work hence the
device drains more power. I can tell you from experience if the CPU
doesn't get enough power you see really random crashes and weird
behaviors. Check the reports on Raspberry Pi and power supplies.

Thanks,
Daniel
