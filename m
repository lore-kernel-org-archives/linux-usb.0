Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDE0CC433DB
	for <linux-usb@archiver.kernel.org>; Fri, 22 Jan 2021 01:30:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9DAF723381
	for <linux-usb@archiver.kernel.org>; Fri, 22 Jan 2021 01:30:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726487AbhAVB3z (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 21 Jan 2021 20:29:55 -0500
Received: from vps0.lunn.ch ([185.16.172.187]:53542 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725946AbhAVB3s (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 21 Jan 2021 20:29:48 -0500
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
        (envelope-from <andrew@lunn.ch>)
        id 1l2lG1-001x3w-VR; Fri, 22 Jan 2021 02:29:01 +0100
Date:   Fri, 22 Jan 2021 02:29:01 +0100
From:   Andrew Lunn <andrew@lunn.ch>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     hayeswang@realtek.com, grundler@chromium.org, davem@davemloft.net,
        netdev@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCHv2 0/3] usbnet: speed reporting for devices without MDIO
Message-ID: <YAoqXZJVhRDiRI+9@lunn.ch>
References: <20210121125731.19425-1-oneukum@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210121125731.19425-1-oneukum@suse.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jan 21, 2021 at 01:57:28PM +0100, Oliver Neukum wrote:
> This series introduces support for USB network devices that report
> speed as a part of their protocol, not emulating an MII to be accessed
> over MDIO.
> 
> v2: adjusted to recent changes

Hi Oliver

Please give more details what actually changed.  Does this mean you
just rebased it on net-next? Or have you made real changes?

The discussion with v1 suggested that this framework should also be
used by anything which gets notified in CDC style. So i was expecting
to see cdc_ether.c also use this.

	    Andrew
