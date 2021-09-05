Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76EEFC433F5
	for <linux-usb@archiver.kernel.org>; Sun,  5 Sep 2021 19:07:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 61ADD60F5E
	for <linux-usb@archiver.kernel.org>; Sun,  5 Sep 2021 19:07:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236145AbhIETIR (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 5 Sep 2021 15:08:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:37092 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234953AbhIETIR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 5 Sep 2021 15:08:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 9F0EA60FBF;
        Sun,  5 Sep 2021 19:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630868833;
        bh=A1borPYrVFOksCOhqisfem0YDnsM3kjvpoIzlD1g4iM=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=XWlyOrKTeRcgAhDK86ISRpyH0sYAUj4eOhzccwZPwKQliQzSipLPp8BsevZ34FkQs
         5wC/jcg2fCSO80kVXDAj//PR6iRGR4sOCHi1oZvxDLjG/Fnhkb2CiZVhEYBbUyVsUm
         GWoHoX9rpQcBvYwahrfm6YMNal0BaQm0r3wva5v+wocpob8tAgd9PHINsU9OeK9kKz
         9WMWlgR/JRBMFGrkKez87Id+gAX8X76H3F2vSTJCWWPYGFo81dZEfI474o9ZXcMY+S
         UsVhjHCAk3uc7AEt1AC/XBEQ15+ySeKnP/VsW+jBDTQuFXLMs2g6rKvfXYGAtOUo8s
         q+1t1zqPOUzYQ==
Subject: Re: [GIT PULL] More USB changes for 5.15-rc1
From:   pr-tracker-bot@kernel.org
In-Reply-To: <YTMQc8Cqjr29gelw@kroah.com>
References: <YTMQc8Cqjr29gelw@kroah.com>
X-PR-Tracked-List-Id: <linux-usb.vger.kernel.org>
X-PR-Tracked-Message-Id: <YTMQc8Cqjr29gelw@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-5.15-rc1-2
X-PR-Tracked-Commit-Id: 1b4f3dfb4792f03b139edf10124fcbeb44e608e6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fd47ff55c9c31101fcc06d20cb381da3d4089bd5
Message-Id: <163086883361.6256.11352801150596478128.pr-tracker-bot@kernel.org>
Date:   Sun, 05 Sep 2021 19:07:13 +0000
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Johan Hovold <johan@kernel.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The pull request you sent on Sat, 4 Sep 2021 08:21:39 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-5.15-rc1-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fd47ff55c9c31101fcc06d20cb381da3d4089bd5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
