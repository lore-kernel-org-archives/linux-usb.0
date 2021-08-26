Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA8B5C432BE
	for <linux-usb@archiver.kernel.org>; Thu, 26 Aug 2021 00:50:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BE0586101C
	for <linux-usb@archiver.kernel.org>; Thu, 26 Aug 2021 00:50:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235365AbhHZAux (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 25 Aug 2021 20:50:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:55072 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232139AbhHZAuw (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 25 Aug 2021 20:50:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 539216102A;
        Thu, 26 Aug 2021 00:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629939006;
        bh=dvKxA5qSUlWCFnQ2eB3V6ge91h3mgauRFEKO7wCeWbI=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=qzGptMU6RDX5rRXauqxI1LymDrivMuklJkhIEA/ZjoE4nBGo8E7TRFEoKOxoIBHcq
         utnTIi2DIUpTXSRF5+RWSBAolDyw8G5sZAQjGq+pc2EgYLZ0SDBiXQmwXLjh9y/xjR
         5AwWS/VyVMZQhx+iUYXhqLggw2Z+B+9HPApRkJ343L/xWuSl/Xbfsqih/0miOyfK9Q
         lmRLLf8mdo3uLORQPvfgndShxH+XBwMOAdbiPAd2Yh24p1iOjYhkUXP+z26ZSzr00A
         5X6kCy06601ltEkW7ebWw38cWb835Pvhoe7Irs2W0iAw+gEouyxqnTzuoxKM6ORxd+
         3T51ayJFq1kMg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v1 1/1] net: usb: asix: ax88772: fix boolconv.cocci
 warnings
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <162993900628.635.15201948072736611742.git-patchwork-notify@kernel.org>
Date:   Thu, 26 Aug 2021 00:50:06 +0000
References: <20210825183538.13070-1-o.rempel@pengutronix.de>
In-Reply-To: <20210825183538.13070-1-o.rempel@pengutronix.de>
To:     Oleksij Rempel <o.rempel@pengutronix.de>
Cc:     davem@davemloft.net, kuba@kernel.org, andrew@lunn.ch,
        hkallweit1@gmail.com, linux@armlinux.org.uk, lkp@intel.com,
        kernel@pengutronix.de, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, netdev@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (refs/heads/master):

On Wed, 25 Aug 2021 20:35:38 +0200 you wrote:
> From: kernel test robot <lkp@intel.com>
> 
> drivers/net/usb/asix_devices.c:757:60-65: WARNING: conversion to bool not needed here
> 
>  Remove unneeded conversion to bool
> 
> Semantic patch information:
>  Relational and logical operators evaluate to bool,
>  explicit conversion is overly verbose and unneeded.
> 
> [...]

Here is the summary with links:
  - [net,v1,1/1] net: usb: asix: ax88772: fix boolconv.cocci warnings
    https://git.kernel.org/netdev/net/c/ec92e524ee91

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


