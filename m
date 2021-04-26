Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD67DC43461
	for <linux-usb@archiver.kernel.org>; Mon, 26 Apr 2021 20:00:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7A6466135D
	for <linux-usb@archiver.kernel.org>; Mon, 26 Apr 2021 20:00:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241706AbhDZUA4 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 26 Apr 2021 16:00:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:47410 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236419AbhDZUAz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 26 Apr 2021 16:00:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 4860D6135D;
        Mon, 26 Apr 2021 20:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619467210;
        bh=kMmQIwQL5QHxMjtbd+hiNFBqiEl7YsRI/Me5nMKtcrQ=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=G99eVjzJCJhq1WFIB0d5SXvuJKrAvwVKEEtMn0sOcT8pTKp4JyATsJbYjJ2VwYwTX
         F3C2XJVutGesqvB+IyxGpYGrIzj7LL8a9AUL2IO2MdYBrmPn/5TPym5GTsZ+2HH31O
         dMqj22ncOu5S/R3c29L4XMvky8PLPZKYtFXceNVaJQ501Hew/QKzoT77g5NhxEACkV
         HqzDg0C+8ICQSbL519D0+UXWVRSagKwGZ6szafMM1y1gkDWr2MAS+XfdE88diBmcx7
         cSAJLLg6pT0t2E2y9DC99R/04PwxYMKIbP21bQ9rTatqEMFfUh23brSBEoPwg6hZok
         /sx58jmMFdh5Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: hso: fix NULL-deref on disconnect regression
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <161946721024.23958.2611872115325420575.git-patchwork-notify@kernel.org>
Date:   Mon, 26 Apr 2021 20:00:10 +0000
References: <20210426081149.10498-1-johan@kernel.org>
In-Reply-To: <20210426081149.10498-1-johan@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     davem@davemloft.net, kuba@kernel.org, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        mail@anirudhrb.com, leoanto@aruba.it
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Mon, 26 Apr 2021 10:11:49 +0200 you wrote:
> Commit 8a12f8836145 ("net: hso: fix null-ptr-deref during tty device
> unregistration") fixed the racy minor allocation reported by syzbot, but
> introduced an unconditional NULL-pointer dereference on every disconnect
> instead.
> 
> Specifically, the serial device table must no longer be accessed after
> the minor has been released by hso_serial_tty_unregister().
> 
> [...]

Here is the summary with links:
  - net: hso: fix NULL-deref on disconnect regression
    https://git.kernel.org/netdev/net-next/c/2ad5692db728

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


