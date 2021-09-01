Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D985C4320E
	for <linux-usb@archiver.kernel.org>; Wed,  1 Sep 2021 17:39:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5EB5960FD7
	for <linux-usb@archiver.kernel.org>; Wed,  1 Sep 2021 17:39:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344787AbhIARkP (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 1 Sep 2021 13:40:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:39102 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233404AbhIARkG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 1 Sep 2021 13:40:06 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 472596109E;
        Wed,  1 Sep 2021 17:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630517949;
        bh=RvZzLjVG9If/8CyrStP59uIXDObIypszX2lNH2HT9QM=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=NpRPRf9H616DE8FMiR7bFYggF/8QzLTFuewwz+cKM/iU371wKtIGRxZ7j9QTEllZ4
         2JXAJiU4qHt8LXH/6pL7RELkCtj63nPY+iZCk6/PvRv5crTFJa5DBxrOWqIM8fXXI3
         ZbvEk6zGtTKxuFOMWVTEx2iuFb2LyKHgLWRRLiM2TEijvVZ30YLT/Wsp0VbOg+zFfv
         pPQmuUZdbSdzNJG9NaN9l3UpB23GQ62vR5eFq3np6619GVjNqCEh6qO2uU7Kii6NPD
         bx3euVFW0wRJjlRdIsgICwQvmmdcYAsuVrU/M0xIxWrM4t9TVJiPEsBm2+C8gobUw9
         ReWRCdwh5Ugjw==
Subject: Re: [GIT PULL] USB / Thunderbolt changes for 5.15-rc1
From:   pr-tracker-bot@kernel.org
In-Reply-To: <YS+LiD1qkhHDCeHe@kroah.com>
References: <YS+LiD1qkhHDCeHe@kroah.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <YS+LiD1qkhHDCeHe@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-5.15-rc1
X-PR-Tracked-Commit-Id: 9c1587d99f9305aa4f10b47fcf1981012aa5381f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 07281a257a6868b900da5de1eda808c9e20253f1
Message-Id: <163051794926.15355.5631507440060228607.pr-tracker-bot@kernel.org>
Date:   Wed, 01 Sep 2021 17:39:09 +0000
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The pull request you sent on Wed, 1 Sep 2021 16:17:44 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-5.15-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/07281a257a6868b900da5de1eda808c9e20253f1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
