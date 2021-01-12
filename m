Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34A53C433E9
	for <linux-usb@archiver.kernel.org>; Tue, 12 Jan 2021 02:01:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EF5262388C
	for <linux-usb@archiver.kernel.org>; Tue, 12 Jan 2021 02:01:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729069AbhALCAu (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 11 Jan 2021 21:00:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:32904 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726076AbhALCAt (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 11 Jan 2021 21:00:49 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 9FD5823715;
        Tue, 12 Jan 2021 02:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610416808;
        bh=JA7RFtDyEsLTJ3YZTfWqDONzeJK33iktFHEZq1+LLe4=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=dh6+2LT/oPg8SDAVEf2amzvr0qxDzaU9rsQ4qzVauhVOwT147esGwxqMosHlLSDv6
         VYJOBPSW6CykzrV5RCyASlay1x9AxFw+0zzMHPf4GpnVLEQngQnYNsqhe3DU8RFob5
         Lk4UnRljptkGeWwdk/F80EHIDyMt+BAlE3yVefQs+bTzFJiK+HWhT+TFLx5YDRbS8O
         yEQvVBnUpx71KIWvYYvYgfOG5jD88uUVlmLKgk/QkNlF8cv5XOOP4rIYR0qo/UjUOY
         JzmvVsaSV15bBsHJ9pNSmbpcxp/AYWjMvyg6cFF/Zh6gsi1SMHZ2iSl6j6uGeg4ALr
         3y7mN/MMdBqrw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] rndis_host: set proper input size for OID_GEN_PHYSICAL_MEDIUM
 request
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <161041680859.7943.15802296130984944165.git-patchwork-notify@kernel.org>
Date:   Tue, 12 Jan 2021 02:00:08 +0000
References: <20210108095839.3335-1-andrey.zhizhikin@leica-geosystems.com>
In-Reply-To: <20210108095839.3335-1-andrey.zhizhikin@leica-geosystems.com>
To:     Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>
Cc:     davem@davemloft.net, kuba@kernel.org, jussi.kivilinna@mbnet.fi,
        dbrownell@users.sourceforge.net, linville@tuxdriver.com,
        linux-usb@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (refs/heads/master):

On Fri,  8 Jan 2021 09:58:39 +0000 you wrote:
> MSFT ActiveSync implementation requires that the size of the response for
> incoming query is to be provided in the request input length. Failure to
> set the input size proper results in failed request transfer, where the
> ActiveSync counterpart reports the NDIS_STATUS_INVALID_LENGTH (0xC0010014L)
> error.
> 
> Set the input size for OID_GEN_PHYSICAL_MEDIUM query to the expected size
> of the response in order for the ActiveSync to properly respond to the
> request.
> 
> [...]

Here is the summary with links:
  - rndis_host: set proper input size for OID_GEN_PHYSICAL_MEDIUM request
    https://git.kernel.org/netdev/net/c/e56b3d94d939

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


