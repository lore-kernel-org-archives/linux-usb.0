Return-Path: <SRS0=atT9=YT=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48BBFCA9EBD
	for <linux-usb@archiver.kernel.org>; Sat, 26 Oct 2019 20:45:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1CB9D21D80
	for <linux-usb@archiver.kernel.org>; Sat, 26 Oct 2019 20:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572122724;
	bh=FsL2ZdmLJkxqIKAnvGNLsqXDxtCJwgVnY8z+FDXI4Vw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:List-ID:From;
	b=xEi0piYjO0DRaxTfzrwHq5zEpSQWvt485qsxXlJc6ISPRv452ItyASJ7xOun8n8z+
	 lB5A7YdsvI8OAAwMbAHigMwiVSoBgr52zl9g1pfImS8sR499Y7pI8c82IqWSb24xdR
	 Wys6GZhHzmMmm3bClf/sxyFumbD78V1D4D0jIGRc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726605AbfJZUpX (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 26 Oct 2019 16:45:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:37978 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726516AbfJZUpG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 26 Oct 2019 16:45:06 -0400
Subject: Re: [GIT PULL] USB fixes for 5.4-rc5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572122706;
        bh=FsL2ZdmLJkxqIKAnvGNLsqXDxtCJwgVnY8z+FDXI4Vw=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=YqN6uHXfV4p2/nRNS4yIsKW6t1Bqg6h4sgfGHPVgibgv4/HpHJJeZqAPURsWDf5r9
         Kg6F2psw77VatTWCr4cIE8XCsgssqciLZHjmM/JqIXsIXxJhO1azusay1LQkQLtXuo
         Tl9HRcjjnASWFY2OtfpEzmTxBlG8QihqvE4Dm7ek=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20191026181736.GA648771@kroah.com>
References: <20191026181736.GA648771@kroah.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20191026181736.GA648771@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-5.4-rc5
X-PR-Tracked-Commit-Id: 9794476942d8704cfbdef8d5f13427673ab70dcd
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0ecdd78c75b76a38fdd3064157adb4a091e5bbee
Message-Id: <157212270621.6077.10967984915299274698.pr-tracker-bot@kernel.org>
Date:   Sat, 26 Oct 2019 20:45:06 +0000
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The pull request you sent on Sat, 26 Oct 2019 20:17:36 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-5.4-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0ecdd78c75b76a38fdd3064157adb4a091e5bbee

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
