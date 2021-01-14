Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0054FC4332D
	for <linux-usb@archiver.kernel.org>; Thu, 14 Jan 2021 19:01:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BF1A923B3E
	for <linux-usb@archiver.kernel.org>; Thu, 14 Jan 2021 19:01:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729609AbhANTAw (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 14 Jan 2021 14:00:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:54580 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729485AbhANTAv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 14 Jan 2021 14:00:51 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 4353123B6C;
        Thu, 14 Jan 2021 19:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610650811;
        bh=hJGvoAH++TMBT1K8ortkNTeQkSCNIKaaVGZNe31IpBE=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=j1YeTxLNVe44u02qg5grX0v84HRmPvO/LrifvYf1Ut/WW/vyCID9d6vYr32iauULg
         j3P6pEe1O5Ys8xaQJlFKvvIF5wOpoxHqWPdid/tI4PY3bPUKWdOaG4dpNiq2OSqdNN
         i1u7vPyswfBxadHDNKoS/W0ofnX7Sbz3f0WV7dlIOCiRPr2jFhUMkd9rY6wmPZRsTB
         nz18ueslA/252UT7uKbHW9rC28dU3QyylmqyGCO2UpXWVryHMYt750ELdC2nOqd3wD
         uTf4odUpQGtthXJwO6qguttJyTDXDHp7lmblporqgVU60zlaSApmwekI1YBRu46fpX
         dRqIM5a79OEwQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] nt: usb: USB_RTL8153_ECM should not default to y
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <161065081122.20848.13718242969885388287.git-patchwork-notify@kernel.org>
Date:   Thu, 14 Jan 2021 19:00:11 +0000
References: <20210113144309.1384615-1-geert+renesas@glider.be>
In-Reply-To: <20210113144309.1384615-1-geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     davem@davemloft.net, kuba@kernel.org, hayeswang@realtek.com,
        m.szyprowski@samsung.com, linux-usb@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (refs/heads/master):

On Wed, 13 Jan 2021 15:43:09 +0100 you wrote:
> In general, device drivers should not be enabled by default.
> 
> Fixes: 657bc1d10bfc23ac ("r8153_ecm: avoid to be prior to r8152 driver")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/net/usb/Kconfig | 1 -
>  1 file changed, 1 deletion(-)

Here is the summary with links:
  - nt: usb: USB_RTL8153_ECM should not default to y
    https://git.kernel.org/netdev/net/c/7da17624e794

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


