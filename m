Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 751A7C48BE8
	for <linux-usb@archiver.kernel.org>; Fri, 18 Jun 2021 19:30:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 589BF61279
	for <linux-usb@archiver.kernel.org>; Fri, 18 Jun 2021 19:30:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233934AbhFRTcs (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 18 Jun 2021 15:32:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:37040 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233219AbhFRTcf (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 18 Jun 2021 15:32:35 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id DE11461264;
        Fri, 18 Jun 2021 19:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624044625;
        bh=yw+7NIKMeQe1K9ZrpoLr+9944RDbCJopuGxESFrZXoY=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=D4OWgZlvqjmzFVhBgBu/MMttvY93h42cx5/PbNnteg0E+lruyNSqAiw+YWxlkFNds
         4Y4T0ng55fwmRW0pDhcNlGNRdRsj1n2p4rO9Tw5RI6G6khmUlk1lbQVUHDChq0umy8
         J+oOeVD4OwzxW5Sr/R3w6EqgMUewYGLadrtGkX6WFVRagNIRgvd+jYNBa6q/f0xXZr
         AVzFeFpvqdmyH3rCJ1TV+iddfu3vEX+NIUvxub9p+nLEUdjSOJlkcDJRpir7JMQToM
         VS/FsS0m3XeakfYgM9/EOxhjMuzFZrlh7FNeak2cIm44xUuV2v8RVtY74SQr8DYqHk
         trEp5OstBNmtQ==
Subject: Re: [GIT PULL] USB driver fixes for 5.13-rc7
From:   pr-tracker-bot@kernel.org
In-Reply-To: <YMx2NueY1Eu9ZECV@kroah.com>
References: <YMx2NueY1Eu9ZECV@kroah.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <YMx2NueY1Eu9ZECV@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-5.13-rc7
X-PR-Tracked-Commit-Id: a7d8d1c7a7f73e780aa9ae74926ae5985b2f895f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e2c8f8e57ba66aa4bef6990bc9228a29440cf987
Message-Id: <162404462587.17995.6652441805515081852.pr-tracker-bot@kernel.org>
Date:   Fri, 18 Jun 2021 19:30:25 +0000
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The pull request you sent on Fri, 18 Jun 2021 12:32:22 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-5.13-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e2c8f8e57ba66aa4bef6990bc9228a29440cf987

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
