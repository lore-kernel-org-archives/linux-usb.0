Return-Path: <SRS0=gWik=DP=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3CB9C4363A
	for <linux-usb@archiver.kernel.org>; Thu,  8 Oct 2020 15:29:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7FC2E21927
	for <linux-usb@archiver.kernel.org>; Thu,  8 Oct 2020 15:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602170985;
	bh=aGMJitN1gVlJ1O25AciwAxco2naFSdSV4byKCma50EA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=IW78X5APdHyDfDWug1lTZHeBaEJe5NLvJG28dpoxXsIo9/LiFloA4XHkYwbelTA5V
	 oqSZzVPG0OfVO6aB6QykuWQpg+MIGbXvK2U0jDq39DaSrdovfu6x11sE8ve0x+kpaR
	 ttuRZMR5CYfVxkq51/hwxT9nmt54oGOL9Aug7XNs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730985AbgJHP3o (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 8 Oct 2020 11:29:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:57780 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731063AbgJHP3l (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 8 Oct 2020 11:29:41 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1175921924;
        Thu,  8 Oct 2020 15:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602170980;
        bh=aGMJitN1gVlJ1O25AciwAxco2naFSdSV4byKCma50EA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BSp3x6iGYOLzK3xbEK20mqojW/pteMLdGhc3kWywq9maN3ZGgOTc+K8ZyJMluiRlV
         tAasayBsdHkiGVTSWehWA6+5hQWYlILw/3rqX8YSyM0rO9fuDeSVES6veZkJxtBTaa
         t6/E5EmHNUu36FLNpZ3hHttN/s9dmLjxbwbvVpSU=
Date:   Thu, 8 Oct 2020 17:30:13 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB-serial updates for 5.10-rc1
Message-ID: <20201008153013.GA541917@kroah.com>
References: <20201008143924.GA26847@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201008143924.GA26847@localhost>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Oct 08, 2020 at 04:39:24PM +0200, Johan Hovold wrote:
> Hi Greg,
> 
> Here are the USB serial updates for 5.10.
> 
> Note that I fixed up a Link tag in the last commit while preparing the series,
> hence the late commit timestamp.
> 
> Johan
> 
> 
> The following changes since commit ba4f184e126b751d1bffad5897f263108befc780:
> 
>   Linux 5.9-rc6 (2020-09-20 16:33:55 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-5.10-rc1

Pulled and pushed out, thanks.

greg k-h
