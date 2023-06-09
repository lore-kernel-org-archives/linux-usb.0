Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32E61C7EE29
	for <linux-usb@archiver.kernel.org>; Fri,  9 Jun 2023 02:50:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237651AbjFICuY (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 8 Jun 2023 22:50:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229688AbjFICuW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Jun 2023 22:50:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C562430E8;
        Thu,  8 Jun 2023 19:50:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5D7CC63D86;
        Fri,  9 Jun 2023 02:50:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A4566C4339B;
        Fri,  9 Jun 2023 02:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686279020;
        bh=FIL0Rv6ked7OJnTxiRNajRPCkpiLxI/FzLmXUNCOGRQ=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=jtTe3c6Bj/PeqPy3ban/yYdX0TkP6NNJxoUZ64Cp0TM4IU+HhzyVRpU6Uo/owMaSj
         nJXUSw3nmCvEITsiFgkz9/bSdy0BvDTu5P9gbAZT2Hhu06I6XgKQWV0Vwx9gwHex8I
         PMIVwsJnOh3BttSMzndE73k5IxQFLAl/dBVETw6iOREBUqkggrO2w7G8+2V9RIgNBK
         bepQR7Zz4V0b/Y7BxjIqV9QY8i6pFiN4BUSf17eMZmKjlneG9CWbAfNeQdXcGfx2T/
         DZzkMjvKe4K5T7ybT1EPioPb7MYmhCHZfMP37gLeWdVqqM/ovjLVjHYe/fRFBrykRd
         ZmH4aQMZKqpYg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 871B5E87232;
        Fri,  9 Jun 2023 02:50:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH V2 1/1] net: usb: qmi_wwan: add support for Compal RXM-G1
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <168627902054.16434.7911645526823306522.git-patchwork-notify@kernel.org>
Date:   Fri, 09 Jun 2023 02:50:20 +0000
References: <20230608030141.3546-1-wes.huang@moxa.com>
In-Reply-To: <20230608030141.3546-1-wes.huang@moxa.com>
To:     Wes Huang <wes155076@gmail.com>
Cc:     bjorn@mork.no, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        wes.huang@moxa.com, stable@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu,  8 Jun 2023 11:01:42 +0800 you wrote:
> From: Wes Huang <wes.huang@moxa.com>
> 
> Add support for Compal RXM-G1 which is based on Qualcomm SDX55 chip.
> This patch adds support for two compositions:
> 
> 0x9091: DIAG + MODEM + QMI_RMNET + ADB
> 0x90db: DIAG + DUN + RMNET + DPL + QDSS(Trace) + ADB
> 
> [...]

Here is the summary with links:
  - [V2,1/1] net: usb: qmi_wwan: add support for Compal RXM-G1
    https://git.kernel.org/netdev/net/c/863199199713

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


