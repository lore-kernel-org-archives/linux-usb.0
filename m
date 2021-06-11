Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96B16C48BE0
	for <linux-usb@archiver.kernel.org>; Fri, 11 Jun 2021 20:10:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 707E3613E3
	for <linux-usb@archiver.kernel.org>; Fri, 11 Jun 2021 20:10:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230454AbhFKUMD (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 11 Jun 2021 16:12:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:58542 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230305AbhFKUMC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 11 Jun 2021 16:12:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 4335B613DE;
        Fri, 11 Jun 2021 20:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623442204;
        bh=gu7bxTsifzGZ4LA+en1PGdaj0Xd8ax3gohr8WXQGvXU=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=jRZWQMn4nq2BQNV/WxIrpDc5pRCPZaiWtxURhdtxregrLHtPDr5KXUoaaAle4RmZs
         1OF+7uR+90ylsmhK7K7oHjdAvyFICi7lkhzteQrsD4AB/CiRp8XTsB/xbw/ooAbxuT
         pKzTbZtk69JbOqNYZ/6y8SFomCYTg51DVs/4IpaMPhVQG4b2ICpeBPKNfen6ckhBg+
         Nf/n/baHxUS2vGVnxsa7asj244kiilW57WSFi19zGdUOFY5qwdI14B2xR+SjnVxxWf
         1Ulw1Td7xiMGXE7d5wsVBu22QhQ+uWQnLYVRu8OWtgLo9t2kmp0cGtLkfhENc626L0
         DPxX0EbViV3cw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] net: usb: asix: ax88772: manage PHY PM from MAC
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <162344220419.8005.4275764665021801891.git-patchwork-notify@kernel.org>
Date:   Fri, 11 Jun 2021 20:10:04 +0000
References: <20210611035559.13252-1-o.rempel@pengutronix.de>
In-Reply-To: <20210611035559.13252-1-o.rempel@pengutronix.de>
To:     Oleksij Rempel <o.rempel@pengutronix.de>
Cc:     davem@davemloft.net, kuba@kernel.org, andrew@lunn.ch,
        hkallweit1@gmail.com, linux@armlinux.org.uk,
        m.szyprowski@samsung.com, jonathanh@nvidia.com,
        kernel@pengutronix.de, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, netdev@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Fri, 11 Jun 2021 05:55:59 +0200 you wrote:
> Take over PHY power management, otherwise PHY framework will try to
> access ASIX MDIO bus before MAC resume was completed.
> 
> Fixes: e532a096be0e ("net: usb: asix: ax88772: add phylib support")
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Reported-by: Jon Hunter <jonathanh@nvidia.com>
> Suggested-by: Heiner Kallweit <hkallweit1@gmail.com>
> Tested-by: Jon Hunter <jonathanh@nvidia.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: usb: asix: ax88772: manage PHY PM from MAC
    https://git.kernel.org/netdev/net-next/c/4a2c7217cd5a

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


