Return-Path: <SRS0=YZLH=DT=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1AD7C43457
	for <linux-usb@archiver.kernel.org>; Mon, 12 Oct 2020 16:50:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 84A162087D
	for <linux-usb@archiver.kernel.org>; Mon, 12 Oct 2020 16:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602521447;
	bh=hY/CEJqHsosCubZ93vuYlbFvOgJSyT40CbOhQjScUH4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=D64XKn5uRYHjiu7xj2SKRRyyf6ZSm783tPyIBiX2Bw//V+NW3qaXAksNsQePYNfNW
	 zwjJqDftoPQNAK54BxjZhwjPh6hNh2NHznmtGW7p+l8HBgx4kHUI2HPn35tRxeXjAE
	 V9dLtxBi+WMnd6LFSPc3LKImel/sf/zqFS4MdYfE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390697AbgJLQup (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 12 Oct 2020 12:50:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:39374 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726742AbgJLQuo (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 12 Oct 2020 12:50:44 -0400
Received: from kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com (unknown [163.114.132.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 47A302080A;
        Mon, 12 Oct 2020 16:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602521444;
        bh=hY/CEJqHsosCubZ93vuYlbFvOgJSyT40CbOhQjScUH4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=nSUHzawX68KPmLkfQR074vFJATFk73RqZihzuJUxc1Q1oJb6wUVY0MsZqpp6eheqy
         Nhp/WLdsGsMKxqvSw5s9TkH2Wnc7sLN3OxzGH2joB/TJcRzrE56Fn3qT+l20Yv/MNg
         5DkwuXTq3/An9EkC8peCVoMmTZsn4KgIl2mvdWi4=
Date:   Mon, 12 Oct 2020 09:50:42 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Ondrej Zary <linux@zary.sk>
Cc:     Oliver Neukum <oneukum@suse.com>, netdev@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] cx82310_eth: re-enable ethernet mode after router
 reboot
Message-ID: <20201012095042.4f5b4843@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <202010121242.55826.linux@zary.sk>
References: <20201010140048.12067-1-linux@zary.sk>
        <20201011155539.315bf5aa@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
        <202010121242.55826.linux@zary.sk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 12 Oct 2020 12:42:55 +0200 Ondrej Zary wrote:
> On Monday 12 October 2020, Jakub Kicinski wrote:
> > On Sat, 10 Oct 2020 16:00:46 +0200 Ondrej Zary wrote:  
> > > When the router is rebooted without a power cycle, the USB device
> > > remains connected but its configuration is reset. This results in
> > > a non-working ethernet connection with messages like this in syslog:
> > > 	usb 2-2: RX packet too long: 65535 B
> > >
> > > Re-enable ethernet mode when receiving a packet with invalid size of
> > > 0xffff.  
> >
> > Patch looks good, but could you explain what's a reboot without a power
> > cycle in this case? The modem gets reset but USB subsystem doesn't know
> > it and doesn't go though a unbind() + bind() cycle?  
> 
> The router can be rebooted through the web interface. The reboot does not 
> disconnect the USB device - it remains connected as if nothing happened. Only 
> wrong data starts to come in.

I see. Applied to net-next, thanks!
