Return-Path: <SRS0=JN91=6U=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69FE7C47256
	for <linux-usb@archiver.kernel.org>; Wed,  6 May 2020 15:27:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 461A320A8B
	for <linux-usb@archiver.kernel.org>; Wed,  6 May 2020 15:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1588778875;
	bh=3RH/IWukQD5pZJ2uuochYreE4dgKjXTXYfNxL9UkRDo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=II9DdfGQ1t22HtZjZW3JYzKveg4Z2DjHYIOmQlL/q0UNHr9PVCfyblUk/5jBZvREp
	 jq4/XRkn9IXOukDSj+XbNu55/znGFReffQQgydUXbDkoQcqybl1onlk/KMbp/viKiW
	 5rNKJfjaxnWQhLBT0aLcZ8M9n9rNGOZm4Jcgyh+I=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730341AbgEFP10 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 6 May 2020 11:27:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:51280 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729669AbgEFP1Z (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 6 May 2020 11:27:25 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E715421744;
        Wed,  6 May 2020 15:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588778844;
        bh=3RH/IWukQD5pZJ2uuochYreE4dgKjXTXYfNxL9UkRDo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=n34YSYDsF3r/JbJFK2G4WdCLQ2bNMm9TEyw/0ELL90Dq8CcKFcH6jGx1JS0NVMKYH
         SGUnAT19ybTJ9hrfsYXJqKyPl4YHLf6fLZMKHHnqrZubJGKuZ3IB4P/ufD2eEKnJnh
         blMX9ipXDYSaDqOiJlHTXaQgAUK4wAP6gmcmx/bo=
Date:   Wed, 6 May 2020 17:27:14 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB-serial fixes for 5.7-rc5
Message-ID: <20200506152714.GA3460879@kroah.com>
References: <20200506144540.GA7432@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200506144540.GA7432@localhost>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 06, 2020 at 04:45:40PM +0200, Johan Hovold wrote:
> The following changes since commit ae83d0b416db002fe95601e7f97f64b59514d936:
> 
>   Linux 5.7-rc2 (2020-04-19 14:35:30 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-5.7-rc5

Pulled and pushed out, thanks.

greg k-h
