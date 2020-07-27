Return-Path: <SRS0=SlCS=BG=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13B9AC433E1
	for <linux-usb@archiver.kernel.org>; Mon, 27 Jul 2020 11:17:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E51322074F
	for <linux-usb@archiver.kernel.org>; Mon, 27 Jul 2020 11:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1595848636;
	bh=WKNdZwiHmI2go1vAvCKdmLTiEL+D/KkYKDaKE/YLv/4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=OKKsEbMXNKwimlR1ZbVc032eYj7xj397OdhPyH5VMB0krKVsRpGsEDEOO14WcS6GD
	 zzarMqcgrWylXaejs110zcDSR8d8VipyzSs0xMwmqPDRU77BfTqRwtqnSGqC55bToO
	 cbbBvzdYUfs9w94mDF0rA52fnSEYVmBphd7pKRYc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727826AbgG0LRQ (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 27 Jul 2020 07:17:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:39858 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726269AbgG0LRP (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 27 Jul 2020 07:17:15 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 268852075A;
        Mon, 27 Jul 2020 11:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595848635;
        bh=WKNdZwiHmI2go1vAvCKdmLTiEL+D/KkYKDaKE/YLv/4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DhYS/ZoE/PmKpwYCXPnGpT8RBzFlEeaaOUGY/M2DgV/oAU/WDiQNsJPGB0UHvbRWs
         MoirvU7MtG6EVXfPRTFjj3/tBZIeyw8uiWk4v1COl1DbCFvME0J28pHgsB2LYFoge8
         Qzi67fXnKUgag33SxbfwwM+sPA4cpOLeiTkLag7w=
Date:   Mon, 27 Jul 2020 13:16:52 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB changes for v5.9 merge window
Message-ID: <20200727111652.GA3404483@kroah.com>
References: <87d04hnrbx.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87d04hnrbx.fsf@kernel.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jul 27, 2020 at 02:13:38PM +0300, Felipe Balbi wrote:
> 
> Hi Greg,
> 
> here's my pull request for v5.9. I have rebase on your usb-next one week
> ago to avoid merge conflicts. Let me know if you want anything to be
> changed.
> 
> cheers
> 
> The following changes since commit c17536d0abde2fd24afca542e3bb73b45a299633:
> 
>   usb: usbfs: stop using compat_alloc_user_space (2020-07-22 13:13:22 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git tags/usb-for-v5.9

All looks good, thanks, pulled and pushed out.

greg k-h
