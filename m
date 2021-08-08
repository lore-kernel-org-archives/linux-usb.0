Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DBD2C4320A
	for <linux-usb@archiver.kernel.org>; Sun,  8 Aug 2021 18:35:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 104E960F0F
	for <linux-usb@archiver.kernel.org>; Sun,  8 Aug 2021 18:35:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232322AbhHHSgO (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 8 Aug 2021 14:36:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:37818 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229977AbhHHSgN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 8 Aug 2021 14:36:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 6446160F0F;
        Sun,  8 Aug 2021 18:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628447754;
        bh=/dUfQyxSdmLdlSmiFxIXIEbToyA6Ix+fzkeoK+j/pro=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=ZriQHa5mnkhRvOzio23ucGT6AbnwTzDmLbOLAfK8pT7a4vulLNH1YUrulM9HXLHAy
         +rguUvG7voZupOtgwutA+5A+w9KmUjZ7hmOz3ewAzDnQXMzr1chXAo84fF8vy7YtAE
         ZsLydphVlEddTsrQvklVpBWpL4pIrO/rBZ/WLPj16sMQdsizj5yjrXJ6D1+433Qhca
         LIP8zthutiIhlSuz9wp4HDrlSH+ZP9UHvoG2pjboQqPBink5HEzisWHW2ZOrPJ6sNK
         msvr/rakUPrOss+usEQyBGF4v36Z7goVbTm/TaK4MPt5P5FzB1kS2p1dkqArvRGznJ
         JL8E9o7M4eL0w==
Subject: Re: [GIT PULL] USB fixes for 5.14-rc5
From:   pr-tracker-bot@kernel.org
In-Reply-To: <YQ/AYY7G/5Dq8wRh@kroah.com>
References: <YQ/AYY7G/5Dq8wRh@kroah.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <YQ/AYY7G/5Dq8wRh@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-5.14-rc5
X-PR-Tracked-Commit-Id: 43ad944cd73f2360ec8ff31d29ea44830b3119af
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6a65554767546881e3e50f3734364021d11b703d
Message-Id: <162844775431.32600.4552226427350312956.pr-tracker-bot@kernel.org>
Date:   Sun, 08 Aug 2021 18:35:54 +0000
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The pull request you sent on Sun, 8 Aug 2021 13:30:41 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-5.14-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6a65554767546881e3e50f3734364021d11b703d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
