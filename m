Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B96A3C4338F
	for <linux-usb@archiver.kernel.org>; Wed, 18 Aug 2021 10:50:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9338D6109F
	for <linux-usb@archiver.kernel.org>; Wed, 18 Aug 2021 10:50:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234775AbhHRKuk (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 18 Aug 2021 06:50:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:49714 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233170AbhHRKuk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 18 Aug 2021 06:50:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 732FF6103A;
        Wed, 18 Aug 2021 10:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629283805;
        bh=G/e+SSkhPVy4IC4NVqI1ulL6wsDBbQsFzrjctMdAr3A=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=aeENeDKX5J9EENEPbKCBVEShP2NEY+iDXtsjrvayMr8sRFOZ8Zdc2bCoX7ch68ily
         7X5FBVP/YJX5N63t9ABIxP7rFIW/3YK3+o86DT33+4Au2LZkK4nY1twyvLnfDwqhxy
         QSY0+U68BldiwKPAQgNmYxDfVIgKrbiun5tgcdguQSXIHFMt30Mwr8d5gQb5WkuvZu
         G92nevliNI0+d+yXoi/kVcE39n/KY9K3pfr7dM91VFl7AhtEbZrUCK7+SOoYXcxnR9
         pfyqYE2wVlYVpcUXxs3yw45tnGNHjmQGbIQ3XwipJPX7SfhpIKJTGkazS8inffqg5D
         bGK6jVPhHk4jg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4] net: asix: fix uninit value bugs
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <162928380541.20153.5366417098709462761.git-patchwork-notify@kernel.org>
Date:   Wed, 18 Aug 2021 10:50:05 +0000
References: <20210817163723.19040-1-paskripkin@gmail.com>
In-Reply-To: <20210817163723.19040-1-paskripkin@gmail.com>
To:     Pavel Skripkin <paskripkin@gmail.com>
Cc:     davem@davemloft.net, kuba@kernel.org, linux@rempel-privat.de,
        andrew@lunn.ch, himadrispandya@gmail.com,
        robert.foss@collabora.com, freddy@asix.com.tw,
        linux-usb@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        syzbot+a631ec9e717fb0423053@syzkaller.appspotmail.com
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (refs/heads/master):

On Tue, 17 Aug 2021 19:37:23 +0300 you wrote:
> Syzbot reported uninit-value in asix_mdio_read(). The problem was in
> missing error handling. asix_read_cmd() should initialize passed stack
> variable smsr, but it can fail in some cases. Then while condidition
> checks possibly uninit smsr variable.
> 
> Since smsr is uninitialized stack variable, driver can misbehave,
> because smsr will be random in case of asix_read_cmd() failure.
> Fix it by adding error handling and just continue the loop instead of
> checking uninit value.
> 
> [...]

Here is the summary with links:
  - [v4] net: asix: fix uninit value bugs
    https://git.kernel.org/netdev/net/c/a786e3195d6a

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


