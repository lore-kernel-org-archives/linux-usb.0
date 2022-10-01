Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5118AC433FE
	for <linux-usb@archiver.kernel.org>; Sat,  1 Oct 2022 16:52:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229772AbiJAQwk (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 1 Oct 2022 12:52:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229724AbiJAQw2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 1 Oct 2022 12:52:28 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B05432053;
        Sat,  1 Oct 2022 09:52:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E953E60C62;
        Sat,  1 Oct 2022 16:52:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 510B8C433C1;
        Sat,  1 Oct 2022 16:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664643143;
        bh=MNfcnDIilpKPdwgENeyhD9qZnXJhPKUACQmPG4fCtbo=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=MpRpxPvtXawjBJUsQ//Ns1hy/RcYpKdMTAWMfmUYrDzl5AYH9bx+nGOkjb896csOg
         h4zFFw2s2VgwRS/Dse+r+QwC8nIdj+Ytt9WHYxfS/yUr4oWs/V4mfpUgU3hm8+I4YJ
         p8qiaD2aePqJQcTbd9/eJy0bxAkjlqBrjzCYyVXP9Dd1G11L1HCK4KMfDxUHT54hNz
         4nl1EbKEYLqREQ9q0/XGNf4pO5wHwfZ0dpdeSpEwK/znR9ep3XxR2idQEV1gTvtYf6
         ulAEZz9hpuzcB0Z6Q3t+2uLc8WzHrBZ2U5RdkYY3xP51FpNVe55YYIuMV6StezAdEJ
         +2xxknc36RlxA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 404BCE21EC6;
        Sat,  1 Oct 2022 16:52:23 +0000 (UTC)
Subject: Re: [GIT PULL] USB / Thunderbolt driver fixes for 6.0-final
From:   pr-tracker-bot@kernel.org
In-Reply-To: <YzhrOlp3MwJzVpCh@kroah.com>
References: <YzhrOlp3MwJzVpCh@kroah.com>
X-PR-Tracked-List-Id: <linux-usb.vger.kernel.org>
X-PR-Tracked-Message-Id: <YzhrOlp3MwJzVpCh@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-6.0-final
X-PR-Tracked-Commit-Id: 0fb9703a3eade0bb84c635705d9c795345e55053
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b357fd1c2afc1a3e1b73dc4574bb7ac0e3bd4193
Message-Id: <166464314325.22904.13064782633505688323.pr-tracker-bot@kernel.org>
Date:   Sat, 01 Oct 2022 16:52:23 +0000
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The pull request you sent on Sat, 1 Oct 2022 18:30:50 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-6.0-final

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b357fd1c2afc1a3e1b73dc4574bb7ac0e3bd4193

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
