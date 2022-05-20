Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99762C433FE
	for <linux-usb@archiver.kernel.org>; Fri, 20 May 2022 01:00:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344189AbiETBAU (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 19 May 2022 21:00:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344171AbiETBAQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 19 May 2022 21:00:16 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B52C131F3E;
        Thu, 19 May 2022 18:00:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 9F81FCE28D8;
        Fri, 20 May 2022 01:00:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F09B9C385B8;
        Fri, 20 May 2022 01:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653008412;
        bh=Jv4EpBkuihz2uWIShaH5ImxfUf35G5nBK/R4AU6jJKg=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=h3PWPal2aQfsyGT+3cwVPrhogPcwuGtDJ8VzHDhDkDJm+w17afZuHphNeK5Ckwh0T
         qj7L5BgbUUD0sU5jrFJEwQ1hLgZJ732WPSP1av4EhZvrMGJACw4FzbjlzgTkSeb0rX
         F9PIHRW9YwVZjP3KSRmNT443/0xfFJSKLA8lubDcca43j6gHtQyXg273Wogx/nrGQS
         WLGxLhWJgqRVnoiCqWxhn2HHOG6oMMRth05BtFIOAPjIjvOF20WqfPoGe119NZTYGw
         xb2p9ryQ5rCXSAGuLfzsK/2j8Yb8tkXQl94v+DuZ6tHo54GXj06nYnxoporiyj2S7H
         5LPNmi4XjHWyg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CFA9CE8DBDA;
        Fri, 20 May 2022 01:00:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v5] net: usb: r8152: Add in new Devices that are supported for
 Mac-Passthru
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <165300841184.14248.2951786717495843913.git-patchwork-notify@kernel.org>
Date:   Fri, 20 May 2022 01:00:11 +0000
References: <20220517180539.25839-1-dober6023@gmail.com>
In-Reply-To: <20220517180539.25839-1-dober6023@gmail.com>
To:     David Ober <dober6023@gmail.com>
Cc:     linux-usb@vger.kernel.org, netdev@vger.kernel.org,
        davem@davemloft.net, hayeswang@realtek.com, aaron.ma@canonical.com,
        bjorn@mork.no, markpearson@lenovo.com, dober@lenovo.com
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 17 May 2022 14:05:39 -0400 you wrote:
> Lenovo Thunderbolt 4 Dock, and other Lenovo USB Docks are using the
> original Realtek USB ethernet Vendor and Product IDs
> If the Network device is Realtek verify that it is on a Lenovo USB hub
> before enabling the passthru feature
> 
> This also adds in the device IDs for the Lenovo USB Dongle and one other
> USB-C dock
> 
> [...]

Here is the summary with links:
  - [v5] net: usb: r8152: Add in new Devices that are supported for Mac-Passthru
    https://git.kernel.org/netdev/net-next/c/f01cdcf891a5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


