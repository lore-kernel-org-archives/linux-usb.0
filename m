Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50E18C433EF
	for <linux-usb@archiver.kernel.org>; Tue,  5 Oct 2021 11:50:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3597361216
	for <linux-usb@archiver.kernel.org>; Tue,  5 Oct 2021 11:50:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234457AbhJELv7 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 5 Oct 2021 07:51:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:60012 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233672AbhJELv7 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 5 Oct 2021 07:51:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id D4A5F61502;
        Tue,  5 Oct 2021 11:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633434608;
        bh=5H1e9VG8V483wq01PzCvLBbuUnY2XCEq4xrGesCLCUk=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Kn6N5Aj+5TRKJNv99nINGDvyhIeqf0aH4MBSLE3lOshHWZpxQbjPcmA/31hkEyPGY
         LJrw1pC3jp3ZS9bdW9ZFiq06vyHH1jcOgYVvK0iCUNwwiRKYLovjYbkL5p+giEfo98
         wfM37m0SoI1SXW4LBdpbvL5Heu9PKedv/9/R9qFI1SbNd+af4TTdk/c8toCg2PTx+x
         RwbhtZCOm8Zhz6WEBM7XtJhlTwxe0Mi9BckXriIhN5RJzGkU5f0Y1PNTb93eUcT6/c
         sLg2tvpHfLVqR4eKd1+vb6UKjroj/T3AxPn+FuUqLBW1ZuMW1SUdBwlBiAwFUIOEG2
         ZNMEglnxf6ENg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] r8152: avoid to resubmit rx immediately
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <163343460884.12488.8334221276223981398.git-patchwork-notify@kernel.org>
Date:   Tue, 05 Oct 2021 11:50:08 +0000
References: <20211004062858.1679-381-nic_swsd@realtek.com>
In-Reply-To: <20211004062858.1679-381-nic_swsd@realtek.com>
To:     Hayes Wang <hayeswang@realtek.com>
Cc:     jason-ch.chen@mediatek.com, kuba@kernel.org, davem@davemloft.net,
        netdev@vger.kernel.org, nic_swsd@realtek.com,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (refs/heads/master):

On Mon, 4 Oct 2021 14:28:58 +0800 you wrote:
> For the situation that the disconnect event comes very late when the
> device is unplugged, the driver would resubmit the RX bulk transfer
> after getting the callback with -EPROTO immediately and continually.
> Finally, soft lockup occurs.
> 
> This patch avoids to resubmit RX immediately. It uses a workqueue to
> schedule the RX NAPI. And the NAPI would resubmit the RX. It let the
> disconnect event have opportunity to stop the submission before soft
> lockup.
> 
> [...]

Here is the summary with links:
  - [net] r8152: avoid to resubmit rx immediately
    https://git.kernel.org/netdev/net/c/baf33d7a7564

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


