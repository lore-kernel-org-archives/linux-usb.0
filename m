Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84250ECAAD2
	for <linux-usb@archiver.kernel.org>; Mon, 29 Aug 2022 09:04:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229826AbiH2JEK (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 29 Aug 2022 05:04:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229677AbiH2JEJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 Aug 2022 05:04:09 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BD385005C
        for <linux-usb@vger.kernel.org>; Mon, 29 Aug 2022 02:04:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 08EF560F43
        for <linux-usb@vger.kernel.org>; Mon, 29 Aug 2022 09:04:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19B68C433D6;
        Mon, 29 Aug 2022 09:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1661763848;
        bh=Dueawns3ccJENWA1VE4q+ccozmMQUPnz4xMj4q5ggcE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QAfCjmFepbOHBDUjn9Fs/4shPGpRPaQKLVpUv5ywA5xKNP2BE2bpcohlxp9ZGy/p5
         yRadTFQv5Y3Le6prqGm2nEGLcjpGBLJyb7ooUD9BS4Y6tVVtmvzDZsTqdWoH6QajhC
         herPCGTzzPSepvRYn9FbRqRo8wGyzqVk69sNZ3xI=
Date:   Mon, 29 Aug 2022 11:04:05 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Hu Xiaoying <huxiaoying2008@gmail.com>
Cc:     usb-storage@lists.one-eyed-alien.net, linux-usb@vger.kernel.org,
        stern@rowland.harvard.edu
Subject: Re: [PATCH v2] usb: Improves USB2.0 write performance
Message-ID: <YwyBBatyOekM3ulk@kroah.com>
References: <CABd4UjYS4QDozv-RKp3_9XhQec=LO+z9U8+=Oa8=MEFyaeXYhA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABd4UjYS4QDozv-RKp3_9XhQec=LO+z9U8+=Oa8=MEFyaeXYhA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 29, 2022 at 04:58:57PM +0800, Hu Xiaoying wrote:
> From: Hu Xiaoying <huxiaoying@gmail.com>

<snip>

You can not send html mail to the mailing lists, for patches, it will be
rejected and does not work at all.

Please read the kernel documentation about dealing with email clients.

Also, the above "From:" line does not match your "From:" line on the
email, causing me to automatically reject the submission for obvious
reasons.

greg k-h
