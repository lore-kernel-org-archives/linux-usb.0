Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ABE8C433E0
	for <linux-usb@archiver.kernel.org>; Wed, 23 Dec 2020 14:17:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 69FC22332A
	for <linux-usb@archiver.kernel.org>; Wed, 23 Dec 2020 14:17:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727693AbgLWORY (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 23 Dec 2020 09:17:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:57698 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725957AbgLWORY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 23 Dec 2020 09:17:24 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 141A523359;
        Wed, 23 Dec 2020 14:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1608733003;
        bh=owrEor3kFPpcWz42f6D2DYcC2O1V/1IBKOv+/plWEWM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OqWXsvPFbyYQtEz6uZ6Z07IrbDQy3tGS1R8rumkrySlpiJJ9eLqUx3Gz4FVkqEC5L
         ThoILQYFk3wAvuxrzfN/mFaqcfIOeQS6AgE97E254APAvlqMX6QbKPX0D1ODyT/K8+
         bqWkJvhM6hZaMapjKE4WyAoLZjyMRW0DLjkeDhdM=
Date:   Wed, 23 Dec 2020 15:17:54 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Zheng Yongjun <zhengyongjun3@huawei.com>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] usb: misc: use DEFINE_MUTEX (and mutex_init() had
 been too late)
Message-ID: <X+NRkqLJ1Bh/0HDe@kroah.com>
References: <20201223141044.32235-1-zhengyongjun3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201223141044.32235-1-zhengyongjun3@huawei.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Dec 23, 2020 at 10:10:44PM +0800, Zheng Yongjun wrote:
> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
> ---
>  drivers/usb/misc/ftdi-elan.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

I can not take patches without any changelog text, sorry.

And try including the driver name in the subject line please.

thanks,

greg k-h
