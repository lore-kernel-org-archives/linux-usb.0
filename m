Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A96BC64E7B
	for <linux-usb@archiver.kernel.org>; Tue, 24 Nov 2020 16:40:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2F5422063A
	for <linux-usb@archiver.kernel.org>; Tue, 24 Nov 2020 16:40:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="uETXL75F"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390530AbgKXQjs (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 24 Nov 2020 11:39:48 -0500
Received: from mail.kernel.org ([198.145.29.99]:44760 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726105AbgKXQjs (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 24 Nov 2020 11:39:48 -0500
Received: from kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com (unknown [163.114.132.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 39DA12063A;
        Tue, 24 Nov 2020 16:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606235987;
        bh=RjHgFLnFlpd2v/PnpD2xwRkJUOhxW5jIh0Zv4IK+S8Q=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=uETXL75FovKQ3O7BKr+SG62KxhsFF5HviPp9gUOAIU/wje39+F2tLNjTm2K/4W4Sx
         SIBtbxuhxvtCRHG3ISKtqLsXHWrswasEB4MDs1qPiITIk7ZPzzFagjevQpxP5/Qtf/
         kcjmWRydfMy5O628ZvRSCfS370A8zfe6wjTGAQsY=
Date:   Tue, 24 Nov 2020 08:39:46 -0800
From:   Jakub Kicinski <kuba@kernel.org>
To:     Yves-Alexis Perez <corsac@corsac.net>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Martin Habets <mhabets@solarflare.com>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Shannon Nelson <snelson@pensando.io>,
        "Michael S. Tsirkin" <mst@redhat.com>, linux-usb@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matti Vuorela <matti.vuorela@bitfactor.fi>,
        stable@vger.kernel.org
Subject: Re: [PATCH] usbnet: ipheth: fix connectivity with iOS 14
Message-ID: <20201124083946.66caed0e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <02c032512dab22c1ab758d953affd94a4064fdbd.camel@corsac.net>
References: <CAAn0qaXmysJ9vx3ZEMkViv_B19ju-_ExN8Yn_uSefxpjS6g4Lw@mail.gmail.com>
        <20201119172439.94988-1-corsac@corsac.net>
        <20201121140311.42585c68@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
        <02c032512dab22c1ab758d953affd94a4064fdbd.camel@corsac.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 24 Nov 2020 11:41:40 +0100 Yves-Alexis Perez wrote:
> On Sat, 2020-11-21 at 14:03 -0800, Jakub Kicinski wrote:
> > Applied to net with the typo fixed, thanks!  
> 
> Thanks!
> 
> Is there any chance it'll be in 5.10 or will it have to wait for the 5.11
> merge window?

It'll be in 5.10-rc6.

> Also it should be applied to all supported/stable kernels. I guess that'll
> have to wait until it's in Linus tree according [1] to but I'm unsure if I
> need to trigger the action myself or if Greg (or Dave, according to [2]) will
> do it.

Dave (or someone helping him, like myself) will do it, probably around
the time 5.10-rc6 is released.

> I looked at [3] and it seems that adding the CC: stable in my commit message
> maybe was an error because it's marked as a Failure, so if there's anything
> needed from me here, don't hesitate to ask.

No worries, I stripped the CC and put the patch in Dave's stable queue.
