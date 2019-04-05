Return-Path: <SRS0=hNA8=SH=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,T_DKIMWL_WL_HIGH,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03B2FC4360F
	for <linux-usb@archiver.kernel.org>; Fri,  5 Apr 2019 09:20:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C4B3321850
	for <linux-usb@archiver.kernel.org>; Fri,  5 Apr 2019 09:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1554456002;
	bh=qZJvQSj17Jj/XfcSmKiGbQvfbsDe19CWCDqQW+5QoAw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=mt2nz53iRPDWbmNkG9zcBKRrEGrGmQ69T2HQL9+RZArMhMxmQ+SMu06F/vHbMVlMT
	 mDGPTSvMmrJX6YotGcd0xjDn1QZ5BKDmgJr8kk11ftC5KjHHRMp7L13ErMifosvrWm
	 XD+UNQ2cZ4douODWvebLnrdfGRQkHy2BSL0j5AWY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730224AbfDEJUC (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 5 Apr 2019 05:20:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:58624 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729792AbfDEJUC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 5 Apr 2019 05:20:02 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F0D23217D7;
        Fri,  5 Apr 2019 09:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1554456001;
        bh=qZJvQSj17Jj/XfcSmKiGbQvfbsDe19CWCDqQW+5QoAw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ov4M5qP0ryj0qE6AWVOC0Kc62Lv8YbcxemTcyVpVzrUlzMWsjSNX1b73otBF3CC4Q
         7KFkVRrVFppQ5GVTeRxLTo9dOM8NQ+bU4C6Mnl0F8Pmyu5e9u3gDN7GPMdfqKfpega
         4YsNg/vr3DTPKlgQMEhZNWrvzmjflCXdIIurU7gc=
Date:   Fri, 5 Apr 2019 11:19:58 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     John Travell <john@travell.uk.net>
Cc:     linux-usb@vger.kernel.org
Subject: Re: USB keyboard and mouse non responsive at login
Message-ID: <20190405091958.GA16788@kroah.com>
References: <a8c6d4e9-29c5-73cc-ca9d-8c973a5876ac@travell.uk.net>
 <20190405044904.GA553@kroah.com>
 <0b9b2877-dd50-a9bc-afa1-17a081ded46e@travell.uk.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0b9b2877-dd50-a9bc-afa1-17a081ded46e@travell.uk.net>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Apr 05, 2019 at 09:38:58AM +0100, John Travell wrote:
> Greg,
> While I fully appreciate that the origins of 3.13 are steeped in history,
> the three versions mentioned were released this year.
> All came from the ubuntu repositories, not via any paid support.

Sorry, you are going to have to contact Ubuntu for support for those old
and ancient kernels as we have no idea what is in them, what changed in
them, or why they even keep updating them :)

We will be glad to help you out here if you use the latest kernel.org
releases, as we know what is in them.

best of luck,

greg k-h
