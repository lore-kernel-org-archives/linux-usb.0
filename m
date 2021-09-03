Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DB9EC433FE
	for <linux-usb@archiver.kernel.org>; Fri,  3 Sep 2021 12:50:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6189F61057
	for <linux-usb@archiver.kernel.org>; Fri,  3 Sep 2021 12:50:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349035AbhICMvH (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 3 Sep 2021 08:51:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:46890 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234262AbhICMvG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 3 Sep 2021 08:51:06 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id E625E61058;
        Fri,  3 Sep 2021 12:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630673407;
        bh=kHx+B1l5F7rJVu4sEXlyYo9Xwp49tFv0+0mlsHkurb0=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=AedggmqAGXAjgCZTkLNwMTlj+P+vh2InEfpLS2xiRNH4bAh0ureFAxYFWK1Vog62H
         T7QUabnMbv1QG/GseBUnYaaLd6YqSRunKd2qLxdCRFA/XUMG/IyyyFJ79DeSLonkgg
         UGe8rLtJQzoa8Bp2cWQRgrBvm5y/IcolrVxFgkpwzbTjw8UgZV5cXOvzhf23BE5EKI
         YcqI1TFsRWeHLlbo0FvbuacnXdMatD0zEz8fRa+4kawIimyDo8k6VgrliTDGBK3ysJ
         NWNWix2U0njPvVbLCEEQkNvksMEjLBjI7q7Fcssoe3zueEuXXvxxZ7UN7EKWJicDpK
         /NR3GnTNJIuIQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: usb: qmi_wwan: add Telit 0x1060 composition
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <163067340688.3998.17708638765587597267.git-patchwork-notify@kernel.org>
Date:   Fri, 03 Sep 2021 12:50:06 +0000
References: <20210903120953.1073210-1-c.lobrano@gmail.com>
In-Reply-To: <20210903120953.1073210-1-c.lobrano@gmail.com>
To:     carlo <c.lobrano@gmail.com>
Cc:     bjorn@mork.no, davem@davemloft.net, kuba@kernel.org,
        netdev@vger.kernel.org, linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (refs/heads/master):

On Fri,  3 Sep 2021 14:09:53 +0200 you wrote:
> From: Carlo Lobrano <c.lobrano@gmail.com>
> 
> This patch adds support for Telit LN920 0x1060 composition
> 
> 0x1060: tty, adb, rmnet, tty, tty, tty, tty
> 
> Signed-off-by: Carlo Lobrano <c.lobrano@gmail.com>
> 
> [...]

Here is the summary with links:
  - net: usb: qmi_wwan: add Telit 0x1060 composition
    https://git.kernel.org/netdev/net/c/8d17a33b076d

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


