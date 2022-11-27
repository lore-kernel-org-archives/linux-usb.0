Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C46F4C352A1
	for <linux-usb@archiver.kernel.org>; Sun, 27 Nov 2022 20:50:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229778AbiK0Ut6 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 27 Nov 2022 15:49:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229762AbiK0Ut4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 27 Nov 2022 15:49:56 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF842DF00;
        Sun, 27 Nov 2022 12:49:55 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6AC7E60ED3;
        Sun, 27 Nov 2022 20:49:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 58E55C433D7;
        Sun, 27 Nov 2022 20:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669582194;
        bh=SPR1g3ZeM87H6b5isjxQU5Zu+/pxdZHzEY9PCb4biQA=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=HbJU9QV+UWZxIX64pUxALhRf2v2QlV0CqKjWvuZzY9HKQwFlIKvqpkb31CscVQUW1
         Yn++w+CvQhcVidJbmRarmmUsoCe6BRP4aeWGGJEUu0VuNksKO+RKKq6DuEvrEtBe6G
         GDysBpgTrOLvMxI6KgARW6bPabe2wkDoOlUcTOj++Wf/dAYMMwNvYkphJZv0xby1sV
         kXvhqDhc2z8HUuEDKmRwHTfJjki2pzX0V4BpwgebBFYQeJ7Qe6vYccs53GWQMdDNur
         Ju+0ZCWy4/rQMjwW4GBd5gT13s170QW/jsfbaO76DFYH1TYhd1sI5eEyOWwakCBgZK
         NyX3nz/V54odA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4402DE5250B;
        Sun, 27 Nov 2022 20:49:54 +0000 (UTC)
Subject: Re: [GIT PULL] USB driver fixes for 6.1-rc7
From:   pr-tracker-bot@kernel.org
In-Reply-To: <Y4Nt1l1L+kuOTEfO@kroah.com>
References: <Y4Nt1l1L+kuOTEfO@kroah.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Y4Nt1l1L+kuOTEfO@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-6.1-rc7
X-PR-Tracked-Commit-Id: 7a21b27aafa3edead79ed97e6f22236be6b9f447
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9066e1518645a6c754709e44c3f58dc6a76a6d21
Message-Id: <166958219427.7005.15371594447992401253.pr-tracker-bot@kernel.org>
Date:   Sun, 27 Nov 2022 20:49:54 +0000
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The pull request you sent on Sun, 27 Nov 2022 15:01:58 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-6.1-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9066e1518645a6c754709e44c3f58dc6a76a6d21

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
