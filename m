Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1171CC63793
	for <linux-usb@archiver.kernel.org>; Thu, 22 Jul 2021 08:00:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E609061351
	for <linux-usb@archiver.kernel.org>; Thu, 22 Jul 2021 08:00:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231223AbhGVHTa (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 22 Jul 2021 03:19:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:36094 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230520AbhGVHT3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 22 Jul 2021 03:19:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id E72B96127C;
        Thu, 22 Jul 2021 08:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626940804;
        bh=FI1pzehmMZOZV4ttWFU2Bd/dZvCWkd9upwConI7mrX8=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=pXOyHuWsnq99fxoxhsxkLhxn6T2nCjfLiDHpE1iUMQd6b7sfvgIGBB46lUczuuncE
         xdeVwm7aHQ98Mz09BRpOY1vxnWT80qtq3QikFJG6/ETGcEb1+HYOXXkYQxclxbPEmC
         oqFoas9Y9IgUdfKSw3boUpYRU/DR+d9NzshNZAp7XzK/t9g21lBf6WSuwUnQzPYCgt
         IOCG4QCbA1h82FfRbMjO4is3Uk3f0RCER7KEskCnAMs2qiDsClgb3ztj/9Ef8L7wav
         ImWQ2UZwHwmePjUTaIVo9zVDzuFSOaxEJaBp+Kr6SGo3WS0v/38VKwYd200/MFTtpW
         Jzu1lX/yWjCOA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v1 1/1] net: usb: asix: ax88772: add missing stop
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <162694080488.21125.15089072694011477332.git-patchwork-notify@kernel.org>
Date:   Thu, 22 Jul 2021 08:00:04 +0000
References: <20210722073224.22652-1-o.rempel@pengutronix.de>
In-Reply-To: <20210722073224.22652-1-o.rempel@pengutronix.de>
To:     Oleksij Rempel <o.rempel@pengutronix.de>
Cc:     davem@davemloft.net, kuba@kernel.org, andrew@lunn.ch,
        hkallweit1@gmail.com, linux@armlinux.org.uk, kernel@pengutronix.de,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        netdev@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Thu, 22 Jul 2021 09:32:24 +0200 you wrote:
> Add missing stop and let phylib framework suspend attached PHY.
> 
> Fixes: e532a096be0e ("net: usb: asix: ax88772: add phylib support")
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  drivers/net/usb/asix_devices.c | 1 +
>  1 file changed, 1 insertion(+)

Here is the summary with links:
  - [net-next,v1,1/1] net: usb: asix: ax88772: add missing stop
    https://git.kernel.org/netdev/net-next/c/9c2670951ed0

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


