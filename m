Return-Path: <SRS0=DzqA=WW=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D329C3A59E
	for <linux-usb@archiver.kernel.org>; Mon, 26 Aug 2019 04:54:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 640132190F
	for <linux-usb@archiver.kernel.org>; Mon, 26 Aug 2019 04:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1566795247;
	bh=i+lQPAxEx7aM9E1qBjYJFL5Afb+6T2ja/tPbH3iwE4o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=fz/lG5hLQnLDoeR0uFJX6WBE2/a4hkPIPvjqQpNmgFIgUw0Ozwg6I8ZtdKuoJOwhn
	 eQZwm2si+3BCmTsI19bwtCexh4UTVvRaehaRQaJSr6u5YvFRAKQt4P4BAUf07YxeWl
	 c1ieVkaADmUgmytPeamUT26L59dY6ep/G3Dm5NM0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728052AbfHZEyD (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 26 Aug 2019 00:54:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:35060 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726606AbfHZEyC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 26 Aug 2019 00:54:02 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 650632070B;
        Mon, 26 Aug 2019 04:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566795241;
        bh=i+lQPAxEx7aM9E1qBjYJFL5Afb+6T2ja/tPbH3iwE4o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=S9KIOpNF3jFSJ/hQCM40RM+usrZKrU2ImKDe9zWj4BNvcW09CQYDnMR6Ti6KPtVYL
         OY8dHDGUFYdmKL/kEezB3cNwvo1gdAyRyE0VAwlsL5OPSr5y7lHo9UF4jF2UyzPWzw
         D3M2NXZQOo7fjCwDFTVOPdX+TVy/zdg9ZXTJ2o4s=
Date:   Mon, 26 Aug 2019 06:53:59 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc:     stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
        usb-storage@lists.one-eyed-alien.net, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] USB: storage: ums-realtek: Enable auto-delink
 optionally
Message-ID: <20190826045359.GD1678@kroah.com>
References: <20190826044630.21949-1-kai.heng.feng@canonical.com>
 <20190826044630.21949-2-kai.heng.feng@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190826044630.21949-2-kai.heng.feng@canonical.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 26, 2019 at 12:46:30PM +0800, Kai-Heng Feng wrote:
> Auto-delink requires writing special registers to ums-realtek device.
> Unconditionally enable auto-delink may break newer devices.
> 
> So only enable auto-delink by default for the original three IDs,
> 0x0138, 0x0158 and 0x0159.
> 
> Realtek is working on a patch to properly support auto-delink for other
> IDs.
> 
> BugLink: https://bugs.launchpad.net/bugs/1838886
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> ---
>  drivers/usb/storage/realtek_cr.c | 24 +++++++++++++++++++-----
>  1 file changed, 19 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/storage/realtek_cr.c b/drivers/usb/storage/realtek_cr.c
> index 4d86cfcc0b40..376f41d0cbc3 100644
> --- a/drivers/usb/storage/realtek_cr.c
> +++ b/drivers/usb/storage/realtek_cr.c
> @@ -36,6 +36,10 @@ MODULE_DESCRIPTION("Driver for Realtek USB Card Reader");
>  MODULE_AUTHOR("wwang <wei_wang@realsil.com.cn>");
>  MODULE_LICENSE("GPL");
>  
> +static int auto_delink_enable = -1;
> +module_param(auto_delink_enable, int, S_IRUGO | S_IWUSR);
> +MODULE_PARM_DESC(auto_delink_enable, "enable auto delink (-1=auto [default], 0=disable, 1=enable)");
> +
>  static int auto_delink_mode = 1;
>  module_param(auto_delink_mode, int, S_IRUGO | S_IWUSR);
>  MODULE_PARM_DESC(auto_delink_mode, "auto delink mode (0=firmware, 1=software [default])");
> @@ -996,12 +1000,22 @@ static int init_realtek_cr(struct us_data *us)
>  			goto INIT_FAIL;
>  	}

This patch doesn't apply as I can't take your first patch.  Can you redo
it and resend?

thanks,

greg k-h
