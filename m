Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19340C4320E
	for <linux-usb@archiver.kernel.org>; Sun, 15 Aug 2021 05:30:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E207561040
	for <linux-usb@archiver.kernel.org>; Sun, 15 Aug 2021 05:30:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231238AbhHOFa5 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 15 Aug 2021 01:30:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:49718 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229599AbhHOFa4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 15 Aug 2021 01:30:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 5594161042;
        Sun, 15 Aug 2021 05:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629005427;
        bh=PIK2Ic/IvrJB8fQ3hKlfFdltjvo9k+h8QmDZ7a+ZbUs=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=c0xcdouDt/iDJ5lRAoiN5X8anpsNpv9CAXCeBkidB+x0JoNtE/mbgt8LJkT1wnv1f
         M89iHH2S2TOaeb4H2C53XqOHgo4ZnbLMO3NY4FBaSU1bpKaQWHRuC/PMKDcVDQWm+Q
         rLsKnHZlqGsD2s5gpdicM5UWkCEkvwRh624Do4+MYTNJuYnSIoyytI0KAqPUDeTU0B
         j0zkhPn6MXyrvDhsitZTOGhq0VzBOOPrvTI58uN+P0s+9t0POoDiy2WE+VIafu/gMH
         LMVasDZ3NgiX0vlp1DCixBZQ89i6WyroER7V45I/Ln9d+ag9vVuTunJ8KAD2T3jjN1
         JWGPjCfhB3XNQ==
Subject: Re: [GIT PULL] USB fix for 5.14-rc6
From:   pr-tracker-bot@kernel.org
In-Reply-To: <YRf0g0jpHTNIhObs@kroah.com>
References: <YRf0g0jpHTNIhObs@kroah.com>
X-PR-Tracked-List-Id: <linux-usb.vger.kernel.org>
X-PR-Tracked-Message-Id: <YRf0g0jpHTNIhObs@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-5.14-rc6
X-PR-Tracked-Commit-Id: 664cc971fb259007e49cc8a3ac43b0787d89443f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 12f41321ce769b10a3770f6b39e14cb5d6ee97a4
Message-Id: <162900542732.9665.1556779002470778346.pr-tracker-bot@kernel.org>
Date:   Sun, 15 Aug 2021 05:30:27 +0000
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The pull request you sent on Sat, 14 Aug 2021 18:51:15 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-5.14-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/12f41321ce769b10a3770f6b39e14cb5d6ee97a4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
