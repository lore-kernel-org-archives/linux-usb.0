Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B716C433DB
	for <linux-usb@archiver.kernel.org>; Thu, 11 Mar 2021 09:02:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1766964FB2
	for <linux-usb@archiver.kernel.org>; Thu, 11 Mar 2021 09:02:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231610AbhCKJCf (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 11 Mar 2021 04:02:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:44266 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231394AbhCKJCf (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 11 Mar 2021 04:02:35 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3D52B64FB2;
        Thu, 11 Mar 2021 09:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1615453354;
        bh=KnN3sEPQ7NfviicUgfQ3SvAJFBfw+boLGhtV9h+IDfg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sVeXm3ZU/oUbDZIXoFyx1NJrv5IBUQH2RtqilTUGgWlG8eD/HWTifUCJvxZ7iDo0B
         UFNAY1zWylMZwqYlrmGVQbcYUAAhuOMe+FCdCUCqp5RPWlESgZlXgz9EkIUj5/aQ66
         de5x5bof1GaaIWPl4jJe039lg0345PPUbuqnW4eE=
Date:   Thu, 11 Mar 2021 10:02:32 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB-serial fixes for 5.12-rc3
Message-ID: <YEncqO4Q9fcJO0Rt@kroah.com>
References: <YEnXYe6HUrK+mysK@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YEnXYe6HUrK+mysK@hovoldconsulting.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Mar 11, 2021 at 09:40:01AM +0100, Johan Hovold wrote:
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-5.12-rc3

Pulled and pushed out, thanks.

greg k-h
