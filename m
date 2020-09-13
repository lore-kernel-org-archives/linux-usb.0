Return-Path: <SRS0=K4zX=CW=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1E5DC43461
	for <linux-usb@archiver.kernel.org>; Sun, 13 Sep 2020 16:33:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5FD4B2220A
	for <linux-usb@archiver.kernel.org>; Sun, 13 Sep 2020 16:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600014812;
	bh=m3Nw1iJDRliR6heb2YTwzjSa5ato8SQ8HppNjMQAx3g=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:List-ID:From;
	b=Sfqu7il4N9xOkDh1QfQuIsKm8p4oug5p5e2dvTECnYKuxhtTc0hVI5YeUM3vPQMBU
	 xqNGVHa0ubIsxHBA/q9DMn8K9/uIIcJFhKAy7/5vkhG+53HHOwZqCDjW4hYOhjGozw
	 XEcOYchdoL50AhEhqgFNbImD2CsyxZnUGA6K3GGY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725943AbgIMQdW (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 13 Sep 2020 12:33:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:56584 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725876AbgIMQdU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 13 Sep 2020 12:33:20 -0400
Subject: Re: [GIT PULL] USB/Thunderbolt fixes for 5.9-rc5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600014800;
        bh=m3Nw1iJDRliR6heb2YTwzjSa5ato8SQ8HppNjMQAx3g=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=sX+GVuWaGgPboBbaLrUEq9aPVBxiSOZ7u2YJXJxoXH7Zi8n4zyauUeYvvE1LKPEx1
         o0Z0vaavcQMFCctC4X4hd5kLIHqT1GVf86DLcYEumOlYpWd75GuK8/o5G5nK4PwfT4
         GEPNA+d/dWnzHMuScyv8OPUFj57TOA+mOYmwlPpg=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200913084024.GA907010@kroah.com>
References: <20200913084024.GA907010@kroah.com>
X-PR-Tracked-List-Id: <linux-usb.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200913084024.GA907010@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-5.9-rc5
X-PR-Tracked-Commit-Id: a29c0adbb688ddee61b731804fb360898412fe7e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e4c26faa426c17274884f759f708bc9ee22fd59a
Message-Id: <160001480009.6953.13788614724449131476.pr-tracker-bot@kernel.org>
Date:   Sun, 13 Sep 2020 16:33:20 +0000
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The pull request you sent on Sun, 13 Sep 2020 10:40:24 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-5.9-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e4c26faa426c17274884f759f708bc9ee22fd59a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
