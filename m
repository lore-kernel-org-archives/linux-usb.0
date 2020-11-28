Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7863DC64E7B
	for <linux-usb@archiver.kernel.org>; Sat, 28 Nov 2020 22:01:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 32965223FD
	for <linux-usb@archiver.kernel.org>; Sat, 28 Nov 2020 22:01:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="hf5IehI/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391122AbgK1WAv (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 28 Nov 2020 17:00:51 -0500
Received: from mail.kernel.org ([198.145.29.99]:38368 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390678AbgK1WAs (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 28 Nov 2020 17:00:48 -0500
Subject: Re: [GIT PULL] USB/PHY driver fixes for 5.10-rc6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606600808;
        bh=4KSUhNjYMI1XH44Nc03wVJ8QmcR1pmMhqmSOesQ/xZU=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=hf5IehI/nfOGY3YC35VIi1Q1Crv8ss40XAWt0uwOXZgZDF3vt/GMKBou6JWSAzn4q
         ab0ume6Eqj1EIWYhCOzAupNvdcbM7h0MN8R90c3rhR0U9I14hQnVrSu0jTYpWqyg4b
         QMPvKssVWw5XjmnJsl+pjnJ1ODrUBloOnPkQtLSE=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <X8JBIBWUEgxr1lSY@kroah.com>
References: <X8JBIBWUEgxr1lSY@kroah.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <X8JBIBWUEgxr1lSY@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-5.10-rc6
X-PR-Tracked-Commit-Id: 484cfbe5fb61469a5f5a276258a8b3973164b56f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 67f34fa8893e6dfb0e8104c28ee6c5ce23a9e238
Message-Id: <160660080815.28096.1107155279173363250.pr-tracker-bot@kernel.org>
Date:   Sat, 28 Nov 2020 22:00:08 +0000
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The pull request you sent on Sat, 28 Nov 2020 13:22:56 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-5.10-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/67f34fa8893e6dfb0e8104c28ee6c5ce23a9e238

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
