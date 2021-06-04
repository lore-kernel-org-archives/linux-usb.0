Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6265EC4743C
	for <linux-usb@archiver.kernel.org>; Fri,  4 Jun 2021 23:23:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3391F61359
	for <linux-usb@archiver.kernel.org>; Fri,  4 Jun 2021 23:23:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230348AbhFDXZn (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 4 Jun 2021 19:25:43 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:46388 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229853AbhFDXZm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 4 Jun 2021 19:25:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=6Ir9Say4XA/G9PigaO6l4EgpoLPrKXg+wgV2QA13J3M=; b=jC/FvrgskiGB/VIjZWDUZK1/Lb
        a6q+syEQovTuSZjhwQGVK/ttn26yTnzgTHc47SNYgix+6cLA0EBm86VRfZUxEuyedzJDY7NVa4lVs
        yDvbNFIlBJSSU/FUZBzmCR+X/kZLn7pIfMxKm47wz3dXAQkKZXeJB9RK71eOE0/8jGeI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1lpJAN-007sMD-CC; Sat, 05 Jun 2021 01:23:51 +0200
Date:   Sat, 5 Jun 2021 01:23:51 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Oleksij Rempel <o.rempel@pengutronix.de>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>, kernel@pengutronix.de,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        netdev@vger.kernel.org
Subject: Re: [PATCH net-next v1 3/7] net: usb/phy: asix: add support for
 ax88772A/C PHYs
Message-ID: <YLq2B2vaJUbEqCWg@lunn.ch>
References: <20210604134244.2467-1-o.rempel@pengutronix.de>
 <20210604134244.2467-4-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210604134244.2467-4-o.rempel@pengutronix.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 04, 2021 at 03:42:40PM +0200, Oleksij Rempel wrote:
> Add support for build-in x88772A/C PHYs
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
