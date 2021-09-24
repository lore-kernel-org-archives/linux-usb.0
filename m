Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B120BC433EF
	for <linux-usb@archiver.kernel.org>; Fri, 24 Sep 2021 08:23:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 925F861090
	for <linux-usb@archiver.kernel.org>; Fri, 24 Sep 2021 08:23:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244653AbhIXIZP (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 24 Sep 2021 04:25:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:54332 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244634AbhIXIZO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 24 Sep 2021 04:25:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 89DC1610CF;
        Fri, 24 Sep 2021 08:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1632471822;
        bh=CqWfCLXqAh8OBQdF1s20iUKoZJaFbMiKUPReWENqmdc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=xTdLBMLrI3aitTCXFJgm8hembxD/PyW2fZFKxHep/GATPEbXyTqpKXA+VwtHD4lAt
         6Qafuo69N5R2PU40fFPvN9mxH10UYlFWF1VVh0Pci2VooORdA7fkIA720kPH5fDLyX
         ZmEPr8PgKyTHyNAQn6/0t8LJTSdIlz0KXmcswU1E=
Date:   Fri, 24 Sep 2021 10:23:29 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] USB-serial fixes for 5.15-rc3
Message-ID: <YU2LAWq9iip057u1@kroah.com>
References: <YU2Hk/bryF85iq5G@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YU2Hk/bryF85iq5G@hovoldconsulting.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Sep 24, 2021 at 10:08:51AM +0200, Johan Hovold wrote:
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-5.15-rc3

Pulled and pushed out, thanks.

greg k-h
