Return-Path: <SRS0=L2GO=5E=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68FE8C4332E
	for <linux-usb@archiver.kernel.org>; Thu, 19 Mar 2020 15:03:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 406A020B1F
	for <linux-usb@archiver.kernel.org>; Thu, 19 Mar 2020 15:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1584630235;
	bh=59wwZxXQoVhEHDDcwLFmo0PsjFirqEXEFdOAklDRWGg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=CJX4TOiETVC4nZaNIj2mCrleLmCVNlz1/Bq5suZhDgkECjDk1jSTOeKQpz+oRcO2p
	 cgqYswiLtrgQL44/syAuSo+JTFG/M0SaegZxuGJx8vio+e7TMiLKgyIPkzTxvhA3nU
	 K6dtdShmOZ+Nt0oqOLMbnkF25t7DI9A63sD01I4c=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728551AbgCSPDg (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 19 Mar 2020 11:03:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:41778 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728548AbgCSPDe (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 19 Mar 2020 11:03:34 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1FF7D2072D;
        Thu, 19 Mar 2020 15:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584630213;
        bh=59wwZxXQoVhEHDDcwLFmo0PsjFirqEXEFdOAklDRWGg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XMq1I0JV55c6lkD+dcoY+yuxT0/JrIeqcmCHaXKAzsUIfb5WyXgz8caHMqSIwTkaG
         WU4htwGRAISUz96U+JKbVOnhknEZmNlmoQlJ6ZyHpKvrr04cczWqFqJT3Hl8OoIZrJ
         QLzmcTCwuPsXQP+umbQokHFO9wptHFOd6Am/5AOE=
Date:   Thu, 19 Mar 2020 16:02:51 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [GIT PULL v2] usb: tegra: Changes for v5.7-rc1
Message-ID: <20200319150251.GA126495@kroah.com>
References: <20200313170730.2924259-1-thierry.reding@gmail.com>
 <20200319143411.3266037-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200319143411.3266037-1-thierry.reding@gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Mar 19, 2020 at 03:34:11PM +0100, Thierry Reding wrote:
> Hi Greg, Felipe,
> 
> The following changes since commit ca9e742b5c27c230b0bf003aecba2433a60ba837:
> 
>   USB: c67x00: Use the correct style for SPDX License Identifier (2020-03-17 20:03:28 +0100)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.7-usb-v2

That worked, thanks!

now pulled and pushed out.

greg k-h
