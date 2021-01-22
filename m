Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 708F4C433DB
	for <linux-usb@archiver.kernel.org>; Fri, 22 Jan 2021 01:11:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2621422CAE
	for <linux-usb@archiver.kernel.org>; Fri, 22 Jan 2021 01:11:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726222AbhAVBL1 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 21 Jan 2021 20:11:27 -0500
Received: from vps0.lunn.ch ([185.16.172.187]:53506 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725775AbhAVBL0 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 21 Jan 2021 20:11:26 -0500
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
        (envelope-from <andrew@lunn.ch>)
        id 1l2ky8-001wpw-IJ; Fri, 22 Jan 2021 02:10:32 +0100
Date:   Fri, 22 Jan 2021 02:10:32 +0100
From:   Andrew Lunn <andrew@lunn.ch>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     hayeswang@realtek.com, grundler@chromium.org, davem@davemloft.net,
        netdev@vger.kernel.org, linux-usb@vger.kernel.org,
        Roland Dreier <roland@kernel.org>
Subject: Re: [PATCHv2 1/3] usbnet: specify naming of
 usbnet_set/get_link_ksettings
Message-ID: <YAomCIEWCsquQODX@lunn.ch>
References: <20210121125731.19425-1-oneukum@suse.com>
 <20210121125731.19425-2-oneukum@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210121125731.19425-2-oneukum@suse.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jan 21, 2021 at 01:57:29PM +0100, Oliver Neukum wrote:
> The old generic functions assume that the devices includes
> an MDIO interface. This is true only for genuine ethernet.
> Devices with a higher level of abstraction or based on different
> technologies do not have it. So in preparation for
> supporting that, we rename the old functions to something specific.
> 
> v2: adjusted to recent changes

Hi Oliver

It  looks like my comment:

https://www.spinics.net/lists/netdev/msg711869.html

was ignored. Do you not like the name mii?

    Andrew
