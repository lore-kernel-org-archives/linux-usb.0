Return-Path: <SRS0=eF67=UI=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,T_DKIMWL_WL_HIGH,USER_AGENT_MUTT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DF23C28EBD
	for <linux-usb@archiver.kernel.org>; Sun,  9 Jun 2019 12:03:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 26E79212F5
	for <linux-usb@archiver.kernel.org>; Sun,  9 Jun 2019 12:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1560081802;
	bh=zeDkO96rPBP8qO+bcJpUEjj0JKflnmbDb5tZynmFvXE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=tsI/mHZ1AesPUsjX5oTUVCYxFCKnYIaUlX2mb1lBdoT/sT1L5red8yxmPCt+ZRg+B
	 ypdGg7A18HhxnIlws4rmd9n5MDa3uPbY96tnz2an72qMkRDUCaaozGN2WPrcZezmnM
	 fJu6LEuKD5R/TgWNlDMaA4U2+tco4/9AsT0hHsVw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728379AbfFIMDR (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 9 Jun 2019 08:03:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:42638 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728283AbfFIMDR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 9 Jun 2019 08:03:17 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 37B1B212F5;
        Sun,  9 Jun 2019 12:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560081796;
        bh=zeDkO96rPBP8qO+bcJpUEjj0JKflnmbDb5tZynmFvXE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=s7ZhiDz1f7R4KuzYCnimd+j4OcPsmVN1e20YWs5rcaPciWT5RtY9eodxstxa9c6EZ
         UNCVdAu1n7dj4EeKA9p5crWdfZdNvAW3OdtkN9DuxXKPMGMLF19b8Xnz9f5y8jJ9Pq
         m8MSzz0TqT0agMHvfTL/7N9PEC/x3H2Q1nSKGCsM=
Date:   Sun, 9 Jun 2019 14:03:14 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Saurav-Girepunje <saurav.girepunje@gmail.com>
Cc:     b-liu@ti.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, saurav.girepunje@hotmail.com
Subject: Re: [PATCH] Updated the function description for musb_stage0_irq
 Signed-off-by: Saurav-Girepunje <saurav.girepunje@gmail.com>
Message-ID: <20190609120314.GB19925@kroah.com>
References: <20190609112356.GA19055@saurav>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190609112356.GA19055@saurav>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Jun 09, 2019 at 04:54:00PM +0530, Saurav-Girepunje wrote:
> ---
>  drivers/usb/musb/musb_core.c | 1 -
>  1 file changed, 1 deletion(-)

Please stop, wait a few days, then fix your commit to not have
everything mushed into the subject: line, resend the patch to YOURSELF
to verify that it all works properly (and not as an attachment like you
did here), and then, if you are sure it is all good and working
properly, then send it out to the mailing list.

Note, please do cleanup stuff like this in the drivers/staging/
directory first, that area is much more forgiving of basic mistakes like
this than the rest of the kernel tree.

good luck!

greg k-h
