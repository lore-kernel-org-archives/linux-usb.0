Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC1F9C433E0
	for <linux-usb@archiver.kernel.org>; Wed, 23 Dec 2020 14:18:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9105E23370
	for <linux-usb@archiver.kernel.org>; Wed, 23 Dec 2020 14:18:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727185AbgLWOSW (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 23 Dec 2020 09:18:22 -0500
Received: from mail.kernel.org ([198.145.29.99]:58312 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726633AbgLWOSV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 23 Dec 2020 09:18:21 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 906FD2313C;
        Wed, 23 Dec 2020 14:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1608733061;
        bh=N8Nl46NsbFNfkNbprzDnUVcJfYGIxsfYPHohz8tFl3I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tBOlK79aSlzu+1hs0ytpk+0zy7EYeoLZm4IyVamL2+/uEkLPKO6PGVtCPSc4aIjGE
         HCaQeoEb3bRM9shM1xOEWfwAzyUHrbL23DwcWFMYJzUQPL3ZhCLBfczyNYOXpFC+0i
         6oy3q15vtP/HDR+STSvZ79cSoozgJmPWn97Zqt5w=
Date:   Wed, 23 Dec 2020 15:18:52 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Zheng Yongjun <zhengyongjun3@huawei.com>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] usb: host: use DEFINE_MUTEX (and mutex_init() had
 been too late)
Message-ID: <X+NRzByvPKV+Io5D@kroah.com>
References: <20201223141109.32290-1-zhengyongjun3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201223141109.32290-1-zhengyongjun3@huawei.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Dec 23, 2020 at 10:11:09PM +0800, Zheng Yongjun wrote:
> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
> ---
>  drivers/usb/host/u132-hcd.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Again, dropped, due to lack of changelog text :(
