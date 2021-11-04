Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 735DCC433F5
	for <linux-usb@archiver.kernel.org>; Thu,  4 Nov 2021 17:09:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 59F24610D0
	for <linux-usb@archiver.kernel.org>; Thu,  4 Nov 2021 17:09:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231751AbhKDRM3 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 4 Nov 2021 13:12:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:39946 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231186AbhKDRM2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 4 Nov 2021 13:12:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 880CA60F56;
        Thu,  4 Nov 2021 17:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636045790;
        bh=plRviCoN82O4obatYYnQOXHdW6bWskO0ezcd9ZTRSgw=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=JIX2JLcUlZUWfQo3CgS+0hLh7BAduszmTkytLf2/eQV/DhFxM7ad1uSo3A1CsvyWH
         jRl0yL1N2QxbQwW6jKHME6gGbn7/hyqSsitPzfkWMcJzGGORvDyg8zOoEE74DbMTy0
         RrNBwVK7nVoW//8e3XIQpXyXJY4M8RK56XjJdUgcNpMEx13d9cIGeie2YGSDpbivbh
         3UoNWDOb+d5hweN3w9xajkRjUO8qVxlkdNvhYVONDbRxFu7vxmJrisQppNsRyTbZZ9
         GgZmoHalu77tEPqaLcFpthutDdhAPKIZfZ9jFocxRw+F4NTt8rqRI+d0+ThLk0shGS
         bRi+F7X4UuEXA==
Subject: Re: [GIT PULL] USB / Thunderbolt changes for 5.16-rc1
From:   pr-tracker-bot@kernel.org
In-Reply-To: <YYPaloH8ltR32qUk@kroah.com>
References: <YYPaloH8ltR32qUk@kroah.com>
X-PR-Tracked-List-Id: <linux-usb.vger.kernel.org>
X-PR-Tracked-Message-Id: <YYPaloH8ltR32qUk@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-5.16-rc1
X-PR-Tracked-Commit-Id: a0548b26901f082684ad1fb3ba397d2de3a1406a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 048ff8629e117d8411a787559417c781bcd78d7e
Message-Id: <163604579042.24234.1674569365815236421.pr-tracker-bot@kernel.org>
Date:   Thu, 04 Nov 2021 17:09:50 +0000
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The pull request you sent on Thu, 4 Nov 2021 14:05:26 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-5.16-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/048ff8629e117d8411a787559417c781bcd78d7e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
