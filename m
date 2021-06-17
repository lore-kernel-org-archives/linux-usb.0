Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21408C2B9F4
	for <linux-usb@archiver.kernel.org>; Thu, 17 Jun 2021 18:40:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E1503613F8
	for <linux-usb@archiver.kernel.org>; Thu, 17 Jun 2021 18:40:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232143AbhFQSmN (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 17 Jun 2021 14:42:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:51718 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230151AbhFQSmN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 17 Jun 2021 14:42:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 447AE613E7;
        Thu, 17 Jun 2021 18:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623955205;
        bh=lUHHmi/Udib6BK3/upB0rdpEPL2Tg8zLONKwx0VZa6E=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=L3+1jWcW39W4lxKz8pCHKk2kUmcIE/geTMmDwh776ubdQaIqlhm6hldOGxNf/TGZI
         F3RVOkviXCkZxVhwejx6Xk3M57kDvTxwV4ViPo1fHV7NuBS++MpLarKg0SrYp+Xeq2
         9z820AEjj6+QMYaibcTNYHO+VshC69NopqaUqoBch7PIMPI5mQaKqTu7ySG4+OYpkp
         FGsUAIIUnpK62gpqIcklW8aiE7pkFiDTHygLIrNFe3tSkEobub9UF4KQ2V/X4Rymtb
         xo6yWtglH1HXrbwfZBLNM4CJuHCVKCssXkA33XQfmi35lRVcC6+qycBUxbGTTGJ0kT
         WPkQfYkHE5XdQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] net: cdc_eem: fix tx fixup skb leak
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <162395520520.2276.1501784808369824188.git-patchwork-notify@kernel.org>
Date:   Thu, 17 Jun 2021 18:40:05 +0000
References: <20210616233232.4561-1-linyyuan@codeaurora.org>
In-Reply-To: <20210616233232.4561-1-linyyuan@codeaurora.org>
To:     Linyu Yuan <linyyuan@codeaurora.org>
Cc:     gregkh@linuxfoundation.org, oliver@neukum.org, davem@davemloft.net,
        kuba@kernel.org, linux-usb@vger.kernel.org, netdev@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (refs/heads/master):

On Thu, 17 Jun 2021 07:32:32 +0800 you wrote:
> when usbnet transmit a skb, eem fixup it in eem_tx_fixup(),
> if skb_copy_expand() failed, it return NULL,
> usbnet_start_xmit() will have no chance to free original skb.
> 
> fix it by free orginal skb in eem_tx_fixup() first,
> then check skb clone status, if failed, return NULL to usbnet.
> 
> [...]

Here is the summary with links:
  - [v2] net: cdc_eem: fix tx fixup skb leak
    https://git.kernel.org/netdev/net/c/c3b26fdf1b32

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


